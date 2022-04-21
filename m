Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1650A518
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:19:04 +0200 (CEST)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZWH-0003vw-Pf
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcx-0005Qx-9n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:58 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:42850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcu-00076d-Pe
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:50 -0400
Received: by mail-il1-x12d.google.com with SMTP id r17so3247746iln.9
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0uNoT3+OUhyAosm9NWtB5ENBcnPjQYLk4htQJxIl/PY=;
 b=sKZWgrPtslQe8KLu99FH4pyMmMNRpYO5HFNS7DxywaEe7dLCa28B4avTDuDWkcbgOS
 0gd24aYtjfhwPxYcpTlGKOE4zUJEd/B3y5ALFXVNYiqYLXWk1GfPEUxZlw4+A7qj0bao
 p273URqcHm44LCbL5Nf4QPL4+ipoqJBcE6bWbWg6CHHAlXilYmytFnDNUr/PP7+HCdDy
 qn6Lv+ATywrcFtelG/j5LNmGLaw7qrZjqmf0fiKJvVX3mDinbjG7Fnuy1smJrL5JLTV2
 XPadMsAkgRDFg/kHSLkwAFtRrH/jAcF1wxwzofjCpSJmgLYzH3aRoH2S5Rq4oFTmCsry
 t+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0uNoT3+OUhyAosm9NWtB5ENBcnPjQYLk4htQJxIl/PY=;
 b=LexSXFEG3B+E/f4f/mRgPlQXYr92fX9HZ0NuAnqVtAU7xqEY8HofIP08dtplxHI76q
 DuW9ALYdG25RAtTrYDMkO/SCl4SsH3NmndDhMSp3yEHUjOuvzY54eQcZGDjo3PykWAfo
 wrHkw0VqDqROQuLrHCPvGyCtdslS6YgFRWEHHZCFM6+zxPDPputrswVSu5CMMzQGCU0Q
 bVaJna43DUOdMHKeXyVVSV8DEAu0mURfPzt92lb7zweXtG5tqbHmQjazthy2Cy2g/RQQ
 47dopJ2QzbFpduSMVco16kniq2ZGa/4Vl/AsqywPiz0LTeJeG8jUTQtSMudr2lzAjKUP
 bHzg==
X-Gm-Message-State: AOAM530rBhhr2RK8LIa664TUl+uRpmPsSrdAdmmSbSQtPVW+2kmXKv1G
 YT5vEYR4M+vFJ7wpwU591ZV52AXbih3XLg==
X-Google-Smtp-Source: ABdhPJyChuzqRksvFYJ3jFMpneB+INdxfWelN44h9wHxeGbJXEv0imqFRmwyTBk4ctKb3RLbryEZgw==
X-Received: by 2002:a05:6e02:1a8d:b0:2cd:5b32:972d with SMTP id
 k13-20020a056e021a8d00b002cd5b32972dmr70827ilv.229.1650554507733; 
 Thu, 21 Apr 2022 08:21:47 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 45/64] target/nios2: Introduce dest_gpr
Date: Thu, 21 Apr 2022 08:17:16 -0700
Message-Id: <20220421151735.31996-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12d.google.com
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

Constrain all references to cpu_R[] to load_gpr and dest_gpr.
This will be required for supporting shadow register sets.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 144 +++++++++++++--------------------------
 1 file changed, 49 insertions(+), 95 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 74672101ca..98efb4e10a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -122,6 +122,7 @@ typedef struct DisasContext {
     DisasContextBase  base;
     target_ulong      pc;
     int               mem_idx;
+    TCGv              sink;
     const ControlRegState *cr_state;
 } DisasContext;
 
@@ -154,6 +155,18 @@ static TCGv load_gpr(DisasContext *dc, unsigned reg)
     return cpu_R[reg];
 }
 
+static TCGv dest_gpr(DisasContext *dc, unsigned reg)
+{
+    assert(reg < NUM_GP_REGS);
+    if (unlikely(reg == R_ZERO)) {
+        if (dc->sink == NULL) {
+            dc->sink = tcg_temp_new();
+        }
+        return dc->sink;
+    }
+    return cpu_R[reg];
+}
+
 static void t_gen_helper_raise_exception(DisasContext *dc,
                                          uint32_t index)
 {
@@ -212,7 +225,7 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
+    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     jmpi(dc, code, flags);
 }
 
@@ -225,27 +238,10 @@ static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     TCGv addr = tcg_temp_new();
-    TCGv data;
-
-    /*
-     * WARNING: Loads into R_ZERO are ignored, but we must generate the
-     *          memory access itself to emulate the CPU precisely. Load
-     *          from a protected page to R_ZERO will cause SIGSEGV on
-     *          the Nios2 CPU.
-     */
-    if (likely(instr.b != R_ZERO)) {
-        data = cpu_R[instr.b];
-    } else {
-        data = tcg_temp_new();
-    }
+    TCGv data = dest_gpr(dc, instr.b);
 
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
     tcg_gen_qemu_ld_tl(data, addr, dc->mem_idx, flags);
