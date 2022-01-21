Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5353D496684
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:44:12 +0100 (CET)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0lX-0004Gh-DY
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:44:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cb-0000Ql-CG
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cX-00057D-Mj
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4QnG0VOwNLAPfh053MAe4HS4y023rWDHndE0ddtWeI=;
 b=TT1T4je0YpYUg6HuB2N6K9p17eMCgBpvEtruiNVi+9ZQ4UJejuhza/WiwaAuMwBBIVQLjl
 nbGELaYWVlOPzCuBhKtvmO4AoCqnlAakQ5n/G3h65Nusz9ar7rZFoeAI+7IYhk6TkQOWua
 B+2OvvXdbTMyKSm6afurAiRejL+SSAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-GwGGK_d6N6OhhlisZnwYYA-1; Fri, 21 Jan 2022 15:34:47 -0500
X-MC-Unique: GwGGK_d6N6OhhlisZnwYYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A25141019982;
 Fri, 21 Jan 2022 20:34:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9096CE2C8;
 Fri, 21 Jan 2022 20:34:40 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/31] vdpa: Add custom IOTLB translations to SVQ
Date: Fri, 21 Jan 2022 21:27:25 +0100
Message-Id: <20220121202733.404989-24-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use translations added in VhostIOVATree in SVQ.

Only introduce usage here, not allocation and deallocation. As with
previous patches, we use the dead code paths of shadow_vqs_enabled to
avoid commiting too many changes at once. These are impossible to take
at the moment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |   3 +-
 include/hw/virtio/vhost-vdpa.h     |   3 +
 hw/virtio/vhost-shadow-virtqueue.c | 111 ++++++++++++++++----
 hw/virtio/vhost-vdpa.c             | 161 +++++++++++++++++++++++++----
 4 files changed, 238 insertions(+), 40 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 19c934af49..c6f67d6f76 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -12,6 +12,7 @@
 
 #include "hw/virtio/vhost.h"
 #include "qemu/event_notifier.h"
+#include "hw/virtio/vhost-iova-tree.h"
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
@@ -37,7 +38,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
                      VirtQueue *vq);
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
+VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_map);
 
 void vhost_svq_free(VhostShadowVirtqueue *vq);
 
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 009a9f3b6b..cd2388b3be 100644
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
+    /* IOVA mapping used by Shadow Virtqueue */
+    VhostIOVATree *iova_tree;
     GPtrArray *shadow_vqs;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index a1a404f68f..c7888eb8cf 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -11,6 +11,7 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/virtio-access.h"
+#include "hw/virtio/vhost-iova-tree.h"
 #include "standard-headers/linux/vhost_types.h"
 
 #include "qemu/error-report.h"
@@ -45,6 +46,9 @@ typedef struct VhostShadowVirtqueue {
     /* Virtio device */
     VirtIODevice *vdev;
 
+    /* IOVA mapping */
+    VhostIOVATree *iova_tree;
+
     /* Map for returning guest's descriptors */
     VirtQueueElement **ring_id_maps;
 
@@ -97,13 +101,7 @@ bool vhost_svq_valid_device_features(uint64_t *dev_features)
             continue;
 
         case VIRTIO_F_ACCESS_PLATFORM:
-            /* SVQ does not know how to translate addresses */
-            if (*dev_features & BIT_ULL(b)) {
-                clear_bit(b, dev_features);
-                r = false;
-            }
-            break;
-
+            /* SVQ trust in host's IOMMU to translate addresses */
         case VIRTIO_F_VERSION_1:
             /* SVQ trust that guest vring is little endian */
             if (!(*dev_features & BIT_ULL(b))) {
@@ -205,7 +203,55 @@ static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool enable)
     }
 }
 
+/**
+ * Translate addresses between qemu's virtual address and SVQ IOVA
+ *
+ * @svq    Shadow VirtQueue
+ * @vaddr  Translated IOVA addresses
+ * @iovec  Source qemu's VA addresses
+ * @num    Length of iovec and minimum length of vaddr
+ */
+static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
+                                     void **addrs, const struct iovec *iovec,
+                                     size_t num)
+{
+    size_t i;
+
+    if (num == 0) {
+        return true;
+    }
+
+    for (i = 0; i < num; ++i) {
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
+            error_report("Invalid address 0x%"HWADDR_PRIx" given by guest",
+                         needle.translated_addr);
+            return false;
+        }
+
+        /*
+         * Map->iova chunk size is ignored. What to do if descriptor
+         * (addr, size) does not fit is delegated to the device.
+         */
+        off = needle.translated_addr - map->translated_addr;
+        addrs[i] = (void *)(map->iova + off);
+    }
+
+    return true;
+}
+
 static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
+                                    void * const *vaddr_sg,
                                     const struct iovec *iovec,
                                     size_t num, bool more_descs, bool write)
 {
@@ -224,7 +270,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
         } else {
             descs[i].flags = flags;
         }
