Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551593F75BE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:19:38 +0200 (CEST)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsob-0006mw-DP
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYn-0008Eg-10
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:17 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYh-0002VF-Ao
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:16 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so4538228wms.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=er8ButREjqGKw2HRUsf24tELcm71bKaLsDkb4+v1DCk=;
 b=JoaQiTurLPEF4hzw2BbzKi1UfUXy42JdqnSZK69L/1aiTSGG0vFiAt3Q8hvVu1ELkC
 z0oaK8+OAAOfsyMPCQgrioIHrpQl9rJAnOFBc+f3zMhQa6qE1FmPqvyHPUPUqJcwnEtZ
 ljapwhHkHJjF8XjmE8/Ic2yj3fzhcO6mzUakf1gx6lPnMtky56Lc2ELP+2jKwaq+CHV0
 pwvIylK0iqEupXjb2MckNdgjE3/YNmVgbuTtW023m/iIypkhj9SSYwTlSIz65ABYwCii
 iUvPGWt9BtCNq325+ikH+wPiWMv5q7i2BF+nb0YM9YXkx4puk6xASmO/avnSuMfnsEZe
 uwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=er8ButREjqGKw2HRUsf24tELcm71bKaLsDkb4+v1DCk=;
 b=C6Qpfhqolozdi9yH5kfe7qJkOqLwkdZUhvdX6TdO4mzqEbDbG9vVQXEgFeKrYAG+YW
 l/7qq+auN7q9hGvQ08XG4UVgYT1PFUlin/Aaakcp/vuEM0qzMycjwuXSzxBwPxVLuDec
 LJA9Cg8Na33HeXaDJHfHYC3vYsLHmGzIUlC2a5MM1QYn7mXBnemhBKcnvTkX7Ebts4NM
 AFhX+csFJmvrYNSKiCa9SHqmlFzBqmPvSILsnNqeeCTgDHzXLKCv0cDAcuKOUVqJ7fWo
 xoVarzIjUDRSJSjl7+u/3U2JLatMl3yqjD8g2nGo2K9yGsb3IGr8lvxbeT+Wzft3/XBz
 b1fA==
X-Gm-Message-State: AOAM533zy7ZV7LcfTAuOeInCK1nIjBYP+WdbOD2MGQIgo8uyDesfEovm
 Rf/XwpTx8oQ0eZFnMv8Jo09I7GmPK/Y=
X-Google-Smtp-Source: ABdhPJxLyfuuiNcCWKxxXVyhQF3ziIh2FSAOwlqDKzLfyhk9MCtXT/f79U/IVEUA970KuphMRRKsRw==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr8920094wmr.35.1629896589852; 
 Wed, 25 Aug 2021 06:03:09 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f7sm5315986wmh.20.2021.08.25.06.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/28] target/mips: Convert Vr54xx MSA* opcodes to decodetree
Date: Wed, 25 Aug 2021 15:01:55 +0200
Message-Id: <20210825130211.1542338-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the following Integer Multiply-Accumulate opcodes:

 * MSAC         Multiply, negate, accumulate, and move LO
 * MSACHI       Multiply, negate, accumulate, and move HI
 * MSACHIU      Unsigned multiply, negate, accumulate, and move HI
 * MSACU        Unsigned multiply, negate, accumulate, and move LO

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210808173018.90960-8-f4bug@amsat.org>
---
 target/mips/tcg/vr54xx.decode      |  4 +++
 target/mips/tcg/translate.c        | 55 ++----------------------------
 target/mips/tcg/vr54xx_translate.c |  8 +++++
 3 files changed, 14 insertions(+), 53 deletions(-)

diff --git a/target/mips/tcg/vr54xx.decode b/target/mips/tcg/vr54xx.decode
index 79bb5175eab..4fc708d80ae 100644
--- a/target/mips/tcg/vr54xx.decode
+++ b/target/mips/tcg/vr54xx.decode
@@ -15,9 +15,13 @@ MULS            000000 ..... ..... ..... 00011011000    @rs_rt_rd
 MULSU           000000 ..... ..... ..... 00011011001    @rs_rt_rd
 MACC            000000 ..... ..... ..... 00101011000    @rs_rt_rd
 MACCU           000000 ..... ..... ..... 00101011001    @rs_rt_rd
+MSAC            000000 ..... ..... ..... 00111011000    @rs_rt_rd
+MSACU           000000 ..... ..... ..... 00111011001    @rs_rt_rd
 MULHI           000000 ..... ..... ..... 01001011000    @rs_rt_rd
 MULHIU          000000 ..... ..... ..... 01001011001    @rs_rt_rd
 MULSHI          000000 ..... ..... ..... 01011011000    @rs_rt_rd
 MULSHIU         000000 ..... ..... ..... 01011011001    @rs_rt_rd
 MACCHI          000000 ..... ..... ..... 01101011000    @rs_rt_rd
 MACCHIU         000000 ..... ..... ..... 01101011001    @rs_rt_rd
