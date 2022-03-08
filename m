Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF974D1130
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:42:04 +0100 (CET)
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUTr-0003Gc-B7
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:42:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9M-0005H4-U8
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:52 -0500
Received: from [2607:f8b0:4864:20::52f] (port=36497
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9K-0006Tb-Eq
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:52 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t14so15690649pgr.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jkUviBvx+bFZA8/fWqzx8zy4GO0niXzHqxJY8cqRC64=;
 b=I+xARbXjHbwAUAeFUANnlTKleisHy6QiGdFLhehGafUr9qgjSlG+iwtLPpZxnu08cb
 x/WJgBjuOTFayR+NxkIxDmuQVe3obed04rG7bogbKniGbzIFqqH/kK4Kio4GOUcdbgPh
 SlyOFK2XZ1QyiFl0D+Ibz+6GZC7EKJjVMbQqt14NLiQUP6oZWKc2+Rjde9lXnoP21G12
 L8LF8xwwFOc0rV5stnxufN96fk81s1sAUuYFjhtX55swPo/Ko1mBa4ZIdhRThRNaPJNR
 p2OU/jxtXJvQlFrle0yAj8XG/VfOp8Q6dRJ6tKNKThPuQsOXXkHqq8BWp+koIe7TQ3jI
 IhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jkUviBvx+bFZA8/fWqzx8zy4GO0niXzHqxJY8cqRC64=;
 b=a1aWMSVKgPXmiIYbztDIvQtvk1l0pDAUFux2GDcdJLB6aDZc0y7X49mhsUIFkpmtLt
 67SWDIZ+UCHDFkkAtETFDsT0AS3hQXLPfoxYRBEbCcqaNHAqYdgUOPBi/njOesr54U+1
 TW1yhHDQClIirVkTD+wdWJJeWhD5wJh/fdEwP3IvG7uXCz8ZE0eB6IkgC7yAoEi8rooj
 r/OdKA45Ty/+NvWSeI9/e4Y/Fqe2hUp94RdMpJ249KLIaG84CU0Ve/klpfogPLKxr++d
 OJspbYrfBR1HKHWHKHR9/rKeNYhSLTRTznQ1XSll5Y6pKQzPYCwjoLIwPKeacrGiWeHd
 /o6A==
X-Gm-Message-State: AOAM5321oUVFbBUIDUf3I2hAVX2MFQ0GrOrKe2OUN2ukVSnT3+zCY+Dk
 UXvtJJd25wZLVN0IX6a31fdS5rcq3Fuuag==
X-Google-Smtp-Source: ABdhPJyvKKOgluodEfRYzR22OKBpNw3kC142/TofMjz0fIpbTzqIzgcg/rhYRuyCnH4Q027W6jIQ9Q==
X-Received: by 2002:a62:55c4:0:b0:4f6:b396:9caa with SMTP id
 j187-20020a6255c4000000b004f6b3969caamr17199075pfb.19.1646724046922; 
 Mon, 07 Mar 2022 23:20:46 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/33] target/nios2: Introduce shadow register sets
Date: Mon,  7 Mar 2022 21:19:56 -1000
Message-Id: <20220308072005.307955-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not actually enable them so far, but add all of the
plumbing to address them.  Do not enable them for user-only.

Add an env->crs pointer that handles the indirection to
the current register set.  Add a nios2_crs() function to
wrap this for normal uses, which hides the difference
between user-only and system modes.

From the notes on wrprs, which states that r0 must be initialized
before use in shadow register sets, infer that R_ZERO is *not*
hardwired to zero in shadow register sets.  Adjust load_gpr and
dest_gpr to reflect this.  At the same time we might as well
special case crs == 0 to avoid the indirection through env->crs
during translation as well.  Given that this is intended to be
the most common case for non-interrupt handlers.

