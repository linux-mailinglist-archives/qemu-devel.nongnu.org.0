Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684CF50A4BF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:55:38 +0200 (CEST)
Received: from localhost ([::1]:60244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ9d-0006B0-HI
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcw-0005NJ-03
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:50 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYct-00076E-Bb
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:49 -0400
Received: by mail-io1-xd31.google.com with SMTP id e194so5607658iof.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LYXN2H7RAxWIk+WrXFWxWMCl36JU50/w2TVFTCJsPfI=;
 b=ZIbKqlmmjphxwc6slT6ZrTB5iSOzO097fpDBy646dG9MAq7YdL4gwswvXXXqgMg0ee
 PDHHd1fumVvHhh61CU2MmIjVGEoVslqPffTHCo+cEAsF+OouNJaR6SxxFba2h0db2Ufv
 5YlaOL9lQ2H351atzYG4yLKAVaWu34zFJGYG+77c8PxAi5qTUv/DaHqQQ2OPrsXfh8sS
 1cjjcJFK7Lskwolk9PZQzddzqC+wqdxVIIPaIZudmRHsumYlOTiPCURyKwB7XHukP4oi
 OG0QVZPPC5DlsGDnXeYMOT1mlcw5k3+psD03HyEcTfhssxMSBOj+7uZHRGcP1Xtn8uHm
 OZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYXN2H7RAxWIk+WrXFWxWMCl36JU50/w2TVFTCJsPfI=;
 b=f1H1b4KwJ09LZIAIo/t4r8hstTkHUBDdZRxNnLbQAnHR0fV1veA2VwHFuLva5c1X5h
 +fBr1LVnqyvY+p9UdGQ6HkCr8oKpIskmKVYvEAykozS6s1oQQ0Tdf8+yR+tYn5U/BH2E
 EbM7TRneEby0MB79ol8ls5uOG+pZ6qMT+MUVW3ONFVAf2gzMsBeUGHaHN419zAHvo5VE
 Kw+HNBVHEembjvxTNLj85Ixc+JyKinMMuZY7ZHiDxo9YTAumt6rjaDtHSrVSOrUDgB/3
 Fh0h84KfEYbHQLLVeQUW+Re0fkBCVsPYzJCGGaXsy2DpZZM2hTpRrJRSx7Ql8/e9WiiM
 GyHw==
X-Gm-Message-State: AOAM53093ioOwlXl2FvW3LYcyHRyGJZiggd9XIEAWoSXHHx6KV7NAzz/
 vzBFU/tAaa9bq71T0rt1JRGDUhvVHmUxXw==
X-Google-Smtp-Source: ABdhPJyk6TJO07kD3dikl6G05/ZHILQ+/eU6zzj3ivNrMffUHir0gEfTUDUtQ8zh7RAJnIjbMqCarQ==
X-Received: by 2002:a05:6638:40a5:b0:326:3bad:fe1 with SMTP id
 m37-20020a05663840a500b003263bad0fe1mr41049jam.127.1650554506331; 
 Thu, 21 Apr 2022 08:21:46 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 44/64] target/nios2: Split out helpers for gen_* translate
 macros
Date: Thu, 21 Apr 2022 08:17:15 -0700
Message-Id: <20220421151735.31996-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd31.google.com
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

Do as little work as possible within the macros.
Split out helper functions and pass in arguments instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 215 +++++++++++++++++++++++++--------------
 1 file changed, 141 insertions(+), 74 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index a3c63dbbbd..74672101ca 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -71,6 +71,21 @@ typedef struct {
         .a     = extract32((code), 27, 5), \
     }
 
+static target_ulong imm_unsigned(const InstrIType *i)
+{
+    return i->imm16.u;
+}
+
+static target_ulong imm_signed(const InstrIType *i)
+{
+    return i->imm16.s;
+}
+
+static target_ulong imm_shifted(const InstrIType *i)
+{
+    return i->imm16.u << 16;
+}
+
 /* R-Type instruction parsing */
 typedef struct {
     uint8_t op;
@@ -268,40 +283,62 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
 }
 
 /* Comparison instructions */
