Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE4594BC3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 03:16:03 +0200 (CEST)
Received: from localhost ([::1]:36660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNlBa-0007Mr-Mu
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 21:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oNl2l-0008TY-6t
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:06:55 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:43216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oNl2g-00005A-BB
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:06:54 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VMNmF.I_1660611998; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VMNmF.I_1660611998) by smtp.aliyun-inc.com;
 Tue, 16 Aug 2022 09:06:39 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v2 02/24] virtio: introduce __virtio_queue_reset()
Date: Tue, 16 Aug 2022 09:06:14 +0800
Message-Id: <0031ce31c24905031d8af9df82af18a1f3c932de.1660611460.git.kangjie.xu@linux.alibaba.com>
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

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Separate the logic of vq reset. This logic will be called directly
later.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/virtio/virtio.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..67d54832a9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2019,6 +2019,26 @@ static enum virtio_device_endian virtio_current_cpu_endian(void)
     }
 }
 
+static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
+{
+    vdev->vq[i].vring.desc = 0;
+    vdev->vq[i].vring.avail = 0;
+    vdev->vq[i].vring.used = 0;
+    vdev->vq[i].last_avail_idx = 0;
+    vdev->vq[i].shadow_avail_idx = 0;
+    vdev->vq[i].used_idx = 0;
+    vdev->vq[i].last_avail_wrap_counter = true;
+    vdev->vq[i].shadow_avail_wrap_counter = true;
+    vdev->vq[i].used_wrap_counter = true;
+    virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
+    vdev->vq[i].signalled_used = 0;
+    vdev->vq[i].signalled_used_valid = false;
+    vdev->vq[i].notification = true;
+    vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
+    vdev->vq[i].inuse = 0;
+    virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
+}
+
 void virtio_reset(void *opaque)
 {
     VirtIODevice *vdev = opaque;
@@ -2050,22 +2070,7 @@ void virtio_reset(void *opaque)
     virtio_notify_vector(vdev, vdev->config_vector);
 
     for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
-        vdev->vq[i].vring.desc = 0;
-        vdev->vq[i].vring.avail = 0;
-        vdev->vq[i].vring.used = 0;
-        vdev->vq[i].last_avail_idx = 0;
-        vdev->vq[i].shadow_avail_idx = 0;
-        vdev->vq[i].used_idx = 0;
-        vdev->vq[i].last_avail_wrap_counter = true;
-        vdev->vq[i].shadow_avail_wrap_counter = true;
-        vdev->vq[i].used_wrap_counter = true;
-        virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
-        vdev->vq[i].signalled_used = 0;
-        vdev->vq[i].signalled_used_valid = false;
-        vdev->vq[i].notification = true;
-        vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
-        vdev->vq[i].inuse = 0;
-        virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
+        __virtio_queue_reset(vdev, i);
     }
 }
 
-- 
2.32.0


