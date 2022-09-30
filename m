Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB58C5F15F5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 00:17:26 +0200 (CEST)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeOJx-0004EX-Vs
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 18:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6a-000243-Ol
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 18:03:36 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:45892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6X-0002an-Tk
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 18:03:36 -0400
Received: by mail-qk1-x72d.google.com with SMTP id i17so3652068qkk.12
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 15:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/CcgGI12plS/lfJEOR9586DslscxVOBysCaDTBeg4l8=;
 b=aVmqx8UcUP0L1WrKPbww8Z+13UZa3SeIlVoWzPe6fktMdLJ1KoO2gx1qRs0Xs2tD3w
 IrW+fFsDDjGO6j8LerAW6MYyQlA1ZUTsLg9FnUONXa2T9HBctXJ5+QkcrvOF/CeFn+Aq
 Dg7vToXF4z4wZd5mcYEuVHx2/iv4pnjs5suV5OxZ8ERX9tTqnWlsy8slsQz93y++klFG
 OWa/bXWIrAn1LxpEpdVK87wp7zeigl3ZbNawKjMIGSnzCBa4O6goXaV4qw9/dblc3LRK
 lK0Sk9LPkrXzIA1NpMqG0mpJlC9JT0RhZufZDZ/56fi4Bt1S3LZCZBKwNIerGNj78FNa
 pycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/CcgGI12plS/lfJEOR9586DslscxVOBysCaDTBeg4l8=;
 b=Kv83FJ4HO1SD1zWDQReCWeQadWH95M21sqCwxIoBpqieknfatkpdxox9V3VbJ31RGq
 Jo7oXDgel4nIHVhHd2CtmYm1JgSPuxxzRkGAZa2v9kBC5jlR4NlH/WuLUme8LNEuY9kr
 gJy4wjotOeIxG60AFdw5UjGxj/M9osKB01gir30V7qs6BA86/0xqketcirIDWxDVoHaJ
 BHmCHnxLoaRzedmtFN+4av63qock0f9CY1+ai2b6mlJW0ZYFoJOhZTA1veEuzoc7WvB1
 jJGv7HdxLRaaNplEfSV8KT6L99wuAiILYK98XQ06912xt45bfVYIHD7ZjDYehLDK/Z6b
 kW3w==
X-Gm-Message-State: ACrzQf1sdwWu4Y4fQEOkHXKLESa56OoQwuUIxaoiWi1KnxYr9T5t4UeI
 wWFpzBpGm49mzkTeRXY01veBvTs2HYQPPw==
X-Google-Smtp-Source: AMsMyM7IPdAk4KE/FXDHKQqur0GKz64crhRI0n90jnauUIS4viNNND794hV9CO8d6uvj7D4DrSShtA==
X-Received: by 2002:a05:620a:2809:b0:6bc:5e42:fef9 with SMTP id
 f9-20020a05620a280900b006bc5e42fef9mr7765371qkp.278.1664575412742; 
 Fri, 30 Sep 2022 15:03:32 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm3196055qki.79.2022.09.30.15.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:03:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 9/9] target/arm: Enable TARGET_TB_PCREL
