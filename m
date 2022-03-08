Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9364D114B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:49:46 +0100 (CET)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUbJ-0006ea-D8
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:49:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9K-0005GV-UD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:52 -0500
Received: from [2607:f8b0:4864:20::436] (port=36738
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9G-0006RS-IE
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:49 -0500
Received: by mail-pf1-x436.google.com with SMTP id z16so16597645pfh.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m9ZxJ7xCPOqabHZoycs1bdRfS3ZU/NWAbCAcKP/hjkY=;
 b=ePZ6byWbM/fT4QRwzET7CjRJb8RGDhfff/PQNdN7IU8MkU6nVM8RqqQ15nQourK2Pn
 RQL+a4WNBdhjeQ9clXWdRG4PHIZFLn6/wM3fn5QCM7KZKRGCMMRDawr7Iw6neypsfIxG
 cL00rObJ8uQ1T9HaQoRb38asPuC4GTASRHk4GDIIT1TM25guN1lBfuWxd7NjXIYhqa52
 51hKhHB7wX/4VKDYy/2T5r/Iu8Wr3j4rpRqwbXiKgq/BELZ0RHp0siWHW8fO8SCYh1J6
 /zSkZRzJWvsfE/6qmotTQlU4FSdspwJbNelO/w90+MSBxuBKuVDJoMbA6Cpb9AVWKWhs
 8/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m9ZxJ7xCPOqabHZoycs1bdRfS3ZU/NWAbCAcKP/hjkY=;
 b=qxF8kEaHi7shodRuPdx1GcPKrAi5RlBcB1QswjkZoWNnlEt9YZxn3mNveZiTLEeNmQ
 pBJbntty6U+jn0AAXCGOrES0KxCdxLGmc7eMkbr7Jepyt8y6ShhW5ZgBBvMOIT19mCUF
 qFYAciQknlTBozrfn/Ck2nekvVrWaE8uyYQdzdEv+dNAzADoPcJIQjegxTU47aNurEQM
 9QksVCv1iRFrcV8usREZL3hqCXGc1hpwezU0bqrK0Oa4q0svqYRxKlRropBRbhcj5AUY
 Hk9bHdsx8n2pnnjMVzIA2qH9skhPAGfe3s0AmghhvGSQXIwZyt/MVFVhYZmQ8bvp+bbJ
 jyJw==
X-Gm-Message-State: AOAM531eNc9D/a/50bvLCX14oNIwMy3d+SYg6R7rzGzZP3k9EwPF4BgH
 Ty791p3x0Wrju0aiKwarU9mL1nFV9O3vRw==
X-Google-Smtp-Source: ABdhPJwogS3BoovHr4H4HNPW+2/lmKq+wHWJSVimJ6Nyqd4QRMviCKqBfpwHvZSGcShU3lhXWPSNOQ==
X-Received: by 2002:a63:4560:0:b0:370:1f21:36b8 with SMTP id
 u32-20020a634560000000b003701f2136b8mr12837221pgk.181.1646724043833; 
 Mon, 07 Mar 2022 23:20:43 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/33] target/nios2: Introduce dest_gpr
Date: Mon,  7 Mar 2022 21:19:54 -1000
Message-Id: <20220308072005.307955-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Constrain all references to cpu_R[] to load_gpr and dest_gpr.
This will be required for supporting shadow register sets.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 144 +++++++++++++++------------------------
 1 file changed, 55 insertions(+), 89 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6ff9c18502..7c2ad02685 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -100,6 +100,7 @@ typedef struct DisasContext {
     DisasContextBase  base;
     target_ulong      pc;
     int               mem_idx;
+    TCGv              sink;
     const ControlRegState *cr_state;
 } DisasContext;
 
@@ -132,6 +133,18 @@ static TCGv load_gpr(DisasContext *dc, unsigned reg)
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
@@ -190,7 +203,7 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
+    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     jmpi(dc, code, flags);
 }
 
@@ -203,27 +216,10 @@ static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
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
 
