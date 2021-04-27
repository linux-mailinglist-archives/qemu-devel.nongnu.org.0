Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BF36BE0C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:54:43 +0200 (CEST)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEo6-0004Kt-ML
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEaU-00067B-Tk
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEaQ-00067V-2i
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619494833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4cmPbiEwEGftO8mrNWEPj2CgiRFKvrX7qJYFZEnNDU=;
 b=F2v/JwqXzcNiIRrmNcisEOLo8boVgF8EqcpYxgtW3fJNbs0wW0qvh3rOuIM6wNCBBbQ7Ji
 zq2gExW2fhUkfN2LujDD2n5Yj2DdN2vszYHSo+ZgIN7zwdrch8pGVuthUZy5UOpfbq1P64
 aeM/AOdI8hepgwFbDM2gz3oWWhvPK5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-7Q9rRR5vMVmFQyVxjy1HOA-1; Mon, 26 Apr 2021 23:40:31 -0400
X-MC-Unique: 7Q9rRR5vMVmFQyVxjy1HOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFC71107ACCA
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:40:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-211.pek2.redhat.com [10.72.13.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 534925D9C0;
 Tue, 27 Apr 2021 03:40:29 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v6 7/9] virtio-pci: add support for configure interrupt
Date: Tue, 27 Apr 2021 11:39:49 +0800
Message-Id: <20210427033951.29805-8-lulu@redhat.com>
In-Reply-To: <20210427033951.29805-1-lulu@redhat.com>
References: <20210427033951.29805-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for configure interrupt, use kvm_irqfd_assign and set the
gsi to kernel. When the configure notifier was eventfd_signal by host
kernel, this will finally inject an msix interrupt to guest
---
 hw/virtio/virtio-pci.c | 186 ++++++++++++++++++++++++++---------------
 1 file changed, 120 insertions(+), 66 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 2b7e6cc0d9..07d28dd367 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -664,12 +664,10 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
 }
 
 static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
-                                        unsigned int queue_no,
                                         unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
     int ret;
-
     if (irqfd->users == 0) {
         ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev);
         if (ret < 0) {
@@ -708,93 +706,120 @@ static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
     ret = kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
     assert(ret == 0);
 }
-
-static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
+                                      EventNotifier **n, unsigned int *vector)
 {
     PCIDevice *dev = &proxy->pci_dev;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    unsigned int vector;
-    int ret, queue_no;
     VirtQueue *vq;
-    EventNotifier *n;
-    for (queue_no = 0; queue_no < nvqs; queue_no++) {
+
+    if (queue_no == -1) {
+        *n = virtio_get_config_notifier(vdev);
+        *vector = vdev->config_vector;
+    } else {
         if (!virtio_queue_get_num(vdev, queue_no)) {
-            break;
-        }
-        vector = virtio_queue_vector(vdev, queue_no);
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
-        }
-        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
-        if (ret < 0) {
-            goto undo;
-        }
-        /* If guest supports masking, set up irqfd now.
-         * Otherwise, delay until unmasked in the frontend.
-         */
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            vq = virtio_get_queue(vdev, queue_no);
-            n = virtio_queue_get_guest_notifier(vq);
-            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
-            if (ret < 0) {
-                kvm_virtio_pci_vq_vector_release(proxy, vector);
-                goto undo;
-            }
+            return -1;
         }
+        *vector = virtio_queue_vector(vdev, queue_no);
+        vq = virtio_get_queue(vdev, queue_no);
+        *n = virtio_queue_get_guest_notifier(vq);
+    }
+    if (*vector >= msix_nr_vectors_allocated(dev)) {
+        return -1;
     }
     return 0;
+}
 
+static int kvm_virtio_pci_vector_use_one(VirtIOPCIProxy *proxy, int queue_no)
+{
+    unsigned int vector;
+    int ret;
+    EventNotifier *n;
+    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+    if (ret < 0) {
+        return ret;
+    }
+    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
+    if (ret < 0) {
+        goto undo;
+    }
+    ret = kvm_virtio_pci_irqfd_use(proxy,  n, vector);
+    if (ret < 0) {
+        goto undo;
+    }
+    return 0;
 undo:
-    while (--queue_no >= 0) {
-        vector = virtio_queue_vector(vdev, queue_no);
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
-        }
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            vq = virtio_get_queue(vdev, queue_no);
-            n = virtio_queue_get_guest_notifier(vq);
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
-        }
-        kvm_virtio_pci_vq_vector_release(proxy, vector);
+    kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    return ret;
+}
+static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+{
+    int queue_no;
+    int ret = 0;
+    for (queue_no = 0; queue_no < nvqs; queue_no++) {
+        ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
     }
     return ret;
 }
 
