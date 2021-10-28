Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDE343F18A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:21:25 +0200 (CEST)
Received: from localhost ([::1]:33954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCpw-00048g-Jn
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeV-0007hV-Am
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeQ-0005C8-UF
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id v17so12434041wrv.9
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAfjJloQnYGFSzzOp/TWzPCwtj76sZwUhYLLTLki48c=;
 b=htqf2czP+x3MWhWgqTWOc9qk0lxzHuNKh4W75pp5oClv7HwuNr4u1YPEuNml3C1Sv6
 biCoshucvm+jRsPsA+9YVsDQaKsuuJcEhZjQMjlyI004AXW9VUUlIYQoOXCZ5SLQFO8u
 gmiIkZTfuqyy89PW18cD8w4Go5EBCKnNcGyBy8P3DV5g8pmbw0u7k6Lon6waBHiPdxbX
 H1qLZhNwrD3yE7Q98D1X1/wiDdYfESNdpQlabn42cw82ZMaEo03eEx4yRL2jgeHj7TIH
 R79uz6ejHNrnzzJjDiCyZ476eUnx9NjOI49cDkrSeaDuiXKGDBbkJZWFKYf70lloedv+
 PqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JAfjJloQnYGFSzzOp/TWzPCwtj76sZwUhYLLTLki48c=;
 b=K6FycYPC+6cJBtqratp0gLLomABD8RhogHogz56TLMojDfW8004OtgtbQZBEdNe2Rb
 dYYhewdZacyD35xwxCsHhO/oSkKfb9ZTL+6mDhrtOfcJjjDibuUMB65pw06zlxo0Mgm0
 ZEN1ZPZk5cBEsDnloAnwZZvuZwLNYW0l4lOFN7+wZgZgs8oI0Fx0S8gmhOKwyHh5fKUm
 m3jpiNdAKbNh1tzPYNbtOWvww1m238c0uGllkvwEXYL2z9jR7j8ILdDUbuL0b21vvsUJ
 HGTsiNPwQh0gJFZ12bQe1M98u2WR7DyDLiJsn5a5vrCu++DwX3hm//anlAxh95o6ejpU
 vstQ==
X-Gm-Message-State: AOAM532J6J4aWJuORSNcx9o+k7HcOpEDHNTo039gl7nhZQHuHIZkZds1
 cgt4MbFbXorgDdYtE9W0e91JYygh2sY=
X-Google-Smtp-Source: ABdhPJwLMyzpbmn0gXSogLoA01RSK1B8+/glL02qA9Vv40o6JbuS9XUxvvjpQbRhz25v/0ItsO8YDw==
X-Received: by 2002:adf:a152:: with SMTP id r18mr9091311wrr.317.1635455369408; 
 Thu, 28 Oct 2021 14:09:29 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l6sm3427805wmq.17.2021.10.28.14.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/32] target/mips: Convert MSA I5 instruction format to
 decodetree
Date: Thu, 28 Oct 2021 23:08:20 +0200
Message-Id: <20211028210843.2120802-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert instructions with a 5-bit immediate value to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Renamed &msa_i5 -> &msa_i
---
 target/mips/tcg/msa.decode      |  16 +++++
 target/mips/tcg/msa_translate.c | 102 ++++++++------------------------
 2 files changed, 41 insertions(+), 77 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index bdfe5a24cb3..cd2b618684a 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -15,10 +15,13 @@
 
 &msa_bz             df        wt sa
 &msa_ldi            df  wd       sa
