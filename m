Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FBB600B94
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:50:58 +0200 (CEST)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMlt-00044r-15
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1okMSr-0005n1-DP
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:31:18 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:56671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1okMSp-0003k1-E1
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:31:16 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R631e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VSLqlCk_1665998765; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VSLqlCk_1665998765) by smtp.aliyun-inc.com;
 Mon, 17 Oct 2022 17:26:06 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Kangjie Xu <kangjie.xu@linux.alibaba.com>
Subject: [PATCH v6 05/15] virtio-pci: support queue reset
Date: Mon, 17 Oct 2022 17:25:48 +0800
Message-Id: <20221017092558.111082-6-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20221017092558.111082-1-xuanzhuo@linux.alibaba.com>
References: <20221017092558.111082-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 3b20cde7ef
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.54;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-54.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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

PCI devices support vq reset.

Based on this function, the driver can adjust the size of the ring, and
quickly recycle the buffer in the ring.

The migration of the virtio devices will not happen during a reset
operation. This is becuase the global iothread lock is held. Migration
thread also needs the lock. As a result, when migration of virtio
devices starts, the 'reset' status of VirtIOPCIQueue will always be 0.
Thus, we do not need to add it in vmstate_virtio_pci_modern_queue_state.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-pci.c         | 15 +++++++++++++++
 include/hw/virtio/virtio-pci.h |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index e7d80242b7..a41c1dfe71 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1251,6 +1251,9 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
     case VIRTIO_PCI_COMMON_Q_USEDHI:
         val = proxy->vqs[vdev->queue_sel].used[1];
         break;
+    case VIRTIO_PCI_COMMON_Q_RESET:
+        val = proxy->vqs[vdev->queue_sel].reset;
+        break;
     default:
         val = 0;
     }
@@ -1338,6 +1341,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
                        proxy->vqs[vdev->queue_sel].used[0]);
             proxy->vqs[vdev->queue_sel].enabled = 1;
+            proxy->vqs[vdev->queue_sel].reset = 0;
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
         }
@@ -1360,6 +1364,16 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
     case VIRTIO_PCI_COMMON_Q_USEDHI:
         proxy->vqs[vdev->queue_sel].used[1] = val;
         break;
+    case VIRTIO_PCI_COMMON_Q_RESET:
+        if (val == 1) {
+            proxy->vqs[vdev->queue_sel].reset = 1;
+
+            virtio_queue_reset(vdev, vdev->queue_sel);
+
+            proxy->vqs[vdev->queue_sel].reset = 0;
+            proxy->vqs[vdev->queue_sel].enabled = 0;
+        }
+        break;
     default:
         break;
     }
@@ -1954,6 +1968,7 @@ static void virtio_pci_reset(DeviceState *qdev)
 
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
         proxy->vqs[i].enabled = 0;
+        proxy->vqs[i].reset = 0;
         proxy->vqs[i].num = 0;
         proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..938799e8f6 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -117,6 +117,11 @@ typedef struct VirtIOPCIRegion {
 typedef struct VirtIOPCIQueue {
   uint16_t num;
   bool enabled;
+  /*
+   * No need to migrate the reset status, because it is always 0
+   * when the migration starts.
+   */
+  bool reset;
   uint32_t desc[2];
   uint32_t avail[2];
   uint32_t used[2];
-- 
2.32.0.3.g01195cf9f


