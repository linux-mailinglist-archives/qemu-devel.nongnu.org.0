Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD5648A19B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:14:08 +0100 (CET)
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n71zT-0000Jg-EA
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71rf-00085l-0x
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:06:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71rQ-0004an-DC
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641848715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TsMzcm1in4jhpwu/SzoIePxsdjFO4DBOR6IlDk/nH1o=;
 b=g/Z/otNJoVRHh9jCyBe2ZnPJuBFz2IRYmAlM5WP7gtZbN8LxRLbgk43Pl8qnjIcqIV9sze
 JYSz3NCbJHj00+jwx+pnRBmS3/wbnmY7phe0q3+Ux9byYp+Pw+c3dfntWo+TFzSeBOQlOH
 B+LBzFWWJJRJOTOa8Yl7dgR2DruKlD8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-n7p2HwQCO3uKOwIR1kLI1Q-1; Mon, 10 Jan 2022 16:05:14 -0500
X-MC-Unique: n7p2HwQCO3uKOwIR1kLI1Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 j18-20020a05600c1c1200b003335872db8dso2651307wms.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TsMzcm1in4jhpwu/SzoIePxsdjFO4DBOR6IlDk/nH1o=;
 b=c2OXIZCtveJiSj0kJt5Qfklc7tGznwoTiHIp2aMtp1O48regQiamQkbL92zOR2o4cv
 OdqSkEtOUuYnvd5S0iBr+icpUY6jgcgwyXeCl7z4sjwklbP9YkMpaigHRX25yqa9iKOQ
 I96+e9KxAgOUbX9zcIvbf1svQxxQ+NEMUlUUeuK+/Ho5QCGqPs+uSdYVp90l7JNvDoUE
 jqDJ7CdwhvAtpALLXmTbEI+LWWy1FLbZoh49mlO5MhBmdM97kMP5o2TFFPsJG0uqdQZw
 aDbPmdb3FTeW3RO92O2QLfntSqdeb90XdGFwbtIXrVa1F8yeFs5YrfsdE70t9gcvq9zj
 n29w==
X-Gm-Message-State: AOAM530128j3TgdYLmRc9f1CJiUNCmRoN/+5qQ/llyPi/GWGBaNA9OtC
 N1goFqc9mHn5fDXVdKbqmsVqA+p2WPDjKsw4cixRJI6KDVT1YbhL0lRd4wGwUHybheSQrL79qMM
 JoY8Wy8duljPpQKbYWYtt/Box3+7T34BPJ1n0lXvt65cDJHkn+OkvjtomZJhA
X-Received: by 2002:a05:600c:4f8d:: with SMTP id
 n13mr23328416wmq.43.1641848712611; 
 Mon, 10 Jan 2022 13:05:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynD6kBZXr2MfvfOsROz4ucjFd/ttseodeVIMlP0v8bYd4vTLbzcQxpeoi4HHkawx0Es4J9BA==
X-Received: by 2002:a05:600c:4f8d:: with SMTP id
 n13mr23328394wmq.43.1641848712293; 
 Mon, 10 Jan 2022 13:05:12 -0800 (PST)
Received: from redhat.com ([2.55.19.241])
 by smtp.gmail.com with ESMTPSA id l4sm6121218wru.74.2022.01.10.13.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:05:11 -0800 (PST)
Date: Mon, 10 Jan 2022 16:05:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/10] Revert "virtio-pci: decouple notifier from interrupt
 process"
Message-ID: <20220110210416.18779-10-mst@redhat.com>
References: <20220110210416.18779-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110210416.18779-1-mst@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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

This reverts commit e3480ef81f6fb61cc9c04e3b5be8b7e84484fc05.

Fixes: e3480ef81f ("virtio-pci: decouple notifier from interrupt process")
Cc: "Cindy Lu" <lulu@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 88 +++++++++++++++---------------------------
 1 file changed, 31 insertions(+), 57 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 4bdb6e5694..750aa47ec1 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -704,41 +704,29 @@ static void kvm_virtio_pci_vq_vector_release(VirtIOPCIProxy *proxy,
 }
 
 static int kvm_virtio_pci_irqfd_use(VirtIOPCIProxy *proxy,
-                                 EventNotifier *n,
+                                 unsigned int queue_no,
                                  unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
+    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
     return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irqfd->virq);
 }
 
 static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
-                                      EventNotifier *n ,
+                                      unsigned int queue_no,
                                       unsigned int vector)
 {
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
+    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
     int ret;
 
     ret = kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
     assert(ret == 0);
 }
