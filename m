Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD574603A21
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 08:52:45 +0200 (CEST)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol2wV-0007u9-DD
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 02:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1ol2jz-0002nN-At
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 02:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1ol2jv-0001RZ-8r
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 02:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666161582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Sn3yVTFUOTdkdSkqD/zcQCkPjhhTSvGGKNKqgxymdGU=;
 b=StwUvuOtyXfIQTo4N6jaYIFiLJPsmlTyOyu0t3T+0waqIspCpt1vpdj+v6Zg1ZGw7Es8Du
 n7qpSckpaG/pagurkS0s76Ch2o86QakDKZdo/jmza0axH8ANAi0zWCki5aJw223WYBmoOu
 cUYqhDlZD1YBHemECFyY4XO/DXJ5vAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-VlcGuptRP-GmztleNQXYag-1; Wed, 19 Oct 2022 02:39:38 -0400
X-MC-Unique: VlcGuptRP-GmztleNQXYag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9E3C87B2A6
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 06:39:37 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-102.pek2.redhat.com [10.72.13.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED6682166B41;
 Wed, 19 Oct 2022 06:39:34 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, eperezma@redhat.com
Cc: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PATCH v2] vhost-vdpa: add support for vIOMMU
Date: Wed, 19 Oct 2022 14:39:25 +0800
Message-Id: <20221019063925.581928-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
dev_start
- during region_add register a specific IOMMU notifier, and store all notifiers in a list.
- during region_del, compare and delete the IOMMU notifier from the list

Verified in vp_vdpa and vdpa_sim_net driver

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 218 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-vdpa.h |  11 ++
 2 files changed, 226 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 3ff9ce3501..8f36423c28 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -26,6 +26,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "hw/virtio/virtio-access.h"
 
 /*
  * Return one past the end of the end of section. Be careful with uint64_t
@@ -146,9 +147,8 @@ static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
     v->iotlb_batch_begin_sent = true;
 }
 
-static void vhost_vdpa_listener_commit(MemoryListener *listener)
+static void vhost_vdpa_iotlb_batch_end(struct vhost_vdpa *v)
 {
-    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
     struct vhost_dev *dev = v->dev;
     struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
@@ -172,6 +172,18 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
 
     v->iotlb_batch_begin_sent = false;
 }
+static void vhost_vdpa_listener_commit(MemoryListener *listener)
+{
+    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
+    return vhost_vdpa_iotlb_batch_end(v);
+}
+
+static void vhost_vdpa_listener_iommu_commit(MemoryListener *listener)
+{
+    struct vhost_vdpa *v =
+        container_of(listener, struct vhost_vdpa, iommu_listener);
+    return vhost_vdpa_iotlb_batch_end(v);
+}
 
 static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                            MemoryRegionSection *section)
@@ -186,6 +198,9 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        return;
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -260,6 +275,9 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        return;
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -312,6 +330,180 @@ static const MemoryListener vhost_vdpa_memory_listener = {
     .region_del = vhost_vdpa_listener_region_del,
 };
 
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
+    if (iotlb->target_as != &address_space_memory) {
+        error_report("Wrong target AS \"%s\", only system memory is allowed",
+                     iotlb->target_as->name ? iotlb->target_as->name : "none");
+        return;
+    }
+    RCU_READ_LOCK_GUARD();
+    vhost_vdpa_iotlb_batch_begin_once(v);
+
+    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
+        bool read_only;
+
+        if (!vhost_vdpa_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
+            return;
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
@@ -433,6 +625,18 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
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
+
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
     struct vhost_vdpa *v;
@@ -454,6 +658,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     v->dev = dev;
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
+    v->iommu_listener = vhost_vdpa_iommu_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
     ret = vhost_vdpa_init_svq(dev, v, errp);
     if (ret) {
@@ -587,7 +792,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     v = dev->opaque;
     trace_vhost_vdpa_cleanup(dev, v);
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
-    memory_listener_unregister(&v->listener);
     vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
@@ -1128,11 +1332,19 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 
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
                                    VIRTIO_CONFIG_S_DRIVER);
+
+        if (vdpa_dev_has_iommu(dev)) {
+            memory_listener_unregister(&v->iommu_listener);
+        }
         memory_listener_unregister(&v->listener);
 
         return 0;
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index d10a89303e..22cbce7934 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -30,6 +30,7 @@ typedef struct vhost_vdpa {
     uint32_t msg_type;
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
+    MemoryListener iommu_listener;
     struct vhost_vdpa_iova_range iova_range;
     uint64_t acked_features;
     bool shadow_vqs_enabled;
@@ -41,8 +42,18 @@ typedef struct vhost_vdpa {
     void *shadow_vq_ops_opaque;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
+    QLIST_HEAD(, vdpa_iommu) iommu_list;
+    IOMMUNotifier n;
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


