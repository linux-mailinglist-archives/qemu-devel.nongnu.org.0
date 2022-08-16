Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ADB594BCB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 03:21:37 +0200 (CEST)
Received: from localhost ([::1]:51852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNlGy-0007UR-NE
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 21:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oNl2u-0000E4-Ih
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:07:06 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:36721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oNl2p-00009A-DE
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:07:01 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R241e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VMNIK9b_1660612014; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VMNIK9b_1660612014) by smtp.aliyun-inc.com;
 Tue, 16 Aug 2022 09:06:54 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v2 17/24] vhost: vhost-user: update
 vhost_dev_virtqueue_restart()
Date: Tue, 16 Aug 2022 09:06:29 +0800
Message-Id: <8d278f0247085457582a367deb13431c943b8372.1660611460.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
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

Update vhost_dev_virtqueue_restart() for vhost-user scenario.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/virtio/vhost.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index a0d6824353..bd90cfe13a 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1937,11 +1937,29 @@ int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
                                 int idx)
 {
     const VhostOps *vhost_ops = hdev->vhost_ops;
+    int r;
 
     assert(vhost_ops);
 
-    return vhost_virtqueue_start(hdev,
-                                 vdev,
-                                 hdev->vqs + idx,
-                                 hdev->vq_index + idx);
+    r = vhost_virtqueue_start(hdev,
+                              vdev,
+                              hdev->vqs + idx,
+                              hdev->vq_index + idx);
+    if (r < 0) {
+        goto err_start;
+    }
+
+    if (vhost_ops->vhost_set_single_vring_enable) {
+        r = vhost_ops->vhost_set_single_vring_enable(hdev,
+                                                     hdev->vq_index + idx,
+                                                     1);
+        if (r < 0) {
+            goto err_start;
+        }
+    }
+
+    return 0;
+
+err_start:
+    return r;
 }
-- 
2.32.0