@@ -253,7 +249,7 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     TCGLabel *l1 = gen_new_label();
-    tcg_gen_brcond_tl(flags, cpu_R[instr.a], cpu_R[instr.b], l1);
+    tcg_gen_brcond_tl(flags, load_gpr(dc, instr.a), load_gpr(dc, instr.b), l1);
     gen_goto_tb(dc, 0, dc->base.pc_next);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->base.pc_next + (instr.imm16.s & -4));
@@ -261,11 +257,12 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
 }
 
 /* Comparison instructions */
-#define gen_i_cmpxx(fname, op3)                                              \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)         \
-{                                                                            \
-    I_TYPE(instr, (code));                                                   \
-    tcg_gen_setcondi_tl(flags, cpu_R[instr.b], cpu_R[instr.a], (op3));       \
+#define gen_i_cmpxx(fname, op3)                                         \
+static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+{                                                                       \
+    I_TYPE(instr, (code));                                              \
+    tcg_gen_setcondi_tl(flags, dest_gpr(dc, instr.b),                   \
+                        load_gpr(dc, instr.a), (op3));                  \
 }
 
 gen_i_cmpxx(gen_cmpxxsi, instr.imm16.s)
@@ -276,13 +273,7 @@ gen_i_cmpxx(gen_cmpxxui, instr.imm16.u)
 static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)        \
 {                                                                           \
     I_TYPE(instr, (code));                                                  \
-    if (unlikely(instr.b == R_ZERO)) { /* Store to R_ZERO is ignored */     \
-        return;                                                             \
-    } else if (instr.a == R_ZERO) { /* MOVxI optimizations */               \
-        tcg_gen_movi_tl(cpu_R[instr.b], (resimm) ? (op3) : 0);              \
-    } else {                                                                \
-        tcg_gen_##insn##_tl(cpu_R[instr.b], cpu_R[instr.a], (op3));         \
-    }                                                                       \
+    tcg_gen_##insn##_tl(dest_gpr(dc, instr.b), load_gpr(dc, instr.a), (op3)); \
 }
 
 gen_i_math_logic(addi,  addi, 1, instr.imm16.s)
@@ -383,7 +374,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    gen_helper_eret(cpu_env, cpu_R[R_EA]);
+    gen_helper_eret(cpu_env, load_gpr(dc, R_EA));
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
@@ -391,16 +382,14 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ra */
 static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_RA]);
-
+    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, R_RA));
     dc->base.is_jmp = DISAS_JUMP;
 }
 
 /* PC <- ba */
 static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_BA]);
-
+    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, R_BA));
     dc->base.is_jmp = DISAS_JUMP;
 }
 
@@ -410,7 +399,6 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-
     dc->base.is_jmp = DISAS_JUMP;
 }
 
