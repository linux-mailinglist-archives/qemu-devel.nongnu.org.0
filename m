Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA26B32225B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:49:36 +0100 (CET)
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEK1H-0002kA-TH
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrP-0000y9-CJ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:23 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrN-0005Qw-RT
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:23 -0500
Received: by mail-ej1-x636.google.com with SMTP id n20so5825374ejb.5
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cPqTdlRSqWnikQijLksatBH+7i1gXhB78//9AOt2jP4=;
 b=a/01CO6tXJxmMY3kw+cP21Liy1AZQZTARkuvs0tlrbaVWv+hv1Gr+NRew+rTs9AZc7
 hcul3CTLE2f99YV9wb/Xq5/hdg89YQGRGhnKfttnFdwNWN5JzDh3Lghl8Ic64Jc4J0CF
 WkoJPBRhxzLuzfQBQGib524mF4tLZZHdIhSBADHm0qjnNh20i3Y5XC31ZQeLRY8r8m6/
 FgXj0vmBZsnT8n+18TdgGkc/8+RJTF67dVtMSApqQUoF1KocjwYgM6dbGqIgpbkFUhBR
 pCkYLOqhUNYbBvpDgG+IBcDqE9y8Mm9Zn7IcaliRvM0vq/m3C/9LRM+d1GsUPNsVsMhh
 DnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cPqTdlRSqWnikQijLksatBH+7i1gXhB78//9AOt2jP4=;
 b=H3lBx2t7s3TV/Ui6Y/EReAb04GSE9GgQWveDpgcFtpLsX+60ldZRFctI90wdNJVgH0
 XJ468xRB8azACmD9NrE9Lm7+LbVR3VbA1K1xhemD4jE9lkYpj7T8eNm3qP4DkApPidl/
 c8fyFTAD3TW0d/oVsMfltiL9e20iE6nsKtspRw9jL8HrADSHZhwPL9cw26zd5Tg1cbm0
 RbXV2Wa2OdNeFJF93E1rlfl/EvcPp6XWLguZLTHRTXj/0TjVcXDS3R5jK+dNm1+LMAvo
 iCqhwsH3Qa2pcTBB7wPwGSo2Gaiui3unIpAMA1I1aETcdUde3/A/0CPYHAVGqWyPf3iT
 cKBg==
X-Gm-Message-State: AOAM530VfvwUQg1eKnXtPtLJ4eCQMQtqwkombtTV6LkrVCtp25wETbpc
 ciO9EfqcmuhtsDA3Ytjumam1cUrwa9M=
X-Google-Smtp-Source: ABdhPJxTH4vuh1nVGvBpb8QkyYSWx3EcK/jikVJr8pUegjBFk2PYReAGEJnUBJXrci++4aA13keOcQ==
X-Received: by 2002:a17:907:da3:: with SMTP id
 go35mr22123070ejc.26.1614033560369; 
 Mon, 22 Feb 2021 14:39:20 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t8sm6020479edv.16.2021.02.22.14.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 14:39:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/10] target/mips: Remove unused CPUMIPSState* from MXU
 functions
Date: Mon, 22 Feb 2021 23:38:54 +0100
Message-Id: <20210222223901.2792336-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222223901.2792336-1-f4bug@amsat.org>
References: <20210222223901.2792336-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

None of these MXU functions use their CPUMIPSState* env argument,
remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a53ce6adb9a..6f5ccd667da 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25694,7 +25694,7 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
  * =======================
  */
 
-static void decode_opc_mxu__pool00(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu__pool00(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 18, 3);
 
@@ -25718,7 +25718,7 @@ static void decode_opc_mxu__pool00(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc_mxu__pool04(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu__pool04(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 20, 1);
 
@@ -25734,7 +25734,7 @@ static void decode_opc_mxu__pool04(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu__pool16(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 18, 3);
 
@@ -25761,7 +25761,7 @@ static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc_mxu__pool19(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu__pool19(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 22, 2);
 
@@ -25780,7 +25780,7 @@ static void decode_opc_mxu__pool19(CPUMIPSState *env, DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
+static void decode_opc_mxu(DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 0, 6);
 
@@ -25817,7 +25817,7 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
 
         switch (opcode) {
         case OPC_MXU__POOL00:
-            decode_opc_mxu__pool00(env, ctx);
+            decode_opc_mxu__pool00(ctx);
             break;
         case OPC_MXU_D16MUL:
             gen_mxu_d16mul(ctx);
@@ -25826,16 +25826,16 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
             gen_mxu_d16mac(ctx);
             break;
         case OPC_MXU__POOL04:
-            decode_opc_mxu__pool04(env, ctx);
+            decode_opc_mxu__pool04(ctx);
             break;
         case OPC_MXU_S8LDD:
             gen_mxu_s8ldd(ctx);
             break;
         case OPC_MXU__POOL16:
-            decode_opc_mxu__pool16(env, ctx);
+            decode_opc_mxu__pool16(ctx);
             break;
         case OPC_MXU__POOL19:
-            decode_opc_mxu__pool19(env, ctx);
+            decode_opc_mxu__pool19(ctx);
             break;
         default:
             MIPS_INVAL("decode_opc_mxu");
@@ -26995,7 +26995,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
 #if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
-            decode_opc_mxu(env, ctx);
+            decode_opc_mxu(ctx);
             break;
         }
 #endif
-- 
2.26.2


