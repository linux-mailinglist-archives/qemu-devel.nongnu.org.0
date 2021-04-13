Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5368C35DC11
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:01:15 +0200 (CEST)
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFr8-0001Uq-CF
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFoT-0008Dj-Uh
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFoR-0004wo-JC
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618307907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOStPQQt0mqHHSgBcrb78nNDmXoRuFFG9gm7xqarcq0=;
 b=gzZDhQaIQHBD/gjFEiPfz8Uzy6v0KzFcvZYKuijE2w/66NtFXKEXJ6vjytLggOhtOitRXt
 LzblUPJhAqMlJ4BUdKvWt7xogTMoByEdGJaXJf20P2FMkexv4jzYFCbLqbLHsfhrz5TH3U
 lxlyaA23Gs2G4H2PQvnjL09q7Zx/T+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-xiFq6xoVMxS7SiYcPga_tw-1; Tue, 13 Apr 2021 05:58:25 -0400
X-MC-Unique: xiFq6xoVMxS7SiYcPga_tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FE6A1922960;
 Tue, 13 Apr 2021 09:58:24 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-69.ams2.redhat.com [10.36.115.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AF9A5E1A4;
 Tue, 13 Apr 2021 09:58:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v7 06/13] vfio: Support for RamDiscardManager in the
 !vIOMMU case
Date: Tue, 13 Apr 2021 11:55:24 +0200
Message-Id: <20210413095531.25603-7-david@redhat.com>
In-Reply-To: <20210413095531.25603-1-david@redhat.com>
References: <20210413095531.25603-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement support for RamDiscardManager, to prepare for virtio-mem
support. Instead of mapping the whole memory section, we only map
"populated" parts and update the mapping when notified about
discarding/population of memory via the RamDiscardListener. Similarly, when
syncing the dirty bitmaps, sync only the actually mapped (populated) parts
by replaying via the notifier.

Using virtio-mem with vfio is still blocked via
ram_block_discard_disable()/ram_block_discard_require() after this patch.

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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
 hw/vfio/common.c              | 164 ++++++++++++++++++++++++++++++++++
 include/hw/vfio/vfio-common.h |  11 +++
 2 files changed, 175 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654fcdb..5af7755227 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -649,6 +649,110 @@ out:
     rcu_read_unlock();
 }
 
