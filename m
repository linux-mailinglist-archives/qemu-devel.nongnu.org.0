Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D9B2F3BFC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:13 +0100 (CET)
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRh2-0006A1-HQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRde-0002nK-O0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:42 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdc-0001i7-NS
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id t16so30436wra.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2UwynuTY25WflRngIJOfXryHldqB2m/mNIeXjl6Uo3s=;
 b=LjpMlyQIJTTP3c2apY9hDtXdY4/abFyUjFlJZ3qv8MGe6d1J6+Rm8+mN38LTAQTRbZ
 57dQ/SAmfGIgXTZ1zEjVFtNhnLjGz+l5OC/og8zO6sSoWND1tkx6LSgCpCuuJg/yMzIx
 2Ye0cWP1I/smCos9LEGfoMq08u9OM0qABVzBMdus5avel+w0+t6fhBbB6G5Pd1Puktii
 EfWS42ysT8crZZJ3NdarPFu1Lt5Qlp7Cvm5reO6Qt7mszeg7I2DNyGU3aPnwJKIkUcmT
 Ttvvewg9yJqJ7vVT9iePu1H2IgfZpnyQQlFAPFsqaV+XXYTQUeBjtEPf5YSqJr8CfIbF
 IcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2UwynuTY25WflRngIJOfXryHldqB2m/mNIeXjl6Uo3s=;
 b=JcFYEhoUp9sAJtQzONbxS9fL+y3IykkPuBoU4VRH7DsswnZxeOUGfQO0n2MN7siqSt
 5u7toqk8SeBmW8VtLtQKMgIiZB0jSzNib4EXmdu2LAuPoNpMydAxILZ7CBisCHLxm+4b
 qq+LzvY2htvawJNY/8XiA8Y1A7qZaqnbBupuBRcwUgJ6ieYlURXfzH1uzS5xAGQB+yX2
 6/99GKFspoTdAi/WPxvMU/zRtB3X6ga0okYnJ7QBy4LS2g94gXDmIgSFAaQoCfutHMcq
 iYqs7cuCxhuYXXvxLXNKRU5r9K4ywYpJZJHlpA1Xm5PmUQ8VC/vyuUdtWN3BgTGpIsqj
 AEsw==
X-Gm-Message-State: AOAM530AM1tsRNIVabKfoqYVPKHKfzu9e37EKBQwoSo1318Ric5GKU47
 znhNmrwUjDdXDDD4XT+4kF8xkhteBZY=
X-Google-Smtp-Source: ABdhPJyG336SI2stbjS4zJcOMh1LSez+AIyNXQROwrkEr4GEhUZj0Zh33eFx12qAHyQceeRJ7wGACA==
X-Received: by 2002:adf:d238:: with SMTP id k24mr805143wrh.414.1610488539049; 
 Tue, 12 Jan 2021 13:55:39 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id u66sm5781625wmg.30.2021.01.12.13.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:55:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/mips: Convert Loongson [D]MULT[U].G opcodes to
 decodetree
Date: Tue, 12 Jan 2021 22:55:04 +0100
Message-Id: <20210112215504.2093955-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215504.2093955-1-f4bug@amsat.org>
References: <20210112215504.2093955-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the following opcodes to decodetree:

- MULT.G - multiply 32-bit signed integers
- MULTU.G - multiply 32-bit unsigned integers
- DMULT.G - multiply 64-bit signed integers
- DMULTU.G - multiply 64-bit unsigned integers

Now that all opcodes from the extension have been converted, we
can remove completely gen_loongson_integer() and its 2 calls in
decode_opc_special2_legacy() and decode_opc_special3_legacy().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/godson2.decode    |  5 ++
 target/mips/loong-ext.decode  |  5 ++
 target/mips/loong_translate.c | 58 ++++++++++++++++++++++
 target/mips/translate.c       | 92 +----------------------------------
 4 files changed, 70 insertions(+), 90 deletions(-)

diff --git a/target/mips/godson2.decode b/target/mips/godson2.decode
index 805452fa975..cf12d9072ec 100644
--- a/target/mips/godson2.decode
+++ b/target/mips/godson2.decode
@@ -13,6 +13,11 @@
 
 @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
 
