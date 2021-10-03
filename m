Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46575420339
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:09:35 +0200 (CEST)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5va-0008Rl-Ad
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kj-0003JC-1r
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kh-0003eG-Fl
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:20 -0400
Received: by mail-wr1-x436.google.com with SMTP id d26so26046473wrb.6
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6XihHO8hR/2w0fkY9TAy59BcD7FH2rXSgl3e1w0F2cc=;
 b=pPcfGcI0CMfJK4Nio3gEDH/ajJlkGFl1mKbZRf58tfPzWJZUOvxThTfu8AMnVdUXx+
 y9f7yLyVxx9R8Dtb42wk6DE7LVN668hzA4dOoYy4ych+fC8JVgKUvwdouos13maCUeG3
 y4jC2/yoyy49API3+DP/J/ryvilLiTWpRW0kqi5S3zOkCmY3iz6IJaPVXcerADBrsDhu
 S+Fn89pBoqZJ/ezH8yCnE3Or5gVcbNi4cCc2FRkMQZ0PbbaMYHp+XjzXMsGnrrp8sV0d
 /wPFJzk5PUWCprice0b3Cy8SU8dcZDUs6wPzcSxJTH6Giufpd5NgQaVOFgsnmT7+h58s
 k2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6XihHO8hR/2w0fkY9TAy59BcD7FH2rXSgl3e1w0F2cc=;
 b=qk5w2+1FrGeE0uXU5NQhAkNslc87/xHxIsEHWdqtx1aXHEYIse79/U2/Q0b1SBxUXI
 1jlMPmDmkWWd4mI9fIpfp/TqA7RLcZoMbCJGd+aRGstaLyEB4Z1Yd2YEBHkuS1AiTrga
 k3AGkFeQdbsaSJ5juButwuuyx9/014CJdoBFAg6acAI1430sryU2KomqROrKNZBS1ka7
 pzKqqlW2vP2O4Gh6f3asVbBFY+7Sa6TrouCHUsLXVyz1rGgaNKwuFDlFngi2GVMvk2sB
 WPS5odXQf0i9c/I/1xPwlNGvj17yTudyPwwg6DIGJcYo/q65WbqdwPTWmZPCnarBbnGP
 ECaQ==
X-Gm-Message-State: AOAM533erAY1CTJyvSYPA1HT6XUqFZrUOPWdIAPjVolAYKBAGneW0D46
 Tz0GOrbxpJ+RreBgHivf+UApgTsvioo=
X-Google-Smtp-Source: ABdhPJzgeuLoh7FsFtCvwTOsYvs5kfncYBjNQWhfTmPdGHzhXyviQFsXClgDCyALV4XepZm1Jbm8Mg==
X-Received: by 2002:adf:a505:: with SMTP id i5mr8134053wrb.38.1633283897737;
 Sun, 03 Oct 2021 10:58:17 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 d16sm13728474wmb.2.2021.10.03.10.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:58:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] target/mips: Use tcg_constant_i32() in gen_msa_i5()
Date: Sun,  3 Oct 2021 19:57:42 +0200
Message-Id: <20211003175743.3738710-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003175743.3738710-1-f4bug@amsat.org>
References: <20211003175743.3738710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

Avoid using a TCG temporary by moving Data Format to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 40 ++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 3ef912da6b8..3ede2f643c0 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -473,14 +473,32 @@ static void gen_msa_i8(DisasContext *ctx)
 static void gen_msa_i5(DisasContext *ctx)
 {
 #define MASK_MSA_I5(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-    int8_t s5 = (int8_t) sextract32(ctx->opcode, 16, 5);
-    uint8_t u5 = extract32(ctx->opcode, 16, 5);
-
     TCGv_i32 tdf = tcg_const_i32(extract32(ctx->opcode, 21, 2));
     TCGv_i32 twd = tcg_const_i32(extract32(ctx->opcode, 11, 5));
     TCGv_i32 tws = tcg_const_i32(extract32(ctx->opcode, 6, 5));
-    TCGv_i32 timm = tcg_temp_new_i32();
-    tcg_gen_movi_i32(timm, u5);
+    TCGv_i32 timm;
+
+    switch (MASK_MSA_I5(ctx->opcode)) {
+    case OPC_ADDVI_df:
+    case OPC_MAXI_U_df:
+    case OPC_MINI_U_df:
+    case OPC_CLTI_U_df:
+    case OPC_CLEI_U_df:
+        timm = tcg_constant_i32(extract32(ctx->opcode, 16, 5));
+        break;
+    case OPC_MAXI_S_df:
+    case OPC_MINI_S_df:
+    case OPC_CEQI_df:
+    case OPC_CLTI_S_df:
+    case OPC_CLEI_S_df:
+        timm = tcg_constant_i32(sextract32(ctx->opcode, 16, 5));
+        break;
+    case OPC_LDI_df:
+        timm = tcg_constant_i32(sextract32(ctx->opcode, 11, 10));
+        break;
+    default:
+        break;
+    }
 
     switch (MASK_MSA_I5(ctx->opcode)) {
     case OPC_ADDVI_df:
@@ -490,43 +508,34 @@ static void gen_msa_i5(DisasContext *ctx)
         gen_helper_msa_subvi_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_MAXI_S_df:
-        tcg_gen_movi_i32(timm, s5);
         gen_helper_msa_maxi_s_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_MAXI_U_df:
         gen_helper_msa_maxi_u_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_MINI_S_df:
-        tcg_gen_movi_i32(timm, s5);
         gen_helper_msa_mini_s_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_MINI_U_df:
         gen_helper_msa_mini_u_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_CEQI_df:
-        tcg_gen_movi_i32(timm, s5);
         gen_helper_msa_ceqi_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_CLTI_S_df:
-        tcg_gen_movi_i32(timm, s5);
         gen_helper_msa_clti_s_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_CLTI_U_df:
         gen_helper_msa_clti_u_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_CLEI_S_df:
-        tcg_gen_movi_i32(timm, s5);
         gen_helper_msa_clei_s_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_CLEI_U_df:
         gen_helper_msa_clei_u_df(cpu_env, tdf, twd, tws, timm);
         break;
     case OPC_LDI_df:
-        {
-            int32_t s10 = sextract32(ctx->opcode, 11, 10);
-            tcg_gen_movi_i32(timm, s10);
-            gen_helper_msa_ldi_df(cpu_env, tdf, twd, timm);
-        }
+        gen_helper_msa_ldi_df(cpu_env, tdf, twd, timm);
         break;
     default:
         MIPS_INVAL("MSA instruction");
@@ -537,7 +546,6 @@ static void gen_msa_i5(DisasContext *ctx)
     tcg_temp_free_i32(tdf);
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(timm);
 }
 
 static void gen_msa_bit(DisasContext *ctx)
-- 
2.31.1


