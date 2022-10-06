Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B385F60C6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 07:49:09 +0200 (CEST)
Received: from localhost ([::1]:42846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogJkq-0002iT-5c
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 01:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1ogJd6-0008I1-Kw
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 01:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1ogJd1-0005zY-Ol
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 01:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665034861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ODSnti626kpiPqgQelulgmeuAjLLUggz2FHyAXnvt3E=;
 b=Cycgejg4itwaJbXbxlOholxJ1s0j2yakruNlXe/LFPQzYFbn2N3oaKbe24iOrNBEr2sPg8
 oV6CqS7e5ZVeysu+gk+s78gSDKwYbIe6YVWfOni6OGkBzkMO20EC7ei9coqyISEK3bHIm2
 SCVWL+I5zCdnhkfdBq6BJEakcUsy3To=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-iMeWNvZVM2KfChtWOql13w-1; Thu, 06 Oct 2022 01:39:32 -0400
X-MC-Unique: iMeWNvZVM2KfChtWOql13w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E265986E91C
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 05:39:31 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F42E2166B26;
 Thu,  6 Oct 2022 05:39:28 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	lulu@redhat.com
Cc: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PATCH v1] vhost-vdpa : add support for vIOMMU
Date: Thu,  6 Oct 2022 13:39:01 +0800
Message-Id: <20221006053901.754178-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for vIOMMU. Register a memory listener to dma_as in
vhost_vdpa_dev_start
- during region_add register a specific IOMMU notifier, and store all notifiers in a list.
- during region_del, compare and delete the IOMMU notifier from the list
- also change the IOTLB batch flag to support IOMMU batch send

