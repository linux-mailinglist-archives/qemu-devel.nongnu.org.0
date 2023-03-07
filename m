Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E76F6AED74
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbdy-00028e-8e; Tue, 07 Mar 2023 13:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdt-0001Oi-E4
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:29 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdq-00014l-Qg
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:29 -0500
Received: by mail-pj1-x102d.google.com with SMTP id oj5so14024030pjb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tvxQOqLFH858OQWHHz/9suOUqQNv9qr1b6N50Y//k0g=;
 b=Xs8aSA2SYIvLFjB06yOOZy8JaZaVGGh7wUSjOqGG5zZpu1z/FpauyR34+RfXtALJUF
 LnkShKQ0RMOULlz2UVuR//StWdZmQcSbHrYC3wuV6PBg41hXp8+MncLvSXtx7k9PoT1O
 lCx6DdYXZmJamMHej6T1vPAYVl1rJHmG/iHEqedWp1Lg1by/7lkif5UgRvT0LQ+7VfKJ
 RzX6AplrfkFwvWfmr08vrFMM3wuxqjh+U8xyDDyrNsWlZuzoE8XE7dKP3ZRG8o4LahaI
 uHT5k4pnhE1ycpJYWNK7fWNC6GKz2tiGZ8QlF2NUK9T2m9oL222Qke30rzAwF1D+H2CY
 gkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tvxQOqLFH858OQWHHz/9suOUqQNv9qr1b6N50Y//k0g=;
 b=E0boarAj4qJSqKc3m7iQ5JSEx4s9QFas6opRhcwL6WBXVA3/oI16/7kHOkBbhsiJdo
 2yG8jJRZuzOLoWJoEu0QEpvFSbCklE1kV+f21tgk43EgP1VDPmFqJ+wHPNiVNcGZWUM1
 uamCOeanLBLP2GU6QelX2g0mAN2xUy4uz24MTO4f1VMfJvG34FRE2GBlM3I6JQnyKodm
 1yk1IxNSKzMcaC9Nk7OnW/GD1DD8WbYweDbY5ydpjzLl2TCAU93Jc8xZsT8bTbGJKi/S
 QThm09+HMN98YYvl3TSZW0rzDF18BzQrr2pubAGzBF6MqPqzD+NMpSatrWs354I5WHmL
 6Hig==
X-Gm-Message-State: AO0yUKV/Glx4T2K+PV8aQC0PpW5Lkg5zHMWLEbVLitNaCbaPZuwQJ5Hn
 q7S30OiXecuvsokAMm+3ETqXD5+UUqLaMzoMdwQ=
X-Google-Smtp-Source: AK7set8v2KW/gWa7ERJ59IaKKdSud0OaH4SF0kGcPZCBWe+JLZpfad3q7nxiwF31KgagUvfEjWLQYw==
X-Received: by 2002:a05:6a20:1615:b0:cc:e39e:93aa with SMTP id
 l21-20020a056a20161500b000cce39e93aamr17163270pzj.0.1678212144943; 
 Tue, 07 Mar 2023 10:02:24 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 44/67] target/i386: Avoid use of tcg_const_* throughout
