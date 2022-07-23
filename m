Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A657ECF1
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 11:13:27 +0200 (CEST)
Received: from localhost ([::1]:58358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFBCP-000755-RQ
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 05:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oFAvc-0002Xg-V1
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 04:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oFAva-0002is-Mm
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 04:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658566561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LkEgoD+mBSBOvtj6jnttaFZ79gpqANU+ANVFHYO95Ec=;
 b=FV78Ee6ZsL1XwRz3AbBP/SrRNnYrghf9/BftzcJkGj+imzgMVldxTDNPdl0HuPlZjsCQyy
 0fNT/XIbLNeBazV5AhcTBoyraPcizBt2DPYqIN26AajROM9lhM7TAEWw4z+wld4MHeXe38
 i3PRAter1BrkmnB6X5A+oYSzmmUJsSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-uTGKSR_oOJ-35Y34eWiyww-1; Sat, 23 Jul 2022 04:55:59 -0400
X-MC-Unique: uTGKSR_oOJ-35Y34eWiyww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAAC6804191;
 Sat, 23 Jul 2022 08:55:58 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-31.pek2.redhat.com [10.72.13.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21395C28100;
 Sat, 23 Jul 2022 08:55:54 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v14 10/10] virtio-pci: add support for configure interrupt
Date: Sat, 23 Jul 2022 16:54:25 +0800
Message-Id: <20220723085425.823472-11-lulu@redhat.com>
In-Reply-To: <20220723085425.823472-1-lulu@redhat.com>
References: <20220723085425.823472-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add process to handle the configure interrupt, The function's
logic is the same with vq interrupt.Add extra process to check
the configure interrupt

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c | 110 ++++++++++++++++++++++++++++++++++-------
 hw/virtio/virtio-pci.h |   4 +-
 2 files changed, 96 insertions(+), 18 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 4b86008bcf..16be30945a 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -728,7 +728,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
     VirtQueue *vq;
 
     if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
-        return -1;
+        *n = virtio_config_get_guest_notifier(vdev);
+        *vector = vdev->config_vector;
     } else {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             return -1;
@@ -788,7 +789,7 @@ undo:
     }
     return ret;
 }
-static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+static int kvm_virtio_pci_vector_vq_use(VirtIOPCIProxy *proxy, int nvqs)
 {
     int queue_no;
     int ret = 0;
@@ -803,6 +804,10 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
     return ret;
 }
 
+static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
+{
+    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
+}
 
 static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
                                               int queue_no)
@@ -827,7 +832,7 @@ static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
     kvm_virtio_pci_vq_vector_release(proxy, vector);
 }
 
-static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+static void kvm_virtio_pci_vector_vq_release(VirtIOPCIProxy *proxy, int nvqs)
 {
     int queue_no;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
@@ -840,6 +845,11 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
     }
 }
 
+static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
+{
+    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
+}
+
 static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
                                        unsigned int queue_no,
                                        unsigned int vector,
@@ -921,9 +931,19 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
         }
         vq = virtio_vector_next_queue(vq);
     }
-
+    /* unmask config intr */
+    if (vector == vdev->config_vector) {
+        n = virtio_config_get_guest_notifier(vdev);
+        ret = virtio_pci_one_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector,
+                                           msg, n);
+        if (ret < 0) {
+            goto undo_config;
+        }
+    }
     return 0;
-
+undo_config:
+    n = virtio_config_get_guest_notifier(vdev);
+    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
 undo:
     vq = virtio_vector_first_queue(vdev, vector);
     while (vq && unmasked >= 0) {
@@ -957,6 +977,11 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
         }
         vq = virtio_vector_next_queue(vq);
     }
+
+    if (vector == vdev->config_vector) {
+        n = virtio_config_get_guest_notifier(vdev);
+        virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
+    }
 }
 
 static void virtio_pci_vector_poll(PCIDevice *dev,
@@ -988,6 +1013,34 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
             msix_set_pending(dev, vector);
         }
     }
