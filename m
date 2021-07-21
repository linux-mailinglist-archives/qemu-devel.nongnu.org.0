Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE7A3D0B7A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:31:19 +0200 (CEST)
Received: from localhost ([::1]:59892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68ZS-0002Yn-K8
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m68Wb-0008IW-K0
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m68WZ-0002Ar-P2
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626859698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dn43e+TJIOkgVC/LZmxDiQvAKcUzmdGHniwvhvKtycQ=;
 b=Zf7TyRBNXCtkWi462posaGFYAxwA4PehmCMUutP2Q/vYbjA1ZeCQCnBnxH4lvYy4rImkHY
 Hi7n9twxSaDYrHFkbmqiIIb+Tk0W3fpRulkf0cW7QAClHpt9v4afeXlWiEWoEFXW5XIJGx
 aRJRfomFcQ+c34p6SCiaEUGDy+PkN0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-CdjywrObPpCykgabKcs16Q-1; Wed, 21 Jul 2021 05:28:15 -0400
X-MC-Unique: CdjywrObPpCykgabKcs16Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB7E839A4A;
 Wed, 21 Jul 2021 09:28:14 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-250.ams2.redhat.com [10.36.113.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B739F6A057;
 Wed, 21 Jul 2021 09:28:11 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on the migration source
Date: Wed, 21 Jul 2021 11:27:56 +0200
Message-Id: <20210721092759.21368-4-david@redhat.com>
In-Reply-To: <20210721092759.21368-1-david@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We never want to migrate memory that corresponds to discarded ranges as
managed by a RamDiscardManager responsible for the mapped memory region of
the RAMBlock. The content of these pages is essentially stale and
without any guarantees for the VM ("logically unplugged").

Depending on the underlying memory type, even reading memory might populate
memory on the source, resulting in an undesired memory consumption. Of
course, on the destination, even writing a zeropage consumes memory,
which we also want to avoid (similar to free page hinting).

Currently, virtio-mem tries achieving that goal (not migrating "unplugged"
memory that was discarded) by going via qemu_guest_free_page_hint() - but
it's hackish and incomplete.

For example, background snapshots still end up reading all memory, as
they don't do bitmap syncs. Postcopy recovery code will re-add
previously cleared bits to the dirty bitmap and migrate them.

Let's consult the RamDiscardManager whenever we add bits to the bitmap
and exclude all discarded pages.

As colo is incompatible with discarding of RAM and inhibits it, we don't
have to bother.

Note: If discarded ranges span complete clear_bmap chunks, we'll never
clear the corresponding bits from clear_bmap and consequently never call
memory_region_clear_dirty_bitmap on the affected regions. While this is
perfectly fine, we're still synchronizing the bitmap of discarded ranges,
for example, in
ramblock_sync_dirty_bitmap()->cpu_physical_memory_sync_dirty_bitmap()
but also during memory_global_dirty_log_sync().

In the future, it might make sense to never even synchronize the dirty log
of these ranges, for example in KVM code, skipping discarded ranges
completely.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b5fc454b2f..4bf74ae2e1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -830,14 +830,67 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
     return ret;
 }
 
+static void dirty_bitmap_exclude_section(MemoryRegionSection *section,
+                                         void *opaque)
+{
+    const hwaddr offset = section->offset_within_region;
+    const hwaddr size = int128_get64(section->size);
+    const unsigned long start = offset >> TARGET_PAGE_BITS;
+    const unsigned long npages = size >> TARGET_PAGE_BITS;
+    RAMBlock *rb = section->mr->ram_block;
+    uint64_t *cleared_bits = opaque;
+
+    /* Clear the discarded part from our bitmap. */
+    *cleared_bits += bitmap_count_one_with_offset(rb->bmap, start, npages);
+    bitmap_clear(rb->bmap, start, npages);
+}
+
+/*
+ * Exclude all dirty pages that fall into a discarded range as managed by a
+ * RamDiscardManager responsible for the mapped memory region of the RAMBlock.
+ *
+ * Discarded pages ("logically unplugged") have undefined content and must
+ * never be migrated, because even reading these pages for migrating might
+ * result in undesired behavior.
+ *
+ * Returns the number of cleared bits in the dirty bitmap.
+ *
+ * Note: The result is only stable while migration (precopy/postcopy).
+ */
+static uint64_t ramblock_dirty_bitmap_exclude_discarded_pages(RAMBlock *rb)
+{
+    uint64_t cleared_bits = 0;
+
+    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = 0,
+            .size = int128_make64(qemu_ram_get_used_length(rb)),
+        };
+
+        ram_discard_manager_replay_discarded(rdm, &section,
+                                             dirty_bitmap_exclude_section,
+                                             &cleared_bits);
+    }
+    return cleared_bits;
+}
+
 /* Called with RCU critical section */
 static void ramblock_sync_dirty_bitmap(RAMState *rs, RAMBlock *rb)
 {
     uint64_t new_dirty_pages =
         cpu_physical_memory_sync_dirty_bitmap(rb, 0, rb->used_length);
+    uint64_t cleared_pages = 0;
 
-    rs->migration_dirty_pages += new_dirty_pages;
-    rs->num_dirty_pages_period += new_dirty_pages;
+    if (new_dirty_pages) {
+        cleared_pages = ramblock_dirty_bitmap_exclude_discarded_pages(rb);
+    }
+
+    rs->migration_dirty_pages += new_dirty_pages - cleared_pages;
+    if (new_dirty_pages > cleared_pages) {
+        rs->num_dirty_pages_period += new_dirty_pages - cleared_pages;
+    }
 }
 
 /**
@@ -2601,7 +2654,7 @@ static int ram_state_init(RAMState **rsp)
     return 0;
 }
 
-static void ram_list_init_bitmaps(void)
+static void ram_list_init_bitmaps(RAMState *rs)
 {
     MigrationState *ms = migrate_get_current();
     RAMBlock *block;
@@ -2636,6 +2689,10 @@ static void ram_list_init_bitmaps(void)
             bitmap_set(block->bmap, 0, pages);
             block->clear_bmap_shift = shift;
             block->clear_bmap = bitmap_new(clear_bmap_size(pages, shift));
+
+            /* Exclude all discarded pages we never want to migrate. */
+            pages = ramblock_dirty_bitmap_exclude_discarded_pages(block);
+            rs->migration_dirty_pages -= pages;
         }
     }
 }
@@ -2647,7 +2704,7 @@ static void ram_init_bitmaps(RAMState *rs)
     qemu_mutex_lock_ramlist();
 
     WITH_RCU_READ_LOCK_GUARD() {
-        ram_list_init_bitmaps();
+        ram_list_init_bitmaps(rs);
         /* We don't use dirty log with background snapshots */
         if (!migrate_background_snapshot()) {
             memory_global_dirty_log_start();
@@ -4076,6 +4133,10 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
      */
     bitmap_complement(block->bmap, block->bmap, nbits);
 
+    /* Exclude all discarded pages we never want to migrate. */
+    ramblock_dirty_bitmap_exclude_discarded_pages(block);
+
+    /* We'll recalculate migration_dirty_pages in ram_state_resume_prepare(). */
     trace_ram_dirty_bitmap_reload_complete(block->idstr);
 
     /*
-- 
2.31.1


