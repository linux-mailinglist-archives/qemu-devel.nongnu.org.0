Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D373594BC7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 03:19:31 +0200 (CEST)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNlEv-0003BS-Hw
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 21:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oNl2l-0008UW-QN
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:06:55 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:45382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oNl2i-00005y-9N
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:06:55 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VMNkO1U_1660612007; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VMNkO1U_1660612007) by smtp.aliyun-inc.com;
 Tue, 16 Aug 2022 09:06:47 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v2 10/24] vhost: introduce vhost_dev_virtqueue_restart()
Date: Tue, 16 Aug 2022 09:06:22 +0800
Message-Id: <df42fc68d6cf780cce0e5d1c0e020cd3b687b42c.1660611460.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
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

Introduce vhost_dev_virtqueue_restart(), which can restart the
virtqueue when the vhost has already started running.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/virtio/vhost.c         | 13 +++++++++++++
 include/hw/virtio/vhost.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 1bca9ff48d..fc3f550c76 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1913,3 +1913,16 @@ void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice *vdev,
                           hdev->vqs + idx,
                           idx);
 }
+
+int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
+                                int idx)
+{
+    const VhostOps *vhost_ops = hdev->vhost_ops;
+
+    assert(vhost_ops);
+
+    return vhost_virtqueue_start(hdev,
+                                 vdev,
+                                 hdev->vqs + idx,
+                                 hdev->vq_index + idx);
+}
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 574888440c..b3394b6348 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -291,4 +291,6 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
 
 void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice *vdev,
                               int idx);
+int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
+                                int idx);
 #endif
-- 
2.32.0


