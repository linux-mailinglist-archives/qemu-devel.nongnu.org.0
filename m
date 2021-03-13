Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD7339ABE
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:14:53 +0100 (CET)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsrk-00078L-JP
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKse5-0007NT-8K
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:45 -0500
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:34740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdy-0003VA-12
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:45 -0500
Received: by mail-qv1-xf32.google.com with SMTP id g8so5172987qvx.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgTBRUnu7J8koNQdxGgffOswXs7sxkMr5Aqor7q7qKI=;
 b=FNeCTldzy6R/lvOzCInq3R/1Uyu9xflpK/l5NpgSuWacGBsiT/KeMZqan1DBA8GV4d
 m4srRo5RZFx4z5H8EX7ZKGwovvuxnpUf8rR/hUjgnD3u4ksbeIEVr/qmhsVY9vjYBq/p
 zhM2xFh6el37LIhXNkkloD05neFS6D6a2KpMS5vQmmHke1VfhCkun5dTgheRIP5Q/NXN
 yEVIwgmDhxyAQ1obLFIh0k30P1eah1U8uvES3CTMxg9QZjr3KyJyzxxPVpbQEoL1kJCW
 uDmrTH9UGcmhXXiuFjX78cGh20ut0v2kPPInK9wlxJz9QEEVSfvgwHsjp4/6nvDSE00g
 j/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgTBRUnu7J8koNQdxGgffOswXs7sxkMr5Aqor7q7qKI=;
 b=ZM1LfGVObR5fH+d/NFDvEtWEFMIOfUuwUY+hlyhWdZY78/EeRN4SvAmN8E3WWv/Cni
 GbgQsRTp90y59xaOAxYdOjCbRe7Fnmk2PVuGYvxNdhLLP6gDjPZTcAVpQGoYPDbTz6l4
 CdsFAqOH5uBD0H+m2Bl+wcDKwnoUKSepT1MJtw44m/qgrIcwsMmVD+Y+GznxWEiQpG6O
 7KwF5KEgM4Nf9c1UTZAqAgN/CeZ7XoVsp1CChjwcH/V+e9sEpq2qbsMoQtK/alYdsnvE
 sdCRmjogkH0caeMRN9hSUng/LCJnNaH0sqYSoolwSAHwbRJk8hSsOKU1TKwDKZtM9acy
 Y36g==
X-Gm-Message-State: AOAM530TM8YhVonCaXrTHtOkJGIBljwypWGfQ/Y+kqN5zSL3GCs5h43F
 6BfpLGjafMgU0DhGNssnf+MlzV68tSRX53Lj
X-Google-Smtp-Source: ABdhPJwPX3GksbXFm7h/7Bf11Qrvi3wFT01BU1+I9xZuWx92ju44S0Apjc2b3KZaZHTyeAFtciysxw==
X-Received: by 2002:a0c:aece:: with SMTP id n14mr962867qvd.52.1615597237069;
 Fri, 12 Mar 2021 17:00:37 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/15] target/ppc: Remove env->immu_idx and env->dmmu_idx
Date: Fri, 12 Mar 2021 19:00:16 -0600
Message-Id: <20210313010018.819153-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We weren't recording MSR_GS in hflags, which means that BookE
memory accesses were essentially random vs Guest State.

Instead of adding this bit directly, record the completed mmu
indexes instead.  This makes it obvious that we are recording
exactly the information that we need.

