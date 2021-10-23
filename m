Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D514385A2
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:57:56 +0200 (CEST)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP1X-0001pc-Iv
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOt1-00056S-Kl
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsz-0005Tx-9o
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 y22-20020a1c7d16000000b003231ea3d705so8246787wmc.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nsEohNEwrhu8Aem4tlRNJJjtbidr9jHp4BNgaPtAgyw=;
 b=LY3t46G4tZTk2WgPPx8j/chF6bfU2dlqZwFpJmpJ8RPvxR1HyBB4nng/adf7gtJFRs
 eAzaNeC/v39pt9NvyK8drO4TFTWzM4byAjsXRdssvwui7k0aEAh5CIl6ZyMvzgIjcYTv
 QbK6fwsZ5BwtBgOSI1d29m5uI290ZEkMTKkI+CVQgwoT714/BhaKHb4AD+BEvSEFd32P
 ebjnfAMhdyfREXe+sbJtr65u/L7kiUftAzSY86szdql4GxkdZRPFqnFThXoOMhogf6DI
 EO9Dol7hLVmTKXipSX+l9M3AuMu9hm1QGvJ6vjWrgw232x5vF6PbUr8tRuMtRmWpH3Sx
 sUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nsEohNEwrhu8Aem4tlRNJJjtbidr9jHp4BNgaPtAgyw=;
 b=3j/bbLcUDRIDxEJ7AfKJdIevXSJ6jVmy1ZOsi1Tp/RyKHNvSS118iT05G4T90aMBqX
 27oLozqb1J5gnOKZlneoEXVxVmOZvIYT7cXv3+LAEqxaB/2/ALAnzjSojYook1c1zqAF
 if10PMorKJimKUfxlNF09DAiKGIZTi1qPcHUIP7WSSnViBFJDQmvb+DcntQlbOn/n9Bk
 uybQMA8kxhdBJ/zDBE92lyCnVl3+0vFwO/8yrccs7kWcu6GTY5JjVuv7F6JMtcdC4PhC
 m7FhRrgYJnRi6YEAaGKpDk3LGlXkCXel/ys0FifTmSJpHVHNFuiyYTCU+bLrsr7bEx/L
 IkEA==
X-Gm-Message-State: AOAM532ELe3IRBe8K89+DwfE9n8C79gjIgh7xVEMBwdLCcqfzgMgYGnA
 F0dGIzuRoA3pHU7BRsFe2wS0wYsjtfg=
X-Google-Smtp-Source: ABdhPJzGwyuo6DTM9YMczF5R5OOnAwmJ3P5ys5zRPgIeKlrhZrKOKPiUWNdQnOTs4osMKJmKh7LqCg==
X-Received: by 2002:a05:600c:2257:: with SMTP id
 a23mr18951295wmm.182.1635025743672; 
 Sat, 23 Oct 2021 14:49:03 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z135sm16764317wmc.45.2021.10.23.14.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/33] target/mips: Convert MSA BIT instruction format to
 decodetree
Date: Sat, 23 Oct 2021 23:47:42 +0200
Message-Id: <20211023214803.522078-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert instructions with an immediate bit index and
data format df/m to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      | 15 +++++
 target/mips/tcg/msa_translate.c | 98 ++++++++-------------------------
 2 files changed, 39 insertions(+), 74 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 5aaa85456da..91d71ff560c 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -22,6 +22,7 @@
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldst ws=0
+@bit                ...... ... df:7       ws:5 wd:5 ......  &msa_ldst sa=0
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
@@ -47,5 +48,19 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   LDI               011110 110 .. ..........  ..... 000111  @ldi
 
