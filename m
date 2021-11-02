Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B7442F62
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:51:02 +0100 (CET)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuBp-0004Ko-Ow
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4z-00019E-UW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:58 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4x-00063y-Rt
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:57 -0400
Received: by mail-wr1-x42f.google.com with SMTP id o14so33281913wra.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/blkpftsPcSQ6nROrJWlw52a9nymMffz2N9GqEnnow0=;
 b=U/k1TN3YUNhft1KkvSOh4j2XWvYABiU2oT1ZJL+wTKrpYg+WXqkOT69MV4ZubCvIhX
 yqEpnf2B5DydaExtNro1cy3ColkCErCqWeludEvYweeOXAA0wFPwJk59Q96R6G8O11Kl
 LUEk+0dpCluB6z+5SjxVOx3kxBXCA4M0ERngHKAcLTqGfe741MtZMxXOWA3nWtC7DT55
 HSlAUGiqvk2SmtBy2EcSum+xro5+pRB7hS9jeSW0zenD/9NSpk3Zg26xq0M4fHumAkwg
 0PWMEtdHbBFfin+fMiAH1PZ/fYayFS9t8esRCls1BOxJ/fI4vlUAyO/8JoPWKmJ3HhGE
 H42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/blkpftsPcSQ6nROrJWlw52a9nymMffz2N9GqEnnow0=;
 b=UFtUChdkSst9nc/j37HfR+Lract/PUpvMuR0DeshhIyx9wekxthM0rfeNKGNmDoeGD
 4Khopcv+3gfjvewGAOQNctWWXel81x3ABHHY6qCcKZgtWSAPfvR8PxyAU6vQdyqlf5Hz
 ByMJjKorWZzRwC5pVNuW5aCDbEYGTcTgSTJC//o26x2O6eTxiEU9U8UxaP3DWg55zs0l
 uI7lBPhpqwXiM4RWoYaWmxgFITqjrPwAvDcwIkHAP9AukAV8ITrFaNFJ07cue0C39k1G
 xTot7tB5fC5J/Kol1aHyZiYnci726a5hHr5nN0syBTaHaUwYoe/SejBYdKPrKBxg7PiL
 AuRw==
X-Gm-Message-State: AOAM530nRiMccbfpz1FEczYoZwZodT3U0amzVq3tLpj6zpuXd1X9iwMi
 1KdeKQO7RVMzbF3qFqAWKd7ThQ32hxg=
X-Google-Smtp-Source: ABdhPJxIDb5soZpZeSzMsUGkHiDOk1EFCHdjFRPIkErIrvFVC4rtWNdEuC6fO26lymXQyST82uDGnA==
X-Received: by 2002:adf:c604:: with SMTP id n4mr46108604wrg.202.1635860634369; 
 Tue, 02 Nov 2021 06:43:54 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 b197sm2661221wmb.24.2021.11.02.06.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:43:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/41] target/mips: Convert MSA I8 instruction format to
 decodetree
Date: Tue,  2 Nov 2021 14:42:14 +0100
Message-Id: <20211102134240.3036524-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert instructions with an 8-bit immediate value and either
implicit data format or data format df to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-13-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 ++++
 target/mips/tcg/msa_translate.c | 75 +++++++++------------------------
 2 files changed, 27 insertions(+), 56 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 8e887f54ad5..24847599a05 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -27,6 +27,7 @@
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
 @i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_i
+@i8                 ...... ..       sa:s8 ws:5 wd:5 ......  &msa_i df=0
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
 @bit                ...... ... .......    ws:5 wd:5 ......  &msa_bit df=%bit_df m=%bit_m
 
