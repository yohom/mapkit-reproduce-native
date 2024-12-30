//
//  ViewController.swift
//  mapkit-reproduce
//
//  Created by Yohom Bao on 2024/12/30.
//

import UIKit
import MapKit

class ViewController: UIViewController {
  private var mapView: MKMapView!
  private var centerButton: UIButton!

  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white

      // 初始化 MapKit 地图
      mapView = MKMapView(frame: view.bounds)
      mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      view.addSubview(mapView)

      // 初始化按钮
      centerButton = UIButton(type: .system)
      centerButton.setTitle("Center Map", for: .normal)
      centerButton.setTitleColor(.white, for: .normal)
      centerButton.backgroundColor = .systemBlue
      centerButton.layer.cornerRadius = 8
      centerButton.clipsToBounds = true
      centerButton.addTarget(self, action: #selector(centerMap), for: .touchUpInside)
      view.addSubview(centerButton)

      // 设置按钮位置和大小
      centerButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          centerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
          centerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          centerButton.widthAnchor.constraint(equalToConstant: 150),
          centerButton.heightAnchor.constraint(equalToConstant: 50)
      ])
  }

  @objc private func centerMap() {
      // 设置地图中心为苹果总部
      let coordinate = CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090)
      let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
      mapView.setRegion(region, animated: true)
  }
}

