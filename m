Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050FC48657C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:46:45 +0100 (CET)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5T6K-0006gw-2h
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:46:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se2-0004w0-Su
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdp-0000sT-Lf
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GNYsEEAwxi469lEgq3C6J6IxF3dZC/8ISDUNssUi2gE=;
 b=FZaiQqu3m7wkeu834JR59fLDeMOgca51rdNs7HLXszhBeKGTCpKwKM3jM7NeuANMEjcHgt
 8lOFIOv7DwpdFoo4qDU/qRtGVVj8ChdnyDKQBZTGseu2+D2LxOVV5CPMTwDc/9+CUuZBD4
 Ew+xgnjVcDGcOQhHsh4H7zLIRlVwpGg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-Iq_2RQifP2WC9tn7_r8Jiw-1; Thu, 06 Jan 2022 08:17:16 -0500
X-MC-Unique: Iq_2RQifP2WC9tn7_r8Jiw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b003458e02cea0so3056553wms.7
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GNYsEEAwxi469lEgq3C6J6IxF3dZC/8ISDUNssUi2gE=;
 b=CWaqN/GrNm28d8J0w7SUxbqAD0hXH1Ski+46fRJ4ySlgkqiKqoIfVDjG4gRet2gbqF
 H2bgp5egqXkBT7CTkO72jBLKhEbtVKzmVcNx8Q03tNPJgf9Wm2w65ChO0G+EZ1Ig1yJk
 4TmiMD33BaSiu9iRj9ZMszadX5Z/W4ngBtTS+VmqUuZcZ5USTw591W2N9cBJVgKELUer
 7DfuJXE/fhim5CKY/ytDPVUPwQt6Ra+ox9HUw8WDS7VLLq2Vra8RI+B6TrRZBlInjSmk
 7V6m5yUpNGcInQPlsCkq/xc4IxFssWMIPCSOwFubJ/PfzjtgjB9lJSvPlojX3akWmBFR
 S6oQ==
X-Gm-Message-State: AOAM531HSRk6KsQoixNt5JyCa5bodmSbRaRjaIR3yYKpQPDm+G3I+RaC
 hb2sosoac7FSFPdr9wEYabXrBB3Vn6siwPGIzpRAV04qbSmv87MLVslFsIAaATUyAJNhPbxz31n
 D3dmjWg1mPhD1AlPOxBDfK8BT8DbggfAIGqWTRHDac214jDPlDTY1BYS7VKUi
X-Received: by 2002:a1c:c915:: with SMTP id f21mr7025903wmb.39.1641475034563; 
 Thu, 06 Jan 2022 05:17:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXN2izkP2/nfk3gipiajRLps1XFnY5zfX1HsUrjCwjVYfQq5I/Lk76BXscep7/ySY4LzkJHw==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr7025879wmb.39.1641475034165; 
 Thu, 06 Jan 2022 05:17:14 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id j11sm2285977wmq.23.2022.01.06.05.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:13 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/52] vhost: stick to -errno error return convention
Message-ID: <20220106131534.423671-22-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

The generic vhost code expects that many of the VhostOps methods in the
respective backends set errno on errors.  However, none of the existing
backends actually bothers to do so.  In a number of those methods errno
from the failed call is clobbered by successful later calls to some
library functions; on a few code paths the generic vhost code then
negates and returns that errno, thus making failures look as successes
to the caller.

As a result, in certain scenarios (e.g. live migration) the device
doesn't notice the first failure and goes on through its state
transitions as if everything is ok, instead of taking recovery actions
(break and reestablish the vhost-user connection, cancel migration, etc)
before it's too late.

To fix this, consolidate on the convention to return negated errno on
failures throughout generic vhost, and use it for error propagation.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-10-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 100 +++++++++++++++++++++-------------------------
 1 file changed, 46 insertions(+), 54 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 98a4b0a0df..cbf3b792da 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -33,11 +33,13 @@
 #define _VHOST_DEBUG 1
 
 #ifdef _VHOST_DEBUG
