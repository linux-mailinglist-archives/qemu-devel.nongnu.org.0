Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C92ED0EA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 14:38:09 +0100 (CET)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVUO-0005q2-Bz
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 08:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVRR-0004RX-9k
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:35:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVRO-0003s8-Uz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:35:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610026502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dy1ZZY0ZHnLHtYewSSoq4Ihnmm7sy7AHSwV/WxbUlVY=;
 b=Pc0Ck6aoH84jffSm3aa34PfyYJrghGinKbS8Z4J1d5tqCWIEzG6+m9z/dOOnwfPpbmQVUI
 fp3mPu5WjjWpMe7dKb49XO3+nVCs4xN9QQUvpKGH1TR6abJI4ZxbjYQwR1AVYLx52nGFxB
 gbAZhQHrw6cLFXMLkrkiA3OguInOFo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-ZVpCKl-JP4m7qp18hdaV9Q-1; Thu, 07 Jan 2021 08:35:00 -0500
X-MC-Unique: ZVpCKl-JP4m7qp18hdaV9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C24521005504;
 Thu,  7 Jan 2021 13:34:58 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-161.ams2.redhat.com [10.36.114.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BD9B18811;
 Thu,  7 Jan 2021 13:34:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/11] memory: Introduce RamDiscardMgr for RAM memory
 regions
Date: Thu,  7 Jan 2021 14:34:13 +0100
Message-Id: <20210107133423.44964-2-david@redhat.com>
In-Reply-To: <20210107133423.44964-1-david@redhat.com>
References: <20210107133423.44964-1-david@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
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

A RamDiscardMgr has to be set for a memory region before it is getting
mapped, and cannot change while the memory region is mapped.

Note: At some point, we might want to let RAMBlock users (esp. vfio used
for nvme://) consume this interface as well. We'll need RAMBlock notifier
calls when a RAMBlock is getting mapped/unmapped (via the corresponding
memory region), so we can properly register a listener there as well.

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
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
 include/exec/memory.h | 231 ++++++++++++++++++++++++++++++++++++++++++
 softmmu/memory.c      |  22 ++++
 2 files changed, 253 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 521d9901d7..67d9f1f3a7 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -42,6 +42,12 @@ typedef struct IOMMUMemoryRegionClass IOMMUMemoryRegionClass;
 DECLARE_OBJ_CHECKERS(IOMMUMemoryRegion, IOMMUMemoryRegionClass,
                      IOMMU_MEMORY_REGION, TYPE_IOMMU_MEMORY_REGION)
 
+#define TYPE_RAM_DISCARD_MGR "qemu:ram-discard-mgr"
+typedef struct RamDiscardMgrClass RamDiscardMgrClass;
+typedef struct RamDiscardMgr RamDiscardMgr;
+DECLARE_OBJ_CHECKERS(RamDiscardMgr, RamDiscardMgrClass, RAM_DISCARD_MGR,
+                     TYPE_RAM_DISCARD_MGR);
+
 #ifdef CONFIG_FUZZ
 void fuzz_dma_read_cb(size_t addr,
                       size_t len,
@@ -126,6 +132,66 @@ typedef struct IOMMUTLBEvent {
     IOMMUTLBEntry entry;
 } IOMMUTLBEvent;
 
+struct RamDiscardListener;
+typedef int (*NotifyRamPopulate)(struct RamDiscardListener *rdl,
+                                 const MemoryRegion *mr, ram_addr_t offset,
+                                 ram_addr_t size);
+typedef void (*NotifyRamDiscard)(struct RamDiscardListener *rdl,
+                                 const MemoryRegion *mr, ram_addr_t offset,
+                                 ram_addr_t size);
+typedef void (*NotifyRamDiscardAll)(struct RamDiscardListener *rdl,
+                                    const MemoryRegion *mr);
+
+typedef struct RamDiscardListener {
+    /*
+     * @notify_populate:
+     *
+     * Notification that previously discarded memory is about to get populated.
+     * Listeners are able to object. If any listener objects, already
+     * successfully notified listeners are notified about a discard again.
+     *
+     * @rdl: the #RamDiscardListener getting notified
+     * @mr: the relevant #MemoryRegion
+     * @offset: offset into the #MemoryRegion, aligned to minimum granularity of
+     *          the #RamDiscardMgr
+     * @size: the size, aligned to minimum granularity of the #RamDiscardMgr
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
+     * @mr: the relevant #MemoryRegion
+     * @offset: offset into the #MemoryRegion, aligned to minimum granularity of
+     *          the #RamDiscardMgr
+     * @size: the size, aligned to minimum granularity of the #RamDiscardMgr
+     */
+    NotifyRamDiscard notify_discard;
+
+    /*
+     * @notify_discard_all:
+     *
+     * Notification that all previously populated memory was discarded
+     * successfully.
+     *
+     * Note: this callback is optional. If not set, individual notify_populate()
+     * notifications are triggered.
+     *
+     * @rdl: the #RamDiscardListener getting notified
+     * @mr: the relevant #MemoryRegion
+     */
+    NotifyRamDiscardAll notify_discard_all;
+    QLIST_ENTRY(RamDiscardListener) next;
+} RamDiscardListener;
+
 /* RAM is pre-allocated and passed into qemu_ram_alloc_from_ptr */
 #define RAM_PREALLOC   (1 << 0)
 
@@ -161,6 +227,16 @@ static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
     n->iommu_idx = iommu_idx;
 }
 
+static inline void ram_discard_listener_init(RamDiscardListener *rdl,
+                                             NotifyRamPopulate populate_fn,
+                                             NotifyRamDiscard discard_fn,
+                                             NotifyRamDiscardAll discard_all_fn)
+{
+    rdl->notify_populate = populate_fn;
+    rdl->notify_discard = discard_fn;
+    rdl->notify_discard_all = discard_all_fn;
+}
+
 /*
  * Memory region callbacks
  */
@@ -435,6 +511,126 @@ struct IOMMUMemoryRegionClass {
                                      Error **errp);
 };
 