+MULT.G          011111 ..... ..... ..... 00000 011000   @rs_rt_rd
+MULTU.G         011111 ..... ..... ..... 00000 011001   @rs_rt_rd
+DMULT.G         011111 ..... ..... ..... 00000 011100   @rs_rt_rd
+DMULTU.G        011111 ..... ..... ..... 00000 011101   @rs_rt_rd
+
 DIV.G           011111 ..... ..... ..... 00000 011010   @rs_rt_rd
 DIVU.G          011111 ..... ..... ..... 00000 011011   @rs_rt_rd
 DDIV.G          011111 ..... ..... ..... 00000 011110   @rs_rt_rd
diff --git a/target/mips/loong-ext.decode b/target/mips/loong-ext.decode
index b0715894ee1..2281afaad95 100644
--- a/target/mips/loong-ext.decode
+++ b/target/mips/loong-ext.decode
@@ -14,6 +14,11 @@
 
 @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
 
+MULT.G          011100 ..... ..... ..... 00000 010000   @rs_rt_rd
+DMULT.G         011100 ..... ..... ..... 00000 010001   @rs_rt_rd
+MULTU.G         011100 ..... ..... ..... 00000 010010   @rs_rt_rd
+DMULTU.G        011100 ..... ..... ..... 00000 010011   @rs_rt_rd
+
 DIV.G           011100 ..... ..... ..... 00000 010100   @rs_rt_rd
 DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
 DIVU.G          011100 ..... ..... ..... 00000 010110   @rs_rt_rd
diff --git a/target/mips/loong_translate.c b/target/mips/loong_translate.c
index 50609ce4178..2af94535921 100644
--- a/target/mips/loong_translate.c
+++ b/target/mips/loong_translate.c
@@ -263,6 +263,64 @@ static bool trans_DMODU_G(DisasContext *s, arg_muldiv *a)
     return gen_lext_MODU_G(s, a->rt, a->rs, a->rd, true);
 }
 
