Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D443F66C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:02:00 +0200 (CEST)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgK1f-0004c8-NR
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJae-0004oq-Kt
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:04 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJab-00080Z-Om
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:04 -0400
Received: by mail-pg1-x529.google.com with SMTP id f5so8660068pgc.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p1UNT79xG4oDnmYUiMREY20bNauejtvwzT0okXNXFUU=;
 b=GjuBGiG0LoAzwp+/kUW+5lg2ClS6oIYxI3P+eeqsJCcvTT0RVQCem6Wvm0ijHzEcZB
 xWL2fqvF2gofc9LIm7TxhJPdlwZBDbvnosCKxQOM5hxiaxWaovSldigsG9U8XuuXW9ML
 3KB7OI2onkS5XjddVvHOYQsODmwqNPmp7G2RKGmaCzR7TzCbkhIwOl7n+Z+SieNMjRtR
 C7Cc4EIiYU/Lu2LDWFflQ1cmRrYZ6KslkXKLGYR1Bz3YewLIF39/hDzNGq6+Sa/Cc+Oe
 cgxTx6HOpznP8ndUYqaEzn/pAdPTp/+Hkq7OXz/XcusiX05unEKK3gRkpBX9PXrRhks7
 7PHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p1UNT79xG4oDnmYUiMREY20bNauejtvwzT0okXNXFUU=;
 b=uECfZun+bVrVysjMKAiBeVNsRa7ilN7PQCUf0U6LzrijE7kEqE+oVuNKzPoca/IJ0r
 Gtx+LbZpg1xK5WVuWM8YfSv+rtF/9tYFxJ4Af4RRVK1uPXGUGMwEWg6wvx7rfV1H6Lw5
 SwlWVWlRQV+Oj0I1VmLt0ggugP/XnQ5iLoc4p0AQ64DpLhLrKvBUfi/JLNaCXLO8/aqZ
 1Y6pRVdmN5zZEv67TPoX8/yxFxGptzWiSZ62Y+VLEbkIbAgsr8Fuj7twlgLtcDHPX9Pm
 KOFNvWmvzZpIVaLpYllvOp9pfI7mfm3yVuiwrlPOdr9/cElonCwV6kOATtq3xqHhN7UQ
 JcdA==
X-Gm-Message-State: AOAM5327dM2FumdsCIWVHIpBBRKY2UKAEKzJdupU6nNhYGNpVcsrAgeC
 J4uZNwTh9AlGocoDoUQrZHF+VvXuBRSREw==
X-Google-Smtp-Source: ABdhPJyeUuxh07ZRFgG/d/5papkdK9hUmmK93kZG9ZBaky+BsLHLDFei2BjI33Agn3COI+zOKPlH7w==
X-Received: by 2002:a63:fa16:: with SMTP id y22mr2165439pgh.53.1635482040553; 
 Thu, 28 Oct 2021 21:34:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:34:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 36/60] tcg/optimize: Split out fold_xx_to_x
Date: Thu, 28 Oct 2021 21:33:05 -0700
Message-Id: <20211029043329.1518029-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Pull the "op r, a, a => mov r, a" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 2f55dc56c0..ab96849edf 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -704,8 +704,22 @@ static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
     return false;
 }
 
+/* If the binary operation has both arguments equal, fold to identity. */
+static bool fold_xx_to_x(OptContext *ctx, TCGOp *op)
+{
+    if (args_are_copies(op->args[1], op->args[2])) {
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
+    }
+    return false;
+}
+
 /*
  * These outermost fold_<op> functions are sorted alphabetically.
+ *
+ * The ordering of the transformations should be:
+ *   1) those that produce a constant
+ *   2) those that produce a copy
+ *   3) those that produce information about the result value.
  */
 
 static bool fold_add(OptContext *ctx, TCGOp *op)
@@ -748,7 +762,11 @@ static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
 
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_x(ctx, op)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_andc(OptContext *ctx, TCGOp *op)
@@ -1111,7 +1129,11 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_x(ctx, op)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_orc(OptContext *ctx, TCGOp *op)
@@ -1747,19 +1769,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expression for "op r, a, a => mov r, a" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(or):
-        CASE_OP_32_64_VEC(and):
-            if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-                continue;
-            }
-            break;
-        default:
-            break;
-        }
-
         /*
          * Process each opcode.
          * Sorted alphabetically by opcode as much as possible.
-- 
2.25.1


