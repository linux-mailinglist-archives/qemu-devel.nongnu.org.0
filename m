Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C04EEC11
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:12:11 +0200 (CEST)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFCN-0000HZ-11
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:12:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naFAr-0007wj-8b
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:10:37 -0400
Received: from smtpbg139.qq.com ([175.27.65.136]:26771 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naFAm-00007n-K6
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:10:36 -0400
X-QQ-mid: bizesmtp66t1648811186ta0ihv8q
Received: from localhost.localdomain.localdoma ( [116.228.45.98])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 01 Apr 2022 19:06:22 +0800 (CST)
X-QQ-SSF: 01000000002000803000C00A0000000
X-QQ-FEAT: 3uawQE1sH+0knKo9XmHNVOZ0whvo5fUQuYRAfzvHZCXSqg9nG8Rwk3lWffKee
 p3KQ1cRjEfIPeUx0ptPNXXpORWljKdlabdSjosa18sp8kEpsqLJFs95mQGms2F70pWjPmq0
 k4YytYEJ9Potptpj7yNz8j0i0Q/M6X5jk1TrvHBJnpNOmRQbYrtTtqQ1jzSm7UbwKBGH10k
 WkUaO5i6cY4jP6eYmwJjfb8UCriw3S/5kE7BdCaT303+7aH1/goBJqhZt+YryL6HboPOHfT
 gAU9yXAnJOrQ3VwC1SVj04Bb1nIePcaaWrfNgL8AKqAVzLXQ58Bp70vI5qs3mN7F7vDXLRy
 jaYcsHabBwwkOZEldxQJYDvYy0MdQ==
X-QQ-GoodBg: 0
From: Michael Qiu <qiudayu@archeros.com>
To: jasowang@redhat.com,
	mst@redhat.com,
	si-wei.liu@oracle.com
Subject: [PATCH 1/3] vhost: Refactor vhost_reset_device() in VhostOps
Date: Fri,  1 Apr 2022 07:06:11 -0400
Message-Id: <1648811173-15293-2-git-send-email-qiudayu@archeros.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgspam:qybgspam6
Received-SPF: none client-ip=175.27.65.136; envelope-from=qiudayu@archeros.com;
 helo=smtpbg.qq.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Qiu <qiudayu@archeros.com>, eperezma@redhat.com,
 lingshan.zhu@intel.com, qemu-devel@nongnu.org, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently in vhost framwork, vhost_reset_device() is misnamed.
Actually, it should be vhost_reset_owner().

In vhost user, it make compatible with reset device ops, but
vhost kernel does not compatible with it, for vhost vdpa, it
only implement reset device action.

So we need seperate the function into vhost_reset_owner() and
vhost_reset_device(). So that different backend could use the
correct function.

Signde-off-by: Michael Qiu <qiudayu@archeros.com>
---
 hw/scsi/vhost-user-scsi.c         |  6 +++++-
 hw/virtio/vhost-backend.c         |  4 ++--
 hw/virtio/vhost-user.c            | 22 ++++++++++++++++++----
 include/hw/virtio/vhost-backend.h |  2 ++
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 1b2f7ee..f179626 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -80,8 +80,12 @@ static void vhost_user_scsi_reset(VirtIODevice *vdev)
         return;
     }
 
-    if (dev->vhost_ops->vhost_reset_device) {
+    if (virtio_has_feature(dev->protocol_features,
+                           VHOST_USER_PROTOCOL_F_RESET_DEVICE) &&
+                           dev->vhost_ops->vhost_reset_device) {
         dev->vhost_ops->vhost_reset_device(dev);
+    } else if (dev->vhost_ops->vhost_reset_owner) {
+        dev->vhost_ops->vhost_reset_owner(dev);
     }
 }
 
diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index e409a86..abbaa8b 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -191,7 +191,7 @@ static int vhost_kernel_set_owner(struct vhost_dev *dev)
     return vhost_kernel_call(dev, VHOST_SET_OWNER, NULL);
 }
 
-static int vhost_kernel_reset_device(struct vhost_dev *dev)
+static int vhost_kernel_reset_owner(struct vhost_dev *dev)
 {
     return vhost_kernel_call(dev, VHOST_RESET_OWNER, NULL);
 }
@@ -317,7 +317,7 @@ const VhostOps kernel_ops = {
         .vhost_get_features = vhost_kernel_get_features,
         .vhost_set_backend_cap = vhost_kernel_set_backend_cap,
         .vhost_set_owner = vhost_kernel_set_owner,
-        .vhost_reset_device = vhost_kernel_reset_device,
+        .vhost_reset_owner = vhost_kernel_reset_owner,
         .vhost_get_vq_index = vhost_kernel_get_vq_index,
 #ifdef CONFIG_VHOST_VSOCK
         .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 6abbc9d..4412008 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1475,16 +1475,29 @@ static int vhost_user_get_max_memslots(struct vhost_dev *dev,
     return 0;
 }
 
+static int vhost_user_reset_owner(struct vhost_dev *dev)
+{
+    VhostUserMsg msg = {
+        .hdr.request = VHOST_USER_RESET_OWNER,
+        .hdr.flags = VHOST_USER_VERSION,
+    };
+
+    return vhost_user_write(dev, &msg, NULL, 0);
+}
+
 static int vhost_user_reset_device(struct vhost_dev *dev)
 {
     VhostUserMsg msg = {
+        .hdr.request = VHOST_USER_RESET_DEVICE,
         .hdr.flags = VHOST_USER_VERSION,
     };
 
-    msg.hdr.request = virtio_has_feature(dev->protocol_features,
-                                         VHOST_USER_PROTOCOL_F_RESET_DEVICE)
-        ? VHOST_USER_RESET_DEVICE
-        : VHOST_USER_RESET_OWNER;
+    /* Caller must ensure the backend has VHOST_USER_PROTOCOL_F_RESET_DEVICE
+     * support */
+    if (!virtio_has_feature(dev->protocol_features,
+                       VHOST_USER_PROTOCOL_F_RESET_DEVICE)) {
+        return -EPERM;
+    }
 
     return vhost_user_write(dev, &msg, NULL, 0);
 }
@@ -2548,6 +2561,7 @@ const VhostOps user_ops = {
         .vhost_set_features = vhost_user_set_features,
         .vhost_get_features = vhost_user_get_features,
         .vhost_set_owner = vhost_user_set_owner,
+        .vhost_reset_owner = vhost_user_reset_owner,
         .vhost_reset_device = vhost_user_reset_device,
         .vhost_get_vq_index = vhost_user_get_vq_index,
         .vhost_set_vring_enable = vhost_user_set_vring_enable,
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 81bf310..affeeb0 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -77,6 +77,7 @@ typedef int (*vhost_get_features_op)(struct vhost_dev *dev,
                                      uint64_t *features);
 typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
 typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
+typedef int (*vhost_reset_owner_op)(struct vhost_dev *dev);
 typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
 typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
 typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
@@ -150,6 +151,7 @@ typedef struct VhostOps {
     vhost_get_features_op vhost_get_features;
     vhost_set_backend_cap_op vhost_set_backend_cap;
     vhost_set_owner_op vhost_set_owner;
+    vhost_reset_owner_op vhost_reset_owner;
     vhost_reset_device_op vhost_reset_device;
     vhost_get_vq_index_op vhost_get_vq_index;
     vhost_set_vring_enable_op vhost_set_vring_enable;
-- 
1.8.3.1


