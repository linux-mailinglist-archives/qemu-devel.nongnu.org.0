Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E225A4865EA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:18:39 +0100 (CET)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TbD-0005Zh-20
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:18:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sin-0003fe-UW
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:22:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sil-0001tI-NL
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hOPjiFqJP+CxAguLqjRkfscaiAq3ABKE+YBS09bWzw4=;
 b=RkT4txowM1l6OQ0tVmQUpmsrOfP8uOrPYQua4jGgKlKlhcDEzsoXFpu8wbGdkectlXbAW3
 NVy8EQxEtwPZ0VKQVkY4Lc5vWjCd8ZUd2Dm/2C6sF3rE/JDQealVVXq7aJY5At+K8Jx/bQ
 AKpOb9cfBIsrHcxQAq79q0nXYpd3w80=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-PoTpd1EjNcSUW21D2L2JBA-1; Thu, 06 Jan 2022 08:22:22 -0500
X-MC-Unique: PoTpd1EjNcSUW21D2L2JBA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b8-20020a056402350800b003f8f42a883dso1913903edd.16
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hOPjiFqJP+CxAguLqjRkfscaiAq3ABKE+YBS09bWzw4=;
 b=sYl9T3K1Z5YN8k9MOLvnthODKA4ASR+e05JrktSmgnrCUEBWK6VI/2CZMqYb0iWRHT
 Bx4HEOYnUriMGq4+51xi6Cymr+m+uL3CkNv0ndJqkDolq+Swy63x5QXrWCgf+nW26+0R
 sjuLgMRXoiCOMeHErQitqRlV0/bes4wlnL3UmNiF4nKf6vewPpPsSdYzkQQJwAkIPrVe
 JHVxF8HOWMKrfcTpM8nJlO3ttiCY625s3PzEPCxAIifJqgJdig00shVQYZ2640roSw+b
 gAIALB8Fx0K6VQaPwSS8c59/s0Or5rXS1u9Yn2HgAWt/F97UXm62Guw6Q2OvXv8LBHQ5
 sPDg==
X-Gm-Message-State: AOAM532Crcw/7MXOoPyiKd64Qo5/tHIvJ7awlYUeqU9IQ1zsCIsDPRJ7
 5XsilvQnYIcaLlX9R32O6GUY1TTF9qxHpniBb2e8yL5mYeSw3eqxKXxvT5aZh/BPjFi7NicdvQD
 D1sRXwzUIwj+5rPsiEyViQJ2uKk1KLJru9OXnEBngoNggpM9V9PEyvdIwnzoL
X-Received: by 2002:aa7:ccc7:: with SMTP id y7mr3316375edt.96.1641475336506;
 Thu, 06 Jan 2022 05:22:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWW+RVxbPRxGrMX+rvuZ7DCeIVTgB8S9+6/PivceEJEyAva3BSmCCwl28iieo+aWJRYCAetg==
X-Received: by 2002:aa7:ccc7:: with SMTP id y7mr3316354edt.96.1641475336304;
 Thu, 06 Jan 2022 05:22:16 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id w7sm713273ede.66.2022.01.06.05.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:22:15 -0800 (PST)
Date: Thu, 6 Jan 2022 08:22:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/52] virtio-pci: decouple notifier from interrupt process
Message-ID: <20220106131534.423671-5-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

To reuse the notifier process in configure interrupt.
Use the virtio_pci_get_notifier function to get the notifier.
the INPUT of this function is the IDX, the OUTPUT is notifier and
the vector

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-3-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 88 +++++++++++++++++++++++++++---------------
 1 file changed, 57 insertions(+), 31 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 750aa47ec1..4bdb6e5694 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -704,29 +704,41 @@ static void kvm_virtio_pci_vq_vector_release(VirtIOPCIProxy *proxy,
 }
 
 static int kvm_virtio_pci_irqfd_use(VirtIOPCIProxy *proxy,
-                                 unsigned int queue_no,
+                                 EventNotifier *n,
                                  unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
-    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
-    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
     return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irqfd->virq);
 }
 
 static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
-                                      unsigned int queue_no,
+                                      EventNotifier *n ,
                                       unsigned int vector)
 {
-    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
-    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
     int ret;
 
     ret = kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
     assert(ret == 0);
 }