-#define VHOST_OPS_DEBUG(fmt, ...) \
-    do { error_report(fmt ": %s (%d)", ## __VA_ARGS__, \
-                      strerror(errno), errno); } while (0)
+#define VHOST_OPS_DEBUG(retval, fmt, ...) \
+    do { \
+        error_report(fmt ": %s (%d)", ## __VA_ARGS__, \
+                     strerror(-retval), -retval); \
+    } while (0)
 #else
-#define VHOST_OPS_DEBUG(fmt, ...) \
+#define VHOST_OPS_DEBUG(retval, fmt, ...) \
     do { } while (0)
 #endif
 
@@ -297,7 +299,7 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
        releasing the current log, to ensure no logging is lost */
     r = dev->vhost_ops->vhost_set_log_base(dev, log_base, log);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_set_log_base failed");
+        VHOST_OPS_DEBUG(r, "vhost_set_log_base failed");
     }
 
     vhost_log_put(dev, true);
@@ -550,7 +552,7 @@ static void vhost_commit(MemoryListener *listener)
     if (!dev->log_enabled) {
         r = dev->vhost_ops->vhost_set_mem_table(dev, dev->mem);
         if (r < 0) {
-            VHOST_OPS_DEBUG("vhost_set_mem_table failed");
+            VHOST_OPS_DEBUG(r, "vhost_set_mem_table failed");
         }
         goto out;
     }
@@ -564,7 +566,7 @@ static void vhost_commit(MemoryListener *listener)
     }
     r = dev->vhost_ops->vhost_set_mem_table(dev, dev->mem);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_set_mem_table failed");
+        VHOST_OPS_DEBUG(r, "vhost_set_mem_table failed");
     }
     /* To log less, can only decrease log size after table update. */
     if (dev->log_size > log_size + VHOST_LOG_BUFFER) {
@@ -803,8 +805,8 @@ static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
     if (dev->vhost_ops->vhost_vq_get_addr) {
         r = dev->vhost_ops->vhost_vq_get_addr(dev, &addr, vq);
         if (r < 0) {
-            VHOST_OPS_DEBUG("vhost_vq_get_addr failed");
-            return -errno;
+            VHOST_OPS_DEBUG(r, "vhost_vq_get_addr failed");
+            return r;
         }
     } else {
         addr.desc_user_addr = (uint64_t)(unsigned long)vq->desc;
@@ -816,10 +818,9 @@ static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
     addr.flags = enable_log ? (1 << VHOST_VRING_F_LOG) : 0;
     r = dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_set_vring_addr failed");
-        return -errno;
+        VHOST_OPS_DEBUG(r, "vhost_set_vring_addr failed");
     }
-    return 0;
+    return r;
 }
 
 static int vhost_dev_set_features(struct vhost_dev *dev,
@@ -840,19 +841,19 @@ static int vhost_dev_set_features(struct vhost_dev *dev,
     }
     r = dev->vhost_ops->vhost_set_features(dev, features);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_set_features failed");
+        VHOST_OPS_DEBUG(r, "vhost_set_features failed");
         goto out;
     }
     if (dev->vhost_ops->vhost_set_backend_cap) {
         r = dev->vhost_ops->vhost_set_backend_cap(dev);
         if (r < 0) {
-            VHOST_OPS_DEBUG("vhost_set_backend_cap failed");
+            VHOST_OPS_DEBUG(r, "vhost_set_backend_cap failed");
             goto out;
         }
     }
 
 out:
-    return r < 0 ? -errno : 0;
+    return r;
 }
 
 static int vhost_dev_set_log(struct vhost_dev *dev, bool enable_log)