+/*
+ * RamDiscardMgrClass:
+ *
+ * A #RamDiscardMgr coordinates which parts of specific RAM #MemoryRegion
+ * regions are currently populated to be used/accessed by the VM, notifying
+ * after parts were discarded (freeing up memory) and before parts will be
+ * populated (consuming memory), to be used/acessed by the VM.
+ *
+ * A #RamDiscardMgr can only be set for a RAM #MemoryRegion while the
+ * #MemoryRegion isn't mapped yet; it cannot change while the #MemoryRegion is
+ * mapped.
+ *
+ * The #RamDiscardMgr is intended to be used by technologies that are
+ * incompatible with discarding of RAM (e.g., VFIO, which may pin all
+ * memory inside a #MemoryRegion), and require proper coordination to only
+ * map the currently populated parts, to hinder parts that are expected to
+ * remain discarded from silently getting populated and consuming memory.
+ * Technologies that support discarding of RAM don't have to bother and can
+ * simply map the whole #MemoryRegion.
+ *
+ * An example #RamDiscardMgr is virtio-mem, which logically (un)plugs
+ * memory within an assigned RAM #MemoryRegion, coordinated with the VM.
+ * Logically unplugging memory consists of discarding RAM. The VM agreed to not
+ * access unplugged (discarded) memory - especially via DMA. virtio-mem will
+ * properly coordinate with listeners before memory is plugged (populated),
+ * and after memory is unplugged (discarded).
+ *
+ * Listeners are called in multiples of the minimum granularity and changes are
+ * aligned to the minimum granularity within the #MemoryRegion. Listeners have
+ * to prepare for memory becomming discarded in a different granularity than it
+ * was populated and the other way around.
+ */
+struct RamDiscardMgrClass {
+    /* private */
+    InterfaceClass parent_class;
+
+    /* public */
+
+    /**
+     * @get_min_granularity:
+     *
+     * Get the minimum granularity in which listeners will get notified
+     * about changes within the #MemoryRegion via the #RamDiscardMgr.
+     *
+     * @rdm: the #RamDiscardMgr
+     * @mr: the #MemoryRegion
+     *
+     * Returns the minimum granularity.
+     */
+    uint64_t (*get_min_granularity)(const RamDiscardMgr *rdm,
+                                    const MemoryRegion *mr);
+
+    /**
+     * @is_populated:
+     *
+     * Check whether the given range within the #MemoryRegion is completely
+     * populated (i.e., no parts are currently discarded). There are no
+     * alignment requirements for the range.
+     *
+     * @rdm: the #RamDiscardMgr
+     * @mr: the #MemoryRegion
+     * @offset: offset into the #MemoryRegion
+     * @size: size in the #MemoryRegion
+     *
+     * Returns whether the given range is completely populated.
+     */
+    bool (*is_populated)(const RamDiscardMgr *rdm, const MemoryRegion *mr,
+                         ram_addr_t start, ram_addr_t offset);
+
+    /**
+     * @register_listener:
+     *
+     * Register a #RamDiscardListener for a #MemoryRegion via the
+     * #RamDiscardMgr and immediately notify the #RamDiscardListener about all
+     * populated parts within the #MemoryRegion via the #RamDiscardMgr.
+     *
+     * In case any notification fails, no further notifications are triggered
+     * and an error is logged.
+     *
+     * @rdm: the #RamDiscardMgr
+     * @mr: the #MemoryRegion
+     * @rdl: the #RamDiscardListener
+     */
+    void (*register_listener)(RamDiscardMgr *rdm, const MemoryRegion *mr,
+                              RamDiscardListener *rdl);
+
+    /**
+     * @unregister_listener:
+     *
+     * Unregister a previously registered #RamDiscardListener for a
+     * #MemoryRegion via the #RamDiscardMgr after notifying the
+     * #RamDiscardListener about all populated parts becoming unpopulated
+     * within the #MemoryRegion via the #RamDiscardMgr.
+     *
+     * @rdm: the #RamDiscardMgr
+     * @mr: the #MemoryRegion
+     * @rdl: the #RamDiscardListener
+     */
+    void (*unregister_listener)(RamDiscardMgr *rdm, const MemoryRegion *mr,
+                                RamDiscardListener *rdl);
+
+    /**
+     * @replay_populated:
+     *
+     * Notify the #RamDiscardListener about all populated parts within the
+     * #MemoryRegion via the #RamDiscardMgr.
+     *
+     * In case any notification fails, no further notifications are triggered.
+     * The listener is not required to be registered.
+     *
+     * @rdm: the #RamDiscardMgr
+     * @mr: the #MemoryRegion
+     * @rdl: the #RamDiscardListener
+     *
+     * Returns 0 on success, or a negative error if any notification failed.
+     */
+    int (*replay_populated)(const RamDiscardMgr *rdm, const MemoryRegion *mr,
+                            RamDiscardListener *rdl);
+};
+
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
 typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
 