+    /* poll the config intr */
+    ret = virtio_pci_get_notifier(proxy, VIRTIO_CONFIG_IRQ_IDX, &notifier,
+                                  &vector);
+    if (ret < 0) {
+        return;
+    }
+    if (vector < vector_start || vector >= vector_end ||
+        !msix_is_masked(dev, vector)) {
+        return;
+    }
+    if (k->guest_notifier_pending) {
+        if (k->guest_notifier_pending(vdev, VIRTIO_CONFIG_IRQ_IDX)) {
+            msix_set_pending(dev, vector);
+        }
+    } else if (event_notifier_test_and_clear(notifier)) {
+        msix_set_pending(dev, vector);
+    }
+}
+
+void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
+                                              int n, bool assign,
+                                              bool with_irqfd)
+{
+    if (n == VIRTIO_CONFIG_IRQ_IDX) {
+        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
+    } else {
+        virtio_queue_set_guest_notifier_fd_handler(vq, assign, with_irqfd);
+    }
 }
 
 static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
@@ -996,17 +1049,25 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
     VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
-    VirtQueue *vq = virtio_get_queue(vdev, n);
-    EventNotifier *notifier = virtio_queue_get_guest_notifier(vq);
+    VirtQueue *vq = NULL;
+    EventNotifier *notifier = NULL;
+
+    if (n == VIRTIO_CONFIG_IRQ_IDX) {
+        notifier = virtio_config_get_guest_notifier(vdev);
+    } else {
+        vq = virtio_get_queue(vdev, n);
+        notifier = virtio_queue_get_guest_notifier(vq);
+    }
 
     if (assign) {
         int r = event_notifier_init(notifier, 0);
         if (r < 0) {
             return r;
         }
-        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
+        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, true, with_irqfd);
     } else {
-        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
+        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, false,
+                                                 with_irqfd);
         event_notifier_cleanup(notifier);
     }
 
@@ -1047,7 +1108,8 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
     if ((proxy->vector_irqfd || k->guest_notifier_mask) && !assign) {
         msix_unset_vector_notifiers(&proxy->pci_dev);
         if (proxy->vector_irqfd) {
-            kvm_virtio_pci_vector_release(proxy, nvqs);
+            kvm_virtio_pci_vector_vq_release(proxy, nvqs);
+            kvm_virtio_pci_vector_config_release(proxy);
             g_free(proxy->vector_irqfd);
             proxy->vector_irqfd = NULL;
         }
@@ -1063,20 +1125,28 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
             goto assign_error;
         }
     }
-
+    r = virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, assign,
+                                      with_irqfd);
+    if (r < 0) {
+        goto config_assign_error;
+    }
     /* Must set vector notifier after guest notifier has been assigned */
     if ((with_irqfd || k->guest_notifier_mask) && assign) {
         if (with_irqfd) {
             proxy->vector_irqfd =
                 g_malloc0(sizeof(*proxy->vector_irqfd) *
                           msix_nr_vectors_allocated(&proxy->pci_dev));
-            r = kvm_virtio_pci_vector_use(proxy, nvqs);
+            r = kvm_virtio_pci_vector_vq_use(proxy, nvqs);
+            if (r < 0) {
+                goto config_assign_error;
+            }
+            r = kvm_virtio_pci_vector_config_use(proxy);
             if (r < 0) {
-                goto assign_error;
+                goto config_error;
             }
         }
-        r = msix_set_vector_notifiers(&proxy->pci_dev,
-                                      virtio_pci_vector_unmask,
+
+        r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
                                       virtio_pci_vector_poll);
         if (r < 0) {
@@ -1089,9 +1159,15 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
 notifiers_error:
     if (with_irqfd) {
         assert(assign);
-        kvm_virtio_pci_vector_release(proxy, nvqs);
+        kvm_virtio_pci_vector_vq_release(proxy, nvqs);
     }
-
+config_error:
+    if (with_irqfd) {
+        kvm_virtio_pci_vector_config_release(proxy);
+    }
+config_assign_error:
+    virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
+                                  with_irqfd);
 assign_error:
     /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
     assert(assign);
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 2446dcd9ae..b704acc5a8 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -251,5 +251,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
  * @fixed_queues.
  */
 unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
-
+void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
+                                              int n, bool assign,
+                                              bool with_irqfd);
 #endif
-- 
2.34.3


