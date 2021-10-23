Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3E24385B5
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:07:40 +0200 (CEST)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePAx-000225-DN
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOte-0006Ps-5W
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtb-0005lX-Sn
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id s19so4726901wra.2
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zlLSqA2ycXVzQUUC1xZxvV3k71wbtC8pyAG2XTINAoI=;
 b=gc4MLb8VnPo/+rUWZ1w8EcA+pGy2+H7C/2u7zp4xkHRNnp46+dVgmi+kxNx5ZdKExd
 Pp+mvwXRGYH6tBreS8MZWylbGxo0tDUosyJpgNexNFLNLDatFyejY7h7600AAnGJQHW+
 jvcNfgjp1iFduvCSuLLRJT9jEeTbFsF7YJBOxnMYFop9AVdbcygK88aQ0hTJffSwaxru
 wntbvFvQw3LJXwtDt5B7TuvXcmwOfBB/R87the1/mHdUkahM/YtZv7ekLoI/jG+bXMt0
 yc956ABKiuA/9/UYtvXQ9XfH8wTm+pcutsmX5HfT3jJeNkq9OqPWjxjTDl9Haj433IE4
 0A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zlLSqA2ycXVzQUUC1xZxvV3k71wbtC8pyAG2XTINAoI=;
 b=OhwtLn3jsfXCcsL2lihsIEZdBl38qy5jPy67ZGR2unS79g4RjGCm7kNBs5URVCg7AQ
 4fggPGV5YcV7WaeGzw5a6dDCRZVoofLsn9uidhQFapT27rfOOT+nMllS+sBUuphw8i/Z
 S4GWi2Q1oZRkpoP4BBurULgRnajzodeVFZH5vbTq9mVsgJFtKBfAdzb8AYMqo2cvCo3E
 /jlIrZUg52gmubSlmBpxtqChI3aa77vzC4xZCo0R4Aeb/9+xcY3KvyDau2yOMqyQVbXX
 lq45d8DrPSyYmLFowm9nY7xq1SQ3ASlWNfeolwKNnhBRcOWWkLUTTQcZt25JKT+cIA9b
 hocg==
X-Gm-Message-State: AOAM531ikbDvt9i1X3KRY84ut7dQZ5eGVDAyOa4yieIY1diNEi/CmTey
 F2f08KZkEHjmh39rFT/FWBGmkfJfsSc=
X-Google-Smtp-Source: ABdhPJzbKtVbo+w9okzqp54tTwrrL8cHkFwq47KXitw8rtpJ+3I1AHSuyUH3/IlQw5h6+Yve4VL/Pw==
X-Received: by 2002:adf:8b1a:: with SMTP id n26mr10644740wra.182.1635025782398; 
 Sat, 23 Oct 2021 14:49:42 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o40sm6441943wms.10.2021.10.23.14.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/33] target/mips: Convert MSA 3RF instruction format to
 decodetree (DF_HALF)
Date: Sat, 23 Oct 2021 23:47:50 +0200
Message-Id: <20211023214803.522078-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

Convert 3-register floating-point or fixed-point operations
to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 ++++
 target/mips/tcg/msa_translate.c | 70 +++++++++++++++------------------
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 72447041fef..5c6a7415271 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -24,6 +24,7 @@
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
+@3rf                ...... .... df:1 wt:5 ws:5 wd:5 ......  &msa_r
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldst ws=0
@@ -78,6 +79,13 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  MUL_Q             011110 0100 . ..... ..... ..... 011100  @3rf
+  MADD_Q            011110 0101 . ..... ..... ..... 011100  @3rf
+  MSUB_Q            011110 0110 . ..... ..... ..... 011100  @3rf
+  MULR_Q            011110 1100 . ..... ..... ..... 011100  @3rf
+  MADDR_Q           011110 1101 . ..... ..... ..... 011100  @3rf
+  MSUBR_Q           011110 1110 . ..... ..... ..... 011100  @3rf
+
   AND_V             011110 00000 ..... ..... .....  011110  @vec
   OR_V              011110 00001 ..... ..... .....  011110  @vec
   NOR_V             011110 00010 ..... ..... .....  011110  @vec
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 461a427c9df..6e50bc9edf4 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -130,12 +130,9 @@ enum {
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
@@ -149,13 +146,10 @@ enum {
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
@@ -251,6 +245,9 @@ static inline bool check_msa_access(DisasContext *ctx)
 #define TRANS_MSA(NAME, trans_func, gen_func) \
         TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, gen_func)
 
+#define TRANS_DF(NAME, trans_func, df, gen_func) \
+        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, df, gen_func)
+
 #define TRANS_DF_E(NAME, trans_func, gen_func) \
         TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
                     gen_func##_b, gen_func##_h, gen_func##_w, gen_func##_d)
@@ -1652,6 +1649,33 @@ static void gen_msa_elm(DisasContext *ctx)
     gen_msa_elm_df(ctx, df, n);
 }
 
+static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
+                          enum CPUMIPSMSADataFormat df_base,
+                          void (*gen_msa_3rf)(TCGv_ptr, TCGv_i32, TCGv_i32,
+                                              TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 twd = tcg_const_i32(a->wd);
+    TCGv_i32 tws = tcg_const_i32(a->ws);
+    TCGv_i32 twt = tcg_const_i32(a->wt);
+    /* adjust df value for floating-point instruction */
+    TCGv_i32 tdf = tcg_constant_i32(a->df + df_base);
+
+    gen_msa_3rf(cpu_env, tdf, twd, tws, twt);
+
+    tcg_temp_free_i32(twt);
+    tcg_temp_free_i32(tws);
+    tcg_temp_free_i32(twd);
+
+    return true;
+}
+
+TRANS_DF(MUL_Q,     trans_msa_3rf, DF_HALF, gen_helper_msa_mul_q_df);
+TRANS_DF(MADD_Q,    trans_msa_3rf, DF_HALF, gen_helper_msa_madd_q_df);
+TRANS_DF(MSUB_Q,    trans_msa_3rf, DF_HALF, gen_helper_msa_msub_q_df);
+TRANS_DF(MULR_Q,    trans_msa_3rf, DF_HALF, gen_helper_msa_mulr_q_df);
+TRANS_DF(MADDR_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_maddr_q_df);
+TRANS_DF(MSUBR_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_msubr_q_df);
+
 static void gen_msa_3rf(DisasContext *ctx)
 {
 #define MASK_MSA_3RF(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
@@ -1663,22 +1687,8 @@ static void gen_msa_3rf(DisasContext *ctx)
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
@@ -1720,24 +1730,15 @@ static void gen_msa_3rf(DisasContext *ctx)
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
@@ -1777,27 +1778,18 @@ static void gen_msa_3rf(DisasContext *ctx)
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


