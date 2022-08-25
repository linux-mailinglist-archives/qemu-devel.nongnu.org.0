Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E055A0B82
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 10:31:06 +0200 (CEST)
Received: from localhost ([::1]:49146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR8GS-0001GS-FA
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 04:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oR7vf-0006MR-IQ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:09:31 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:34226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oR7vL-0004gk-5m
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:09:15 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R371e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VNCYVLS_1661414941; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VNCYVLS_1661414941) by smtp.aliyun-inc.com;
 Thu, 25 Aug 2022 16:09:02 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v3 03/15] virtio: introduce virtio_queue_reset()
Date: Thu, 25 Aug 2022 16:08:46 +0800
Message-Id: <a348078f73eac18162aee0773252ca37e5855666.1661414345.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
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

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Introduce a new interface function virtio_queue_reset() to implement
reset for vq.

Add a new callback to VirtioDeviceClass for queue reset operation for
each child device.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio.c         | 11 +++++++++++
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 67d54832a9..0e9d41366f 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2039,6 +2039,17 @@ static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
     virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
 }
 
+void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    if (k->queue_reset) {
+        k->queue_reset(vdev, queue_index);
+    }
+
+    __virtio_queue_reset(vdev, queue_index);
+}
+
 void virtio_reset(void *opaque)
 {
     VirtIODevice *vdev = opaque;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..879394299b 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -130,6 +130,7 @@ struct VirtioDeviceClass {
     void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
     void (*reset)(VirtIODevice *vdev);
     void (*set_status)(VirtIODevice *vdev, uint8_t val);
+    void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
     /* For transitional devices, this is a bitmap of features
      * that are only exposed on the legacy interface but not
      * the modern one.
@@ -268,6 +269,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
                                       MemoryRegion *mr, bool assign);
 int virtio_set_status(VirtIODevice *vdev, uint8_t val);
 void virtio_reset(void *opaque);
+void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
 void virtio_update_irq(VirtIODevice *vdev);
 int virtio_set_features(VirtIODevice *vdev, uint64_t val);
 
-- 
2.32.0