+MSACHI          000000 ..... ..... ..... 01111011000    @rs_rt_rd
+MSACHIU         000000 ..... ..... ..... 01111011001    @rs_rt_rd
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 4b7f2d9ae8b..30780deb96f 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -294,16 +294,6 @@ enum {
     R6_OPC_SDBBP    = 0x0e | OPC_SPECIAL,
 };
 
-/* Multiplication variants of the vr54xx. */
-#define MASK_MUL_VR54XX(op)         (MASK_SPECIAL(op) | (op & (0x1F << 6)))
-
-enum {
-    OPC_VR54XX_MSAC    = (0x07 << 6) | OPC_MULT,
-    OPC_VR54XX_MSACU   = (0x07 << 6) | OPC_MULTU,
-    OPC_VR54XX_MSACHI  = (0x0F << 6) | OPC_MULT,
-    OPC_VR54XX_MSACHIU = (0x0F << 6) | OPC_MULTU,
-};
-
 /* REGIMM (rt field) opcodes */
 #define MASK_REGIMM(op)             (MASK_OP_MAJOR(op) | (op & (0x1F << 16)))
 
@@ -3754,40 +3744,6 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
-                           int rd, int rs, int rt)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-
-    switch (opc) {
-    case OPC_VR54XX_MSAC:
-        gen_helper_msac(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSACU:
-        gen_helper_msacu(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSACHI:
-        gen_helper_msachi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSACHIU:
-        gen_helper_msachiu(t0, cpu_env, t0, t1);
-        break;
-    default:
-        MIPS_INVAL("mul vr54xx");
-        gen_reserved_instruction(ctx);
-        goto out;
-    }
-    gen_store_gpr(t0, rd);
-
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
 static void gen_cl(DisasContext *ctx, uint32_t opc,
                    int rd, int rs)
 {
@@ -14104,13 +14060,12 @@ static void decode_opc_special_tx79(CPUMIPSState *env, DisasContext *ctx)
 
 static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
 {
-    int rs, rt, rd, sa;
+    int rs, rt, rd;
     uint32_t op1;
 
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
     rd = (ctx->opcode >> 11) & 0x1f;
-    sa = (ctx->opcode >> 6) & 0x1f;
 
     op1 = MASK_SPECIAL(ctx->opcode);
     switch (op1) {
@@ -14140,13 +14095,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_MULT:
     case OPC_MULTU:
-        if (sa) {
-            check_insn(ctx, INSN_VR54XX);
-            op1 = MASK_MUL_VR54XX(ctx->opcode);
-            gen_mul_vr54xx(ctx, op1, rd, rs, rt);
-        } else {
-            gen_muldiv(ctx, op1, rd & 3, rs, rt);
-        }
+        gen_muldiv(ctx, op1, rd & 3, rs, rt);
         break;
     case OPC_DIV:
     case OPC_DIVU:
diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 9f35b2c7e5d..3e2c98f2c6a 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -25,6 +25,10 @@
  * MACCHI       Multiply, accumulate, and move HI
  * MACCHIU      Unsigned multiply, accumulate, and move HI
  * MACCU        Unsigned multiply, accumulate, and move LO
+ * MSAC         Multiply, negate, accumulate, and move LO
+ * MSACHI       Multiply, negate, accumulate, and move HI
+ * MSACHIU      Unsigned multiply, negate, accumulate, and move HI
+ * MSACU        Unsigned multiply, negate, accumulate, and move LO
  * MULHI        Multiply and move HI
  * MULHIU       Unsigned multiply and move HI
  * MULS         Multiply, negate, and move LO
@@ -56,6 +60,10 @@ TRANS(MACC,     trans_mult_acc, gen_helper_macc);
 TRANS(MACCHI,   trans_mult_acc, gen_helper_macchi);
 TRANS(MACCHIU,  trans_mult_acc, gen_helper_macchiu);
 TRANS(MACCU,    trans_mult_acc, gen_helper_maccu);
+TRANS(MSAC,     trans_mult_acc, gen_helper_msac);
+TRANS(MSACHI,   trans_mult_acc, gen_helper_msachi);
+TRANS(MSACHIU,  trans_mult_acc, gen_helper_msachiu);
+TRANS(MSACU,    trans_mult_acc, gen_helper_msacu);
 TRANS(MULHI,    trans_mult_acc, gen_helper_mulhi);
 TRANS(MULHIU,   trans_mult_acc, gen_helper_mulhiu);
 TRANS(MULS,     trans_mult_acc, gen_helper_muls);
-- 
2.31.1