-static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
+{
+    return kvm_virtio_pci_vector_use_one(proxy, -1);
+ }
+
+static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
+                        int queue_no)
 {
-    PCIDevice *dev = &proxy->pci_dev;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     unsigned int vector;
-    int queue_no;
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    VirtQueue *vq;
     EventNotifier *n;
+    int ret;
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+    if (ret < 0) {
+        return;
+    }
+
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    }
+    kvm_virtio_pci_vq_vector_release(proxy, vector);
+}
+static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+{
+    int queue_no;
+
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
-        if (!virtio_queue_get_num(vdev, queue_no)) {
-            break;
-        }
-        vector = virtio_queue_vector(vdev, queue_no);
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
-        }
-        /* If guest supports masking, clean up irqfd now.
-         * Otherwise, it was cleaned when masked in the frontend.
-         */
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            vq = virtio_get_queue(vdev, queue_no);
-            n = virtio_queue_get_guest_notifier(vq);
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
-        }
-        kvm_virtio_pci_vq_vector_release(proxy, vector);
+        kvm_virtio_pci_vector_release_one(proxy, queue_no);
     }
 }
 
+static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
+{
+    kvm_virtio_pci_vector_release_one(proxy, -1);
+}
+static int virtio_pci_set_config_notifier(DeviceState *d,  bool assign)
+{
+    VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    EventNotifier *notifier = virtio_get_config_notifier(vdev);
+    int r = 0;
+    if (assign) {
+        r = event_notifier_init(notifier, 0);
+        virtio_set_config_notifier_fd_handler(vdev, true, true);
+        kvm_virtio_pci_vector_config_use(proxy);
+    } else {
+        virtio_set_config_notifier_fd_handler(vdev, false, true);
+        kvm_virtio_pci_vector_config_release(proxy);
+        event_notifier_cleanup(notifier);
+    }
+    return r;
+}
 static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
                                        unsigned int queue_no,
                                        unsigned int vector,
                                        MSIMessage msg,
-                                        EventNotifier *n)
+                                       EventNotifier *n)
 {
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
@@ -871,9 +896,16 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
         }
         vq = virtio_vector_next_queue(vq);
     }
-
+    n = virtio_get_config_notifier(vdev);
+    ret = virtio_pci_vq_vector_unmask(proxy, -1, vector, msg, n);
+    if (ret < 0) {
+        goto config_undo;
+    }
     return 0;
 
+ config_undo:
+    n = virtio_get_config_notifier(vdev);
+    virtio_pci_vq_vector_mask(proxy, -1, vector, n);
 undo:
     vq = virtio_vector_first_queue(vdev, vector);
     while (vq && unmasked >= 0) {
@@ -907,6 +939,8 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
         }
         vq = virtio_vector_next_queue(vq);
     }
+    n = virtio_get_config_notifier(vdev);
+    virtio_pci_vq_vector_mask(proxy, -1, vector,  n);
 }
 
 static void virtio_pci_vector_poll(PCIDevice *dev,
@@ -920,7 +954,7 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
     unsigned int vector;
     EventNotifier *notifier;
     VirtQueue *vq;
-
+    /*check for every queue*/
     for (queue_no = 0; queue_no < proxy->nvqs_with_notifiers; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
@@ -940,6 +974,21 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
             msix_set_pending(dev, vector);
         }
     }
+    /*check for config interrupt*/
+
+   vector = vdev->config_vector;
+   notifier = virtio_get_config_notifier(vdev);
+   if (vector < vector_start || vector >= vector_end ||
+            !msix_is_masked(dev, vector)) {
+        return;
+   }
+   if (k->guest_notifier_pending) {
+        if (k->guest_notifier_pending(vdev, -1)) {
+            msix_set_pending(dev, vector);
+        }
+   } else if (event_notifier_test_and_clear(notifier)) {
+        msix_set_pending(dev, vector);
+   }
 }
 
 static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
@@ -1027,6 +1076,10 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
                 goto assign_error;
             }
         }
+            r = virtio_pci_set_config_notifier(d, assign);
+            if (r < 0) {
+                goto config_error;
+         }
         r = msix_set_vector_notifiers(&proxy->pci_dev,
                                       virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
@@ -1043,7 +1096,8 @@ notifiers_error:
         assert(assign);
         kvm_virtio_pci_vector_release(proxy, nvqs);
     }
-
+ config_error:
+        kvm_virtio_pci_vector_config_release(proxy);
 assign_error:
     /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
     assert(assign);
-- 
2.21.3