-#define gen_i_cmpxx(fname, op3)                                              \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)         \
-{                                                                            \
-    I_TYPE(instr, (code));                                                   \
-    tcg_gen_setcondi_tl(flags, cpu_R[instr.b], cpu_R[instr.a], (op3));       \
+static void do_i_cmpxx(DisasContext *dc, uint32_t insn, TCGCond cond,
+                       target_ulong (*imm)(const InstrIType *))
+{
+    I_TYPE(instr, insn);
+
+    if (likely(instr.b != R_ZERO)) {
+        tcg_gen_setcondi_tl(cond, cpu_R[instr.b],
+                            load_gpr(dc, instr.a), imm(&instr));
+    }
 }
 
-gen_i_cmpxx(gen_cmpxxsi, instr.imm16.s)
-gen_i_cmpxx(gen_cmpxxui, instr.imm16.u)
+#define gen_i_cmpxx(fname, imm)                                             \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_i_cmpxx(dc, code, flags, imm); }
+
+gen_i_cmpxx(gen_cmpxxsi, imm_signed)
+gen_i_cmpxx(gen_cmpxxui, imm_unsigned)
 
 /* Math/logic instructions */
-#define gen_i_math_logic(fname, insn, resimm, op3)                          \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)        \
-{                                                                           \
-    I_TYPE(instr, (code));                                                  \
-    if (unlikely(instr.b == R_ZERO)) { /* Store to R_ZERO is ignored */     \
-        return;                                                             \
-    } else if (instr.a == R_ZERO) { /* MOVxI optimizations */               \
-        tcg_gen_movi_tl(cpu_R[instr.b], (resimm) ? (op3) : 0);              \
-    } else {                                                                \
-        tcg_gen_##insn##_tl(cpu_R[instr.b], cpu_R[instr.a], (op3));         \
-    }                                                                       \
+static void do_i_math_logic(DisasContext *dc, uint32_t insn,
+                            void (*fn)(TCGv, TCGv, target_long),
+                            target_ulong (*imm)(const InstrIType *),
+                            bool x_op_0_eq_x)
+{
+    I_TYPE(instr, insn);
+    target_ulong val;
+
+    if (unlikely(instr.b == R_ZERO)) {
+        /* Store to R_ZERO is ignored -- this catches the canonical NOP. */
+        return;
+    }
+
+    val = imm(&instr);
+
+    if (instr.a == R_ZERO) {
+        /* This catches the canonical expansions of movi and movhi. */
+        tcg_gen_movi_tl(cpu_R[instr.b], x_op_0_eq_x ? val : 0);
+    } else {
+        fn(cpu_R[instr.b], cpu_R[instr.a], val);
+    }
 }
 
-gen_i_math_logic(addi,  addi, 1, instr.imm16.s)
-gen_i_math_logic(muli,  muli, 0, instr.imm16.s)
+#define gen_i_math_logic(fname, insn, x_op_0, imm)                          \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_i_math_logic(dc, code, tcg_gen_##insn##_tl, imm, x_op_0); }
 
-gen_i_math_logic(andi,  andi, 0, instr.imm16.u)
-gen_i_math_logic(ori,   ori,  1, instr.imm16.u)
-gen_i_math_logic(xori,  xori, 1, instr.imm16.u)
+gen_i_math_logic(addi,  addi, 1, imm_signed)
+gen_i_math_logic(muli,  muli, 0, imm_signed)
 
-gen_i_math_logic(andhi, andi, 0, instr.imm16.u << 16)
-gen_i_math_logic(orhi , ori,  1, instr.imm16.u << 16)
-gen_i_math_logic(xorhi, xori, 1, instr.imm16.u << 16)
+gen_i_math_logic(andi,  andi, 0, imm_unsigned)
+gen_i_math_logic(ori,   ori,  1, imm_unsigned)
+gen_i_math_logic(xori,  xori, 1, imm_unsigned)
+
+gen_i_math_logic(andhi, andi, 0, imm_shifted)
+gen_i_math_logic(orhi , ori,  1, imm_shifted)
+gen_i_math_logic(xorhi, xori, 1, imm_shifted)
 
 /* Prototype only, defined below */
 static void handle_r_type_instr(DisasContext *dc, uint32_t code,
@@ -588,62 +625,92 @@ static void gen_cmpxx(DisasContext *dc, uint32_t code, uint32_t flags)
 }
 
 /* Math/logic instructions */
-#define gen_r_math_logic(fname, insn, op3)                                 \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
-{                                                                          \
-    R_TYPE(instr, (code));                                                 \
-    if (likely(instr.c != R_ZERO)) {                                       \
-        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), (op3));    \
-    }                                                                      \
+static void do_ri_math_logic(DisasContext *dc, uint32_t insn,
+                             void (*fn)(TCGv, TCGv, int32_t))
+{
+    R_TYPE(instr, insn);
+
+    if (likely(instr.c != R_ZERO)) {
+        fn(cpu_R[instr.c], load_gpr(dc, instr.a), instr.imm5);
+    }
 }
 
-gen_r_math_logic(add,  add_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(sub,  sub_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(mul,  mul_tl,   load_gpr(dc, instr.b))
+static void do_rr_math_logic(DisasContext *dc, uint32_t insn,
+                             void (*fn)(TCGv, TCGv, TCGv))
+{
+    R_TYPE(instr, insn);
 
-gen_r_math_logic(and,  and_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(or,   or_tl,    load_gpr(dc, instr.b))
-gen_r_math_logic(xor,  xor_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(nor,  nor_tl,   load_gpr(dc, instr.b))
-
-gen_r_math_logic(srai, sari_tl,  instr.imm5)
-gen_r_math_logic(srli, shri_tl,  instr.imm5)
-gen_r_math_logic(slli, shli_tl,  instr.imm5)
-gen_r_math_logic(roli, rotli_tl, instr.imm5)
-
-#define gen_r_mul(fname, insn)                                         \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)   \
-{                                                                      \
-    R_TYPE(instr, (code));                                             \
-    if (likely(instr.c != R_ZERO)) {                                   \
-        TCGv t0 = tcg_temp_new();                                      \
-        tcg_gen_##insn(t0, cpu_R[instr.c],                             \
-                       load_gpr(dc, instr.a), load_gpr(dc, instr.b));  \
-        tcg_temp_free(t0);                                             \
-    }                                                                  \
+    if (likely(instr.c != R_ZERO)) {
+        fn(cpu_R[instr.c], load_gpr(dc, instr.a), load_gpr(dc, instr.b));
+    }
 }
 
-gen_r_mul(mulxss, muls2_tl)
-gen_r_mul(mulxuu, mulu2_tl)
-gen_r_mul(mulxsu, mulsu2_tl)
+#define gen_ri_math_logic(fname, insn)                                      \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_ri_math_logic(dc, code, tcg_gen_##insn##_tl); }
 
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
+#define gen_rr_math_logic(fname, insn)                                      \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_rr_math_logic(dc, code, tcg_gen_##insn##_tl); }
+
+gen_rr_math_logic(add,  add)
+gen_rr_math_logic(sub,  sub)
+gen_rr_math_logic(mul,  mul)
+
+gen_rr_math_logic(and,  and)
+gen_rr_math_logic(or,   or)
+gen_rr_math_logic(xor,  xor)
+gen_rr_math_logic(nor,  nor)
+
+gen_ri_math_logic(srai, sari)
+gen_ri_math_logic(srli, shri)
+gen_ri_math_logic(slli, shli)
+gen_ri_math_logic(roli, rotli)
+
+static void do_rr_mul_high(DisasContext *dc, uint32_t insn,
+                           void (*fn)(TCGv, TCGv, TCGv, TCGv))
+{
+    R_TYPE(instr, insn);
+
+    if (likely(instr.c != R_ZERO)) {
+        TCGv discard = tcg_temp_new();
+        fn(discard, cpu_R[instr.c], load_gpr(dc, instr.a),
+           load_gpr(dc, instr.b));
+        tcg_temp_free(discard);
+    }
 }
 
-gen_r_shift_s(sra, sar_tl)
-gen_r_shift_s(srl, shr_tl)
-gen_r_shift_s(sll, shl_tl)
-gen_r_shift_s(rol, rotl_tl)
-gen_r_shift_s(ror, rotr_tl)
+#define gen_rr_mul_high(fname, insn)                                        \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_rr_mul_high(dc, code, tcg_gen_##insn##_tl); }
+
+gen_rr_mul_high(mulxss, muls2)
+gen_rr_mul_high(mulxuu, mulu2)
+gen_rr_mul_high(mulxsu, mulsu2)
+
+static void do_rr_shift(DisasContext *dc, uint32_t insn,
+                        void (*fn)(TCGv, TCGv, TCGv))
+{
+    R_TYPE(instr, insn);
+
+    if (likely(instr.c != R_ZERO)) {
+        TCGv sh = tcg_temp_new();
+
+        tcg_gen_andi_tl(sh, load_gpr(dc, instr.b), 31);
+        fn(cpu_R[instr.c], load_gpr(dc, instr.a), sh);
+        tcg_temp_free(sh);
+    }
+}
+
+#define gen_rr_shift(fname, insn)                                           \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_rr_shift(dc, code, tcg_gen_##insn##_tl); }
+
+gen_rr_shift(sra, sar)
+gen_rr_shift(srl, shr)
+gen_rr_shift(sll, shl)
+gen_rr_shift(rol, rotl)
+gen_rr_shift(ror, rotr)
 
 static void divs(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-- 
2.34.1


