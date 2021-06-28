Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5CF3B6ADA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:10:43 +0200 (CEST)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzSk-0003nO-EU
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQU-00010x-8g
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:22 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQN-0006Hf-6O
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:19 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so480494pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/YZiQOWpMFmRWAnx16Cxj31dHDc5RxHIDs7FILi+mNg=;
 b=qtjh+Iqf3eAXJJhjp7Rm+ZPCHXeZCZSQGP8VvMNqfqcCzvokPLOTAhCTuJTxITAPaN
 Xs7uwwYTJONR/Lb8s2xEZpxvM60oPsj4hm6E0/qS31YwKUalQ5+s6MH3DCYoCk1dcyh/
 mUalb366wU0QRARdddFsUKuqMx3HvmtJdxq1D+oY5PXq4WCytP52OHfmm3+lW4xFVA68
 RlOEMb+pr/Fo2VKqOnaBu9LGiNVKAmLuIIwN7p7v/qY8NYLmFgVv/x+4aKSLVPnHJDew
 4Ci5PsnRMFwuKxK3Vm9vLMB5KCLwyo1HHF7p19bS1oolre9GNnO5eJjs1HUiupeZK7V8
 7+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/YZiQOWpMFmRWAnx16Cxj31dHDc5RxHIDs7FILi+mNg=;
 b=kjE37z2Pv+iLNgAPM2RUbB1z92V+1CP9eIakzoxWbYydwRvPBLCIko2LWvdll+wJL8
 k5rGexvJYJZhwO09lpb4pQ3rPBhJ4MloMv93x2YigIIg/+GhtMKa3pj7IReQtz8AvDsY
 0fUcFBXGgSlFyucyfdIVkTiDOWQOdTS2Y1q/xLoriql37wzKG9uJm1iwiIDpbFJXCkVY
 4TmGhWV8I7Vo/hr4pc46c+QBxMoy8Y6cV6xomgXBhTn3eEMdFXTfhRbp3KT4GlfiAVZw
 uZ5zpYudpgHhtDtwO7I/eXw0ZkxYHlRHRGo85W8OUAT3ZYY/jIOFhmeb2i5CdtpDuR8m
 WPhw==
X-Gm-Message-State: AOAM5311SlADrhHoHyMejPZsRlzeu1l4crXEvo+ReHEOlZVlu4wJJzd9
 VCQysjvwUMc6+sDdT0vdb4AQgei09nqpjw==
X-Google-Smtp-Source: ABdhPJxUNScOy8qHJK6KcNsrozRqiCbi262RBYCr7vU5vC+Jl75/tCH+DREyItDtTRveEpBM0mmxoA==
X-Received: by 2002:a17:90a:6402:: with SMTP id
 g2mr29756271pjj.82.1624918093367; 
 Mon, 28 Jun 2021 15:08:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm16030164pgh.34.2021.06.28.15.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:08:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/9] target/nios2: Use global cpu_R
