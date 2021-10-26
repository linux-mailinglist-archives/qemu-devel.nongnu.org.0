Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC043BDFC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:37:07 +0200 (CEST)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfW0A-00019v-PA
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaH-0003Np-Uo
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:21 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaA-000213-7S
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:21 -0400
Received: by mail-pg1-x533.google.com with SMTP id r28so1097525pga.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p1UNT79xG4oDnmYUiMREY20bNauejtvwzT0okXNXFUU=;
 b=hPgc2an4+R8xsrsoCE9JJKFNdsd2jvfoF/RD98ik9+K+APX6NmjYTzEn4n70jaKEEM
 HINK4p/bK3JEnvkRco7tMVbu73GGgcVnF3nY+n0/qGsP7c7S2pRUQH8q2aSqqhOr5q54
 b6DqO6gRbRmOvtCin7tsublgIhjECXbJboBbWf7cG+sWQaJP7QfgxvNVNB2IqsNHUzRz
 3fHnRTmtVzopWRSEa4zt1bnwo44FxZy6EsqPxMvtefwmCBaZ4rSlQlEsXsNJoFaiq+W9
 elH9+hfydGle49S4yHmnLAWvAk3t+5R8pZonpUm0XiEF6NK1BcnSduRLeX4lmo45Xp4A
 aHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p1UNT79xG4oDnmYUiMREY20bNauejtvwzT0okXNXFUU=;
 b=xQXX80n5VgrNiKnWNTeI/b/8fNCb8Jz38+QnND6wDyvLy5dAJaQ+EK3jTpPtHUAs2d
 SkS5WCV3pQVtoEDj09wiSqYJpwxTjN6XBwX/YJZIrzeb9BJN42ESmfk2g/3uML/uBAvq
 zUg07DKn1psHT0Wa+Q00HM/MHjXbDaTQDdM5BQ9aVwa/wU7225RfOoKsGRsTu035ymZN
 bVjV16SX+yIlcDgRGv3IYCXHFBmgy0KRGZwJM2ct5hOj+GdOCFurvnVoqUJINJo09ibD
 MG54QiHK2inI/JyELk+TKBxHaQsEQOOfnsPwRpBLDIABasCh4fCbYcDxTxdTsdxnlULY
 Eq2w==
X-Gm-Message-State: AOAM5302uVWrKw3MU1QokgZlFIQnku9Ysrg9A+WHpOYczkbua/3+8CEu
 zaZtLSMrxHR3EQiLn7pHIZeesNJZGQDHSA==
X-Google-Smtp-Source: ABdhPJx+tMBoIpPltmFGssrD+EcdQbaI+aZeO+TMM6MS3pSBeCTTbMwgkothJvXPM7X6o6uZTq5b/A==
X-Received: by 2002:a62:e816:0:b0:47b:d98e:f934 with SMTP id
 c22-20020a62e816000000b0047bd98ef934mr24709038pfi.83.1635289812936; 
 Tue, 26 Oct 2021 16:10:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/51] tcg/optimize: Split out fold_xx_to_x
Date: Tue, 26 Oct 2021 16:09:23 -0700
Message-Id: <20211026230943.1225890-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
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