@@ -39,6 +40,13 @@ BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
 {
+  ANDI              011110 00 ........ ..... .....  000000  @i8
+  ORI               011110 01 ........ ..... .....  000000  @i8
+  NORI              011110 10 ........ ..... .....  000000  @i8
+  XORI              011110 11 ........ ..... .....  000000  @i8
+  BMNZI             011110 00 ........ ..... .....  000001  @i8
+  BMZI              011110 01 ........ ..... .....  000001  @i8
+  BSELI             011110 10 ........ ..... .....  000001  @i8
   SHF               011110 .. ........ ..... .....  000010  @i8_df
 
   ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 1b1d88ac646..7e5bd783df0 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -27,9 +27,6 @@ static int bit_df(DisasContext *ctx, int x);
 
 #define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
 enum {
-    OPC_MSA_I8_00   = 0x00 | OPC_MSA,
-    OPC_MSA_I8_01   = 0x01 | OPC_MSA,
-    OPC_MSA_I8_02   = 0x02 | OPC_MSA,
     OPC_MSA_3R_0D   = 0x0D | OPC_MSA,
     OPC_MSA_3R_0E   = 0x0E | OPC_MSA,
     OPC_MSA_3R_0F   = 0x0F | OPC_MSA,
@@ -57,15 +54,6 @@ enum {
 };
 
 enum {
-    /* I8 instruction */
-    OPC_ANDI_B      = (0x0 << 24) | OPC_MSA_I8_00,
-    OPC_BMNZI_B     = (0x0 << 24) | OPC_MSA_I8_01,
-    OPC_ORI_B       = (0x1 << 24) | OPC_MSA_I8_00,
-    OPC_BMZI_B      = (0x1 << 24) | OPC_MSA_I8_01,
-    OPC_NORI_B      = (0x2 << 24) | OPC_MSA_I8_00,
-    OPC_BSELI_B     = (0x2 << 24) | OPC_MSA_I8_01,
-    OPC_XORI_B      = (0x3 << 24) | OPC_MSA_I8_00,
-
     /* VEC/2R/2RF instruction */
     OPC_AND_V       = (0x00 << 21) | OPC_MSA_VEC,
     OPC_OR_V        = (0x01 << 21) | OPC_MSA_VEC,
@@ -336,6 +324,7 @@ static inline bool check_msa_enabled(DisasContext *ctx)
     return true;
 }
 
+typedef void gen_helper_piii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
@@ -429,50 +418,29 @@ static bool trans_BNZ(DisasContext *ctx, arg_msa_bz *a)
     return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, true);
 }
 
-static void gen_msa_i8(DisasContext *ctx)
+static bool trans_msa_i8(DisasContext *ctx, arg_msa_i *a,
+                         gen_helper_piii *gen_msa_i8)
 {
-#define MASK_MSA_I8(op)    (MASK_MSA_MINOR(op) | (op & (0x03 << 24)))
-    uint8_t i8 = (ctx->opcode >> 16) & 0xff;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 ti8 = tcg_const_i32(i8);
-
-    switch (MASK_MSA_I8(ctx->opcode)) {
-    case OPC_ANDI_B:
-        gen_helper_msa_andi_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_ORI_B:
-        gen_helper_msa_ori_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_NORI_B:
-        gen_helper_msa_nori_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_XORI_B:
-        gen_helper_msa_xori_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_BMNZI_B:
-        gen_helper_msa_bmnzi_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_BMZI_B:
-        gen_helper_msa_bmzi_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_BSELI_B:
-        gen_helper_msa_bseli_b(cpu_env, twd, tws, ti8);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
+    if (!check_msa_enabled(ctx)) {
+        return true;
     }
 
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(ti8);
+    gen_msa_i8(cpu_env,
+               tcg_constant_i32(a->wd),
+               tcg_constant_i32(a->ws),
+               tcg_constant_i32(a->sa));
+
+    return true;
 }
 
+TRANS(ANDI,     trans_msa_i8, gen_helper_msa_andi_b);
+TRANS(ORI,      trans_msa_i8, gen_helper_msa_ori_b);
+TRANS(NORI,     trans_msa_i8, gen_helper_msa_nori_b);
+TRANS(XORI,     trans_msa_i8, gen_helper_msa_xori_b);
+TRANS(BMNZI,    trans_msa_i8, gen_helper_msa_bmnzi_b);
+TRANS(BMZI,     trans_msa_i8, gen_helper_msa_bmzi_b);
+TRANS(BSELI,    trans_msa_i8, gen_helper_msa_bseli_b);
+
 static bool trans_SHF(DisasContext *ctx, arg_msa_i *a)
 {
     if (a->df == DF_DOUBLE) {
@@ -2106,11 +2074,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     }
 
     switch (MASK_MSA_MINOR(opcode)) {
-    case OPC_MSA_I8_00:
-    case OPC_MSA_I8_01:
-    case OPC_MSA_I8_02:
-        gen_msa_i8(ctx);
-        break;
     case OPC_MSA_3R_0D:
     case OPC_MSA_3R_0E:
     case OPC_MSA_3R_0F:
-- 
2.31.1


