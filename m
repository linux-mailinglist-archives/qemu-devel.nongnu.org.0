Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287085B2869
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 23:21:13 +0200 (CEST)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWOxT-0003cO-Qh
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 17:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oWOvC-0000Sg-G1; Thu, 08 Sep 2022 17:18:50 -0400
Received: from [200.168.210.66] (port=45938 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oWOvA-00067b-7V; Thu, 08 Sep 2022 17:18:50 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 8 Sep 2022 18:18:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4C2FF800278;
 Thu,  8 Sep 2022 18:18:42 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: npiggin@gmail.com, richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH] tcg/ppc: Optimize 26-bit jumps
Date: Thu,  8 Sep 2022 18:18:29 -0300
Message-Id: <20220908211829.181447-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Sep 2022 21:18:42.0669 (UTC)
 FILETIME=[9287F9D0:01D8C3C8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

PowerPC64 processors handle direct branches better than indirect
ones, resulting in less stalled cycles and branch misses.

However, PPC's tb_target_set_jmp_target() was only using direct
branches for 16-bit jumps, while PowerPC64's unconditional branch
instructions are able to handle displacements of up to 26 bits.
To take advantage of this, now jumps whose displacements fit in
between 17 and 26 bits are also converted to direct branches.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 tcg/ppc/tcg-target.c.inc | 86 ++++++++++++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 13 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 1cbd047ab3..a776685a3b 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1847,14 +1847,69 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     tcg_out32(s, insn);
 }
 
+static inline void ppc_replace_insn(uintptr_t rx, uintptr_t rw,
+    uint32_t offs, tcg_insn_unit i)
+{
+    rx += offs;
+    rw += offs;
+
+    qatomic_set((uint32_t *)rw, i);
+    smp_wmb();      /* Make sure this instruction is modified before others */
+    flush_idcache_range(rx, rw, 4);
+}
+
+static inline void ppc64_replace_insn_pair(uintptr_t rx, uintptr_t rw,
+    uint32_t offs, tcg_insn_unit i1, tcg_insn_unit i2)
+{
+    uint64_t pair;
+
+    rx += offs;
+    rw += offs;
+
+#if HOST_BIG_ENDIAN
+    pair = (uint64_t)i1 << 32 | i2;
+#else
+    pair = (uint64_t)i2 << 32 | i1;
+#endif
+
+    /*
+     * This function is only called on ppc64. Avoid the _Static_assert
+     * within qatomic_set that would fail to build a ppc32 host.
+     */
+    qatomic_set__nocheck((uint64_t *)rw, pair);
+    smp_wmb();  /* Make sure these instructions are modified before others */
+    flush_idcache_range(rx, rw, 8);
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                               uintptr_t jmp_rw, uintptr_t addr)
 {
     if (TCG_TARGET_REG_BITS == 64) {
-        tcg_insn_unit i1, i2;
+        tcg_insn_unit i1, i2, i3;
         intptr_t tb_diff = addr - tc_ptr;
         intptr_t br_diff = addr - (jmp_rx + 4);
-        uint64_t pair;
+
+        /*
+         * Here we need to change (up to) 3 instructions in an atomic way.
+         * As it's not possible to change all 3 at the same time, we perform
+         * the changes in multiple steps, in a way that results in valid code
+         * in each step.
+         *
+         * We handle 3 jump sizes: 16, 26 and 32 bits.
+         *
+         * The first step is to restore the last instruction, if needed,
+         * that is only changed by 26-bit jumps, that would become an
+         * equivalent 32-bit jump.
+         */
+        i3 = MTSPR | RS(TCG_REG_TB) | CTR;
+        if ((uint32_t)jmp_rw != i3) {
+            ppc_replace_insn(jmp_rx, jmp_rw, 8, i3);
+        }
+
+        /*
+         * Next, for the 16-bit and 32-bit cases, we just need to replace the
+         * first 2 instructions and we're done.
+         */
 
         /* This does not exercise the range of the branch, but we do
            still need to be able to load the new value of TCG_REG_TB.
@@ -1862,28 +1917,33 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
         if (tb_diff == (int16_t)tb_diff) {
             i1 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, tb_diff);
             i2 = B | (br_diff & 0x3fffffc);
+            ppc64_replace_insn_pair(jmp_rx, jmp_rw, 0, i1, i2);
+
         } else {
             intptr_t lo = (int16_t)tb_diff;
             intptr_t hi = (int32_t)(tb_diff - lo);
             assert(tb_diff == hi + lo);
             i1 = ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, hi >> 16);
             i2 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, lo);
+            ppc64_replace_insn_pair(jmp_rx, jmp_rw, 0, i1, i2);
+
+            /*
+             * For the 26-bit case, the final step is to replace the
+             * last instruction with a direct branch. Note that in this case
+             * the branch is performed 1 instruction after the 16-bit case,
+             * so br_diff needs to be adjusted properly.
+             */
+            br_diff -= 4;
+            if (br_diff >= -0x2000000 && br_diff <= 0x1fffffc) {
+                i3 = B | (br_diff & 0x3fffffc);
+                ppc_replace_insn(jmp_rx, jmp_rw, 8, i3);
+            }
         }
-#if HOST_BIG_ENDIAN
-        pair = (uint64_t)i1 << 32 | i2;
-#else
-        pair = (uint64_t)i2 << 32 | i1;
-#endif
 
-        /* As per the enclosing if, this is ppc64.  Avoid the _Static_assert
-           within qatomic_set that would fail to build a ppc32 host.  */
-        qatomic_set__nocheck((uint64_t *)jmp_rw, pair);
-        flush_idcache_range(jmp_rx, jmp_rw, 8);
     } else {
         intptr_t diff = addr - jmp_rx;
         tcg_debug_assert(in_range_b(diff));
-        qatomic_set((uint32_t *)jmp_rw, B | (diff & 0x3fffffc));
-        flush_idcache_range(jmp_rx, jmp_rw, 4);
+        ppc_replace_insn(jmp_rx, jmp_rw, 0, B | (diff & 0x3fffffc));
     }
 }
 
-- 
2.25.1