+static void vfio_ram_discard_notify_discard(RamDiscardListener *rdl,
+                                            MemoryRegionSection *section)
+{
+    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
+                                                listener);
+    const hwaddr size = int128_get64(section->size);
+    const hwaddr iova = section->offset_within_address_space;
+    int ret;
+
+    /* Unmap with a single call. */
+    ret = vfio_dma_unmap(vrdl->container, iova, size , NULL);
+    if (ret) {
+        error_report("%s: vfio_dma_unmap() failed: %s", __func__,
+                     strerror(-ret));
+    }
+}
+
+static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
+                                            MemoryRegionSection *section)
+{
+    VFIORamDiscardListener *vrdl = container_of(rdl, VFIORamDiscardListener,
+                                                listener);
+    const hwaddr end = section->offset_within_region +
+                       int128_get64(section->size);
+    hwaddr start, next, iova;
+    void *vaddr;
+    int ret;
+
+    /*
+     * Map in (aligned within memory region) minimum granularity, so we can
+     * unmap in minimum granularity later.
+     */
+    for (start = section->offset_within_region; start < end; start = next) {
+        next = ROUND_UP(start + 1, vrdl->granularity);
+        next = MIN(next, end);
+
+        iova = start - section->offset_within_region +
+               section->offset_within_address_space;
+        vaddr = memory_region_get_ram_ptr(section->mr) + start;
+
+        ret = vfio_dma_map(vrdl->container, iova, next - start,
+                           vaddr, section->readonly);
+        if (ret) {
+            /* Rollback */
+            vfio_ram_discard_notify_discard(rdl, section);
+            return ret;
+        }
+    }
+    return 0;
+}
+
+static void vfio_register_ram_discard_listener(VFIOContainer *container,
+                                               MemoryRegionSection *section)
+{
+    RamDiscardManager *rdm = memory_region_get_ram_discard_manager(section->mr);
+    VFIORamDiscardListener *vrdl;
+
+    /* Ignore some corner cases not relevant in practice. */
+    g_assert(QEMU_IS_ALIGNED(section->offset_within_region, TARGET_PAGE_SIZE));
+    g_assert(QEMU_IS_ALIGNED(section->offset_within_address_space,
+                             TARGET_PAGE_SIZE));
+    g_assert(QEMU_IS_ALIGNED(int128_get64(section->size), TARGET_PAGE_SIZE));
+
+    vrdl = g_new0(VFIORamDiscardListener, 1);
+    vrdl->container = container;
+    vrdl->mr = section->mr;
+    vrdl->offset_within_address_space = section->offset_within_address_space;
+    vrdl->size = int128_get64(section->size);
+    vrdl->granularity = ram_discard_manager_get_min_granularity(rdm,
+                                                                section->mr);
+
+    g_assert(vrdl->granularity && is_power_of_2(vrdl->granularity));
+    g_assert(vrdl->granularity >= 1 << ctz64(container->pgsizes));
+
+    ram_discard_listener_init(&vrdl->listener,
+                              vfio_ram_discard_notify_populate,
+                              vfio_ram_discard_notify_discard, true);
+    ram_discard_manager_register_listener(rdm, &vrdl->listener, section);
+    QLIST_INSERT_HEAD(&container->vrdl_list, vrdl, next);
+}
+
+static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
+                                                 MemoryRegionSection *section)
+{
+    RamDiscardManager *rdm = memory_region_get_ram_discard_manager(section->mr);
+    VFIORamDiscardListener *vrdl = NULL;
+
+    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
+        if (vrdl->mr == section->mr &&
+            vrdl->offset_within_address_space ==
+            section->offset_within_address_space) {
+            break;
+        }
+    }
+
+    if (!vrdl) {
+        hw_error("vfio: Trying to unregister missing RAM discard listener");
+    }
+
+    ram_discard_manager_unregister_listener(rdm, &vrdl->listener);
+    QLIST_REMOVE(vrdl, next);
+    g_free(vrdl);
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -810,6 +914,16 @@ static void vfio_listener_region_add(MemoryListener *listener,
 
     /* Here we assume that memory_region_is_ram(section->mr)==true */
 
+    /*
+     * For RAM memory regions with a RamDiscardManager, we only want to map the
+     * actually populated parts - and update the mapping whenever we're notified
+     * about changes.
+     */
+    if (memory_region_has_ram_discard_manager(section->mr)) {
+        vfio_register_ram_discard_listener(container, section);
+        return;
+    }
+
     vaddr = memory_region_get_ram_ptr(section->mr) +
             section->offset_within_region +
             (iova - section->offset_within_address_space);
@@ -947,6 +1061,10 @@ static void vfio_listener_region_del(MemoryListener *listener,
 
         pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
         try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
+    } else if (memory_region_has_ram_discard_manager(section->mr)) {
+        vfio_unregister_ram_discard_listener(container, section);
+        /* Unregistering will trigger an unmap. */
+        try_unmap = false;
     }
 
     if (try_unmap) {
@@ -1108,6 +1226,49 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     rcu_read_unlock();
 }
 
+static int vfio_ram_discard_get_dirty_bitmap(MemoryRegionSection *section,
+                                             void *opaque)
+{
+    const hwaddr size = int128_get64(section->size);
+    const hwaddr iova = section->offset_within_address_space;
+    const ram_addr_t ram_addr = memory_region_get_ram_addr(section->mr) +
+                                section->offset_within_region;
+    VFIORamDiscardListener *vrdl = opaque;
+
+    /*
+     * Sync the whole mapped region (spanning multiple individual mappings)
+     * in one go.
+     */
+    return vfio_get_dirty_bitmap(vrdl->container, iova, size, ram_addr);
+}
+
+static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
+                                                   MemoryRegionSection *section)
+{
+    RamDiscardManager *rdm = memory_region_get_ram_discard_manager(section->mr);
+    VFIORamDiscardListener *vrdl = NULL;
+
+    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
+        if (vrdl->mr == section->mr &&
+            vrdl->offset_within_address_space ==
+            section->offset_within_address_space) {
+            break;
+        }
+    }
+
+    if (!vrdl) {
+        hw_error("vfio: Trying to sync missing RAM discard listener");
+    }
+
+    /*
+     * We only want/can synchronize the bitmap for actually mapped parts -
+     * which correspond to populated parts. Replay all populated parts.
+     */
+    return ram_discard_manager_replay_populated(rdm, section,
+                                              vfio_ram_discard_get_dirty_bitmap,
+                                                &vrdl);
+}
+
 static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                                   MemoryRegionSection *section)
 {
@@ -1139,6 +1300,8 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
             }
         }
         return 0;
+    } else if (memory_region_has_ram_discard_manager(section->mr)) {
+        return vfio_sync_ram_discard_listener_dirty_bitmap(container, section);
     }
 
     ram_addr = memory_region_get_ram_addr(section->mr) +
@@ -1770,6 +1933,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->dirty_pages_supported = false;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
+    QLIST_INIT(&container->vrdl_list);
 
     ret = vfio_init_container(container, group->fd, errp);
     if (ret) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6141162d7a..681432213d 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -91,6 +91,7 @@ typedef struct VFIOContainer {
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
+    QLIST_HEAD(, VFIORamDiscardListener) vrdl_list;
     QLIST_ENTRY(VFIOContainer) next;
 } VFIOContainer;
 
@@ -102,6 +103,16 @@ typedef struct VFIOGuestIOMMU {
     QLIST_ENTRY(VFIOGuestIOMMU) giommu_next;
 } VFIOGuestIOMMU;
 
+typedef struct VFIORamDiscardListener {
+    VFIOContainer *container;
+    MemoryRegion *mr;
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
2.30.2