-static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
-                                      EventNotifier **n, unsigned int *vector)
-{
-    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    VirtQueue *vq;
-
-    if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
-        return -1;
-    } else {
-        if (!virtio_queue_get_num(vdev, queue_no)) {
-            return -1;
-        }
-        *vector = virtio_queue_vector(vdev, queue_no);
-        vq = virtio_get_queue(vdev, queue_no);
-        *n = virtio_queue_get_guest_notifier(vq);
-    }
-    return 0;
-}
 
 static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
 {
@@ -747,15 +735,12 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     unsigned int vector;
     int ret, queue_no;
-    EventNotifier *n;
+
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
-        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-        if (ret < 0) {
-            break;
-        }
+        vector = virtio_queue_vector(vdev, queue_no);
         if (vector >= msix_nr_vectors_allocated(dev)) {
             continue;
         }
@@ -767,7 +752,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, delay until unmasked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
+            ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
             if (ret < 0) {
                 kvm_virtio_pci_vq_vector_release(proxy, vector);
                 goto undo;
@@ -783,11 +768,7 @@ undo:
             continue;
         }
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-            if (ret < 0) {
-                break;
-            }
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
+            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
         }
         kvm_virtio_pci_vq_vector_release(proxy, vector);
     }
@@ -801,16 +782,12 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
     unsigned int vector;
     int queue_no;
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    EventNotifier *n;
-    int ret ;
+
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
-        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-        if (ret < 0) {
-            break;
-        }
+        vector = virtio_queue_vector(vdev, queue_no);
         if (vector >= msix_nr_vectors_allocated(dev)) {
             continue;
         }
@@ -818,20 +795,21 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, it was cleaned when masked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
+            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
         }
         kvm_virtio_pci_vq_vector_release(proxy, vector);
     }
 }
 
-static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
+static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
                                        unsigned int queue_no,
                                        unsigned int vector,
-                                       MSIMessage msg,
-                                       EventNotifier *n)
+                                       MSIMessage msg)
 {
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
+    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
     VirtIOIRQFD *irqfd;
     int ret = 0;
 
@@ -858,15 +836,14 @@ static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
             event_notifier_set(n);
         }
     } else {
-        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
+        ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
     }
     return ret;
 }
 
-static void virtio_pci_one_vector_mask(VirtIOPCIProxy *proxy,
+static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
                                              unsigned int queue_no,
-                                             unsigned int vector,
-                                             EventNotifier *n)
+                                             unsigned int vector)
 {
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
@@ -877,7 +854,7 @@ static void virtio_pci_one_vector_mask(VirtIOPCIProxy *proxy,
     if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
         k->guest_notifier_mask(vdev, queue_no, true);
     } else {
-        kvm_virtio_pci_irqfd_release(proxy, n, vector);
+        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
     }
 }
 
@@ -887,7 +864,6 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
     VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
-    EventNotifier *n;
     int ret, index, unmasked = 0;
 
     while (vq) {
@@ -896,8 +872,7 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
             break;
         }
         if (index < proxy->nvqs_with_notifiers) {
-            n = virtio_queue_get_guest_notifier(vq);
-            ret = virtio_pci_one_vector_unmask(proxy, index, vector, msg, n);
+            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg);
             if (ret < 0) {
                 goto undo;
             }
@@ -913,8 +888,7 @@ undo:
     while (vq && unmasked >= 0) {
         index = virtio_get_queue_index(vq);
         if (index < proxy->nvqs_with_notifiers) {
-            n = virtio_queue_get_guest_notifier(vq);
-            virtio_pci_one_vector_mask(proxy, index, vector, n);
+            virtio_pci_vq_vector_mask(proxy, index, vector);
             --unmasked;
         }
         vq = virtio_vector_next_queue(vq);
@@ -927,17 +901,15 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
     VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
-    EventNotifier *n;
     int index;
 
     while (vq) {
         index = virtio_get_queue_index(vq);
-        n = virtio_queue_get_guest_notifier(vq);
         if (!virtio_queue_get_num(vdev, index)) {
             break;
         }
         if (index < proxy->nvqs_with_notifiers) {
-            virtio_pci_one_vector_mask(proxy, index, vector, n);
+            virtio_pci_vq_vector_mask(proxy, index, vector);
         }
         vq = virtio_vector_next_queue(vq);
     }
@@ -953,17 +925,19 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
     int queue_no;
     unsigned int vector;
     EventNotifier *notifier;
-    int ret;
+    VirtQueue *vq;
 
     for (queue_no = 0; queue_no < proxy->nvqs_with_notifiers; queue_no++) {
-        ret = virtio_pci_get_notifier(proxy, queue_no, &notifier, &vector);
-        if (ret < 0) {
+        if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
+        vector = virtio_queue_vector(vdev, queue_no);
         if (vector < vector_start || vector >= vector_end ||
             !msix_is_masked(dev, vector)) {
             continue;
         }
+        vq = virtio_get_queue(vdev, queue_no);
+        notifier = virtio_queue_get_guest_notifier(vq);
         if (k->guest_notifier_pending) {
             if (k->guest_notifier_pending(vdev, queue_no)) {
                 msix_set_pending(dev, vector);
-- 
MST