Drop the zeroing of env->regs at reset, as those are undefined.
Do init env->crs at reset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h        | 32 ++++++++++++++++++++
 hw/nios2/boot.c           |  8 ++---
 target/nios2/cpu.c        |  7 +++--
 target/nios2/helper.c     | 12 ++++----
 target/nios2/nios2-semi.c | 13 ++++----
 target/nios2/translate.c  | 62 ++++++++++++++++++++++++++-------------
 6 files changed, 95 insertions(+), 39 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 2a5e070960..f05536e04d 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -61,6 +61,11 @@ struct Nios2CPUClass {
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
@@ -176,7 +181,13 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_MPUD     17
 
 struct CPUNios2State {
+#ifdef CONFIG_USER_ONLY
     uint32_t regs[NUM_GP_REGS];
+#else
+    uint32_t shadow_regs[NUM_REG_SETS][NUM_GP_REGS];
+    uint32_t *crs;
+#endif
+
     union {
         uint32_t ctrl[NUM_CR_REGS];
         struct {
@@ -245,6 +256,23 @@ static inline bool nios2_cr_reserved(const ControlRegState *s)
     return (s->writable | s->readonly) == 0;
 }
 
+static inline void nios2_update_crs(CPUNios2State *env)
+{
+#ifndef CONFIG_USER_ONLY
+    unsigned crs = FIELD_EX32(env->status, CR_STATUS, CRS);
+    env->crs = env->shadow_regs[crs];
+#endif
+}
+
+static inline uint32_t *nios2_crs(CPUNios2State *env)
+{
+#ifdef CONFIG_USER_ONLY
+    return env->regs;
+#else
+    return env->crs;
+#endif
+}
+
 void nios2_tcg_init(void);
 void nios2_cpu_do_interrupt(CPUState *cs);
 void dump_mmu(CPUNios2State *env);
@@ -286,12 +314,16 @@ typedef Nios2CPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
+FIELD(TBFLAGS, CRS0, 0, 1)
+FIELD(TBFLAGS, U, 1, 1)     /* Overlaps CR_STATUS_U */
+
 static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
     *pc = env->pc;
     *cs_base = 0;
     *flags = env->status & CR_STATUS_U;
+    *flags |= env->status & R_CR_STATUS_CRS_MASK ? 0 : R_TBFLAGS_CRS0_MASK;
 }
 
 #endif /* NIOS2_CPU_H */
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 5b3e4efed5..96896f2ec5 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -62,10 +62,10 @@ static void main_cpu_reset(void *opaque)
 
     cpu_reset(CPU(cpu));
 
-    env->regs[R_ARG0] = NIOS2_MAGIC;
-    env->regs[R_ARG1] = boot_info.initrd_start;
-    env->regs[R_ARG2] = boot_info.fdt;
-    env->regs[R_ARG3] = boot_info.cmdline;
+    nios2_crs(env)[R_ARG0] = NIOS2_MAGIC;
+    nios2_crs(env)[R_ARG1] = boot_info.initrd_start;
+    nios2_crs(env)[R_ARG2] = boot_info.fdt;
+    nios2_crs(env)[R_ARG3] = boot_info.cmdline;
 
     cpu_set_pc(cs, boot_info.bootstrap_pc);
     if (boot_info.machine_cpu_reset) {
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 2779650128..05f4a7a93a 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -53,7 +53,6 @@ static void nios2_cpu_reset(DeviceState *dev)
 
     ncc->parent_reset(dev);
 
-    memset(env->regs, 0, sizeof(env->regs));
     memset(env->ctrl, 0, sizeof(env->ctrl));
     env->pc = cpu->reset_addr;
 
@@ -63,6 +62,8 @@ static void nios2_cpu_reset(DeviceState *dev)
 #else
     env->status = CR_STATUS_RSIE;
 #endif
+
+    nios2_update_crs(env);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -210,7 +211,7 @@ static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     uint32_t val;
 
     if (n < 32) {          /* GP regs */
-        val = env->regs[n];
+        val = nios2_crs(env)[n];
     } else if (n == 32) {    /* PC */
         val = env->pc;
     } else if (n < 49) {     /* Status regs */
@@ -241,7 +242,7 @@ static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     val = ldl_p(mem_buf);
 
     if (n < 32) {            /* GP regs */
-        env->regs[n] = val;
+        nios2_crs(env)[n] = val;
     } else if (n == 32) {    /* PC */
         env->pc = val;
     } else if (n < 49) {     /* Status regs */
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 93338e86f0..007496b957 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -64,7 +64,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->status |= CR_STATUS_IH;
         env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->regs[R_EA] = env->pc + 4;
+        nios2_crs(env)[R_EA] = env->pc + 4;
         env->pc = cpu->exception_addr;
         break;
 
@@ -83,7 +83,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->tlbmisc &= ~CR_TLBMISC_DBL;
             env->tlbmisc |= CR_TLBMISC_WR;
 
-            env->regs[R_EA] = env->pc + 4;
+            nios2_crs(env)[R_EA] = env->pc + 4;
             env->pc = cpu->fast_tlb_miss_addr;
         } else {
             qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n", env->pc);
@@ -111,7 +111,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->tlbmisc |= CR_TLBMISC_WR;
         }
 
-        env->regs[R_EA] = env->pc + 4;
+        nios2_crs(env)[R_EA] = env->pc + 4;
         env->pc = cpu->exception_addr;
         break;
 
@@ -122,7 +122,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
         if ((env->status & CR_STATUS_EH) == 0) {
             env->estatus = env->status;
-            env->regs[R_EA] = env->pc + 4;
+            nios2_crs(env)[R_EA] = env->pc + 4;
         }
 
         env->status |= CR_STATUS_EH;
@@ -137,7 +137,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
         if ((env->status & CR_STATUS_EH) == 0) {
             env->estatus = env->status;
-            env->regs[R_EA] = env->pc + 4;
+            nios2_crs(env)[R_EA] = env->pc + 4;
         }
 
         env->status |= CR_STATUS_EH;
@@ -159,7 +159,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
         if ((env->status & CR_STATUS_EH) == 0) {
             env->bstatus = env->status;
-            env->regs[R_BA] = env->pc + 4;
+            nios2_crs(env)[R_BA] = env->pc + 4;
         }
 
         env->status |= CR_STATUS_EH;
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index fe5598bae4..8495718de0 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -144,7 +144,7 @@ static bool translate_stat(CPUNios2State *env, target_ulong addr,
 static void nios2_semi_return_u32(CPUNios2State *env, uint32_t ret,
                                   uint32_t err)
 {
-    target_ulong args = env->regs[R_ARG1];
+    target_ulong args = nios2_crs(env)[R_ARG1];
     if (put_user_u32(ret, args) ||
         put_user_u32(err, args + 4)) {
         /*
@@ -160,7 +160,7 @@ static void nios2_semi_return_u32(CPUNios2State *env, uint32_t ret,
 static void nios2_semi_return_u64(CPUNios2State *env, uint64_t ret,
                                   uint32_t err)
 {
-    target_ulong args = env->regs[R_ARG1];
+    target_ulong args = nios2_crs(env)[R_ARG1];
     if (put_user_u32(ret >> 32, args) ||
         put_user_u32(ret, args + 4) ||
         put_user_u32(err, args + 8)) {
@@ -210,13 +210,14 @@ void do_nios2_semihosting(CPUNios2State *env)
     void *q;
     uint32_t len;
     uint32_t result;
+    uint32_t *crs = nios2_crs(env);
 
-    nr = env->regs[R_ARG0];
-    args = env->regs[R_ARG1];
+    nr = crs[R_ARG0];
+    args = crs[R_ARG1];
     switch (nr) {
     case HOSTED_EXIT:
-        gdb_exit(env->regs[R_ARG0]);
-        exit(env->regs[R_ARG0]);
+        gdb_exit(crs[R_ARG0]);
+        exit(crs[R_ARG0]);
     case HOSTED_OPEN:
         GET_ARG(0);
         GET_ARG(1);
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 7c2ad02685..57913da3c9 100644
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
@@ -174,7 +192,7 @@ static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static bool gen_check_supervisor(DisasContext *dc)
 {
-    if (dc->base.tb->flags & CR_STATUS_U) {
+    if (dc->base.tb->flags & R_TBFLAGS_U_MASK) {
         /* CPU in user mode, privileged instruction called, stop. */
         t_gen_helper_raise_exception(dc, EXCP_SUPERI);
         return false;
@@ -773,6 +791,7 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->mem_idx = cpu_mmu_index(env, false);
     dc->cr_state = cpu->cr_state;
+    dc->crs0 = FIELD_EX32(dc->base.tb->flags, TBFLAGS, CRS0);
 
     /* Bound the number of insns to execute to those left on the page.  */
     page_insns = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
@@ -871,16 +890,13 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
+    const uint32_t *crs = nios2_crs(env);
     int i;
 
-    if (!env) {
-        return;
-    }
-
     qemu_fprintf(f, "IN: PC=%x %s\n", env->pc, lookup_symbol(env->pc));
 
     for (i = 0; i < NUM_GP_REGS; i++) {
-        qemu_fprintf(f, "%9s=%8.8x ", gr_regnames[i], env->regs[i]);
+        qemu_fprintf(f, "%9s=%8.8x ", gr_regnames[i], crs[i]);
         if ((i + 1) % 4 == 0) {
             qemu_fprintf(f, "\n");
         }
@@ -912,13 +928,19 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 void nios2_tcg_init(void)
 {
-    int i;
-
-    for (i = 0; i < NUM_GP_REGS; i++) {
-        cpu_R[i] = tcg_global_mem_new(cpu_env,
-                                      offsetof(CPUNios2State, regs[i]),
-                                      gr_regnames[i]);
+    for (int i = 0; i < NUM_GP_REGS; i++) {
+        cpu_R[i] = tcg_global_mem_new(cpu_env, 4 * i, gr_regnames[i]);
     }
+
+#ifndef CONFIG_USER_ONLY
+    TCGv_ptr crs = tcg_global_mem_new_ptr(cpu_env,
+                                          offsetof(CPUNios2State, crs), "crs");
+
+    for (int i = 0; i < NUM_GP_REGS; i++) {
+        cpu_crs_R[i] = tcg_global_mem_new(crs, 4 * i, gr_regnames[i]);
+    }
+#endif
+
     cpu_pc = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUNios2State, pc), "pc");
 }
-- 
2.25.1


