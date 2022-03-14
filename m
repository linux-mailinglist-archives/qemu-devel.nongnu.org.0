Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76994D8B00
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:44:04 +0100 (CET)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTojj-00069U-7J
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:44:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobK-0005iW-5W
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobC-0007g9-0V
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647279312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IDe233Foscv9ub9CAH79a7KPRsGquChc4hpy/JiFZI=;
 b=R9VwMn6FNpzM3a2vP4JaoF6WG5CEjvWuc9JdOHxagIsxcdaVn8wvpUIdOvcqRnx0sIxhHt
 Ma9IJsAnx1QGxHO6HT1u9BkmM4R9LJU1OlbXOyZX2Alf5j1IX9w1zZBxVhsftokj94pAbM
 osxtilerid9X+eepq90X9nSpjgVIm6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-6IwcshBwPXaactNkbeHS-w-1; Mon, 14 Mar 2022 13:35:11 -0400
X-MC-Unique: 6IwcshBwPXaactNkbeHS-w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 258E4811E7A
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 17:35:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 702D7492C14;
 Mon, 14 Mar 2022 17:35:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/15] vdpa: Add custom IOTLB translations to SVQ
Date: Mon, 14 Mar 2022 18:34:51 +0100
Message-Id: <20220314173455.200342-12-eperezma@redhat.com>
In-Reply-To: <20220314173455.200342-1-eperezma@redhat.com>
References: <20220314173455.200342-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use translations added in VhostIOVATree in SVQ.

Only introduce usage here, not allocation and deallocation. As with
previous patches, we use the dead code paths of shadow_vqs_enabled to
avoid commiting too many changes at once. These are impossible to take
at the moment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |   6 +-
 include/hw/virtio/vhost-vdpa.h     |   3 +
 hw/virtio/vhost-shadow-virtqueue.c |  86 +++++++++++++++++---
 hw/virtio/vhost-vdpa.c             | 122 ++++++++++++++++++++++++-----
 4 files changed, 187 insertions(+), 30 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 38b3b91ca7..e5e24c536d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -13,6 +13,7 @@
 #include "qemu/event_notifier.h"
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
+#include "hw/virtio/vhost-iova-tree.h"
 
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
@@ -43,6 +44,9 @@ typedef struct VhostShadowVirtqueue {
     /* Virtio device */
     VirtIODevice *vdev;
 
+    /* IOVA mapping */
+    VhostIOVATree *iova_tree;
+
     /* Map for use the guest's descriptors */
     VirtQueueElement **ring_id_maps;
 
@@ -75,7 +79,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
                      VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(void);
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree);
 
 void vhost_svq_free(gpointer vq);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 009a9f3b6b..ee8e939ad0 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -14,6 +14,7 @@
 
 #include <gmodule.h>
 
+#include "hw/virtio/vhost-iova-tree.h"
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
 
@@ -30,6 +31,8 @@ typedef struct vhost_vdpa {
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
     bool shadow_vqs_enabled;
+    /* IOVA mapping used by the Shadow Virtqueue */
+    VhostIOVATree *iova_tree;
     GPtrArray *shadow_vqs;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index ece50b8ece..b232803d1b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -70,7 +70,59 @@ static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *svq)
     return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used_idx);
 }
 
-static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
+/**
+ * Translate addresses between the qemu's virtual address and the SVQ IOVA
+ *
+ * @svq: Shadow VirtQueue
+ * @vaddr: Translated IOVA addresses
+ * @iovec: Source qemu's VA addresses
+ * @num: Length of iovec and minimum length of vaddr
+ */
+static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
+                                     hwaddr *addrs, const struct iovec *iovec,
+                                     size_t num)
+{
+    if (num == 0) {
+        return true;
+    }
+
+    for (size_t i = 0; i < num; ++i) {
+        DMAMap needle = {
+            .translated_addr = (hwaddr)(uintptr_t)iovec[i].iov_base,
+            .size = iovec[i].iov_len,
+        };
+        Int128 needle_last, map_last;
+        size_t off;
+
+        const DMAMap *map = vhost_iova_tree_find_iova(svq->iova_tree, &needle);
+        /*
+         * Map cannot be NULL since iova map contains all guest space and
+         * qemu already has a physical address mapped
+         */
+        if (unlikely(!map)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Invalid address 0x%"HWADDR_PRIx" given by guest",
+                          needle.translated_addr);
+            return false;
+        }
+
+        off = needle.translated_addr - map->translated_addr;
+        addrs[i] = map->iova + off;
+
+        needle_last = int128_add(int128_make64(needle.translated_addr),
+                                 int128_make64(iovec[i].iov_len));
+        map_last = int128_make64(map->translated_addr + map->size);
+        if (unlikely(int128_gt(needle_last, map_last))) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Guest buffer expands over iova range");
+            return false;
+        }
+    }
+
+    return true;
+}
+
+static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
                                     const struct iovec *iovec, size_t num,
                                     bool more_descs, bool write)
 {
@@ -89,7 +141,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
         } else {
             descs[i].flags = flags;
         }