@@ -481,6 +677,7 @@ struct MemoryRegion {
     const char *name;
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
+    RamDiscardMgr *rdm; /* Only for RAM */
 };
 
 struct IOMMUMemoryRegion {
@@ -1969,6 +2166,40 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
  */
 bool memory_region_is_mapped(MemoryRegion *mr);
 
+/**
+ * memory_region_get_ram_discard_mgr: get the #RamDiscardMgr for a
+ * #MemoryRegion
+ *
+ * The #RamDiscardMgr cannot change while a memory region is mapped.
+ *
+ * @mr: the #MemoryRegion
+ */
+RamDiscardMgr *memory_region_get_ram_discard_mgr(MemoryRegion *mr);
+
+/**
+ * memory_region_has_ram_discard_mgr: check whether a #MemoryRegion has a
+ * #RamDiscardMgr assigned
+ *
+ * @mr: the #MemoryRegion
+ */
+static inline bool memory_region_has_ram_discard_mgr(MemoryRegion *mr)
+{
+    return !!memory_region_get_ram_discard_mgr(mr);
+}
+
+/**
+ * memory_region_set_ram_discard_mgr: set the #RamDiscardMgr for a
+ * #MemoryRegion
+ *
+ * This function must not be called for a mapped #MemoryRegion, a #MemoryRegion
+ * that does not cover RAM, or a #MemoryRegion that already has a
+ * #RamDiscardMgr assigned.
+ *
+ * @mr: the #MemoryRegion
+ * @urn: #RamDiscardMgr to set
+ */
+void memory_region_set_ram_discard_mgr(MemoryRegion *mr, RamDiscardMgr *rdm);
+
 /**
  * memory_region_find: translate an address/size relative to a
  * MemoryRegion into a #MemoryRegionSection.
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 333e1ed7b0..61fa6290e4 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2025,6 +2025,21 @@ int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr)
     return imrc->num_indexes(iommu_mr);
 }
 
+RamDiscardMgr *memory_region_get_ram_discard_mgr(MemoryRegion *mr)
+{
+    if (!memory_region_is_mapped(mr) || !memory_region_is_ram(mr)) {
+        return NULL;
+    }
+    return mr->rdm;
+}
+
+void memory_region_set_ram_discard_mgr(MemoryRegion *mr, RamDiscardMgr *rdm)
+{
+    g_assert(memory_region_is_ram(mr) && !memory_region_is_mapped(mr));
+    g_assert(!rdm || !mr->rdm);
+    mr->rdm = rdm;
+}
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask = 1 << client;
@@ -3306,10 +3321,17 @@ static const TypeInfo iommu_memory_region_info = {
     .abstract           = true,
 };
 
+static const TypeInfo ram_discard_mgr_info = {
+    .parent             = TYPE_INTERFACE,
+    .name               = TYPE_RAM_DISCARD_MGR,
+    .class_size         = sizeof(RamDiscardMgrClass),
+};
+
 static void memory_register_types(void)
 {
     type_register_static(&memory_region_info);
     type_register_static(&iommu_memory_region_info);
+    type_register_static(&ram_discard_mgr_info);
 }
 
 type_init(memory_register_types)
-- 
2.29.2


