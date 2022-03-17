Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5874DBE88
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:37:18 +0100 (CET)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUip3-0002eW-P1
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:37:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO3-0005h1-PI
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:23 -0400
Received: from [2607:f8b0:4864:20::62b] (port=43750
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO1-0002e1-Se
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:23 -0400
Received: by mail-pl1-x62b.google.com with SMTP id w8so3543716pll.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmEvw6sHv9r/CRo1vY+We54ynBSJSjNDjmxvHPXOPAE=;
 b=jQC59tjg2QxqY4uaTjL6+UlDkH8h/KT6rp48pdaqZE2SCZMvnxppkr5kLK5IyGfoij
 xyfwOdKDet/WFmRNvZQnN8Cl7MDNmtyuj2QzOvohLLQULUBnbJRGdDkgwTiIq+Ace79n
 L+EhRJ/wHpUvrIpYWVb7pYSs/jpbfavQoMeg71k8rje5tkeh3wx6wM3F5j7AZymehTDE
 SjPP8+UdW0uO4TXjlfrP4QlRN4MX3LEHUisYuS5I7rVUQUAgMFqGiPv8wLnejBL7wdef
 9IPbVi5LIX06R2kZNQRA+fjOD7XdioA/5Ey7BgGFf4mwLWzvSpEMx3PQVBrwoePu4wvJ
 rFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmEvw6sHv9r/CRo1vY+We54ynBSJSjNDjmxvHPXOPAE=;
 b=XLoRS+OQJbMvcD9qotzXD+GZpEITjmLQfAPV6pvtM9em4YmSh/5jnO0jYPC5HKo8o4
 nh1v/gZ3dpWjPuYHMvMyIBSJUqpJT8Kctxv7N51/E/zu0p8LHGAnKLqfUhmjnq+QHuvc
 mAZQBA4mqHWKFINHVbmEXSLxVJUzGmOfUxwwYU7Qiv/tvVH9p95Ir+OKhENEQKU1vWH2
 oabugpF7fOblYd4JIRKFjIukdkaV8jg7toIL2DiGB67nARnManGIDMh0+DrlRTqySq5p
 3Y0oMLeHu1OkEvbE8ANgzpK+9gjxLAF1nzKQpTZ36GwFrJ0OJ0p3MP5FmYd5/wH4l6Zq
 WFJg==
X-Gm-Message-State: AOAM5301HqkFyKeISvENelM3s6iUTYCjMB1gKl8y6ji8ZccbNLsyX4LY
 hY512GLnorwa6GIRpBVzxCzrvci6bwNHqw==
X-Google-Smtp-Source: ABdhPJyTLVEicUXHRBrgbyOvdoFVpBQnJry8ADdtOfJUW/1YFmZJakdLKToEiknPUmV5P6VKlLGONQ==
X-Received: by 2002:a17:903:3014:b0:153:a200:fb5 with SMTP id
 o20-20020a170903301400b00153a2000fb5mr2797190pla.25.1647493759773; 
 Wed, 16 Mar 2022 22:09:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 41/51] target/nios2: Introduce shadow register sets
Date: Wed, 16 Mar 2022 22:05:28 -0700
Message-Id: <20220317050538.924111-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not actually enable them so far, but add all of the
plumbing to address them.  Do not enable them for user-only.

Add an env->regs pointer that handles the indirection to
the current register set.  The naming of the pointer hides
the difference between old and new, user-only and sysemu.

From the notes on wrprs, which states that r0 must be initialized
before use in shadow register sets, infer that R_ZERO is *not*
hardwired to zero in shadow register sets.  Adjust load_gpr and
dest_gpr to reflect this.  At the same time we might as well
special case crs == 0 to avoid the indirection through env->regs
during translation as well.  Given that this is intended to be
the most common case for non-interrupt handlers.

