Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB633B523B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 07:41:28 +0200 (CEST)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxNXr-0000cR-Uf
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 01:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lxNVH-0007dw-3e
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:38:47 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:44593
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lxNVB-0001QG-Pm
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:38:46 -0400
HMM_SOURCE_IP: 172.18.0.218:60506.95674552
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.176?logid-0210caab79734a8b87be68778a878dff
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 18BDB28009A;
 Sun, 27 Jun 2021 13:38:39 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 29f13c49ed394465816ab1302c0509a2 for
 qemu-devel@nongnu.org; Sun Jun 27 13:38:39 2021
X-Transaction-ID: 29f13c49ed394465816ab1302c0509a2
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] memory: introduce DIRTY_MEMORY_DIRTY_RATE dirty bits
 functions
Date: Sun, 27 Jun 2021 13:38:16 +0800
Message-Id: <a7553a5899b70d50afa04e06597967e20ae41873.1624771216.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1624768443.git.huangy81@chinatelecom.cn>
References: <cover.1624768443.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1624771216.git.huangy81@chinatelecom.cn>
References: <cover.1624771216.git.huangy81@chinatelecom.cn>
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

introduce util functions to setup the DIRTY_MEMORY_DIRTY_RATE
dirty bits for the convenience of tracking dirty bitmap when
calculating dirtyrate.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/ram_addr.h | 121 ++++++++++++++++++++++++++++++++++++++++++++++++
 softmmu/physmem.c       |  61 ++++++++++++++++++++++++
 2 files changed, 182 insertions(+)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 6070a52..57dc96b 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -435,6 +435,12 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
                                               unsigned client);
 
+void cpu_physical_memory_dirtyrate_clear_bit(ram_addr_t start,
+                                             ram_addr_t length);
+
+void cpu_physical_memory_dirtyrate_reprotect_bit(ram_addr_t start,
+                                                 ram_addr_t length);
+
 DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
     (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client);
 
@@ -523,5 +529,120 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
 
     return num_dirty;
 }
+
+/* Called with RCU critical section */
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
+                &ram_list.dirty_memory[DIRTY_MEMORY_DIRTY_RATE])->blocks;
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
+/* Called with RCU critical section */
+static inline
+uint64_t cpu_physical_memory_dirtyrate_stat_dirty_bits(RAMBlock *rb)
+{
+    uint64_t dirty_pages = 0;
+    ram_addr_t addr;
+    ram_addr_t length = rb->used_length;
+    unsigned long word = BIT_WORD(rb->offset >> TARGET_PAGE_BITS);
+    unsigned long bits;
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
+                &ram_list.dirty_memory[DIRTY_MEMORY_DIRTY_RATE])->blocks;
+
+        for (k = 0; k < nr; k++) {
+            if (src[idx][offset]) {
+                bits = qatomic_read(&src[idx][offset]);
+                dirty_pages += ctpopl(bits);
+            }
+
+            if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {
+                offset = 0;
+                idx++;
+            }
+        }
+    } else {
+        ram_addr_t offset = rb->offset;
+
+        for (addr = 0; addr < length; addr += TARGET_PAGE_SIZE) {
+            if (cpu_physical_memory_get_dirty(offset + addr,
+                                              TARGET_PAGE_SIZE,
+                                              DIRTY_MEMORY_DIRTY_RATE)) {
+                dirty_pages++;
+            }
+        }
+    }
+
+    return dirty_pages;
+}
+
+static inline
+void cpu_physical_memory_dirtyrate_reset_protect(RAMBlock *rb)
+{
+    ram_addr_t addr;
+    ram_addr_t length = rb->used_length;
+    unsigned long word = BIT_WORD(rb->offset >> TARGET_PAGE_BITS);
+
+    /* start address and length is aligned at the start of a word? */
+    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) == rb->offset &&
+        !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
+        memory_region_clear_dirty_bitmap(rb->mr, 0, length);
+    } else {
+        ram_addr_t offset = rb->offset;
+
+        for (addr = 0; addr < length; addr += TARGET_PAGE_SIZE) {
+            cpu_physical_memory_dirtyrate_reprotect_bit(offset + addr,
+                                                        TARGET_PAGE_SIZE);
+        }
+    }
+
+    return;
+}
+
 #endif
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 9b171c9..d68649a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1068,6 +1068,67 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
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
+            qatomic_rcu_read(&ram_list.dirty_memory[DIRTY_MEMORY_DIRTY_RATE]);
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
+void cpu_physical_memory_dirtyrate_reprotect_bit(ram_addr_t start,
+                                                 ram_addr_t length)
+{
+    unsigned long end, start_page;
+    RAMBlock *ramblock;
+    uint64_t mr_offset, mr_size;
+
+    if (length == 0) {
+        return;
+    }
+
+    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
+    start_page = start >> TARGET_PAGE_BITS;
+
+    ramblock = qemu_get_ram_block(start);
+    /* Range sanity check on the ramblock */
+    assert(start >= ramblock->offset &&
+        start + length <= ramblock->offset + ramblock->used_length);
+
+    mr_offset = (ram_addr_t)(start_page << TARGET_PAGE_BITS) - ramblock->offset;
+    mr_size = (end - start_page) << TARGET_PAGE_BITS;
+    memory_region_clear_dirty_bitmap(ramblock->mr, mr_offset, mr_size);
+
+    return;
+}
+
 DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
     (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client)
 {
-- 
1.8.3.1


