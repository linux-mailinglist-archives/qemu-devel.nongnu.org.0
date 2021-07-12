Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EE53C617E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:05:59 +0200 (CEST)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zNW-0005y9-DD
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m2zF5-0005jd-7R
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:57:15 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:60834
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m2zF2-0007J1-4P
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:57:15 -0400
HMM_SOURCE_IP: 172.18.0.48:50580.4574419
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.19?logid-d6ee1067a9e34bf398e4104729ee285e
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id A38E828008D;
 Tue, 13 Jul 2021 00:57:09 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id e51670f48b4a48e48152baa86ec7043d for
 qemu-devel@nongnu.org; Tue Jul 13 00:57:09 2021
X-Transaction-ID: e51670f48b4a48e48152baa86ec7043d
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] memory: introduce DirtyRateIncreasedPages and util
 function
Date: Tue, 13 Jul 2021 00:56:51 +0800
Message-Id: <c27c904f46644f29ef3bae9e9e1205aa3a666fd3.1626108969.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626107174.git.huangy81@chinatelecom.cn>
References: <cover.1626107174.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1626108969.git.huangy81@chinatelecom.cn>
References: <cover.1626108969.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

introduce DirtyRateIncreasedPages to stat the increased dirty pages
during the calculation time along with ramblock_sync_dirty_bitmap.

introduce util functions to setup the DIRTY_MEMORY_MIGRATION
dirty bits for the convenience of tracking dirty bitmap when
calculating dirtyrate.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/ram_addr.h | 87 ++++++++++++++++++++++++++++++++++++++++++++-----
 softmmu/physmem.c       | 35 ++++++++++++++++++++
 2 files changed, 113 insertions(+), 9 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 45c9132..c47d1a7 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -26,6 +26,8 @@
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 
+static uint64_t DirtyRateIncreasedPages = 0;
+
 /**
  * clear_bmap_size: calculate clear bitmap size
  *
@@ -422,6 +424,9 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
                                               unsigned client);
 
+void cpu_physical_memory_dirtyrate_clear_bit(ram_addr_t start,
+                                             ram_addr_t length);
+
 DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
     (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client);
 
@@ -449,6 +454,8 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
     uint64_t num_dirty = 0;
     unsigned long *dest = rb->bmap;
 
+    assert(global_dirty_tracking);
+
     /* start address and length is aligned at the start of a word? */
     if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) ==
          (start + rb->offset) &&
@@ -466,12 +473,20 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
 
         for (k = page; k < page + nr; k++) {
             if (src[idx][offset]) {
-                unsigned long bits = qatomic_xchg(&src[idx][offset], 0);
-                unsigned long new_dirty;
-                new_dirty = ~dest[k];
-                dest[k] |= bits;
-                new_dirty &= bits;
-                num_dirty += ctpopl(new_dirty);
+                unsigned long bits;
+                if (global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE) {
+                    bits = qatomic_read(&src[idx][offset]);
+                    DirtyRateIncreasedPages += ctpopl(bits);
+                }
+
+                if (global_dirty_tracking & GLOBAL_DIRTY_MIGRATION) {
+                    unsigned long new_dirty;
+                    bits = qatomic_xchg(&src[idx][offset], 0);
+                    new_dirty = ~dest[k];
+                    dest[k] |= bits;
+                    new_dirty &= bits;
+                    num_dirty += ctpopl(new_dirty);
+                }
             }
 
             if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {
@@ -500,9 +515,15 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                         start + addr + offset,
                         TARGET_PAGE_SIZE,
                         DIRTY_MEMORY_MIGRATION)) {
-                long k = (start + addr) >> TARGET_PAGE_BITS;
-                if (!test_and_set_bit(k, dest)) {
-                    num_dirty++;
+                if (global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE) {
+                    DirtyRateIncreasedPages++;
+                }
+
+                if (global_dirty_tracking & GLOBAL_DIRTY_MIGRATION) {
+                    long k = (start + addr) >> TARGET_PAGE_BITS;
+                    if (!test_and_set_bit(k, dest)) {
+                        num_dirty++;
+                    }
                 }
             }
         }
@@ -510,5 +531,53 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
 
     return num_dirty;
 }
+
+static inline
+void cpu_physical_memory_dirtyrate_clear_dirty_bits(RAMBlock *rb)
+{
+    ram_addr_t addr;
+    ram_addr_t length = rb->used_length;
+    unsigned long word = BIT_WORD(rb->offset >> TARGET_PAGE_BITS);
+
+    /* start address and length is aligned at the start of a word? */
+    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) == rb->offset &&
+        !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
+        int k;
+        int nr = BITS_TO_LONGS(length >> TARGET_PAGE_BITS);
+        unsigned long * const *src;
+        unsigned long idx = (word * BITS_PER_LONG) / DIRTY_MEMORY_BLOCK_SIZE;
+        unsigned long offset = BIT_WORD((word * BITS_PER_LONG) %
+                                        DIRTY_MEMORY_BLOCK_SIZE);
+
+        src = qatomic_rcu_read(
+                &ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION])->blocks;
+
+        for (k = 0; k < nr; k++) {
+            if (src[idx][offset]) {
+                qatomic_set(&src[idx][offset], 0);
+            }
+            if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {
+                offset = 0;
+                idx++;
+            }
+        }
+    } else {
+        ram_addr_t offset = rb->offset;
+
+        for (addr = 0; addr < length; addr += TARGET_PAGE_SIZE) {
+            cpu_physical_memory_dirtyrate_clear_bit(addr + offset,
+                                                    TARGET_PAGE_SIZE);
+        }
+    }
+
+    return;
+}
+
+static inline
+void cpu_physical_memory_dirtyrate_reset_protect(RAMBlock *rb)
+{
+    memory_region_clear_dirty_bitmap(rb->mr, 0, rb->used_length);
+    cpu_physical_memory_dirtyrate_clear_dirty_bits(rb);
+}
 #endif
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3c1912a..67cff31 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1068,6 +1068,41 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
     return dirty;
 }
 
+void cpu_physical_memory_dirtyrate_clear_bit(ram_addr_t start,
+                                             ram_addr_t length)
+{
+    DirtyMemoryBlocks *blocks;
+    unsigned long end, page;
+    RAMBlock *ramblock;
+
+    if (length == 0) {
+        return;
+    }
+
+    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
+    page = start >> TARGET_PAGE_BITS;
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        blocks =
+            qatomic_rcu_read(&ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]);
+        ramblock = qemu_get_ram_block(start);
+        /* Range sanity check on the ramblock */
+        assert(start >= ramblock->offset &&
+               start + length <= ramblock->offset + ramblock->used_length);
+        while (page < end) {
+            unsigned long idx = page / DIRTY_MEMORY_BLOCK_SIZE;
+            unsigned long offset = page % DIRTY_MEMORY_BLOCK_SIZE;
+            unsigned long num = MIN(end - page,
+                                    DIRTY_MEMORY_BLOCK_SIZE - offset);
+
+            clear_bit(num, blocks->blocks[idx]);
+            page += num;
+        }
+    }
+
+    return;
+}
+
 DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
     (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client)
 {
-- 
1.8.3.1


