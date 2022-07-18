Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A555C578452
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:52:11 +0200 (CEST)
Received: from localhost ([::1]:36826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRAQ-0004Ig-H7
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpl-0007NM-Hj
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:41 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:56319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpf-0000iy-OA
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:38 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R961e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VJjIAAF_1658143046; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VJjIAAF_1658143046) by smtp.aliyun-inc.com;
 Mon, 18 Jul 2022 19:17:26 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
Subject: [PATCH 13/16] virtio: introduce queue_enable in virtio
Date: Mon, 18 Jul 2022 19:17:10 +0800
Message-Id: <a7a06e68bde2cf8c57fbf2c95b095b9f86eb527f.1658141552.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
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

Introduce the interface queue_enable() in VirtioDeviceClass and the
fucntion virtio_queue_enable() in virtio, it can be called when
VIRTIO_PCI_COMMON_Q_ENABLE is written.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/virtio/virtio-pci.c     | 1 +
 hw/virtio/virtio.c         | 9 +++++++++
 include/hw/virtio/virtio.h | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 35e8a5101a..85e1840479 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1335,6 +1335,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        proxy->vqs[vdev->queue_sel].avail[0],
                        ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
                        proxy->vqs[vdev->queue_sel].used[0]);
+            virtio_queue_enable(vdev, vdev->queue_sel);
             proxy->vqs[vdev->queue_sel].enabled = 1;
             proxy->vqs[vdev->queue_sel].reset = 0;
         } else {
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 0e9d41366f..82eb9dd4f2 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2050,6 +2050,15 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
     __virtio_queue_reset(vdev, queue_index);
 }
 
+void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    if (k->queue_enable) {
+        k->queue_enable(vdev, queue_index);
+    }
+}
+
 void virtio_reset(void *opaque)
 {
     VirtIODevice *vdev = opaque;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 879394299b..085997d8f3 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -131,6 +131,7 @@ struct VirtioDeviceClass {
     void (*reset)(VirtIODevice *vdev);
     void (*set_status)(VirtIODevice *vdev, uint8_t val);
     void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
+    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
     /* For transitional devices, this is a bitmap of features
      * that are only exposed on the legacy interface but not
      * the modern one.
@@ -270,6 +271,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
 int virtio_set_status(VirtIODevice *vdev, uint8_t val);
 void virtio_reset(void *opaque);
 void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
+void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
 void virtio_update_irq(VirtIODevice *vdev);
 int virtio_set_features(VirtIODevice *vdev, uint64_t val);
 
-- 
2.32.0