Date: Mon, 28 Jun 2021 15:08:04 -0700
Message-Id: <20210628220810.2919600-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628220810.2919600-1-richard.henderson@linaro.org>
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not need to copy this into DisasContext.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 73 +++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 39538e1870..6bdd388bd8 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -97,7 +97,6 @@
     }
 
 typedef struct DisasContext {
-    TCGv             *cpu_R;
     TCGv_i32          zero;
     int               is_jmp;
     target_ulong      pc;
@@ -106,6 +105,8 @@ typedef struct DisasContext {
     bool              singlestep_enabled;
 } DisasContext;
 
+static TCGv cpu_R[NUM_CORE_REGS];
+
 typedef struct Nios2Instruction {
     void     (*handler)(DisasContext *dc, uint32_t code, uint32_t flags);
     uint32_t  flags;
@@ -134,7 +135,7 @@ static TCGv load_zero(DisasContext *dc)
 static TCGv load_gpr(DisasContext *dc, uint8_t reg)
 {
     if (likely(reg != R_ZERO)) {
-        return dc->cpu_R[reg];
+        return cpu_R[reg];
     } else {
         return load_zero(dc);
     }
@@ -145,7 +146,7 @@ static void t_gen_helper_raise_exception(DisasContext *dc,
 {
     TCGv_i32 tmp = tcg_const_i32(index);
 
-    tcg_gen_movi_tl(dc->cpu_R[R_PC], dc->pc);
+    tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
     gen_helper_raise_exception(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
     dc->is_jmp = DISAS_NORETURN;
@@ -170,10 +171,10 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 
     if (use_goto_tb(dc, dest)) {
         tcg_gen_goto_tb(n);
-        tcg_gen_movi_tl(dc->cpu_R[R_PC], dest);
+        tcg_gen_movi_tl(cpu_R[R_PC], dest);
         tcg_gen_exit_tb(tb, n);
     } else {
-        tcg_gen_movi_tl(dc->cpu_R[R_PC], dest);
+        tcg_gen_movi_tl(cpu_R[R_PC], dest);
         tcg_gen_exit_tb(NULL, 0);
     }
 }
@@ -212,7 +213,7 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_movi_tl(dc->cpu_R[R_RA], dc->pc + 4);
+    tcg_gen_movi_tl(cpu_R[R_RA], dc->pc + 4);
     jmpi(dc, code, flags);
 }
 
@@ -234,7 +235,7 @@ static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
      *          the Nios2 CPU.
      */
     if (likely(instr.b != R_ZERO)) {
-        data = dc->cpu_R[instr.b];
+        data = cpu_R[instr.b];
     } else {
         data = tcg_temp_new();
     }
@@ -275,7 +276,7 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     TCGLabel *l1 = gen_new_label();
-    tcg_gen_brcond_tl(flags, dc->cpu_R[instr.a], dc->cpu_R[instr.b], l1);
+    tcg_gen_brcond_tl(flags, cpu_R[instr.a], cpu_R[instr.b], l1);
     gen_goto_tb(dc, 0, dc->pc + 4);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->pc + 4 + (instr.imm16.s & -4));
@@ -287,8 +288,7 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
 static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)         \
 {                                                                            \
     I_TYPE(instr, (code));                                                   \
-    tcg_gen_setcondi_tl(flags, (dc)->cpu_R[instr.b], (dc)->cpu_R[instr.a],   \
-                        (op3));                                              \
+    tcg_gen_setcondi_tl(flags, cpu_R[instr.b], cpu_R[instr.a], (op3));       \
 }
 
 gen_i_cmpxx(gen_cmpxxsi, instr.imm16.s)
@@ -302,10 +302,9 @@ static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)        \
     if (unlikely(instr.b == R_ZERO)) { /* Store to R_ZERO is ignored */     \
         return;                                                             \
     } else if (instr.a == R_ZERO) { /* MOVxI optimizations */               \
-        tcg_gen_movi_tl(dc->cpu_R[instr.b], (resimm) ? (op3) : 0);          \
+        tcg_gen_movi_tl(cpu_R[instr.b], (resimm) ? (op3) : 0);              \
     } else {                                                                \
-        tcg_gen_##insn##_tl((dc)->cpu_R[instr.b], (dc)->cpu_R[instr.a],     \
-                            (op3));                                         \
+        tcg_gen_##insn##_tl(cpu_R[instr.b], cpu_R[instr.a], (op3));         \
     }                                                                       \
 }
 
@@ -400,8 +399,8 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(dc->cpu_R[CR_STATUS], dc->cpu_R[CR_ESTATUS]);
-    tcg_gen_mov_tl(dc->cpu_R[R_PC], dc->cpu_R[R_EA]);
+    tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
+    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
 
     dc->is_jmp = DISAS_JUMP;
 }
@@ -409,7 +408,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ra */
 static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(dc->cpu_R[R_PC], dc->cpu_R[R_RA]);
+    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_RA]);
 
     dc->is_jmp = DISAS_JUMP;
 }
@@ -417,7 +416,7 @@ static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ba */
 static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(dc->cpu_R[R_PC], dc->cpu_R[R_BA]);
+    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_BA]);
 
     dc->is_jmp = DISAS_JUMP;
 }
@@ -427,7 +426,7 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(dc->cpu_R[R_PC], load_gpr(dc, instr.a));
+    tcg_gen_mov_tl(cpu_R[R_PC], load_gpr(dc, instr.a));
 
     dc->is_jmp = DISAS_JUMP;
 }
@@ -438,7 +437,7 @@ static void nextpc(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     if (likely(instr.c != R_ZERO)) {
-        tcg_gen_movi_tl(dc->cpu_R[instr.c], dc->pc + 4);
+        tcg_gen_movi_tl(cpu_R[instr.c], dc->pc + 4);
     }
 }
 
@@ -450,8 +449,8 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(dc->cpu_R[R_PC], load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(dc->cpu_R[R_RA], dc->pc + 4);
+    tcg_gen_mov_tl(cpu_R[R_PC], load_gpr(dc, instr.a));
+    tcg_gen_movi_tl(cpu_R[R_RA], dc->pc + 4);
 
     dc->is_jmp = DISAS_JUMP;
 }