@@ -999,22 +1000,17 @@ static int vhost_virtqueue_set_vring_endian_legacy(struct vhost_dev *dev,
                                                    bool is_big_endian,
                                                    int vhost_vq_index)
 {
+    int r;
     struct vhost_vring_state s = {
         .index = vhost_vq_index,
         .num = is_big_endian
     };
 
-    if (!dev->vhost_ops->vhost_set_vring_endian(dev, &s)) {
-        return 0;
+    r = dev->vhost_ops->vhost_set_vring_endian(dev, &s);
+    if (r < 0) {
+        VHOST_OPS_DEBUG(r, "vhost_set_vring_endian failed");
     }
-
-    VHOST_OPS_DEBUG("vhost_set_vring_endian failed");
-    if (errno == ENOTTY) {
-        error_report("vhost does not support cross-endian");
-        return -ENOSYS;
-    }
-
-    return -errno;
+    return r;
 }
 
 static int vhost_memory_region_lookup(struct vhost_dev *hdev,
@@ -1106,15 +1102,15 @@ static int vhost_virtqueue_start(struct vhost_dev *dev,
     vq->num = state.num = virtio_queue_get_num(vdev, idx);
     r = dev->vhost_ops->vhost_set_vring_num(dev, &state);
     if (r) {
-        VHOST_OPS_DEBUG("vhost_set_vring_num failed");
-        return -errno;
+        VHOST_OPS_DEBUG(r, "vhost_set_vring_num failed");
+        return r;
     }
 
     state.num = virtio_queue_get_last_avail_idx(vdev, idx);
     r = dev->vhost_ops->vhost_set_vring_base(dev, &state);
     if (r) {
-        VHOST_OPS_DEBUG("vhost_set_vring_base failed");
-        return -errno;
+        VHOST_OPS_DEBUG(r, "vhost_set_vring_base failed");
+        return r;
     }
 
     if (vhost_needs_vring_endian(vdev)) {
@@ -1122,7 +1118,7 @@ static int vhost_virtqueue_start(struct vhost_dev *dev,
                                                     virtio_is_big_endian(vdev),
                                                     vhost_vq_index);
         if (r) {
-            return -errno;
+            return r;
         }
     }
 
@@ -1150,15 +1146,13 @@ static int vhost_virtqueue_start(struct vhost_dev *dev,
 
     r = vhost_virtqueue_set_addr(dev, vq, vhost_vq_index, dev->log_enabled);
     if (r < 0) {
-        r = -errno;
         goto fail_alloc;
     }
 
     file.fd = event_notifier_get_fd(virtio_queue_get_host_notifier(vvq));
     r = dev->vhost_ops->vhost_set_vring_kick(dev, &file);
     if (r) {
-        VHOST_OPS_DEBUG("vhost_set_vring_kick failed");
-        r = -errno;
+        VHOST_OPS_DEBUG(r, "vhost_set_vring_kick failed");
         goto fail_kick;
     }
 
@@ -1218,7 +1212,7 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
 
     r = dev->vhost_ops->vhost_get_vring_base(dev, &state);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost VQ %u ring restore failed: %d", idx, r);
+        VHOST_OPS_DEBUG(r, "vhost VQ %u ring restore failed: %d", idx, r);
         /* Connection to the backend is broken, so let's sync internal
          * last avail idx to the device used idx.
          */
@@ -1274,7 +1268,7 @@ static int vhost_virtqueue_set_busyloop_timeout(struct vhost_dev *dev,
 
     r = dev->vhost_ops->vhost_set_vring_busyloop_timeout(dev, &state);
     if (r) {
-        VHOST_OPS_DEBUG("vhost_set_vring_busyloop_timeout failed");
+        VHOST_OPS_DEBUG(r, "vhost_set_vring_busyloop_timeout failed");
         return r;
     }
 
@@ -1296,8 +1290,7 @@ static int vhost_virtqueue_init(struct vhost_dev *dev,
     file.fd = event_notifier_get_fd(&vq->masked_notifier);
     r = dev->vhost_ops->vhost_set_vring_call(dev, &file);
     if (r) {
-        VHOST_OPS_DEBUG("vhost_set_vring_call failed");
-        r = -errno;
+        VHOST_OPS_DEBUG(r, "vhost_set_vring_call failed");
         goto fail_call;
     }
 
@@ -1557,7 +1550,7 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     file.index = hdev->vhost_ops->vhost_get_vq_index(hdev, n);
     r = hdev->vhost_ops->vhost_set_vring_call(hdev, &file);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_set_vring_call failed");
+        VHOST_OPS_DEBUG(r, "vhost_set_vring_call failed");
     }
 }
 
@@ -1595,7 +1588,7 @@ void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask)
     }
     r = hdev->vhost_ops->vhost_set_config_call(hdev, fd);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_set_config_call failed");
+        VHOST_OPS_DEBUG(r, "vhost_set_config_call failed");
     }
 }
 
