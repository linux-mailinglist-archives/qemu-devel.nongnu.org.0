Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8FF301957
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 04:26:34 +0100 (CET)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3W2r-0000N2-6p
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 22:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3W0s-0008Ej-3h
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 22:24:30 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3W0p-0004XB-IY
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 22:24:29 -0500
Received: by mail-pj1-x102b.google.com with SMTP id b5so6406260pjl.0
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 19:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vvnud4lf10RK9HFVG2rIjTTkol6SNyfz9JsDLoAYqd8=;
 b=DXmj1tbMp4+nUc50VNK8HPoTl3Q/5OrwqaoJXPqt8FAdMouJnAR0E1LpfQtp5PfVVt
 AoUZHI25YtOV2m5pSIim+k1SQcEL+dSt3VXcP5sDIrPXqlrCEprtB/rm6P9iOIKetOgl
 LPkpNB7mku4FehVfrTh78hc7cb8j7ohwszJlIBGPEdWUK+uyw9jfLT9FxQg5is8XtU2C
 JgyNOGBdAoMahdga4qQuwtWqQ1qJBetbGUQ1KutT9/x+SUHc2PLWaHY0I0vh7madOLZ/
 00yZpGpBdCT1mNCZ/M1mvo8L4pwYur90dfrnWCcwNKOk/5BPKYFO3C5g16vaYt9pWT58
 4zPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vvnud4lf10RK9HFVG2rIjTTkol6SNyfz9JsDLoAYqd8=;
 b=j4Y2fwDwt5YNQ97rg/zLYO0JwMk6y0O79Tz7M6sMgOT/3NimTcd51Qf0Oh8acWgvyX
 nIeOBr3gAWLI+m3rRN5j9zyVfoBjmlnt9wfZ868J5pjwbCakMGFNuWQGgkcZAhB4Q2Nu
 lfwPWa650qDhewQt5Axho9dAQlNz9KvgdB+5cjHmCgAs1ybJvRmeUcQ0fqZq0kKTEpif
 u7q5b6wR3o5aTcy0GbKfNYGBsA0xWyhY1UORNp6wtybpHzkQ5F0z1CaxV/yTBiuKrNl/
 R2lN6NOU5O2MZr7W2/qJ5p4WbwHbF17NBHaZqE78ot4Bcg4c97ZNDcvX/2nuwhSrAKjJ
 Vb4w==
X-Gm-Message-State: AOAM533Ba4Id1bdBJkShQSqAk5A2wMAbm/ADqYr1JXNCOHAMa7EZ776E
 Tuj+TCadzANaqy8b/qaltzli9ASYNs8KHg==
X-Google-Smtp-Source: ABdhPJyN44WPANkPXUyGgmmiRRspGLo9tOpPMixxqNvtIXAfPfkk7JTH/kRaRELS+HEYHwlLNpi49A==
X-Received: by 2002:a17:903:1c2:b029:de:ad0a:2dbf with SMTP id
 e2-20020a17090301c2b02900dead0a2dbfmr2571167plh.44.1611458666152; 
 Sat, 23 Jan 2021 19:24:26 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id v19sm14112872pjg.50.2021.01.23.19.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 19:24:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Fix truncation of env->hflags
Date: Sat, 23 Jan 2021 17:24:22 -1000
Message-Id: <20210124032422.2113565-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the cs_base field, because it happens to be the same
size as hflags (and MSR, from which hflags is derived).

In translate, extract most bits from a local hflags variable.
Mark several cases where code generation is *not* derived from
data stored within the hashed elements of the TranslationBlock.

Cc: David Gibson <david@gibson.dropbear.id.au>
Reported-by: Ivan Warren <ivan@vmfacility.fr>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h       |  4 +--
 target/ppc/translate.c | 64 ++++++++++++++++--------------------------
 2 files changed, 26 insertions(+), 42 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2609e4082e..4a05e4e544 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2396,8 +2396,8 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
     *pc = env->nip;
-    *cs_base = 0;
-    *flags = env->hflags;
+    *cs_base = env->hflags;
+    *flags = 0;
 }
 
 void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t exception);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0984ce637b..1eb2e1b0c6 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7879,47 +7879,37 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUPPCState *env = cs->env_ptr;
+    target_ulong hflags = ctx->base.tb->cs_base;
     int bound;
 
     ctx->exception = POWERPC_EXCP_NONE;
     ctx->spr_cb = env->spr_cb;
-    ctx->pr = msr_pr;
+    ctx->pr = (hflags >> MSR_PR) & 1;
     ctx->mem_idx = env->dmmu_idx;