Date: Tue,  7 Mar 2023 09:58:25 -0800
Message-Id: <20230307175848.2508955-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All uses are strictly read-only.  Most of the obviously so,
as direct arguments to gen_helper_*.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 83 +++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index fa422ebd0b..9dfad2f7bc 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -884,7 +884,7 @@ static void gen_compute_eflags(DisasContext *s)
     live = cc_op_live[s->cc_op] & ~USES_CC_SRCT;
     dead = live ^ (USES_CC_DST | USES_CC_SRC | USES_CC_SRC2);
     if (dead) {
-        zero = tcg_const_tl(0);
+        zero = tcg_constant_tl(0);
         if (dead & USES_CC_DST) {
             dst = zero;
         }
@@ -1412,7 +1412,7 @@ static void gen_helper_fp_arith_ST0_FT0(int op)
 /* NOTE the exception in "r" op ordering */
 static void gen_helper_fp_arith_STN_ST0(int op, int opreg)
 {
-    TCGv_i32 tmp = tcg_const_i32(opreg);
+    TCGv_i32 tmp = tcg_constant_i32(opreg);
     switch (op) {
     case 0:
         gen_helper_fadd_STN_ST0(cpu_env, tmp);
@@ -1439,7 +1439,7 @@ static void gen_exception(DisasContext *s, int trapno)
 {
     gen_update_cc_op(s);
     gen_update_eip_cur(s);
-    gen_helper_raise_exception(cpu_env, tcg_const_i32(trapno));
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(trapno));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1633,7 +1633,7 @@ static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv result,
     /* Store the results into the CC variables.  If we know that the
        variable must be dead, store unconditionally.  Otherwise we'll
        need to not disrupt the current contents.  */
-    z_tl = tcg_const_tl(0);
+    z_tl = tcg_constant_tl(0);
     if (cc_op_live[s->cc_op] & USES_CC_DST) {
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_cc_dst, count, z_tl,
                            result, cpu_cc_dst);
@@ -1657,7 +1657,7 @@ static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv result,
     }
 
     /* Conditionally store the CC_OP value.  */
-    z32 = tcg_const_i32(0);
+    z32 = tcg_constant_i32(0);
     s32 = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(s32, count);
     tcg_gen_movcond_i32(TCG_COND_NE, cpu_cc_op, s32, z32, s->tmp2_i32, oldop);
@@ -1813,7 +1813,7 @@ static void gen_rot_rm_T1(DisasContext *s, MemOp ot, int op1, int is_right)
        is 0 we keep the CC_OP_EFLAGS setting so that only CC_SRC is live.
        Otherwise reuse CC_OP_ADCOX which have the C and O flags split out
        exactly as we computed above.  */
-    t0 = tcg_const_i32(0);
+    t0 = tcg_constant_i32(0);
     t1 = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(t1, s->T1);
     tcg_gen_movi_i32(s->tmp2_i32, CC_OP_ADCOX);
@@ -2497,7 +2497,7 @@ static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
         cc.reg = t0;
     }
     if (!cc.use_reg2) {
-        cc.reg2 = tcg_const_tl(cc.imm);
+        cc.reg2 = tcg_constant_tl(cc.imm);
     }
 
     tcg_gen_movcond_tl(cc.cond, s->T0, cc.reg, cc.reg2,
@@ -2525,7 +2525,7 @@ static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
 {
     if (PE(s) && !VM86(s)) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-        gen_helper_load_seg(cpu_env, tcg_const_i32(seg_reg), s->tmp2_i32);
+        gen_helper_load_seg(cpu_env, tcg_constant_i32(seg_reg), s->tmp2_i32);
         /* abort translation because the addseg value may change or
            because ss32 may change. For R_SS, translation must always
            stop as a special handling must be done to disable hardware
@@ -4344,7 +4344,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_op_mov_v_reg(s, ot, s->T1, reg);
 
         if (shift) {
-            TCGv imm = tcg_const_tl(x86_ldub_code(env, s));
+            TCGv imm = tcg_constant_tl(x86_ldub_code(env, s));
             gen_shiftd_rm_T1(s, ot, opreg, op, imm);
         } else {
             gen_shiftd_rm_T1(s, ot, opreg, op, cpu_regs[R_ECX]);
@@ -4503,7 +4503,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     break;
                 case 0x0c: /* fldenv mem */
                     gen_helper_fldenv(cpu_env, s->A0,
-                                      tcg_const_i32(dflag - 1));
+                                      tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x0d: /* fldcw mem */
@@ -4514,7 +4514,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     break;
                 case 0x0e: /* fnstenv mem */
                     gen_helper_fstenv(cpu_env, s->A0,
-                                      tcg_const_i32(dflag - 1));
+                                      tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x0f: /* fnstcw mem */
@@ -4532,12 +4532,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     break;
                 case 0x2c: /* frstor mem */
                     gen_helper_frstor(cpu_env, s->A0,
-                                      tcg_const_i32(dflag - 1));
+                                      tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x2e: /* fnsave mem */
                     gen_helper_fsave(cpu_env, s->A0,
-                                     tcg_const_i32(dflag - 1));
+                                     tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x2f: /* fnstsw mem */
@@ -4587,12 +4587,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 case 0x08: /* fld sti */
                     gen_helper_fpush(cpu_env);
                     gen_helper_fmov_ST0_STN(cpu_env,
-                                            tcg_const_i32((opreg + 1) & 7));
+                                            tcg_constant_i32((opreg + 1) & 7));
                     break;
                 case 0x09: /* fxchg sti */
                 case 0x29: /* fxchg4 sti, undocumented op */
                 case 0x39: /* fxchg7 sti, undocumented op */
-                    gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fxchg_ST0_STN(cpu_env, tcg_constant_i32(opreg));
                     break;
                 case 0x0a: /* grp d9/2 */
                     switch (rm) {
@@ -4732,27 +4732,27 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                             }
                         } else {
                             gen_helper_fmov_FT0_STN(cpu_env,
-                                                    tcg_const_i32(opreg));
+                                                    tcg_constant_i32(opreg));
                             gen_helper_fp_arith_ST0_FT0(op1);
                         }
                     }
                     break;
                 case 0x02: /* fcom */
                 case 0x22: /* fcom2, undocumented op */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fcom_ST0_FT0(cpu_env);
                     break;
                 case 0x03: /* fcomp */
                 case 0x23: /* fcomp3, undocumented op */
                 case 0x32: /* fcomp5, undocumented op */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fcom_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
                     break;
                 case 0x15: /* da/5 */
                     switch (rm) {
                     case 1: /* fucompp */
-                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(1));
                         gen_helper_fucom_ST0_FT0(cpu_env);
                         gen_helper_fpop(cpu_env);
                         gen_helper_fpop(cpu_env);
