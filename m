Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAED635DC16
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:03:20 +0200 (CEST)
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFtA-0004aP-08
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFn1-00079p-Gx
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:56:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFmy-0004Bg-LY
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618307816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Vhrz0kfHTns1X4c1uf0ed01YYwIHZK57+R+PKXqD9o=;
 b=MJhfu3d/RGuZrW9unBV6uTa0e/ZRQGHMAARBkDv+ACYgXRw/TvT2uTmuvt4l0O13XhbQTR
 8BlcqbazLeDlXnl7n/3B4zkPsRm/PZ26ZMqDiQRvVpbZ/g+mPdJeuakDATfwRB/zFT6+Y9
 +O5XpkicjRBOjh8W6dEOuoB326bcblg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-zjycwCCWMBedUM1GiN3q0A-1; Tue, 13 Apr 2021 05:56:54 -0400
X-MC-Unique: zjycwCCWMBedUM1GiN3q0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37F5D1084423;
 Tue, 13 Apr 2021 09:56:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-69.ams2.redhat.com [10.36.115.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ABAD5C8A8;
 Tue, 13 Apr 2021 09:56:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v7 01/13] memory: Introduce RamDiscardManager for RAM
 memory regions
Date: Tue, 13 Apr 2021 11:55:19 +0200
Message-Id: <20210413095531.25603-2-david@redhat.com>
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
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have some special RAM memory regions (managed by virtio-mem), whereby
the guest agreed to only use selected memory ranges. "unused" parts are
discarded so they won't consume memory - to logically unplug these memory
ranges. Before the VM is allowed to use such logically unplugged memory
again, coordination with the hypervisor is required.

This results in "sparse" mmaps/RAMBlocks/memory regions, whereby only
coordinated parts are valid to be used/accessed by the VM.

In most cases, we don't care about that - e.g., in KVM, we simply have a
single KVM memory slot. However, in case of vfio, registering the
whole region with the kernel results in all pages getting pinned, and
therefore an unexpected high memory consumption - discarding of RAM in
that context is broken.

Let's introduce a way to coordinate discarding/populating memory within a
RAM memory region with such special consumers of RAM memory regions: they
can register as listeners and get updates on memory getting discarded and
populated. Using this machinery, vfio will be able to map only the
currently populated parts, resulting in discarded parts not getting pinned
and not consuming memory.

A RamDiscardManager has to be set for a memory region before it is getting
mapped, and cannot change while the memory region is mapped.

