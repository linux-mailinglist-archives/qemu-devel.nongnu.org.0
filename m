Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE19303737
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:14:27 +0100 (CET)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IYU-0000Ic-Pu
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4IOm-0001XE-Kn
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:04:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4IOe-0006DG-NZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611644655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uycYLpeUBZ55HNoDRJJJs0rpK+pMXKThZ71uvoV2WKo=;
 b=EJdae3MJvZt/OnmqPY0klfbn1yBHXlOTU6XXkkgKsVfpyqxHHbTQ/IcGEoeDx2CV+SVl8U
 BfdZIMe/I/X2GpXtmQib7eAQWeRc0FYZtfElF1OuHA9O6f9d4KThY4GVr/iYhyIxEGFoJ6
 +wTXVnwfWm+Ofd+R+J9acqe7i0JfHTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-nS4liI5ZPweMzrvcPnNgrA-1; Tue, 26 Jan 2021 02:04:14 -0500
X-MC-Unique: nS4liI5ZPweMzrvcPnNgrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E32480667F
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:04:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCE715B4BC;
 Tue, 26 Jan 2021 07:04:11 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] virtio-pci: add support for configure interrupt
Date: Tue, 26 Jan 2021 15:03:49 +0800
Message-Id: <20210126070351.28575-4-lulu@redhat.com>
In-Reply-To: <20210126070351.28575-1-lulu@redhat.com>
References: <20210126070351.28575-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for configure interrupt, use kvm_irqfd_assign and set the
gsi to kernel. When the configure notifier was eventfd_signal by host
kernel, this will finally inject an msix interrupt to guest

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c | 92 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 36524a5728..8e192600b8 100644
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
@@ -823,7 +878,7 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
             event_notifier_set(n);
         }
     } else {
-        ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
+        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
     }
     return ret;
 }
@@ -835,13 +890,15 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
 
+    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
+    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
     /* If guest supports masking, keep irqfd but mask it.
      * Otherwise, clean it up now.
      */ 
     if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
         k->guest_notifier_mask(vdev, queue_no, true);
     } else {
-        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
     }
 }
 
@@ -2137,6 +2194,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
     k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
     k->get_dma_as = virtio_pci_get_dma_as;
     k->queue_enabled = virtio_pci_queue_enabled;
+    k->set_config_notifiers = virtio_pci_set_config_notifier;
 }
 
 static const TypeInfo virtio_pci_bus_info = {
-- 
2.21.3


