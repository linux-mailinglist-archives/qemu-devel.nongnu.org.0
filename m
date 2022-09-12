Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A415B52CA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 05:12:58 +0200 (CEST)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXZsW-0001G2-Re
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 23:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oXZqk-0006Ts-Ig
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 23:11:06 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:48339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oXZqd-0007IP-Uc
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 23:11:04 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VPNH8U2_1662952251; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VPNH8U2_1662952251) by smtp.aliyun-inc.com;
 Mon, 12 Sep 2022 11:10:52 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, arei.gonglei@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v2 2/6] vhost-user: add op to enable or disable a single vring
Date: Mon, 12 Sep 2022 11:10:45 +0800
Message-Id: <985e7facb121059d06631a9688e93d11e453795c.1662949366.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
References: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

There is only vhost_set_dev_enable op in VhostOps. Thus, we introduce
the interface vhost_set_vring_enable to set the enable status for a
single vring.

Resetting a single vq will rely on this interface.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/virtio/vhost-user.c            | 25 ++++++++++++++++++-------
 include/hw/virtio/vhost-backend.h |  3 +++
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 794519359b..3f140d5085 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1198,6 +1198,22 @@ static int vhost_user_set_vring_base(struct vhost_dev *dev,
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
 }
 
+static int vhost_user_set_vring_enable(struct vhost_dev *dev,
+                                       int index,
+                                       int enable)
+{
+    if (index < dev->vq_index || index >= dev->vq_index + dev->nvqs) {
+        return -EINVAL;
+    }
+
+    struct vhost_vring_state state = {
+        .index = index,
+        .num   = enable,
+    };
+
+    return vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);
+}
+
 static int vhost_user_set_dev_enable(struct vhost_dev *dev, int enable)
 {
     int i;
@@ -1207,13 +1223,7 @@ static int vhost_user_set_dev_enable(struct vhost_dev *dev, int enable)
     }
 
     for (i = 0; i < dev->nvqs; ++i) {
-        int ret;
-        struct vhost_vring_state state = {
-            .index = dev->vq_index + i,
-            .num   = enable,
-        };
-
-        ret = vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);
+        int ret = vhost_user_set_vring_enable(dev, dev->vq_index + i, enable);
         if (ret < 0) {
             /*
              * Restoring the previous state is likely infeasible, as well as
@@ -2627,6 +2637,7 @@ const VhostOps user_ops = {
         .vhost_set_owner = vhost_user_set_owner,
         .vhost_reset_device = vhost_user_reset_device,
         .vhost_get_vq_index = vhost_user_get_vq_index,
+        .vhost_set_vring_enable = vhost_user_set_vring_enable,
         .vhost_set_dev_enable = vhost_user_set_dev_enable,
         .vhost_requires_shm_log = vhost_user_requires_shm_log,
         .vhost_migration_done = vhost_user_migration_done,
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index b49432045f..dad7191bac 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -81,6 +81,8 @@ typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
 typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
 typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
 typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
+typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
+                                         int index, int enable);
 typedef int (*vhost_set_dev_enable_op)(struct vhost_dev *dev,
                                        int enable);
 typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
@@ -155,6 +157,7 @@ typedef struct VhostOps {
     vhost_set_owner_op vhost_set_owner;
     vhost_reset_device_op vhost_reset_device;
     vhost_get_vq_index_op vhost_get_vq_index;
+    vhost_set_vring_enable_op vhost_set_vring_enable;
     vhost_set_dev_enable_op vhost_set_dev_enable;
     vhost_requires_shm_log_op vhost_requires_shm_log;
     vhost_migration_done_op vhost_migration_done;
-- 
2.32.0