Verified in vp_vdpa and vdpa_sim_net driver

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 253 +++++++++++++++++++++++++++++++--
 include/hw/virtio/vhost-vdpa.h |  26 +++-
 2 files changed, 267 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 3ff9ce3501..d2ac40c261 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -26,6 +26,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "hw/virtio/virtio-access.h"
 
 /*
  * Return one past the end of the end of section. Be careful with uint64_t
@@ -136,14 +137,15 @@ static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
     }
 }
 
-static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
+static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v,
+                                              enum iotlb_batch_flag flag)
 {
     if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH) &&
         !v->iotlb_batch_begin_sent) {
         vhost_vdpa_listener_begin_batch(v);
     }
 
-    v->iotlb_batch_begin_sent = true;
+    v->iotlb_batch_begin_sent |= flag;
 }
 
 static void vhost_vdpa_listener_commit(MemoryListener *listener)
@@ -157,7 +159,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
         return;
     }
 
-    if (!v->iotlb_batch_begin_sent) {
+    if (!(v->iotlb_batch_begin_sent & VDPA_IOTLB_BATCH_SEND)) {
         return;
     }
 
@@ -169,8 +171,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
         error_report("failed to write, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
     }
-
-    v->iotlb_batch_begin_sent = false;
+    v->iotlb_batch_begin_sent &= ~VDPA_IOTLB_BATCH_SEND;
 }
 
 static void vhost_vdpa_listener_region_add(MemoryListener *listener,
@@ -186,6 +187,9 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        return;
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -227,9 +231,9 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
         iova = mem_region.iova;
     }
 
-    vhost_vdpa_iotlb_batch_begin_once(v);
-    ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
-                             vaddr, section->readonly);
+    vhost_vdpa_iotlb_batch_begin_once(v, VDPA_IOTLB_BATCH_SEND);
+    ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize), vaddr,
+                             section->readonly);
     if (ret) {
         error_report("vhost vdpa map fail!");
         goto fail;
@@ -260,6 +264,9 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        return;
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -292,7 +299,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
         iova = result->iova;
         vhost_iova_tree_remove(v->iova_tree, result);
     }
-    vhost_vdpa_iotlb_batch_begin_once(v);
+    vhost_vdpa_iotlb_batch_begin_once(v, VDPA_IOTLB_BATCH_SEND);
     ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
     if (ret) {
         error_report("vhost_vdpa dma unmap error!");
@@ -312,6 +319,212 @@ static const MemoryListener vhost_vdpa_memory_listener = {
     .region_del = vhost_vdpa_listener_region_del,
 };
 
+static void vhost_vdpa_listener_iommu_commit(MemoryListener *listener)
+{
+    struct vhost_vdpa *v =
+        container_of(listener, struct vhost_vdpa, iommu_listener);
+    struct vhost_dev *dev = v->dev;
+    struct vhost_msg_v2 msg = {};
+    int fd = v->device_fd;
+
+    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))) {
+        return;
+    }
+
+    if (!(v->iotlb_batch_begin_sent & VDPA_IOTLB_BATCH_IOMMU_SEND)) {
+        return;
+    }
+
+    msg.type = v->msg_type;
+    msg.iotlb.type = VHOST_IOTLB_BATCH_END;
+
+    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
+    if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
+        error_report("failed to write, fd=%d, errno=%d (%s)", fd, errno,
+                     strerror(errno));
+    }
+    v->iotlb_batch_begin_sent &= ~VDPA_IOTLB_BATCH_IOMMU_SEND;
+}
+
+/* Called with rcu_read_lock held.  */
+static bool vhost_vdpa_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
+                                     ram_addr_t *ram_addr, bool *read_only)
+{
+    MemoryRegion *mr;
+    hwaddr xlat;
+    hwaddr len = iotlb->addr_mask + 1;
+    bool writable = iotlb->perm & IOMMU_WO;
+
+    /*
+     * The IOMMU TLB entry we have just covers translation through
+     * this IOMMU to its immediate target.  We need to translate
+     * it the rest of the way through to memory.
+     */
+    mr = address_space_translate(&address_space_memory, iotlb->translated_addr,
+                                 &xlat, &len, writable, MEMTXATTRS_UNSPECIFIED);
+    if (!memory_region_is_ram(mr)) {
+        error_report("iommu map to non memory area %" HWADDR_PRIx "", xlat);
+        return false;
+    } else if (memory_region_has_ram_discard_manager(mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
+        MemoryRegionSection tmp = {
+            .mr = mr,
+            .offset_within_region = xlat,
+            .size = int128_make64(len),
+        };
+
+        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
+            error_report("iommu map to discarded memory (e.g., unplugged via"
+                         " virtio-mem): %" HWADDR_PRIx "",
+                         iotlb->translated_addr);
+            return false;
+        }
+    }
+
+    /*
+     * Translation truncates length to the IOMMU page size,
+     * check that it did not truncate too much.
+     */
+    if (len & iotlb->addr_mask) {
+        error_report("iommu has granularity incompatible with target AS");
+        return false;
+    }
+
+    if (vaddr) {
+        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
+    }
+
+    if (ram_addr) {
+        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
+    }
+
+    if (read_only) {
+        *read_only = !writable || mr->readonly;
+    }
+
+    return true;
+}
+
+static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
+{
+    struct vdpa_iommu *iommu = container_of(n, struct vdpa_iommu, n);
+
+    hwaddr iova = iotlb->iova + iommu->iommu_offset;
+    struct vhost_vdpa *v = iommu->dev;
+    void *vaddr;
+    int ret;
+
+
+    if (iotlb->target_as != &address_space_memory) {
+        error_report("Wrong target AS \"%s\", only system memory is allowed",
+                     iotlb->target_as->name ? iotlb->target_as->name : "none");
+        return;
+    }
+    rcu_read_lock();
+    vhost_vdpa_iotlb_batch_begin_once(v, VDPA_IOTLB_BATCH_IOMMU_SEND);
+
+    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
+        bool read_only;
+
+        if (!vhost_vdpa_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
+            goto out;
+        }
+        ret =
+            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr, read_only);
+        if (ret) {
+            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ", %p) = %d (%m)",
+                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
+        }
+    } else {
+        ret = vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask + 1);
+        if (ret) {
+            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ") = %d (%m)",
+                         v, iova, iotlb->addr_mask + 1, ret);
+        }
+    }
+out:
+    rcu_read_unlock();
+}
+
+static void vhost_vdpa_iommu_region_add(MemoryListener *listener,
+                                        MemoryRegionSection *section)
+{
+    struct vhost_vdpa *v =
+        container_of(listener, struct vhost_vdpa, iommu_listener);
+
+    struct vdpa_iommu *iommu;
+    Int128 end;
+    int iommu_idx;
+    IOMMUMemoryRegion *iommu_mr;
+    int ret;
+
+    if (!memory_region_is_iommu(section->mr)) {
+        return;
+    }
+
+    iommu_mr = IOMMU_MEMORY_REGION(section->mr);
+
+    iommu = g_malloc0(sizeof(*iommu));
+    end =
+        int128_add(int128_make64(section->offset_within_region), section->size);
+    end = int128_sub(end, int128_one());
+    iommu_idx =
+        memory_region_iommu_attrs_to_index(iommu_mr, MEMTXATTRS_UNSPECIFIED);
+    iommu->iommu_mr = iommu_mr;
+
+    iommu_notifier_init(
+        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_IOTLB_EVENTS,
+        section->offset_within_region, int128_get64(end), iommu_idx);
+    iommu->iommu_offset =
+        section->offset_within_address_space - section->offset_within_region;
+    iommu->dev = v;
+
+
+    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
+    if (ret) {
+        g_free(iommu);
+        return;
+    }
+
+    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
+    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
+
+    return;
+}
+
+static void vhost_vdpa_iommu_region_del(MemoryListener *listener,
+                                        MemoryRegionSection *section)
+{
+    struct vhost_vdpa *v =
+        container_of(listener, struct vhost_vdpa, iommu_listener);
+
+    struct vdpa_iommu *iommu;
+
+    if (!memory_region_is_iommu(section->mr)) {
+        return;
+    }
+
+    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
+    {
+        if (MEMORY_REGION(iommu->iommu_mr) == section->mr &&
+            iommu->n.start == section->offset_within_region) {
+            memory_region_unregister_iommu_notifier(section->mr, &iommu->n);
+            QLIST_REMOVE(iommu, iommu_next);
+            g_free(iommu);
+            break;
+        }
+    }
+}
+
+static const MemoryListener vhost_vdpa_iommu_listener = {
+    .name = "vhost-vdpa-iommu",
+    .region_add = vhost_vdpa_iommu_region_add,
+    .region_del = vhost_vdpa_iommu_region_del,
+    .commit = vhost_vdpa_listener_iommu_commit,
+};
+
 static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
                              void *arg)
 {
@@ -432,6 +645,17 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     v->shadow_vqs = g_steal_pointer(&shadow_vqs);
     return 0;
 }