-
-    if (unlikely(instr.b == R_ZERO)) {
-        tcg_temp_free(data);
-    }
-
     tcg_temp_free(addr);
 }
 
@@ -275,7 +271,7 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     TCGLabel *l1 = gen_new_label();
-    tcg_gen_brcond_tl(flags, cpu_R[instr.a], cpu_R[instr.b], l1);
+    tcg_gen_brcond_tl(flags, load_gpr(dc, instr.a), load_gpr(dc, instr.b), l1);
     gen_goto_tb(dc, 0, dc->base.pc_next);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->base.pc_next + (instr.imm16.s & -4));
@@ -287,11 +283,8 @@ static void do_i_cmpxx(DisasContext *dc, uint32_t insn, TCGCond cond,
                        target_ulong (*imm)(const InstrIType *))
 {
     I_TYPE(instr, insn);
-
-    if (likely(instr.b != R_ZERO)) {
-        tcg_gen_setcondi_tl(cond, cpu_R[instr.b],
-                            load_gpr(dc, instr.a), imm(&instr));
-    }
+    tcg_gen_setcondi_tl(cond, dest_gpr(dc, instr.b),
+                        load_gpr(dc, instr.a), imm(&instr));
 }
 
 #define gen_i_cmpxx(fname, imm)                                             \
@@ -319,9 +312,9 @@ static void do_i_math_logic(DisasContext *dc, uint32_t insn,
 
     if (instr.a == R_ZERO) {
         /* This catches the canonical expansions of movi and movhi. */
-        tcg_gen_movi_tl(cpu_R[instr.b], x_op_0_eq_x ? val : 0);
+        tcg_gen_movi_tl(dest_gpr(dc, instr.b), x_op_0_eq_x ? val : 0);
     } else {
-        fn(cpu_R[instr.b], cpu_R[instr.a], val);
+        fn(dest_gpr(dc, instr.b), load_gpr(dc, instr.a), val);
     }
 }
 
@@ -429,7 +422,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #else
     TCGv tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
-    gen_helper_eret(cpu_env, tmp, cpu_R[R_EA]);
+    gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
     tcg_temp_free(tmp);
 
     dc->base.is_jmp = DISAS_NORETURN;
@@ -439,8 +432,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ra */
 static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_RA]);
-
+    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, R_RA));
     dc->base.is_jmp = DISAS_JUMP;
 }
 
@@ -459,7 +451,7 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 #else
     TCGv tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_BSTATUS]));
-    gen_helper_eret(cpu_env, tmp, cpu_R[R_BA]);
+    gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_BA));
     tcg_temp_free(tmp);
 
     dc->base.is_jmp = DISAS_NORETURN;
@@ -472,7 +464,6 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-
     dc->base.is_jmp = DISAS_JUMP;
 }
 
@@ -481,9 +472,7 @@ static void nextpc(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    if (likely(instr.c != R_ZERO)) {
-        tcg_gen_movi_tl(cpu_R[instr.c], dc->base.pc_next);
-    }
+    tcg_gen_movi_tl(dest_gpr(dc, instr.c), dc->base.pc_next);
 }
 
 /*
@@ -495,7 +484,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
+    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
 
     dc->base.is_jmp = DISAS_JUMP;
 }
@@ -511,15 +500,11 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
     g_assert_not_reached();
 #else
     R_TYPE(instr, code);
-    TCGv t1, t2;
-
-    if (unlikely(instr.c == R_ZERO)) {
-        return;
-    }
+    TCGv t1, t2, dest = dest_gpr(dc, instr.c);
 
     /* Reserved registers read as zero. */
     if (nios2_cr_reserved(&dc->cr_state[instr.imm5])) {
-        tcg_gen_movi_tl(cpu_R[instr.c], 0);
+        tcg_gen_movi_tl(dest, 0);
         return;
     }
 
@@ -537,12 +522,12 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
         t2 = tcg_temp_new();
         tcg_gen_ld_tl(t1, cpu_env, offsetof(CPUNios2State, ctrl[CR_IPENDING]));
         tcg_gen_ld_tl(t2, cpu_env, offsetof(CPUNios2State, ctrl[CR_IENABLE]));
-        tcg_gen_and_tl(cpu_R[instr.c], t1, t2);
+        tcg_gen_and_tl(dest, t1, t2);
         tcg_temp_free(t1);
         tcg_temp_free(t2);
         break;
     default:
-        tcg_gen_ld_tl(cpu_R[instr.c], cpu_env,
+        tcg_gen_ld_tl(dest, cpu_env,
                       offsetof(CPUNios2State, ctrl[instr.imm5]));
         break;
     }
