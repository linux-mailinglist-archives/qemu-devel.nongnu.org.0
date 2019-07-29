Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8B79312
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 20:31:17 +0200 (CEST)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsAQW-0001qM-Tj
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 14:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52929)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hsALQ-0003eQ-O2
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 14:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hsALO-0001rZ-9x
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 14:26:00 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:34695 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hsALN-0001p8-Rn
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 14:25:58 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id D1F451A2202;
 Mon, 29 Jul 2019 20:25:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 8FC921A21FC;
 Mon, 29 Jul 2019 20:25:53 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 20:25:43 +0200
Message-Id: <1564424746-11065-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564424746-11065-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564424746-11065-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v2 3/6] target/mips: Implement Global
 Invalidate TLB instruction
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
Cc: arikalo@wavecomp.com, sw@weilnetz.de, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yongbok Kim <yongbok.kim@mips.com>

Implement Global Invalidate TLB instruction. As QEMU doesn't support
caches and Virtualization, this implementation only cover the GINVT
(Global Invalidate TLB) instruction.

Signed-off-by: Yongbok Kim <yongbok.kim@mips.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 disas/mips.c            |   2 +
 target/mips/helper.c    |  24 ++++++++--
 target/mips/helper.h    |   2 +
 target/mips/internal.h  |   1 +
 target/mips/op_helper.c | 122 ++++++++++++++++++++++++++++++++++++++++++------
 target/mips/translate.c |  50 +++++++++++++++++++-
 6 files changed, 179 insertions(+), 22 deletions(-)

diff --git a/disas/mips.c b/disas/mips.c
index dfefe5e..c3a3059 100644
--- a/disas/mips.c
+++ b/disas/mips.c
@@ -1409,6 +1409,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
 {"dvp",        "t",     0x41600024, 0xffe0ffff, TRAP|WR_t,            0, I32R6},
 {"evp",        "",      0x41600004, 0xffffffff, TRAP,                 0, I32R6},
 {"evp",        "t",     0x41600004, 0xffe0ffff, TRAP|WR_t,            0, I32R6},
+{"ginvi",      "v",     0x7c00003d, 0xfc1ffcff, TRAP | INSN_TLB,      0, I32R6},
+{"ginvt",      "v",     0x7c0000bd, 0xfc1ffcff, TRAP | INSN_TLB,      0, I32R6},
 
 /* MSA */
 {"sll.b",   "+d,+e,+f", 0x7800000d, 0xffe0003f, WR_VD|RD_VS|RD_VT,  0, MSA},