+static bool vdpa_dev_has_iommu(struct vhost_dev *dev)
+{
+    VirtIODevice *vdev = dev->vdev;
+
+    if (vdev) {
+        return virtio_bus_device_iommu_enabled(vdev) &&
+               virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+    } else {
+        return false;
+    }
+}
 
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
@@ -454,6 +678,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     v->dev = dev;
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
+    v->iommu_listener = vhost_vdpa_iommu_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
     ret = vhost_vdpa_init_svq(dev, v, errp);
     if (ret) {
@@ -587,7 +812,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     v = dev->opaque;
     trace_vhost_vdpa_cleanup(dev, v);
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
-    memory_listener_unregister(&v->listener);
     vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
@@ -1128,11 +1352,18 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 
     if (started) {
         memory_listener_register(&v->listener, &address_space_memory);
+        if (vdpa_dev_has_iommu(dev)) {
+            memory_listener_register(&v->iommu_listener, dev->vdev->dma_as);
+        }
+
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-                                   VIRTIO_CONFIG_S_DRIVER);
+                                       VIRTIO_CONFIG_S_DRIVER);
+        if (vdpa_dev_has_iommu(dev)) {
+            memory_listener_unregister(&v->iommu_listener);
+        }
         memory_listener_unregister(&v->listener);
 
         return 0;
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index d10a89303e..4fcd144c06 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -24,12 +24,25 @@ typedef struct VhostVDPAHostNotifier {
     void *addr;
 } VhostVDPAHostNotifier;
 
+
+typedef enum iotlb_batch_flag {
+    /* Notify IOTLB_BATCH start*/
+    VDPA_IOTLB_BATCH_SEND = 0x1,
+    /* Notify IOTLB_BATCH iommu start*/
+    VDPA_IOTLB_BATCH_IOMMU_SEND = 0x2,
+    /* Notify IOTLB_BATCH stop*/
+    VDPA_IOTLB_BATCH_SEND_STOP = 0x4,
+    /* Notify IOTLB_BATCH iommu stop*/
+    VDPA_IOTLB_BATCH_IOMMU_SEND_STOP = 0x08,
+} IotlbBatchFlag;
+
 typedef struct vhost_vdpa {
     int device_fd;
     int index;
     uint32_t msg_type;
-    bool iotlb_batch_begin_sent;
+    uint32_t iotlb_batch_begin_sent;
     MemoryListener listener;
+    MemoryListener iommu_listener;
     struct vhost_vdpa_iova_range iova_range;
     uint64_t acked_features;
     bool shadow_vqs_enabled;
@@ -41,8 +54,19 @@ typedef struct vhost_vdpa {
     void *shadow_vq_ops_opaque;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
+    QLIST_HEAD(, vdpa_iommu) iommu_list;
+    IOMMUNotifier n;
+
 } VhostVDPA;
 
+struct vdpa_iommu {
+    struct vhost_vdpa *dev;
+    IOMMUMemoryRegion *iommu_mr;
+    hwaddr iommu_offset;
+    IOMMUNotifier n;
+    QLIST_ENTRY(vdpa_iommu) iommu_next;
+};
+
 int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
                        void *vaddr, bool readonly);
 int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
-- 
2.34.3