@@ -618,10 +603,8 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
 static void gen_cmpxx(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
-    if (likely(instr.c != R_ZERO)) {
-        tcg_gen_setcond_tl(flags, cpu_R[instr.c], cpu_R[instr.a],
-                           cpu_R[instr.b]);
-    }
+    tcg_gen_setcond_tl(flags, dest_gpr(dc, instr.c),
+                       load_gpr(dc, instr.a), load_gpr(dc, instr.b));
 }
 
 /* Math/logic instructions */
@@ -629,20 +612,14 @@ static void do_ri_math_logic(DisasContext *dc, uint32_t insn,
                              void (*fn)(TCGv, TCGv, int32_t))
 {
     R_TYPE(instr, insn);
-
-    if (likely(instr.c != R_ZERO)) {
-        fn(cpu_R[instr.c], load_gpr(dc, instr.a), instr.imm5);
-    }
+    fn(dest_gpr(dc, instr.c), load_gpr(dc, instr.a), instr.imm5);
 }
 
 static void do_rr_math_logic(DisasContext *dc, uint32_t insn,
                              void (*fn)(TCGv, TCGv, TCGv))
 {
     R_TYPE(instr, insn);
-
-    if (likely(instr.c != R_ZERO)) {
-        fn(cpu_R[instr.c], load_gpr(dc, instr.a), load_gpr(dc, instr.b));
-    }
+    fn(dest_gpr(dc, instr.c), load_gpr(dc, instr.a), load_gpr(dc, instr.b));
 }
 
 #define gen_ri_math_logic(fname, insn)                                      \
@@ -671,13 +648,11 @@ static void do_rr_mul_high(DisasContext *dc, uint32_t insn,
                            void (*fn)(TCGv, TCGv, TCGv, TCGv))
 {
     R_TYPE(instr, insn);
+    TCGv discard = tcg_temp_new();
 
-    if (likely(instr.c != R_ZERO)) {
-        TCGv discard = tcg_temp_new();
-        fn(discard, cpu_R[instr.c], load_gpr(dc, instr.a),
-           load_gpr(dc, instr.b));
-        tcg_temp_free(discard);
-    }
+    fn(discard, dest_gpr(dc, instr.c),
+       load_gpr(dc, instr.a), load_gpr(dc, instr.b));
+    tcg_temp_free(discard);
 }
 
 #define gen_rr_mul_high(fname, insn)                                        \
@@ -692,14 +667,11 @@ static void do_rr_shift(DisasContext *dc, uint32_t insn,
                         void (*fn)(TCGv, TCGv, TCGv))
 {
     R_TYPE(instr, insn);
+    TCGv sh = tcg_temp_new();
 
-    if (likely(instr.c != R_ZERO)) {
-        TCGv sh = tcg_temp_new();
-
-        tcg_gen_andi_tl(sh, load_gpr(dc, instr.b), 31);
-        fn(cpu_R[instr.c], load_gpr(dc, instr.a), sh);
-        tcg_temp_free(sh);
-    }
+    tcg_gen_andi_tl(sh, load_gpr(dc, instr.b), 31);
+    fn(dest_gpr(dc, instr.c), load_gpr(dc, instr.a), sh);
+    tcg_temp_free(sh);
 }
 
 #define gen_rr_shift(fname, insn)                                           \
@@ -715,39 +687,15 @@ gen_rr_shift(ror, rotr)
 static void divs(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, (code));
-    TCGv dest;
-
-    if (instr.c == R_ZERO) {
-        dest = tcg_temp_new();
-    } else {
-        dest = cpu_R[instr.c];
-    }
-
-    gen_helper_divs(dest, cpu_env,
+    gen_helper_divs(dest_gpr(dc, instr.c), cpu_env,
                     load_gpr(dc, instr.a), load_gpr(dc, instr.b));
-
-    if (instr.c == R_ZERO) {
-        tcg_temp_free(dest);
-    }
 }
 
 static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, (code));
-    TCGv dest;
-
-    if (instr.c == R_ZERO) {
-        dest = tcg_temp_new();
-    } else {
-        dest = cpu_R[instr.c];
-    }
-
-    gen_helper_divu(dest, cpu_env,
+    gen_helper_divu(dest_gpr(dc, instr.c), cpu_env,
                     load_gpr(dc, instr.a), load_gpr(dc, instr.b));
-
-    if (instr.c == R_ZERO) {
-        tcg_temp_free(dest);
-    }
 }
 
 static void trap(DisasContext *dc, uint32_t code, uint32_t flags)
@@ -937,8 +885,14 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         return;
     }
 
+    dc->sink = NULL;
+
     instr = &i_type_instructions[op];
     instr->handler(dc, code, instr->flags);
+
+    if (dc->sink) {
+        tcg_temp_free(dc->sink);
+    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


