Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7343CAA0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:28:03 +0200 (CEST)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfiyI-0002tc-PI
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfiJa-00089U-Qw
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:46:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfiJW-000365-P6
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635338754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4oRf4XjJvORI8h+Ij1YCp2fOAHr5xa6Jd7RTRmYUtiQ=;
 b=O6pCGYVjKZG3ugAfReditXZ7xTFkkNzLWIP/bRo0aKho/o17UucJtI9JmPcS4VCBIPKMwI
 KzfkHsrmWUUiXg+RyJPc1XlmMLx+mA82FTftC8UU5PP8tzjwuYs97scUvpMSt56qUdFXUy
 3xxO5cVcJLJd6h6Q7/c4BMgXfnWXkPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-OsI6DejjNhq3-zCHaAHdcQ-1; Wed, 27 Oct 2021 08:45:50 -0400
X-MC-Unique: OsI6DejjNhq3-zCHaAHdcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43A8C19200C0;
 Wed, 27 Oct 2021 12:45:49 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9265619D9F;
 Wed, 27 Oct 2021 12:45:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/12] memory: Allow for marking memory region aliases
 unmergeable
Date: Wed, 27 Oct 2021 14:45:22 +0200
Message-Id: <20211027124531.57561-4-david@redhat.com>
In-Reply-To: <20211027124531.57561-1-david@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's allow for marking memory region aliases unmergeable, to teach
flatview code (and memory listeners like vhost-user) to not merge adjacent
aliases to the same memory region into a larger memory section; instead, we
want separate alias to stay separate such that we can atomically map/unmap
aliases without affecting other aliases.

This is a preparation for virtio-mem mapping device memory located
on a RAM memory region via separate aliases into a memory region container,
resulting in separate memslots that can get (un)mapped atomically.

As an example with virtio-mem, the layout looks something like this:
  [...]
  0000000180000000-000002007fffffff (prio 0, i/o): device-memory
     0000000180000000-000001017fffffff (prio 0, i/o): virtio-mem-memslots
       0000000180000000-00000001bfffffff (prio 0, ram): alias virtio-mem-memslot-0 @mem0 0000000000000000-000000003fffffff
       00000001c0000000-00000001ffffffff (prio 0, ram): alias virtio-mem-memslot-1 @mem0 0000000040000000-000000007fffffff
       0000000200000000-000000023fffffff (prio 0, ram): alias virtio-mem-memslot-2 @mem0 0000000080000000-00000000bfffffff
  [...]

What would happen right now is that flatview code merged all 3 aliases
into a single memory section. When mapping another alias (e.g.,
virtio-mem-memslot-3) or when unmapping any of the mapped aliases,
memory listeners will first get notified about the removal of the big
memory section to then get notified about re-adding of the new
(differently merged) memory section(s).

In an ideal world, memory listeners would be able to deal with that
atomically, however, that is not the case for the most important memory
listeners used in context of virtio-mem (KVM, vhost-user, vfio) and
supporting atomic updates is quite hard (e.g., for KVM where we cannot
simply resize or split memory slots due to allocated metadata per slot,
or in virtiofsd where we cannot simply resize or split an active mmap
mapping). While temporarily removing memslots, active users (e.g., KVM
VCPUs) can stumble over the missing memslot and essentially crash the
VM.

Further, merged chunks will consume less memslots, but we might end up
consuming more later, when unmapping chunks and splitting the bigger
chunks into smaller ones -- making memslot accounting for memory devices
problematic as well.

