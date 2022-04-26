Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E25108CD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:17:13 +0200 (CEST)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQgS-0004C9-J6
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq4-0001sD-IN
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq2-0005V0-My
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so3275232pji.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WyhHAN4kOdv5SP0UNYKZ/8CoTfSLfS0tLNbV671G8UI=;
 b=YwOMQoQnHGljzXhFZfPtKbCkJ8FJBDmaf07NbGUd6cP1xTibHqeP1Dw13FCkLnBqhY
 LCJX4IqKh6BL+eyh2yLdWRHNLFyelp7UW6nFtswI2pT4sgxS8z3Dq1P8K36HEVSIhNtw
 PhmL07AwY8xdEItJFg4soDVHvZGR5vrIwTAHDUwO8c8MPJWQNcTHUfuMzQCFjVIL3vyR
 LZoEY1vQB4yU+7HOqxTr4WjrFpIfjJ8pqJl2Qqcbd++GSIQ3/pbnWbZgVEZ4B1S7AkS6
 eAFH1MKBMCWhQU+FlGnSwdgo0tJ8SE/dbBrBSygYABVhAM0cQ9EyrekBwrU3njMqqIgh
 xIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WyhHAN4kOdv5SP0UNYKZ/8CoTfSLfS0tLNbV671G8UI=;
 b=RZWb4qvZsBfqxg//o/CNHK11e3xzUtTSgpJJooYyXZRupeQNPG1KneYQz7NkWX9YoS
 r8nay0KGdxTruVs/c4GtM4PRM1J1WCWxM56ukuRpQ93WRi9JMLcipiYRKwTw13RuInbU
 0fmHu4EGQ5EopGKl3sefFl96/O/mPd0p0X4p9hxUXVVzr1XEvzKyBjMi6LMou3us17qU
 RfaS8SIx9uXCL6ZGMEF/hvwy5WEdqs4PfkEQ1M2r3ro73jOKWeS0LnLwo1Cvx0Kg4ihU
 tmncNJvo9L2ASAb+ucnD9xH/xfWkPz+oH+3rj5H2tgT9/9ZdZ7upYS59CXpjBiUPdTxT
 Sz0Q==
X-Gm-Message-State: AOAM5310DR/B1ePtiC6Mc3hbdHbvAiYlgKi5iwGycdq4sJ3FuxRJyBwo
 arNUhfNyeoCWGXsEs7/htdDPmZzfqvWiVA==
X-Google-Smtp-Source: ABdhPJxp/hEFdTIvjFR5D1YvFX8xz3GDotrcrEzwHtknMVbjJT3t0OIeqell4tqaFCL2s5ke0oII8w==
X-Received: by 2002:a17:902:8608:b0:158:c532:d8b2 with SMTP id
 f8-20020a170902860800b00158c532d8b2mr24668327plo.46.1650997380700; 
 Tue, 26 Apr 2022 11:23:00 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:23:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 57/68] target/nios2: Introduce shadow register sets
Date: Tue, 26 Apr 2022 11:18:56 -0700
Message-Id: <20220426181907.103691-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not actually enable them so far, in terms of being able
to change the current register set, but add all of the
plumbing to address them.  Do not enable them for user-only.

Add an env->regs pointer that handles the indirection to
the current register set.  The naming of the pointer hides
the difference between old and new, user-only and sysemu.

From the notes on wrprs, which states that r0 must be initialized
before use in shadow register sets, infer that R_ZERO is *not*
hardwired to zero in shadow register sets, but that it is still
read-only.  Introduce tbflags bit R0_0 to track that it has been
properly set to zero.  Adjust load_gpr to reflect this.

At the same time we might as well special case crs == 0 to avoid
the indirection through env->regs during translation as well; this
is intended to be the most common case for non-interrupt handlers.

Init env->regs at reset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-54-richard.henderson@linaro.org>
---
 target/nios2/cpu.h       | 29 ++++++++++++++++++-
 target/nios2/cpu.c       |  4 ++-
 target/nios2/translate.c | 61 ++++++++++++++++++++++++++++++++++------
 3 files changed, 83 insertions(+), 11 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 477a661f17..f6efaa79b3 100644
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
@@ -267,12 +286,20 @@ typedef Nios2CPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
+FIELD(TBFLAGS, CRS0, 0, 1)  /* Set if CRS == 0. */
+FIELD(TBFLAGS, U, 1, 1)     /* Overlaps CR_STATUS_U */
+FIELD(TBFLAGS, R0_0, 2, 1)  /* Set if R0 == 0. */
+
 static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