Date: Fri, 30 Sep 2022 15:03:12 -0700
Message-Id: <20220930220312.135327-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930220312.135327-1-richard.henderson@linaro.org>
References: <20220930220312.135327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h     |  1 +
 target/arm/translate.h     | 19 ++++++++++++
 target/arm/cpu.c           | 23 +++++++-------
 target/arm/translate-a64.c | 37 ++++++++++++++++++-----
 target/arm/translate.c     | 62 ++++++++++++++++++++++++++++++--------
 5 files changed, 112 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 68ffb12427..29c5fc4241 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -30,6 +30,7 @@
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
+# define TARGET_TB_PCREL 1
 #endif
 
 #define NB_MMU_MODES 15
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 4aa239e23c..41d14cc067 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -12,6 +12,25 @@ typedef struct DisasContext {
 
     /* The address of the current instruction being translated. */
     target_ulong pc_curr;
+    /*
+     * For TARGET_TB_PCREL, the full value of cpu_pc is not known
+     * (although the page offset is known).  For convenience, the
+     * translation loop uses the full virtual address that triggered
+     * the translation is used, from base.pc_start through pc_curr.
+     * For efficiency, we do not update cpu_pc for every instruction.
+     * Instead, pc_save has the value of pc_curr at the time of the
+     * last update to cpu_pc, which allows us to compute the addend
+     * needed to bring cpu_pc current: pc_curr - pc_save.
+     * If cpu_pc now contains the destiation of an indirect branch,
+     * pc_save contains -1 to indicate that relative updates are no
+     * longer possible.
+     */
+    target_ulong pc_save;
+    /*
+     * Similarly, pc_cond_save contains the value of pc_save at the
+     * beginning of an AArch32 conditional instruction.
+     */
+    target_ulong pc_cond_save;
     target_ulong page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 94ca6f163f..0bc5e9b125 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -76,17 +76,18 @@ static vaddr arm_cpu_get_pc(CPUState *cs)
 void arm_cpu_synchronize_from_tb(CPUState *cs,
                                  const TranslationBlock *tb)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * It's OK to look at env for the current mode here, because it's
-     * never possible for an AArch64 TB to chain to an AArch32 TB.
-     */
-    if (is_a64(env)) {
-        env->pc = tb_pc(tb);
-    } else {
-        env->regs[15] = tb_pc(tb);
+    /* The program counter is always up to date with TARGET_TB_PCREL. */
+    if (!TARGET_TB_PCREL) {
+        CPUARMState *env = cs->env_ptr;
+        /*
+         * It's OK to look at env for the current mode here, because it's
+         * never possible for an AArch64 TB to chain to an AArch32 TB.
+         */
+        if (is_a64(env)) {
+            env->pc = tb_pc(tb);
+        } else {
+            env->regs[15] = tb_pc(tb);
+        }
     }
 }
 #endif /* CONFIG_TCG */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 28a417fb2b..57cfc9f1a9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -150,12 +150,18 @@ static void reset_btype(DisasContext *s)
 
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, target_long diff)
 {
-    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_i64(dest, cpu_pc, (s->pc_curr - s->pc_save) + diff);
+    } else {
+        tcg_gen_movi_i64(dest, s->pc_curr + diff);
+    }
 }
 
 void gen_a64_update_pc(DisasContext *s, target_long diff)
 {
     gen_pc_plus_diff(s, cpu_pc, diff);
+    s->pc_save = s->pc_curr + diff;
 }
 
 /*
@@ -209,6 +215,7 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
      * then loading an address into the PC will clear out any tag.
      */
     gen_top_byte_ignore(s, cpu_pc, src, s->tbii);