diff --git a/target/mips/helper.c b/target/mips/helper.c
index a2b6459..6e583d3 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -70,7 +70,12 @@ int r4k_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
                      target_ulong address, int rw, int access_type)
 {
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
     int i;
+    uint32_t tlb_mmid;
+
+    MMID = mi ? MMID : (uint32_t) ASID;
 
     for (i = 0; i < env->tlb->tlb_in_use; i++) {
         r4k_tlb_t *tlb = &env->tlb->mmu.r4k.tlb[i];
@@ -82,8 +87,9 @@ int r4k_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
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
@@ -1397,12 +1403,20 @@ void r4k_invalidate_tlb (CPUMIPSState *env, int idx, int use_extra)
     target_ulong addr;
     target_ulong end;
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
     target_ulong mask;
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+    uint32_t tlb_mmid;
+
+    MMID = mi ? MMID : (uint32_t) ASID;
 
     tlb = &env->tlb->mmu.r4k.tlb[idx];
-    /* The qemu TLB is flushed when the ASID changes, so no need to
-       flush these entries again.  */
-    if (tlb->G == 0 && tlb->ASID != ASID) {
+    /*
+     * The qemu TLB is flushed when the ASID/MMID changes, so no need to
+     * flush these entries again.
+     */
+    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+    if (tlb->G == 0 && tlb_mmid != MMID) {
         return;
     }
 
diff --git a/target/mips/helper.h b/target/mips/helper.h
index aad0951..c7d35bd 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -120,6 +120,7 @@ DEF_HELPER_2(mtc0_tcschefback, void, env, tl)
 DEF_HELPER_2(mttc0_tcschefback, void, env, tl)
 DEF_HELPER_2(mtc0_entrylo1, void, env, tl)
 DEF_HELPER_2(mtc0_context, void, env, tl)
+DEF_HELPER_2(mtc0_memorymapid, void, env, tl)
 DEF_HELPER_2(mtc0_pagemask, void, env, tl)
 DEF_HELPER_2(mtc0_pagegrain, void, env, tl)
 DEF_HELPER_2(mtc0_segctl0, void, env, tl)
@@ -376,6 +377,7 @@ DEF_HELPER_1(ei, tl, env)
 DEF_HELPER_1(eret, void, env)
 DEF_HELPER_1(eretnc, void, env)
 DEF_HELPER_1(deret, void, env)
+DEF_HELPER_3(ginvt, void, env, tl, i32)
 #endif /* !CONFIG_USER_ONLY */
 DEF_HELPER_1(rdhwr_cpunum, tl, env)
 DEF_HELPER_1(rdhwr_synci_step, tl, env)
diff --git a/target/mips/internal.h b/target/mips/internal.h
index f6d0d7a..d9216fb 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -92,6 +92,7 @@ struct r4k_tlb_t {
     target_ulong VPN;
     uint32_t PageMask;
     uint16_t ASID;
+    uint32_t MMID;
     unsigned int G:1;
     unsigned int C0:3;
     unsigned int C1:3;
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 52853e9..9b3bf4b 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -1409,6 +1409,17 @@ void helper_mtc0_context(CPUMIPSState *env, target_ulong arg1)
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
@@ -1853,6 +1864,8 @@ void helper_mtc0_config5(CPUMIPSState *env, target_ulong arg1)
 {
     env->CP0_Config5 = (env->CP0_Config5 & (~env->CP0_Config5_rw_bitmask)) |
                        (arg1 & env->CP0_Config5_rw_bitmask);
+    env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ? 0x0 :
+                        (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
     compute_hflags(env);
 }
 
@@ -2272,6 +2285,7 @@ static void r4k_fill_tlb(CPUMIPSState *env, int idx)
     tlb->VPN &= env->SEGMask;
 #endif
     tlb->ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    tlb->MMID = env->CP0_MemoryMapID;
     tlb->PageMask = env->CP0_PageMask;
     tlb->G = env->CP0_EntryLo0 & env->CP0_EntryLo1 & 1;
     tlb->V0 = (env->CP0_EntryLo0 & 2) != 0;
@@ -2290,13 +2304,18 @@ static void r4k_fill_tlb(CPUMIPSState *env, int idx)
 
 void r4k_helper_tlbinv(CPUMIPSState *env)
 {
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
     int idx;
     r4k_tlb_t *tlb;
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
 
+    MMID = mi ? MMID : (uint32_t) ASID;
     for (idx = 0; idx < env->tlb->nb_tlb; idx++) {
         tlb = &env->tlb->mmu.r4k.tlb[idx];
-        if (!tlb->G && tlb->ASID == ASID) {
+        tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+        if (!tlb->G && tlb_mmid == MMID) {
             tlb->EHINV = 1;
         }
     }
@@ -2315,11 +2334,16 @@ void r4k_helper_tlbinvf(CPUMIPSState *env)
 
 void r4k_helper_tlbwi(CPUMIPSState *env)
 {
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
     r4k_tlb_t *tlb;
     int idx;
     target_ulong VPN;
-    uint16_t ASID;
     bool EHINV, G, V0, D0, V1, D1, XI0, XI1, RI0, RI1;
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
+
+    MMID = mi ? MMID : (uint32_t) ASID;
 
     idx = (env->CP0_Index & ~0x80000000) % env->tlb->nb_tlb;
     tlb = &env->tlb->mmu.r4k.tlb[idx];
@@ -2327,7 +2351,6 @@ void r4k_helper_tlbwi(CPUMIPSState *env)
 #if defined(TARGET_MIPS64)
     VPN &= env->SEGMask;
 #endif
-    ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
     EHINV = (env->CP0_EntryHi & (1 << CP0EnHi_EHINV)) != 0;
     G = env->CP0_EntryLo0 & env->CP0_EntryLo1 & 1;
     V0 = (env->CP0_EntryLo0 & 2) != 0;
@@ -2339,9 +2362,10 @@ void r4k_helper_tlbwi(CPUMIPSState *env)
     XI1 = (env->CP0_EntryLo1 >> CP0EnLo_XI) &1;
     RI1 = (env->CP0_EntryLo1 >> CP0EnLo_RI) &1;
 
+    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
     /* Discard cached TLB entries, unless tlbwi is just upgrading access
        permissions on the current entry. */
-    if (tlb->VPN != VPN || tlb->ASID != ASID || tlb->G != G ||
+    if (tlb->VPN != VPN || tlb_mmid != MMID || tlb->G != G ||
         (!tlb->EHINV && EHINV) ||
         (tlb->V0 && !V0) || (tlb->D0 && !D0) ||
         (!tlb->XI0 && XI0) || (!tlb->RI0 && RI0) ||
@@ -2364,14 +2388,17 @@ void r4k_helper_tlbwr(CPUMIPSState *env)
 
 void r4k_helper_tlbp(CPUMIPSState *env)
 {
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
     r4k_tlb_t *tlb;
     target_ulong mask;
     target_ulong tag;
     target_ulong VPN;
-    uint16_t ASID;
     int i;
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
 
-    ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    MMID = mi ? MMID : (uint32_t) ASID;
     for (i = 0; i < env->tlb->nb_tlb; i++) {
         tlb = &env->tlb->mmu.r4k.tlb[i];
         /* 1k pages are not supported. */
@@ -2381,8 +2408,9 @@ void r4k_helper_tlbp(CPUMIPSState *env)
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
@@ -2399,8 +2427,9 @@ void r4k_helper_tlbp(CPUMIPSState *env)
 #if defined(TARGET_MIPS64)
             tag &= env->SEGMask;
 #endif
-            /* Check ASID, virtual page number & size */
-            if ((tlb->G == 1 || tlb->ASID == ASID) && VPN == tag) {
+            tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+            /* Check ASID/MMID, virtual page number & size */
+            if ((tlb->G == 1 || tlb_mmid == MMID) && VPN == tag) {
                 r4k_mips_tlb_flush_extra (env, i);
                 break;
             }
@@ -2422,17 +2451,22 @@ static inline uint64_t get_entrylo_pfn_from_tlb(uint64_t tlb_pfn)
 
 void r4k_helper_tlbr(CPUMIPSState *env)
 {
+    bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
     r4k_tlb_t *tlb;
-    uint16_t ASID;
     int idx;
+    uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    uint32_t MMID = env->CP0_MemoryMapID;
+    uint32_t tlb_mmid;
 
-    ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+    MMID = mi ? MMID : (uint32_t) ASID;
     idx = (env->CP0_Index & ~0x80000000) % env->tlb->nb_tlb;
     tlb = &env->tlb->mmu.r4k.tlb[idx];
 
-    /* If this will change the current ASID, flush qemu's TLB.  */
-    if (ASID != tlb->ASID)
+    tlb_mmid = mi ? tlb->MMID : (uint32_t) tlb->ASID;
+    /* If this will change the current ASID/MMID, flush qemu's TLB.  */
+    if (MMID != tlb_mmid) {
         cpu_mips_tlb_flush(env);
+    }
 
     r4k_mips_tlb_flush_extra(env, env->tlb->nb_tlb);
 
@@ -2442,7 +2476,8 @@ void r4k_helper_tlbr(CPUMIPSState *env)
         env->CP0_EntryLo0 = 0;
         env->CP0_EntryLo1 = 0;
     } else {
-        env->CP0_EntryHi = tlb->VPN | tlb->ASID;
+        env->CP0_EntryHi = mi ? tlb->VPN : tlb->VPN | tlb->ASID;
+        env->CP0_MemoryMapID = tlb->MMID;
         env->CP0_PageMask = tlb->PageMask;
         env->CP0_EntryLo0 = tlb->G | (tlb->V0 << 1) | (tlb->D0 << 2) |
                         ((uint64_t)tlb->RI0 << CP0EnLo_RI) |
@@ -2485,6 +2520,63 @@ void helper_tlbinvf(CPUMIPSState *env)
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
index 778461c..c612787 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -388,6 +388,7 @@ enum {
     OPC_BSHFL    = 0x20 | OPC_SPECIAL3,
     OPC_DBSHFL   = 0x24 | OPC_SPECIAL3,
     OPC_RDHWR    = 0x3B | OPC_SPECIAL3,
+    OPC_GINV     = 0x3D | OPC_SPECIAL3,
 
     /* Loongson 2E */
     OPC_MULT_G_2E   = 0x18 | OPC_SPECIAL3,
@@ -2547,6 +2548,8 @@ typedef struct DisasContext {
     bool nan2008;
     bool abs2008;
     bool saar;
+    int gi;
+    bool mi;
 } DisasContext;
 
 #define DISAS_STOP       DISAS_TARGET_0
@@ -6260,6 +6263,11 @@ static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
         not_likely:
             ctx->hflags |= MIPS_HFLAG_BC;
             break;
+        case 5:
+            CP0_CHECK(ctx->mi);
+            gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_MemoryMapID));
+            rn = "MemoryMapID";
+            break;
         default:
             MIPS_INVAL("conditional branch/jump");
             generate_exception_end(ctx, EXCP_RI);
@@ -7004,6 +7012,11 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_GlobalNumber));
             register_name = "GlobalNumber";
             break;
+        case 5:
+            CP0_CHECK(ctx->mi);
+            gen_helper_mtc0_memorymapid(cpu_env, arg);
+            rn = "MemoryMapID";
+            break;
         default:
             goto cp0_unimplemented;
         }
@@ -7727,6 +7740,11 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_tcschefback(cpu_env, arg);
             register_name = "TCScheFBack";
             break;
+        case 5:
+            CP0_CHECK(ctx->mi);
+            gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_MemoryMapID));
+            rn = "MemoryMapID";
+            break;
         default:
             goto cp0_unimplemented;
         }
@@ -8382,6 +8400,11 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_VPControl));
             register_name = "VPControl";
             break;
+        case 5:
+            CP0_CHECK(ctx->mi);
+            gen_helper_mtc0_memorymapid(cpu_env, arg);
+            rn = "MemoryMapID";
+            break;
         default:
             goto cp0_unimplemented;
         }
@@ -27071,6 +27094,27 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
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
+        case 0:
+            /* GINVI */
+            /* Treat as NOP. */
+            break;
+        case 2:
+            /* GINVT */
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
@@ -30003,6 +30047,8 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mrp = (env->CP0_Config5 >> CP0C5_MRP) & 1;
     ctx->nan2008 = (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
     ctx->abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
+    ctx->gi = (env->CP0_Config5 >> CP0C5_GI) & 3;
+    ctx->mi = (env->CP0_Config5 >> CP0C5_MI) & 1;
     restore_cpu_state(env, ctx);
 #ifdef CONFIG_USER_ONLY
         ctx->mem_idx = MIPS_HFLAG_UM;
@@ -30462,8 +30508,8 @@ void cpu_state_reset(CPUMIPSState *env)
     if (env->CP0_Config3 & (1 << CP0C3_CMGCR)) {
         env->CP0_CMGCRBase = 0x1fbf8000 >> 4;
     }
-    env->CP0_EntryHi_ASID_mask = (env->CP0_Config4 & (1 << CP0C4_AE)) ?
-                                 0x3ff : 0xff;
+    env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ? 0x0 :
+                        (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
     env->CP0_Status = (1 << CP0St_BEV) | (1 << CP0St_ERL);
     /*
      * Vectored interrupts not implemented, timer on int 7,
-- 
2.7.4


