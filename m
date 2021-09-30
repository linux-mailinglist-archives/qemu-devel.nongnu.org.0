Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9923841D189
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 04:39:13 +0200 (CEST)
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVlya-0000TX-DW
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 22:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVlvb-0005bK-Jm
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVlvW-0004o9-0O
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632969361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOPJxL9qxVlzXenVtyRUu/E1PaU+4OGzaCJJpeo4qFw=;
 b=B95xJKdQ41Ha4i5XjXbWrIGYAO/9tgnwqFkkK6e2fX8YpCdZufN8xgnNVJ7rLC0faQrpSb
 fMYn6ZpwipL9vD+tui30BubfTNmeEa5qlTTs1JXLntww1L44WtVDkoUWYDL2CYN0/z0HZB
 LGCVHBfXewts+0CLiIBezF1JZ31HjeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-MIH-TkpzPYebzpziwY2tZA-1; Wed, 29 Sep 2021 22:36:00 -0400
X-MC-Unique: MIH-TkpzPYebzpziwY2tZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A1071084684;
 Thu, 30 Sep 2021 02:35:59 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-120.pek2.redhat.com [10.72.12.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E25D10016F4;
 Thu, 30 Sep 2021 02:35:20 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com
Subject: [PATCH v9 02/10] virtio-pci: decouple notifier from interrupt process
Date: Thu, 30 Sep 2021 10:33:40 +0800
Message-Id: <20210930023348.17770-3-lulu@redhat.com>
In-Reply-To: <20210930023348.17770-1-lulu@redhat.com>
References: <20210930023348.17770-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To reuse the notifier process in configure interrupt.
Use the virtio_pci_get_notifier function to get the notifier.
the INPUT of this function is the IDX, the OUTPUT is notifier and
the vector

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c | 84 +++++++++++++++++++++++++++++-------------
 1 file changed, 58 insertions(+), 26 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 433060ac02..456782c43e 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -704,29 +704,45 @@ static void kvm_virtio_pci_vq_vector_release(VirtIOPCIProxy *proxy,
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
+    PCIDevice *dev = &proxy->pci_dev;
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
+    if (*vector >= msix_nr_vectors_allocated(dev)) {
+        return -1;
+    }
+    return 0;
+}
 
 static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
 {
@@ -735,12 +751,15 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
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
@@ -752,7 +771,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, delay until unmasked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
+            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
             if (ret < 0) {
                 kvm_virtio_pci_vq_vector_release(proxy, vector);
                 goto undo;
@@ -768,7 +787,11 @@ undo:
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
@@ -782,12 +805,16 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
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
@@ -795,21 +822,20 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
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
 
@@ -836,14 +862,15 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
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
@@ -854,7 +881,7 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
     if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
         k->guest_notifier_mask(vdev, queue_no, true);
     } else {
-        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
     }
 }
 
@@ -864,6 +891,7 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
     VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
+    EventNotifier *n;
     int ret, index, unmasked = 0;
 
     while (vq) {
@@ -872,7 +900,8 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
             break;
         }
         if (index < proxy->nvqs_with_notifiers) {
-            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg);
+            n = virtio_queue_get_guest_notifier(vq);
+            ret = virtio_pci_one_vector_unmask(proxy, index, vector, msg, n);
             if (ret < 0) {
                 goto undo;
             }
@@ -888,7 +917,8 @@ undo:
     while (vq && unmasked >= 0) {
         index = virtio_get_queue_index(vq);
         if (index < proxy->nvqs_with_notifiers) {
-            virtio_pci_vq_vector_mask(proxy, index, vector);
+            n = virtio_queue_get_guest_notifier(vq);
+            virtio_pci_one_vector_mask(proxy, index, vector, n);
             --unmasked;
         }
         vq = virtio_vector_next_queue(vq);
@@ -901,15 +931,17 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
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
-- 
2.21.3