+    s->pc_save = -1;
 }
 
 /*
@@ -347,16 +354,22 @@ static void gen_exception_internal(int excp)
 
 static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
+    target_ulong pc_save = s->pc_save;
+
     gen_a64_update_pc(s, 0);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
+    target_ulong pc_save = s->pc_save;
+
     gen_a64_update_pc(s, 0);
     gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syndrome));
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 static void gen_step_complete_exception(DisasContext *s)
@@ -385,11 +398,16 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
 
 static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
 {
-    uint64_t dest = s->pc_curr + diff;
+    target_ulong pc_save = s->pc_save;
 
-    if (use_goto_tb(s, dest)) {
-        tcg_gen_goto_tb(n);
-        gen_a64_update_pc(s, diff);
+    if (use_goto_tb(s, s->pc_curr + diff)) {
+        if (TARGET_TB_PCREL) {
+            gen_a64_update_pc(s, diff);
+            tcg_gen_goto_tb(n);
+        } else {
+            tcg_gen_goto_tb(n);
+            gen_a64_update_pc(s, diff);
+        }
         tcg_gen_exit_tb(s->base.tb, n);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
@@ -401,6 +419,7 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
             s->base.is_jmp = DISAS_NORETURN;
         }
     }
+    s->pc_save = pc_save;
 }
 
 static void init_tmp_a64_array(DisasContext *s)
@@ -14707,7 +14726,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
 
     dc->isar = &arm_cpu->isar;
     dc->condjmp = 0;
-
+    dc->pc_save = dc->base.pc_first;
     dc->aarch64 = true;
     dc->thumb = false;
     dc->sctlr_b = 0;
@@ -14789,8 +14808,12 @@ static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu)
 static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
+    target_ulong pc_arg = dc->base.pc_next;
 
-    tcg_gen_insn_start(dc->base.pc_next, 0, 0);
+    if (TARGET_TB_PCREL) {
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
+    tcg_gen_insn_start(pc_arg, 0, 0);
     dc->insn_start = tcg_last_op();
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 050da9e740..b4b82dc4a5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -164,6 +164,7 @@ void arm_gen_condlabel(DisasContext *s)
     if (!s->condjmp) {
         s->condlabel = gen_new_label();
         s->condjmp = 1;
+        s->pc_cond_save = s->pc_save;
     }
 }
 
@@ -278,7 +279,12 @@ static target_long jmp_diff(DisasContext *s, target_long diff)
 
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
 {
-    tcg_gen_movi_i32(var, s->pc_curr + diff);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_i32(var, cpu_R[15], (s->pc_curr - s->pc_save) + diff);
+    } else {
+        tcg_gen_movi_i32(var, s->pc_curr + diff);
+    }
 }
 
 /* Set a variable to the value of a CPU register.  */
@@ -321,6 +327,7 @@ void store_reg(DisasContext *s, int reg, TCGv_i32 var)
          */
         tcg_gen_andi_i32(var, var, s->thumb ? ~1 : ~3);
         s->base.is_jmp = DISAS_JUMP;
+        s->pc_save = -1;
     } else if (reg == 13 && arm_dc_feature(s, ARM_FEATURE_M)) {
         /* For M-profile SP bits [1:0] are always zero */
         tcg_gen_andi_i32(var, var, ~3);
@@ -786,7 +793,8 @@ void gen_set_condexec(DisasContext *s)
 
 void gen_update_pc(DisasContext *s, target_long diff)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->pc_curr + diff);
+    gen_pc_plus_diff(s, cpu_R[15], diff);
+    s->pc_save = s->pc_curr + diff;
 }
 
 /* Set PC and Thumb state from var.  var is marked as dead.  */
@@ -796,6 +804,7 @@ static inline void gen_bx(DisasContext *s, TCGv_i32 var)
     tcg_gen_andi_i32(cpu_R[15], var, ~1);
     tcg_gen_andi_i32(var, var, 1);
     store_cpu_field(var, thumb);