@@ -4786,7 +4786,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fucomi_ST0_FT0(cpu_env);
                     set_cc_op(s, CC_OP_EFLAGS);
                     break;
@@ -4795,36 +4795,36 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fcomi_ST0_FT0(cpu_env);
                     set_cc_op(s, CC_OP_EFLAGS);
                     break;
                 case 0x28: /* ffree sti */
-                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_ffree_STN(cpu_env, tcg_constant_i32(opreg));
                     break;
                 case 0x2a: /* fst sti */
-                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_constant_i32(opreg));
                     break;
                 case 0x2b: /* fstp sti */
                 case 0x0b: /* fstp1 sti, undocumented op */
                 case 0x3a: /* fstp8 sti, undocumented op */
                 case 0x3b: /* fstp9 sti, undocumented op */
-                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fpop(cpu_env);
                     break;
                 case 0x2c: /* fucom st(i) */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fucom_ST0_FT0(cpu_env);
                     break;
                 case 0x2d: /* fucomp st(i) */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fucom_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
                     break;
                 case 0x33: /* de/3 */
                     switch (rm) {
                     case 1: /* fcompp */
-                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(1));
                         gen_helper_fcom_ST0_FT0(cpu_env);
                         gen_helper_fpop(cpu_env);
                         gen_helper_fpop(cpu_env);
@@ -4834,7 +4834,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     }
                     break;
                 case 0x38: /* ffreep sti, undocumented op */
-                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_ffree_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fpop(cpu_env);
                     break;
                 case 0x3c: /* df/4 */
@@ -4853,7 +4853,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fucomi_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
                     set_cc_op(s, CC_OP_EFLAGS);
@@ -4863,7 +4863,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fcomi_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
                     set_cc_op(s, CC_OP_EFLAGS);
@@ -4886,7 +4886,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
                         l1 = gen_new_label();
                         gen_jcc1_noeob(s, op1, l1);
-                        gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                        gen_helper_fmov_ST0_STN(cpu_env,
+                                                tcg_constant_i32(opreg));
                         gen_set_label(l1);
                     }
                     break;
@@ -5092,8 +5093,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(val));
+            gen_helper_lret_protected(cpu_env, tcg_constant_i32(dflag - 1),
+                                      tcg_constant_i32(val));
         } else {
             gen_stack_A0(s);
             /* pop offset */
@@ -5120,7 +5121,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_vm86_iopl(s)) {
                 break;
             }
-            gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
+            gen_helper_iret_real(cpu_env, tcg_constant_i32(dflag - 1));
         } else {
             gen_helper_iret_protected(cpu_env, tcg_constant_i32(dflag - 1),
                                       eip_next_i32(s));
@@ -5509,7 +5510,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (val == 0) {
             gen_exception(s, EXCP00_DIVZ);
         } else {
-            gen_helper_aam(cpu_env, tcg_const_i32(val));
+            gen_helper_aam(cpu_env, tcg_constant_i32(val));
             set_cc_op(s, CC_OP_LOGICB);
         }
         break;
@@ -5517,7 +5518,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s))
             goto illegal_op;
         val = x86_ldub_code(env, s);
-        gen_helper_aad(cpu_env, tcg_const_i32(val));
+        gen_helper_aad(cpu_env, tcg_constant_i32(val));
         set_cc_op(s, CC_OP_LOGICB);
         break;
         /************************/
@@ -5698,7 +5699,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (!PE(s)) {
             gen_exception_gpf(s);
         } else {
-            gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
+            gen_helper_sysexit(cpu_env, tcg_constant_i32(dflag - 1));
             s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
@@ -5717,7 +5718,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (!PE(s)) {
             gen_exception_gpf(s);
         } else {
-            gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
+            gen_helper_sysret(cpu_env, tcg_constant_i32(dflag - 1));
             /* condition codes are modified only in long mode */
             if (LMA(s)) {
                 set_cc_op(s, CC_OP_EFLAGS);
@@ -5923,7 +5924,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
+            gen_helper_vmrun(cpu_env, tcg_constant_i32(s->aflag - 1),
                              cur_insn_len_i32(s));
             tcg_gen_exit_tb(NULL, 0);
             s->base.is_jmp = DISAS_NORETURN;
@@ -5947,7 +5948,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
+            gen_helper_vmload(cpu_env, tcg_constant_i32(s->aflag - 1));
             break;
 
         case 0xdb: /* VMSAVE */
@@ -5959,7 +5960,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
+            gen_helper_vmsave(cpu_env, tcg_constant_i32(s->aflag - 1));
             break;
 
         case 0xdc: /* STGI */
-- 
2.34.1


