Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC4443003
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:14:39 +0100 (CET)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuYg-0008St-JR
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5u-0003Ci-Uq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5s-0006Dn-TV
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:54 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b12so28960419wrh.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sNrUNW9aVz2ixvALVPGW8JPx1J4reeP0whjPhiYCgSg=;
 b=XtGDsNL70IJSHDlbXlqwA7X063T5p1gOImjA2QLjBPqHwT5fi5ZFY3iO/2nvONJB4L
 miN9CV7rMLTaLJUiCDn+eS4TKbOCuTMQb3LNd7gbtaNOS0+Wxz7x2fx/ba+YuOFuPQpW
 q4rUMwOy9skidcjmWHzxhEcrvhaK5NmOceMO/n8iPuGJWJSWoODsbPO2dt7EnedThNZE
 ZbRr1VNWvm4yNa8gVrSB8YtznrA+5whBioTNaMxJl3FPX+S011mdnZYwMGuF3XE50/9H
 UhEVUwNA3t4cFZq10JHyM+VXgWF2uZQF0+paxrd9yjv6p9DZu4KtDRv95O8UgyZlU8cF
 wu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sNrUNW9aVz2ixvALVPGW8JPx1J4reeP0whjPhiYCgSg=;
 b=ww/EhV3uelkp6Y4WzjBaZsU5pGx5ro4W7EXDP62JLZg5wj6BySaZsMlLMoePZR5KIk
 uIeQuUovNgZPmTlQuVVJ7VdpLizjumoRQ87OirUMnP6Uu2kP6zukduiNHVYDHZ4YiKlU
 MFJjXyEouxpvHQW3JQeR9aO31by4Gq2nhAkofyVrwepnRsSdMO9fo+8N9arzjgMeqYb5
 Sh3Qd1oLYKnWQEB4c7wohzHboqNZI5OFG1axZtHX79mbOZgNNgTQekep3T3ueREcLz9H
 iG8WV+v5MFnMSi8qJKut5zANNRflEYzuK/IS2gEKwpEOXlGcc23w3ty54TzkyoDh+Fpe
 3+aA==
X-Gm-Message-State: AOAM532cck7CZZlqkVTeO/aonWw3BtE636KYR11O1kZhiHnZ8VI8L3eJ
 RIyeVU5CmN69haC8XpIMK2pa7Cm8KBM=
X-Google-Smtp-Source: ABdhPJzV3/KYbRd5Ex+klrLidenNOqJlN2UCxmW6n1L7Q95T90F0ZiOeGd+EyPSPHDLUbG+1TK8Pdw==
X-Received: by 2002:adf:f681:: with SMTP id v1mr26088243wrp.367.1635860691418; 
 Tue, 02 Nov 2021 06:44:51 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 a1sm9053281wri.89.2021.11.02.06.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:44:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/41] target/mips: Convert MSA ELM instruction format to
 decodetree
Date: Tue,  2 Nov 2021 14:42:26 +0100
Message-Id: <20211102134240.3036524-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

Convert instructions with an immediate element index
and data format df/n to decodetree.

Since the 'data format' and 'n' fields are constant values,
use tcg_constant_i32() instead of a TCG temporaries.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-25-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 +++++
 target/mips/tcg/msa_translate.c | 57 +++++++++++++++++++++++++--------
 2 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 391261109a5..bf014524eed 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -18,7 +18,10 @@
 &msa_ldi            df  wd       sa
 &msa_i              df  wd ws    sa
 &msa_bit            df  wd ws       m
+&msa_elm_df         df  wd ws       n
 
+%elm_df             16:6 !function=elm_df
+%elm_n              16:6 !function=elm_n
 %bit_df             16:7 !function=bit_df
 %bit_m              16:7 !function=bit_m
 %2r_df_w            16:1 !function=plus_2
@@ -29,6 +32,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_i
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@elm_df             ...... .... ......    ws:5 wd:5 ......  &msa_elm_df df=%elm_df n=%elm_n
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
@@ -161,6 +165,10 @@ BNZ                 010001 111 .. ..... ................    @bz
   HSUB_S            011110 110.. ..... ..... .....  010101  @3r
   HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
+  SLDI              011110 0000 ...... ..... .....  011001  @elm_df
+  SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  INSVE             011110 0101 ...... ..... .....  011001  @elm_df
+
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf_w
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf_w
   FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf_w
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 3b95e081a04..14e0a8879c4 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -17,6 +17,8 @@
 #include "fpu_helper.h"
 #include "internal.h"
 
+static int elm_n(DisasContext *ctx, int x);
+static int elm_df(DisasContext *ctx, int x);
 static int bit_m(DisasContext *ctx, int x);
 static int bit_df(DisasContext *ctx, int x);
 
@@ -42,15 +44,12 @@ enum {
 
 enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
-    OPC_SLDI_df     = (0x0 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_SPLATI_df   = (0x1 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
-    OPC_INSVE_df    = (0x5 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -107,6 +106,24 @@ static int df_extract_df(DisasContext *ctx, int x, const struct dfe *s)
     return -1;
 }
 
+static const struct dfe df_elm[] = {
+    /* Table 3.26 ELM Instruction Format */
+    [DF_BYTE]   = {4, 2, 0b00},
+    [DF_HALF]   = {3, 3, 0b100},
+    [DF_WORD]   = {2, 4, 0b1100},
+    [DF_DOUBLE] = {1, 5, 0b11100}
+};
+
+static int elm_n(DisasContext *ctx, int x)
+{
+    return df_extract_val(ctx, x, df_elm);
+}
+
+static int elm_df(DisasContext *ctx, int x)
+{
+    return df_extract_df(ctx, x, df_elm);
+}
+
 static const struct dfe df_bit[] = {
     /* Table 3.28 BIT Instruction Format */
     [DF_BYTE]   = {3, 4, 0b1110},
@@ -551,6 +568,30 @@ static void gen_msa_elm_3e(DisasContext *ctx)
     tcg_temp_free_i32(tsr);
 }
 
+static bool trans_msa_elm(DisasContext *ctx, arg_msa_elm_df *a,
+                          gen_helper_piiii *gen_msa_elm_df)
+{
+    if (a->df < 0) {
+        return false;
+    }
+
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_msa_elm_df(cpu_env,
+                   tcg_constant_i32(a->df),
+                   tcg_constant_i32(a->wd),
+                   tcg_constant_i32(a->ws),
+                   tcg_constant_i32(a->n));
+
+    return true;
+}
+
+TRANS(SLDI,   trans_msa_elm, gen_helper_msa_sldi_df);
+TRANS(SPLATI, trans_msa_elm, gen_helper_msa_splati_df);
+TRANS(INSVE,  trans_msa_elm, gen_helper_msa_insve_df);
+
 static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 {
 #define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
@@ -560,18 +601,8 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
     TCGv_i32 tws = tcg_const_i32(ws);
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tn  = tcg_const_i32(n);
-    TCGv_i32 tdf = tcg_constant_i32(df);
 
     switch (MASK_MSA_ELM(ctx->opcode)) {
-    case OPC_SLDI_df:
-        gen_helper_msa_sldi_df(cpu_env, tdf, twd, tws, tn);
-        break;
-    case OPC_SPLATI_df:
-        gen_helper_msa_splati_df(cpu_env, tdf, twd, tws, tn);
-        break;
-    case OPC_INSVE_df:
-        gen_helper_msa_insve_df(cpu_env, tdf, twd, tws, tn);
-        break;
     case OPC_COPY_S_df:
     case OPC_COPY_U_df:
     case OPC_INSERT_df:
-- 
2.31.1


