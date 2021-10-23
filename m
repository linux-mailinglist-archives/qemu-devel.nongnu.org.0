Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5B44385AD
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:00:39 +0200 (CEST)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP4A-0008VY-Ui
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtt-0007Ae-Fo
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtl-0005pi-N8
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v17so3524772wrv.9
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4W4U2ZakVa+VyW3piwFf7vBo1nL6bSIlarNPs7+y7Kw=;
 b=VuyV8XslVDeoeSNIxNvKcUvNzL38hEGa91GbyPHVxCIGrJEPGaLzQCZGRJiStd7i/1
 ZUehFvm1SEB8BxT8JYVDJkoxfTpZCOWulWQ9WUfkR6QSKAEdy/HtcgEI7rEdPcMugMUC
 kDIODr/A0FiJKNwenwfvqBk/1xD0MlEAv9zElkqgw4QWw/oj81QFE8uWlltCp/ZrMVC5
 3PRTD/zC5zPs1wh23Qb34VKIrmW4cLkZcUqcWd+vt4enHpkfDsRQF2sXwTfYzGZGluu2
 AN3Pf4iSp0dRnozzSOx+GNwhP4++ZYkbNB0Fq1qblsPfhPU/j7By9N1ZFCCdE1UPWO0v
 vUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4W4U2ZakVa+VyW3piwFf7vBo1nL6bSIlarNPs7+y7Kw=;
 b=MRsQMmzWymI5Az08V0CRTqqfIH3NdlBIISy44bZnK1UKOxFfmq4dN3T5aG7grvuKX+
 DyUisx93pCjunXLTLZqcP2kRJ94YyashcjZIIeqH+MXVOCvfy/aSFlFsiJVmRC444faL
 ZN9bF+nQmCqw32lNoJjdjsD+5TK5yzkxa/XnDkpHpYaGKY1F24HvkpYL8sS6LQyHdiT1
 nQRBObZq3PTeO7oZ7LqNJkyyaAho9X7EkqQxESlLh2GoyqY9o9I5DCG6jVgdoF5YwLBG
 7gfdfpy5Ic+6WorlUDivpmvAWBU8UjVSrpDjVtGmhZJGXq38YDX9JZGnC0Zc12Uk7T+g
 5iiQ==
X-Gm-Message-State: AOAM533btPHca5LNUsoYw4waJ94Z/SlVRZnw1md6/F30syJnQ5KU33ZQ
 eI/tMEFfDSx9uzcwemyEeHXdY5IPA6k=
X-Google-Smtp-Source: ABdhPJxZbFht8X8DalrfGadgjecRpedjlIg3ms6TTyc3GOpSUBcc5+g6x2PNTXpoA+wW6OEiVxR3ug==
X-Received: by 2002:adf:a30c:: with SMTP id c12mr10719166wrb.366.1635025792193; 
 Sat, 23 Oct 2021 14:49:52 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 s9sm14187283wmj.39.2021.10.23.14.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 1/4)
Date: Sat, 23 Oct 2021 23:47:52 +0200
Message-Id: <20211023214803.522078-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
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
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register operations to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  6 ++++++
 target/mips/tcg/msa_translate.c | 35 ++++++++++++++++++++++-----------
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 28b7a71d930..ca0fd568560 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -24,6 +24,7 @@
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
+@3r                 ...... ...  df:2 wt:5 ws:5 wd:5 ......  &msa_r
 @3rf                ...... .... df:1 wt:5 ws:5 wd:5 ......  &msa_r
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
@@ -79,6 +80,11 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  SLD               011110 000 .. ..... ..... ..... 010100  @3r
+  SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
+
+  VSHF              011110 000 .. ..... ..... ..... 010101  @3r
+
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf
   FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 4543b7abdfb..0c7055c68bd 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -45,15 +45,12 @@ enum {
     OPC_SUBS_S_df   = (0x0 << 23) | OPC_MSA_3R_11,
     OPC_MULV_df     = (0x0 << 23) | OPC_MSA_3R_12,
     OPC_DOTP_S_df   = (0x0 << 23) | OPC_MSA_3R_13,
-    OPC_SLD_df      = (0x0 << 23) | OPC_MSA_3R_14,
-    OPC_VSHF_df     = (0x0 << 23) | OPC_MSA_3R_15,
     OPC_SRA_df      = (0x1 << 23) | OPC_MSA_3R_0D,
     OPC_SUBV_df     = (0x1 << 23) | OPC_MSA_3R_0E,
     OPC_ADDS_A_df   = (0x1 << 23) | OPC_MSA_3R_10,
     OPC_SUBS_U_df   = (0x1 << 23) | OPC_MSA_3R_11,
     OPC_MADDV_df    = (0x1 << 23) | OPC_MSA_3R_12,
     OPC_DOTP_U_df   = (0x1 << 23) | OPC_MSA_3R_13,
-    OPC_SPLAT_df    = (0x1 << 23) | OPC_MSA_3R_14,
     OPC_SRAR_df     = (0x1 << 23) | OPC_MSA_3R_15,
     OPC_SRL_df      = (0x2 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_S_df    = (0x2 << 23) | OPC_MSA_3R_0E,
@@ -469,6 +466,29 @@ TRANS_MSA(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
 TRANS_MSA(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
 TRANS_MSA(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
 
+static bool trans_msa_3r_df(DisasContext *ctx, arg_msa_r *a,
+                            void (*gen_msa_3r_df)(TCGv_ptr, TCGv_i32, TCGv_i32,
+                                                  TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 tdf = tcg_constant_i32(a->df);
+    TCGv_i32 twd = tcg_const_i32(a->wd);
+    TCGv_i32 tws = tcg_const_i32(a->ws);
+    TCGv_i32 twt = tcg_const_i32(a->wt);
+
+    gen_msa_3r_df(cpu_env, tdf, twd, tws, twt);
+
+    tcg_temp_free_i32(twd);
+    tcg_temp_free_i32(tws);
+    tcg_temp_free_i32(twt);
+
+    return true;
+}
+
+TRANS_MSA(SLD,          trans_msa_3r_df, gen_helper_msa_sld_df);
+TRANS_MSA(SPLAT,        trans_msa_3r_df, gen_helper_msa_splat_df);
+
+TRANS_MSA(VSHF,         trans_msa_3r_df, gen_helper_msa_vshf_df);
+
 static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
@@ -1219,12 +1239,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-    case OPC_SLD_df:
-        gen_helper_msa_sld_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_VSHF_df:
-        gen_helper_msa_vshf_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBV_df:
         switch (df) {
         case DF_BYTE:
@@ -1257,9 +1271,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-    case OPC_SPLAT_df:
-        gen_helper_msa_splat_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBSUS_U_df:
         switch (df) {
         case DF_BYTE:
-- 
2.31.1


