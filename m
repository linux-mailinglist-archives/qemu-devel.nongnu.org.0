Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7D2C179D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:25:00 +0100 (CET)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJKU-00055w-Q3
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjY-0002aT-Oy
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:48 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjX-0001rj-2b
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:48 -0500
Received: by mail-wm1-x330.google.com with SMTP id 10so616891wml.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JBBGafkMt7OMjeY7K8PjAZiYEpVm5oWHr+U5UNLGJTw=;
 b=o2SbqkajeYgQUNK+AeItP+rjgc/xJuRIKReY//Tk7dLViPGogwuG0eUiwzHHtQSiQJ
 ErOD95tiLJmVwstu6FJvtr6HYHMd1axOaXZWUoWGJ3FNi2kf8QW0jnOTyN1UZzLfxLEK
 9RxpuAgLEKFs/BD8rdKa91Mi207334+ll306DPlKArzc9XTN4wHEc/uRnVo6TE9cMZ7J
 g+4VJADdypAE34jo4vNjSLMziUQXnXVqQjPxvCIICnzx7slIuSt3Fkqk+RjpiQXCkRiq
 3h7LJXCBmhi+fdh42cKoI85GooKXmBWz7SnpDCDWEiLzRBXb6QVWWw6151VCYiS7V55O
 E9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JBBGafkMt7OMjeY7K8PjAZiYEpVm5oWHr+U5UNLGJTw=;
 b=ZP+cJrOgAYEpan1gm+1YGKMr4srs0bSKV3f2heTZr9snQfA7003d2bgb7LyQiMfvdc
 orBVEAPS6upfHqeiGh0NbpIn5cIyxm03jWCBG89JJCF1Nl81paIaDtvh0AJiwuJjXGBp
 0La+xBbd2UbELJsnj1wyZTN4gFZp2ffxwYheVZpoxyuiz7gVREgdYJm915ZClfj+laOf
 ckbWAV26pFsbbayuC+D2e7ovm9809pqLoUWHWQ7TF2NGmYUsCqj5Sux57hsLNPL+JSUn
 hrGnOlnicG7a2ypJXdekxEgN1hj10XkyHe165fBcfohdbJD9xIGL/ldYswt21NPCPCEF
 BbDQ==
X-Gm-Message-State: AOAM531Ymic8mq/3xB6Xlk7lqd2ooGCtN/gMCr26dJ/Jsa9m6yWTnLvV
 WlLvY19nKTj7pqw5/f1q5NsOxNJBmUY=
X-Google-Smtp-Source: ABdhPJy1pJsfuE75oITUGgqwnA/AtEdVtKsLwSV08xUZO2jhl1CX8efs9+9W2y71T4VSF597zkLZqQ==
X-Received: by 2002:a1c:7fd7:: with SMTP id a206mr720611wmd.135.1606164405227; 
 Mon, 23 Nov 2020 12:46:45 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id w11sm827049wmg.36.2020.11.23.12.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:46:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/28] target/mips: Make pipeline 1 multiply opcodes generic
