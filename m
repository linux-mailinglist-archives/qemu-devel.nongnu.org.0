Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B378649548
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 18:23:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Q1K-0003mx-Cg; Sun, 11 Dec 2022 12:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p4Q1I-0003mS-3h
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 12:21:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p4Q1G-00076v-HL
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 12:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670779301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZF3KlE0DGyX5waHjyryIvuGvXx3VCTFhLkU4ZQk37Q=;
 b=B0GqQiNAWHgXG3OlCuxkINQr5JHDn5iY2JgSspkKCbAcuXjA/sEtqcFfuDSZKzSqW3xB5x
 ExffPMXZrgTeWHuRcRYSQOW1TEuLL0TWzlsirIHgWOws0XTkXEircO3yq3W7E9bUihqF8b
 qrrpivFszxkNkBCvzzzyzOP+C1JsyL8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-Rb4bHdqUO_C3LO0dQE4LQA-1; Sun, 11 Dec 2022 12:21:34 -0500
X-MC-Unique: Rb4bHdqUO_C3LO0dQE4LQA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F06F802A6A
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 17:21:34 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-92.pek2.redhat.com [10.72.12.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9443492CA2;
 Sun, 11 Dec 2022 17:21:32 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v20 07/10] vhost: add support for configure interrupt
Date: Mon, 12 Dec 2022 01:20:39 +0800
Message-Id: <20221211172042.3969410-8-lulu@redhat.com>
In-Reply-To: <20221211172042.3969410-1-lulu@redhat.com>
References: <20221211172042.3969410-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Add functions to support configure interrupt.
The configure interrupt process will start in vhost_dev_start
and stop in vhost_dev_stop.

Also add the functions to support vhost_config_pending and
vhost_config_mask.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost.c         | 78 ++++++++++++++++++++++++++++++++++++++-
 include/hw/virtio/vhost.h |  4 ++
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7fb008bc9e..84dbb39e07 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1596,7 +1596,68 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     file.index = hdev->vhost_ops->vhost_get_vq_index(hdev, n);
     r = hdev->vhost_ops->vhost_set_vring_call(hdev, &file);
     if (r < 0) {
-        VHOST_OPS_DEBUG(r, "vhost_set_vring_call failed");
+        error_report("vhost_set_vring_call failed %d", -r);
+    }
+}
+
+bool vhost_config_pending(struct vhost_dev *hdev)
+{
+    assert(hdev->vhost_ops);
+    if ((hdev->started == false) ||
+        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
+        return false;
+    }
+
+    EventNotifier *notifier =
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier;
+    return event_notifier_test_and_clear(notifier);
+}
+
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask)
+{
+    int fd;
+    int r;
+    EventNotifier *notifier =
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier;
+    EventNotifier *config_notifier = &vdev->config_notifier;
+    assert(hdev->vhost_ops);
+
+    if ((hdev->started == false) ||
+        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
+        return;
+    }
+    if (mask) {
+        assert(vdev->use_guest_notifier_mask);
+        fd = event_notifier_get_fd(notifier);
+    } else {
+        fd = event_notifier_get_fd(config_notifier);
+    }
+    r = hdev->vhost_ops->vhost_set_config_call(hdev, fd);
+    if (r < 0) {
+        error_report("vhost_set_config_call failed %d", -r);
+    }
+}
+
+static void vhost_stop_config_intr(struct vhost_dev *dev)
+{
+    int fd = -1;
+    assert(dev->vhost_ops);
+    if (dev->vhost_ops->vhost_set_config_call) {
+        dev->vhost_ops->vhost_set_config_call(dev, fd);
+    }
+}
+
+static void vhost_start_config_intr(struct vhost_dev *dev)
+{
+    int r;
+
+    assert(dev->vhost_ops);
+    int fd = event_notifier_get_fd(&dev->vdev->config_notifier);
+    if (dev->vhost_ops->vhost_set_config_call) {
+        r = dev->vhost_ops->vhost_set_config_call(dev, fd);
+        if (!r) {
+            event_notifier_set(&dev->vdev->config_notifier);
+        }
     }
 }
 
@@ -1836,6 +1897,16 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
         }
     }
 
+    r = event_notifier_init(
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier, 0);
+    if (r < 0) {
+        return r;
+    }
+    event_notifier_test_and_clear(
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
+    if (!vdev->use_guest_notifier_mask) {
+        vhost_config_mask(hdev, vdev, true);
+    }
     if (hdev->log_enabled) {
         uint64_t log_base;
 
@@ -1874,6 +1945,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
             vhost_device_iotlb_miss(hdev, vq->used_phys, true);
         }
     }
+    vhost_start_config_intr(hdev);
     return 0;
 fail_start:
     if (vrings) {
@@ -1903,6 +1975,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
+    event_notifier_test_and_clear(
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
+    event_notifier_test_and_clear(&vdev->config_notifier);
 
     trace_vhost_dev_stop(hdev, vdev->name, vrings);
 
@@ -1925,6 +2000,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
         }
         memory_listener_unregister(&hdev->iommu_listener);
     }
+    vhost_stop_config_intr(hdev);
     vhost_log_put(hdev, true);
     hdev->started = false;
     vdev->vhost_started = false;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 67a6807fac..05bedb2416 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -33,6 +33,7 @@ struct vhost_virtqueue {
     unsigned used_size;
     EventNotifier masked_notifier;
     EventNotifier error_notifier;
+    EventNotifier masked_config_notifier;
     struct vhost_dev *dev;
 };
 
@@ -41,6 +42,7 @@ typedef unsigned long vhost_log_chunk_t;
 #define VHOST_LOG_BITS (8 * sizeof(vhost_log_chunk_t))
 #define VHOST_LOG_CHUNK (VHOST_LOG_PAGE * VHOST_LOG_BITS)
 #define VHOST_INVALID_FEATURE_BIT   (0xff)
+#define VHOST_QUEUE_NUM_CONFIG_INR 0
 
 struct vhost_log {
     unsigned long long size;
@@ -168,6 +170,8 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
  * Disable direct notifications to vhost device.
  */
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
+bool vhost_config_pending(struct vhost_dev *hdev);
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask);
 
 /**
  * vhost_dev_is_started() - report status of vhost device
-- 
2.34.3


