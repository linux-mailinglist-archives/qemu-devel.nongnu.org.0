Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1CF5B8F05
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 20:46:21 +0200 (CEST)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYXOu-0005WM-Qv
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 14:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oYXLm-0002fC-Nh; Wed, 14 Sep 2022 14:43:07 -0400
Received: from [200.168.210.66] (port=14226 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oYXLk-0007TI-R6; Wed, 14 Sep 2022 14:43:06 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 14 Sep 2022 15:41:56 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2D831800026;
 Wed, 14 Sep 2022 15:41:56 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: npiggin@gmail.com, richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH v2] tcg/ppc: Optimize 26-bit jumps
Date: Wed, 14 Sep 2022 15:41:41 -0300
Message-Id: <20220914184141.35423-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 14 Sep 2022 18:41:56.0584 (UTC)
 FILETIME=[AA8BCE80:01D8C869]
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
v2: use stq to replace all instructions atomically

 tcg/ppc/tcg-target.c.inc | 84 +++++++++++++++++++++++++++++++---------
 1 file changed, 66 insertions(+), 18 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 1cbd047ab3..484014cb1a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1847,38 +1847,86 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     tcg_out32(s, insn);
 }
 
+#if TCG_TARGET_REG_BITS == 64
+
+static inline uint64_t make_pair(tcg_insn_unit i1, tcg_insn_unit i2)
+{
+#if HOST_BIG_ENDIAN
+    return (uint64_t)i1 << 32 | i2;
+#else
+    return (uint64_t)i2 << 32 | i1;
+#endif
+}
+
+static inline void ppc64_stq(uintptr_t dst, uint64_t src0, uint64_t src1)
+{
+    asm volatile (
+        "mr  %%r6, %0\n\t"
+        "mr  %%r7, %1\n\t"
+        "stq %%r6, 0(%2)"
+        : : "r" (src0), "r" (src1), "r" (dst) : "r6", "r7", "memory");
+}
+
+#endif
+
+static inline void ppc64_replace_insns(uintptr_t rx, uintptr_t rw,
+    tcg_insn_unit *insn)
+{
+#if TCG_TARGET_REG_BITS == 64
+    uint64_t pair[2];
+
+    pair[0] = make_pair(insn[0], insn[1]);
+    if (have_isa_2_07) {
+        pair[1] = make_pair(insn[2], insn[3]);
+#if HOST_BIG_ENDIAN
+        ppc64_stq(rw, pair[0], pair[1]);
+#else
+        ppc64_stq(rw, pair[1], pair[0]);
+#endif
+        flush_idcache_range(rx, rw, 16);
+    } else {
+        qatomic_set((uint64_t *)rw, pair[0]);
+        flush_idcache_range(rx, rw, 8);
+    }
+#endif
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                               uintptr_t jmp_rw, uintptr_t addr)
 {
     if (TCG_TARGET_REG_BITS == 64) {
-        tcg_insn_unit i1, i2;
+        tcg_insn_unit i[4];
         intptr_t tb_diff = addr - tc_ptr;
         intptr_t br_diff = addr - (jmp_rx + 4);
-        uint64_t pair;
 
-        /* This does not exercise the range of the branch, but we do
-           still need to be able to load the new value of TCG_REG_TB.
-           But this does still happen quite often.  */
+        /*
+         * This does not exercise the range of the branch, but we do
+         * still need to be able to load the new value of TCG_REG_TB.
+         * But this does still happen quite often.
+         */
         if (tb_diff == (int16_t)tb_diff) {
-            i1 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, tb_diff);
-            i2 = B | (br_diff & 0x3fffffc);
+            i[0] = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, tb_diff);
+            i[1] = B | (br_diff & 0x3fffffc);
+            i[2] = MTSPR | RS(TCG_REG_TB) | CTR;
+
         } else {
             intptr_t lo = (int16_t)tb_diff;
             intptr_t hi = (int32_t)(tb_diff - lo);
             assert(tb_diff == hi + lo);
-            i1 = ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, hi >> 16);
-            i2 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, lo);
+            i[0] = ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, hi >> 16);
+            i[1] = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, lo);
+
+            br_diff -= 4;
+            if (have_isa_2_07 && in_range_b(br_diff)) {
+                i[2] = B | (br_diff & 0x3fffffc);
+            } else {
+                i[2] = MTSPR | RS(TCG_REG_TB) | CTR;
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
+        i[3] = BCCTR | BO_ALWAYS;
+        ppc64_replace_insns(jmp_rx, jmp_rw, i);
+
     } else {
         intptr_t diff = addr - jmp_rx;
         tcg_debug_assert(in_range_b(diff));
-- 
2.25.1


