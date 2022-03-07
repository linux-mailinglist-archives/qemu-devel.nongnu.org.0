Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835B4D0347
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:48:12 +0100 (CET)
Received: from localhost ([::1]:45058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFal-0001X3-I1
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:48:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRFQ1-0003up-Fl
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:37:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRFPy-0003y4-JX
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646667422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+oyOHHLiIFzKE7uphHmcn0iiR7XDZID/cji2gkBjiw=;
 b=HZtNUGD1PjOazBcfTEusGNDdszyi3MOyMY9CYE2qIzTr7u4n6FlRlW5DW4Qq1ggrKYZ6Gn
 s9SzLsPsMCwN2AAbVSpMTKc2l8JHI06zzP7TeE43Lz1nRepUuP8WgUYOGXPQMrTFGeA09u
 FydGtB7qT9egFR1WxmjXjaFJq/O/CLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-tvSQLM9PMLeL1o97waCB8w-1; Mon, 07 Mar 2022 10:36:58 -0500
X-MC-Unique: tvSQLM9PMLeL1o97waCB8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F9291006AA5;
 Mon,  7 Mar 2022 15:36:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A607C7D3D2;
 Mon,  7 Mar 2022 15:36:49 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/15] vdpa: Add custom IOTLB translations to SVQ
Date: Mon,  7 Mar 2022 16:33:30 +0100
Message-Id: <20220307153334.3854134-12-eperezma@redhat.com>
In-Reply-To: <20220307153334.3854134-1-eperezma@redhat.com>
References: <20220307153334.3854134-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
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
 hw/virtio/vhost-shadow-virtqueue.c |  75 +++++++++++++++++-
 hw/virtio/vhost-vdpa.c             | 122 ++++++++++++++++++++++++-----
 4 files changed, 181 insertions(+), 25 deletions(-)

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
index 5543a50222..71a1d2f6bb 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -69,7 +69,58 @@ static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *svq)
     return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used_idx);
 }
 
+/**
+ * Translate addresses between the qemu's virtual address and the SVQ IOVA
+ *
+ * @svq: Shadow VirtQueue
+ * @vaddr: Translated IOVA addresses
+ * @iovec: Source qemu's VA addresses
+ * @num: Length of iovec and minimum length of vaddr
+ */
+static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
+                                     void **addrs, const struct iovec *iovec,
+                                     size_t num)
+{
+    if (num == 0) {
+        return true;
+    }
+
+    for (size_t i = 0; i < num; ++i) {
+        DMAMap needle = {
+            .translated_addr = (hwaddr)iovec[i].iov_base,
+            .size = iovec[i].iov_len,
+        };
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
+        addrs[i] = (void *)(map->iova + off);
+
+        if (unlikely(int128_gt(int128_add(needle.translated_addr,
+                                          iovec[i].iov_len),
+                               map->translated_addr + map->size))) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Guest buffer expands over iova range");
+            return false;
+        }
+    }
+
+    return true;
+}
+
 static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
+                                    void * const *sg,
                                     const struct iovec *iovec,
                                     size_t num, bool more_descs, bool write)
 {
@@ -88,7 +139,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
         } else {
             descs[i].flags = flags;
         }
-        descs[i].addr = cpu_to_le64((hwaddr)iovec[n].iov_base);
+        descs[i].addr = cpu_to_le64((hwaddr)sg[n]);
         descs[i].len = cpu_to_le32(iovec[n].iov_len);
 
         last = i;
@@ -104,6 +155,8 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
 {
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
+    bool ok;
+    g_autofree void **sgs = g_new(void *, MAX(elem->out_num, elem->in_num));
 
     *head = svq->free_head;
 
@@ -114,9 +167,20 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
         return false;
     }
 
-    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
+    ok = vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_num);
+    if (unlikely(!ok)) {
+        return false;
+    }
+    vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
                             elem->in_num > 0, false);
-    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
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
@@ -520,11 +584,13 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
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
@@ -545,6 +611,7 @@ VhostShadowVirtqueue *vhost_svq_new(void)
 
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
+    svq->iova_tree = iova_tree;
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index a9dc7f0fce..8630d624f6 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -209,6 +209,21 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                          vaddr, section->readonly);
 
     llsize = int128_sub(llend, int128_make64(iova));
+    if (v->shadow_vqs_enabled) {
+        DMAMap mem_region = {
+            .translated_addr = (hwaddr)vaddr,
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
+            .translated_addr = (hwaddr)vaddr,
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
+                           (void *)needle->translated_addr,
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
-                           (void *)addr->desc_user_addr, true);
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
-                           (void *)addr->used_user_addr, false);
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


