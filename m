Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA1E345542
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:06:40 +0100 (CET)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWRL-0000oG-V4
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lOWIE-0000Dx-6R
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lOWIA-0005ws-83
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616464629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfkWbKwTlAWQ5kRkEce68rrFH1A8EQb3nx/1ikf4IEM=;
 b=Ja/0NkF6jZ4ERvIyKtXauhxQb1/UnGwT4LS7Fro9K8pTczWIfAMJzg5SVMA8O1LOR/cN1v
 HdBB6+YMi8jzFllBaD68f8gEpE3Q18vy2lrduE+xbE/Ea8rOriG7IYVTqnXVg52muq41iF
 piPr9UuDtvJd2SHaDLVjgRJvDZLfDLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-0DH10RLKN4y986v1VXcJmw-1; Mon, 22 Mar 2021 21:57:07 -0400
X-MC-Unique: 0DH10RLKN4y986v1VXcJmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E28A8180FCA0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 01:57:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-88.pek2.redhat.com [10.72.12.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EC03682AC;
 Tue, 23 Mar 2021 01:57:04 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] virtio-pci: add support for configure interrupt
Date: Tue, 23 Mar 2021 09:56:41 +0800
Message-Id: <20210323015641.10820-5-lulu@redhat.com>
In-Reply-To: <20210323015641.10820-1-lulu@redhat.com>
References: <20210323015641.10820-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c | 171 +++++++++++++++++++++++++++++++++--------
 1 file changed, 137 insertions(+), 34 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 36524a5728..b0c190caba 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -664,7 +664,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
 }
 
 static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
-                                        unsigned int queue_no,
                                         unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
@@ -691,23 +690,17 @@ static void kvm_virtio_pci_vq_vector_release(VirtIOPCIProxy *proxy,
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
 
@@ -722,7 +715,8 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     unsigned int vector;
     int ret, queue_no;
-
+    VirtQueue *vq;
+    EventNotifier *n;
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
@@ -731,7 +725,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
         if (vector >= msix_nr_vectors_allocated(dev)) {
             continue;
         }
-        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
+        ret = kvm_virtio_pci_vq_vector_use(proxy,  vector);
         if (ret < 0) {
             goto undo;
         }
@@ -739,7 +733,9 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, delay until unmasked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
+            vq = virtio_get_queue(vdev, queue_no);
+            n = virtio_queue_get_guest_notifier(vq);
+            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
             if (ret < 0) {
                 kvm_virtio_pci_vq_vector_release(proxy, vector);
                 goto undo;
@@ -755,13 +751,69 @@ undo:
             continue;
         }
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
+            vq = virtio_get_queue(vdev, queue_no);
+            n = virtio_queue_get_guest_notifier(vq);
+            kvm_virtio_pci_irqfd_release(proxy, n, vector);
         }
         kvm_virtio_pci_vq_vector_release(proxy, vector);
     }
     return ret;
 }
 
+static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
+{
+
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    unsigned int vector;
+    int ret;
+    EventNotifier *n = virtio_get_config_notifier(vdev);
+
+    vector = vdev->config_vector ;
+    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
+    if (ret < 0) {
+        goto undo;
+    }
+    ret = kvm_virtio_pci_irqfd_use(proxy,  n, vector);
+    if (ret < 0) {
+        goto undo;
+    }
+    return 0;
+undo:
+    kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    return ret;
+}
+static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
+{
+    PCIDevice *dev = &proxy->pci_dev;
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    unsigned int vector;
+    EventNotifier *n = virtio_get_config_notifier(vdev);
+    vector = vdev->config_vector ;
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return;
+    }
+    kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    kvm_virtio_pci_vq_vector_release(proxy, vector);
+}
+
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
+
 static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
 {
     PCIDevice *dev = &proxy->pci_dev;
@@ -769,7 +821,8 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
     unsigned int vector;
     int queue_no;
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-
+    VirtQueue *vq;
+    EventNotifier *n;
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
@@ -782,7 +835,9 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, it was cleaned when masked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
+            vq = virtio_get_queue(vdev, queue_no);
+            n = virtio_queue_get_guest_notifier(vq);
+            kvm_virtio_pci_irqfd_release(proxy, n, vector);
         }
         kvm_virtio_pci_vq_vector_release(proxy, vector);
     }
@@ -791,15 +846,14 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
 static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
                                        unsigned int queue_no,
                                        unsigned int vector,
-                                       MSIMessage msg)
+                                       MSIMessage msg,
+                                       int type,
+                                        EventNotifier *n)
 {
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
-    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
     VirtIOIRQFD *irqfd;
     int ret = 0;
-
     if (proxy->vector_irqfd) {
         irqfd = &proxy->vector_irqfd[vector];
         if (irqfd->msg.data != msg.data || irqfd->msg.address != msg.address) {
@@ -816,32 +870,33 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
      * Otherwise, set it up now.
      */
     if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-        k->guest_notifier_mask(vdev, queue_no, false);
+        k->guest_notifier_mask(vdev, queue_no, false, type);
         /* Test after unmasking to avoid losing events. */
         if (k->guest_notifier_pending &&
-            k->guest_notifier_pending(vdev, queue_no)) {
+            k->guest_notifier_pending(vdev, queue_no, type)) {
             event_notifier_set(n);
         }
     } else {
-        ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
+        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
     }
     return ret;
 }
 
 static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
                                              unsigned int queue_no,
-                                             unsigned int vector)
+                                             unsigned int vector,
+                                             int type,
+                                             EventNotifier *n)
 {
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-
     /* If guest supports masking, keep irqfd but mask it.
      * Otherwise, clean it up now.
      */ 
     if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-        k->guest_notifier_mask(vdev, queue_no, true);
+        k->guest_notifier_mask(vdev, queue_no, true, type);
     } else {
-        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
     }
 }
 
