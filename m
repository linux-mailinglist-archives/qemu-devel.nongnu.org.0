Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E5459CC87
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:52:38 +0200 (CEST)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHDh-0000Ro-SE
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGm4-0005me-Do
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:24:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGm2-0005gj-6v
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:24:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso15491696pjl.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=k/lBvxUYj7/biMnws+9sbX8m6+YHiVr97vq+CVkxwR0=;
 b=a/pvXhCoUMS+zDAFjQWKVnnid1w/V40fujK11fbhN2Dw5EZ2tuJUo3mGaAn8HdejYp
 UHe686Mhuv83atT0O2MTdFQiDtnyzaSk3FBjVsq0sGqj+KUJG6ecfpHW/66zIF39r8qh
 iZwYC+XBU82/c6bZ5fvvpMNLE8YwgaYyTYiY3QTpSda9hsFtl+LGJGu/YNXejCOXkXpj
 2xS4JewtjUhlJX9s0EIFs/VQ30O7S1C+Ad62yhXO07ux6pe0bUgnra6e97WIwXoo40GQ
 0VU2D/KUVeI8fiFKbg1pTuywQ5HOxH/OKWJt69VGmJ5vwOZMlhivuW9XkCqky6n2JHP2
 4wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=k/lBvxUYj7/biMnws+9sbX8m6+YHiVr97vq+CVkxwR0=;
 b=kUnobH3VbMMNAUaD8LZAGoKTWnaIYqfDy6YuQLrpfImiSf41dn6kACEjenYxs0P8Y8
 BCmE1Kc8eaqUa3l+xeLH79ECv7ycTBvMXhT+43wjEsBC8z/hOxou8V4CvUQ47fHQRdiS
 smT3pyCCWS5ZlBirYEAi4AjvLUazqtFZppC1IEw0R2DQSg/hT/4pVYzuUklIqDUWG2Sn
 Xey9AwedSrKQYKV+WfwVZzHCwl31LVNuC/MnhqPTqYotlRL1LWIOEJ1nxD69S/v05yU4
 Pc6qhS8pLaveEbX0Yo4z1X3ZIWx3T1IXerB+CyOvBiAdu3WO1p7EP/URhiS4pqAG9cwl
 s+Nw==
X-Gm-Message-State: ACgBeo0g+o6S5jAIdfbxc+tuZg6pYY0K4nsZ19/2h19ROEy7QSuLSeSA
 cRS4jrmn/yNgPs5p2H9+nzSQ0U31QOzR9A==
X-Google-Smtp-Source: AA6agR6q1eeZHFC2BzCN2cX80AyI8T3z8V2ndX17K54slFAkxa7zJSxgXEuoP7z0CXhc7R4b75W4Ig==
X-Received: by 2002:a17:902:7c05:b0:16d:2c63:da90 with SMTP id
 x5-20020a1709027c0500b0016d2c63da90mr21814228pll.27.1661210639944; 
 Mon, 22 Aug 2022 16:23:59 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 17/17] target/arm: Enable TARGET_TB_PCREL
Date: Mon, 22 Aug 2022 16:23:38 -0700
Message-Id: <20220822232338.1727934-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h     |  2 ++
 target/arm/translate.h     |  6 ++++
 target/arm/cpu.c           | 23 +++++++-------
 target/arm/translate-a64.c | 37 ++++++++++++++++++-----
 target/arm/translate.c     | 62 ++++++++++++++++++++++++++++++--------
 5 files changed, 100 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 68ffb12427..ef62371d8f 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -34,4 +34,6 @@
 
 #define NB_MMU_MODES 15
 
+#define TARGET_TB_PCREL 1
+
 #endif
diff --git a/target/arm/translate.h b/target/arm/translate.h
index d42059aa1d..7717ea3f45 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -12,6 +12,12 @@ typedef struct DisasContext {
 
     /* The address of the current instruction being translated. */
     target_ulong pc_curr;
+    /*
+     * For TARGET_TB_PCREL, the value relative to pc_curr against which
+     * offsets must be computed for cpu_pc.  -1 if unknown due to jump.
+     */
+    target_ulong pc_save;
+    target_ulong pc_cond_save;
     target_ulong page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 047bf3f4ab..f5e74b6c3b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -64,17 +64,18 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
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
index 322a09c503..a433189722 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -150,12 +150,18 @@ static void reset_btype(DisasContext *s)
 
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, int diff)
 {
-    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_i64(dest, cpu_pc, (s->pc_curr - s->pc_save) + diff);
+    } else {
+        tcg_gen_movi_i64(dest, s->pc_curr + diff);
+    }
 }
 
 void gen_a64_update_pc(DisasContext *s, int diff)
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
 
 static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
