Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F12BB86B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:37:15 +0100 (CET)
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgE5i-00048Q-Am
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDg1-0004kV-5J
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfz-0004NA-6k
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id d142so11861492wmd.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rm8hYLTL5cania5VITZzWfQieMs0D23dPfzaoPosV3I=;
 b=aoIfLHmArPUFlfb8IQyDQfmyvkvM7vjFtHFV6CC3bDthy6ZCgN561wVaGoPsX27VTZ
 u6ySV/6fNwFgbDFl4El5WgDd80YxWwhdCiYc38gKdLBRnw/VlGnHpPLBMrw5XTNLQOZa
 hwyUV3OGAAm016e7l5T2lcuLM6f7eQrJPUpmYtghGZ8XwwCSq+pebi12cy33Jd+q5zHr
 0OBzkGmfySbrGzFfo4+NlOpUN3x62n6qHPQwI2hQmSZcVkHUdsDDiKE1fmKysa7m6P61
 h2U8MorLmrN58f8ITmjO3+s8fzUla5PWVBpEjsCaD1P91zincUyNZAQFnpAvM59YmUBy
 +QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rm8hYLTL5cania5VITZzWfQieMs0D23dPfzaoPosV3I=;
 b=e+pI+/o7rRDLX7QY37qV1iCVt9Pf7zAIawnJ2rNG3/OOqFm9gDP4BmYb+FyCM0KCXs
 D0nYXTrOsay7MvrXw2Opvt1TTQT7FakOVDUFxAlOKk+dSANoAltyv1GOxLLvNwniNoTc
 t/mkGSEHTtSp1xGrkfiFOD2MfOLHUjsDEoHUxC5aE1oyj19F0I7SzR+/Abtb3oKIB29a
 xA/cgWuFIIh3q+0+RxcDpX29CmKmeSqtz9RB59N5kMNvGXE544s5S/rx90buDzCBNrU2
 SjYudlXvFX+C2MpxylugiZoGAV/EkuGMsYqHpGnA8ibseNjXiR+Cky0FKjBlfM4/GFD1
 QikQ==
X-Gm-Message-State: AOAM532Rrp/Xzmtz12Looep5Rni6MEGl5u0Gc/rnLQDxgLoJj2fWJDbJ
 CugTmYinhXiqUbIyL4kJFTrQu8axVCs=
X-Google-Smtp-Source: ABdhPJxTKACMefaqiPzdHIy+zYI1qEKZk1BrAvic6PRNwPiMFWrFztjZSrix7u7NnFO0kqMIMmk2/w==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr11632954wmc.111.1605906637583; 
 Fri, 20 Nov 2020 13:10:37 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g131sm5857149wma.35.2020.11.20.13.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/26] target/mips: Make pipeline 1 multiply opcodes generic
Date: Fri, 20 Nov 2020 22:08:39 +0100
Message-Id: <20201120210844.2625602-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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

Special2 multiply opcodes are not specific to Toshiba TX79,
and are not part of its multimedia extension.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 75 +++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 0914b89eae6..6b35498dd3d 100644
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
@@ -933,21 +946,9 @@ enum {
 
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
@@ -3049,26 +3050,26 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
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
@@ -3443,7 +3444,7 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
     gen_load_gpr(t1, rt);
 
     switch (opc) {
-    case MMI_OPC_DIV1:
+    case OPC_DIV1:
         {
             TCGv t2 = tcg_temp_new();
             TCGv t3 = tcg_temp_new();
@@ -3464,7 +3465,7 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
             tcg_temp_free(t2);
         }
         break;
-    case MMI_OPC_DIVU1:
+    case OPC_DIVU1:
         {
             TCGv t2 = tcg_const_tl(0);
             TCGv t3 = tcg_const_tl(1);
@@ -3719,7 +3720,7 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
     gen_load_gpr(t1, rt);
 
     switch (opc) {
-    case MMI_OPC_MULT1:
+    case OPC_MULT1:
         acc = 1;
         /* Fall through */
     case OPC_MULT:
@@ -3738,7 +3739,7 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             tcg_temp_free_i32(t3);
         }
         break;
-    case MMI_OPC_MULTU1:
+    case OPC_MULTU1:
         acc = 1;
         /* Fall through */
     case OPC_MULTU:
@@ -3757,10 +3758,10 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
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
@@ -3779,10 +3780,10 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
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
@@ -12741,24 +12742,24 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
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


