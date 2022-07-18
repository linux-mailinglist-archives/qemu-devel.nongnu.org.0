Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836BC5784A2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:00:04 +0200 (CEST)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRI3-00036T-Jf
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpl-0007Ph-Ht
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:41 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:59047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpf-0000iD-V4
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:40 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R471e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VJjIA8z_1658143041; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VJjIA8z_1658143041) by smtp.aliyun-inc.com;
 Mon, 18 Jul 2022 19:17:21 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
Subject: [PATCH 08/16] vhost: add op to enable or disable a single vring
Date: Mon, 18 Jul 2022 19:17:05 +0800
Message-Id: <8bf7574d8e133d3fa7e8b09f4deb59369916774a.1658141552.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.54;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-54.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:49:04 -0400
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

The interface to set enable status for a single vring is lacked in
VhostOps, since the vhost_set_vring_enable_op will manipulate all
virtqueues in a device.

Resetting a single vq will rely on this interface. It requires a
reply to indicate that the reset operation is finished, so the
parameter, wait_for_reply, is added.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 include/hw/virtio/vhost-backend.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index eab46d7f0b..7bddd1e9a0 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -81,6 +81,9 @@ typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
 typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
 typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
 typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
+typedef int (*vhost_set_single_vring_enable_op)(struct vhost_dev *dev,
+                                                int index, int enable,
+                                                bool wait_for_reply);
 typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
                                          int enable);
 typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
@@ -155,6 +158,7 @@ typedef struct VhostOps {
     vhost_set_owner_op vhost_set_owner;
     vhost_reset_device_op vhost_reset_device;
     vhost_get_vq_index_op vhost_get_vq_index;
+    vhost_set_single_vring_enable_op vhost_set_single_vring_enable;
     vhost_set_vring_enable_op vhost_set_vring_enable;
     vhost_requires_shm_log_op vhost_requires_shm_log;
     vhost_migration_done_op vhost_migration_done;
-- 
2.32.0


