Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9ED43F64E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:51:56 +0200 (CEST)
Received: from localhost ([::1]:51936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJrv-0004No-ES
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaU-0004Iz-VJ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:55 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:47039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaS-0007yI-Vl
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:54 -0400
Received: by mail-pl1-x633.google.com with SMTP id p18so2700623plf.13
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1Q9hVmZCD5h+WSzcvXil606EiQ6sWYW4OegtZB7+1g=;
 b=XLQSy26Lf40wwaN0YvSp8mKYDe5BoFdKwqnQWzpZBOvOGPIMNwSiB5+HjvdaOXnHge
 CzRAY+x76zTDW600hWx84uBbG4X0OQkVf8FHsu5GaL5G2B9a0ZzcW/a8zp4U6lHre8Ct
 CNLwq/TNIFB221pg15+IWoIeGZKlwylFhpecxA/ug7nm1TvxxPKgQW2nCPT4eq5gaipo
 Qj8Y1RruR89j9b1uQLPH3clyGfogY7mL7hb5o2FgYz7og5DSKHdZshxp3l43SYR37iKf
 D491liFeoD+uXYYSpDNFfAMvLl/odOzt4+5q44PTAiPdlW/xPwuk0MZlbu0MPsrcaE3Q
 Xkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1Q9hVmZCD5h+WSzcvXil606EiQ6sWYW4OegtZB7+1g=;
 b=xLWjZymKiFErPp/I3WQukgj3Te1aCfXuu0WLjku5u/ziRcy1KWwOcbmXY6mayp+7dF
 nCzuj5yv995u3mVbSUZ+DeQ+UU7XN2/q5BgkIDdJaAL6D5N3fRPFxJM9t//2lq2IsYoX
 kmCr0hDCITttSxP19AQS5ZDxk/3eEIsLsL6xq2y+vTfyy42GMPy44WJvfW9d8bEGb84J
 KGt63AFZ5kMQonqHW2fBik5fLE4qOgv4flKoIMefhVDQhj9f4AI/1qGLHUWaMcjjbRzS
 KiZ+VV//1/Sqv1cyAessvWsxmIPz6fD2nMCnjIB/TZRYsMxQ0seQ2bfkJJ0qOrqawXUe
 LW/g==
X-Gm-Message-State: AOAM531wcRo+/J9bpQr/2BrCI2vP9OA0mYwBZEWXmYyVSWICNHq6ub8b
 RYhlBGwj2BZeKUX0BRpevvBV5vttnyfdBQ==
X-Google-Smtp-Source: ABdhPJwaaWVtTPZQDqluTb3tyMBVvptLDZorDybMX1D2doMDzg69rf6A+wxdRqQPQfjmWjKDyMElgA==
X-Received: by 2002:a17:902:d4cc:b0:140:26ce:4d14 with SMTP id
 o12-20020a170902d4cc00b0014026ce4d14mr7646511plg.45.1635482031790; 
 Thu, 28 Oct 2021 21:33:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 25/60] tcg/optimize: Split out fold_mulu2_i32
Date: Thu, 28 Oct 2021 21:32:54 -0700
Message-Id: <20211029043329.1518029-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f79cb44944..805522f99d 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -899,6 +899,24 @@ static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
+        uint32_t a = arg_info(op->args[2])->val;
+        uint32_t b = arg_info(op->args[3])->val;
+        uint64_t r = (uint64_t)a * b;
+        TCGArg rl, rh;
+        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+
+        rl = op->args[0];
+        rh = op->args[1];
+        tcg_opt_gen_movi(ctx, op, rl, (int32_t)r);
+        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(r >> 32));
+        return true;
+    }
+    return false;
+}
+
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1710,22 +1728,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_mulu2_i32:
-            if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
-                uint32_t a = arg_info(op->args[2])->val;
-                uint32_t b = arg_info(op->args[3])->val;
-                uint64_t r = (uint64_t)a * b;
-                TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
-
-                rl = op->args[0];
-                rh = op->args[1];
-                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)r);
-                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(r >> 32));
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1781,6 +1783,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(muluh):
             done = fold_mul_highpart(&ctx, op);
             break;
+        case INDEX_op_mulu2_i32:
+            done = fold_mulu2_i32(&ctx, op);
+            break;
         CASE_OP_32_64(nand):
             done = fold_nand(&ctx, op);
             break;
-- 
2.25.1


