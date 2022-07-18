Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6575784A9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:02:24 +0200 (CEST)
Received: from localhost ([::1]:34440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRKJ-0005gV-Uk
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpn-0007XR-R6
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:43 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:41858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOph-0000ig-OV
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:43 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VJioD7T_1658143044; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VJioD7T_1658143044) by smtp.aliyun-inc.com;
 Mon, 18 Jul 2022 19:17:24 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
Subject: [PATCH 11/16] vhost: introduce restart and release for vhost_dev's vqs
Date: Mon, 18 Jul 2022 19:17:08 +0800
Message-Id: <98cc06919b016e16b9abc606dd514ac2b4f85c06.1658141552.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:49:05 -0400
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

Introduce vhost_dev_virtqueue_restart(), which can restart the
virtqueue when the vhost has already started running.

Meanwhile, vhost_dev_virtqueue_release(), which can ummap the
vrings and the desc of a specific vq of a device.

Combining the two functions, we can reset a virtqueue with a
started vhost.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/virtio/vhost.c         | 29 +++++++++++++++++++++++++++++
 include/hw/virtio/vhost.h |  6 ++++++
 2 files changed, 35 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e467dfc7bc..d158d71866 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1904,3 +1904,32 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
     return -ENOSYS;
 }
+
+void vhost_dev_virtqueue_release(struct vhost_dev *hdev, VirtIODevice *vdev,
+                                 int vq_index)
+{
+    int idx = vq_index - hdev->vq_index;
+
+    idx = hdev->vhost_ops->vhost_get_vq_index(hdev, idx);
+
+    vhost_virtqueue_unmap(hdev,
+                          vdev,
+                          hdev->vqs + idx,
+                          hdev->vq_index + idx);
+}
+
+int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
+                                int vq_index)
+{
+    int idx = vq_index - hdev->vq_index;
+    int r = 0;
+
+    idx = hdev->vhost_ops->vhost_get_vq_index(hdev, idx);
+
+    r = vhost_virtqueue_start(hdev,
+                              vdev,
+                              hdev->vqs + idx,
+                              hdev->vq_index + idx);
+
+    return r;
+}
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..7df7dbe24d 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -277,6 +277,12 @@ bool vhost_has_free_slot(void);
 int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file);
 
+
+void vhost_dev_virtqueue_release(struct vhost_dev *hdev, VirtIODevice *vdev,
+                                 int vq_index);
+int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
+                                int vq_index);
+
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
 
 void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
-- 
2.32.0