Note: At some point, we might want to let RAMBlock users (esp. vfio used
for nvme://) consume this interface as well. We'll need RAMBlock notifier
calls when a RAMBlock is getting mapped/unmapped (via the corresponding
memory region), so we can properly register a listener there as well.

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
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
 include/exec/memory.h | 286 ++++++++++++++++++++++++++++++++++++++----
 softmmu/memory.c      |  71 +++++++++++
 2 files changed, 335 insertions(+), 22 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b2..38a3b41ac1 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -42,6 +42,12 @@ typedef struct IOMMUMemoryRegionClass IOMMUMemoryRegionClass;
 DECLARE_OBJ_CHECKERS(IOMMUMemoryRegion, IOMMUMemoryRegionClass,
                      IOMMU_MEMORY_REGION, TYPE_IOMMU_MEMORY_REGION)
 
+#define TYPE_RAM_DISCARD_MANAGER "qemu:ram-discard-manager"
+typedef struct RamDiscardManagerClass RamDiscardManagerClass;
+typedef struct RamDiscardManager RamDiscardManager;
+DECLARE_OBJ_CHECKERS(RamDiscardManager, RamDiscardManagerClass,
+                     RAM_DISCARD_MANAGER, TYPE_RAM_DISCARD_MANAGER);
+
 #ifdef CONFIG_FUZZ
 void fuzz_dma_read_cb(size_t addr,
                       size_t len,
@@ -65,6 +71,28 @@ struct ReservedRegion {
     unsigned type;
 };
 
+/**
+ * struct MemoryRegionSection: describes a fragment of a #MemoryRegion
+ *
+ * @mr: the region, or %NULL if empty
+ * @fv: the flat view of the address space the region is mapped in
+ * @offset_within_region: the beginning of the section, relative to @mr's start
+ * @size: the size of the section; will not exceed @mr's boundaries
+ * @offset_within_address_space: the address of the first byte of the section
+ *     relative to the region's address space
+ * @readonly: writes to this section are ignored
+ * @nonvolatile: this section is non-volatile
+ */
+struct MemoryRegionSection {
+    Int128 size;
+    MemoryRegion *mr;
+    FlatView *fv;
+    hwaddr offset_within_region;
+    hwaddr offset_within_address_space;
+    bool readonly;
+    bool nonvolatile;
+};
+
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
 
 /* See address_space_translate: bit 0 is read, bit 1 is write.  */
@@ -441,6 +469,206 @@ struct IOMMUMemoryRegionClass {
                                      Error **errp);
 };
 
+typedef struct RamDiscardListener RamDiscardListener;
+typedef int (*NotifyRamPopulate)(RamDiscardListener *rdl,
+                                 MemoryRegionSection *section);
+typedef void (*NotifyRamDiscard)(RamDiscardListener *rdl,
+                                 MemoryRegionSection *section);
+
+struct RamDiscardListener {
+    /*
+     * @notify_populate:
+     *
+     * Notification that previously discarded memory is about to get populated.
+     * Listeners are able to object. If any listener objects, already
+     * successfully notified listeners are notified about a discard again.
+     *
+     * @rdl: the #RamDiscardListener getting notified
+     * @section: the #MemoryRegionSection to get populated. The section
+     *           is aligned within the memory region to the minimum granularity
+     *           unless it would exceed the registered section.
+     *
+     * Returns 0 on success. If the notification is rejected by the listener,
+     * an error is returned.
+     */
+    NotifyRamPopulate notify_populate;
+
+    /*
+     * @notify_discard:
+     *
+     * Notification that previously populated memory was discarded successfully
+     * and listeners should drop all references to such memory and prevent
+     * new population (e.g., unmap).
+     *
+     * @rdl: the #RamDiscardListener getting notified
+     * @section: the #MemoryRegionSection to get populated. The section
+     *           is aligned within the memory region to the minimum granularity
+     *           unless it would exceed the registered section.
+     */
+    NotifyRamDiscard notify_discard;
+
+    /*
+     * @double_discard_supported:
+     *
+     * The listener suppors getting @notify_discard notifications that span
+     * already discarded parts.
+     */
+    bool double_discard_supported;
+
+    MemoryRegionSection *section;
+    QLIST_ENTRY(RamDiscardListener) next;
+};
+
+static inline void ram_discard_listener_init(RamDiscardListener *rdl,
+                                             NotifyRamPopulate populate_fn,
+                                             NotifyRamDiscard discard_fn,
+                                             bool double_discard_supported)
+{
+    rdl->notify_populate = populate_fn;
+    rdl->notify_discard = discard_fn;
+    rdl->double_discard_supported = double_discard_supported;
+}
+
+typedef int (*ReplayRamPopulate)(MemoryRegionSection *section, void *opaque);
+
+/*
+ * RamDiscardManagerClass:
+ *
+ * A #RamDiscardManager coordinates which parts of specific RAM #MemoryRegion
+ * regions are currently populated to be used/accessed by the VM, notifying
+ * after parts were discarded (freeing up memory) and before parts will be
+ * populated (consuming memory), to be used/acessed by the VM.
+ *
+ * A #RamDiscardManager can only be set for a RAM #MemoryRegion while the
+ * #MemoryRegion isn't mapped yet; it cannot change while the #MemoryRegion is
+ * mapped.
+ *
+ * The #RamDiscardManager is intended to be used by technologies that are
+ * incompatible with discarding of RAM (e.g., VFIO, which may pin all
+ * memory inside a #MemoryRegion), and require proper coordination to only
+ * map the currently populated parts, to hinder parts that are expected to
+ * remain discarded from silently getting populated and consuming memory.
+ * Technologies that support discarding of RAM don't have to bother and can
+ * simply map the whole #MemoryRegion.
+ *
+ * An example #RamDiscardManager is virtio-mem, which logically (un)plugs
+ * memory within an assigned RAM #MemoryRegion, coordinated with the VM.
+ * Logically unplugging memory consists of discarding RAM. The VM agreed to not
+ * access unplugged (discarded) memory - especially via DMA. virtio-mem will
+ * properly coordinate with listeners before memory is plugged (populated),
+ * and after memory is unplugged (discarded).
+ *
+ * Listeners are called in multiples of the minimum granularity (unless it
+ * would exceed the registered range) and changes are aligned to the minimum
+ * granularity within the #MemoryRegion. Listeners have to prepare for memory
+ * becomming discarded in a different granularity than it was populated and the
+ * other way around.
+ */
+struct RamDiscardManagerClass {
+    /* private */
+    InterfaceClass parent_class;
+
+    /* public */
+
+    /**
+     * @get_min_granularity:
+     *
+     * Get the minimum granularity in which listeners will get notified
+     * about changes within the #MemoryRegion via the #RamDiscardManager.
+     *
+     * @rdm: the #RamDiscardManager
+     * @mr: the #MemoryRegion
+     *
+     * Returns the minimum granularity.
+     */
+    uint64_t (*get_min_granularity)(const RamDiscardManager *rdm,
+                                    const MemoryRegion *mr);
+
+    /**
+     * @is_populated:
+     *
+     * Check whether the given #MemoryRegionSection is completely populated
+     * (i.e., no parts are currently discarded) via the #RamDiscardManager.
+     * There are no alignment requirements.
+     *
+     * @rdm: the #RamDiscardManager
+     * @section: the #MemoryRegionSection
+     *
+     * Returns whether the given range is completely populated.
+     */
+    bool (*is_populated)(const RamDiscardManager *rdm,
+                         const MemoryRegionSection *section);
+
+    /**
+     * @replay_populated:
+     *
+     * Call the #ReplayRamPopulate callback for all populated parts within the
+     * #MemoryRegionSection via the #RamDiscardManager.
+     *
+     * In case any call fails, no further calls are made.
+     *
+     * @rdm: the #RamDiscardManager
+     * @section: the #MemoryRegionSection
+     * @replay_fn: the #ReplayRamPopulate callback
+     * @opaque: pointer to forward to the callback
+     *
+     * Returns 0 on success, or a negative error if any notification failed.
+     */
+    int (*replay_populated)(const RamDiscardManager *rdm,
+                            MemoryRegionSection *section,
+                            ReplayRamPopulate replay_fn, void *opaque);
+
+    /**
+     * @register_listener:
+     *
+     * Register a #RamDiscardListener for the given #MemoryRegionSection and
+     * immediately notify the #RamDiscardListener about all populated parts
+     * within the #MemoryRegionSection via the #RamDiscardManager.
+     *
+     * In case any notification fails, no further notifications are triggered
+     * and an error is logged.
+     *
+     * @rdm: the #RamDiscardManager
+     * @rdl: the #RamDiscardListener
+     * @section: the #MemoryRegionSection
+     */
+    void (*register_listener)(RamDiscardManager *rdm,
+                              RamDiscardListener *rdl,
+                              MemoryRegionSection *section);
+
+    /**
+     * @unregister_listener:
+     *
+     * Unregister a previously registered #RamDiscardListener via the
+     * #RamDiscardManager after notifying the #RamDiscardListener about all
+     * populated parts becoming unpopulated within the registered
+     * #MemoryRegionSection.
+     *
+     * @rdm: the #RamDiscardManager
+     * @rdl: the #RamDiscardListener
+     */
+    void (*unregister_listener)(RamDiscardManager *rdm,
+                                RamDiscardListener *rdl);
+};
+
+uint64_t ram_discard_manager_get_min_granularity(const RamDiscardManager *rdm,
+                                                 const MemoryRegion *mr);
+
+bool ram_discard_manager_is_populated(const RamDiscardManager *rdm,
+                                      const MemoryRegionSection *section);
+
+int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
+                                         MemoryRegionSection *section,
+                                         ReplayRamPopulate replay_fn,
+                                         void *opaque);
+
+void ram_discard_manager_register_listener(RamDiscardManager *rdm,
+                                           RamDiscardListener *rdl,
+                                           MemoryRegionSection *section);
+
+void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
+                                             RamDiscardListener *rdl);
+
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
 typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
 
