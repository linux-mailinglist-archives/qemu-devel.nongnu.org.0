Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE83B7841
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:08:49 +0200 (CEST)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJ6G-0008JA-V0
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0007z6-9a
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:16 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIst-0000qX-5a
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:09 -0400
Received: by mail-pf1-x430.google.com with SMTP id 21so111562pfp.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/YZiQOWpMFmRWAnx16Cxj31dHDc5RxHIDs7FILi+mNg=;
 b=SdsOEyjx7ILb5UddQCShpNkJ1jY8L7qJfkfignMufduNggsDmfKwwB06/o2TCKfyNQ
 ZGY8b4gyQgjPzRIDsPCMyHV11/w7bi10Tj9XxT2WT2x4wjw3dxZtDMDr2LXZXFJUGjlA
 EDB87hzEC9g4KfWqDhf+pZTWuIphfmwJFhURpk17WZK6H/YqhLbPbrYxca7nWXdmHm7x
 SP8FOuQmbY17zWUPUILpiQIbdfsWUm4GIQw09kCoV4KoyTyJ9KBhYDqWfpglqhM47dbD
 vrIcbVlj1pZleLEbW/wsGkZQ2HceiFzWNc0VGG8hfluusBbENGuYbh15k/50b6iD5XP8
 nOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/YZiQOWpMFmRWAnx16Cxj31dHDc5RxHIDs7FILi+mNg=;
 b=bh1RmPqZyfiC3OSke3u97kaVYHo/5HBZMx4IgSLuNoRekdUAExiIlMj+1QWvE0xOek
 fx6Vw0o7HErJk2xrZ9tUFcqKUf+HNPe/fS0DtZSYfswAbNQl9NQ6jW/XUnkKvOqc/Y1w
 k7x1Av+M7v11KI4nmVZMXrynNQOj8UTi3rYlOxBIwCkBzS20EK1/ILKd7nKxrfun6/VF
 91Ga/fKRNvFoNlewyvgTfTrITvYC9EMRWDDgE9lCWPUdahsaHXyfFmLRkDzQWbe3fOHN
 njd0339QeWzA+DyBCDNYTV9hm53bmfn64JL1yh6wJnNTb2WlKlV5FtvCykNjj2uOjvdi
 eadQ==
X-Gm-Message-State: AOAM532JDqnvQF8evl5Xpw+hOGDvLosDP+4HL7ztYBagXGyxiwr06RIP
 mj2VwhbC7h0hv/y0azJdsE9CZ1H49Xye3Q==
X-Google-Smtp-Source: ABdhPJw2uVLSXlP1Oqh75IpN4hKp7YfiqU5N6O3x2uvxGSRiwLKzeYca99HRsKOnaUfrHgBNowS2HA==
X-Received: by 2002:a63:4c19:: with SMTP id z25mr29760079pga.160.1624992897832; 
 Tue, 29 Jun 2021 11:54:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:54:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/63] target/nios2: Use global cpu_R
Date: Tue, 29 Jun 2021 11:53:55 -0700
Message-Id: <20210629185455.3131172-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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


