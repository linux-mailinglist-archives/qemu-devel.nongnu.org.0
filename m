Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5B1442FA8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:00:53 +0100 (CET)
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuLM-0000YU-Eg
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5T-0001o7-IJ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:27 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5R-00067F-EN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d13so33396223wrf.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRFqNue7p0Qm34S0HJ0qJjQT9HmvoceQ86OEjAtLFvk=;
 b=pqiteujifMRhice6OOFylkLmfsiNwBB0OVa/FNYPS920yjVbn8728dL3eO6B/eacHw
 ZfG/UWnfXQBRFN5AKXmvvNiEGSXfiHoK3K4/XQjeOeGBQtpTVNIFDS5u115WP19DJ0CR
 cAvy+RKUCTXTqvTCqFV7mRUSNJ0KJsXVUtx93pxoYloFKwFBBZ6iRcK0CQl5TZbzK1Yt
 OLRB+TzHe5w1HXkq13rpQf4NaMsmxUxbQJOt0P7RN8FkRrM/UcdTdShmYeFqQTVbbBxl
 A+ZyVtv0CzMBy9IoJJ1z2vzewHFhG/R+EJw0gjiE2ROBt5CMOcy0cTgqYd+iLvPYn7tg
 oEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jRFqNue7p0Qm34S0HJ0qJjQT9HmvoceQ86OEjAtLFvk=;
 b=r18UvgtexyykX7eGpRmDyec9fD8qYybOW4Vf5pCKGcETWxAsxUCUyTSmSC51jW9Bbp
 CxoExoWZefMfjDc19aNfRMUDRfOrbIjzJG/wKC63MlrebFad9cucXcyrHci4WpHk1IlU
 CSc2kFExsNa0OwsgSdUuWNwyQCLE534O5fn0Z75Pzopj/N7X8wy7ageaPx7BGlr6zyoh
 gpYuD0LGJQLx113iJTbe2A310kTIXnVT2ewnDyUyfjx0qv6PB+fLMq/F+f92PpKmAK6X
 usf76QSWmnXiJ15IZ0s7CaicC2TCM0DNjltyWilSrKdJr/veL3T5k83ju3qW8Ok97c0S
 qeQw==
X-Gm-Message-State: AOAM532aQHc/jvqjmAYPBsB/27lnN5hPHmvFQlq8BebQ94+NZov9Jsi5
 jIMNmhPgv7XfjPTFweXSPskrp1ijt7U=
X-Google-Smtp-Source: ABdhPJyw5l5nufgzy3+ok/UdzExCChrGpBkSiznPrES6SNvG82VFuouUX01oqVau6lC9Md5NH0a0fA==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr10860423wri.285.1635860662644; 
 Tue, 02 Nov 2021 06:44:22 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 u6sm2510348wmc.29.2021.11.02.06.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:44:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/41] target/mips: Convert MSA 3RF instruction format to
 decodetree (DF_HALF)
Date: Tue,  2 Nov 2021 14:42:20 +0100
Message-Id: <20211102134240.3036524-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

Convert 3-register floating-point or fixed-point operations
to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211028210843.2120802-19-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  9 +++++
 target/mips/tcg/msa_translate.c | 68 ++++++++++++++-------------------
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index afcb868aade..f90b2d21c92 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -22,6 +22,7 @@
 %bit_df             16:7 !function=bit_df
 %bit_m              16:7 !function=bit_m
 %2r_df_w            16:1 !function=plus_2
+%3r_df_h            21:1 !function=plus_1
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_i
@@ -30,6 +31,7 @@
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
+@3rf_h              ...... .... .    wt:5 ws:5 wd:5 ......  &msa_r df=%3r_df_h
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
 @i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_i
@@ -84,6 +86,13 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  MUL_Q             011110 0100 . ..... ..... ..... 011100  @3rf_h
+  MADD_Q            011110 0101 . ..... ..... ..... 011100  @3rf_h
+  MSUB_Q            011110 0110 . ..... ..... ..... 011100  @3rf_h
+  MULR_Q            011110 1100 . ..... ..... ..... 011100  @3rf_h
+  MADDR_Q           011110 1101 . ..... ..... ..... 011100  @3rf_h
+  MSUBR_Q           011110 1110 . ..... ..... ..... 011100  @3rf_h
+
   AND_V             011110 00000 ..... ..... .....  011110  @vec
   OR_V              011110 00001 ..... ..... .....  011110  @vec
   NOR_V             011110 00010 ..... ..... .....  011110  @vec
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 45a6b60d547..65e56b23171 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -20,6 +20,11 @@
 static int bit_m(DisasContext *ctx, int x);
 static int bit_df(DisasContext *ctx, int x);
 