-    ctx->dr = msr_dr;
-#if !defined(CONFIG_USER_ONLY)
-    ctx->hv = msr_hv || !env->has_hv_mode;
+    ctx->dr = (hflags >> MSR_DR) & 1;
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+    ctx->hv = (hflags >> MSR_HV) & 1;
 #endif
     ctx->insns_flags = env->insns_flags;
     ctx->insns_flags2 = env->insns_flags2;
     ctx->access_type = -1;
     ctx->need_access_type = !mmu_is_64bit(env->mmu_model);
-    ctx->le_mode = !!(env->hflags & (1 << MSR_LE));
+    ctx->le_mode = (hflags >> MSR_LE) & 1;
     ctx->default_tcg_memop_mask = ctx->le_mode ? MO_LE : MO_BE;
     ctx->flags = env->flags;
 #if defined(TARGET_PPC64)
-    ctx->sf_mode = msr_is_64bit(env, env->msr);
+    ctx->sf_mode = (hflags >> MSR_SF) & 1;
     ctx->has_cfar = !!(env->flags & POWERPC_FLAG_CFAR);
 #endif
     ctx->lazy_tlb_flush = env->mmu_model == POWERPC_MMU_32B
         || env->mmu_model == POWERPC_MMU_601
         || env->mmu_model & POWERPC_MMU_64;
 
-    ctx->fpu_enabled = !!msr_fp;
-    if ((env->flags & POWERPC_FLAG_SPE) && msr_spe) {
-        ctx->spe_enabled = !!msr_spe;
-    } else {
-        ctx->spe_enabled = false;
-    }
-    if ((env->flags & POWERPC_FLAG_VRE) && msr_vr) {
-        ctx->altivec_enabled = !!msr_vr;
-    } else {
-        ctx->altivec_enabled = false;
-    }
-    if ((env->flags & POWERPC_FLAG_VSX) && msr_vsx) {
-        ctx->vsx_enabled = !!msr_vsx;
-    } else {
-        ctx->vsx_enabled = false;
-    }
+    ctx->fpu_enabled = (hflags >> MSR_FP) & 1;
+    ctx->spe_enabled = (hflags >> MSR_SPE) & 1;
+    ctx->altivec_enabled = (hflags >> MSR_VR) & 1;
+    ctx->vsx_enabled = (hflags >> MSR_VSX) & 1;
+    /* FIXME: This needs to be stored in env->hflags_nmsr. */
     if ((env->flags & POWERPC_FLAG_SCV)
         && (env->spr[SPR_FSCR] & (1ull << FSCR_SCV))) {
         ctx->scv_enabled = true;
@@ -7927,23 +7917,21 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         ctx->scv_enabled = false;
     }
 #if defined(TARGET_PPC64)
-    if ((env->flags & POWERPC_FLAG_TM) && msr_tm) {
-        ctx->tm_enabled = !!msr_tm;
-    } else {
-        ctx->tm_enabled = false;
-    }
+    ctx->tm_enabled = (hflags >> MSR_TM) & 1;
 #endif
+    /* FIXME: This needs to be stored in env->hflags_nmsr. */
     ctx->gtse = !!(env->spr[SPR_LPCR] & LPCR_GTSE);
-    if ((env->flags & POWERPC_FLAG_SE) && msr_se) {
-        ctx->singlestep_enabled = CPU_SINGLE_STEP;
-    } else {
-        ctx->singlestep_enabled = 0;
-    }
-    if ((env->flags & POWERPC_FLAG_BE) && msr_be) {
-        ctx->singlestep_enabled |= CPU_BRANCH_STEP;
-    }
-    if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
+
+    ctx->singlestep_enabled = ((hflags >> MSR_SE) & 1 ? CPU_SINGLE_STEP : 0)
+                            | ((hflags >> MSR_BE) & 1 ? CPU_BRANCH_STEP : 0);
+
+    if ((hflags >> MSR_DE) & 1) {
         ctx->singlestep_enabled = 0;
+        /*
+         * FIXME: This needs to be stored in env->hflags_nmsr,
+         * probably overlapping MSR_SE/MSR_BE like we do for
+         * MSR_LE and the ppc 601.
+         */
         target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
         if (dbcr0 & DBCR0_ICMP) {
             ctx->singlestep_enabled |= CPU_SINGLE_STEP;
@@ -7956,10 +7944,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     if (unlikely(ctx->base.singlestep_enabled)) {
         ctx->singlestep_enabled |= GDBSTUB_SINGLE_STEP;
     }
-#if defined(DO_SINGLE_STEP) && 0
-    /* Single step trace mode */
-    msr_se = 1;
-#endif
 
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
-- 
2.25.1


