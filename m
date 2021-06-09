Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025423A0FC6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 11:39:06 +0200 (CEST)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqufx-0008Vd-1O
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 05:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lqucp-0006CK-0L
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:35:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34920
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lqucm-0004Zt-GE
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:35:50 -0400
Received: from host109-155-147-70.range109-155.btcentralplus.com
 ([109.155.147.70] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lqucV-00051e-Rl; Wed, 09 Jun 2021 10:35:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
Date: Wed,  9 Jun 2021 10:35:28 +0100
Message-Id: <20210609093528.9616-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.155.147.70
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH] cputlb: implement load_helper_unaligned() for unaligned
 loads
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[RFC because this is currently only lightly tested and there have been some
discussions about whether this should be handled elsewhere in the memory API]

If an unaligned load is required then the load is split into 2 separate accesses
and combined together within load_helper(). This does not work correctly with
MMIO accesses because the original access size is used for both individual
accesses causing the little and big endian combine to return the wrong result.

There is already a similar solution in place for store_helper() where an unaligned
access is handled by a separate store_helper_unaligned() function which instead
of using the original access size, uses a single-byte access size to shift and
combine the result correctly regardless of the orignal access size or endian.

Implement a similar load_helper_unaligned() function which uses the same approach
for unaligned loads to return the correct result according to the original test
case.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/360
---
 accel/tcg/cputlb.c | 99 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 82 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f24348e979..1845929e99 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1851,6 +1851,85 @@ load_memop(const void *haddr, MemOp op)
     }
 }
 
+static uint64_t __attribute__((noinline))
+load_helper_unaligned(CPUArchState *env, target_ulong addr, uintptr_t retaddr,
+                      size_t size, uintptr_t mmu_idx, bool code_read,
+                      bool big_endian)
+{
+    uintptr_t index, index2;
+    CPUTLBEntry *entry, *entry2;
+    const size_t tlb_off = code_read ?
+        offsetof(CPUTLBEntry, addr_code) : offsetof(CPUTLBEntry, addr_read);
+    const MMUAccessType access_type =
+        code_read ? MMU_INST_FETCH : MMU_DATA_LOAD;
+    target_ulong page2, tlb_addr, tlb_addr2;
+    uint64_t val = 0;
+    TCGMemOpIdx oi;
+    size_t size2;
+    int i;
+
+    /*
+     * Ensure the second page is in the TLB.  Note that the first page
+     * is already guaranteed to be filled, and that the second page
+     * cannot evict the first.
+     */
+    page2 = (addr + size) & TARGET_PAGE_MASK;
+    size2 = (addr + size) & ~TARGET_PAGE_MASK;
+    index2 = tlb_index(env, mmu_idx, page2);
+    entry2 = tlb_entry(env, mmu_idx, page2);
+
+    tlb_addr2 = code_read ? entry2->addr_code : entry2->addr_read;
+    if (!tlb_hit_page(tlb_addr2, page2)) {
+        if (!victim_tlb_hit(env, mmu_idx, index2, tlb_off, page2)) {
+            tlb_fill(env_cpu(env), page2, size2, access_type,
+                     mmu_idx, retaddr);
+            index2 = tlb_index(env, mmu_idx, page2);
+            entry2 = tlb_entry(env, mmu_idx, page2);
+        }
+        tlb_addr2 = code_read ? entry2->addr_code : entry2->addr_read;
+    }
+
+    index = tlb_index(env, mmu_idx, addr);
+    entry = tlb_entry(env, mmu_idx, addr);
+    tlb_addr = code_read ? entry->addr_code : entry->addr_read;
+
+    /*
+     * Handle watchpoints
+     */
+    if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
+        cpu_check_watchpoint(env_cpu(env), addr, size - size2,
+                             env_tlb(env)->d[mmu_idx].iotlb[index].attrs,
+                             BP_MEM_READ, retaddr);
+    }
+    if (unlikely(tlb_addr2 & TLB_WATCHPOINT)) {
+        cpu_check_watchpoint(env_cpu(env), page2, size2,
+                             env_tlb(env)->d[mmu_idx].iotlb[index2].attrs,
+                             BP_MEM_READ, retaddr);
+    }
+
+    /*
+     * XXX: not efficient, but simple.
+     * This loop must go in the forward direction to avoid issues
+     * with self-modifying code in Windows 64-bit.
+     */
+    oi = make_memop_idx(MO_UB, mmu_idx);
+    if (big_endian) {
+        for (i = 0; i < size; ++i) {
+            /* Big-endian load.  */
+            uint8_t val8 = helper_ret_ldub_mmu(env, addr + i, oi, retaddr);
+            val |= val8 << (((size - 1) * 8) - (i * 8));
+        }
+    } else {
+        for (i = 0; i < size; ++i) {
+            /* Little-endian load.  */
+            uint8_t val8 = helper_ret_ldub_mmu(env, addr + i, oi, retaddr);
+            val |= val8 << (i * 8);
+        }
+    }
+
+    return val;
+}
+
 static inline uint64_t QEMU_ALWAYS_INLINE
 load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
             uintptr_t retaddr, MemOp op, bool code_read,
@@ -1893,7 +1972,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         CPUIOTLBEntry *iotlbentry;
         bool need_swap;
 
-        /* For anything that is unaligned, recurse through full_load.  */
+        /* For anything that is unaligned, recurse through byte loads.  */
         if ((addr & (size - 1)) != 0) {
             goto do_unaligned_access;
         }
@@ -1932,23 +2011,9 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
     if (size > 1
         && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
                     >= TARGET_PAGE_SIZE)) {
-        target_ulong addr1, addr2;
-        uint64_t r1, r2;
-        unsigned shift;
     do_unaligned_access:
-        addr1 = addr & ~((target_ulong)size - 1);
-        addr2 = addr1 + size;
-        r1 = full_load(env, addr1, oi, retaddr);
-        r2 = full_load(env, addr2, oi, retaddr);
-        shift = (addr & (size - 1)) * 8;
-
-        if (memop_big_endian(op)) {
-            /* Big-endian combine.  */
-            res = (r1 << shift) | (r2 >> ((size * 8) - shift));
-        } else {
-            /* Little-endian combine.  */
-            res = (r1 >> shift) | (r2 << ((size * 8) - shift));
-        }
+        res = load_helper_unaligned(env, addr, retaddr, size, mmu_idx,
+                                    code_read, memop_big_endian(op));
         return res & MAKE_64BIT_MASK(0, size * 8);
     }
 
-- 
2.20.1