@@ -1660,7 +1653,7 @@ int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
     }
 
     error_setg(errp, "vhost_get_config not implemented");
-    return -ENOTSUP;
+    return -ENOSYS;
 }
 
 int vhost_dev_set_config(struct vhost_dev *hdev, const uint8_t *data,
@@ -1673,7 +1666,7 @@ int vhost_dev_set_config(struct vhost_dev *hdev, const uint8_t *data,
                                                  size, flags);
     }
 
-    return -1;
+    return -ENOSYS;
 }
 
 void vhost_dev_set_config_notifier(struct vhost_dev *hdev,
@@ -1702,7 +1695,7 @@ static int vhost_dev_resize_inflight(struct vhost_inflight *inflight,
 
     if (err) {
         error_report_err(err);
-        return -1;
+        return -ENOMEM;
     }
 
     vhost_dev_free_inflight(inflight);
@@ -1735,8 +1728,9 @@ int vhost_dev_load_inflight(struct vhost_inflight *inflight, QEMUFile *f)
     }
 
     if (inflight->size != size) {
-        if (vhost_dev_resize_inflight(inflight, size)) {
-            return -1;
+        int ret = vhost_dev_resize_inflight(inflight, size);
+        if (ret < 0) {
+            return ret;
         }
     }
     inflight->queue_size = qemu_get_be16(f);
@@ -1759,7 +1753,7 @@ int vhost_dev_prepare_inflight(struct vhost_dev *hdev, VirtIODevice *vdev)
 
     r = vhost_dev_set_features(hdev, hdev->log_enabled);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_dev_prepare_inflight failed");
+        VHOST_OPS_DEBUG(r, "vhost_dev_prepare_inflight failed");
         return r;
     }
 
@@ -1774,8 +1768,8 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,
     if (dev->vhost_ops->vhost_set_inflight_fd && inflight->addr) {
         r = dev->vhost_ops->vhost_set_inflight_fd(dev, inflight);
         if (r) {
-            VHOST_OPS_DEBUG("vhost_set_inflight_fd failed");
-            return -errno;
+            VHOST_OPS_DEBUG(r, "vhost_set_inflight_fd failed");
+            return r;
         }
     }
 
@@ -1790,8 +1784,8 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
     if (dev->vhost_ops->vhost_get_inflight_fd) {
         r = dev->vhost_ops->vhost_get_inflight_fd(dev, queue_size, inflight);
         if (r) {
-            VHOST_OPS_DEBUG("vhost_get_inflight_fd failed");
-            return -errno;
+            VHOST_OPS_DEBUG(r, "vhost_get_inflight_fd failed");
+            return r;
         }
     }
 
@@ -1820,8 +1814,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
 
     r = hdev->vhost_ops->vhost_set_mem_table(hdev, hdev->mem);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_set_mem_table failed");
-        r = -errno;
+        VHOST_OPS_DEBUG(r, "vhost_set_mem_table failed");
         goto fail_mem;
     }
     for (i = 0; i < hdev->nvqs; ++i) {
@@ -1855,8 +1848,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
                                                 hdev->log_size ? log_base : 0,
                                                 hdev->log);
         if (r < 0) {
-            VHOST_OPS_DEBUG("vhost_set_log_base failed");
-            r = -errno;
+            VHOST_OPS_DEBUG(r, "vhost_set_log_base failed");
             goto fail_log;
         }
     }
@@ -1936,5 +1928,5 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
         return hdev->vhost_ops->vhost_net_set_backend(hdev, file);
     }
 
-    return -1;
+    return -ENOSYS;
 }
-- 
MST


