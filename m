Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BE943D0C0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:30:27 +0200 (CEST)
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfngw-0008S3-Es
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMU-0005xE-Ox
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMT-0004dv-5o
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id p14so5564295wrd.10
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0YfANERaUxvrc0pkdwp3e+fS48avmmg1M4DJ+bBsIRQ=;
 b=hplJ14QUYfCwT4QFSGFzzHORn+XcPkLpWBlWn/FRBbR78z8+2ITFebNy9YilcsFfuV
 jEg7C/HSQ7OOXNQJH8YE69iEuyPy8PoCi+9RKZJwNQ7wmRibNbo0DlJBETa6Nq6x94AA
 BQoMXX2R8VRM1rVjrb2QCTtYNq5SFSQOsOJq7tDB38Qz7SkKi5YNwA4gHUA9B4kZdR4b
 SZGLdLPmWABPzx6JdXdwFBTjbWYL9/iaKO/ADLYX7WLCTOVSgKB7Ij4gyBtgOvqfeWV+
 9BWzNb/EOV0FRgXDXJLVi6M7gZHZqEfJ93jW6rW4aoF6aFl3ezNhSOGQZCuY6I+G9UDP
 aBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0YfANERaUxvrc0pkdwp3e+fS48avmmg1M4DJ+bBsIRQ=;
 b=ewq/i7N787QRD9Ko3KsKQeLKoCUNNuQycDTxWhVMeTRVRMfhKqah8wU2ghq9b6zpdh
 ID4huoHPRWDNeRi/s+HZBgl4Bdgy7wPCWDA1iC7qSOs8Znq5MagUTzyAJ6+RRbMK8HoC
 XYcXZUp0oVw3ZMG4+FPnc5Tm8TUjkMk+3D4lDLtMhs1fnXXOtwFinsc1UZiQDTKzUTt9
 qvw/urGf/4GzJyGQo2fGCJ+d0L5cwCs5FnJQUunaJFPTxCs4hx5FQ+sSgyMhi9wnypGS
 K0mzAjQuwIENvC13EcjdXJMJ9rh7E8zP81qXyiE9xXKAwnXryUruzG7fNaspGqjnktoR
 14Pw==
X-Gm-Message-State: AOAM531mqAM471YNItG+SOA4m8f7f8vLPfg8YhKFrKS1jXYo5gfshDJN
 HoXlTpQTkuTzLBUuqPa01G+F1tfG/R4=
X-Google-Smtp-Source: ABdhPJyLlImq6zg/g6k52d2HyQQRcVk3Yms8pFTYV33phtGDGanFMmE4gl/JNOtnfpQHTy4JGwUD1g==
X-Received: by 2002:adf:dc0e:: with SMTP id t14mr43762902wri.277.1635358155499; 
 Wed, 27 Oct 2021 11:09:15 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b15sm429413wmj.22.2021.10.27.11.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/32] target/mips: Convert MSA 3R instruction format to
 decodetree (part 3/4)
Date: Wed, 27 Oct 2021 20:07:20 +0200
Message-Id: <20211027180730.1551932-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert BINSL (Vector Bit Insert Left) and BINSR (Vector Bit
Insert Right) opcodes to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  3 +++
 target/mips/tcg/msa_translate.c | 40 +++++----------------------------
 2 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index f6471b92fc7..19458f180f5 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -87,6 +87,9 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  BINSL             011110 110.. ..... ..... .....  001101  @3r
+  BINSR             011110 111.. ..... ..... .....  001101  @3r
+
   DOTP_S            011110 000.. ..... ..... .....  010011  @3r
   DOTP_U            011110 001.. ..... ..... .....  010011  @3r
   DPADD_S           011110 010.. ..... ..... .....  010011  @3r
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 5cc704c9ace..a5a5cc4bcac 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -81,12 +81,10 @@ enum {
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
@@ -247,6 +245,9 @@ typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 #define TRANS_DF_ii(NAME, trans_func, gen_func) \
     TRANS_DF_x(ii, NAME, trans_func, gen_func)
 
+#define TRANS_DF_iii(NAME, trans_func, gen_func) \
+    TRANS_DF_x(iii, NAME, trans_func, gen_func)
+
 #define TRANS_DF_iii_b(NAME, trans_func, gen_func) \
     static gen_helper_piii * const NAME##_tab[4] = { \
         gen_func##_h, gen_func##_w, gen_func##_d \
@@ -482,6 +483,9 @@ static bool trans_msa_3r(DisasContext *ctx, arg_msa_r *a,
     return true;
 }
 
+TRANS_DF_iii(BINSL,     trans_msa_3r,    gen_helper_msa_binsl);
+TRANS_DF_iii(BINSR,     trans_msa_3r,    gen_helper_msa_binsr);
+
 TRANS_DF_iii_b(DOTP_S,  trans_msa_3r,    gen_helper_msa_dotp_s);
 TRANS_DF_iii_b(DOTP_U,  trans_msa_3r,    gen_helper_msa_dotp_u);
 TRANS_DF_iii_b(DPADD_S, trans_msa_3r,    gen_helper_msa_dpadd_s);
@@ -512,38 +516,6 @@ static void gen_msa_3r(DisasContext *ctx)
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