@@ -470,10 +469,10 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
     {
 #if !defined(CONFIG_USER_ONLY)
         if (likely(instr.c != R_ZERO)) {
-            tcg_gen_mov_tl(dc->cpu_R[instr.c], dc->cpu_R[instr.imm5 + CR_BASE]);
+            tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
 #ifdef DEBUG_MMU
             TCGv_i32 tmp = tcg_const_i32(instr.imm5 + CR_BASE);
-            gen_helper_mmu_read_debug(dc->cpu_R[instr.c], cpu_env, tmp);
+            gen_helper_mmu_read_debug(cpu_R[instr.c], cpu_env, tmp);
             tcg_temp_free_i32(tmp);
 #endif
         }
@@ -483,7 +482,7 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 
     default:
         if (likely(instr.c != R_ZERO)) {
-            tcg_gen_mov_tl(dc->cpu_R[instr.c], dc->cpu_R[instr.imm5 + CR_BASE]);
+            tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
         }
         break;
     }
@@ -510,7 +509,7 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
     }
 
     default:
-        tcg_gen_mov_tl(dc->cpu_R[instr.imm5 + CR_BASE], load_gpr(dc, instr.a));
+        tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], load_gpr(dc, instr.a));
         break;
     }
 
@@ -531,8 +530,8 @@ static void gen_cmpxx(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
     if (likely(instr.c != R_ZERO)) {
-        tcg_gen_setcond_tl(flags, dc->cpu_R[instr.c], dc->cpu_R[instr.a],
-                           dc->cpu_R[instr.b]);
+        tcg_gen_setcond_tl(flags, cpu_R[instr.c], cpu_R[instr.a],
+                           cpu_R[instr.b]);
     }
 }
 
@@ -542,8 +541,7 @@ static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
 {                                                                          \
     R_TYPE(instr, (code));                                                 \
     if (likely(instr.c != R_ZERO)) {                                       \
-        tcg_gen_##insn((dc)->cpu_R[instr.c], load_gpr((dc), instr.a),      \
-                       (op3));                                             \
+        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), (op3));    \
     }                                                                      \
 }
 
@@ -567,8 +565,8 @@ static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)   \
     R_TYPE(instr, (code));                                             \
     if (likely(instr.c != R_ZERO)) {                                   \
         TCGv t0 = tcg_temp_new();                                      \
-        tcg_gen_##insn(t0, dc->cpu_R[instr.c],                         \
-                       load_gpr(dc, instr.a), load_gpr(dc, instr.b)); \
+        tcg_gen_##insn(t0, cpu_R[instr.c],                             \
+                       load_gpr(dc, instr.a), load_gpr(dc, instr.b));  \
         tcg_temp_free(t0);                                             \
     }                                                                  \
 }
@@ -584,7 +582,7 @@ static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
     if (likely(instr.c != R_ZERO)) {                                       \
         TCGv t0 = tcg_temp_new();                                          \
         tcg_gen_andi_tl(t0, load_gpr((dc), instr.b), 31);                  \
-        tcg_gen_##insn((dc)->cpu_R[instr.c], load_gpr((dc), instr.a), t0); \
+        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), t0);       \
         tcg_temp_free(t0);                                                 \
     }                                                                      \
 }
@@ -618,8 +616,8 @@ static void divs(DisasContext *dc, uint32_t code, uint32_t flags)
     tcg_gen_or_tl(t2, t2, t3);
     tcg_gen_movi_tl(t3, 0);
     tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
-    tcg_gen_div_tl(dc->cpu_R[instr.c], t0, t1);
-    tcg_gen_ext32s_tl(dc->cpu_R[instr.c], dc->cpu_R[instr.c]);
+    tcg_gen_div_tl(cpu_R[instr.c], t0, t1);
+    tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
 
     tcg_temp_free(t3);
     tcg_temp_free(t2);
@@ -644,8 +642,8 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
     tcg_gen_ext32u_tl(t0, load_gpr(dc, instr.a));
     tcg_gen_ext32u_tl(t1, load_gpr(dc, instr.b));
     tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
-    tcg_gen_divu_tl(dc->cpu_R[instr.c], t0, t1);
-    tcg_gen_ext32s_tl(dc->cpu_R[instr.c], dc->cpu_R[instr.c]);
+    tcg_gen_divu_tl(cpu_R[instr.c], t0, t1);
+    tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
 
     tcg_temp_free(t3);
     tcg_temp_free(t2);
@@ -794,8 +792,6 @@ static const char * const regnames[] = {
     "rpc"
 };
 
-static TCGv cpu_R[NUM_CORE_REGS];
-
 #include "exec/gen-icount.h"
 
 static void gen_exception(DisasContext *dc, uint32_t excp)
@@ -816,7 +812,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     int num_insns;
 
     /* Initialize DC */
-    dc->cpu_R   = cpu_R;
     dc->is_jmp  = DISAS_NEXT;
     dc->pc      = tb->pc;
     dc->tb      = tb;
-- 
2.25.1


