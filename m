Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA18389436
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:56:40 +0200 (CEST)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPUt-00059R-0J
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7Q-0007GI-VK
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7O-00069J-Gx
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdAE2rBCb1J3GMjsGYBKj9vUic0GjCsYOg0K5/xW1YA=;
 b=M4YApVc4YCtuuW55GRZqtZ3AuqKle+DK7whBCOiqkyJP/yw+955mOuX6QlBjx0gWUo5opr
 lisUAqcf1VyaJPTNplmUyUMSUtqwigHYFAIIXmps8b8onGtc/tMcplFNHia1oW6WDhi1vQ
 oYVxh5DUVRYOb0nhXwgI0hO3kJhOK6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-dJSi6Z_qPWi3VxgnVkqmNA-1; Wed, 19 May 2021 12:32:18 -0400
X-MC-Unique: dJSi6Z_qPWi3VxgnVkqmNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 639C3803621;
 Wed, 19 May 2021 16:32:13 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 698D95D6AC;
 Wed, 19 May 2021 16:32:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 25/29] vhost: Add custom IOTLB translations to SVQ
Date: Wed, 19 May 2021 18:28:59 +0200
Message-Id: <20210519162903.1172366-26-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use translations added in IOVAReverseMaps in SVQ if the vhost device
does not support the mapping of the full qemu's virtual address space.
In other cases, Shadow Virtqueue still uses the qemu's virtual address
of the buffer pointed by the descriptor, which has been translated
already by qemu's VirtQueue machinery.

Now every element needs to store the previous address also, so VirtQueue
can consume the elements properly. This adds a little overhead per VQ
element, having to allocate more memory to stash them. As a possible
optimization, this allocation could be avoided if the descriptor is not
a chain but a single one, but this is left undone.

Checking also for vhost_set_iotlb_callback to send used ring remapping.
This is only needed for kernel, and would print an error in case of
vhost devices with its own mapping (vdpa).

This could change for other callback, like checking for
vhost_force_iommu, enable_custom_iommu, or another. Another option could
be to, at least, extract the check of "is map(used, writable) needed?"
in another function. But at the moment just copy the check used in
vhost_dev_start here.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 134 ++++++++++++++++++++++++++---
 hw/virtio/vhost.c                  |  29 +++++--
 2 files changed, 145 insertions(+), 18 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 934d3bb27b..a92da979d1 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -10,12 +10,19 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/virtio-access.h"
+#include "hw/virtio/vhost-iova-tree.h"
 
 #include "standard-headers/linux/vhost_types.h"
 
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
+typedef struct SVQElement {
+    VirtQueueElement elem;
+    void **in_sg_stash;
+    void **out_sg_stash;
+} SVQElement;
+
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
     /* Shadow vring */
@@ -50,8 +57,11 @@ typedef struct VhostShadowVirtqueue {
     /* Virtio device */
     VirtIODevice *vdev;
 
+    /* IOVA mapping if used */
+    VhostIOVATree *iova_map;
+
     /* Map for returning guest's descriptors */
-    VirtQueueElement **ring_id_maps;
+    SVQElement **ring_id_maps;
 
     /* Next head to expose to device */
     uint16_t avail_idx_shadow;
@@ -88,6 +98,66 @@ static void vhost_shadow_vq_set_notification(VhostShadowVirtqueue *svq,
     }
 }
 
+static void vhost_shadow_vq_stash_addr(void ***stash, const struct iovec *iov,
+                                       size_t num)
+{
+    size_t i;
+
+    if (num == 0) {
+        return;
+    }
+
+    *stash = g_new(void *, num);
+    for (i = 0; i < num; ++i) {
+        (*stash)[i] = iov[i].iov_base;
+    }
+}
+
+static void vhost_shadow_vq_unstash_addr(void **stash,
+                                         struct iovec *iov,
+                                         size_t num)
+{
+    size_t i;
+
+    if (num == 0) {
+        return;
+    }
+
+    for (i = 0; i < num; ++i) {
+        iov[i].iov_base = stash[i];
+    }
+    g_free(stash);
+}
+
+static void vhost_shadow_vq_translate_addr(const VhostShadowVirtqueue *svq,
+                                           struct iovec *iovec, size_t num)
+{
+    size_t i;
+
+    for (i = 0; i < num; ++i) {
+        VhostDMAMap needle = {
+            .translated_addr = iovec[i].iov_base,
+            .size = iovec[i].iov_len,
+        };
+        size_t off;
+
+        const VhostDMAMap *map = vhost_iova_tree_find_iova(svq->iova_map,
+                                                           &needle);
+        /*
+         * Map cannot be NULL since iova map contains all guest space and
+         * qemu already has a physical address mapped
+         */
+        assert(map);
+
+        /*
+         * Map->iova chunk size is ignored. What to do if descriptor
+         * (addr, size) does not fit is delegated to the device.
+         */
+        off = needle.translated_addr - map->translated_addr;
+        iovec[i].iov_base = (void *)(map->iova + off);
+    }
+}
+
 static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
                                     const struct iovec *iovec,
                                     size_t num, bool more_descs, bool write)