This also means that we can stop directly recording MSR_IR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 12 ++++--
 target/ppc/helper_regs.h |  1 -
 target/ppc/helper_regs.c | 88 ++++++++++++++++++++--------------------
 target/ppc/mem_helper.c  |  2 +-
 target/ppc/translate.c   |  6 +--
 5 files changed, 55 insertions(+), 54 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 23ff16c154..2f8d7fa13c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -597,7 +597,6 @@ enum {
     HFLAGS_64 = 2,   /* computed from MSR_CE and MSR_SF */
     HFLAGS_PR = 3,   /* MSR_PR */
     HFLAGS_DR = 4,   /* MSR_DR */
-    HFLAGS_IR = 5,   /* MSR_IR */
     HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
     HFLAGS_TM = 8,   /* computed from MSR_TM */
     HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
@@ -606,6 +605,9 @@ enum {
     HFLAGS_FP = 13,  /* MSR_FP */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
+
+    HFLAGS_IMMU_IDX = 26, /* 26..28 -- the composite immu_idx */
+    HFLAGS_DMMU_IDX = 29, /* 29..31 -- the composite dmmu_idx */
 };
 
 /*****************************************************************************/
@@ -1130,8 +1132,6 @@ struct CPUPPCState {
     /* These resources are used only in TCG */
     uint32_t hflags;
     target_ulong hflags_compat_nmsr; /* for migration compatibility */
-    int immu_idx;     /* precomputed MMU index to speed up insn accesses */
-    int dmmu_idx;     /* precomputed MMU index to speed up data accesses */
 
     /* Power management */
     int (*check_pow)(CPUPPCState *env);
@@ -1367,7 +1367,11 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn, uint32_t val);
 #define MMU_USER_IDX 0
 static inline int cpu_mmu_index(CPUPPCState *env, bool ifetch)
 {
-    return ifetch ? env->immu_idx : env->dmmu_idx;
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
+    return (env->hflags >> (ifetch ? HFLAGS_IMMU_IDX : HFLAGS_DMMU_IDX)) & 7;
+#endif
 }
 
 /* Compatibility modes */
diff --git a/target/ppc/helper_regs.h b/target/ppc/helper_regs.h
index 4148a442b3..42f26870b9 100644
--- a/target/ppc/helper_regs.h
+++ b/target/ppc/helper_regs.h
@@ -21,7 +21,6 @@
 #define HELPER_REGS_H
 
 void hreg_swap_gpr_tgpr(CPUPPCState *env);
-void hreg_compute_mem_idx(CPUPPCState *env);
 void hreg_compute_hflags(CPUPPCState *env);
 void cpu_interrupt_exittb(CPUState *cs);
 int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv);
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index d62921c322..b28037ca24 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -43,49 +43,6 @@ void hreg_swap_gpr_tgpr(CPUPPCState *env)
     env->tgpr[3] = tmp;
 }
 
