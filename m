Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E75A5A0B7C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 10:30:20 +0200 (CEST)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR8Fn-00004q-OI
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 04:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oR7vf-0006MS-Vh
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:09:32 -0400
Received: from out199-18.us.a.mail.aliyun.com ([47.90.199.18]:22789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oR7vO-0004hH-Rx
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:09:16 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VNCZEWz_1661414947; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VNCZEWz_1661414947) by smtp.aliyun-inc.com;
 Thu, 25 Aug 2022 16:09:07 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v3 08/15] vhost: extract the logic of unmapping the vrings and
 desc
Date: Thu, 25 Aug 2022 16:08:51 +0800
Message-Id: <7438b645650a6c064449a5a1fbd76c769e7e5916.1661414345.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=47.90.199.18;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out199-18.us.a.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The function will be re-used when resetting a virtqueue.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost.c         | 20 ++++++++++++++------
 include/hw/virtio/vhost.h |  3 +++
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index f758f177bb..2419521c36 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1201,6 +1201,19 @@ fail_alloc_desc:
     return r;
 }
 
+void vhost_virtqueue_unmap(struct vhost_dev *dev,
+                           struct VirtIODevice *vdev,
+                           struct vhost_virtqueue *vq,
+                           unsigned idx)
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
@@ -1239,12 +1252,7 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
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
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..d9adbca584 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -279,6 +279,9 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
 
+void vhost_virtqueue_unmap(struct vhost_dev *dev, struct VirtIODevice *vdev,
+                           struct vhost_virtqueue *vq, unsigned idx);
+
 void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
 void vhost_dev_free_inflight(struct vhost_inflight *inflight);
 void vhost_dev_save_inflight(struct vhost_inflight *inflight, QEMUFile *f);
-- 
2.32.0


