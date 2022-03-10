Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E44D465F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:01:37 +0100 (CET)
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHU8-0008WT-LC
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:01:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxj-0006Et-6W
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:08 -0500
Received: from [2607:f8b0:4864:20::62f] (port=44793
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxh-00081I-70
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:06 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q11so4571389pln.11
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjl4pB0UOR++7sXmU/aZUMTVos+sgfIbyM2Yn1YOAwo=;
 b=PdzvJM+aG+amviE2rU06oocexqlR5KZxMmh442vNxzmNq1J1YAaGgKfwLekAol9NtE
 yoSnSQKlLJQolHyCSWTWMQJp0dwa0BzHhNI0JRZ/Nq2K/1rsR+GCyu34jii2FYYT+f5Z
 zcsISBlgegNOlqNqSXVRDI4PaSogr3tsD5aqd7S94V5hFsKoaMECcj1HjyTRhP0hZhj5
 yceBWV/fEQWqzlgL/PyxjJ+T+bZNtg07cbBvRyQ6izcTa7mWP8eqOjDPJUi7j/LJ/Vg1
 Suz4QEZM3cCZOtMHH34CjpPUoKXF99S0vMWoHFeKTcDn7zeJ9eHnDiDY2jckAqKUGnr6
 qRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjl4pB0UOR++7sXmU/aZUMTVos+sgfIbyM2Yn1YOAwo=;
 b=va5/YWunOMyudK+oqdkFQhH+d3wJJheQMk0bRxVvrJb/U29qLtgync6YMTb41IIXXX
 g4UzyrMyLzxCrx+zyJaA5UGV/L6eubGljNOx4z3+jlEEm4vVMiGhk/SADMG2RvlXt2eP
 2DhAbK5Xwg07HFWjy8v4z2o+aDPOBffqeo/ypt1d2u+2O5fSzkrqKdBHi+FBFUpv4zwx
 aWftoxyCEpv8+ntSKAf8A7kVZT0av8NeGbxs01S3Zj7vxi7qpI8/8QdYlWkSeV/v5cbV
 EHeZZYeyK1AniU7Z1smNVYaC3Z2RXTSIx7sXOeK4Ab2hYm3krvh7k0Z8vN+J4Tg+dJzn
 MChQ==
X-Gm-Message-State: AOAM531gqscREzUMVzV5zDctKcoXxS5RkYgnVUw9RAE73yO2CWS3ZVa4
 gPkvI4yCpDUby6UC/bWzOgmWAuKWTJqpMA==
X-Google-Smtp-Source: ABdhPJwzRsoF2G/1lSriOATzPfZmtF6WQb536rm1O89eHDsGZtucHfvJU3W8YoOE/jAOrVGCqZqkKw==
X-Received: by 2002:a17:902:ab4c:b0:151:eb86:dcb5 with SMTP id
 ij12-20020a170902ab4c00b00151eb86dcb5mr4472762plb.126.1646911683796; 
 Thu, 10 Mar 2022 03:28:03 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:28:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 32/48] target/nios2: Introduce dest_gpr
Date: Thu, 10 Mar 2022 03:27:09 -0800
Message-Id: <20220310112725.570053-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 153 ++++++++++++++-------------------------
 1 file changed, 55 insertions(+), 98 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 4ad47bb966..d5f2e98de9 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -101,6 +101,7 @@ typedef struct DisasContext {
     DisasContextBase  base;
     target_ulong      pc;
     int               mem_idx;
+    TCGv              sink;
     const ControlRegState *cr_state;
 } DisasContext;
 
@@ -133,6 +134,18 @@ static TCGv load_gpr(DisasContext *dc, unsigned reg)
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
@@ -191,7 +204,7 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
+    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     jmpi(dc, code, flags);
 }
 
@@ -204,27 +217,10 @@ static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
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
 
@@ -254,7 +250,7 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
     I_TYPE(instr, code);
 
     TCGLabel *l1 = gen_new_label();
-    tcg_gen_brcond_tl(flags, cpu_R[instr.a], cpu_R[instr.b], l1);
+    tcg_gen_brcond_tl(flags, load_gpr(dc, instr.a), load_gpr(dc, instr.b), l1);
     gen_goto_tb(dc, 0, dc->base.pc_next);
     gen_set_label(l1);
     gen_goto_tb(dc, 1, dc->base.pc_next + (instr.imm16.s & -4));
@@ -262,11 +258,12 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
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
@@ -277,13 +274,7 @@ gen_i_cmpxx(gen_cmpxxui, instr.imm16.u)
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
@@ -386,7 +377,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #else
     TCGv tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
-    gen_helper_eret(cpu_env, tmp, cpu_R[R_EA]);
+    gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
     tcg_temp_free(tmp);
 
     dc->base.is_jmp = DISAS_NORETURN;
@@ -396,8 +387,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ra */
 static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_RA]);
-
+    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, R_RA));
     dc->base.is_jmp = DISAS_JUMP;
 }
 
@@ -416,7 +406,7 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 #else
     TCGv tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_BSTATUS]));
-    gen_helper_eret(cpu_env, tmp, cpu_R[R_BA]);
+    gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_BA));
     tcg_temp_free(tmp);
 
     dc->base.is_jmp = DISAS_NORETURN;
@@ -429,7 +419,6 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-
     dc->base.is_jmp = DISAS_JUMP;
 }
 
@@ -438,9 +427,7 @@ static void nextpc(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    if (likely(instr.c != R_ZERO)) {
-        tcg_gen_movi_tl(cpu_R[instr.c], dc->base.pc_next);
-    }
+    tcg_gen_movi_tl(dest_gpr(dc, instr.c), dc->base.pc_next);
 }
 
 /*
@@ -452,7 +439,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
+    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
 
     dc->base.is_jmp = DISAS_JUMP;
 }
@@ -468,15 +455,11 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
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
 
@@ -494,12 +477,12 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
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
@@ -575,10 +558,8 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
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
@@ -586,9 +567,7 @@ static void gen_cmpxx(DisasContext *dc, uint32_t code, uint32_t flags)
 static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
 {                                                                          \
     R_TYPE(instr, (code));                                                 \
-    if (likely(instr.c != R_ZERO)) {                                       \
-        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), (op3));    \
-    }                                                                      \
+    tcg_gen_##insn(dest_gpr(dc, instr.c), load_gpr(dc, instr.a), (op3));   \
 }
 
 gen_r_math_logic(add,  add_tl,   load_gpr(dc, instr.b))
@@ -609,28 +588,24 @@ gen_r_math_logic(roli, rotli_tl, instr.imm5)
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
@@ -642,39 +617,15 @@ gen_r_shift_s(ror, rotr_tl)
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
@@ -864,8 +815,14 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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