@@ -851,15 +906,26 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
     VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
+    EventNotifier *n;
     int ret, index, unmasked = 0;
 
+   if (vdev->use_config_notifier == VIRTIO_CONFIG_WORK) {
+        n = virtio_get_config_notifier(vdev);
+        ret = virtio_pci_vq_vector_unmask(proxy, 0, vector, msg,
+                    VIRTIO_CONFIG_VECTOR, n);
+        if (ret < 0) {
+            goto config_undo;
+       }
+    }
     while (vq) {
         index = virtio_get_queue_index(vq);
         if (!virtio_queue_get_num(vdev, index)) {
             break;
         }
         if (index < proxy->nvqs_with_notifiers) {
-            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg);
+            n = virtio_queue_get_guest_notifier(vq);
+            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg,
+                        VIRTIO_VQ_VECTOR, n);
             if (ret < 0) {
                 goto undo;
             }
@@ -875,11 +941,17 @@ undo:
     while (vq && unmasked >= 0) {
         index = virtio_get_queue_index(vq);
         if (index < proxy->nvqs_with_notifiers) {
-            virtio_pci_vq_vector_mask(proxy, index, vector);
+            n = virtio_queue_get_guest_notifier(vq);
+            virtio_pci_vq_vector_mask(proxy, index, vector,
+                 VIRTIO_VQ_VECTOR, n);
             --unmasked;
         }
         vq = virtio_vector_next_queue(vq);
     }
+ config_undo:
+            n = virtio_get_config_notifier(vdev);
+            virtio_pci_vq_vector_mask(proxy, 0, vector,
+                VIRTIO_CONFIG_VECTOR, n);
     return ret;
 }
 
@@ -888,18 +960,26 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
     VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
+    EventNotifier *n;
     int index;
 
+   if (vdev->use_config_notifier == VIRTIO_CONFIG_WORK) {
+        n = virtio_get_config_notifier(vdev);
+        virtio_pci_vq_vector_mask(proxy, 0, vector, VIRTIO_CONFIG_VECTOR, n);
+   }
     while (vq) {
         index = virtio_get_queue_index(vq);
+         n = virtio_queue_get_guest_notifier(vq);
         if (!virtio_queue_get_num(vdev, index)) {
             break;
         }
         if (index < proxy->nvqs_with_notifiers) {
-            virtio_pci_vq_vector_mask(proxy, index, vector);
+            virtio_pci_vq_vector_mask(proxy, index, vector,
+                VIRTIO_VQ_VECTOR, n);
         }
         vq = virtio_vector_next_queue(vq);
     }
+
 }
 
 static void virtio_pci_vector_poll(PCIDevice *dev,
@@ -918,6 +998,7 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
+
         vector = virtio_queue_vector(vdev, queue_no);
         if (vector < vector_start || vector >= vector_end ||
             !msix_is_masked(dev, vector)) {
@@ -926,7 +1007,22 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
         vq = virtio_get_queue(vdev, queue_no);
         notifier = virtio_queue_get_guest_notifier(vq);
         if (k->guest_notifier_pending) {
-            if (k->guest_notifier_pending(vdev, queue_no)) {
+            if (k->guest_notifier_pending(vdev, queue_no, VIRTIO_VQ_VECTOR)) {
+                msix_set_pending(dev, vector);
+            }
+        } else if (event_notifier_test_and_clear(notifier)) {
+            msix_set_pending(dev, vector);
+        }
+    }
+   if (vdev->use_config_notifier == VIRTIO_CONFIG_WORK) {
+        vector = vdev->config_vector;
+        notifier = virtio_get_config_notifier(vdev);
+        if (vector < vector_start || vector >= vector_end ||
+            !msix_is_masked(dev, vector)) {
+            return;
+        }
+        if (k->guest_notifier_pending) {
+            if (k->guest_notifier_pending(vdev, 0,  VIRTIO_CONFIG_VECTOR)) {
                 msix_set_pending(dev, vector);
             }
         } else if (event_notifier_test_and_clear(notifier)) {
@@ -958,7 +1054,7 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
     if (!msix_enabled(&proxy->pci_dev) &&
         vdev->use_guest_notifier_mask &&
         vdc->guest_notifier_mask) {
-        vdc->guest_notifier_mask(vdev, n, !assign);
+        vdc->guest_notifier_mask(vdev, n, !assign, VIRTIO_VQ_VECTOR);
     }
 
     return 0;
@@ -1008,7 +1104,6 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
             goto assign_error;
         }
     }
-
     /* Must set vector notifier after guest notifier has been assigned */
     if ((with_irqfd || k->guest_notifier_mask) && assign) {
         if (with_irqfd) {
@@ -1020,6 +1115,12 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
                 goto assign_error;
             }
         }
+        if (vdev->use_config_notifier == VIRTIO_CONFIG_SUPPORT) {
+            r = virtio_pci_set_config_notifier(d, assign);
+            if (r < 0) {
+                goto config_error;
+         }
+     }
         r = msix_set_vector_notifiers(&proxy->pci_dev,
                                       virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
@@ -1028,7 +1129,6 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
             goto notifiers_error;
         }
     }
-
     return 0;
 
 notifiers_error:
@@ -1036,13 +1136,16 @@ notifiers_error:
         assert(assign);
         kvm_virtio_pci_vector_release(proxy, nvqs);
     }
-
+ config_error:
+    /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
+        kvm_virtio_pci_vector_config_release(proxy);
 assign_error:
     /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
     assert(assign);
     while (--n >= 0) {
         virtio_pci_set_guest_notifier(d, n, !assign, with_irqfd);
     }
+
     return r;
 }
 
-- 
2.21.3


