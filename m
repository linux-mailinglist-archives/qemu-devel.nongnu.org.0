Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BEC55A16D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 21:21:42 +0200 (CEST)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4os9-0003wG-3a
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 15:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4omW-00012T-14; Fri, 24 Jun 2022 15:15:52 -0400
Received: from [187.72.171.209] (port=12258 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4omU-0001e7-2w; Fri, 24 Jun 2022 15:15:51 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 24 Jun 2022 16:14:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BE9C380003F;
 Fri, 24 Jun 2022 16:14:36 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH RESEND v2 2/2] target/ppc: Implement ISA 3.00 tlbie[l]
Date: Fri, 24 Jun 2022 16:14:24 -0300
Message-Id: <20220624191424.190471-3-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624191424.190471-1-leandro.lupori@eldorado.org.br>
References: <20220624191424.190471-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 24 Jun 2022 19:14:37.0191 (UTC)
 FILETIME=[A5493170:01D887FE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This initial version supports the invalidation of one or all
TLB entries. Flush by PID/LPID, or based in process/partition
scope is not supported, because it would make using the
generic QEMU TLB implementation hard. In these cases, all
entries are flushed.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/helper.h                          |  18 +++
 target/ppc/mmu_helper.c                      | 154 +++++++++++++++++++
 target/ppc/translate/storage-ctrl-impl.c.inc |  15 ++
 3 files changed, 187 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d627cfe6ed..5e663a0a50 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -672,6 +672,24 @@ DEF_HELPER_FLAGS_1(tlbia, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(tlbie, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
 #if defined(TARGET_PPC64)
+
+/*
+ * tlbie[l] helper flags
+ *
+ * RIC, PRS, R and local are passed as flags in the last argument.
+ */
+#define TLBIE_F_RIC_SHIFT       0
+#define TLBIE_F_PRS_SHIFT       2
+#define TLBIE_F_R_SHIFT         3
+#define TLBIE_F_LOCAL_SHIFT     4
+
+#define TLBIE_F_RIC_MASK        (3 << TLBIE_F_RIC_SHIFT)
+#define TLBIE_F_PRS             (1 << TLBIE_F_PRS_SHIFT)
+#define TLBIE_F_R               (1 << TLBIE_F_R_SHIFT)
+#define TLBIE_F_LOCAL           (1 << TLBIE_F_LOCAL_SHIFT)
+
+DEF_HELPER_FLAGS_4(tlbie_isa300, TCG_CALL_NO_WG, void, \
+        env, tl, tl, i32)
 DEF_HELPER_FLAGS_3(store_slb, TCG_CALL_NO_RWG, void, env, tl, tl)
 DEF_HELPER_2(load_slb_esid, tl, env, tl)
 DEF_HELPER_2(load_slb_vsid, tl, env, tl)
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 15239dc95b..b881aee23f 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -429,6 +429,160 @@ void helper_tlbie(CPUPPCState *env, target_ulong addr)
     ppc_tlb_invalidate_one(env, addr);
 }
 
+#if defined(TARGET_PPC64)
+
+/* Invalidation Selector */
+#define TLBIE_IS_VA         0
+#define TLBIE_IS_PID        1
+#define TLBIE_IS_LPID       2
+#define TLBIE_IS_ALL        3
+
+/* Radix Invalidation Control */
+#define TLBIE_RIC_TLB       0
+#define TLBIE_RIC_PWC       1
+#define TLBIE_RIC_ALL       2
+#define TLBIE_RIC_GRP       3
+
+/* Radix Actual Page sizes */
+#define TLBIE_R_AP_4K       0
+#define TLBIE_R_AP_64K      5
+#define TLBIE_R_AP_2M       1
+#define TLBIE_R_AP_1G       2
+
+/* RB field masks */
+#define TLBIE_RB_EPN_MASK   PPC_BITMASK(0, 51)
+#define TLBIE_RB_IS_MASK    PPC_BITMASK(52, 53)
+#define TLBIE_RB_AP_MASK    PPC_BITMASK(56, 58)
+
+void helper_tlbie_isa300(CPUPPCState *env, target_ulong rb, target_ulong rs,
+                         uint32_t flags)
+{
+    unsigned ric = (flags & TLBIE_F_RIC_MASK) >> TLBIE_F_RIC_SHIFT;
+    /*
+     * With the exception of the checks for invalid instruction forms,
+     * PRS is currently ignored, because we don't know if a given TLB entry
+     * is process or partition scoped.
+     */
+    bool prs = flags & TLBIE_F_PRS;
+    bool r = flags & TLBIE_F_R;
+    bool local = flags & TLBIE_F_LOCAL;
+    bool effR;
+    unsigned is = extract64(rb, PPC_BIT_NR(53), 2), set;
+    unsigned ap;        /* actual page size */
+    target_ulong addr, pgoffs_mask;
+
+    qemu_log_mask(CPU_LOG_MMU,
+        "%s: local=%d addr=" TARGET_FMT_lx " ric=%u prs=%d r=%d is=%u\n",
+        __func__, local, rb & TARGET_PAGE_MASK, ric, prs, r, is);
+
+    effR = FIELD_EX64(env->msr, MSR, HV) ? r : env->spr[SPR_LPCR] & LPCR_HR;
+
+    /* Partial TLB invalidation is supported for Radix only for now. */
+    if (!effR) {
+        goto inval_all;
+    }
+
+    /* Check for invalid instruction forms (effR=1). */
+    if (unlikely(ric == TLBIE_RIC_GRP ||
+                 ((ric == TLBIE_RIC_PWC || ric == TLBIE_RIC_ALL) &&
+                                           is == TLBIE_IS_VA) ||
+                 (!prs && is == TLBIE_IS_PID))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid instruction form: ric=%u prs=%d r=%d is=%u\n",
+            __func__, ric, prs, r, is);
+        goto invalid;
+    }
+
+    /* We don't cache Page Walks. */
+    if (ric == TLBIE_RIC_PWC) {
+        if (local) {
+            set = extract64(rb, PPC_BIT_NR(51), 12);
+            if (set != 0) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid set: %d\n",
+                              __func__, set);
+                goto invalid;
+            }
+        }
+        return;
+    }
+
+    /*
+     * Invalidation by LPID or PID is not supported, so fallback
+     * to full TLB flush in these cases.
+     */
+    if (is != TLBIE_IS_VA) {
+        goto inval_all;
+    }
+
+    /*
+     * The results of an attempt to invalidate a translation outside of
+     * quadrant 0 for Radix Tree translation (effR=1, RIC=0, PRS=1, IS=0,
+     * and EA 0:1 != 0b00) are boundedly undefined.
+     */
+    if (unlikely(ric == TLBIE_RIC_TLB && prs && is == TLBIE_IS_VA &&
+                 (rb & R_EADDR_QUADRANT) != R_EADDR_QUADRANT0)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: attempt to invalidate a translation outside of quadrant 0\n",
+            __func__);
+        goto inval_all;
+    }
+
+    assert(is == TLBIE_IS_VA);
+    assert(ric == TLBIE_RIC_TLB || ric == TLBIE_RIC_ALL);
+
+    ap = extract64(rb, PPC_BIT_NR(58), 3);
+    switch (ap) {
+    case TLBIE_R_AP_4K:
+        pgoffs_mask = 0xfffull;
+        break;
+
+    case TLBIE_R_AP_64K:
+        pgoffs_mask = 0xffffull;
+        break;
+
+    case TLBIE_R_AP_2M:
+        pgoffs_mask = 0x1fffffull;
+        break;
+
+    case TLBIE_R_AP_1G:
+        pgoffs_mask = 0x3fffffffull;
+        break;
+
+    default:
+        /*
+         * If the value specified in RS 0:31, RS 32:63, RB 54:55, RB 56:58,
+         * RB 44:51, or RB 56:63, when it is needed to perform the specified
+         * operation, is not supported by the implementation, the instruction
+         * is treated as if the instruction form were invalid.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid AP: %d\n", __func__, ap);
+        goto invalid;
+    }
+
+    addr = rb & TLBIE_RB_EPN_MASK & ~pgoffs_mask;
+
+    if (local) {
+        tlb_flush_page(env_cpu(env), addr);
+    } else {
+        tlb_flush_page_all_cpus(env_cpu(env), addr);
+    }
+    return;
+
+inval_all:
+    env->tlb_need_flush |= TLB_NEED_LOCAL_FLUSH;
+    if (!local) {
+        env->tlb_need_flush |= TLB_NEED_GLOBAL_FLUSH;
+    }
+    return;
+
+invalid:
+    raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
+                           POWERPC_EXCP_INVAL |
+                           POWERPC_EXCP_INVAL_INVAL, GETPC());
+}
+
+#endif
+
 void helper_tlbiva(CPUPPCState *env, target_ulong addr)
 {
     /* tlbiva instruction only exists on BookE */
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 7793297dd4..f9e4a807f2 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -65,6 +65,21 @@ static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
         tcg_gen_ext32u_tl(t0, cpu_gpr[rb]);
         gen_helper_tlbie(cpu_env, t0);
         tcg_temp_free(t0);
+
+#if defined(TARGET_PPC64)
+    /*
+     * ISA 3.1B says that MSR SF must be 1 when this instruction is executed;
+     * otherwise the results are undefined.
+     */
+    } else if (a->r) {
+        gen_helper_tlbie_isa300(cpu_env, cpu_gpr[rb], cpu_gpr[a->rs],
+                tcg_constant_i32(a->ric << TLBIE_F_RIC_SHIFT |
+                                 a->prs << TLBIE_F_PRS_SHIFT |
+                                 a->r << TLBIE_F_R_SHIFT |
+                                 local << TLBIE_F_LOCAL_SHIFT));
+        return true;
+#endif
+
     } else {
         gen_helper_tlbie(cpu_env, cpu_gpr[rb]);
     }
-- 
2.25.1


