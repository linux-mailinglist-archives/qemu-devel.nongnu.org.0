Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE22C17B3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:32:41 +0100 (CET)
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJRw-0001gP-4u
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjf-0002cq-Ko
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:56 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjc-0001u6-Ou
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id e7so2589160wrv.6
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KTXQ6BcNfHASdBhaYccCTSzBtWV71744MD3MDy4TE8I=;
 b=iR75VgMnmhWY6aOzU4mODlzDRXPPWHoyYArhX+grHFXEh3HyxEajbtCCoaiPjQ1W/W
 Ft7q3UZOX73h9aQIeNF2vO23nc775phxfczrid5PCV/sXdll1wa9h+ZXfpwn9y3RpSoH
 SLRTJ/Eq785QmTesYFnSKnD2KM87OYh6IO9vHUQnA8CbJ+uTpUz62L2IKzoM4Rs7G5U2
 VEubx4XY1TNZsN5iHBxX786n1zjivwger1YWuQw1oWErrY5UmDldqHJLgb+Uj4Sc0SJd
 i5cSD0pL4WrYdX7SXgvF/kW0D871XvQPuryFsPwRaa95oMfJttHe9KtPOyCPpjk1Hz7V
 kjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KTXQ6BcNfHASdBhaYccCTSzBtWV71744MD3MDy4TE8I=;
 b=fMwOzuXMdVegh9gY2wVPt/w5RV7Kx905mk9NKFhMx542wCgUYDUQxOgxlKji+aVS0A
 96mwNrYOckDNosH7FiJkCJZzzLPbw3eFNiJc9oANnCZGLroLLK5uhoApdwJumZ5w4FG8
 NCjI/89ROsV1EQOD1PiEPx6NgaYys2bg4TDzjI5HxqxRzlMzqpdWwIRi4LDQgH/Ovvwb
 8g52j407Na4bcqRTjIsQllBLKmBUlCXjyFEqivK5qkdcbdogVg833Cvi4hymZyJafRQ7
 +cbmkBaKl73FkYl/y3iW8v6uocUK5hD4ljEAJ9IlXsQrTSv74LveRlj5VBMjB05ufcQB
 WEqQ==
X-Gm-Message-State: AOAM5338JptuiS95yPNxEndde8jzjee2hNObv73i25EgtHhZTFs6u7S4
 CA0mBBr8R7mBsz/+D9zEpXijCUZtWYE=
X-Google-Smtp-Source: ABdhPJw3PgCxb4uNzae76ari8GRmtgVxkdRvedH7UbJlU9vS0MCNrDnSxv6A5hTYlU5SwlLrv6k98g==
X-Received: by 2002:adf:ed04:: with SMTP id a4mr1606360wro.172.1606164410492; 
 Mon, 23 Nov 2020 12:46:50 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c187sm1035610wmd.23.2020.11.23.12.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:46:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/28] target/mips: Extract Toshiba TXx9 translation
 routines