+    unsigned crs = FIELD_EX32(env->ctrl[CR_STATUS], CR_STATUS, CRS);
+
     *pc = env->pc;
     *cs_base = 0;
-    *flags = env->ctrl[CR_STATUS] & CR_STATUS_U;
+    *flags = (env->ctrl[CR_STATUS] & CR_STATUS_U)
+           | (crs ? 0 : R_TBFLAGS_CRS0_MASK)
+           | (env->regs[0] ? 0 : R_TBFLAGS_R0_0_MASK);
 }
 
 #endif /* NIOS2_CPU_H */
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 54e7071907..d043c02fcd 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -48,15 +48,17 @@ static void nios2_cpu_reset(DeviceState *dev)
 
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
index 794b763d8a..363f2ea3ca 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -127,12 +127,16 @@ typedef struct DisasContext {
     DisasContextBase  base;
     target_ulong      pc;
     int               mem_idx;
+    uint32_t          tb_flags;
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
@@ -154,22 +158,47 @@ static uint8_t get_opxcode(uint32_t code)
 static TCGv load_gpr(DisasContext *dc, unsigned reg)
 {
     assert(reg < NUM_GP_REGS);
-    if (unlikely(reg == R_ZERO)) {
+
+    /*
+     * With shadow register sets, register r0 does not necessarily contain 0,
+     * but it is overwhelmingly likely that it does -- software is supposed
+     * to have set r0 to 0 in every shadow register set before use.
+     */
+    if (unlikely(reg == R_ZERO) && FIELD_EX32(dc->tb_flags, TBFLAGS, R0_0)) {
         return tcg_constant_tl(0);
     }
-    return cpu_R[reg];
+    if (FIELD_EX32(dc->tb_flags, TBFLAGS, CRS0)) {
+        return cpu_R[reg];
+    }
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    return cpu_crs_R[reg];
+#endif
 }
 
 static TCGv dest_gpr(DisasContext *dc, unsigned reg)
 {
     assert(reg < NUM_GP_REGS);
+
+    /*
+     * The spec for shadow register sets isn't clear, but we assume that
+     * writes to r0 are discarded regardless of CRS.
+     */
     if (unlikely(reg == R_ZERO)) {
         if (dc->sink == NULL) {
             dc->sink = tcg_temp_new();
         }
         return dc->sink;
     }
-    return cpu_R[reg];
+    if (FIELD_EX32(dc->tb_flags, TBFLAGS, CRS0)) {
+        return cpu_R[reg];
+    }
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    return cpu_crs_R[reg];
+#endif
 }
 
 static void t_gen_helper_raise_exception(DisasContext *dc,
@@ -225,7 +254,7 @@ static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static bool gen_check_supervisor(DisasContext *dc)
 {
-    if (dc->base.tb->flags & CR_STATUS_U) {
+    if (FIELD_EX32(dc->tb_flags, TBFLAGS, U)) {
         /* CPU in user mode, privileged instruction called, stop. */
         t_gen_helper_raise_exception(dc, EXCP_SUPERI);
         return false;
@@ -335,7 +364,7 @@ static void do_i_math_logic(DisasContext *dc, uint32_t insn,
 
     val = imm(&instr);
 
-    if (instr.a == R_ZERO) {
+    if (instr.a == R_ZERO && FIELD_EX32(dc->tb_flags, TBFLAGS, R0_0)) {
         /* This catches the canonical expansions of movi and movhi. */
         tcg_gen_movi_tl(dest_gpr(dc, instr.b), x_op_0_eq_x ? val : 0);
     } else {
@@ -865,6 +894,7 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->mem_idx = cpu_mmu_index(env, false);
     dc->cr_state = cpu->cr_state;
+    dc->tb_flags = dc->base.tb->flags;
 
     /* Bound the number of insns to execute to those left on the page.  */
     page_insns = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
@@ -999,13 +1029,26 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
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
2.34.1


