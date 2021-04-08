Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6F9357FD4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:47:56 +0200 (CEST)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURGV-0006Rj-9w
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lUR7r-0006wf-8q
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lUR7p-0004Si-HN
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3D5QWsXrt8U2q7hGTy+r4bnjPeVicLH5vwZ7t4sdQw4=;
 b=FWoTSHrrTAV9NKb3oOvCv889z3U0HephAg7Gu+cBAd+UuRoNVz5kZvIJ6+zx39nymbUHQd
 CGrT6fY7ZUIedx2EzAZL6ptOmCJ9YqIJ3+9eufaiGV1PNua7rX3pEHs1Xc6vEqyY7i64O4
 xzgvcO8b5Uf6QMcifT786vWLwtdqe00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-LnEoei9lPOCk_OT3WNkxtw-1; Thu, 08 Apr 2021 05:38:55 -0400
X-MC-Unique: LnEoei9lPOCk_OT3WNkxtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1EAF1006C87
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 09:38:54 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-72.pek2.redhat.com [10.72.13.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA825D9DC;
 Thu,  8 Apr 2021 09:38:48 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v5 6/6] virtio-pci: add support for configure interrupt
Date: Thu,  8 Apr 2021 17:38:24 +0800
Message-Id: <20210408093824.14985-7-lulu@redhat.com>
In-Reply-To: <20210408093824.14985-1-lulu@redhat.com>
References: <20210408093824.14985-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 hw/virtio/virtio-pci.c | 91 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 481f6e7505..7b02f42c06 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -664,7 +664,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
 }
 
 static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
-                                        unsigned int queue_no,
                                         unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
@@ -726,7 +725,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
         if (vector >= msix_nr_vectors_allocated(dev)) {
             continue;
         }
-        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
+        ret = kvm_virtio_pci_vq_vector_use(proxy,  vector);
         if (ret < 0) {
             goto undo;
         }
@@ -760,6 +759,56 @@ undo:
     }
     return ret;
 }
+static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
+{
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    unsigned int vector;
+    int ret;
+    EventNotifier *n = virtio_get_config_notifier(vdev);
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
 
 static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
 {
@@ -858,6 +907,14 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
     EventNotifier *n;
     int ret, index, unmasked = 0;
 
+   if (vdev->use_config_notifier == true) {
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
@@ -889,6 +946,10 @@ undo:
         }
         vq = virtio_vector_next_queue(vq);
     }
+ config_undo:
+            n = virtio_get_config_notifier(vdev);
+            virtio_pci_vq_vector_mask(proxy, 0, vector,
+                VIRTIO_CONFIG_VECTOR, n);
     return ret;
 }
 
@@ -900,6 +961,10 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
     EventNotifier *n;
     int index;
 
+   if (vdev->use_config_notifier == true) {
+        n = virtio_get_config_notifier(vdev);
+        virtio_pci_vq_vector_mask(proxy, 0, vector, VIRTIO_CONFIG_VECTOR, n);
+   }
     while (vq) {
         index = virtio_get_queue_index(vq);
          n = virtio_queue_get_guest_notifier(vq);
@@ -945,6 +1010,21 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
             msix_set_pending(dev, vector);
         }
     }
+   if (vdev->use_config_notifier == true) {
+        vector = vdev->config_vector;
+        notifier = virtio_get_config_notifier(vdev);
+        if (vector < vector_start || vector >= vector_end ||
+            !msix_is_masked(dev, vector)) {
+            return;
+        }
+        if (k->guest_notifier_pending) {
+            if (k->guest_notifier_pending(vdev, 0,  VIRTIO_CONFIG_VECTOR)) {
+                msix_set_pending(dev, vector);
+            }
+        } else if (event_notifier_test_and_clear(notifier)) {
+            msix_set_pending(dev, vector);
+        }
+    }
 }
 
 static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
@@ -1032,6 +1112,10 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
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
@@ -1048,7 +1132,8 @@ notifiers_error:
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