Init env->regs at reset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       | 24 +++++++++++++++++
 target/nios2/cpu.c       |  4 ++-
 target/nios2/translate.c | 58 +++++++++++++++++++++++++++++++---------
 3 files changed, 72 insertions(+), 14 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index d5255e9e76..e32bebe9b7 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -60,6 +60,11 @@ struct Nios2CPUClass {
 #define NUM_GP_REGS 32
 #define NUM_CR_REGS 32
 
+#ifndef CONFIG_USER_ONLY
+/* 63 shadow register sets; index 0 is the primary register set. */
+#define NUM_REG_SETS 64
+#endif
+
 /* General purpose register aliases */
 enum {
     R_ZERO   = 0,
@@ -178,7 +183,13 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_MPUD     17
 
 struct CPUArchState {
+#ifdef CONFIG_USER_ONLY
     uint32_t regs[NUM_GP_REGS];
+#else
+    uint32_t shadow_regs[NUM_REG_SETS][NUM_GP_REGS];
+    /* Pointer into shadow_regs for the current register set. */
+    uint32_t *regs;
+#endif
     uint32_t ctrl[NUM_CR_REGS];
     uint32_t pc;
 
@@ -229,6 +240,14 @@ static inline bool nios2_cr_reserved(const ControlRegState *s)
     return (s->writable | s->readonly) == 0;
 }
 
+static inline void nios2_update_crs(CPUNios2State *env)
+{
+#ifndef CONFIG_USER_ONLY
+    unsigned crs = FIELD_EX32(env->ctrl[CR_STATUS], CR_STATUS, CRS);
+    env->regs = env->shadow_regs[crs];
+#endif
+}
+
 void nios2_tcg_init(void);
 void nios2_cpu_do_interrupt(CPUState *cs);
 void dump_mmu(CPUNios2State *env);
@@ -271,12 +290,17 @@ typedef Nios2CPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
+FIELD(TBFLAGS, CRS0, 0, 1)  /* Set if CRS == 0. */
+FIELD(TBFLAGS, U, 1, 1)     /* Overlaps CR_STATUS_U */
+
 static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
     *pc = env->pc;
     *cs_base = 0;
     *flags = env->ctrl[CR_STATUS] & CR_STATUS_U;
+    *flags |= (env->ctrl[CR_STATUS] & R_CR_STATUS_CRS_MASK
+               ? 0 : R_TBFLAGS_CRS0_MASK);
 }
 
 #endif /* NIOS2_CPU_H */
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 07306efc35..7545abc68e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -53,15 +53,17 @@ static void nios2_cpu_reset(DeviceState *dev)
 
     ncc->parent_reset(dev);
 
-    memset(env->regs, 0, sizeof(env->regs));
     memset(env->ctrl, 0, sizeof(env->ctrl));
     env->pc = cpu->reset_addr;
 
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
     env->ctrl[CR_STATUS] = CR_STATUS_RSIE | CR_STATUS_U | CR_STATUS_PIE;
+    memset(env->regs, 0, sizeof(env->regs));
 #else
     env->ctrl[CR_STATUS] = CR_STATUS_RSIE;
+    nios2_update_crs(env);
+    memset(env->shadow_regs, 0, sizeof(env->shadow_regs));
 #endif
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 1e784c8a37..525df7b023 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -100,12 +100,16 @@ typedef struct DisasContext {
     DisasContextBase  base;
     target_ulong      pc;
     int               mem_idx;
+    bool              crs0;
     TCGv              sink;
     const ControlRegState *cr_state;
 } DisasContext;
 
 static TCGv cpu_R[NUM_GP_REGS];
 static TCGv cpu_pc;
+#ifndef CONFIG_USER_ONLY
+static TCGv cpu_crs_R[NUM_GP_REGS];
+#endif
 
 typedef struct Nios2Instruction {
     void     (*handler)(DisasContext *dc, uint32_t code, uint32_t flags);
@@ -127,22 +131,36 @@ static uint8_t get_opxcode(uint32_t code)
 static TCGv load_gpr(DisasContext *dc, unsigned reg)
 {
     assert(reg < NUM_GP_REGS);
-    if (unlikely(reg == R_ZERO)) {
-        return tcg_constant_tl(0);
+    if (dc->crs0) {
+        if (unlikely(reg == R_ZERO)) {
+            return tcg_constant_tl(0);
+        }
+        return cpu_R[reg];
     }
-    return cpu_R[reg];
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    return cpu_crs_R[reg];
+#endif
 }
 
 static TCGv dest_gpr(DisasContext *dc, unsigned reg)
 {
     assert(reg < NUM_GP_REGS);
-    if (unlikely(reg == R_ZERO)) {
-        if (dc->sink == NULL) {
-            dc->sink = tcg_temp_new();
+    if (dc->crs0) {
+        if (unlikely(reg == R_ZERO)) {
+            if (dc->sink == NULL) {
+                dc->sink = tcg_temp_new();
+            }
+            return dc->sink;
         }
-        return dc->sink;
+        return cpu_R[reg];
     }
-    return cpu_R[reg];
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    return cpu_crs_R[reg];
+#endif
 }
 
 static void t_gen_helper_raise_exception(DisasContext *dc,
@@ -198,7 +216,7 @@ static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static bool gen_check_supervisor(DisasContext *dc)
 {
-    if (dc->base.tb->flags & CR_STATUS_U) {
+    if (dc->base.tb->flags & R_TBFLAGS_U_MASK) {
         /* CPU in user mode, privileged instruction called, stop. */
         t_gen_helper_raise_exception(dc, EXCP_SUPERI);
         return false;
@@ -794,6 +812,7 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->mem_idx = cpu_mmu_index(env, false);
     dc->cr_state = cpu->cr_state;
+    dc->crs0 = FIELD_EX32(dc->base.tb->flags, TBFLAGS, CRS0);
 
     /* Bound the number of insns to execute to those left on the page.  */
     page_insns = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
@@ -927,13 +946,26 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 void nios2_tcg_init(void)
 {
-    int i;
+#ifndef CONFIG_USER_ONLY
+    TCGv_ptr crs = tcg_global_mem_new_ptr(cpu_env,
+                                          offsetof(CPUNios2State, regs), "crs");
 
-    for (i = 0; i < NUM_GP_REGS; i++) {
-        cpu_R[i] = tcg_global_mem_new(cpu_env,
-                                      offsetof(CPUNios2State, regs[i]),
+    for (int i = 0; i < NUM_GP_REGS; i++) {
+        cpu_crs_R[i] = tcg_global_mem_new(crs, 4 * i, gr_regnames[i]);
+    }
+
+#define offsetof_regs0(N)  offsetof(CPUNios2State, shadow_regs[0][N])
+#else
+#define offsetof_regs0(N)  offsetof(CPUNios2State, regs[N])
+#endif
+
+    for (int i = 0; i < NUM_GP_REGS; i++) {
+        cpu_R[i] = tcg_global_mem_new(cpu_env, offsetof_regs0(i),
                                       gr_regnames[i]);
     }
+
+#undef offsetof_regs0
+
     cpu_pc = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUNios2State, pc), "pc");
 }
-- 
2.25.1


