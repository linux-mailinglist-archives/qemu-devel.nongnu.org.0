Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E17649541
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 18:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Q0n-0003jo-Ew; Sun, 11 Dec 2022 12:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p4Q0j-0003j5-Io
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 12:21:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p4Q0g-0005Fz-TA
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 12:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670779266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zm31OseQS11fZRbA1gczV6EywxU2OnhVA8+OUkApXJM=;
 b=VXnlZ2qCEvvgPXZGKNuch5g0Hxw9vpLXI+M4igNERSCwyhJWk75SizfwkAprc8mhrJssW/
 Wkog1ur3d4R8PBOBRfs6Rl3BSwj4A9RrpMviZ4QQa1uxdTl0CjnFwOz0gQVLZzH7cXztAT
 /DINJK++aZzElC2M3U8JeIQ5V2L7BN0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-aVTcWun7Nkm8iZjC0bs7Ww-1; Sun, 11 Dec 2022 12:21:02 -0500
X-MC-Unique: aVTcWun7Nkm8iZjC0bs7Ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9743B101A528
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 17:21:02 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-92.pek2.redhat.com [10.72.12.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A127420290A5;
 Sun, 11 Dec 2022 17:21:00 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v20 03/10] virtio-pci: decouple the single vector from the
 interrupt process
Date: Mon, 12 Dec 2022 01:20:35 +0800
Message-Id: <20221211172042.3969410-4-lulu@redhat.com>
In-Reply-To: <20221211172042.3969410-1-lulu@redhat.com>
References: <20221211172042.3969410-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To reuse the interrupt process in configure interrupt
Need to decouple the single vector from the interrupt process.
We add new function kvm_virtio_pci_vector_use_one and _release_one.
These functions are used for the single vector, the whole process will
finish in the loop with vq number.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c | 131 +++++++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 58 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 52c7692fff..ec816ea367 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -699,7 +699,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
 }
 
 static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
-                                        unsigned int queue_no,
                                         unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
@@ -764,87 +763,103 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
     return 0;
 }
 
-static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+static int kvm_virtio_pci_vector_use_one(VirtIOPCIProxy *proxy, int queue_no)
 {
+    unsigned int vector;
+    int ret;
+    EventNotifier *n;
     PCIDevice *dev = &proxy->pci_dev;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    unsigned int vector;
-    int ret, queue_no;
-    EventNotifier *n;
-    for (queue_no = 0; queue_no < nvqs; queue_no++) {
-        if (!virtio_queue_get_num(vdev, queue_no)) {
-            break;
-        }
-        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-        if (ret < 0) {
-            break;
-        }
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
-        }
-        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
+
+    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+    if (ret < 0) {
+        return ret;
+    }
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return 0;
+    }
+    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
+    if (ret < 0) {
+        goto undo;
+    }
+    /*
+     * If guest supports masking, set up irqfd now.
+     * Otherwise, delay until unmasked in the frontend.
+     */
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
         if (ret < 0) {
+            kvm_virtio_pci_vq_vector_release(proxy, vector);
             goto undo;
         }
-        /* If guest supports masking, set up irqfd now.
-         * Otherwise, delay until unmasked in the frontend.
-         */
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
-            if (ret < 0) {
-                kvm_virtio_pci_vq_vector_release(proxy, vector);
-                goto undo;
-            }
-        }
     }
-    return 0;
 
+    return 0;
 undo:
-    while (--queue_no >= 0) {
-        vector = virtio_queue_vector(vdev, queue_no);
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
+
+    vector = virtio_queue_vector(vdev, queue_no);
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return ret;
+    }
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+        if (ret < 0) {
+            return ret;
         }
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-            if (ret < 0) {
-                break;
-            }
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    }
+    return ret;
+}
+static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+{
+    int queue_no;
+    int ret = 0;
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+
+    for (queue_no = 0; queue_no < nvqs; queue_no++) {
+        if (!virtio_queue_get_num(vdev, queue_no)) {
+            return -1;
         }
-        kvm_virtio_pci_vq_vector_release(proxy, vector);
+        ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
     }
     return ret;
 }
 
-static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+
+static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
+                                              int queue_no)
 {
-    PCIDevice *dev = &proxy->pci_dev;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     unsigned int vector;
-    int queue_no;
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     EventNotifier *n;
-    int ret ;
+    int ret;
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    PCIDevice *dev = &proxy->pci_dev;
+
+    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+    if (ret < 0) {
+        return;
+    }
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return;
+    }
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    }
+    kvm_virtio_pci_vq_vector_release(proxy, vector);
+}
+
+static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+{
+    int queue_no;
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
-        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-        if (ret < 0) {
-            break;
-        }
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
-        }
-        /* If guest supports masking, clean up irqfd now.
-         * Otherwise, it was cleaned when masked in the frontend.
-         */
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
-        }
-        kvm_virtio_pci_vq_vector_release(proxy, vector);
+        kvm_virtio_pci_vector_release_one(proxy, queue_no);
     }
 }
 
-- 
2.34.3