+    target_ulong pc_save = s->pc_save;
+
     gen_a64_update_pc(s, pc_diff);
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
 
 static void gen_goto_tb(DisasContext *s, int n, int diff)
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
@@ -401,6 +419,7 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
             s->base.is_jmp = DISAS_NORETURN;
         }
     }
+    s->pc_save = pc_save;
 }
 
 static void init_tmp_a64_array(DisasContext *s)
@@ -14717,7 +14736,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
 
     dc->isar = &arm_cpu->isar;
     dc->condjmp = 0;
-
+    dc->pc_save = dc->base.pc_first;
     dc->aarch64 = true;
     dc->thumb = false;
     dc->sctlr_b = 0;
@@ -14799,8 +14818,12 @@ static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu)
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
index f01c8df60a..a25ba48e87 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -164,6 +164,7 @@ void arm_gen_condlabel(DisasContext *s)
     if (!s->condjmp) {
         s->condlabel = gen_new_label();
         s->condjmp = 1;
+        s->pc_cond_save = s->pc_save;
     }
 }
 
@@ -278,7 +279,12 @@ static int jmp_diff(DisasContext *s, int diff)
 
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, int diff)
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
 
 void gen_update_pc(DisasContext *s, int diff)
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
 static void gen_exception_insn_el_v(DisasContext *s, int pc_diff, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
+    target_ulong pc_save = s->pc_save;
+
     if (s->aarch64) {
         gen_a64_update_pc(s, pc_diff);
     } else {
@@ -1126,6 +1137,7 @@ static void gen_exception_insn_el_v(DisasContext *s, int pc_diff, int excp,
     }
     gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 void gen_exception_insn_el(DisasContext *s, int pc_diff, int excp,
@@ -1137,6 +1149,8 @@ void gen_exception_insn_el(DisasContext *s, int pc_diff, int excp,
 
 void gen_exception_insn(DisasContext *s, int pc_diff, int excp, uint32_t syn)
 {
+    target_ulong pc_save = s->pc_save;
+
     if (s->aarch64) {
         gen_a64_update_pc(s, pc_diff);
     } else {
@@ -1145,6 +1159,7 @@ void gen_exception_insn(DisasContext *s, int pc_diff, int excp, uint32_t syn)
     }
     gen_exception(excp, syn);
     s->base.is_jmp = DISAS_NORETURN;
+    s->pc_save = pc_save;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
@@ -2612,11 +2627,14 @@ static void gen_goto_ptr(void)
  */
 static void gen_goto_tb(DisasContext *s, int n, int diff)
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
@@ -2628,10 +2646,13 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
 static void gen_jmp_tb(DisasContext *s, int diff, int tbno)
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
@@ -2667,6 +2688,7 @@ static void gen_jmp_tb(DisasContext *s, int diff, int tbno)
          */
         g_assert_not_reached();
     }
+    s->pc_save = pc_save;
 }
 
 static inline void gen_jmp(DisasContext *s, int diff)
@@ -9333,7 +9355,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->isar = &cpu->isar;
     dc->condjmp = 0;
-
+    dc->pc_save = dc->base.pc_first;
     dc->aarch64 = false;
     dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
@@ -9488,13 +9510,17 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
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
 
@@ -9537,7 +9563,10 @@ static bool arm_check_ss_active(DisasContext *dc)
 
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
@@ -9867,6 +9896,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
     if (dc->condjmp) {
         /* "Condition failed" instruction codepath for the branch/trap insn */
+        dc->pc_save = dc->pc_cond_save;
         gen_set_label(dc->condlabel);
         gen_set_condexec(dc);
         if (unlikely(dc->ss_active)) {
@@ -9929,11 +9959,19 @@ void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
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


