Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B045C43D0BB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:27:30 +0200 (CEST)
Received: from localhost ([::1]:33960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfne5-0005CA-R5
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMC-0005SW-Hq
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMA-00046B-Hs
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k7so5547754wrd.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0KChW80UPK11TbqXro4f3rmub/3y5xDcJ38gnGehEW0=;
 b=dyW9XiC5FUO/yjxjrPxwfAiY7cDGN3DBRAK+STZyQGJzuv1tlG71MeBFlcqDil67zZ
 YIARgudkeFZCTDZigDNjNGEae3XutXh4G4IgPn92HzZLr6gKkaivAq2zX+jRn/1VRUEy
 4Ui8+2jjA1XK1K3h5RDgTHYJDIcOnWui9Gq9/d4w1oil4HiFXMxlsY2iH0Pf3B2F0lpT
 UR3MWAwet5VnAcLJCnVMB2gFp5V1S+jwAuYnITU2F9IZWsvQb4eeeIUZvBW7JRExrsDu
 Da7TzXJ9G6mCJxRKZ0DowspQLf+iv+/sWq3hjjW8Vf4H4LQ1yJsMTBXEVBlTVletlgV1
 gb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0KChW80UPK11TbqXro4f3rmub/3y5xDcJ38gnGehEW0=;
 b=ZAw/AsPhWXqGFIEyoWJOYyJI91o7r/EOkPKGh2dlxvKmrgkqZqMQP+6h+Hrdt0XOCs
 fS41aA8zMU18wxfoBefy76NZOu5XIUsDI9CoStjo0Oo5ivpvGPBiUOj80BpYIHqpe9mR
 w71e5z/skUnZIk/WF4oxRmSaidPrczennjEYhKvlV+hLpwYX5LBQyNnXIrd5C5YCBj+Y
 aX2edphKJw8F2P41P9JSRlk2AGhXjRCLp7pGznXT6pzBosi9Qk66S4sBn2dqyMEiwKXh
 5fBfdueOb6TCy2JePXb1edHHCXpe/6GCN5f6vpTjDANT98UIa1lKB/WB48iCF2tTlZ87
 zJzA==
X-Gm-Message-State: AOAM531iOBIaOKss/0eEFCEbfhNOpRbl+IiHT6mVtcBxjzVvuzsTmshA
 D1lOJv7nmFztQojVo5bvx+Alvl9LC38=
X-Google-Smtp-Source: ABdhPJzITySOTenMoQrNUQnl9/XsljoSEOKEO1R5pXVuE6GoOsUq+EvGpG8q8f0exOwKXlx9O8e6iA==
X-Received: by 2002:a5d:64ec:: with SMTP id g12mr42207134wri.140.1635358137110; 
 Wed, 27 Oct 2021 11:08:57 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o10sm437185wmr.31.2021.10.27.11.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/32] target/mips: Convert MSA 3RF instruction format to
 decodetree (DF_HALF)
Date: Wed, 27 Oct 2021 20:07:16 +0200
Message-Id: <20211027180730.1551932-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register floating-point or fixed-point operations
to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 +++++
 target/mips/tcg/msa_translate.c | 64 +++++++++++++--------------------
 2 files changed, 33 insertions(+), 39 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index c9cc1529c8e..ace07f2f298 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -31,6 +31,7 @@
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
+@3rf                ...... .... df:1 wt:5 ws:5 wd:5 ......  &msa_r
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i5
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i5
 @i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_i8
@@ -85,6 +86,13 @@ BNZ                 010001 111 .. ..... ................    @bz
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
index c7168608d42..4e0ad24543e 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -133,12 +133,9 @@ enum {
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
@@ -152,13 +149,10 @@ enum {
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
@@ -1655,6 +1649,30 @@ static void gen_msa_elm(DisasContext *ctx)
     gen_msa_elm_df(ctx, df, n);
 }
 
+static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
+                          enum CPUMIPSMSADataFormat df_base,
+                          gen_helper_piiii *gen_msa_3rf)
+{
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_msa_3rf(cpu_env,
+                tcg_constant_i32(a->df + df_base),
+                tcg_constant_i32(a->wd),
+                tcg_constant_i32(a->ws),
+                tcg_constant_i32(a->wt));
+
+    return true;
+}
+
+TRANS(MUL_Q,    trans_msa_3rf, DF_HALF, gen_helper_msa_mul_q_df);
+TRANS(MADD_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_madd_q_df);
+TRANS(MSUB_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_msub_q_df);
+TRANS(MULR_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_mulr_q_df);
+TRANS(MADDR_Q,  trans_msa_3rf, DF_HALF, gen_helper_msa_maddr_q_df);
+TRANS(MSUBR_Q,  trans_msa_3rf, DF_HALF, gen_helper_msa_msubr_q_df);
+
 static void gen_msa_3rf(DisasContext *ctx)
 {
 #define MASK_MSA_3RF(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
@@ -1666,22 +1684,8 @@ static void gen_msa_3rf(DisasContext *ctx)
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
@@ -1723,24 +1727,15 @@ static void gen_msa_3rf(DisasContext *ctx)
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
@@ -1780,27 +1775,18 @@ static void gen_msa_3rf(DisasContext *ctx)
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