Date: Mon, 23 Nov 2020 21:44:43 +0100
Message-Id: <20201123204448.3260804-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Special2 multiply opcodes are not specific to Toshiba TX79,
and are not part of its multimedia extension.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-22-f4bug@amsat.org>
---
 target/mips/translate.c | 75 +++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 7ef3bc52358..8854d284d33 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -330,6 +330,19 @@ enum {
     OPC_MUL      = 0x02 | OPC_SPECIAL2,
     OPC_MSUB     = 0x04 | OPC_SPECIAL2,
     OPC_MSUBU    = 0x05 | OPC_SPECIAL2,
+
+    /* Multiply Instructions for Pipeline 1 */
+    OPC_MFHI1    = 0x10 | OPC_SPECIAL2,
+    OPC_MTHI1    = 0x11 | OPC_SPECIAL2,
+    OPC_MFLO1    = 0x12 | OPC_SPECIAL2,
+    OPC_MTLO1    = 0x13 | OPC_SPECIAL2,
+    OPC_MULT1    = 0x18 | OPC_SPECIAL2,
+    OPC_MULTU1   = 0x19 | OPC_SPECIAL2,
+    OPC_DIV1     = 0x1A | OPC_SPECIAL2,
+    OPC_DIVU1    = 0x1B | OPC_SPECIAL2,
+    OPC_MADD1    = 0x20 | OPC_SPECIAL2,
+    OPC_MADDU1   = 0x21 | OPC_SPECIAL2,
+
     /* Misc */
     OPC_CLZ      = 0x20 | OPC_SPECIAL2,
     OPC_CLO      = 0x21 | OPC_SPECIAL2,
@@ -836,21 +849,9 @@ enum {
 
 #define MASK_MMI(op) (MASK_OP_MAJOR(op) | ((op) & 0x3F))
 enum {
-    MMI_OPC_MADD       = 0x00 | MMI_OPC_CLASS_MMI, /* Same as OPC_MADD */
-    MMI_OPC_MADDU      = 0x01 | MMI_OPC_CLASS_MMI, /* Same as OPC_MADDU */
     MMI_OPC_PLZCW      = 0x04 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI0 = 0x08 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI2 = 0x09 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_MFHI1      = 0x10 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MFHI */
-    MMI_OPC_MTHI1      = 0x11 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTHI */
-    MMI_OPC_MFLO1      = 0x12 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MFLO */
-    MMI_OPC_MTLO1      = 0x13 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTLO */
-    MMI_OPC_MULT1      = 0x18 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MULT */
-    MMI_OPC_MULTU1     = 0x19 | MMI_OPC_CLASS_MMI, /* Same min. as OPC_MULTU */
-    MMI_OPC_DIV1       = 0x1A | MMI_OPC_CLASS_MMI, /* Same minor as OPC_DIV  */
-    MMI_OPC_DIVU1      = 0x1B | MMI_OPC_CLASS_MMI, /* Same minor as OPC_DIVU */
-    MMI_OPC_MADD1      = 0x20 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_MADDU1     = 0x21 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI1 = 0x28 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI3 = 0x29 | MMI_OPC_CLASS_MMI,
     MMI_OPC_PMFHL      = 0x30 | MMI_OPC_CLASS_MMI,
@@ -2952,26 +2953,26 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
 /* Copy GPR to and from TX79 HI1/LO1 register. */
 static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
 {
-    if (reg == 0 && (opc == MMI_OPC_MFHI1 || opc == MMI_OPC_MFLO1)) {
+    if (reg == 0 && (opc == OPC_MFHI1 || opc == OPC_MFLO1)) {
         /* Treat as NOP. */
         return;
     }
 
     switch (opc) {
-    case MMI_OPC_MFHI1:
+    case OPC_MFHI1:
         tcg_gen_mov_tl(cpu_gpr[reg], cpu_HI[1]);
         break;
-    case MMI_OPC_MFLO1:
+    case OPC_MFLO1:
         tcg_gen_mov_tl(cpu_gpr[reg], cpu_LO[1]);
         break;
-    case MMI_OPC_MTHI1:
+    case OPC_MTHI1:
         if (reg != 0) {
             tcg_gen_mov_tl(cpu_HI[1], cpu_gpr[reg]);
         } else {
             tcg_gen_movi_tl(cpu_HI[1], 0);
         }
         break;
-    case MMI_OPC_MTLO1:
+    case OPC_MTLO1:
         if (reg != 0) {
             tcg_gen_mov_tl(cpu_LO[1], cpu_gpr[reg]);
         } else {
@@ -3346,7 +3347,7 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
     gen_load_gpr(t1, rt);
 
     switch (opc) {
-    case MMI_OPC_DIV1:
+    case OPC_DIV1:
         {
             TCGv t2 = tcg_temp_new();
             TCGv t3 = tcg_temp_new();
@@ -3367,7 +3368,7 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
             tcg_temp_free(t2);
         }
         break;
-    case MMI_OPC_DIVU1:
+    case OPC_DIVU1:
         {
             TCGv t2 = tcg_const_tl(0);
             TCGv t3 = tcg_const_tl(1);
@@ -3622,7 +3623,7 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
     gen_load_gpr(t1, rt);
 
     switch (opc) {
-    case MMI_OPC_MULT1:
+    case OPC_MULT1:
         acc = 1;
         /* Fall through */
     case OPC_MULT:
@@ -3641,7 +3642,7 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             tcg_temp_free_i32(t3);
         }
         break;
-    case MMI_OPC_MULTU1:
+    case OPC_MULTU1:
         acc = 1;
         /* Fall through */
     case OPC_MULTU:
@@ -3660,10 +3661,10 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             tcg_temp_free_i32(t3);
         }
         break;
-    case MMI_OPC_MADD1:
+    case OPC_MADD1:
         acc = 1;
         /* Fall through */
-    case MMI_OPC_MADD:
+    case OPC_MADD:
         {
             TCGv_i64 t2 = tcg_temp_new_i64();
             TCGv_i64 t3 = tcg_temp_new_i64();
@@ -3682,10 +3683,10 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             tcg_temp_free_i64(t2);
         }
         break;
-    case MMI_OPC_MADDU1:
+    case OPC_MADDU1:
         acc = 1;
         /* Fall through */
-    case MMI_OPC_MADDU:
+    case OPC_MADDU:
         {
             TCGv_i64 t2 = tcg_temp_new_i64();
             TCGv_i64 t3 = tcg_temp_new_i64();
@@ -12644,24 +12645,24 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_CLASS_MMI3:
         decode_mmi3(env, ctx);
         break;
-    case MMI_OPC_MULT1:
-    case MMI_OPC_MULTU1:
-    case MMI_OPC_MADD:
-    case MMI_OPC_MADDU:
-    case MMI_OPC_MADD1:
-    case MMI_OPC_MADDU1:
+    case OPC_MULT1:
+    case OPC_MULTU1:
+    case OPC_MADD:
+    case OPC_MADDU:
+    case OPC_MADD1:
+    case OPC_MADDU1:
         gen_mul_txx9(ctx, opc, rd, rs, rt);
         break;
-    case MMI_OPC_DIV1:
-    case MMI_OPC_DIVU1:
+    case OPC_DIV1:
+    case OPC_DIVU1:
         gen_div1_tx79(ctx, opc, rs, rt);
         break;
-    case MMI_OPC_MTLO1:
-    case MMI_OPC_MTHI1:
+    case OPC_MTLO1:
+    case OPC_MTHI1:
         gen_HILO1_tx79(ctx, opc, rs);
         break;
-    case MMI_OPC_MFLO1:
-    case MMI_OPC_MFHI1:
+    case OPC_MFLO1:
+    case OPC_MFHI1:
         gen_HILO1_tx79(ctx, opc, rd);
         break;
     case MMI_OPC_PLZCW:         /* TODO: MMI_OPC_PLZCW */
-- 
2.26.2


