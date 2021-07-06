Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58A3BC724
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:27:08 +0200 (CEST)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fU3-0002IG-Nh
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1m0fOL-0007y9-IU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:21:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1m0fOJ-0004ND-JU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625556071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H31IeVfivtg7TVCu/QypNCAglN1wFxPXF+cnDjYjwbY=;
 b=BJiJK+zDOX2OY4GqvP9rIqaOewHOhJaAMEGpowyZqPaR3wJveZJJjuw/CkQLB/lRQrVfLr
 hNBWF7P2dGz1PEfh82lFqhaP8J5cMzbLbtBS/rif3mJR8yOpgOsMFTWeaWHywREhNyliUR
 xycPYmjjA3DnJyqLT2Hr5uWE4+EoTlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-JRuFduADNO-aeT4NHtPjZw-1; Tue, 06 Jul 2021 03:21:09 -0400
X-MC-Unique: JRuFduADNO-aeT4NHtPjZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69B9A192CC4F
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 07:21:08 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-123.pek2.redhat.com [10.72.13.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 617605C1D0;
 Tue,  6 Jul 2021 07:20:57 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v8 9/9] virtio-pci: add support for configure interrupt
Date: Tue,  6 Jul 2021 15:20:30 +0800
Message-Id: <20210706072030.32365-10-lulu@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
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

Add support for configure interrupt, use kvm_irqfd_assign and set the
gsi to kernel. When the configure notifier was eventfd_signal by host
kernel, this will finally inject an msix interrupt to guest

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c | 60 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index e43d5760ee..73b5ffd1b8 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -717,7 +717,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
     VirtQueue *vq;
 
     if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
-        return -1;
+        *n = virtio_get_config_notifier(vdev);
+        *vector = vdev->config_vector;
     } else {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             return -1;
@@ -764,6 +765,10 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
     return ret;
 }
 
+static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
+{
+    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
+}
 
 static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
                         int queue_no)
@@ -792,6 +797,30 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
     }
 }
 
+static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
+{
+    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
+}
+static int virtio_pci_set_config_notifier(DeviceState *d, bool assign)
+{
+    VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    EventNotifier *notifier = virtio_get_config_notifier(vdev);
+    int r = 0;
+    if (assign) {
+        r = event_notifier_init(notifier, 0);
+        if (r < 0) {
+            return r;
+        }
+        virtio_set_config_notifier_fd_handler(vdev, true, true);
+        kvm_virtio_pci_vector_config_use(proxy);
+    } else {
+        virtio_set_config_notifier_fd_handler(vdev, false, true);
+        kvm_virtio_pci_vector_config_release(proxy);
+        event_notifier_cleanup(notifier);
+    }
+    return r;
+}
 static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
                                        unsigned int queue_no,
                                        unsigned int vector,
@@ -873,7 +902,12 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
         }
         vq = virtio_vector_next_queue(vq);
     }
-
+    n = virtio_get_config_notifier(vdev);
+    ret = virtio_pci_one_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX,
+                        vector, msg, n);
+    if (ret < 0) {
+        goto undo;
+    }
     return 0;
 
 undo:
@@ -909,6 +943,8 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
         }
         vq = virtio_vector_next_queue(vq);
     }
+    n = virtio_get_config_notifier(vdev);
+    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
 }
 
 static void virtio_pci_vector_poll(PCIDevice *dev,
@@ -921,19 +957,17 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
     int queue_no;
     unsigned int vector;
     EventNotifier *notifier;
-    VirtQueue *vq;
-
-    for (queue_no = 0; queue_no < proxy->nvqs_with_notifiers; queue_no++) {
-        if (!virtio_queue_get_num(vdev, queue_no)) {
+    int ret;
+    for (queue_no = VIRTIO_CONFIG_IRQ_IDX;
+            queue_no < proxy->nvqs_with_notifiers; queue_no++) {
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
@@ -1002,6 +1036,7 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
         msix_unset_vector_notifiers(&proxy->pci_dev);
         if (proxy->vector_irqfd) {
             kvm_virtio_pci_vector_release(proxy, nvqs);
+            kvm_virtio_pci_vector_config_release(proxy);
             g_free(proxy->vector_irqfd);
             proxy->vector_irqfd = NULL;
         }
@@ -1029,6 +1064,10 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
                 goto assign_error;
             }
         }
+        r = virtio_pci_set_config_notifier(d, assign);
+        if (r < 0) {
+            goto config_error;
+        }
         r = msix_set_vector_notifiers(&proxy->pci_dev,
                                       virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
@@ -1045,7 +1084,8 @@ notifiers_error:
         assert(assign);
         kvm_virtio_pci_vector_release(proxy, nvqs);
     }
-
+config_error:
+    kvm_virtio_pci_vector_config_release(proxy);
 assign_error:
     /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
     assert(assign);
-- 
2.21.3