+static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
+                                      EventNotifier **n, unsigned int *vector)
+{
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    VirtQueue *vq;
+
+    if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
+        return -1;
+    } else {
+        if (!virtio_queue_get_num(vdev, queue_no)) {
+            return -1;
+        }
+        *vector = virtio_queue_vector(vdev, queue_no);
+        vq = virtio_get_queue(vdev, queue_no);
+        *n = virtio_queue_get_guest_notifier(vq);
+    }
+    return 0;
+}
 
 static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
 {
@@ -735,12 +747,15 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     unsigned int vector;
     int ret, queue_no;
-
+    EventNotifier *n;
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
-        vector = virtio_queue_vector(vdev, queue_no);
+        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+        if (ret < 0) {
+            break;
+        }
         if (vector >= msix_nr_vectors_allocated(dev)) {
             continue;
         }
@@ -752,7 +767,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, delay until unmasked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
+            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
             if (ret < 0) {
                 kvm_virtio_pci_vq_vector_release(proxy, vector);
                 goto undo;
@@ -768,7 +783,11 @@ undo:
             continue;
         }
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
+            ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+            if (ret < 0) {
+                break;
+            }
+            kvm_virtio_pci_irqfd_release(proxy, n, vector);
         }
         kvm_virtio_pci_vq_vector_release(proxy, vector);
     }
@@ -782,12 +801,16 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
     unsigned int vector;
     int queue_no;
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-
+    EventNotifier *n;
+    int ret ;
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
-        vector = virtio_queue_vector(vdev, queue_no);
+        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+        if (ret < 0) {
+            break;
+        }
         if (vector >= msix_nr_vectors_allocated(dev)) {
             continue;
         }
@@ -795,21 +818,20 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, it was cleaned when masked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
+            kvm_virtio_pci_irqfd_release(proxy, n, vector);
         }
         kvm_virtio_pci_vq_vector_release(proxy, vector);
     }
 }
 
-static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
+static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
                                        unsigned int queue_no,
                                        unsigned int vector,
-                                       MSIMessage msg)
+                                       MSIMessage msg,
+                                       EventNotifier *n)
 {
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
-    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
     VirtIOIRQFD *irqfd;
     int ret = 0;
 
@@ -836,14 +858,15 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
             event_notifier_set(n);
         }
     } else {
-        ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
+        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
     }
     return ret;
 }
 
-static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
+static void virtio_pci_one_vector_mask(VirtIOPCIProxy *proxy,
                                              unsigned int queue_no,
-                                             unsigned int vector)
+                                             unsigned int vector,
+                                             EventNotifier *n)
 {
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
@@ -854,7 +877,7 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
     if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
         k->guest_notifier_mask(vdev, queue_no, true);
     } else {
-        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
     }
 }
 
@@ -864,6 +887,7 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
     VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
+    EventNotifier *n;
     int ret, index, unmasked = 0;
 
     while (vq) {
@@ -872,7 +896,8 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
             break;
         }
         if (index < proxy->nvqs_with_notifiers) {
-            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg);
+            n = virtio_queue_get_guest_notifier(vq);
+            ret = virtio_pci_one_vector_unmask(proxy, index, vector, msg, n);
             if (ret < 0) {
                 goto undo;
             }
@@ -888,7 +913,8 @@ undo:
     while (vq && unmasked >= 0) {
         index = virtio_get_queue_index(vq);
         if (index < proxy->nvqs_with_notifiers) {
-            virtio_pci_vq_vector_mask(proxy, index, vector);
+            n = virtio_queue_get_guest_notifier(vq);
+            virtio_pci_one_vector_mask(proxy, index, vector, n);
             --unmasked;
         }
         vq = virtio_vector_next_queue(vq);
@@ -901,15 +927,17 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
     VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
+    EventNotifier *n;
     int index;
 
     while (vq) {
         index = virtio_get_queue_index(vq);
+        n = virtio_queue_get_guest_notifier(vq);
         if (!virtio_queue_get_num(vdev, index)) {
             break;
         }
         if (index < proxy->nvqs_with_notifiers) {
-            virtio_pci_vq_vector_mask(proxy, index, vector);
+            virtio_pci_one_vector_mask(proxy, index, vector, n);
         }
         vq = virtio_vector_next_queue(vq);
     }
@@ -925,19 +953,17 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
     int queue_no;
     unsigned int vector;
     EventNotifier *notifier;
-    VirtQueue *vq;
+    int ret;
 
     for (queue_no = 0; queue_no < proxy->nvqs_with_notifiers; queue_no++) {
-        if (!virtio_queue_get_num(vdev, queue_no)) {
+        ret = virtio_pci_get_notifier(proxy, queue_no, &notifier, &vector);
+        if (ret < 0) {
             break;
         }
-        vector = virtio_queue_vector(vdev, queue_no);
         if (vector < vector_start || vector >= vector_end ||
             !msix_is_masked(dev, vector)) {
             continue;
         }
-        vq = virtio_get_queue(vdev, queue_no);
-        notifier = virtio_queue_get_guest_notifier(vq);
         if (k->guest_notifier_pending) {
             if (k->guest_notifier_pending(vdev, queue_no)) {
                 msix_set_pending(dev, vector);
-- 
MST


