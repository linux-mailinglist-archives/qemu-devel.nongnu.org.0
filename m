Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54958442F97
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:59:39 +0100 (CET)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuK9-0005WK-Rw
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5m-0002hg-GX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5k-0006C7-Eq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:46 -0400
Received: by mail-wr1-x431.google.com with SMTP id d3so33369981wrh.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LqwBJerLBDFLSFJfvytdmmWeHWEAxyydIf71IuspVos=;
 b=h060gk764/HAHBQfmSaRgZDbu5HgbXDnWhbQGgWgpSRfGEgUGKC7gqCJRAzFgAIQrd
 ynO3zUyAM0H7GkaOzuqsA5DmNLWt9gpAytdIdyLq2Id5LPBXSRERjasGjqCQyj6wrBjq
 E1S8i2f7Hu286kZQfMw+O6cn9S7M5UbQrcKjaHekZyjRmfhLVIlQkoNm5Idc07loEHcp
 wUq1ZFcAR72uayiLAHDDPpnJFTJ6JScyN7RrTyxf4jAlxQbnSQgl2yYyVgiY77YPIC+f
 3Q3aUUbMO9DOifMjMEMvlfIZe83v4t7l7s5SzAWK6/Eto4k39To06ebE4M1GonExRd84
 RI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LqwBJerLBDFLSFJfvytdmmWeHWEAxyydIf71IuspVos=;
 b=t+pwr7M9YGz8CQiPDWjMt5b6/IZTzu7b1roPVQgc1UMOLP2sgoocgN1PxV0OG3PJJl
 RVLsduf6DHWCAb77kX7MyXFVZp39z8rYs961u6fQrEU4qFtiX3IxrQlCv0S8/kGTGEj7
 ljuIqL+8rxcPB0BL3yk/d2f5WYZWqFjCqK2EeO+Mh/wEqLUe4WHIoOj5R1V7wJgddaR0
 v0vXUCJAPr1FPDynW/GMbZiaUm54CPNnXJDinccIsYQwPvlIR8RPOPGBn267hb+Rldae
 E7u3yCitKy2qKFWynJMMrkI77b/ET8Wb5fnQAKjFXEMi11b3ncM2dv09+dP25Yy07t/q
 HJJw==
X-Gm-Message-State: AOAM532f4jDToj2BZmg6PYLY8eXS48QXllPzJnE1nAwvGIrqO9RgUQFx
 463myCUuVfkt28t2fEb/30IFHyksNBk=
X-Google-Smtp-Source: ABdhPJwZcVHMW1uJvxBP3pIFbfkgKg85bTiS+6FBZSpcimqk7p1YXYqm02OxHb0uvGj9dhnODjmsAA==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr47297326wrd.63.1635860681969; 
 Tue, 02 Nov 2021 06:44:41 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 k37sm2491857wms.21.2021.11.02.06.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:44:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/41] target/mips: Convert MSA 3R instruction format to
 decodetree (part 3/4)
Date: Tue,  2 Nov 2021 14:42:24 +0100
Message-Id: <20211102134240.3036524-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

Convert BINSL (Vector Bit Insert Left) and BINSR (Vector Bit
Insert Right) opcodes to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-23-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  3 +++
 target/mips/tcg/msa_translate.c | 40 +++++----------------------------
 2 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 0e2f474cde6..f2bacbaea86 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -89,6 +89,9 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  BINSL             011110 110.. ..... ..... .....  001101  @3r
+  BINSR             011110 111.. ..... ..... .....  001101  @3r
+
   DOTP_S            011110 000.. ..... ..... .....  010011  @3r
   DOTP_U            011110 001.. ..... ..... .....  010011  @3r
   DPADD_S           011110 010.. ..... ..... .....  010011  @3r
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 5f3e1573e43..c52913632c5 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -91,12 +91,10 @@ enum {
     OPC_ASUB_U_df   = (0x5 << 23) | OPC_MSA_3R_11,
     OPC_DIV_U_df    = (0x5 << 23) | OPC_MSA_3R_12,
     OPC_ILVR_df     = (0x5 << 23) | OPC_MSA_3R_14,
-    OPC_BINSL_df    = (0x6 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_A_df    = (0x6 << 23) | OPC_MSA_3R_0E,
     OPC_AVER_S_df   = (0x6 << 23) | OPC_MSA_3R_10,
     OPC_MOD_S_df    = (0x6 << 23) | OPC_MSA_3R_12,
     OPC_ILVEV_df    = (0x6 << 23) | OPC_MSA_3R_14,
-    OPC_BINSR_df    = (0x7 << 23) | OPC_MSA_3R_0D,
     OPC_MIN_A_df    = (0x7 << 23) | OPC_MSA_3R_0E,
     OPC_AVER_U_df   = (0x7 << 23) | OPC_MSA_3R_10,
     OPC_MOD_U_df    = (0x7 << 23) | OPC_MSA_3R_12,
@@ -245,6 +243,9 @@ typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 #define TRANS_DF_ii(NAME, trans_func, gen_func) \
     TRANS_DF_x(ii, NAME, trans_func, gen_func)
 
+#define TRANS_DF_iii(NAME, trans_func, gen_func) \
+    TRANS_DF_x(iii, NAME, trans_func, gen_func)
+
 #define TRANS_DF_iii_b(NAME, trans_func, gen_func) \
     static gen_helper_piii * const NAME##_tab[4] = { \
         NULL, gen_func##_h, gen_func##_w, gen_func##_d \
@@ -505,6 +506,9 @@ TRANS(BMNZ_V,           trans_msa_3r,   gen_helper_msa_bmnz_v);
 TRANS(BMZ_V,            trans_msa_3r,   gen_helper_msa_bmz_v);
 TRANS(BSEL_V,           trans_msa_3r,   gen_helper_msa_bsel_v);
 
+TRANS_DF_iii(BINSL,     trans_msa_3r,   gen_helper_msa_binsl);
+TRANS_DF_iii(BINSR,     trans_msa_3r,   gen_helper_msa_binsr);
+
 TRANS_DF_iii_b(DOTP_S,  trans_msa_3r,   gen_helper_msa_dotp_s);
 TRANS_DF_iii_b(DOTP_U,  trans_msa_3r,   gen_helper_msa_dotp_u);
 TRANS_DF_iii_b(DPADD_S, trans_msa_3r,   gen_helper_msa_dpadd_s);
@@ -535,38 +539,6 @@ static void gen_msa_3r(DisasContext *ctx)
     TCGv_i32 twt = tcg_const_i32(wt);
 
     switch (MASK_MSA_3R(ctx->opcode)) {
-    case OPC_BINSL_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_binsl_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_binsl_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_binsl_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_binsl_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_BINSR_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_binsr_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_binsr_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_binsr_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_binsr_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
     case OPC_BCLR_df:
         switch (df) {
         case DF_BYTE:
-- 
2.31.1


