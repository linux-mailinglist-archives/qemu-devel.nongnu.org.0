Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF5397FBA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:53:08 +0200 (CEST)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHwJ-0003bu-9Z
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHrw-0007Tv-SA
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHru-0006lS-To
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622605714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3UKPY+Qx+FCHJjFQhUAkuSj2oO4H62zCQrESPorQMWY=;
 b=atBdK2qJ7JAA0Pyk/pRS5wUNtYEfaBngFXphfuH3RKMe2qaaPhntmAgBmzFAgW3ympWYDp
 y6M5emTIjdFlNAXUFG8ctzcJnZdjF/UoYPBKI1h98ZOmSAWneYfWQVHyER9SZgUQki9+Gx
 nJtRiPa4H1Hv8fnFvCFRBcIivrq9qIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-vsWpgLttPzqFBGR2X2De0w-1; Tue, 01 Jun 2021 23:48:32 -0400
X-MC-Unique: vsWpgLttPzqFBGR2X2De0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D78BF180FD63
 for <qemu-devel@nongnu.org>; Wed,  2 Jun 2021 03:48:31 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4852B5D6D5;
 Wed,  2 Jun 2021 03:48:27 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v7 08/10] virtio-pci: decouple virtqueue from
 kvm_virtio_pci_vector_use
Date: Wed,  2 Jun 2021 11:47:48 +0800
Message-Id: <20210602034750.23377-9-lulu@redhat.com>
In-Reply-To: <20210602034750.23377-1-lulu@redhat.com>
References: <20210602034750.23377-1-lulu@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

inorder to support configure interrupt, we need to decouple
virtqueue from vector use and vector release function
this patch introduce vector_release_one and vector_use_one
to support one vector.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c | 122 ++++++++++++++++++++---------------------
 1 file changed, 61 insertions(+), 61 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 6a4ef413a4..f863c89de6 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -666,7 +666,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
 }
 
 static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
-                                        unsigned int queue_no,
                                         unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
@@ -710,85 +709,86 @@ static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
     ret = kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
     assert(ret == 0);
 }
-
-static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
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
+    if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
+        return -1;
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
+    ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
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
 
-- 
2.21.3