@@ -118,8 +188,9 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
 }
 
 static unsigned vhost_shadow_vq_add_split(VhostShadowVirtqueue *svq,
-                                          VirtQueueElement *elem)
+                                          SVQElement *svq_elem)
 {
+    VirtQueueElement *elem = &svq_elem->elem;
     int head;
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
@@ -129,6 +200,16 @@ static unsigned vhost_shadow_vq_add_split(VhostShadowVirtqueue *svq,
     /* We need some descriptors here */
     assert(elem->out_num || elem->in_num);
 
+    if (svq->iova_map) {
+        vhost_shadow_vq_stash_addr(&svq_elem->in_sg_stash, elem->in_sg,
+                                   elem->in_num);
+        vhost_shadow_vq_stash_addr(&svq_elem->out_sg_stash, elem->out_sg,
+                                   elem->out_num);
+
+        vhost_shadow_vq_translate_addr(svq, elem->in_sg, elem->in_num);
+        vhost_shadow_vq_translate_addr(svq, elem->out_sg, elem->out_num);
+    }
+
     vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
                             elem->in_num > 0, false);
     vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
@@ -150,7 +231,7 @@ static unsigned vhost_shadow_vq_add_split(VhostShadowVirtqueue *svq,
 }
 
 static void vhost_shadow_vq_add(VhostShadowVirtqueue *svq,
-                                VirtQueueElement *elem)
+                                SVQElement *elem)
 {
     unsigned qemu_head = vhost_shadow_vq_add_split(svq, elem);
 
@@ -184,7 +265,7 @@ static void vhost_handle_guest_kick(EventNotifier *n)
         }
 
         while (true) {
-            VirtQueueElement *elem = virtqueue_pop(svq->vq, sizeof(*elem));
+            SVQElement *elem = virtqueue_pop(svq->vq, sizeof(*elem));
             if (!elem) {
                 break;
             }
@@ -210,7 +291,7 @@ static bool vhost_shadow_vq_more_used(VhostShadowVirtqueue *svq)
     return svq->used_idx != svq->shadow_used_idx;
 }
 
-static VirtQueueElement *vhost_shadow_vq_get_buf(VhostShadowVirtqueue *svq)
+static SVQElement *vhost_shadow_vq_get_buf(VhostShadowVirtqueue *svq)
 {
     vring_desc_t *descs = svq->vring.desc;
     const vring_used_t *used = svq->vring.used;
@@ -235,7 +316,7 @@ static VirtQueueElement *vhost_shadow_vq_get_buf(VhostShadowVirtqueue *svq)
     svq->free_head = used_elem.id;
 
     svq->used_idx++;
-    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
+    svq->ring_id_maps[used_elem.id]->elem.len = used_elem.len;
     return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
 }
 