-void hreg_compute_mem_idx(CPUPPCState *env)
-{
-    /*
-     * This is our encoding for server processors. The architecture
-     * specifies that there is no such thing as userspace with
-     * translation off, however it appears that MacOS does it and some
-     * 32-bit CPUs support it. Weird...
-     *
-     *   0 = Guest User space virtual mode
-     *   1 = Guest Kernel space virtual mode
-     *   2 = Guest User space real mode
-     *   3 = Guest Kernel space real mode
-     *   4 = HV User space virtual mode
-     *   5 = HV Kernel space virtual mode
-     *   6 = HV User space real mode
-     *   7 = HV Kernel space real mode
-     *
-     * For BookE, we need 8 MMU modes as follow:
-     *
-     *  0 = AS 0 HV User space
-     *  1 = AS 0 HV Kernel space
-     *  2 = AS 1 HV User space
-     *  3 = AS 1 HV Kernel space
-     *  4 = AS 0 Guest User space
-     *  5 = AS 0 Guest Kernel space
-     *  6 = AS 1 Guest User space
-     *  7 = AS 1 Guest Kernel space
-     */
-    if (env->mmu_model & POWERPC_MMU_BOOKE) {
-        env->immu_idx = env->dmmu_idx = msr_pr ? 0 : 1;
-        env->immu_idx += msr_is ? 2 : 0;
-        env->dmmu_idx += msr_ds ? 2 : 0;
-        env->immu_idx += msr_gs ? 4 : 0;
-        env->dmmu_idx += msr_gs ? 4 : 0;
-    } else {
-        env->immu_idx = env->dmmu_idx = msr_pr ? 0 : 1;
-        env->immu_idx += msr_ir ? 0 : 2;
-        env->dmmu_idx += msr_dr ? 0 : 2;
-        env->immu_idx += msr_hv ? 4 : 0;
-        env->dmmu_idx += msr_hv ? 4 : 0;
-    }
-}
-
 void hreg_compute_hflags(CPUPPCState *env)
 {
     target_ulong msr = env->msr;
@@ -95,7 +52,7 @@ void hreg_compute_hflags(CPUPPCState *env)
 
     /* Some bits come straight across from MSR. */
     msr_mask = ((1 << MSR_LE) | (1 << MSR_PR) |
-                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
+                (1 << MSR_DR) | (1 << MSR_FP));
 
     if (ppc_flags & POWERPC_FLAG_HID0_LE) {
         /*
@@ -146,10 +103,51 @@ void hreg_compute_hflags(CPUPPCState *env)
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
         hflags |= 1 << HFLAGS_HV;
     }
+
+    /*
+     * This is our encoding for server processors. The architecture
+     * specifies that there is no such thing as userspace with
+     * translation off, however it appears that MacOS does it and some
+     * 32-bit CPUs support it. Weird...
+     *
+     *   0 = Guest User space virtual mode
+     *   1 = Guest Kernel space virtual mode
+     *   2 = Guest User space real mode
+     *   3 = Guest Kernel space real mode
+     *   4 = HV User space virtual mode
+     *   5 = HV Kernel space virtual mode
+     *   6 = HV User space real mode
+     *   7 = HV Kernel space real mode
+     *
+     * For BookE, we need 8 MMU modes as follow:
+     *
+     *  0 = AS 0 HV User space
+     *  1 = AS 0 HV Kernel space
+     *  2 = AS 1 HV User space
+     *  3 = AS 1 HV Kernel space
+     *  4 = AS 0 Guest User space
+     *  5 = AS 0 Guest Kernel space
+     *  6 = AS 1 Guest User space
+     *  7 = AS 1 Guest Kernel space
+     */
+    unsigned immu_idx, dmmu_idx;
+    dmmu_idx = msr & (1 << MSR_PR) ? 0 : 1;
+    if (env->mmu_model & POWERPC_MMU_BOOKE) {
+        dmmu_idx |= msr & (1 << MSR_GS) ? 4 : 0;
+        immu_idx = dmmu_idx;
+        immu_idx |= msr & (1 << MSR_IS) ? 2 : 0;
+        dmmu_idx |= msr & (1 << MSR_DS) ? 2 : 0;
+    } else {
+        dmmu_idx |= msr & (1ull << MSR_HV) ? 4 : 0;
+        immu_idx = dmmu_idx;
+        immu_idx |= msr & (1 << MSR_IR) ? 0 : 2;
+        dmmu_idx |= msr & (1 << MSR_DR) ? 0 : 2;
+    }
+    hflags |= immu_idx << HFLAGS_IMMU_IDX;
+    hflags |= dmmu_idx << HFLAGS_DMMU_IDX;
 #endif
 
     env->hflags = hflags | (msr & msr_mask);
-    hreg_compute_mem_idx(env);
 }
 
 void cpu_interrupt_exittb(CPUState *cs)
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index f4f7e730de..444b2a30ef 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -278,7 +278,7 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
     target_ulong mask, dcbz_size = env->dcache_line_size;
     uint32_t i;
     void *haddr;
-    int mmu_idx = epid ? PPC_TLB_EPID_STORE : env->dmmu_idx;
+    int mmu_idx = epid ? PPC_TLB_EPID_STORE : cpu_mmu_index(env, false);
 
 #if defined(TARGET_PPC64)
     /* Check for dcbz vs dcbzl on 970 */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5e629291d3..a53463b9b8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7658,8 +7658,8 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  cs->cpu_index);
     qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
                  "%08x iidx %d didx %d\n",
-                 env->msr, env->spr[SPR_HID0],
-                 env->hflags, env->immu_idx, env->dmmu_idx);
+                 env->msr, env->spr[SPR_HID0], env->hflags,
+                 cpu_mmu_index(env, true), cpu_mmu_index(env, false));
 #if !defined(NO_TIMER_DUMP)
     qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
 #if !defined(CONFIG_USER_ONLY)
@@ -7885,7 +7885,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->exception = POWERPC_EXCP_NONE;
     ctx->spr_cb = env->spr_cb;
     ctx->pr = (hflags >> HFLAGS_PR) & 1;
-    ctx->mem_idx = env->dmmu_idx;
+    ctx->mem_idx = (hflags >> HFLAGS_DMMU_IDX) & 7;
     ctx->dr = (hflags >> HFLAGS_DR) & 1;
     ctx->hv = (hflags >> HFLAGS_HV) & 1;
     ctx->insns_flags = env->insns_flags;
-- 
2.25.1