Date: Mon, 23 Nov 2020 21:44:44 +0100
Message-Id: <20201123204448.3260804-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract 300 lines of the Toshiba TX19/TX39/TX49/TX79
translation routines to 'vendor-tx_translate.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-23-f4bug@amsat.org>
---
 target/mips/translate.c               | 302 +-----------------------
 target/mips/vendor-tx_translate.c.inc | 315 ++++++++++++++++++++++++++
 2 files changed, 316 insertions(+), 301 deletions(-)
 create mode 100644 target/mips/vendor-tx_translate.c.inc

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8854d284d33..a4558c21d3f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -633,31 +633,6 @@ enum {
  * configure the 128-bit data path as two 64-bit, four 32-bit, eight 16-bit
  * or sixteen 8-bit paths.
  *
- * Reference:
- *
- * The Toshiba TX System RISC TX79 Core Architecture manual,
- * https://wiki.qemu.org/File:C790.pdf
- *
- *     Three-Operand Multiply and Multiply-Add (4 instructions)
- *     --------------------------------------------------------
- * MADD    [rd,] rs, rt      Multiply/Add
- * MADDU   [rd,] rs, rt      Multiply/Add Unsigned
- * MULT    [rd,] rs, rt      Multiply (3-operand)
- * MULTU   [rd,] rs, rt      Multiply Unsigned (3-operand)
- *
- *     Multiply Instructions for Pipeline 1 (10 instructions)
- *     ------------------------------------------------------
- * MULT1   [rd,] rs, rt      Multiply Pipeline 1
- * MULTU1  [rd,] rs, rt      Multiply Unsigned Pipeline 1
- * DIV1    rs, rt            Divide Pipeline 1
- * DIVU1   rs, rt            Divide Unsigned Pipeline 1
- * MADD1   [rd,] rs, rt      Multiply-Add Pipeline 1
- * MADDU1  [rd,] rs, rt      Multiply-Add Unsigned Pipeline 1
- * MFHI1   rd                Move From HI1 Register
- * MFLO1   rd                Move From LO1 Register
- * MTHI1   rs                Move To HI1 Register
- * MTLO1   rs                Move To LO1 Register
- *
  *     Arithmetic (19 instructions)
  *     ----------------------------
  * PADDB   rd, rs, rt        Parallel Add Byte
@@ -2949,44 +2924,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-#if defined(TARGET_MIPS64)
-/* Copy GPR to and from TX79 HI1/LO1 register. */
-static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
-{
-    if (reg == 0 && (opc == OPC_MFHI1 || opc == OPC_MFLO1)) {
-        /* Treat as NOP. */
-        return;
-    }
-
-    switch (opc) {
-    case OPC_MFHI1:
-        tcg_gen_mov_tl(cpu_gpr[reg], cpu_HI[1]);
-        break;
-    case OPC_MFLO1:
-        tcg_gen_mov_tl(cpu_gpr[reg], cpu_LO[1]);
-        break;
-    case OPC_MTHI1:
-        if (reg != 0) {
-            tcg_gen_mov_tl(cpu_HI[1], cpu_gpr[reg]);
-        } else {
-            tcg_gen_movi_tl(cpu_HI[1], 0);
-        }
-        break;
-    case OPC_MTLO1:
-        if (reg != 0) {
-            tcg_gen_mov_tl(cpu_LO[1], cpu_gpr[reg]);
-        } else {
-            tcg_gen_movi_tl(cpu_LO[1], 0);
-        }
-        break;
-    default:
-        MIPS_INVAL("mfthilo1 TX79");
-        generate_exception_end(ctx, EXCP_RI);
-        break;
-    }
-}
-#endif
-
 /* Arithmetic on HI/LO registers */
 static void gen_HILO(DisasContext *ctx, uint32_t opc, int acc, int reg)
 {
@@ -3335,65 +3272,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
     tcg_temp_free(t1);
 }
 
-#if defined(TARGET_MIPS64)
-static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
-{
-    TCGv t0, t1;
-
-    t0 = tcg_temp_new();
-    t1 = tcg_temp_new();
-
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-
-    switch (opc) {
-    case OPC_DIV1:
-        {
-            TCGv t2 = tcg_temp_new();
-            TCGv t3 = tcg_temp_new();
-            tcg_gen_ext32s_tl(t0, t0);
-            tcg_gen_ext32s_tl(t1, t1);
-            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
-            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
-            tcg_gen_and_tl(t2, t2, t3);
-            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
-            tcg_gen_or_tl(t2, t2, t3);
-            tcg_gen_movi_tl(t3, 0);
-            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
-            tcg_gen_div_tl(cpu_LO[1], t0, t1);
-            tcg_gen_rem_tl(cpu_HI[1], t0, t1);
-            tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
-            tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
-        }
-        break;
-    case OPC_DIVU1:
-        {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
-            tcg_gen_ext32u_tl(t0, t0);
-            tcg_gen_ext32u_tl(t1, t1);
-            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
-            tcg_gen_divu_tl(cpu_LO[1], t0, t1);
-            tcg_gen_remu_tl(cpu_HI[1], t0, t1);
-            tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
-            tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
-        }
-        break;
-    default:
-        MIPS_INVAL("div1 TX79");
-        generate_exception_end(ctx, EXCP_RI);
-        goto out;
-    }
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-#endif
-
 static void gen_muldiv(DisasContext *ctx, uint32_t opc,
                        int acc, int rs, int rt)
 {
@@ -3586,138 +3464,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-/*
- * These MULT[U] and MADD[U] instructions implemented in for example
- * the Toshiba/Sony R5900 and the Toshiba TX19, TX39 and TX79 core
- * architectures are special three-operand variants with the syntax
- *
- *     MULT[U][1] rd, rs, rt
- *
- * such that
- *
- *     (rd, LO, HI) <- rs * rt
- *
- * and
- *
- *     MADD[U][1] rd, rs, rt
- *
- * such that
- *
- *     (rd, LO, HI) <- (LO, HI) + rs * rt
- *
- * where the low-order 32-bits of the result is placed into both the
- * GPR rd and the special register LO. The high-order 32-bits of the
- * result is placed into the special register HI.
- *
- * If the GPR rd is omitted in assembly language, it is taken to be 0,
- * which is the zero register that always reads as 0.
- */
-static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
-                         int rd, int rs, int rt)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    int acc = 0;
-
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-
-    switch (opc) {
-    case OPC_MULT1:
-        acc = 1;
-        /* Fall through */
-    case OPC_MULT:
-        {
-            TCGv_i32 t2 = tcg_temp_new_i32();
-            TCGv_i32 t3 = tcg_temp_new_i32();
-            tcg_gen_trunc_tl_i32(t2, t0);
-            tcg_gen_trunc_tl_i32(t3, t1);
-            tcg_gen_muls2_i32(t2, t3, t2, t3);
-            if (rd) {
-                tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            }
-            tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
-            tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
-        }
-        break;
-    case OPC_MULTU1:
-        acc = 1;
-        /* Fall through */
-    case OPC_MULTU:
-        {
-            TCGv_i32 t2 = tcg_temp_new_i32();
-            TCGv_i32 t3 = tcg_temp_new_i32();
-            tcg_gen_trunc_tl_i32(t2, t0);
-            tcg_gen_trunc_tl_i32(t3, t1);
-            tcg_gen_mulu2_i32(t2, t3, t2, t3);
-            if (rd) {
-                tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            }
-            tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
-            tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
-        }
-        break;
-    case OPC_MADD1:
-        acc = 1;
-        /* Fall through */
-    case OPC_MADD:
-        {
-            TCGv_i64 t2 = tcg_temp_new_i64();
-            TCGv_i64 t3 = tcg_temp_new_i64();
-
-            tcg_gen_ext_tl_i64(t2, t0);
-            tcg_gen_ext_tl_i64(t3, t1);
-            tcg_gen_mul_i64(t2, t2, t3);
-            tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
-            tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
-            gen_move_low32(cpu_LO[acc], t2);
-            gen_move_high32(cpu_HI[acc], t2);
-            if (rd) {
-                gen_move_low32(cpu_gpr[rd], t2);
-            }
-            tcg_temp_free_i64(t2);
-        }
-        break;
-    case OPC_MADDU1:
-        acc = 1;
-        /* Fall through */
-    case OPC_MADDU:
-        {
-            TCGv_i64 t2 = tcg_temp_new_i64();
-            TCGv_i64 t3 = tcg_temp_new_i64();
-
-            tcg_gen_ext32u_tl(t0, t0);
-            tcg_gen_ext32u_tl(t1, t1);
-            tcg_gen_extu_tl_i64(t2, t0);
-            tcg_gen_extu_tl_i64(t3, t1);
-            tcg_gen_mul_i64(t2, t2, t3);
-            tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
-            tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
-            gen_move_low32(cpu_LO[acc], t2);
-            gen_move_high32(cpu_HI[acc], t2);
-            if (rd) {
-                gen_move_low32(cpu_gpr[rd], t2);
-            }
-            tcg_temp_free_i64(t2);
-        }
-        break;
-    default:
-        MIPS_INVAL("mul/madd TXx9");
-        generate_exception_end(ctx, EXCP_RI);
-        goto out;
-    }
-
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
 static void gen_cl(DisasContext *ctx, uint32_t opc,
                    int rd, int rs)
 {
@@ -11150,6 +10896,7 @@ out:
 #include "mod-dsp_translate.c.inc"
 
 #include "vendor-vr54xx_translate.c.inc"
+#include "vendor-tx_translate.c.inc"
 #include "vendor-loong-simd_translate.c.inc"
 #include "vendor-loong-ext_translate.c.inc"
 #include "vendor-mxu_translate.c.inc"
@@ -11268,53 +11015,6 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc_special_tx79(CPUMIPSState *env, DisasContext *ctx)
-{
-    int rs = extract32(ctx->opcode, 21, 5);
-    int rt = extract32(ctx->opcode, 16, 5);
-    int rd = extract32(ctx->opcode, 11, 5);
-    uint32_t op1 = MASK_SPECIAL(ctx->opcode);
-
-    switch (op1) {
-    case OPC_MOVN:         /* Conditional move */
-    case OPC_MOVZ:
-        gen_cond_move(ctx, op1, rd, rs, rt);
-        break;
-    case OPC_MFHI:          /* Move from HI/LO */
-    case OPC_MFLO:
-        gen_HILO(ctx, op1, 0, rd);
-        break;
-    case OPC_MTHI:
-    case OPC_MTLO:          /* Move to HI/LO */
-        gen_HILO(ctx, op1, 0, rs);
-        break;
-    case OPC_MULT:
-    case OPC_MULTU:
-        gen_mul_txx9(ctx, op1, rd, rs, rt);
-        break;
-    case OPC_DIV:
-    case OPC_DIVU:
-        gen_muldiv(ctx, op1, 0, rs, rt);
-        break;
-#if defined(TARGET_MIPS64)
-    case OPC_DMULT:
-    case OPC_DMULTU:
-    case OPC_DDIV:
-    case OPC_DDIVU:
-        check_insn_opc_user_only(ctx, INSN_R5900);
-        gen_muldiv(ctx, op1, 0, rs, rt);
-        break;
-#endif
-    case OPC_JR:
-        gen_compute_branch(ctx, op1, 4, rs, 0, 0, 4);
-        break;
-    default:            /* Invalid */
-        MIPS_INVAL("special_tx79");
-        generate_exception_end(ctx, EXCP_RI);
-        break;
-    }
-}
-
 static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
 {
     int rs, rt, rd, sa;
diff --git a/target/mips/vendor-tx_translate.c.inc b/target/mips/vendor-tx_translate.c.inc
new file mode 100644
index 00000000000..1d157743bd4
--- /dev/null
+++ b/target/mips/vendor-tx_translate.c.inc
@@ -0,0 +1,315 @@
+/*
+ *  Toshiba TX instruction translation routines.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *  Copyright (c) 2012 Jia Liu & Dongxue Zhang (MIPS ASE DSP support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ *     Overview of the TX79-specific instruction set
+ *     =============================================
+ *
+ * Reference:
+ *
+ * The Toshiba TX System RISC TX79 Core Architecture manual,
+ * https://wiki.qemu.org/File:C790.pdf
+ *
+ *     Three-Operand Multiply and Multiply-Add (4 instructions)
+ *     --------------------------------------------------------
+ * MADD    [rd,] rs, rt      Multiply/Add
+ * MADDU   [rd,] rs, rt      Multiply/Add Unsigned
+ * MULT    [rd,] rs, rt      Multiply (3-operand)
+ * MULTU   [rd,] rs, rt      Multiply Unsigned (3-operand)
+ *
+ *     Multiply Instructions for Pipeline 1 (10 instructions)
+ *     ------------------------------------------------------
+ * MULT1   [rd,] rs, rt      Multiply Pipeline 1
+ * MULTU1  [rd,] rs, rt      Multiply Unsigned Pipeline 1
+ * DIV1    rs, rt            Divide Pipeline 1
+ * DIVU1   rs, rt            Divide Unsigned Pipeline 1
+ * MADD1   [rd,] rs, rt      Multiply-Add Pipeline 1
+ * MADDU1  [rd,] rs, rt      Multiply-Add Unsigned Pipeline 1
+ * MFHI1   rd                Move From HI1 Register
+ * MFLO1   rd                Move From LO1 Register
+ * MTHI1   rs                Move To HI1 Register
+ * MTLO1   rs                Move To LO1 Register
+ *
+ */
+
+#if defined(TARGET_MIPS64)
+
+/* Copy GPR to and from TX79 HI1/LO1 register. */
+static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
+{
+    if (reg == 0 && (opc == OPC_MFHI1 || opc == OPC_MFLO1)) {
+        /* Treat as NOP. */
+        return;
+    }
+
+    switch (opc) {
+    case OPC_MFHI1:
+        tcg_gen_mov_tl(cpu_gpr[reg], cpu_HI[1]);
+        break;
+    case OPC_MFLO1:
+        tcg_gen_mov_tl(cpu_gpr[reg], cpu_LO[1]);
+        break;
+    case OPC_MTHI1:
+        if (reg != 0) {
+            tcg_gen_mov_tl(cpu_HI[1], cpu_gpr[reg]);
+        } else {
+            tcg_gen_movi_tl(cpu_HI[1], 0);
+        }
+        break;
+    case OPC_MTLO1:
+        if (reg != 0) {
+            tcg_gen_mov_tl(cpu_LO[1], cpu_gpr[reg]);
+        } else {
+            tcg_gen_movi_tl(cpu_LO[1], 0);
+        }
+        break;
+    default:
+        MIPS_INVAL("mfthilo1 TX79");
+        generate_exception_end(ctx, EXCP_RI);
+        break;
+    }
+}
+
+static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
+{
+    TCGv t0, t1;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+
+    switch (opc) {
+    case OPC_DIV1:
+        {
+            TCGv t2 = tcg_temp_new();
+            TCGv t3 = tcg_temp_new();
+            tcg_gen_ext32s_tl(t0, t0);
+            tcg_gen_ext32s_tl(t1, t1);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
+            tcg_gen_and_tl(t2, t2, t3);
+            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
+            tcg_gen_or_tl(t2, t2, t3);
+            tcg_gen_movi_tl(t3, 0);
+            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
+            tcg_gen_div_tl(cpu_LO[1], t0, t1);
+            tcg_gen_rem_tl(cpu_HI[1], t0, t1);
+            tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
+            tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    case OPC_DIVU1:
+        {
+            TCGv t2 = tcg_const_tl(0);
+            TCGv t3 = tcg_const_tl(1);
+            tcg_gen_ext32u_tl(t0, t0);
+            tcg_gen_ext32u_tl(t1, t1);
+            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+            tcg_gen_divu_tl(cpu_LO[1], t0, t1);
+            tcg_gen_remu_tl(cpu_HI[1], t0, t1);
+            tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
+            tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
+            tcg_temp_free(t3);
+            tcg_temp_free(t2);
+        }
+        break;
+    default:
+        MIPS_INVAL("div1 TX79");
+        generate_exception_end(ctx, EXCP_RI);
+        goto out;
+    }
+ out:
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+#endif
+
+/*
+ * These MULT[U] and MADD[U] instructions implemented in for example
+ * the Toshiba/Sony R5900 and the Toshiba TX19, TX39 and TX79 core
+ * architectures are special three-operand variants with the syntax
+ *
+ *     MULT[U][1] rd, rs, rt
+ *
+ * such that
+ *
+ *     (rd, LO, HI) <- rs * rt
+ *
+ * and
+ *
+ *     MADD[U][1] rd, rs, rt
+ *
+ * such that
+ *
+ *     (rd, LO, HI) <- (LO, HI) + rs * rt
+ *
+ * where the low-order 32-bits of the result is placed into both the
+ * GPR rd and the special register LO. The high-order 32-bits of the
+ * result is placed into the special register HI.
+ *
+ * If the GPR rd is omitted in assembly language, it is taken to be 0,
+ * which is the zero register that always reads as 0.
+ */
+static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
+                         int rd, int rs, int rt)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    int acc = 0;
+
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+
+    switch (opc) {
+    case OPC_MULT1:
+        acc = 1;
+        /* Fall through */
+    case OPC_MULT:
+        {
+            TCGv_i32 t2 = tcg_temp_new_i32();
+            TCGv_i32 t3 = tcg_temp_new_i32();
+            tcg_gen_trunc_tl_i32(t2, t0);
+            tcg_gen_trunc_tl_i32(t3, t1);
+            tcg_gen_muls2_i32(t2, t3, t2, t3);
+            if (rd) {
+                tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
+            }
+            tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
+            tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
+            tcg_temp_free_i32(t2);
+            tcg_temp_free_i32(t3);
+        }
+        break;
+    case OPC_MULTU1:
+        acc = 1;
+        /* Fall through */
+    case OPC_MULTU:
+        {
+            TCGv_i32 t2 = tcg_temp_new_i32();
+            TCGv_i32 t3 = tcg_temp_new_i32();
+            tcg_gen_trunc_tl_i32(t2, t0);
+            tcg_gen_trunc_tl_i32(t3, t1);
+            tcg_gen_mulu2_i32(t2, t3, t2, t3);
+            if (rd) {
+                tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
+            }
+            tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
+            tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
+            tcg_temp_free_i32(t2);
+            tcg_temp_free_i32(t3);
+        }
+        break;
+    case OPC_MADD1:
+        acc = 1;
+        /* Fall through */
+    case OPC_MADD:
+        {
+            TCGv_i64 t2 = tcg_temp_new_i64();
+            TCGv_i64 t3 = tcg_temp_new_i64();
+
+            tcg_gen_ext_tl_i64(t2, t0);
+            tcg_gen_ext_tl_i64(t3, t1);
+            tcg_gen_mul_i64(t2, t2, t3);
+            tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
+            tcg_gen_add_i64(t2, t2, t3);
+            tcg_temp_free_i64(t3);
+            gen_move_low32(cpu_LO[acc], t2);
+            gen_move_high32(cpu_HI[acc], t2);
+            if (rd) {
+                gen_move_low32(cpu_gpr[rd], t2);
+            }
+            tcg_temp_free_i64(t2);
+        }
+        break;
+    case OPC_MADDU1:
+        acc = 1;
+        /* Fall through */
+    case OPC_MADDU:
+        {
+            TCGv_i64 t2 = tcg_temp_new_i64();
+            TCGv_i64 t3 = tcg_temp_new_i64();
+
+            tcg_gen_ext32u_tl(t0, t0);
+            tcg_gen_ext32u_tl(t1, t1);
+            tcg_gen_extu_tl_i64(t2, t0);
+            tcg_gen_extu_tl_i64(t3, t1);
+            tcg_gen_mul_i64(t2, t2, t3);
+            tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
+            tcg_gen_add_i64(t2, t2, t3);
+            tcg_temp_free_i64(t3);
+            gen_move_low32(cpu_LO[acc], t2);
+            gen_move_high32(cpu_HI[acc], t2);
+            if (rd) {
+                gen_move_low32(cpu_gpr[rd], t2);
+            }
+            tcg_temp_free_i64(t2);
+        }
+        break;
+    default:
+        MIPS_INVAL("mul/madd TXx9");
+        generate_exception_end(ctx, EXCP_RI);
+        goto out;
+    }
+
+ out:
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void decode_opc_special_tx79(CPUMIPSState *env, DisasContext *ctx)
+{
+    int rs = extract32(ctx->opcode, 21, 5);
+    int rt = extract32(ctx->opcode, 16, 5);
+    int rd = extract32(ctx->opcode, 11, 5);
+    uint32_t op1 = MASK_SPECIAL(ctx->opcode);
+
+    switch (op1) {
+    case OPC_MOVN:         /* Conditional move */
+    case OPC_MOVZ:
+        gen_cond_move(ctx, op1, rd, rs, rt);
+        break;
+    case OPC_MFHI:          /* Move from HI/LO */
+    case OPC_MFLO:
+        gen_HILO(ctx, op1, 0, rd);
+        break;
+    case OPC_MTHI:
+    case OPC_MTLO:          /* Move to HI/LO */
+        gen_HILO(ctx, op1, 0, rs);
+        break;
+    case OPC_MULT:
+    case OPC_MULTU:
+        gen_mul_txx9(ctx, op1, rd, rs, rt);
+        break;
+    case OPC_DIV:
+    case OPC_DIVU:
+        gen_muldiv(ctx, op1, 0, rs, rt);
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_DMULT:
+    case OPC_DMULTU:
+    case OPC_DDIV:
+    case OPC_DDIVU:
+        check_insn_opc_user_only(ctx, INSN_R5900);
+        gen_muldiv(ctx, op1, 0, rs, rt);
+        break;
+#endif
+    case OPC_JR:
+        gen_compute_branch(ctx, op1, 4, rs, 0, 0, 4);
+        break;
+    default:            /* Invalid */
+        MIPS_INVAL("special_tx79");
+        generate_exception_end(ctx, EXCP_RI);
+        break;
+    }
+}
-- 
2.26.2


