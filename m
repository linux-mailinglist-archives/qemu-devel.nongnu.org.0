Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04192B9686
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 16:44:34 +0100 (CET)
Received: from localhost ([::1]:34170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfm6r-0004Yq-3h
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 10:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfm3T-0001DI-At
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:41:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfm3N-0001jg-FV
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605800456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TyZreyail04jg1e74IsVPjHdxmeDK9VwPeUWNj7hz68=;
 b=Wckx9SUL7vzTCJXBIXNG2K29x9u0fFUS6Yng2SzCriDun3W4FYp7ehfWdpef1LaIby6t5c
 aPlhH7gcaeoSaoR/85T3bTMs+UsbORixWing6D82ZZ1U40HL9Niy3QeZjbIThu3jRhp1b4
 JWdD1D8co8CcipNTfS70VtFn0DRcjxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-kmos0nf7Pjafzv6XR0DX4A-1; Thu, 19 Nov 2020 10:40:53 -0500
X-MC-Unique: kmos0nf7Pjafzv6XR0DX4A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30217E761;
 Thu, 19 Nov 2020 15:40:52 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C89765C1A1;
 Thu, 19 Nov 2020 15:40:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/9] vfio: Support for RamDiscardMgr in the !vIOMMU case
Date: Thu, 19 Nov 2020 16:39:13 +0100
Message-Id: <20201119153918.120976-5-david@redhat.com>
In-Reply-To: <20201119153918.120976-1-david@redhat.com>
References: <20201119153918.120976-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Luiz Capitulino <lcapitulino@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement support for RamDiscardMgr, to prepare for virtio-mem
support. Instead of mapping the whole memory section, we only map
"populated" parts and update the mapping when notified about
discarding/population of memory via the RamDiscardListener. Similarly, when
syncing the dirty bitmaps, sync only the actually mapped (populated) parts
by replaying via the notifier.

Small mapping granularity is problematic for vfio, because we might run out
of mappings. Warn to at least make users aware that there is such a
limitation and that we are dealing with a setup issue e.g., of
virtio-mem devices.

Using virtio-mem with vfio is still blocked via
ram_block_discard_disable()/ram_block_discard_require() after this patch.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/vfio/common.c              | 233 ++++++++++++++++++++++++++++++++++
 include/hw/vfio/vfio-common.h |  12 ++
 2 files changed, 245 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c1fdbf17f2..d52e7356cb 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -27,6 +27,7 @@
 
 #include "hw/vfio/vfio-common.h"
 #include "hw/vfio/vfio.h"
+#include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
 #include "exec/ram_addr.h"
@@ -39,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "qemu/units.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -651,6 +653,167 @@ out:
     rcu_read_unlock();
 }
 
