Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A1344D96B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:47:41 +0100 (CET)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCIe-0002IP-C3
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5h-0004cS-3D; Thu, 11 Nov 2021 10:34:17 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:48368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5e-00044C-23; Thu, 11 Nov 2021 10:34:16 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 41B9D2E0F6E;
 Thu, 11 Nov 2021 18:34:06 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 c3WBMO1KcF-Y5s0e4DT; Thu, 11 Nov 2021 18:34:06 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636644846; bh=H5ae1KaSQ6RLgZGAVPFbHC6ECvPV0nhzPi2CANxWH7w=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=IPmTRYfi+GyrDJks9OUIDxegmewzFD16/ayAKqGAbwIf+CIKxfyQrwQjmdI27jrvC
 3A/e6n2/WOkyIhf7ps6goaeFykr4FhGU975dlr5t6OsyRhu2gJk4TW+YXrlrKpiNQh
 0RBWi5p9DxSbI4EEGP/idxPy64K2cUubuT/VmBuQ=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8830::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 WgGv8YbvMJ-Y5wCl215; Thu, 11 Nov 2021 18:34:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] vhost: stick to -errno error return convention
Date: Thu, 11 Nov 2021 18:33:53 +0300
Message-Id: <20211111153354.18807-10-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111153354.18807-1-rvkagan@yandex-team.ru>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/virtio/vhost.c | 98 ++++++++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 53 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 437347ad01..4f20d4a714 100644
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
 
@@ -1599,7 +1592,7 @@ int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
     }
 
     error_setg(errp, "vhost_get_config not implemented");
-    return -ENOTSUP;
+    return -ENOSYS;
 }
 
 int vhost_dev_set_config(struct vhost_dev *hdev, const uint8_t *data,
@@ -1612,7 +1605,7 @@ int vhost_dev_set_config(struct vhost_dev *hdev, const uint8_t *data,
                                                  size, flags);
     }
 
-    return -1;
+    return -ENOSYS;
 }
 
 void vhost_dev_set_config_notifier(struct vhost_dev *hdev,
@@ -1641,7 +1634,7 @@ static int vhost_dev_resize_inflight(struct vhost_inflight *inflight,
 
     if (err) {
         error_report_err(err);
-        return -1;
+        return -ENOMEM;
     }
 
     vhost_dev_free_inflight(inflight);
@@ -1674,8 +1667,9 @@ int vhost_dev_load_inflight(struct vhost_inflight *inflight, QEMUFile *f)
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
@@ -1698,7 +1692,7 @@ int vhost_dev_prepare_inflight(struct vhost_dev *hdev, VirtIODevice *vdev)
 
     r = vhost_dev_set_features(hdev, hdev->log_enabled);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_dev_prepare_inflight failed");
+        VHOST_OPS_DEBUG(r, "vhost_dev_prepare_inflight failed");
         return r;
     }
 
@@ -1713,8 +1707,8 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,
     if (dev->vhost_ops->vhost_set_inflight_fd && inflight->addr) {
         r = dev->vhost_ops->vhost_set_inflight_fd(dev, inflight);
         if (r) {
-            VHOST_OPS_DEBUG("vhost_set_inflight_fd failed");
-            return -errno;
+            VHOST_OPS_DEBUG(r, "vhost_set_inflight_fd failed");
+            return r;
         }
     }
 
@@ -1729,8 +1723,8 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
     if (dev->vhost_ops->vhost_get_inflight_fd) {
         r = dev->vhost_ops->vhost_get_inflight_fd(dev, queue_size, inflight);
         if (r) {
-            VHOST_OPS_DEBUG("vhost_get_inflight_fd failed");
-            return -errno;
+            VHOST_OPS_DEBUG(r, "vhost_get_inflight_fd failed");
+            return r;
         }
     }
 
@@ -1759,8 +1753,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
 
     r = hdev->vhost_ops->vhost_set_mem_table(hdev, hdev->mem);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_set_mem_table failed");
-        r = -errno;
+        VHOST_OPS_DEBUG(r, "vhost_set_mem_table failed");
         goto fail_mem;
     }
     for (i = 0; i < hdev->nvqs; ++i) {
@@ -1784,8 +1777,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
                                                 hdev->log_size ? log_base : 0,
                                                 hdev->log);
         if (r < 0) {
-            VHOST_OPS_DEBUG("vhost_set_log_base failed");
-            r = -errno;
+            VHOST_OPS_DEBUG(r, "vhost_set_log_base failed");
             goto fail_log;
         }
     }
@@ -1860,5 +1852,5 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
         return hdev->vhost_ops->vhost_net_set_backend(hdev, file);
     }
 
-    return -1;
+    return -ENOSYS;
 }
-- 
2.33.1