Let's allow for marking a memory region alias unmergeable, such that we
can atomically (un)map aliases to the same memory region, similar to
(un)mapping individual DIMMs.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/memory.h | 23 +++++++++++++++++++++++
 softmmu/memory.c      | 33 +++++++++++++++++++++++++++------
 2 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 75b4f600e3..d877b80e6e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -82,6 +82,7 @@ struct ReservedRegion {
  *     relative to the region's address space
  * @readonly: writes to this section are ignored
  * @nonvolatile: this section is non-volatile
+ * @unmergeable: this section should not get merged with adjacent sections
  */
 struct MemoryRegionSection {
     Int128 size;
@@ -91,6 +92,7 @@ struct MemoryRegionSection {
     hwaddr offset_within_address_space;
     bool readonly;
     bool nonvolatile;
+    bool unmergeable;
 };
 
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
@@ -720,6 +722,7 @@ struct MemoryRegion {
     bool nonvolatile;
     bool rom_device;
     bool flush_coalesced_mmio;
+    bool unmergeable;
     uint8_t dirty_log_mask;
     bool is_iommu;
     RAMBlock *ram_block;
@@ -2272,6 +2275,26 @@ void memory_region_set_size(MemoryRegion *mr, uint64_t size);
 void memory_region_set_alias_offset(MemoryRegion *mr,
                                     hwaddr offset);
 
+/*
+ * memory_region_set_alias_unmergeable: Turn a memory region alias unmergeable
+ *
+ * Mark a memory region alias unmergeable, resulting in multiple adjacent
+ * aliasas to the same memory region not getting merged into one memory section
+ * when simplifying the address space and notifying memory listeners.
+ *
+ * Primarily useful on aliases to RAM regions; the target use case is
+ * splitting a RAM memory region via aliases into multiple memslots and
+ * dynamically (un)mapping the aliases into another container memory region.
+ * As resulting memory sections don't cover multiple aliases, memory listeners
+ * will be notified about adding/removing separate aliases, resulting in
+ * individual memslots in KVM, vhost, vfio,... that can be added/removed
+ * atomically when mapping/unmapping the corresponding alias.
+ *
+ * @mr: the #MemoryRegion to be updated
+ * @unmergeable: whether to mark the #MemoryRegion unmergeable
+ */
+void memory_region_set_alias_unmergeable(MemoryRegion *mr, bool unmergeable);
+
 /**
  * memory_region_present: checks if an address relative to a @container
  * translates into #MemoryRegion within @container
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 3a2613bd3c..d8a584ca80 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -223,6 +223,7 @@ struct FlatRange {
     bool romd_mode;
     bool readonly;
     bool nonvolatile;
+    bool unmergeable;
 };
 
 #define FOR_EACH_FLAT_RANGE(var, view)          \
@@ -239,6 +240,7 @@ section_from_flat_range(FlatRange *fr, FlatView *fv)
         .offset_within_address_space = int128_get64(fr->addr.start),
         .readonly = fr->readonly,
         .nonvolatile = fr->nonvolatile,
+        .unmergeable = fr->unmergeable,
     };
 }
 
@@ -249,7 +251,8 @@ static bool flatrange_equal(FlatRange *a, FlatRange *b)
         && a->offset_in_region == b->offset_in_region
         && a->romd_mode == b->romd_mode
         && a->readonly == b->readonly
-        && a->nonvolatile == b->nonvolatile;
+        && a->nonvolatile == b->nonvolatile
+        && a->unmergeable == b->unmergeable;
 }
 
 static FlatView *flatview_new(MemoryRegion *mr_root)
@@ -322,7 +325,8 @@ static bool can_merge(FlatRange *r1, FlatRange *r2)
         && r1->dirty_log_mask == r2->dirty_log_mask
         && r1->romd_mode == r2->romd_mode
         && r1->readonly == r2->readonly
-        && r1->nonvolatile == r2->nonvolatile;
+        && r1->nonvolatile == r2->nonvolatile
+        && !r1->unmergeable && !r2->unmergeable;
 }
 
 /* Attempt to simplify a view by merging adjacent ranges */
@@ -581,7 +585,8 @@ static void render_memory_region(FlatView *view,
                                  Int128 base,
                                  AddrRange clip,
                                  bool readonly,
-                                 bool nonvolatile)
+                                 bool nonvolatile,
+                                 bool unmergeable)
 {
     MemoryRegion *subregion;
     unsigned i;
@@ -598,6 +603,7 @@ static void render_memory_region(FlatView *view,
     int128_addto(&base, int128_make64(mr->addr));
     readonly |= mr->readonly;
     nonvolatile |= mr->nonvolatile;
+    unmergeable |= mr->unmergeable;
 
     tmp = addrrange_make(base, mr->size);
 
@@ -611,14 +617,14 @@ static void render_memory_region(FlatView *view,
         int128_subfrom(&base, int128_make64(mr->alias->addr));
         int128_subfrom(&base, int128_make64(mr->alias_offset));
         render_memory_region(view, mr->alias, base, clip,
-                             readonly, nonvolatile);
+                             readonly, nonvolatile, unmergeable);
         return;
     }
 
     /* Render subregions in priority order. */
     QTAILQ_FOREACH(subregion, &mr->subregions, subregions_link) {
         render_memory_region(view, subregion, base, clip,
-                             readonly, nonvolatile);
+                             readonly, nonvolatile, unmergeable);
     }
 
     if (!mr->terminates) {
@@ -634,6 +640,7 @@ static void render_memory_region(FlatView *view,
     fr.romd_mode = mr->romd_mode;
     fr.readonly = readonly;
     fr.nonvolatile = nonvolatile;
+    fr.unmergeable = unmergeable;
 
     /* Render the region itself into any gaps left by the current view. */
     for (i = 0; i < view->nr && int128_nz(remain); ++i) {
@@ -735,7 +742,7 @@ static FlatView *generate_memory_topology(MemoryRegion *mr)
     if (mr) {
         render_memory_region(view, mr, int128_zero(),
                              addrrange_make(int128_zero(), int128_2_64()),
-                             false, false);
+                             false, false, false);
     }
     flatview_simplify(view);
 
@@ -2634,6 +2641,20 @@ void memory_region_set_alias_offset(MemoryRegion *mr, hwaddr offset)
     memory_region_transaction_commit();
 }
 
+void memory_region_set_alias_unmergeable(MemoryRegion *mr, bool unmergeable)
+{
+    assert(mr->alias);
+
+    if (unmergeable == mr->unmergeable) {
+        return;
+    }
+
+    memory_region_transaction_begin();
+    mr->unmergeable = unmergeable;
+    memory_region_update_pending |= mr->enabled;
+    memory_region_transaction_commit();
+}
+
 uint64_t memory_region_get_alignment(const MemoryRegion *mr)
 {
     return mr->align;
-- 
2.31.1


