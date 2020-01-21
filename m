Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA89143EB5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:58:17 +0100 (CET)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itu2q-0007OA-57
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34455)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ittla-0003ok-NK
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:40:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ittlW-00034o-AP
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:40:26 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:54332 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ittlV-0002Tb-DL
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:40:22 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 09AB41A458E;
 Tue, 21 Jan 2020 14:39:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id A12AD1A4595;
 Tue, 21 Jan 2020 14:39:15 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] target/mips: Add implementation of GINVT instruction
Date: Tue, 21 Jan 2020 14:38:56 +0100
Message-Id: <1579613937-5774-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579613937-5774-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1579613937-5774-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: aleksandar.rikalo@rt-rk.com, Yongbok Kim <yongbok.kim@mips.com>,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yongbok Kim <yongbok.kim@mips.com>

Implement emulation of GINVT instruction. As QEMU doesn't support
caches and virtualization, this implementation covers only GINVT
(Global Invalidate TLB) instruction among TLB-related instructions.

Signed-off-by: Yongbok Kim <yongbok.kim@mips.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 disas/mips.c            |   2 +
 target/mips/cpu.h       |   2 +-
 target/mips/helper.c    |  20 ++++++--
 target/mips/helper.h    |   2 +
 target/mips/internal.h  |   1 +
 target/mips/op_helper.c | 129 +++++++++++++++++++++++++++++++++++++++++-------
 target/mips/translate.c |  46 ++++++++++++++++-
 7 files changed, 176 insertions(+), 26 deletions(-)

diff --git a/disas/mips.c b/disas/mips.c
index 75c48b3..cedfbf8 100644
--- a/disas/mips.c
+++ b/disas/mips.c
@@ -1417,6 +1417,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
 {"crc32ch",    "t,v,t", 0x7c00014f, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I32R6},
 {"crc32cw",    "t,v,t", 0x7c00018f, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I32R6},
 {"crc32cd",    "t,v,t", 0x7c0001cf, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I64R6},
+{"ginvi",      "v",     0x7c00003d, 0xfc1ffcff, TRAP | INSN_TLB,      0, I32R6},
+{"ginvt",      "v",     0x7c0000bd, 0xfc1ffcff, TRAP | INSN_TLB,      0, I32R6},
 
 /* MSA */
 {"sll.b",   "+d,+e,+f", 0x7800000d, 0xffe0003f, WR_VD|RD_VS|RD_VT,  0, MSA},
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index a7e9857..fdab989 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -309,7 +309,7 @@ typedef struct mips_def_t mips_def_t;
 #define CP0_REG04__USERLOCAL       2
 #define CP0_REG04__XCONTEXTCONFIG  3
 #define CP0_REG04__DBGCONTEXTID    4
-#define CP0_REG00__MMID            5
+#define CP0_REG04__MMID            5
 /* CP0 Register 05 */
 #define CP0_REG05__PAGEMASK        0
 #define CP0_REG05__PAGEGRAIN       1
