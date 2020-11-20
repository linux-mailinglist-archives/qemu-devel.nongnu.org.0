Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF082BB871
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:41:52 +0100 (CET)
Received: from localhost ([::1]:48450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgEAB-0006PN-UQ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDg8-0004uA-QH
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:51 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDg5-0004P3-Pp
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:48 -0500
Received: by mail-wm1-x336.google.com with SMTP id a3so11252305wmb.5
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WVddlHHp5p37eCkU7NTnbc/InwYZaLbhrydicBuAWhI=;
 b=c22SCDDvEouppyosM+ZG9RhfGpGLyxWi43vhxwkcj6+UmdVJjQKWXMfSfTPhcL+FgM
 uH9/5XdCXc/58UmmABhDVeh0ED6M0CKoDlkDGCt0dNktdK722+NKXlGXZk8efknKRB1z
 B0EB9t9jXwmiMpXfKu9CKZekjtQrlBhcmlua+lp+NCAPy4r9an5GqFGx+orP4LAujqPv
 lH6Ut6YTuiZe9h8hOvkpFUYm24vKixe4fpZQ5hvAHRHpH8B/KnDUWhlU8scF2H9SsqGW
 Gg3A8/3Pq/2q4S74PM44YXmeCB+9svdybfLWmACFl5crOskDEFzoN1dfrvC5CxpGlZuA
 reWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WVddlHHp5p37eCkU7NTnbc/InwYZaLbhrydicBuAWhI=;
 b=ZmfkOAnibf0IDiES7lbtFrMX0doNBg3CBbOMd1OIMB1kDiDTWyOUBjPFRw/sRjtFaM
 kLqQWwcNc0CHfcVNDddqtKT8upcSBfpIg9Y08K8hint8f459GvDVCIzLjAHeMnefXHKu
 lxNZq0hM314k0TIzFP6bO+3l6khKd1032DJo4qj1ed+vGwYnPaUtK+RNtiq88WyP/qOU
 i2CEciieB0MnT3nVSXgeswyvKaIGElixKKK59AaHY37ZlhRwH8awT34mIU1oL8mNuyvH
 tkyKoNZUmT2owfsF3wa+1AVu4A7U84MkBU7BEQD8HBVZLrjUw5UgrMZOVrRRHl5fHz+n
 it+A==
X-Gm-Message-State: AOAM530DUGN/cYn5Crl4B8nrnG9VM6LDYr1zm2oXQIbNn5RS6b3zJ6Nk
 u/2PqCoJD/lSSH4BfR6UrHua6RQxv2Y=
X-Google-Smtp-Source: ABdhPJw2eJoC7eeYwrj4PuAisqceNTw/VRIok/z3kUn61Rtrom6lQhWmi9su7f+ouyJ4k0WYVOvYmQ==
X-Received: by 2002:a1c:964d:: with SMTP id y74mr11476220wmd.129.1605906643249; 
 Fri, 20 Nov 2020 13:10:43 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f16sm6339233wrp.66.2020.11.20.13.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/26] target/mips: Extract Toshiba TXx9 translation routines
Date: Fri, 20 Nov 2020 22:08:40 +0100
Message-Id: <20201120210844.2625602-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract 300 lines of the Toshiba TX19/TX39/TX49/TX79
translation routines to 'vendor-tx_translate.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c               | 302 +-----------------------
 target/mips/vendor-tx_translate.c.inc | 315 ++++++++++++++++++++++++++
 2 files changed, 316 insertions(+), 301 deletions(-)
 create mode 100644 target/mips/vendor-tx_translate.c.inc

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 6b35498dd3d..a1cf1fe7f23 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -730,31 +730,6 @@ enum {
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
@@ -3046,44 +3021,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
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
@@ -3432,65 +3369,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
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
@@ -3683,138 +3561,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
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
@@ -11247,6 +10993,7 @@ out:
 #include "mod-mips-dsp_translate.c.inc"
 
 #include "vendor-vr54xx_translate.c.inc"
+#include "vendor-tx_translate.c.inc"
 #include "vendor-loong-simd_translate.c.inc"
 #include "vendor-loong-lext_translate.c.inc"
 #include "vendor-xburst_translate.c.inc"
@@ -11365,53 +11112,6 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
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