-        descs[i].addr = cpu_to_le64((hwaddr)(intptr_t)iovec[n].iov_base);
+        descs[i].addr = cpu_to_le64(sg[n]);
         descs[i].len = cpu_to_le32(iovec[n].iov_len);
 
         last = i;
@@ -104,6 +156,8 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
 {
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
+    bool ok;
+    g_autofree hwaddr *sgs = g_new(hwaddr, MAX(elem->out_num, elem->in_num));
 
     *head = svq->free_head;
 
@@ -114,9 +168,20 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
         return false;
     }
 
-    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num, elem->in_num > 0,
-                            false);
-    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
+    ok = vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_num);
+    if (unlikely(!ok)) {
+        return false;
+    }
+    vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
+                            elem->in_num > 0, false);
+
+
+    ok = vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_num);
+    if (unlikely(!ok)) {
+        return false;
+    }
+
+    vhost_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false, true);
 
     /*
      * Put the entry in the available array (but don't update avail->idx until
@@ -395,9 +460,9 @@ void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd)
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
                               struct vhost_vring_addr *addr)
 {
-    addr->desc_user_addr = (uint64_t)(intptr_t)svq->vring.desc;
-    addr->avail_user_addr = (uint64_t)(intptr_t)svq->vring.avail;
-    addr->used_user_addr = (uint64_t)(intptr_t)svq->vring.used;
+    addr->desc_user_addr = (uint64_t)(uintptr_t)svq->vring.desc;
+    addr->avail_user_addr = (uint64_t)(uintptr_t)svq->vring.avail;
+    addr->used_user_addr = (uint64_t)(uintptr_t)svq->vring.used;
 }
 
 size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq)
@@ -518,11 +583,13 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  * Creates vhost shadow virtqueue, and instructs the vhost device to use the
  * shadow methods and file descriptors.
  *
+ * @iova_tree: Tree to perform descriptors translations
+ *
  * Returns the new virtqueue or NULL.
  *
  * In case of error, reason is reported through error_report.
  */
-VhostShadowVirtqueue *vhost_svq_new(void)
+VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
 {
     g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
     int r;
@@ -543,6 +610,7 @@ VhostShadowVirtqueue *vhost_svq_new(void)
 
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
+    svq->iova_tree = iova_tree;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 297505f331..ec38189492 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -209,6 +209,21 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                          vaddr, section->readonly);
 
     llsize = int128_sub(llend, int128_make64(iova));
+    if (v->shadow_vqs_enabled) {
+        DMAMap mem_region = {
+            .translated_addr = (hwaddr)(uintptr_t)vaddr,
+            .size = int128_get64(llsize) - 1,
+            .perm = IOMMU_ACCESS_FLAG(true, section->readonly),
+        };
+
+        int r = vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
+        if (unlikely(r != IOVA_OK)) {
+            error_report("Can't allocate a mapping (%d)", r);
+            goto fail;
+        }
+
+        iova = mem_region.iova;
+    }
 
     vhost_vdpa_iotlb_batch_begin_once(v);
     ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
@@ -261,6 +276,20 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
 
     llsize = int128_sub(llend, int128_make64(iova));
 
+    if (v->shadow_vqs_enabled) {
+        const DMAMap *result;
+        const void *vaddr = memory_region_get_ram_ptr(section->mr) +
+            section->offset_within_region +
+            (iova - section->offset_within_address_space);
+        DMAMap mem_region = {
+            .translated_addr = (hwaddr)(uintptr_t)vaddr,
+            .size = int128_get64(llsize) - 1,
+        };
+
+        result = vhost_iova_tree_find_iova(v->iova_tree, &mem_region);
+        iova = result->iova;
+        vhost_iova_tree_remove(v->iova_tree, &mem_region);
+    }
     vhost_vdpa_iotlb_batch_begin_once(v);
     ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
     if (ret) {
@@ -370,7 +399,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
 
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
-        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new();
+        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree);
 
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
@@ -807,33 +836,70 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
 /**
  * Unmap a SVQ area in the device
  */
-static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr iova,
-                                      hwaddr size)
+static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
+                                      const DMAMap *needle)
 {
+    const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, needle);
+    hwaddr size;
     int r;
 
