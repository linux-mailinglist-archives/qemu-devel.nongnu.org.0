Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39C57F396
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 09:05:51 +0200 (CEST)
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFVgU-0004qA-9m
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 03:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oFVNF-0004q0-7V
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 02:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oFVND-0003Pw-Hs
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 02:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658645155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRu8AIzOUJBaLnDj6qqh50rHCDucqt8y2AAF1zCpofM=;
 b=X8IT7j+E4/O57OhPFVOHLTtPyWX33Xjwx3Az7tYZoQ+IBKacqUkVV4RzoJQhdtRxKpAZK2
 HfHeFYUUTnWVPzWeQyH06uhvzy/7I1cS3/jCNPqcN/RVUTRM1aNCxCv69UrzUBRy4ozIf2
 x/3/r3mAkdINo2oMY7pzzYm56v6Inxs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-pj3JL2ZrM2OshIle55lPfw-1; Sun, 24 Jul 2022 02:45:53 -0400
X-MC-Unique: pj3JL2ZrM2OshIle55lPfw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4721285A581;
 Sun, 24 Jul 2022 06:45:53 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 765B4492CA2;
 Sun, 24 Jul 2022 06:45:49 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: qemu-devel@nongnu.org,
	lulu@redhat.com
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v15 07/10] vhost: add support for configure interrupt
Date: Sun, 24 Jul 2022 14:44:51 +0800
Message-Id: <20220724064454.875882-8-lulu@redhat.com>
In-Reply-To: <20220724064454.875882-1-lulu@redhat.com>
References: <20220724064454.875882-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
index 0827d631c0..4479b4c94a 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1590,7 +1590,68 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
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
 
@@ -1807,6 +1868,16 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
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
 
@@ -1839,6 +1910,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             vhost_device_iotlb_miss(hdev, vq->used_phys, true);
         }
     }
+    vhost_start_config_intr(hdev);
     return 0;
 fail_log:
     vhost_log_put(hdev, false);
@@ -1864,6 +1936,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
+    event_notifier_test_and_clear(
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
+    event_notifier_test_and_clear(&vdev->config_notifier);
 
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
@@ -1881,6 +1956,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
         }
         memory_listener_unregister(&hdev->iommu_listener);
     }
+    vhost_stop_config_intr(hdev);
     vhost_log_put(hdev, true);
     hdev->started = false;
     vdev->vhost_started = false;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..3b336a15e3 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -30,6 +30,7 @@ struct vhost_virtqueue {
     unsigned used_size;
     EventNotifier masked_notifier;
     EventNotifier error_notifier;
+    EventNotifier masked_config_notifier;
     struct vhost_dev *dev;
 };
 
@@ -38,6 +39,7 @@ typedef unsigned long vhost_log_chunk_t;
 #define VHOST_LOG_BITS (8 * sizeof(vhost_log_chunk_t))
 #define VHOST_LOG_CHUNK (VHOST_LOG_PAGE * VHOST_LOG_BITS)
 #define VHOST_INVALID_FEATURE_BIT   (0xff)
+#define VHOST_QUEUE_NUM_CONFIG_INR 0
 
 struct vhost_log {
     unsigned long long size;
@@ -161,6 +163,8 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
  * Disable direct notifications to vhost device.
  */
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
+bool vhost_config_pending(struct vhost_dev *hdev);
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask);
 
 /**
  * vhost_dev_start() - start the vhost device
-- 
2.34.3