@@ -255,12 +336,21 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
 
         vhost_shadow_vq_set_notification(svq, false);
         while (true) {
-            g_autofree VirtQueueElement *elem = vhost_shadow_vq_get_buf(svq);
-            if (!elem) {
+            g_autofree SVQElement *svq_elem = vhost_shadow_vq_get_buf(svq);
+            VirtQueueElement *elem;
+            if (!svq_elem) {
                 break;
             }
 
             assert(i < svq->vring.num);
+            elem = &svq_elem->elem;
+
+            if (svq->iova_map) {
+                vhost_shadow_vq_unstash_addr(svq_elem->in_sg_stash,
+                                             elem->in_sg, elem->in_num);
+                vhost_shadow_vq_unstash_addr(svq_elem->out_sg_stash,
+                                             elem->out_sg, elem->out_num);
+            }
             virtqueue_fill(vq, elem, elem->len, i++);
         }
 
@@ -455,14 +545,27 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
 
 
     for (i = 0; i < svq->vring.num; ++i) {
-        g_autofree VirtQueueElement *elem = svq->ring_id_maps[i];
+        g_autofree SVQElement *svq_elem = svq->ring_id_maps[i];
+        VirtQueueElement *elem;
+
+        if (!svq_elem) {
+            continue;
+        }
+
+        elem = &svq_elem->elem;
+
+        if (svq->iova_map) {
+            vhost_shadow_vq_unstash_addr(svq_elem->in_sg_stash, elem->in_sg,
+                                         elem->in_num);
+            vhost_shadow_vq_unstash_addr(svq_elem->out_sg_stash, elem->out_sg,
+                                         elem->out_num);
+        }
+
         /*
          * Although the doc says we must unpop in order, it's ok to unpop
          * everything.
          */
-        if (elem) {
-            virtqueue_unpop(svq->vq, elem, elem->len);
-        }
+        virtqueue_unpop(svq->vq, elem, elem->len);
     }
 }
 
@@ -504,11 +607,16 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
     memset(svq->vring.used, 0, device_size);
+
+    if (vhost_has_limited_iova_range(dev)) {
+        svq->iova_map = &dev->iova_map;
+    }
+
     for (i = 0; i < num - 1; i++) {
         svq->vring.desc[i].next = cpu_to_le16(i + 1);
     }
 
-    svq->ring_id_maps = g_new0(VirtQueueElement *, num);
+    svq->ring_id_maps = g_new0(SVQElement *, num);
     event_notifier_set_handler(&svq->call_notifier,
                                vhost_shadow_vq_handle_call);
     return g_steal_pointer(&svq);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 925d2146a4..4339b899ea 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1306,7 +1306,13 @@ static bool vhost_shadow_vq_start_store_sections(struct vhost_dev *dev)
             .perm = VHOST_ACCESS_RW,
         };
 
-        VhostDMAMapNewRC r = vhost_iova_tree_insert(&dev->iova_map, &region);
+        VhostDMAMapNewRC r;
+
+        if (vhost_has_limited_iova_range(dev)) {
+            r = vhost_iova_tree_alloc(&dev->iova_map, &region);
+        } else {
+            r = vhost_iova_tree_insert(&dev->iova_map, &region);
+        }
         assert(r == VHOST_DMA_MAP_OK);
     }
 
@@ -1351,11 +1357,24 @@ static bool vhost_sw_live_migration_start_vq(struct vhost_dev *dev,
         .perm = VHOST_ACCESS_RW,
     };
 
-    r = vhost_iova_tree_insert(&dev->iova_map, &driver_region);
-    assert(r == VHOST_DMA_MAP_OK);
+    if (vhost_has_limited_iova_range(dev)) {
+        r = vhost_iova_tree_alloc(&dev->iova_map, &driver_region);
+        assert(r == VHOST_DMA_MAP_OK);
+
+        r = vhost_iova_tree_alloc(&dev->iova_map, &device_region);
+        assert(r == VHOST_DMA_MAP_OK);
 
-    r = vhost_iova_tree_insert(&dev->iova_map, &device_region);
-    assert(r == VHOST_DMA_MAP_OK);
+        addr.avail_user_addr = driver_region.iova + addr.avail_user_addr
+                               - addr.desc_user_addr;
+        addr.desc_user_addr = driver_region.iova;
+        addr.used_user_addr = device_region.iova;
+    } else {
+        r = vhost_iova_tree_insert(&dev->iova_map, &driver_region);
+        assert(r == VHOST_DMA_MAP_OK);
+
+        r = vhost_iova_tree_insert(&dev->iova_map, &device_region);
+        assert(r == VHOST_DMA_MAP_OK);
+    }
 
     vhost_virtqueue_stop(dev, dev->vdev, &dev->vqs[idx], dev->vq_index + idx);
     ok = vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
-- 
2.27.0