-        descs[i].addr = cpu_to_le64((hwaddr)iovec[n].iov_base);
+        descs[i].addr = cpu_to_le64((hwaddr)vaddr_sg[n]);
         descs[i].len = cpu_to_le32(iovec[n].iov_len);
 
         last = i;
@@ -234,42 +280,60 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
     svq->free_head = le16_to_cpu(descs[last].next);
 }
 
-static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
-                                    VirtQueueElement *elem)
+static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
+                                VirtQueueElement *elem,
+                                unsigned *head)
 {
-    int head;
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
+    bool ok;
+    g_autofree void **sgs = g_new(void *, MAX(elem->out_num, elem->in_num));
 
-    head = svq->free_head;
+    *head = svq->free_head;
 
     /* We need some descriptors here */
     assert(elem->out_num || elem->in_num);
 
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
      * Put entry in available array (but don't update avail->idx until they
      * do sync).
      */
     avail_idx = svq->avail_idx_shadow & (svq->vring.num - 1);
-    avail->ring[avail_idx] = cpu_to_le16(head);
+    avail->ring[avail_idx] = cpu_to_le16(*head);
     svq->avail_idx_shadow++;
 
     /* Update avail index after the descriptor is wrote */
     smp_wmb();
     avail->idx = cpu_to_le16(svq->avail_idx_shadow);
 
-    return head;
+    return true;
 }
 
-static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
+static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
 {
-    unsigned qemu_head = vhost_svq_add_split(svq, elem);
+    unsigned qemu_head;
+    bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
+    if (unlikely(!ok)) {
+        return false;
+    }
 
     svq->ring_id_maps[qemu_head] = elem;
+    return true;
 }
 
 static void vhost_svq_kick(VhostShadowVirtqueue *svq)
@@ -309,6 +373,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
 
         while (true) {
             VirtQueueElement *elem;
+            bool ok;
 
             if (svq->next_guest_avail_elem) {
                 elem = g_steal_pointer(&svq->next_guest_avail_elem);
@@ -337,7 +402,11 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 return;
             }
 
-            vhost_svq_add(svq, elem);
+            ok = vhost_svq_add(svq, elem);
+            if (unlikely(!ok)) {
+                /* VQ is broken, just return and ignore any other kicks */
+                return;
+            }
             vhost_svq_kick(svq);
         }
 
@@ -619,12 +688,13 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
  * methods and file descriptors.
  *
  * @qsize Shadow VirtQueue size
+ * @iova_tree Tree to perform descriptors translations
  *
  * Returns the new virtqueue or NULL.
  *
  * In case of error, reason is reported through error_report.
  */
-VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
+VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iova_tree)
 {
     size_t desc_size = sizeof(vring_desc_t) * qsize;
     size_t device_size, driver_size;
@@ -656,6 +726,7 @@ VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
     memset(svq->vring.desc, 0, driver_size);
     svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
     memset(svq->vring.used, 0, device_size);
+    svq->iova_tree = iova_tree;
     svq->ring_id_maps = g_new0(VirtQueueElement *, qsize);
     event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     return g_steal_pointer(&svq);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 0e5c00ed7e..276a559649 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -209,6 +209,18 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
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
+        assert(r == IOVA_OK);
+
+        iova = mem_region.iova;
+    }
 
     vhost_vdpa_iotlb_batch_begin_once(v);
     ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
