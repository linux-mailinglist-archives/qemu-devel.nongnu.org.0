Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855F3C9AF4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 11:03:31 +0200 (CEST)
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3xHG-0007i4-5S
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 05:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3xGK-00071w-Js
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:02:32 -0400
Received: from mga06.intel.com ([134.134.136.31]:10810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3xGH-0003D6-2C
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:02:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="271621113"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="271621113"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 02:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="495357489"
Received: from devel-wwang.sh.intel.com ([10.239.48.132])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2021 02:02:12 -0700
From: Wei Wang <wei.w.wang@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] migration: clear the memory region dirty bitmap when
 skipping free pages
Date: Thu, 15 Jul 2021 03:53:26 -0400
Message-Id: <20210715075326.421977-1-wei.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=wei.w.wang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: mst@redhat.com, david@redhat.com, dgilbert@redhat.com, peterx@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When skipping free pages to send, their corresponding dirty bits in the
memory region dirty bitmap need to be cleared. Otherwise the skipped
pages will be sent in the next round after the migration thread syncs
dirty bits from the memory region dirty bitmap.

Cc: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Reported-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
---
 migration/ram.c | 72 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 18 deletions(-)

v1->v2 changelog:
- move migration_clear_memory_region_dirty_bitmap under bitmap_mutex as
  we lack confidence to have it outside the lock for now.
- clean the unnecessary subproject commit.

diff --git a/migration/ram.c b/migration/ram.c
index b5fc454b2f..69e06b55ec 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -789,6 +789,51 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
     return find_next_bit(bitmap, size, start);
 }
 
+static void migration_clear_memory_region_dirty_bitmap(RAMState *rs,
+                                                       RAMBlock *rb,
+                                                       unsigned long page)
+{
+    uint8_t shift;
+    hwaddr size, start;
+
+    if (!rb->clear_bmap || !clear_bmap_test_and_clear(rb, page)) {
+        return;
+    }
+
+    shift = rb->clear_bmap_shift;
+    /*
+     * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
+     * can make things easier sometimes since then start address
+     * of the small chunk will always be 64 pages aligned so the
+     * bitmap will always be aligned to unsigned long. We should
+     * even be able to remove this restriction but I'm simply
+     * keeping it.
+     */
+    assert(shift >= 6);
+
+    size = 1ULL << (TARGET_PAGE_BITS + shift);
+    start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);
+    trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
+    memory_region_clear_dirty_bitmap(rb->mr, start, size);
+}
+
+static void
+migration_clear_memory_region_dirty_bitmap_range(RAMState *rs,
+                                                 RAMBlock *rb,
+                                                 unsigned long start,
+                                                 unsigned long npages)
+{
+    unsigned long page_to_clear, i, nchunks;
+    unsigned long chunk_pages = 1UL << rb->clear_bmap_shift;
+
+    nchunks = (start + npages) / chunk_pages - start / chunk_pages + 1;
+
+    for (i = 0; i < nchunks; i++) {
+        page_to_clear = start + i * chunk_pages;
+        migration_clear_memory_region_dirty_bitmap(rs, rb, page_to_clear);
+    }
+}
+
 static inline bool migration_bitmap_clear_dirty(RAMState *rs,
                                                 RAMBlock *rb,
                                                 unsigned long page)
@@ -803,26 +848,9 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
      * the page in the chunk we clear the remote dirty bitmap for all.
      * Clearing it earlier won't be a problem, but too late will.
      */
-    if (rb->clear_bmap && clear_bmap_test_and_clear(rb, page)) {
-        uint8_t shift = rb->clear_bmap_shift;
-        hwaddr size = 1ULL << (TARGET_PAGE_BITS + shift);
-        hwaddr start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);
-
-        /*
-         * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
-         * can make things easier sometimes since then start address
-         * of the small chunk will always be 64 pages aligned so the
-         * bitmap will always be aligned to unsigned long.  We should
-         * even be able to remove this restriction but I'm simply
-         * keeping it.
-         */
-        assert(shift >= 6);
-        trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
-        memory_region_clear_dirty_bitmap(rb->mr, start, size);
-    }
+    migration_clear_memory_region_dirty_bitmap(rs, rb, page);
 
     ret = test_and_clear_bit(page, rb->bmap);
-
     if (ret) {
         rs->migration_dirty_pages--;
     }
@@ -2741,6 +2769,14 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
         npages = used_len >> TARGET_PAGE_BITS;
 
         qemu_mutex_lock(&ram_state->bitmap_mutex);
+        /*
+         * The skipped free pages are equavelent to be sent from clear_bmap's
+         * perspective, so clear the bits from the memory region bitmap which
+         * are initially set. Otherwise those skipped pages will be sent in
+         * the next round after syncing from the memory region bitmap.
+         */
+        migration_clear_memory_region_dirty_bitmap_range(ram_state, block,
+                                                         start, npages);
         ram_state->migration_dirty_pages -=
                       bitmap_count_one_with_offset(block->bmap, start, npages);
         bitmap_clear(block->bmap, start, npages);
-- 
2.25.1