+static bool gen_lext_MULT_G(DisasContext *s, int rd, int rs, int rt,
+                            bool is_double, bool is_unsigned)
+{
+    TCGv t0, t1;
+
+    if (is_double) {
+        if (TARGET_LONG_BITS != 64) {
+            return false;
+        }
+        check_mips_64(s);
+    }
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+
+    if (is_unsigned && !is_double) {
+        tcg_gen_ext32u_tl(t0, t0);
+        tcg_gen_ext32u_tl(t1, t1);
+    }
+    tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
+    if (!is_double) {
+        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+    }
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_MULT_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_MULT_G(s, a->rt, a->rs, a->rd, false, false);
+}
+
+static bool trans_MULTU_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_MULT_G(s, a->rt, a->rs, a->rd, false, true);
+}
+
+static bool trans_DMULT_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_MULT_G(s, a->rt, a->rs, a->rd, true, false);
+}
+
+static bool trans_DMULTU_G(DisasContext *s, arg_muldiv *a)
+{
+    return gen_lext_MULT_G(s, a->rt, a->rs, a->rd, true, true);
+}
+
 bool decode_loongson(DisasContext *ctx, uint32_t insn)
 {
     if ((ctx->insn_flags & INSN_LOONGSON2E)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 144e51b063a..5b5fe31c534 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -337,11 +337,6 @@ enum {
     OPC_MUL      = 0x02 | OPC_SPECIAL2,
     OPC_MSUB     = 0x04 | OPC_SPECIAL2,
     OPC_MSUBU    = 0x05 | OPC_SPECIAL2,
-    /* Loongson 2F */
-    OPC_MULT_G_2F   = 0x10 | OPC_SPECIAL2,
-    OPC_DMULT_G_2F  = 0x11 | OPC_SPECIAL2,
-    OPC_MULTU_G_2F  = 0x12 | OPC_SPECIAL2,
-    OPC_DMULTU_G_2F = 0x13 | OPC_SPECIAL2,
     /* Misc */
     OPC_CLZ      = 0x20 | OPC_SPECIAL2,
     OPC_CLO      = 0x21 | OPC_SPECIAL2,
@@ -370,12 +365,6 @@ enum {
     OPC_RDHWR    = 0x3B | OPC_SPECIAL3,
     OPC_GINV     = 0x3D | OPC_SPECIAL3,
 
-    /* Loongson 2E */
-    OPC_MULT_G_2E   = 0x18 | OPC_SPECIAL3,
-    OPC_MULTU_G_2E  = 0x19 | OPC_SPECIAL3,
-    OPC_DMULT_G_2E  = 0x1C | OPC_SPECIAL3,
-    OPC_DMULTU_G_2E = 0x1D | OPC_SPECIAL3,
-
     /* MIPS DSP Load */
     OPC_LX_DSP         = 0x0A | OPC_SPECIAL3,
     /* MIPS DSP Arithmetic */
@@ -4962,65 +4951,6 @@ static void gen_cl(DisasContext *ctx, uint32_t opc,
     }
 }
 
-/* Godson integer instructions */
-static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
-                                 int rd, int rs, int rt)
-{
-    TCGv t0, t1;
-
-    if (rd == 0) {
-        /* Treat as NOP. */
-        return;
-    }
-
-    switch (opc) {
-    case OPC_MULT_G_2E:
-    case OPC_MULT_G_2F:
-    case OPC_MULTU_G_2E:
-    case OPC_MULTU_G_2F:
-#if defined(TARGET_MIPS64)
-    case OPC_DMULT_G_2E:
-    case OPC_DMULT_G_2F:
-    case OPC_DMULTU_G_2E:
-    case OPC_DMULTU_G_2F:
-#endif
-        t0 = tcg_temp_new();
-        t1 = tcg_temp_new();
-        break;
-    }
-
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-
-    switch (opc) {
-    case OPC_MULT_G_2E:
-    case OPC_MULT_G_2F:
-        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
-        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-        break;
-    case OPC_MULTU_G_2E:
-    case OPC_MULTU_G_2F:
-        tcg_gen_ext32u_tl(t0, t0);
-        tcg_gen_ext32u_tl(t1, t1);
-        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
-        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-        break;
-#if defined(TARGET_MIPS64)
-    case OPC_DMULT_G_2E:
-    case OPC_DMULT_G_2F:
-        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
-        break;
-    case OPC_DMULTU_G_2E:
-    case OPC_DMULTU_G_2F:
-        tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
-        break;
-#endif
-    }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
 /* Loongson multimedia instructions */
 static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
 {
@@ -26989,11 +26919,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MUL:
         gen_arith(ctx, op1, rd, rs, rt);
         break;
-    case OPC_MULT_G_2F:
-    case OPC_MULTU_G_2F:
-        check_insn(ctx, INSN_LOONGSON2F | ASE_LEXT);
-        gen_loongson_integer(ctx, op1, rd, rs, rt);
-        break;
     case OPC_CLO:
     case OPC_CLZ:
         check_insn(ctx, ISA_MIPS_R1);
@@ -27018,11 +26943,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         check_mips_64(ctx);
         gen_cl(ctx, op1, rd, rs);
         break;
-    case OPC_DMULT_G_2F:
-    case OPC_DMULTU_G_2F:
-        check_insn(ctx, INSN_LOONGSON2F | ASE_LEXT);
-        gen_loongson_integer(ctx, op1, rd, rs, rt);
-        break;
 #endif
     default:            /* Invalid */
         MIPS_INVAL("special2_legacy");
@@ -27155,10 +27075,9 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
 
     op1 = MASK_SPECIAL3(ctx->opcode);
     switch (op1) {
-    case OPC_MULT_G_2E:
-    case OPC_MULTU_G_2E:
+    case OPC_MUL_PH_DSP:
         /*
-         * OPC_MULT_G_2E, OPC_ADDUH_QB_DSP, OPC_MUL_PH_DSP have
+         * OPC_ADDUH_QB_DSP, OPC_MUL_PH_DSP have
          * the same mask and op1.
          */
         if ((ctx->insn_flags & ASE_DSP_R2) && (op1 == OPC_MUL_PH_DSP)) {
@@ -27189,8 +27108,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
                 gen_reserved_instruction(ctx);
                 break;
             }
-        } else if (ctx->insn_flags & INSN_LOONGSON2E) {
-            gen_loongson_integer(ctx, op1, rd, rs, rt);
         } else {
             gen_reserved_instruction(ctx);
         }
@@ -27422,11 +27339,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
 #if defined(TARGET_MIPS64)
-    case OPC_DMULT_G_2E:
-    case OPC_DMULTU_G_2E:
-        check_insn(ctx, INSN_LOONGSON2E);
-        gen_loongson_integer(ctx, op1, rd, rs, rt);
-        break;
     case OPC_ABSQ_S_QH_DSP:
         op2 = MASK_ABSQ_S_QH(ctx->opcode);
         switch (op2) {
-- 
2.26.2