@@ -261,6 +273,20 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
 
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
@@ -783,33 +809,70 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
 /**
  * Unmap SVQ area in the device
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
+    DMAMap needle;
     struct vhost_vdpa *v = dev->opaque;
     struct vhost_vring_addr svq_addr;
-    size_t device_size = vhost_svq_device_area_size(svq);
-    size_t driver_size = vhost_svq_driver_area_size(svq);
     bool ok;
 
     vhost_svq_get_vring_addr(svq, &svq_addr);
 
-    ok = vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr, driver_size);
+    needle = (DMAMap) {
+        .translated_addr = svq_addr.desc_user_addr,
+    };
+    ok = vhost_vdpa_svq_unmap_ring(v, &needle);
     if (unlikely(!ok)) {
         return false;
     }
 
-    return vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr, device_size);
+    needle = (DMAMap) {
+        .translated_addr = svq_addr.used_user_addr,
+    };
+    return vhost_vdpa_svq_unmap_ring(v, &needle);
+}
+
+/**
+ * Map SVQ area in the device
+ *
+ * @v          Vhost-vdpa device
+ * @needle     The area to search iova
+ * @readonly   Permissions of the area
+ */
+static bool vhost_vdpa_svq_map_ring(struct vhost_vdpa *v, const DMAMap *needle,
+                                    bool readonly)
+{
+    hwaddr off;
+    const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, needle);
+    int r;
+
+    if (unlikely(!result)) {
+        error_report("Can't locate SVQ ring");
+        return false;
+    }
+
+    off = needle->translated_addr - result->translated_addr;
+    r = vhost_vdpa_dma_map(v, result->iova + off, needle->size,
+                           (void *)needle->translated_addr, readonly);
+    return r == 0;
 }
 
 /**
@@ -821,23 +884,29 @@ static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
 static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
                                      const VhostShadowVirtqueue *svq)
 {
+    DMAMap needle;
     struct vhost_vdpa *v = dev->opaque;
     struct vhost_vring_addr svq_addr;
     size_t device_size = vhost_svq_device_area_size(svq);
     size_t driver_size = vhost_svq_driver_area_size(svq);
-    int r;
+    bool ok;
 
     vhost_svq_get_vring_addr(svq, &svq_addr);
 
-    r = vhost_vdpa_dma_map(v, svq_addr.desc_user_addr, driver_size,
-                           (void *)svq_addr.desc_user_addr, true);
-    if (unlikely(r != 0)) {
+    needle = (DMAMap) {
+        .translated_addr = svq_addr.desc_user_addr,
+        .size = driver_size,
+    };
+    ok = vhost_vdpa_svq_map_ring(v, &needle, true);
+    if (unlikely(!ok)) {
         return false;
     }
 
-    r = vhost_vdpa_dma_map(v, svq_addr.used_user_addr, device_size,
-                           (void *)svq_addr.used_user_addr, false);
-    return r == 0;
+    needle = (DMAMap) {
+        .translated_addr = svq_addr.used_user_addr,
+        .size = device_size,
+    };
+    return vhost_vdpa_svq_map_ring(v, &needle, false);
 }
 
 static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
@@ -1006,6 +1075,23 @@ static int vhost_vdpa_set_owner(struct vhost_dev *dev)
     return vhost_vdpa_call(dev, VHOST_SET_OWNER, NULL);
 }
 
+static bool vhost_vdpa_svq_get_vq_region(struct vhost_vdpa *v,
+                                         unsigned long long addr,
+                                         uint64_t *iova_addr)
+{
+    const DMAMap needle = {
+        .translated_addr = addr,
+    };
+    const DMAMap *translation = vhost_iova_tree_find_iova(v->iova_tree,
+                                                          &needle);
+    if (!translation) {
+        return false;
+    }
+
+    *iova_addr = translation->iova + (addr - translation->translated_addr);
+    return true;
+}
+
 static void vhost_vdpa_vq_get_guest_addr(struct vhost_vring_addr *addr,
                                          struct vhost_virtqueue *vq)
 {
@@ -1023,10 +1109,23 @@ static int vhost_vdpa_vq_get_addr(struct vhost_dev *dev,
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
 
     if (v->shadow_vqs_enabled) {
+        struct vhost_vring_addr svq_addr;
         int idx = vhost_vdpa_get_vq_index(dev, addr->index);
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, idx);
 
-        vhost_svq_get_vring_addr(svq, addr);
+        vhost_svq_get_vring_addr(svq, &svq_addr);
+        if (!vhost_vdpa_svq_get_vq_region(v, svq_addr.desc_user_addr,
+                                          &addr->desc_user_addr)) {
+            return -1;
+        }
+        if (!vhost_vdpa_svq_get_vq_region(v, svq_addr.avail_user_addr,
+                                          &addr->avail_user_addr)) {
+            return -1;
+        }
+        if (!vhost_vdpa_svq_get_vq_region(v, svq_addr.used_user_addr,
+                                          &addr->used_user_addr)) {
+            return -1;
+        }
     } else {
         vhost_vdpa_vq_get_guest_addr(addr, vq);
     }
@@ -1095,13 +1194,37 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
 
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_psvq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
-        VhostShadowVirtqueue *svq = vhost_svq_new(qsize);
-
+        DMAMap device_region, driver_region;
+        struct vhost_vring_addr addr;
+        VhostShadowVirtqueue *svq = vhost_svq_new(qsize, v->iova_tree);
         if (unlikely(!svq)) {
             error_setg(errp, "Cannot create svq %u", n);
             return -1;
         }
-        g_ptr_array_add(v->shadow_vqs, svq);
+
+        vhost_svq_get_vring_addr(svq, &addr);
+        driver_region = (DMAMap) {
+            .translated_addr = (hwaddr)addr.desc_user_addr,
+
+            /*
+             * DMAMAp.size include the last byte included in the range, while
+             * sizeof marks one past it. Substract one byte to make them match.
+             */
+            .size = vhost_svq_driver_area_size(svq) - 1,
+            .perm = VHOST_ACCESS_RO,
+        };
+        device_region = (DMAMap) {
+            .translated_addr = (hwaddr)addr.used_user_addr,
+            .size = vhost_svq_device_area_size(svq) - 1,
+            .perm = VHOST_ACCESS_RW,
+        };
+
+        r = vhost_iova_tree_map_alloc(v->iova_tree, &driver_region);
+        assert(r == IOVA_OK);
+        r = vhost_iova_tree_map_alloc(v->iova_tree, &device_region);
+        assert(r == IOVA_OK);
+
+        g_ptr_array_add(shadow_vqs, svq);
     }
 
 out:
-- 
2.27.0


