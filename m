Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C857B72C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:19:16 +0200 (CEST)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9bf-0004eC-Hq
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9VX-0006eQ-2Y
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9VV-0006wK-ET
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658322772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zr8daBgJSlOzInqXOIfMFbdj8y2C0a3oO1QsNwO7MfQ=;
 b=SJPGrhd6CoFPpWjBk59eEfud+JW1Sm/QWtIQQnnuVQrcKt7jp4FKtetYluESNUlco03VWs
 ElqARkVE9KqBjmVPqWf3apsKAzsTmvgBpli5Bmp8JtLdqpujORX9HxEvFyIkMyPThoK9nK
 kXmABZzMCfVYu47V0lqJ8TGDiQqHnuM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-g-REDt89NfaTnInxsZk3qg-1; Wed, 20 Jul 2022 09:12:44 -0400
X-MC-Unique: g-REDt89NfaTnInxsZk3qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCDF18037AA;
 Wed, 20 Jul 2022 13:12:43 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08BCDC28100;
 Wed, 20 Jul 2022 13:12:39 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v13 07/10] vhost: add support for configure interrupt
Date: Wed, 20 Jul 2022 21:12:01 +0800
Message-Id: <20220720131204.591104-8-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
index b643f42ea4..e23be58d69 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1550,7 +1550,68 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
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
 
@@ -1766,6 +1827,16 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
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
 
@@ -1798,6 +1869,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             vhost_device_iotlb_miss(hdev, vq->used_phys, true);
         }
     }
+    vhost_start_config_intr(hdev);
     return 0;
 fail_log:
     vhost_log_put(hdev, false);
@@ -1823,6 +1895,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
+    event_notifier_test_and_clear(
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
+    event_notifier_test_and_clear(&vdev->config_notifier);
 
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
@@ -1840,6 +1915,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
         }
         memory_listener_unregister(&hdev->iommu_listener);
     }
+    vhost_stop_config_intr(hdev);
     vhost_log_put(hdev, true);
     hdev->started = false;
     hdev->vdev = NULL;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 58a73e7b7a..b0f3b78987 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -29,6 +29,7 @@ struct vhost_virtqueue {
     unsigned long long used_phys;
     unsigned used_size;
     EventNotifier masked_notifier;
+    EventNotifier masked_config_notifier;
     struct vhost_dev *dev;
 };
 
@@ -37,6 +38,7 @@ typedef unsigned long vhost_log_chunk_t;
 #define VHOST_LOG_BITS (8 * sizeof(vhost_log_chunk_t))
 #define VHOST_LOG_CHUNK (VHOST_LOG_PAGE * VHOST_LOG_BITS)
 #define VHOST_INVALID_FEATURE_BIT   (0xff)
+#define VHOST_QUEUE_NUM_CONFIG_INR 0
 
 struct vhost_log {
     unsigned long long size;
@@ -116,6 +118,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
+bool vhost_config_pending(struct vhost_dev *hdev);
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask);
 
 /* Test and clear masked event pending status.
  * Should be called after unmask to avoid losing events.
-- 
2.34.3