+static inline int plus_1(DisasContext *s, int x)
+{
+    return x + 1;
+}
+
 static inline int plus_2(DisasContext *s, int x)
 {
     return x + 2;
@@ -138,12 +143,9 @@ enum {
     OPC_FCNE_df     = (0x3 << 22) | OPC_MSA_3RF_1C,
     OPC_FCLT_df     = (0x4 << 22) | OPC_MSA_3RF_1A,
     OPC_FMADD_df    = (0x4 << 22) | OPC_MSA_3RF_1B,
-    OPC_MUL_Q_df    = (0x4 << 22) | OPC_MSA_3RF_1C,
     OPC_FCULT_df    = (0x5 << 22) | OPC_MSA_3RF_1A,
     OPC_FMSUB_df    = (0x5 << 22) | OPC_MSA_3RF_1B,
-    OPC_MADD_Q_df   = (0x5 << 22) | OPC_MSA_3RF_1C,
     OPC_FCLE_df     = (0x6 << 22) | OPC_MSA_3RF_1A,
-    OPC_MSUB_Q_df   = (0x6 << 22) | OPC_MSA_3RF_1C,
     OPC_FCULE_df    = (0x7 << 22) | OPC_MSA_3RF_1A,
     OPC_FEXP2_df    = (0x7 << 22) | OPC_MSA_3RF_1B,
     OPC_FSAF_df     = (0x8 << 22) | OPC_MSA_3RF_1A,
@@ -157,13 +159,10 @@ enum {
     OPC_FSNE_df     = (0xB << 22) | OPC_MSA_3RF_1C,
     OPC_FSLT_df     = (0xC << 22) | OPC_MSA_3RF_1A,
     OPC_FMIN_df     = (0xC << 22) | OPC_MSA_3RF_1B,
-    OPC_MULR_Q_df   = (0xC << 22) | OPC_MSA_3RF_1C,
     OPC_FSULT_df    = (0xD << 22) | OPC_MSA_3RF_1A,
     OPC_FMIN_A_df   = (0xD << 22) | OPC_MSA_3RF_1B,
-    OPC_MADDR_Q_df  = (0xD << 22) | OPC_MSA_3RF_1C,
     OPC_FSLE_df     = (0xE << 22) | OPC_MSA_3RF_1A,
     OPC_FMAX_df     = (0xE << 22) | OPC_MSA_3RF_1B,
-    OPC_MSUBR_Q_df  = (0xE << 22) | OPC_MSA_3RF_1C,
     OPC_FSULE_df    = (0xF << 22) | OPC_MSA_3RF_1A,
     OPC_FMAX_A_df   = (0xF << 22) | OPC_MSA_3RF_1B,
 };
@@ -507,6 +506,22 @@ TRANS(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
 TRANS(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
 TRANS(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
 
+static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
+                          gen_helper_piiii *gen_msa_3rf)
+{
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_msa_3rf(cpu_env,
+                tcg_constant_i32(a->df),
+                tcg_constant_i32(a->wd),
+                tcg_constant_i32(a->ws),
+                tcg_constant_i32(a->wt));
+
+    return true;
+}
+
 static bool trans_msa_3r(DisasContext *ctx, arg_msa_r *a,
                          gen_helper_piii *gen_msa_3r)
 {
@@ -1682,6 +1697,13 @@ static void gen_msa_elm(DisasContext *ctx)
     gen_msa_elm_df(ctx, df, n);
 }
 
+TRANS(MUL_Q,    trans_msa_3rf, gen_helper_msa_mul_q_df);
+TRANS(MADD_Q,   trans_msa_3rf, gen_helper_msa_madd_q_df);
+TRANS(MSUB_Q,   trans_msa_3rf, gen_helper_msa_msub_q_df);
+TRANS(MULR_Q,   trans_msa_3rf, gen_helper_msa_mulr_q_df);
+TRANS(MADDR_Q,  trans_msa_3rf, gen_helper_msa_maddr_q_df);
+TRANS(MSUBR_Q,  trans_msa_3rf, gen_helper_msa_msubr_q_df);
+
 static void gen_msa_3rf(DisasContext *ctx)
 {
 #define MASK_MSA_3RF(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
@@ -1693,22 +1715,8 @@ static void gen_msa_3rf(DisasContext *ctx)
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
     TCGv_i32 twt = tcg_const_i32(wt);
-    TCGv_i32 tdf;
-
     /* adjust df value for floating-point instruction */
-    switch (MASK_MSA_3RF(ctx->opcode)) {
-    case OPC_MUL_Q_df:
-    case OPC_MADD_Q_df:
-    case OPC_MSUB_Q_df:
-    case OPC_MULR_Q_df:
-    case OPC_MADDR_Q_df:
-    case OPC_MSUBR_Q_df:
-        tdf = tcg_constant_i32(DF_HALF + df);
-        break;
-    default:
-        tdf = tcg_constant_i32(DF_WORD + df);
-        break;
-    }
+    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
 
     switch (MASK_MSA_3RF(ctx->opcode)) {
     case OPC_FCAF_df:
@@ -1750,24 +1758,15 @@ static void gen_msa_3rf(DisasContext *ctx)
     case OPC_FMADD_df:
         gen_helper_msa_fmadd_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_MUL_Q_df:
-        gen_helper_msa_mul_q_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_FCULT_df:
         gen_helper_msa_fcult_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FMSUB_df:
         gen_helper_msa_fmsub_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_MADD_Q_df:
-        gen_helper_msa_madd_q_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_FCLE_df:
         gen_helper_msa_fcle_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_MSUB_Q_df:
-        gen_helper_msa_msub_q_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_FCULE_df:
         gen_helper_msa_fcule_df(cpu_env, tdf, twd, tws, twt);
         break;
@@ -1807,27 +1806,18 @@ static void gen_msa_3rf(DisasContext *ctx)
     case OPC_FMIN_df:
         gen_helper_msa_fmin_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_MULR_Q_df:
-        gen_helper_msa_mulr_q_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_FSULT_df:
         gen_helper_msa_fsult_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FMIN_A_df:
         gen_helper_msa_fmin_a_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_MADDR_Q_df:
-        gen_helper_msa_maddr_q_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_FSLE_df:
         gen_helper_msa_fsle_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FMAX_df:
         gen_helper_msa_fmax_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_MSUBR_Q_df:
-        gen_helper_msa_msubr_q_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_FSULE_df:
         gen_helper_msa_fsule_df(cpu_env, tdf, twd, tws, twt);
         break;
-- 
2.31.1