+static void vfio_ram_discard_notify_discard(RamDiscardListener *rdl,
+                                            const MemoryRegion *mr,
+                                            ram_addr_t offset, ram_addr_t size)
+{
+    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
+                                                listener);
+    const hwaddr mr_start = MAX(offset, vrdl->offset_within_region);
+    const hwaddr mr_end = MIN(offset + size,
+                              vrdl->offset_within_region + vrdl->size);
+    const hwaddr iova = mr_start - vrdl->offset_within_region +
+                        vrdl->offset_within_address_space;
+    int ret;
+
+    if (mr_start >= mr_end) {
+        return;
+    }
+
+    /* Unmap with a single call. */
+    ret = vfio_dma_unmap(vrdl->container, iova, mr_end - mr_start, NULL);
+    if (ret) {
+        error_report("%s: vfio_dma_unmap() failed: %s", __func__,
+                     strerror(-ret));
+    }
+}
+
+static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
+                                            const MemoryRegion *mr,
+                                            ram_addr_t offset, ram_addr_t size)
+{
+    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
+                                                listener);
+    const hwaddr mr_end = MIN(offset + size,
+                              vrdl->offset_within_region + vrdl->size);
+    hwaddr mr_start = MAX(offset, vrdl->offset_within_region);
+    hwaddr mr_next, iova;
+    void *vaddr;
+    int ret;
+
+    /*
+     * Map in (aligned within memory region) minimum granularity, so we can
+     * unmap in minimum granularity later.
+     */
+    for (; mr_start < mr_end; mr_start = mr_next) {
+        mr_next = QEMU_ALIGN_UP(mr_start + 1, vrdl->granularity);
+        mr_next = MIN(mr_next, mr_end);
+
+        iova = mr_start - vrdl->offset_within_region +
+               vrdl->offset_within_address_space;
+        vaddr = memory_region_get_ram_ptr(vrdl->mr) + mr_start;
+
+        ret = vfio_dma_map(vrdl->container, iova, mr_next - mr_start,
+                           vaddr, mr->readonly);
+        if (ret) {
+            /* Rollback */
+            vfio_ram_discard_notify_discard(rdl, mr, offset, size);
+            return ret;
+        }
+    }
+    return 0;
+}
+
+static void vfio_ram_discard_notify_discard_all(RamDiscardListener *rdl,
+                                                const MemoryRegion *mr)
+{
+    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
+                                                listener);
+    int ret;
+
+    /* Unmap with a single call. */
+    ret = vfio_dma_unmap(vrdl->container, vrdl->offset_within_address_space,
+                         vrdl->size, NULL);
+    if (ret) {
+        error_report("%s: vfio_dma_unmap() failed: %s", __func__,
+                     strerror(-ret));
+    }
+}
+
+static void vfio_register_ram_discard_notifier(VFIOContainer *container,
+                                               MemoryRegionSection *section)
+{
+    RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(section->mr);
+    RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
+    MachineState *ms = MACHINE(qdev_get_machine());
+    uint64_t suggested_granularity;
+    VFIORamDiscardListener *vrdl;
+    int ret;
+
+    vrdl = g_new0(VFIORamDiscardListener, 1);
+    vrdl->container = container;
+    vrdl->mr = section->mr;
+    vrdl->offset_within_region = section->offset_within_region;
+    vrdl->offset_within_address_space = section->offset_within_address_space;
+    vrdl->size = int128_get64(section->size);
+    vrdl->granularity = rdmc->get_min_granularity(rdm, section->mr);
+
+    /* Ignore some corner cases not relevant in practice. */
+    g_assert(QEMU_IS_ALIGNED(vrdl->offset_within_region, TARGET_PAGE_SIZE));
+    g_assert(QEMU_IS_ALIGNED(vrdl->offset_within_address_space,
+                             TARGET_PAGE_SIZE));
+    g_assert(QEMU_IS_ALIGNED(vrdl->size, TARGET_PAGE_SIZE));
+
+    /*
+     * We assume initial RAM never has a RamDiscardMgr and that all memory
+     * to eventually get hotplugged later could be coordinated via a
+     * RamDiscardMgr ("worst case").
+     *
+     * We assume the Linux kernel is configured ("dma_entry_limit") for the
+     * maximum of 65535 mappings and that we can consume roughly half of that
+     * for this purpose.
+     *
+     * In reality, we might also have RAM without a RamDiscardMgr in our device
+     * memory region and might be able to consume more mappings.
+     */
+    suggested_granularity = pow2ceil((ms->maxram_size - ms->ram_size) / 32768);
+    suggested_granularity = MAX(suggested_granularity, 1 * MiB);
+    if (vrdl->granularity < suggested_granularity) {
+        warn_report("%s: eventually problematic mapping granularity (%" PRId64
+                    " MiB) with coordinated discards (e.g., 'block-size' in"
+                    " virtio-mem). Suggested minimum granularity: %" PRId64
+                    " MiB", __func__, vrdl->granularity / MiB,
+                    suggested_granularity / MiB);
+    }
+
+    ram_discard_listener_init(&vrdl->listener,
+                              vfio_ram_discard_notify_populate,
+                              vfio_ram_discard_notify_discard,
+                              vfio_ram_discard_notify_discard_all);
+    rdmc->register_listener(rdm, section->mr, &vrdl->listener);
+    QLIST_INSERT_HEAD(&container->vrdl_list, vrdl, next);
+
+    ret = rdmc->replay_populated(rdm, section->mr, &vrdl->listener);
+    if (ret) {
+        error_report("%s: failed to replay populated memory: %s", __func__,
+                     strerror(-ret));
+    }
+}
+
+static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
+                                                 MemoryRegionSection *section)
+{
+    RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(section->mr);
+    RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
+    VFIORamDiscardListener *vrdl = NULL;
+
+    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
+        if (vrdl->mr == section->mr &&
+            vrdl->offset_within_region == section->offset_within_region) {
+            break;
+        }
+    }
+
+    if (!vrdl) {
+        hw_error("vfio: Trying to unregister missing RAM discard listener");
+    }
+
+    rdmc->unregister_listener(rdm, section->mr, &vrdl->listener);
+    QLIST_REMOVE(vrdl, next);
+    g_free(vrdl);
+    /* The caller is expected to vfio_dma_unmap(). */
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -811,6 +974,16 @@ static void vfio_listener_region_add(MemoryListener *listener,
 
     /* Here we assume that memory_region_is_ram(section->mr)==true */
 
+    /*
+     * For RAM memory regions with a RamDiscardMgr, we only want to
+     * register the actually "used" parts - and update the mapping whenever
+     * we're notified about changes.
+     */
+    if (memory_region_has_ram_discard_mgr(section->mr)) {
+        vfio_register_ram_discard_notifier(container, section);
+        return;
+    }
+
     vaddr = memory_region_get_ram_ptr(section->mr) +
             section->offset_within_region +
             (iova - section->offset_within_address_space);
@@ -947,6 +1120,10 @@ static void vfio_listener_region_del(MemoryListener *listener,
 
         pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
         try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
+    } else if (memory_region_has_ram_discard_mgr(section->mr)) {
+        vfio_unregister_ram_discard_listener(container, section);
+        /* We rely on a single vfio_dma_unmap() call below. */
+        try_unmap = true;
     }
 
     if (try_unmap) {
@@ -1074,6 +1251,59 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     rcu_read_unlock();
 }
 
+static int vfio_ram_discard_notify_dirty_bitmap(RamDiscardListener *rdl,
+                                                const MemoryRegion *mr,
+                                                ram_addr_t offset,
+                                                ram_addr_t size)
+{
+    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
+                                                listener);
+    const hwaddr mr_start = MAX(offset, vrdl->offset_within_region);
+    const hwaddr mr_end = MIN(offset + size,
+                              vrdl->offset_within_region + vrdl->size);
+    const hwaddr iova = mr_start - vrdl->offset_within_region +
+                        vrdl->offset_within_address_space;
+    ram_addr_t ram_addr;
+    int ret;
+
+    if (mr_start >= mr_end) {
+        return 0;
+    }
+
+    /*
+     * Sync the whole mapped region (spanning multiple individual mappings)
+     * in one go.
+     */
+    ram_addr = memory_region_get_ram_addr(vrdl->mr) + mr_start;
+    ret = vfio_get_dirty_bitmap(vrdl->container, iova, mr_end - mr_start,
+                                ram_addr);
+    return ret;
+}
+
+static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
+                                                   MemoryRegionSection *section)
+{
+    RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(section->mr);
+    RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
+    VFIORamDiscardListener tmp_vrdl, *vrdl = NULL;
+
+    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
+        if (vrdl->mr == section->mr &&
+            vrdl->offset_within_region == section->offset_within_region) {
+            break;
+        }
+    }
+
+    if (!vrdl) {
+        hw_error("vfio: Trying to sync missing RAM discard listener");
+    }
+
+    tmp_vrdl = *vrdl;
+    ram_discard_listener_init(&tmp_vrdl.listener,
+                              vfio_ram_discard_notify_dirty_bitmap, NULL, NULL);
+    return rdmc->replay_populated(rdm, section->mr, &tmp_vrdl.listener);
+}
+
 static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                                   MemoryRegionSection *section)
 {
@@ -1105,6 +1335,8 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
             }
         }
         return 0;