+  SLLI              011110 000 ....... ..... .....  001001  @bit
+  SRAI              011110 001 ....... ..... .....  001001  @bit
+  SRLI              011110 010 ....... ..... .....  001001  @bit
+  BCLRI             011110 011 ....... ..... .....  001001  @bit
+  BSETI             011110 100 ....... ..... .....  001001  @bit
+  BNEGI             011110 101 ....... ..... .....  001001  @bit
+  BINSLI            011110 110 ....... ..... .....  001001  @bit
+  BINSRI            011110 111 ....... ..... .....  001001  @bit
+
+  SAT_S             011110 000 ....... ..... .....  001010  @bit
+  SAT_U             011110 001 ....... ..... .....  001010  @bit
+  SRARI             011110 010 ....... ..... .....  001010  @bit
+  SRLRI             011110 011 ....... ..... .....  001010  @bit
+
   MSA               011110 --------------------------
 }
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 962aef601cb..10bbe25172a 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -27,8 +27,6 @@ enum {
     OPC_MSA_I8_00   = 0x00 | OPC_MSA,
     OPC_MSA_I8_01   = 0x01 | OPC_MSA,
     OPC_MSA_I8_02   = 0x02 | OPC_MSA,
-    OPC_MSA_BIT_09  = 0x09 | OPC_MSA,
-    OPC_MSA_BIT_0A  = 0x0A | OPC_MSA,
     OPC_MSA_3R_0D   = 0x0D | OPC_MSA,
     OPC_MSA_3R_0E   = 0x0E | OPC_MSA,
     OPC_MSA_3R_0F   = 0x0F | OPC_MSA,
@@ -222,20 +220,6 @@ enum {
     OPC_MSUBR_Q_df  = (0xE << 22) | OPC_MSA_3RF_1C,
     OPC_FSULE_df    = (0xF << 22) | OPC_MSA_3RF_1A,
     OPC_FMAX_A_df   = (0xF << 22) | OPC_MSA_3RF_1B,
-
-    /* BIT instruction df(bits 22..16) = _B _H _W _D */
-    OPC_SLLI_df     = (0x0 << 23) | OPC_MSA_BIT_09,
-    OPC_SAT_S_df    = (0x0 << 23) | OPC_MSA_BIT_0A,
-    OPC_SRAI_df     = (0x1 << 23) | OPC_MSA_BIT_09,
-    OPC_SAT_U_df    = (0x1 << 23) | OPC_MSA_BIT_0A,
-    OPC_SRLI_df     = (0x2 << 23) | OPC_MSA_BIT_09,
-    OPC_SRARI_df    = (0x2 << 23) | OPC_MSA_BIT_0A,
-    OPC_BCLRI_df    = (0x3 << 23) | OPC_MSA_BIT_09,
-    OPC_SRLRI_df    = (0x3 << 23) | OPC_MSA_BIT_0A,
-    OPC_BSETI_df    = (0x4 << 23) | OPC_MSA_BIT_09,
-    OPC_BNEGI_df    = (0x5 << 23) | OPC_MSA_BIT_09,
-    OPC_BINSLI_df   = (0x6 << 23) | OPC_MSA_BIT_09,
-    OPC_BINSRI_df   = (0x7 << 23) | OPC_MSA_BIT_09,
 };
 
 static const char msaregnames[][6] = {
@@ -547,78 +531,48 @@ static bool trans_LDI(DisasContext *ctx, arg_msa_ldst *a)
     return true;
 }
 
-static void gen_msa_bit(DisasContext *ctx)
+static bool trans_msa_bit(DisasContext *ctx, arg_msa_ldst *a,
+                          void (*gen_msa_bit)(TCGv_ptr, TCGv_i32, TCGv_i32,
+                                              TCGv_i32, TCGv_i32))
 {
-#define MASK_MSA_BIT(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-    uint8_t dfm = (ctx->opcode >> 16) & 0x7f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-
     TCGv_i32 tdf;
     TCGv_i32 tm;
     TCGv_i32 twd;
     TCGv_i32 tws;
     uint32_t df, m;
 
-    if (!df_extract(df_bit, dfm, &df, &m)) {
+    if (!df_extract(df_bit, a->df, &df, &m)) {
         gen_reserved_instruction(ctx);
-        return;
+        return true;
     }
 
-    tdf = tcg_const_i32(df);
+    tdf = tcg_constant_i32(df);
     tm  = tcg_const_i32(m);
-    twd = tcg_const_i32(wd);
-    tws = tcg_const_i32(ws);
+    twd = tcg_const_i32(a->wd);
+    tws = tcg_const_i32(a->ws);
 
-    switch (MASK_MSA_BIT(ctx->opcode)) {
-    case OPC_SLLI_df:
-        gen_helper_msa_slli_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SRAI_df:
-        gen_helper_msa_srai_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SRLI_df:
-        gen_helper_msa_srli_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BCLRI_df:
-        gen_helper_msa_bclri_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BSETI_df:
-        gen_helper_msa_bseti_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BNEGI_df:
-        gen_helper_msa_bnegi_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BINSLI_df:
-        gen_helper_msa_binsli_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BINSRI_df:
-        gen_helper_msa_binsri_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SAT_S_df:
-        gen_helper_msa_sat_s_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SAT_U_df:
-        gen_helper_msa_sat_u_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SRARI_df:
-        gen_helper_msa_srari_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SRLRI_df:
-        gen_helper_msa_srlri_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
+    gen_msa_bit(cpu_env, tdf, twd, tws, tm);
 
-    tcg_temp_free_i32(tdf);
     tcg_temp_free_i32(tm);
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
+
+    return true;
 }
 
+TRANS_MSA(SLLI,     trans_msa_bit, gen_helper_msa_slli_df);
+TRANS_MSA(SRAI,     trans_msa_bit, gen_helper_msa_srai_df);
+TRANS_MSA(SRLI,     trans_msa_bit, gen_helper_msa_srli_df);
+TRANS_MSA(BCLRI,    trans_msa_bit, gen_helper_msa_bclri_df);
+TRANS_MSA(BSETI,    trans_msa_bit, gen_helper_msa_bseti_df);
+TRANS_MSA(BNEGI,    trans_msa_bit, gen_helper_msa_bnegi_df);
+TRANS_MSA(BINSLI,   trans_msa_bit, gen_helper_msa_binsli_df);
+TRANS_MSA(BINSRI,   trans_msa_bit, gen_helper_msa_binsri_df);
+TRANS_MSA(SAT_S,    trans_msa_bit, gen_helper_msa_sat_u_df);
+TRANS_MSA(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
+TRANS_MSA(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
+TRANS_MSA(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
+
 static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
@@ -2151,10 +2105,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_I8_02:
         gen_msa_i8(ctx);
         break;
-    case OPC_MSA_BIT_09:
-    case OPC_MSA_BIT_0A:
-        gen_msa_bit(ctx);
-        break;
     case OPC_MSA_3R_0D:
     case OPC_MSA_3R_0E:
     case OPC_MSA_3R_0F:
-- 
2.31.1


