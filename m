Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522C488058
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:13:21 +0100 (CET)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60IK-0003Zd-EF
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609P-0003RE-3N
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609N-0002L4-D3
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ETB+n0NhBVWLTVk31iuRnbCsPO0dzdop/Y6jcjDWEjk=;
 b=gjv+c/AFd1pLGzdqR6A4CBmvOlKBLXF3phahphiASbmOY3ptA1RhNmSz3VRWsifW/7rbdT
 tWAAbkGVjRdDQQ/VEsEyKPC14GDxKdGrm/LQYtIlKDpehXcAvZhRXFDzjafGFz902Z6nDn
 aT35kh3WkG7pfrVbxCSEtrnksTeld08=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-LeVdVsfUNUy-cuYZytl9tQ-1; Fri, 07 Jan 2022 20:04:04 -0500
X-MC-Unique: LeVdVsfUNUy-cuYZytl9tQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 v1-20020adfc5c1000000b001a37fd2fa2dso2342815wrg.22
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ETB+n0NhBVWLTVk31iuRnbCsPO0dzdop/Y6jcjDWEjk=;
 b=uuzWg3CBkCJepNkpOutRQM10lqfP/piJtH/JlNn6XW+bYwGxqSZoxKCUWeND0JYXZR
 Uma42YvDX6UH7kaX52STMz3LEA7piKeMv1RbuaCoAP5X3gNv/cEXHAsr17+htn0zGl8t
 pcW9eGXl4u8XAgzvtWYH0ksrLE/xtU7OYx2vNeJqxwjb+sM7YzhaAbeoUgxkThoXNu5w
 hDLSnM4Mrx2WfFvDZXql4if7nPxQyRs9V3UpivdxkQjNVd8LnalbCYLI+R2+jKLLCW1z
 8fIj1+hZcqS5i3wM492BA7z3E+r97kO5nJPGRL2Gfa92CD0QFFTg2cK+wOTSEePwIlkK
 Bfmw==
X-Gm-Message-State: AOAM533YN8Ik+ZfxQ0gJpVngN+7QgpDvEji1OI4e6bfCCyB/uFbCTglc
 fO57KnsQe0EKkKBcJPGiyj6RVfu65JfFYN9/8CAUBSa89zLKMxwOz8iJwVtuUV+GrsDQ/vgEuM/
 qCXZUwbq7DztZAivW+bEM0f8P1KNA7TBuiWKfaxIVLdyTeO5on/vcw0fIsvR8
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr55749009wrx.280.1641603842609; 
 Fri, 07 Jan 2022 17:04:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIyzSIxP7APPrEJYnLsnP6na2oHP+mwym+Ml6WwzAwv0wRdEMgamvM7GXBdrJvHaZw3xvhng==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr55748997wrx.280.1641603842414; 
 Fri, 07 Jan 2022 17:04:02 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id t6sm199361wrx.114.2022.01.07.17.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:02 -0800 (PST)
Date: Fri, 7 Jan 2022 20:03:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 09/55] vhost: add support for configure interrupt
Message-ID: <20220108003423.15830-10-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

Add functions to support configure interrupt.
The configure interrupt process will start in vhost_dev_start
and stop in vhost_dev_stop.

Also add the functions to support vhost_config_pending and
vhost_config_mask, for masked_config_notifier, we only
use the notifier saved in vq 0.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-8-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h |  4 +++
 hw/virtio/vhost.c         | 76 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

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
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 20913cf8fb..98a4b0a0df 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1561,6 +1561,67 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     }
 }
 
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
+        VHOST_OPS_DEBUG("vhost_set_config_call failed");
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
+    }
+}
+
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features)
 {
@@ -1773,6 +1834,16 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
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
 
@@ -1806,6 +1877,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             vhost_device_iotlb_miss(hdev, vq->used_phys, true);
         }
     }
+    vhost_start_config_intr(hdev);
     return 0;
 fail_log:
     vhost_log_put(hdev, false);
@@ -1831,6 +1903,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
+    event_notifier_test_and_clear(
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
+    event_notifier_test_and_clear(&vdev->config_notifier);
 
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
@@ -1848,6 +1923,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
         }
         memory_listener_unregister(&hdev->iommu_listener);
     }
+    vhost_stop_config_intr(hdev);
     vhost_log_put(hdev, true);
     hdev->started = false;
     hdev->vdev = NULL;
-- 
MST


