Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDC3DCE40
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 02:04:57 +0200 (CEST)
Received: from localhost ([::1]:47104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mALRw-0003Si-9Q
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 20:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALN6-0004Ct-Qq
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:56 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALN3-0006zQ-E9
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id b7so19329445wri.8
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KoQ+85bWw/nU6wuXZueiRA91LFc9fHglW4hLXVIzatU=;
 b=mmtIgFGDgemFy/F8gsLXfOmooSQiaDXUglonQk3PHE7kOCnvOGA/I4JZlKvCuHjcC5
 F5iKC9xzijtUhvkSS1GkkwWPFFZhkWOg3s0PUe+eJM3YceDeWmwhDOdGA2wnTunKz3zH
 cDDoXbFRJFIW8rN/GB+ASzx4wSTUtBqVp8FRHnbtgBciyG9CMwkKndJakLMsmaoixdAB
 o3QRoS791hU9OYIP2WRF104Kafy32z9ei3VTs2cYNQQ85wcfWkA86F4FYw3Sp6+lZoI/
 A7Skohmu1GDXQP8ACxBF2urbD8NgH7F8wbr0bpisJjJkwEy1DE/q0uI5YukvbAlKqbpg
 Tf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KoQ+85bWw/nU6wuXZueiRA91LFc9fHglW4hLXVIzatU=;
 b=EcUjKMMjpkZra+tjBi71JfdYaaDnY6SVprHzBjiGcP4yZdGBibq9/wnRByXuuPBiM8
 fZFGiE3QELd5oTq6mMJZsVwz/fGU3BczjVYtjIgTr0lYpa52kjZQjtnAOxYNaRM86Z5s
 YJ5OTTCZ5fbvaDaCW9tlwgpl0EP1506lSKckcdyEch3k/s9bncasYb+JtT9VRwlSqBse
 p9gtK0XsjEC0Ga9xIVDSwZx4IL+viW6plXtHr1ctU9ykGeDdR3l9Kz78LVhN0R1rOo/B
 MKpjhPF2GTpGE8+UtCyDW7ot3H9eFQ37M0jX5JWsTvzNmGQs3c9+G0mlIY9hzYp2uU3r
 3+Qw==
X-Gm-Message-State: AOAM532fyx5Z8yDk+Rgz02VXV0bOS0EUn4FpjFAT2QrMl0atnxTI6l1s
 9aw8PdAyH62k0ZCH3FGNdcosnv5TcRgHzA==
X-Google-Smtp-Source: ABdhPJwl+skDr4hdfHcwAgzi34rqNDzUsNJLPm/xXiM/bMJnqs+H9+TRRNXfgE9c27UOJ0GfAdCiog==
X-Received: by 2002:adf:efc7:: with SMTP id i7mr14551388wrp.87.1627862391915; 
 Sun, 01 Aug 2021 16:59:51 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g5sm1577169wmh.31.2021.08.01.16.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:59:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 5/5] target/mips: Convert Vr54xx MSA* opcodes to
 decodetree
Date: Mon,  2 Aug 2021 01:59:26 +0200
Message-Id: <20210801235926.3178085-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801235926.3178085-1-f4bug@amsat.org>
References: <20210801235926.3178085-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the following Integer Multiply-Accumulate opcodes:

 * MSAC         Multiply, negate, accumulate, and move LO
 * MSACHI       Multiply, negate, accumulate, and move HI
 * MSACHIU      Unsigned multiply, negate, accumulate, and move HI
 * MSACU        Unsigned multiply, negate, accumulate, and move LO

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 4196319d827..bdce6356c27 100644
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
@@ -14139,13 +14094,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
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
index 1e6000d3d15..6661bf39eee 100644
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
@@ -63,6 +67,10 @@ MULT_ACC(MACC,      gen_helper_macc);
 MULT_ACC(MACCHI,    gen_helper_macchi);
 MULT_ACC(MACCHIU,   gen_helper_macchiu);
 MULT_ACC(MACCU,     gen_helper_maccu);
+MULT_ACC(MSAC,      gen_helper_msac);
+MULT_ACC(MSACHI,    gen_helper_msachi);
+MULT_ACC(MSACHIU,   gen_helper_msachiu);
+MULT_ACC(MSACU,     gen_helper_msacu);
 MULT_ACC(MULHI,     gen_helper_mulhi);
 MULT_ACC(MULHIU,    gen_helper_mulhiu);
 MULT_ACC(MULS,      gen_helper_muls);
-- 
2.31.1