-    size = ROUND_UP(size, qemu_real_host_page_size);
-    r = vhost_vdpa_dma_unmap(v, iova, size);
+    if (unlikely(!result)) {
+        error_report("Unable to find SVQ address to unmap");
+        return false;
+    }
+
+    size = ROUND_UP(result->size, qemu_real_host_page_size);
+    r = vhost_vdpa_dma_unmap(v, result->iova, size);
     return r == 0;
 }
 
 static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
                                        const VhostShadowVirtqueue *svq)
 {
+    DMAMap needle = {};
     struct vhost_vdpa *v = dev->opaque;
     struct vhost_vring_addr svq_addr;
-    size_t device_size = vhost_svq_device_area_size(svq);
-    size_t driver_size = vhost_svq_driver_area_size(svq);
     bool ok;
 
     vhost_svq_get_vring_addr(svq, &svq_addr);
 
-    ok = vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr, driver_size);
+    needle.translated_addr = svq_addr.desc_user_addr;
+    ok = vhost_vdpa_svq_unmap_ring(v, &needle);
     if (unlikely(!ok)) {
         return false;
     }
 
-    return vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr, device_size);
+    needle.translated_addr = svq_addr.used_user_addr;
+    return vhost_vdpa_svq_unmap_ring(v, &needle);
+}
+
+/**
+ * Map the SVQ area in the device
+ *
+ * @v: Vhost-vdpa device
+ * @needle: The area to search iova
+ * @errorp: Error pointer
+ */
+static bool vhost_vdpa_svq_map_ring(struct vhost_vdpa *v, DMAMap *needle,
+                                    Error **errp)
+{
+    int r;
+
+    r = vhost_iova_tree_map_alloc(v->iova_tree, needle);
+    if (unlikely(r != IOVA_OK)) {
+        error_setg(errp, "Cannot allocate iova (%d)", r);
+        return false;
+    }
+
+    r = vhost_vdpa_dma_map(v, needle->iova, needle->size + 1,
+                           (void *)(uintptr_t)needle->translated_addr,
+                           needle->perm == IOMMU_RO);
+    if (unlikely(r != 0)) {
+        error_setg_errno(errp, -r, "Cannot map region to device");
+        vhost_iova_tree_remove(v->iova_tree, needle);
+    }
+
+    return r == 0;
 }
 
 /**
@@ -849,28 +915,44 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
                                      struct vhost_vring_addr *addr,
                                      Error **errp)
 {
+    DMAMap device_region, driver_region;
+    struct vhost_vring_addr svq_addr;
     struct vhost_vdpa *v = dev->opaque;
     size_t device_size = vhost_svq_device_area_size(svq);
     size_t driver_size = vhost_svq_driver_area_size(svq);
-    int r;
+    size_t avail_offset;
+    bool ok;
 
     ERRP_GUARD();
-    vhost_svq_get_vring_addr(svq, addr);
+    vhost_svq_get_vring_addr(svq, &svq_addr);
 
-    r = vhost_vdpa_dma_map(v, addr->desc_user_addr, driver_size,
-                           (void *)(uintptr_t)addr->desc_user_addr, true);
-    if (unlikely(r != 0)) {
-        error_setg_errno(errp, -r, "Cannot create vq driver region: ");
+    driver_region = (DMAMap) {
+        .translated_addr = svq_addr.desc_user_addr,
+        .size = driver_size - 1,
+        .perm = IOMMU_RO,
+    };
+    ok = vhost_vdpa_svq_map_ring(v, &driver_region, errp);
+    if (unlikely(!ok)) {
+        error_prepend(errp, "Cannot create vq driver region: ");
         return false;
     }
+    addr->desc_user_addr = driver_region.iova;
+    avail_offset = svq_addr.avail_user_addr - svq_addr.desc_user_addr;
+    addr->avail_user_addr = driver_region.iova + avail_offset;
 
-    r = vhost_vdpa_dma_map(v, addr->used_user_addr, device_size,
-                           (void *)(intptr_t)addr->used_user_addr, false);
-    if (unlikely(r != 0)) {
-        error_setg_errno(errp, -r, "Cannot create vq device region: ");
+    device_region = (DMAMap) {
+        .translated_addr = svq_addr.used_user_addr,
+        .size = device_size - 1,
+        .perm = IOMMU_RW,
+    };
+    ok = vhost_vdpa_svq_map_ring(v, &device_region, errp);
+    if (unlikely(!ok)) {
+        error_prepend(errp, "Cannot create vq device region: ");
+        vhost_vdpa_svq_unmap_ring(v, &driver_region);
     }
+    addr->used_user_addr = device_region.iova;
 
-    return r == 0;
+    return ok;
 }
 
 static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
-- 
2.27.0