+    } else if (memory_region_has_ram_discard_mgr(section->mr)) {
+        return vfio_sync_ram_discard_listener_dirty_bitmap(container, section);
     }
 
     ram_addr = memory_region_get_ram_addr(section->mr) +
@@ -1734,6 +1966,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->dirty_pages_supported = false;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
+    QLIST_INIT(&container->vrdl_list);
 
     ret = vfio_init_container(container, group->fd, errp);
     if (ret) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index baeb4dcff1..5895e520aa 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -91,6 +91,7 @@ typedef struct VFIOContainer {
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
+    QLIST_HEAD(, VFIORamDiscardListener) vrdl_list;
     QLIST_ENTRY(VFIOContainer) next;
 } VFIOContainer;
 
@@ -102,6 +103,17 @@ typedef struct VFIOGuestIOMMU {
     QLIST_ENTRY(VFIOGuestIOMMU) giommu_next;
 } VFIOGuestIOMMU;
 
+typedef struct VFIORamDiscardListener {
+    VFIOContainer *container;
+    MemoryRegion *mr;
+    hwaddr offset_within_region;
+    hwaddr offset_within_address_space;
+    hwaddr size;
+    uint64_t granularity;
+    RamDiscardListener listener;
+    QLIST_ENTRY(VFIORamDiscardListener) next;
+} VFIORamDiscardListener;
+
 typedef struct VFIOHostDMAWindow {
     hwaddr min_iova;
     hwaddr max_iova;
-- 
2.26.2


