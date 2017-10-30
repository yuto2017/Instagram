//
//  CommentEditViewController.swift
//  Instagram
//
//  Created by yonghu on 2017/10/24.
//  Copyright © 2017年 yuto.mori. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CommentEditViewController: UIViewController {

    @IBOutlet weak var commentField: UITextField!
    
    var postData:PostData!
    
    @IBAction func onClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func commentPostButton(_ sender: Any) {
        print("DEBUG_PRINT: commentPostButtonイベントが発生しました。")
        let name = Auth.auth().currentUser?.displayName
        
        if let commentText = commentField.text {
            postData.comments.append(["name": name, "comment": commentText])
        }
        
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        
        postRef.updateChildValues(["comments": postData.comments])
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let commentReadViewController:CommentReadViewController = segue.destination as! CommentReadViewController
        commentReadViewController.postData = postData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
