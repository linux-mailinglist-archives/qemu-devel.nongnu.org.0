Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE707400C10
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:19:29 +0200 (CEST)
Received: from localhost ([::1]:48022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYO8-0002cq-Q8
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMYFf-0004Jt-7U
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 12:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMYFb-0003G2-PW
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 12:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630771838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ammzp5HEMj2PYR/a64zT0dGaB6yoir4SZ4vp5twhGAo=;
 b=g2oFS/Isr8BUaABUUEFYBBVWXFreaULnDPNifLr07jCWE+3ObI1ABeTa087JmbH64+0pHj
 1ZBKti6duIBNyLINYHdWxwAVVu3a0tjWeiKbi5QwuEM5sFJsiXtRIA9BCcvwgEOT776/dL
 CENcKJ7WcaMkQMNqV/FWXWh4Hz3QzTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-JgFLXL7NNPGqxn9QInUqvQ-1; Sat, 04 Sep 2021 12:10:37 -0400
X-MC-Unique: JgFLXL7NNPGqxn9QInUqvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7864814244;
 Sat,  4 Sep 2021 16:10:36 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5D5C610F0;
 Sat,  4 Sep 2021 16:10:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/9] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on the migration source
Date: Sat,  4 Sep 2021 18:09:08 +0200
Message-Id: <20210904160913.17785-5-david@redhat.com>
In-Reply-To: <20210904160913.17785-1-david@redhat.com>
References: <20210904160913.17785-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't want to migrate memory that corresponds to discarded ranges as
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

Let's consult the RamDiscardManager after setting up our dirty bitmap
initially and when postcopy recovery code reinitializes it: clear
corresponding bits in the dirty bitmaps (e.g., of the RAMBlock and inside
KVM). It's important to fixup the dirty bitmap *after* our initial bitmap
sync, such that the corresponding dirty bits in KVM are actually cleared.

As colo is incompatible with discarding of RAM and inhibits it, we don't
have to bother.

Note: if a misbehaving guest would use discarded ranges after migration
started we would still migrate that memory: however, then we already
populated that memory on the migration source.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index bb908822d5..3be969f749 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -858,6 +858,60 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
     return ret;
 }
 
+static void dirty_bitmap_clear_section(MemoryRegionSection *section,
+                                       void *opaque)
+{
+    const hwaddr offset = section->offset_within_region;
+    const hwaddr size = int128_get64(section->size);
+    const unsigned long start = offset >> TARGET_PAGE_BITS;
+    const unsigned long npages = size >> TARGET_PAGE_BITS;
+    RAMBlock *rb = section->mr->ram_block;
+    uint64_t *cleared_bits = opaque;
+
+    /*
+     * We don't grab ram_state->bitmap_mutex because we expect to run
+     * only when starting migration or during postcopy recovery where
+     * we don't have concurrent access.
+     */
+    if (!migration_in_postcopy() && !migrate_background_snapshot()) {
+        migration_clear_memory_region_dirty_bitmap_range(rb, start, npages);
+    }
+    *cleared_bits += bitmap_count_one_with_offset(rb->bmap, start, npages);
+    bitmap_clear(rb->bmap, start, npages);
+}
+
+/*
+ * Exclude all dirty pages from migration that fall into a discarded range as
+ * managed by a RamDiscardManager responsible for the mapped memory region of
+ * the RAMBlock. Clear the corresponding bits in the dirty bitmaps.
+ *
+ * Discarded pages ("logically unplugged") have undefined content and must
+ * not get migrated, because even reading these pages for migration might
+ * result in undesired behavior.
+ *
+ * Returns the number of cleared bits in the RAMBlock dirty bitmap.
+ *
+ * Note: The result is only stable while migrating (precopy/postcopy).
+ */
+static uint64_t ramblock_dirty_bitmap_clear_discarded_pages(RAMBlock *rb)
+{
+    uint64_t cleared_bits = 0;
+
+    if (rb->mr && rb->bmap && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = 0,
+            .size = int128_make64(qemu_ram_get_used_length(rb)),
+        };
+
+        ram_discard_manager_replay_discarded(rdm, &section,
+                                             dirty_bitmap_clear_section,
+                                             &cleared_bits);
+    }
+    return cleared_bits;
+}
+
 /* Called with RCU critical section */
 static void ramblock_sync_dirty_bitmap(RAMState *rs, RAMBlock *rb)
 {
@@ -2668,6 +2722,19 @@ static void ram_list_init_bitmaps(void)
     }
 }
 
+static void migration_bitmap_clear_discarded_pages(RAMState *rs)
+{
+    unsigned long pages;
+    RAMBlock *rb;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
+            pages = ramblock_dirty_bitmap_clear_discarded_pages(rb);
+            rs->migration_dirty_pages -= pages;
+    }
+}
+
 static void ram_init_bitmaps(RAMState *rs)
 {
     /* For memory_global_dirty_log_start below.  */
@@ -2684,6 +2751,12 @@ static void ram_init_bitmaps(RAMState *rs)
     }
     qemu_mutex_unlock_ramlist();
     qemu_mutex_unlock_iothread();
+
+    /*
+     * After an eventual first bitmap sync, fixup the initial bitmap
+     * containing all 1s to exclude any discarded pages from migration.
+     */
+    migration_bitmap_clear_discarded_pages(rs);
 }
 
 static int ram_init_all(RAMState **rsp)
@@ -4112,6 +4185,10 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
      */
     bitmap_complement(block->bmap, block->bmap, nbits);
 
+    /* Clear dirty bits of discarded ranges that we don't want to migrate. */
+    ramblock_dirty_bitmap_clear_discarded_pages(block);
+
+    /* We'll recalculate migration_dirty_pages in ram_state_resume_prepare(). */
     trace_ram_dirty_bitmap_reload_complete(block->idstr);
 
     /*
-- 
2.31.1