diff --git a/target/mips/helper.c b/target/mips/helper.c
index 781930a..afd78b1 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -72,8 +72,13 @@ int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
                     target_ulong address, int rw, int access_type)
 {
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+    uint32_t tlb_mmid;
     int i;
 
+    MMID = mi ? MMID : (uint32_t) ASID;
+
     for (i = 0; i < env->tlb->tlb_in_use; i++) {
         r4k_tlb_t *tlb = &env->tlb->mmu.r4k.tlb[i];
         /* 1k pages are not supported. */
@@ -84,8 +89,9 @@ int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
         tag &= env->SEGMask;
 #endif
 
-        /* Check ASID, virtual page number & size */
-        if ((tlb->G == 1 || tlb->ASID == ASID) && VPN == tag && !tlb->EHINV) {
+        /* Check ASID/MMID, virtual page number & size */
+        tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+        if ((tlb->G == 1 || tlb_mmid == MMID) && VPN == tag && !tlb->EHINV) {
             /* TLB match */
             int n = !!(address & mask & ~(mask >> 1));
             /* Check access rights */
@@ -1418,14 +1424,20 @@ void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
     target_ulong addr;
     target_ulong end;
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+    uint32_t tlb_mmid;
     target_ulong mask;
 
+    MMID = mi ? MMID : (uint32_t) ASID;
+
     tlb = &env->tlb->mmu.r4k.tlb[idx];
     /*
-     * The qemu TLB is flushed when the ASID changes, so no need to
+     * The qemu TLB is flushed when the ASID/MMID changes, so no need to
      * flush these entries again.
      */
-    if (tlb->G == 0 && tlb->ASID != ASID) {
+    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+    if (tlb->G == 0 && tlb_mmid != MMID) {
         return;
     }
 
diff --git a/target/mips/helper.h b/target/mips/helper.h
index 032ea8a..acf7b82 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -122,6 +122,7 @@ DEF_HELPER_2(mtc0_tcschefback, void, env, tl)
 DEF_HELPER_2(mttc0_tcschefback, void, env, tl)
 DEF_HELPER_2(mtc0_entrylo1, void, env, tl)
 DEF_HELPER_2(mtc0_context, void, env, tl)
+DEF_HELPER_2(mtc0_memorymapid, void, env, tl)
 DEF_HELPER_2(mtc0_pagemask, void, env, tl)
 DEF_HELPER_2(mtc0_pagegrain, void, env, tl)
 DEF_HELPER_2(mtc0_segctl0, void, env, tl)
@@ -378,6 +379,7 @@ DEF_HELPER_1(ei, tl, env)
 DEF_HELPER_1(eret, void, env)
 DEF_HELPER_1(eretnc, void, env)
 DEF_HELPER_1(deret, void, env)
+DEF_HELPER_3(ginvt, void, env, tl, i32)
 #endif /* !CONFIG_USER_ONLY */
 DEF_HELPER_1(rdhwr_cpunum, tl, env)
 DEF_HELPER_1(rdhwr_synci_step, tl, env)
diff --git a/target/mips/internal.h b/target/mips/internal.h
index 3f435b5..df55f84 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -95,6 +95,7 @@ struct r4k_tlb_t {
     target_ulong VPN;
     uint32_t PageMask;
     uint16_t ASID;
+    uint32_t MMID;
     unsigned int G:1;
     unsigned int C0:3;
     unsigned int C1:3;
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index bcff2f9..a331d9d 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -1470,6 +1470,17 @@ void helper_mtc0_context(CPUMIPSState *env, target_ulong arg1)
     env->CP0_Context = (env->CP0_Context & 0x007FFFFF) | (arg1 & ~0x007FFFFF);
 }
 
+void helper_mtc0_memorymapid(CPUMIPSState *env, target_ulong arg1)
+{
+    int32_t old;
+    old = env->CP0_MemoryMapID;
+    env->CP0_MemoryMapID = (int32_t) arg1;
+    /* If the MemoryMapID changes, flush qemu's TLB.  */
+    if (old != env->CP0_MemoryMapID) {
+        cpu_mips_tlb_flush(env);
+    }
+}
+
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask)
 {
     uint64_t mask = arg1 >> (TARGET_PAGE_BITS + 1);
@@ -1906,6 +1917,8 @@ void helper_mtc0_config5(CPUMIPSState *env, target_ulong arg1)
 {
     env->CP0_Config5 = (env->CP0_Config5 & (~env->CP0_Config5_rw_bitmask)) |
                        (arg1 & env->CP0_Config5_rw_bitmask);
+    env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ?
+            0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
     compute_hflags(env);
 }
 
@@ -2349,6 +2362,7 @@ static void r4k_fill_tlb(CPUMIPSState *env, int idx)
     tlb->VPN &= env->SEGMask;
 #endif
     tlb->ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    tlb->MMID = env->CP0_MemoryMapID;
     tlb->PageMask = env->CP0_PageMask;
     tlb->G = env->CP0_EntryLo0 & env->CP0_EntryLo1 & 1;
     tlb->V0 = (env->CP0_EntryLo0 & 2) != 0;
@@ -2367,13 +2381,18 @@ static void r4k_fill_tlb(CPUMIPSState *env, int idx)
 
 void r4k_helper_tlbinv(CPUMIPSState *env)
 {
-    int idx;
-    r4k_tlb_t *tlb;
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
+    r4k_tlb_t *tlb;
+    int idx;
 
+    MMID = mi ? MMID : (uint32_t) ASID;
     for (idx = 0; idx < env->tlb->nb_tlb; idx++) {
         tlb = &env->tlb->mmu.r4k.tlb[idx];
-        if (!tlb->G && tlb->ASID == ASID) {
+        tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+        if (!tlb->G && tlb_mmid == MMID) {
             tlb->EHINV = 1;
         }
     }
@@ -2392,11 +2411,16 @@ void r4k_helper_tlbinvf(CPUMIPSState *env)
 
 void r4k_helper_tlbwi(CPUMIPSState *env)
 {
-    r4k_tlb_t *tlb;
-    int idx;
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
     target_ulong VPN;
-    uint16_t ASID;
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
     bool EHINV, G, V0, D0, V1, D1, XI0, XI1, RI0, RI1;
+    r4k_tlb_t *tlb;
+    int idx;
+
+    MMID = mi ? MMID : (uint32_t) ASID;
 
     idx = (env->CP0_Index & ~0x80000000) % env->tlb->nb_tlb;
     tlb = &env->tlb->mmu.r4k.tlb[idx];
@@ -2404,7 +2428,6 @@ void r4k_helper_tlbwi(CPUMIPSState *env)
 #if defined(TARGET_MIPS64)
     VPN &= env->SEGMask;
 #endif
-    ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
     EHINV = (env->CP0_EntryHi & (1 << CP0EnHi_EHINV)) != 0;
     G = env->CP0_EntryLo0 & env->CP0_EntryLo1 & 1;
     V0 = (env->CP0_EntryLo0 & 2) != 0;
@@ -2416,11 +2439,12 @@ void r4k_helper_tlbwi(CPUMIPSState *env)
     XI1 = (env->CP0_EntryLo1 >> CP0EnLo_XI) &1;
     RI1 = (env->CP0_EntryLo1 >> CP0EnLo_RI) &1;
 
+    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
     /*
      * Discard cached TLB entries, unless tlbwi is just upgrading access
      * permissions on the current entry.
      */
-    if (tlb->VPN != VPN || tlb->ASID != ASID || tlb->G != G ||
+    if (tlb->VPN != VPN || tlb_mmid != MMID || tlb->G != G ||
         (!tlb->EHINV && EHINV) ||
         (tlb->V0 && !V0) || (tlb->D0 && !D0) ||
         (!tlb->XI0 && XI0) || (!tlb->RI0 && RI0) ||
@@ -2443,14 +2467,17 @@ void r4k_helper_tlbwr(CPUMIPSState *env)
 
 void r4k_helper_tlbp(CPUMIPSState *env)
 {
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
     r4k_tlb_t *tlb;
     target_ulong mask;
     target_ulong tag;
     target_ulong VPN;
-    uint16_t ASID;
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
     int i;
 
-    ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    MMID = mi ? MMID : (uint32_t) ASID;
     for (i = 0; i < env->tlb->nb_tlb; i++) {
         tlb = &env->tlb->mmu.r4k.tlb[i];
         /* 1k pages are not supported. */
@@ -2460,8 +2487,9 @@ void r4k_helper_tlbp(CPUMIPSState *env)
 #if defined(TARGET_MIPS64)
         tag &= env->SEGMask;
 #endif
-        /* Check ASID, virtual page number & size */
-        if ((tlb->G == 1 || tlb->ASID == ASID) && VPN == tag && !tlb->EHINV) {
+        tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+        /* Check ASID/MMID, virtual page number & size */
+        if ((tlb->G == 1 || tlb_mmid == MMID) && VPN == tag && !tlb->EHINV) {
             /* TLB match */
             env->CP0_Index = i;
             break;
@@ -2478,8 +2506,9 @@ void r4k_helper_tlbp(CPUMIPSState *env)
 #if defined(TARGET_MIPS64)
             tag &= env->SEGMask;
 #endif
-            /* Check ASID, virtual page number & size */
-            if ((tlb->G == 1 || tlb->ASID == ASID) && VPN == tag) {
+            tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+            /* Check ASID/MMID, virtual page number & size */
+            if ((tlb->G == 1 || tlb_mmid == MMID) && VPN == tag) {
                 r4k_mips_tlb_flush_extra(env, i);
                 break;
             }
@@ -2501,16 +2530,20 @@ static inline uint64_t get_entrylo_pfn_from_tlb(uint64_t tlb_pfn)
 
 void r4k_helper_tlbr(CPUMIPSState *env)
 {
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
     r4k_tlb_t *tlb;
-    uint16_t ASID;
     int idx;
 
-    ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    MMID = mi ? MMID : (uint32_t) ASID;
     idx = (env->CP0_Index & ~0x80000000) % env->tlb->nb_tlb;
     tlb = &env->tlb->mmu.r4k.tlb[idx];
 
-    /* If this will change the current ASID, flush qemu's TLB.  */
-    if (ASID != tlb->ASID) {
+    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+    /* If this will change the current ASID/MMID, flush qemu's TLB.  */
+    if (MMID != tlb_mmid) {
         cpu_mips_tlb_flush(env);
     }
 
@@ -2522,7 +2555,8 @@ void r4k_helper_tlbr(CPUMIPSState *env)
         env->CP0_EntryLo0 = 0;
         env->CP0_EntryLo1 = 0;
     } else {
-        env->CP0_EntryHi = tlb->VPN | tlb->ASID;
+        env->CP0_EntryHi = mi ? tlb->VPN : tlb->VPN | tlb->ASID;
+        env->CP0_MemoryMapID = tlb->MMID;
         env->CP0_PageMask = tlb->PageMask;
         env->CP0_EntryLo0 = tlb->G | (tlb->V0 << 1) | (tlb->D0 << 2) |
                         ((uint64_t)tlb->RI0 << CP0EnLo_RI) |
@@ -2565,6 +2599,63 @@ void helper_tlbinvf(CPUMIPSState *env)
     env->tlb->helper_tlbinvf(env);
 }
 
+static void global_invalidate_tlb(CPUMIPSState *env,
+                           uint32_t invMsgVPN2,
+                           uint8_t invMsgR,
+                           uint32_t invMsgMMid,
+                           bool invAll,
+                           bool invVAMMid,
+                           bool invMMid,
+                           bool invVA)
+{
+
+    int idx;
+    r4k_tlb_t *tlb;
+    bool VAMatch;
+    bool MMidMatch;
+
+    for (idx = 0; idx < env->tlb->nb_tlb; idx++) {
+        tlb = &env->tlb->mmu.r4k.tlb[idx];
+        VAMatch =
+            (((tlb->VPN & ~tlb->PageMask) == (invMsgVPN2 & ~tlb->PageMask))
+#ifdef TARGET_MIPS64
+            &&
+            (extract64(env->CP0_EntryHi, 62, 2) == invMsgR)
+#endif
+            );
+        MMidMatch = tlb->MMID == invMsgMMid;
+        if ((invAll && (idx > env->CP0_Wired)) ||
+            (VAMatch && invVAMMid && (tlb->G || MMidMatch)) ||
+            (VAMatch && invVA) ||
+            (MMidMatch && !(tlb->G) && invMMid)) {
+            tlb->EHINV = 1;
+        }
+    }
+    cpu_mips_tlb_flush(env);
+}
+
+void helper_ginvt(CPUMIPSState *env, target_ulong arg, uint32_t type)
+{
+    bool invAll = type == 0;
+    bool invVA = type == 1;
+    bool invMMid = type == 2;
+    bool invVAMMid = type == 3;
+    uint32_t invMsgVPN2 = arg & (TARGET_PAGE_MASK << 1);
+    uint8_t invMsgR = 0;
+    uint32_t invMsgMMid = env->CP0_MemoryMapID;
+    CPUState *other_cs = first_cpu;
+
+#ifdef TARGET_MIPS64
+    invMsgR = extract64(arg, 62, 2);
+#endif
+
+    CPU_FOREACH(other_cs) {
+        MIPSCPU *other_cpu = MIPS_CPU(other_cs);
+        global_invalidate_tlb(&other_cpu->env, invMsgVPN2, invMsgR, invMsgMMid,
+                              invAll, invVAMMid, invMMid, invVA);
+    }
+}
+
 /* Specials */
 target_ulong helper_di(CPUMIPSState *env)
 {
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 7cda5c7..b3c177f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -388,6 +388,7 @@ enum {
     OPC_BSHFL    = 0x20 | OPC_SPECIAL3,
     OPC_DBSHFL   = 0x24 | OPC_SPECIAL3,
     OPC_RDHWR    = 0x3B | OPC_SPECIAL3,
+    OPC_GINV     = 0x3D | OPC_SPECIAL3,
 
     /* Loongson 2E */
     OPC_MULT_G_2E   = 0x18 | OPC_SPECIAL3,
@@ -2550,6 +2551,7 @@ typedef struct DisasContext {
     bool saar;
     bool crcp;
     bool mi;
+    int gi;
 } DisasContext;
 
 #define DISAS_STOP       DISAS_TARGET_0
@@ -7133,6 +7135,11 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             tcg_gen_ext32s_tl(arg, arg);
             register_name = "UserLocal";
             break;
+        case CP0_REG04__MMID:
+            CP0_CHECK(ctx->mi);
+            gen_helper_mtc0_memorymapid(cpu_env, arg);
+            register_name = "MMID";
+            break;
         default:
             goto cp0_unimplemented;
         }
@@ -7873,6 +7880,11 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                           offsetof(CPUMIPSState, active_tc.CP0_UserLocal));
             register_name = "UserLocal";
             break;
+        case CP0_REG04__MMID:
+            CP0_CHECK(ctx->mi);
+            gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_MemoryMapID));
+            register_name = "MMID";
+            break;
         default:
             goto cp0_unimplemented;
         }
@@ -8631,6 +8643,11 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                           offsetof(CPUMIPSState, active_tc.CP0_UserLocal));
             register_name = "UserLocal";
             break;
+        case CP0_REG04__MMID:
+            CP0_CHECK(ctx->mi);
+            gen_helper_mtc0_memorymapid(cpu_env, arg);
+            register_name = "MMID";
+            break;
         default:
             goto cp0_unimplemented;
         }
@@ -9353,6 +9370,11 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                           offsetof(CPUMIPSState, active_tc.CP0_UserLocal));
             register_name = "UserLocal";
             break;
+        case CP0_REG04__MMID:
+            CP0_CHECK(ctx->mi);
+            gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_MemoryMapID));
+            register_name = "MMID";
+            break;
         default:
             goto cp0_unimplemented;
         }
@@ -27335,6 +27357,25 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
             }
         }
         break;
+#ifndef CONFIG_USER_ONLY
+    case OPC_GINV:
+        if (unlikely(ctx->gi <= 1)) {
+            generate_exception_end(ctx, EXCP_RI);
+        }
+        check_cp0_enabled(ctx);
+        switch ((ctx->opcode >> 6) & 3) {
+        case 0:    /* GINVI */
+            /* Treat as NOP. */
+            break;
+        case 2:    /* GINVT */
+            gen_helper_0e1i(ginvt, cpu_gpr[rs], extract32(ctx->opcode, 8, 2));
+            break;
+        default:
+            generate_exception_end(ctx, EXCP_RI);
+            break;
+        }
+        break;
+#endif
 #if defined(TARGET_MIPS64)
     case R6_OPC_SCD:
         gen_st_cond(ctx, rt, rs, imm, MO_TEQ, false);
@@ -30894,6 +30935,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
     ctx->crcp = (env->CP0_Config5 >> CP0C5_CRCP) & 1;
     ctx->mi = (env->CP0_Config5 >> CP0C5_MI) & 1;
+    ctx->gi = (env->CP0_Config5 >> CP0C5_GI) & 3;
     restore_cpu_state(env, ctx);
 #ifdef CONFIG_USER_ONLY
         ctx->mem_idx = MIPS_HFLAG_UM;
@@ -31354,8 +31396,8 @@ void cpu_state_reset(CPUMIPSState *env)
     if (env->CP0_Config3 & (1 << CP0C3_CMGCR)) {
         env->CP0_CMGCRBase = 0x1fbf8000 >> 4;
     }
-    env->CP0_EntryHi_ASID_mask = (env->CP0_Config4 & (1 << CP0C4_AE)) ?
-                                 0x3ff : 0xff;
+    env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ?
+            0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
     env->CP0_Status = (1 << CP0St_BEV) | (1 << CP0St_ERL);
     /*
      * Vectored interrupts not implemented, timer on int 7,
-- 
2.7.4


