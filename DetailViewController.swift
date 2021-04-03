//
//  DetailViewController.swift
//  Challenge1
//
//  Created by Marko Zivanovic on 13.3.21..
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var pictureView: UIImageView!
    
    var selectedPicture: String?
    
    var selectedPictureNumber = 0
    var totalPicturesNumber = 0 

    override func viewDidLoad() {
        super.viewDidLoad()
 
        title = "Picture \(selectedPictureNumber) of \(totalPicturesNumber)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedPicture {
            pictureView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false 
    }
    
   @objc func shareTapped() {
    guard let image = pictureView.image?.jpegData(compressionQuality: 0.8) else {
        print ("No image found")
        return
    }
        let vc = UIActivityViewController(activityItems: [image, selectedPicture!], applicationActivities: [])
    //TASK 1. Try adding the image name to the list of items that are shared. The activityItems parameter is an array, so you can add strings and other things freely. Note: Facebook won’t let you share text, but most other share options will. 
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