+    s->pc_save = -1;
 }
 
 /*
@@ -1118,6 +1127,8 @@ static void gen_exception(int excp, uint32_t syndrome)
 static void gen_exception_insn_el_v(DisasContext *s, target_long pc_diff,
                                     int excp, uint32_t syn, TCGv_i32 tcg_el)
 {
+    target_ulong pc_save = s->pc_save;
+
     if (s->aarch64) {
         gen_a64_update_pc(s, pc_diff);
     } else {
@@ -1126,6 +1137,7 @@ static void gen_exception_insn_el_v(DisasContext *s, target_long pc_diff,
     }
     gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
@@ -1138,6 +1150,8 @@ void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
 void gen_exception_insn(DisasContext *s, target_long pc_diff,
                         int excp, uint32_t syn)
 {
+    target_ulong pc_save = s->pc_save;
+
     if (s->aarch64) {
         gen_a64_update_pc(s, pc_diff);
     } else {
@@ -1146,6 +1160,7 @@ void gen_exception_insn(DisasContext *s, target_long pc_diff,
     }
     gen_exception(excp, syn);
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
@@ -2610,11 +2625,14 @@ static void gen_goto_ptr(void)
  */
 static void gen_goto_tb(DisasContext *s, int n, target_long diff)
 {
-    target_ulong dest = s->pc_curr + diff;
-
-    if (translator_use_goto_tb(&s->base, dest)) {
-        tcg_gen_goto_tb(n);
-        gen_update_pc(s, diff);
+    if (translator_use_goto_tb(&s->base, s->pc_curr + diff)) {
+        if (TARGET_TB_PCREL) {
+            gen_update_pc(s, diff);
+            tcg_gen_goto_tb(n);
+        } else {
+            tcg_gen_goto_tb(n);
+            gen_update_pc(s, diff);
+        }
         tcg_gen_exit_tb(s->base.tb, n);
     } else {
         gen_update_pc(s, diff);
@@ -2626,10 +2644,13 @@ static void gen_goto_tb(DisasContext *s, int n, target_long diff)
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
 static void gen_jmp_tb(DisasContext *s, target_long diff, int tbno)
 {
+    target_ulong pc_save = s->pc_save;
+
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_update_pc(s, diff);
         s->base.is_jmp = DISAS_JUMP;
+        s->pc_save = pc_save;
         return;
     }
     switch (s->base.is_jmp) {
@@ -2665,6 +2686,7 @@ static void gen_jmp_tb(DisasContext *s, target_long diff, int tbno)
          */
         g_assert_not_reached();
     }
+    s->pc_save = pc_save;
 }
 
 static inline void gen_jmp(DisasContext *s, target_long diff)
@@ -9326,7 +9348,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->isar = &cpu->isar;
     dc->condjmp = 0;
-
+    dc->pc_save = dc->base.pc_first;
     dc->aarch64 = false;
     dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
@@ -9481,13 +9503,17 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
      * fields here.
      */
     uint32_t condexec_bits;
+    target_ulong pc_arg = dc->base.pc_next;
 
+    if (TARGET_TB_PCREL) {
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
     if (dc->eci) {
         condexec_bits = dc->eci << 4;
     } else {
         condexec_bits = (dc->condexec_cond << 4) | (dc->condexec_mask >> 1);
     }
-    tcg_gen_insn_start(dc->base.pc_next, condexec_bits, 0);
+    tcg_gen_insn_start(pc_arg, condexec_bits, 0);
     dc->insn_start = tcg_last_op();
 }
 
@@ -9530,7 +9556,10 @@ static bool arm_check_ss_active(DisasContext *dc)
 
 static void arm_post_translate_insn(DisasContext *dc)
 {
-    if (dc->condjmp && !dc->base.is_jmp) {
+    if (dc->condjmp && dc->base.is_jmp == DISAS_NEXT) {
+        if (dc->pc_save != dc->pc_cond_save) {
+            gen_update_pc(dc, dc->pc_cond_save - dc->pc_save);
+        }
         gen_set_label(dc->condlabel);
         dc->condjmp = 0;
     }
@@ -9860,6 +9889,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
     if (dc->condjmp) {
         /* "Condition failed" instruction codepath for the branch/trap insn */
+        dc->pc_save = dc->pc_cond_save;
         gen_set_label(dc->condlabel);
         gen_set_condexec(dc);
         if (unlikely(dc->ss_active)) {
@@ -9922,11 +9952,19 @@ void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
     if (is_a64(env)) {
-        env->pc = data[0];
+        if (TARGET_TB_PCREL) {
+            env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->pc = data[0];
+        }
         env->condexec_bits = 0;
         env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     } else {
-        env->regs[15] = data[0];
+        if (TARGET_TB_PCREL) {
+            env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->regs[15] = data[0];
+        }
         env->condexec_bits = data[1];
         env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     }
-- 
2.34.1