@@ -419,9 +407,7 @@ static void nextpc(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    if (likely(instr.c != R_ZERO)) {
-        tcg_gen_movi_tl(cpu_R[instr.c], dc->base.pc_next);
-    }
+    tcg_gen_movi_tl(dest_gpr(dc, instr.c), dc->base.pc_next);
 }
 
 /*
@@ -433,7 +419,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
+    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
 
     dc->base.is_jmp = DISAS_JUMP;
 }
@@ -449,15 +435,11 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
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
 
@@ -475,12 +457,12 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
         t2 = tcg_temp_new();
         tcg_gen_ld_tl(t1, cpu_env, offsetof(CPUNios2State, ipending));
         tcg_gen_ld_tl(t2, cpu_env, offsetof(CPUNios2State, ienable));
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
@@ -556,10 +538,8 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
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
@@ -567,9 +547,7 @@ static void gen_cmpxx(DisasContext *dc, uint32_t code, uint32_t flags)
 static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
 {                                                                          \
     R_TYPE(instr, (code));                                                 \
-    if (likely(instr.c != R_ZERO)) {                                       \
-        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), (op3));    \
-    }                                                                      \
+    tcg_gen_##insn(dest_gpr(dc, instr.c), load_gpr(dc, instr.a), (op3));   \
 }
 
 gen_r_math_logic(add,  add_tl,   load_gpr(dc, instr.b))
@@ -590,28 +568,24 @@ gen_r_math_logic(roli, rotli_tl, instr.imm5)
 static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)   \
 {                                                                      \
     R_TYPE(instr, (code));                                             \
-    if (likely(instr.c != R_ZERO)) {                                   \
-        TCGv t0 = tcg_temp_new();                                      \
-        tcg_gen_##insn(t0, cpu_R[instr.c],                             \
-                       load_gpr(dc, instr.a), load_gpr(dc, instr.b));  \
-        tcg_temp_free(t0);                                             \
-    }                                                                  \
+    TCGv t0 = tcg_temp_new();                                          \
+    tcg_gen_##insn(t0, dest_gpr(dc, instr.c),                          \
+                   load_gpr(dc, instr.a), load_gpr(dc, instr.b));      \
+    tcg_temp_free(t0);                                                 \
 }
 
 gen_r_mul(mulxss, muls2_tl)
 gen_r_mul(mulxuu, mulu2_tl)
 gen_r_mul(mulxsu, mulsu2_tl)
 
-#define gen_r_shift_s(fname, insn)                                         \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
-{                                                                          \
-    R_TYPE(instr, (code));                                                 \
-    if (likely(instr.c != R_ZERO)) {                                       \
-        TCGv t0 = tcg_temp_new();                                          \
-        tcg_gen_andi_tl(t0, load_gpr((dc), instr.b), 31);                  \
-        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), t0);       \
-        tcg_temp_free(t0);                                                 \
-    }                                                                      \
+#define gen_r_shift_s(fname, insn)                                      \
+static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+{                                                                       \
+    R_TYPE(instr, (code));                                              \
+    TCGv t0 = tcg_temp_new();                                           \
+    tcg_gen_andi_tl(t0, load_gpr(dc, instr.b), 31);                     \
+    tcg_gen_##insn(dest_gpr(dc, instr.c), load_gpr(dc, instr.a), t0);   \
+    tcg_temp_free(t0);                                                  \
 }
 
 gen_r_shift_s(sra, sar_tl)
@@ -623,12 +597,6 @@ gen_r_shift_s(ror, rotr_tl)
 static void divs(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, (code));
-
-    /* Stores into R_ZERO are ignored */
-    if (unlikely(instr.c == R_ZERO)) {
-        return;
-    }
-
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
     TCGv t2 = tcg_temp_new();
@@ -643,8 +611,7 @@ static void divs(DisasContext *dc, uint32_t code, uint32_t flags)
     tcg_gen_or_tl(t2, t2, t3);
     tcg_gen_movi_tl(t3, 0);
     tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
-    tcg_gen_div_tl(cpu_R[instr.c], t0, t1);
-    tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
+    tcg_gen_div_tl(dest_gpr(dc, instr.c), t0, t1);
 
     tcg_temp_free(t3);
     tcg_temp_free(t2);
@@ -655,12 +622,6 @@ static void divs(DisasContext *dc, uint32_t code, uint32_t flags)
 static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, (code));
-
-    /* Stores into R_ZERO are ignored */
-    if (unlikely(instr.c == R_ZERO)) {
-        return;
-    }
-
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
     TCGv t2 = tcg_constant_tl(0);
@@ -669,8 +630,7 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
     tcg_gen_ext32u_tl(t0, load_gpr(dc, instr.a));
     tcg_gen_ext32u_tl(t1, load_gpr(dc, instr.b));
     tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
-    tcg_gen_divu_tl(cpu_R[instr.c], t0, t1);
-    tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
+    tcg_gen_divu_tl(dest_gpr(dc, instr.c), t0, t1);
 
     tcg_temp_free(t1);
     tcg_temp_free(t0);
@@ -849,8 +809,14 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
2.25.1


