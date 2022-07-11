Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358545707D3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 18:02:32 +0200 (CEST)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvra-0000u6-2Q
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 12:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oAvk7-0007IP-6V
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oAvk5-00060G-2t
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657554876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=T4YJxl2Ihvh9ReBnIK1lQc/64ru3Eo2avWjYkmJ9JfE=;
 b=bd2shzApAoMCsLSb3vur63s/23cmS+pr4GIrZP3S4mFnBVcEDV4LLWoN9qff8RchvC1sGa
 h+GS7pvx6fWfWBx2AEzXaLB0cR7dH7GGA4EDSuWOl8FETXb6ZdYwCZX0Nke+KcVmlhGnMd
 kmCVPqnnANqsuQm2qHWSKHFl9dUEtDQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-zDc5bvYDOZWf3BMDVVn32w-1; Mon, 11 Jul 2022 11:53:25 -0400
X-MC-Unique: zDc5bvYDOZWf3BMDVVn32w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90DFA29DD982;
 Mon, 11 Jul 2022 15:53:25 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-65.pek2.redhat.com [10.72.12.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B715D1415118;
 Mon, 11 Jul 2022 15:53:21 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v11 02/10] virtio-pci: decouple notifier from interrupt process
Date: Mon, 11 Jul 2022 23:52:35 +0800
Message-Id: <20220711155243.866530-3-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To reuse the notifier process. We add the virtio_pci_get_notifier
to get the notifier and vector. The INPUT for this function is IDX,
The OUTPUT is the notifier and the vector

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c | 88 +++++++++++++++++++++++++++---------------
 1 file changed, 57 insertions(+), 31 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 7cf1231c1c..2869d0d2f6 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -705,29 +705,41 @@ static void kvm_virtio_pci_vq_vector_release(VirtIOPCIProxy *proxy,
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
@@ -736,12 +748,15 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
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
@@ -753,7 +768,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, delay until unmasked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
+            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
             if (ret < 0) {
                 kvm_virtio_pci_vq_vector_release(proxy, vector);
                 goto undo;
@@ -769,7 +784,11 @@ undo:
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
@@ -783,12 +802,16 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
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
@@ -796,21 +819,20 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
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
 
@@ -837,14 +859,15 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
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
@@ -855,7 +878,7 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
     if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
         k->guest_notifier_mask(vdev, queue_no, true);
     } else {
-        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
     }
 }
 
@@ -865,6 +888,7 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
     VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
+    EventNotifier *n;
     int ret, index, unmasked = 0;
 
     while (vq) {
@@ -873,7 +897,8 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
             break;
         }
         if (index < proxy->nvqs_with_notifiers) {
-            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg);
+            n = virtio_queue_get_guest_notifier(vq);
+            ret = virtio_pci_one_vector_unmask(proxy, index, vector, msg, n);
             if (ret < 0) {
                 goto undo;
             }
@@ -889,7 +914,8 @@ undo:
     while (vq && unmasked >= 0) {
         index = virtio_get_queue_index(vq);
         if (index < proxy->nvqs_with_notifiers) {
-            virtio_pci_vq_vector_mask(proxy, index, vector);
+            n = virtio_queue_get_guest_notifier(vq);
+            virtio_pci_one_vector_mask(proxy, index, vector, n);
             --unmasked;
         }
         vq = virtio_vector_next_queue(vq);
@@ -902,15 +928,17 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
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
@@ -926,19 +954,17 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
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
2.34.3


