Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26531594BC0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 03:15:56 +0200 (CEST)
Received: from localhost ([::1]:52150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNlBT-000798-1w
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 21:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oNl2l-0008UB-Dh
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:06:55 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:48451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oNl2h-00005h-Ug
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:06:55 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VMNkO1-_1660612005; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VMNkO1-_1660612005) by smtp.aliyun-inc.com;
 Tue, 16 Aug 2022 09:06:45 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v2 08/24] vhost: extract the logic of unmapping the vrings and
 desc
Date: Tue, 16 Aug 2022 09:06:20 +0800
Message-Id: <a43055fb4614db203b48c13f3134fe5360a6b391.1660611460.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-57.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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

Introduce vhost_virtqueue_unmap() to ummap the vrings and desc
of a virtqueue.

The function will be used later.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/virtio/vhost.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 0827d631c0..e467dfc7bc 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1197,6 +1197,19 @@ fail_alloc_desc:
     return r;
 }
 
+static void vhost_virtqueue_unmap(struct vhost_dev *dev,
+                                  struct VirtIODevice *vdev,
+                                  struct vhost_virtqueue *vq,
+                                  unsigned idx)
+{
+    vhost_memory_unmap(dev, vq->used, virtio_queue_get_used_size(vdev, idx),
+                       1, virtio_queue_get_used_size(vdev, idx));
+    vhost_memory_unmap(dev, vq->avail, virtio_queue_get_avail_size(vdev, idx),
+                       0, virtio_queue_get_avail_size(vdev, idx));
+    vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
+                       0, virtio_queue_get_desc_size(vdev, idx));
+}
+
 static void vhost_virtqueue_stop(struct vhost_dev *dev,
                                     struct VirtIODevice *vdev,
                                     struct vhost_virtqueue *vq,
@@ -1235,12 +1248,7 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
                                                 vhost_vq_index);
     }
 
-    vhost_memory_unmap(dev, vq->used, virtio_queue_get_used_size(vdev, idx),
-                       1, virtio_queue_get_used_size(vdev, idx));
-    vhost_memory_unmap(dev, vq->avail, virtio_queue_get_avail_size(vdev, idx),
-                       0, virtio_queue_get_avail_size(vdev, idx));
-    vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
-                       0, virtio_queue_get_desc_size(vdev, idx));
+    vhost_virtqueue_unmap(dev, vdev, vq, idx);
 }
 
 static void vhost_eventfd_add(MemoryListener *listener,
-- 
2.32.0


