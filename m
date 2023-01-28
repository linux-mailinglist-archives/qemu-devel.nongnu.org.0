Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04E467F57A
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 08:24:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLfYD-0003rZ-AR; Sat, 28 Jan 2023 02:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pLfY9-0003qz-96
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 02:22:57 -0500
Received: from out199-15.us.a.mail.aliyun.com ([47.90.199.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pLfY5-0000kw-KD
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 02:22:56 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VaGyhOl_1674890245; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaGyhOl_1674890245) by smtp.aliyun-inc.com;
 Sat, 28 Jan 2023 15:17:26 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH 1/3] virtio: move struct VirtQueue to include file
Date: Sat, 28 Jan 2023 15:17:22 +0800
Message-Id: <20230128071724.33677-2-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230128071724.33677-1-xuanzhuo@linux.alibaba.com>
References: <20230128071724.33677-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 850524d63b
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=47.90.199.15;
 envelope-from=xuanzhuo@linux.alibaba.com; helo=out199-15.us.a.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch move struct VirtQueue into virtio.h.

In order to implement Queue Reset, we have to record the queue reset
status of in struct VirtQueue and provide it to device.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/virtio/virtio.c         | 49 -----------------------------------
 include/hw/virtio/virtio.h | 52 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 50 insertions(+), 51 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f35178f5fc..03077b2ecf 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -101,60 +101,11 @@ typedef struct VRingMemoryRegionCaches {
     MemoryRegionCache used;
 } VRingMemoryRegionCaches;
 
-typedef struct VRing
-{
-    unsigned int num;
-    unsigned int num_default;
-    unsigned int align;
-    hwaddr desc;
-    hwaddr avail;
-    hwaddr used;
-    VRingMemoryRegionCaches *caches;
-} VRing;
-
 typedef struct VRingPackedDescEvent {
     uint16_t off_wrap;
     uint16_t flags;
 } VRingPackedDescEvent ;
 
-struct VirtQueue
-{
-    VRing vring;
-    VirtQueueElement *used_elems;
-
-    /* Next head to pop */
-    uint16_t last_avail_idx;
-    bool last_avail_wrap_counter;
-
-    /* Last avail_idx read from VQ. */
-    uint16_t shadow_avail_idx;
-    bool shadow_avail_wrap_counter;
-
-    uint16_t used_idx;
-    bool used_wrap_counter;
-
-    /* Last used index value we have signalled on */
-    uint16_t signalled_used;
-
-    /* Last used index value we have signalled on */
-    bool signalled_used_valid;
-
-    /* Notification enabled? */
-    bool notification;
-
-    uint16_t queue_index;
-
-    unsigned int inuse;
-
-    uint16_t vector;
-    VirtIOHandleOutput handle_output;
-    VirtIODevice *vdev;
-    EventNotifier guest_notifier;
-    EventNotifier host_notifier;
-    bool host_notifier_enabled;
-    QLIST_ENTRY(VirtQueue) node;
-};
-
 const char *virtio_device_names[] = {
     [VIRTIO_ID_NET] = "virtio-net",
     [VIRTIO_ID_BLOCK] = "virtio-blk",
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 77c6c55929..1c0d77c670 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -214,6 +214,56 @@ struct VirtioDeviceClass {
     struct vhost_dev *(*get_vhost)(VirtIODevice *vdev);
 };
 
+typedef struct VRingMemoryRegionCaches VRingMemoryRegionCaches;
+typedef void (*VirtIOHandleOutput)(VirtIODevice *, VirtQueue *);
+
+typedef struct VRing {
+    unsigned int num;
+    unsigned int num_default;
+    unsigned int align;
+    hwaddr desc;
+    hwaddr avail;
+    hwaddr used;
+    VRingMemoryRegionCaches *caches;
+} VRing;
+
+struct VirtQueue {
+    VRing vring;
+    VirtQueueElement *used_elems;
+
+    /* Next head to pop */
+    uint16_t last_avail_idx;
+    bool last_avail_wrap_counter;
+
+    /* Last avail_idx read from VQ. */
+    uint16_t shadow_avail_idx;
+    bool shadow_avail_wrap_counter;
+
+    uint16_t used_idx;
+    bool used_wrap_counter;
+
+    /* Last used index value we have signalled on */
+    uint16_t signalled_used;
+
+    /* Last used index value we have signalled on */
+    bool signalled_used_valid;
+
+    /* Notification enabled? */
+    bool notification;
+
+    uint16_t queue_index;
+
+    unsigned int inuse;
+
+    uint16_t vector;
+    VirtIOHandleOutput handle_output;
+    VirtIODevice *vdev;
+    EventNotifier guest_notifier;
+    EventNotifier host_notifier;
+    bool host_notifier_enabled;
+    QLIST_ENTRY(VirtQueue) node;
+};
+
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
@@ -226,8 +276,6 @@ void virtio_error(VirtIODevice *vdev, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 /* Set the child bus name. */
 void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name);
 
-typedef void (*VirtIOHandleOutput)(VirtIODevice *, VirtQueue *);
-
 VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
                             VirtIOHandleOutput handle_output);
 
-- 
2.32.0.3.g01195cf9f


