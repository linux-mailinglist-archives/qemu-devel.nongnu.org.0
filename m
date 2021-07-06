Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0133BC714
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:24:57 +0200 (CEST)
Received: from localhost ([::1]:55530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fRw-0006HX-43
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1m0fO6-0007F0-VE
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1m0fO5-0004Az-2Z
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625556056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nYgg4DsuLMUPXRxb1WtLSP8ebl8wKifegdSqR8fZmU=;
 b=FGx1FKcLtdHefKSel0twaJ6O62CDPjzHBDCOIJkotFFK0wg4hOqNkiKa6cyCZsyeD11yq5
 THlNnzMbOCOMMcFlgtIqOAk4/bB5CW5iAVxt9JAArsP3F2tA3RYZ7WojJHIDo3w84admbL
 /3f9x2vODjufojIwTvJK2aKfGyPVobk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-1tH-yPj_PQOHlA00lcoeGg-1; Tue, 06 Jul 2021 03:20:55 -0400
X-MC-Unique: 1tH-yPj_PQOHlA00lcoeGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E815700F
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 07:20:54 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-123.pek2.redhat.com [10.72.13.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3AC15C22A;
 Tue,  6 Jul 2021 07:20:51 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v8 7/9] virtio-pci: decouple notifier from interrupt process
Date: Tue,  6 Jul 2021 15:20:28 +0800
Message-Id: <20210706072030.32365-8-lulu@redhat.com>
In-Reply-To: <20210706072030.32365-1-lulu@redhat.com>
References: <20210706072030.32365-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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

use the virtio_pci_get_notifier function to
get the notifer, the input of the function
will is the idx, the output is notifier and
vector

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c | 45 ++++++++++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 2fe5b1f5aa..fe06847b62 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -710,6 +710,28 @@ static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
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
@@ -718,13 +740,15 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     unsigned int vector;
     int ret, queue_no;
-    VirtQueue *vq;
     EventNotifier *n;
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
@@ -736,8 +760,6 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, delay until unmasked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            vq = virtio_get_queue(vdev, queue_no);
-            n = virtio_queue_get_guest_notifier(vq);
             ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
             if (ret < 0) {
                 kvm_virtio_pci_vq_vector_release(proxy, vector);
@@ -754,8 +776,10 @@ undo:
             continue;
         }
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            vq = virtio_get_queue(vdev, queue_no);
-            n = virtio_queue_get_guest_notifier(vq);
+            ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+            if (ret < 0) {
+                break;
+            }
             kvm_virtio_pci_irqfd_release(proxy, n, vector);
         }
         kvm_virtio_pci_vq_vector_release(proxy, vector);
@@ -770,13 +794,16 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
     unsigned int vector;
     int queue_no;
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    VirtQueue *vq;
     EventNotifier *n;
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
@@ -784,8 +811,6 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
          * Otherwise, it was cleaned when masked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            vq = virtio_get_queue(vdev, queue_no);
-            n = virtio_queue_get_guest_notifier(vq);
             kvm_virtio_pci_irqfd_release(proxy, n, vector);
         }
         kvm_virtio_pci_vq_vector_release(proxy, vector);
-- 
2.21.3