+&msa_i              df  wd ws    sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
+@s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
@@ -30,6 +33,19 @@ BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
 {
+  ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
+  SUBVI             011110 001 .. ..... ..... ..... 000110  @u5
+  MAXI_S            011110 010 .. ..... ..... ..... 000110  @s5
+  MAXI_U            011110 011 .. ..... ..... ..... 000110  @u5
+  MINI_S            011110 100 .. ..... ..... ..... 000110  @s5
+  MINI_U            011110 101 .. ..... ..... ..... 000110  @u5
+
+  CEQI              011110 000 .. ..... ..... ..... 000111  @s5
+  CLTI_S            011110 010 .. ..... ..... ..... 000111  @s5
+  CLTI_U            011110 011 .. ..... ..... ..... 000111  @u5
+  CLEI_S            011110 100 .. ..... ..... ..... 000111  @s5
+  CLEI_U            011110 101 .. ..... ..... ..... 000111  @u5
+
   LDI               011110 110 .. ..........  ..... 000111  @ldi
 
   MSA               011110 --------------------------
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index ff78359597f..13e7317d3d8 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -27,8 +27,6 @@ enum {
     OPC_MSA_I8_00   = 0x00 | OPC_MSA,
     OPC_MSA_I8_01   = 0x01 | OPC_MSA,
     OPC_MSA_I8_02   = 0x02 | OPC_MSA,
-    OPC_MSA_I5_06   = 0x06 | OPC_MSA,
-    OPC_MSA_I5_07   = 0x07 | OPC_MSA,
     OPC_MSA_BIT_09  = 0x09 | OPC_MSA,
     OPC_MSA_BIT_0A  = 0x0A | OPC_MSA,
     OPC_MSA_3R_0D   = 0x0D | OPC_MSA,
@@ -58,19 +56,6 @@ enum {
 };
 
 enum {
-    /* I5 instruction df(bits 22..21) = _b, _h, _w, _d */
-    OPC_ADDVI_df    = (0x0 << 23) | OPC_MSA_I5_06,
-    OPC_CEQI_df     = (0x0 << 23) | OPC_MSA_I5_07,
-    OPC_SUBVI_df    = (0x1 << 23) | OPC_MSA_I5_06,
-    OPC_MAXI_S_df   = (0x2 << 23) | OPC_MSA_I5_06,
-    OPC_CLTI_S_df   = (0x2 << 23) | OPC_MSA_I5_07,
-    OPC_MAXI_U_df   = (0x3 << 23) | OPC_MSA_I5_06,
-    OPC_CLTI_U_df   = (0x3 << 23) | OPC_MSA_I5_07,
-    OPC_MINI_S_df   = (0x4 << 23) | OPC_MSA_I5_06,
-    OPC_CLEI_S_df   = (0x4 << 23) | OPC_MSA_I5_07,
-    OPC_MINI_U_df   = (0x5 << 23) | OPC_MSA_I5_06,
-    OPC_CLEI_U_df   = (0x5 << 23) | OPC_MSA_I5_07,
-
     /* I8 instruction */
     OPC_ANDI_B      = (0x0 << 24) | OPC_MSA_I8_00,
     OPC_BMNZI_B     = (0x0 << 24) | OPC_MSA_I8_01,
@@ -312,6 +297,8 @@ static inline bool check_msa_enabled(DisasContext *ctx)
     return true;
 }
 
+typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -461,69 +448,34 @@ static void gen_msa_i8(DisasContext *ctx)
     tcg_temp_free_i32(ti8);
 }
 
-static void gen_msa_i5(DisasContext *ctx)
+static bool trans_msa_i5(DisasContext *ctx, arg_msa_i *a,
+                         gen_helper_piiii *gen_msa_i5)
 {
-#define MASK_MSA_I5(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-    int8_t s5 = (int8_t) sextract32(ctx->opcode, 16, 5);
-    uint8_t u5 = extract32(ctx->opcode, 16, 5);
-
-    TCGv_i32 tdf = tcg_const_i32(extract32(ctx->opcode, 21, 2));
-    TCGv_i32 twd = tcg_const_i32(extract32(ctx->opcode, 11, 5));
-    TCGv_i32 tws = tcg_const_i32(extract32(ctx->opcode, 6, 5));
-    TCGv_i32 timm = tcg_temp_new_i32();
-    tcg_gen_movi_i32(timm, u5);
-
-    switch (MASK_MSA_I5(ctx->opcode)) {
-    case OPC_ADDVI_df:
-        gen_helper_msa_addvi_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_SUBVI_df:
-        gen_helper_msa_subvi_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_MAXI_S_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_maxi_s_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_MAXI_U_df:
-        gen_helper_msa_maxi_u_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_MINI_S_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_mini_s_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_MINI_U_df:
-        gen_helper_msa_mini_u_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CEQI_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_ceqi_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CLTI_S_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_clti_s_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CLTI_U_df:
-        gen_helper_msa_clti_u_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CLEI_S_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_clei_s_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CLEI_U_df:
-        gen_helper_msa_clei_u_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
+    if (!check_msa_enabled(ctx)) {
+        return true;
     }
 
-    tcg_temp_free_i32(tdf);
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(timm);
+    gen_msa_i5(cpu_env,
+               tcg_constant_i32(a->df),
+               tcg_constant_i32(a->wd),
+               tcg_constant_i32(a->ws),
+               tcg_constant_i32(a->sa));
+
+    return true;
 }
 
+TRANS(ADDVI,    trans_msa_i5, gen_helper_msa_addvi_df);
+TRANS(SUBVI,    trans_msa_i5, gen_helper_msa_subvi_df);
+TRANS(MAXI_S,   trans_msa_i5, gen_helper_msa_maxi_s_df);
+TRANS(MAXI_U,   trans_msa_i5, gen_helper_msa_maxi_u_df);
+TRANS(MINI_S,   trans_msa_i5, gen_helper_msa_mini_s_df);
+TRANS(MINI_U,   trans_msa_i5, gen_helper_msa_mini_u_df);
+TRANS(CLTI_S,   trans_msa_i5, gen_helper_msa_clti_s_df);
+TRANS(CLTI_U,   trans_msa_i5, gen_helper_msa_clti_u_df);
+TRANS(CLEI_S,   trans_msa_i5, gen_helper_msa_clei_s_df);
+TRANS(CLEI_U,   trans_msa_i5, gen_helper_msa_clei_u_df);
+TRANS(CEQI,     trans_msa_i5, gen_helper_msa_ceqi_df);
+
 static bool trans_LDI(DisasContext *ctx, arg_msa_ldi *a)
 {
     if (!check_msa_enabled(ctx)) {
@@ -2166,10 +2118,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_I8_02:
         gen_msa_i8(ctx);
         break;
-    case OPC_MSA_I5_06:
-    case OPC_MSA_I5_07:
-        gen_msa_i5(ctx);
-        break;
     case OPC_MSA_BIT_09:
     case OPC_MSA_BIT_0A:
         gen_msa_bit(ctx);
-- 
2.31.1