@@ -487,6 +715,7 @@ struct MemoryRegion {
     const char *name;
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
+    RamDiscardManager *rdm; /* Only for RAM */
 };
 
 struct IOMMUMemoryRegion {
@@ -806,28 +1035,6 @@ typedef bool (*flatview_cb)(Int128 start,
  */
 void flatview_for_each_range(FlatView *fv, flatview_cb cb, void *opaque);
 
-/**
- * struct MemoryRegionSection: describes a fragment of a #MemoryRegion
- *
- * @mr: the region, or %NULL if empty
- * @fv: the flat view of the address space the region is mapped in
- * @offset_within_region: the beginning of the section, relative to @mr's start
- * @size: the size of the section; will not exceed @mr's boundaries
- * @offset_within_address_space: the address of the first byte of the section
- *     relative to the region's address space
- * @readonly: writes to this section are ignored
- * @nonvolatile: this section is non-volatile
- */
-struct MemoryRegionSection {
-    Int128 size;
-    MemoryRegion *mr;
-    FlatView *fv;
-    hwaddr offset_within_region;
-    hwaddr offset_within_address_space;
-    bool readonly;
-    bool nonvolatile;
-};
-
 static inline bool MemoryRegionSection_eq(MemoryRegionSection *a,
                                           MemoryRegionSection *b)
 {
@@ -2003,6 +2210,41 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
  */
 bool memory_region_is_mapped(MemoryRegion *mr);
 
+/**
+ * memory_region_get_ram_discard_manager: get the #RamDiscardManager for a
+ * #MemoryRegion
+ *
+ * The #RamDiscardManager cannot change while a memory region is mapped.
+ *
+ * @mr: the #MemoryRegion
+ */
+RamDiscardManager *memory_region_get_ram_discard_manager(MemoryRegion *mr);
+
+/**
+ * memory_region_has_ram_discard_manager: check whether a #MemoryRegion has a
+ * #RamDiscardManager assigned
+ *
+ * @mr: the #MemoryRegion
+ */
+static inline bool memory_region_has_ram_discard_manager(MemoryRegion *mr)
+{
+    return !!memory_region_get_ram_discard_manager(mr);
+}
+
+/**
+ * memory_region_set_ram_discard_manager: set the #RamDiscardManager for a
+ * #MemoryRegion
+ *
+ * This function must not be called for a mapped #MemoryRegion, a #MemoryRegion
+ * that does not cover RAM, or a #MemoryRegion that already has a
+ * #RamDiscardManager assigned.
+ *
+ * @mr: the #MemoryRegion
+ * @urn: #RamDiscardManager to set
+ */
+void memory_region_set_ram_discard_manager(MemoryRegion *mr,
+                                           RamDiscardManager *rdm);
+
 /**
  * memory_region_find: translate an address/size relative to a
  * MemoryRegion into a #MemoryRegionSection.
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef9e4..26ea87d77a 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2030,6 +2030,70 @@ int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr)
     return imrc->num_indexes(iommu_mr);
 }
 
+RamDiscardManager *memory_region_get_ram_discard_manager(MemoryRegion *mr)
+{
+    if (!memory_region_is_mapped(mr) || !memory_region_is_ram(mr)) {
+        return NULL;
+    }
+    return mr->rdm;
+}
+
+void memory_region_set_ram_discard_manager(MemoryRegion *mr,
+                                           RamDiscardManager *rdm)
+{
+    g_assert(memory_region_is_ram(mr) && !memory_region_is_mapped(mr));
+    g_assert(!rdm || !mr->rdm);
+    mr->rdm = rdm;
+}
+
+uint64_t ram_discard_manager_get_min_granularity(const RamDiscardManager *rdm,
+                                                 const MemoryRegion *mr)
+{
+    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_GET_CLASS(rdm);
+
+    g_assert(rdmc->get_min_granularity);
+    return rdmc->get_min_granularity(rdm, mr);
+}
+
+bool ram_discard_manager_is_populated(const RamDiscardManager *rdm,
+                                      const MemoryRegionSection *section)
+{
+    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_GET_CLASS(rdm);
+
+    g_assert(rdmc->is_populated);
+    return rdmc->is_populated(rdm, section);
+}
+
+int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
+                                         MemoryRegionSection *section,
+                                         ReplayRamPopulate replay_fn,
+                                         void *opaque)
+{
+    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_GET_CLASS(rdm);
+
+    g_assert(rdmc->replay_populated);
+    return rdmc->replay_populated(rdm, section, replay_fn, opaque);
+}
+
+void ram_discard_manager_register_listener(RamDiscardManager *rdm,
+                                           RamDiscardListener *rdl,
+                                           MemoryRegionSection *section)
+{
+    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_GET_CLASS(rdm);
+
+    g_assert(rdmc->register_listener);
+    rdmc->register_listener(rdm, rdl, section);
+}
+
+void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
+                                             RamDiscardListener *rdl)
+{
+    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_GET_CLASS(rdm);
+
+    g_assert(rdmc->unregister_listener);
+    rdmc->unregister_listener(rdm, rdl);
+}
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask = 1 << client;
@@ -3310,10 +3374,17 @@ static const TypeInfo iommu_memory_region_info = {
     .abstract           = true,
 };
 
+static const TypeInfo ram_discard_manager_info = {
+    .parent             = TYPE_INTERFACE,
+    .name               = TYPE_RAM_DISCARD_MANAGER,
+    .class_size         = sizeof(RamDiscardManagerClass),
+};
+
 static void memory_register_types(void)
 {
     type_register_static(&memory_region_info);
     type_register_static(&iommu_memory_region_info);
+    type_register_static(&ram_discard_manager_info);
 }
 
 type_init(memory_register_types)
-- 
2.30.2


