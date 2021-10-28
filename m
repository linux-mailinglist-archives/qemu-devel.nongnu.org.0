Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E60243F1B2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:31:09 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCzM-0002sw-KF
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfa-0000rw-D9
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfS-0006dj-SB
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id u18so12488861wrg.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d5gTgxQfGVvfK86x7fWxjwyuAP7Ea/kfXNhIm0CG42g=;
 b=OTXcq6uCm+oXwUJPLj/0Ov8li7XzbEluqnxxCDi/mW+65RITjdLbHIMbJO194z4kXJ
 NQPOWQajBbA0yveYTsW2MPWd3sK9C8+rx2M1C4PXtxCu/jSSQWDq+99sKEczt1LGqj3A
 Qk00PHey4qUgEd5DEdxEyKE/+477xp9o9OOen2Gsh7P302z5tTUWYY/C96r9fZzgtjUp
 6ANTbBf1s8+iyFyssVqlSZEgG6HsLg3iSkhGMt/Or+iHP18qJHxyWD1qbeXguyd/vDtu
 Lqq3iNCAavnlD+jViaBB7BJ5iklqWmT01YWOXXcx9vh0gw1FkEGSsewXkigP/eWYL3R3
 ri/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d5gTgxQfGVvfK86x7fWxjwyuAP7Ea/kfXNhIm0CG42g=;
 b=aaZ9KdYw4TvJll3o3bJtdcIdxRqQg+DpjoKicPR++ZhyFzL7FvwbTURfhhbTA0Cr5F
 UxK41ur900wHwagi+fC31BgT49dxYtIoGpfldg1qLq8doCjXEmpufJgGTM7y2ohe/21+
 jIgSJEl6e2vkAGg1THnsFVoANKV+bQ6sgKFEgA7EbE6r2hc1Jwim4PCvt4EmlLmelUYS
 daIEGJiTUqbaLm3UjcABcDF8sZw9cxIRKp9v8sJu5VUzrWVs7gFczJQ4e3hMC9T2KQBd
 SAzDXLbAddTndfhZHX5AR4SotJRCUYAY7gWOl5+6gBKfBn+0Wf3bSKvhMtbBbeKwpOBP
 wJJQ==
X-Gm-Message-State: AOAM530+93bi8BFNYDFp7D5UIkFtXwAdOVC8V+ZdpXthefOpbP6ras/t
 S0JIUHA0OGqgZBE2Nqb/c9oFM+AEytM=
X-Google-Smtp-Source: ABdhPJyM5LOBf2pRKWWMDWY12lUOLWY3reMgVmUBYRnXTR4cjkYu80+ANcwCtwMN1LqETz+h+hIJbA==
X-Received: by 2002:a5d:4586:: with SMTP id p6mr8648999wrq.65.1635455433057;
 Thu, 28 Oct 2021 14:10:33 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k14sm1957624wms.21.2021.10.28.14.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:10:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/32] target/mips: Convert MSA 3R instruction format to
 decodetree (part 3/4)
Date: Thu, 28 Oct 2021 23:08:33 +0200
Message-Id: <20211028210843.2120802-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
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
index b65474261f0..23d7ab6fd5b 100644
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
@@ -243,6 +241,9 @@ typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 #define TRANS_DF_ii(NAME, trans_func, gen_func) \
     TRANS_DF_x(ii, NAME, trans_func, gen_func)
 
+#define TRANS_DF_iii(NAME, trans_func, gen_func) \
+    TRANS_DF_x(iii, NAME, trans_func, gen_func)
+
 #define TRANS_DF_iii_b(NAME, trans_func, gen_func) \
     static gen_helper_piii * const NAME##_tab[4] = { \
         NULL, gen_func##_h, gen_func##_w, gen_func##_d \
@@ -503,6 +504,9 @@ TRANS(BMNZ_V,           trans_msa_3r,   gen_helper_msa_bmnz_v);
 TRANS(BMZ_V,            trans_msa_3r,   gen_helper_msa_bmz_v);
 TRANS(BSEL_V,           trans_msa_3r,   gen_helper_msa_bsel_v);
 
+TRANS_DF_iii(BINSL,     trans_msa_3r,   gen_helper_msa_binsl);
+TRANS_DF_iii(BINSR,     trans_msa_3r,   gen_helper_msa_binsr);
+
 TRANS_DF_iii_b(DOTP_S,  trans_msa_3r,   gen_helper_msa_dotp_s);
 TRANS_DF_iii_b(DOTP_U,  trans_msa_3r,   gen_helper_msa_dotp_u);
 TRANS_DF_iii_b(DPADD_S, trans_msa_3r,   gen_helper_msa_dpadd_s);
@@ -533,38 +537,6 @@ static void gen_msa_3r(DisasContext *ctx)
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


