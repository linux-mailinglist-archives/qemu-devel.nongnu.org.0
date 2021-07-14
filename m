Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE763C80EA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:02:17 +0200 (CEST)
Received: from localhost ([::1]:36218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3amW-0007ix-7E
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3aka-0006W5-5O
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:00:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3akU-00047B-Vd
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:00:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="197583876"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="197583876"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 01:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="459923832"
Received: from devel-wwang.sh.intel.com ([10.239.48.132])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2021 01:59:50 -0700
From: Wei Wang <wei.w.wang@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] migration: clear the memory region dirty bitmap when
 skipping free pages
Date: Wed, 14 Jul 2021 03:51:04 -0400
Message-Id: <20210714075104.397484-1-wei.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=wei.w.wang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HEXHASH_WORD=1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, david@redhat.com, dgilbert@redhat.com, peterx@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When skipping free pages, their corresponding dirty bits in the memory
region dirty bitmap need to be cleared. Otherwise the skipped pages will
be sent in the next round after the migration thread syncs dirty bits
from the memory region dirty bitmap.

migration_clear_memory_region_dirty_bitmap_range is put outside the
bitmap_mutex, becasue memory_region_clear_dirty_bitmap is possible to block
on the kvm slot mutex (don't want holding bitmap_mutex while blocked on
another mutex), and clear_bmap_test_and_clear uses atomic operation.

Cc: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Reported-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
---
 capstone        |  2 +-
 migration/ram.c | 73 +++++++++++++++++++++++++++++++++++++------------
 slirp           |  2 +-
 ui/keycodemapdb |  2 +-
 4 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/capstone b/capstone
index f8b1b83301..22ead3e0bf 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
+Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
diff --git a/migration/ram.c b/migration/ram.c
index 88ff34f574..c44c6e2fed 100644
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
@@ -805,26 +850,9 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
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
@@ -2742,6 +2770,15 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
         start = offset >> TARGET_PAGE_BITS;
         npages = used_len >> TARGET_PAGE_BITS;
 
+        /*
+         * The skipped free pages are equavelent to be sent from clear_bmap's
+         * perspective, so clear the bits from the memory region bitmap which
+         * are initially set. Otherwise those skipped pages will be sent in
+         * the next round after syncing from the memory region bitmap.
+         */
+        migration_clear_memory_region_dirty_bitmap_range(ram_state, block,
+                                                         start, npages);
+
         qemu_mutex_lock(&ram_state->bitmap_mutex);
         ram_state->migration_dirty_pages -=
                       bitmap_count_one_with_offset(block->bmap, start, npages);
diff --git a/slirp b/slirp
index 8f43a99191..2faae0f778 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit 2faae0f778f818fadc873308f983289df697eb93
diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index 6119e6e19a..320f92c36a 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit 6119e6e19a050df847418de7babe5166779955e4
+Subproject commit 320f92c36a80bfafc5d57834592a7be5fd79f104
-- 
2.25.1


