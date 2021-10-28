Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67B43D9A4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:05:37 +0200 (CEST)
Received: from localhost ([::1]:40390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvjU-0007g1-Rm
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMe-0004sm-6u
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:02 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMc-0003qW-Aw
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:59 -0400
Received: by mail-pl1-x629.google.com with SMTP id p18so82020plf.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p1UNT79xG4oDnmYUiMREY20bNauejtvwzT0okXNXFUU=;
 b=Y+mg9WTx2WP7qtXnxMdgQTDrM1juH75k+nlo4eYgaoefeHP+FJKJ04c2G6CxMNwpTW
 SbIWLYR5DlMOPKIg324rbplAs7FijPOc9C5Ryov7UD0xsfIxRysA8yhlYgHijjXi465o
 Jt4J+AGY3fIbRTMP//79ACGBG9J8Jw3rwqHeC5Pp0g078QgNi4bo2dWRSPJkgHYr7J3+
 /b+oajOmpps1nc1VvGhv9bUrEdIqHaw0k03kCUziaKtesA/WKpRlnrHiOfzqLKcobuqW
 OtVM+FXBhiu3JxXHSs7b8LMTITPY8RYNBeTyHVwoUWwghmauCzq2GetIVxFt8jf8vInh
 KA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p1UNT79xG4oDnmYUiMREY20bNauejtvwzT0okXNXFUU=;
 b=Oo8lsRsVuhnuoJOkrPWYQ5UABi5G9dgmMvvX2MjMZ7XdwbDd3hJDxYiZdsY3mPEgoA
 oo3alVgpoK2gDUcWi2p+8d3MLLZtk4YDbjiOaILSiqzOYGj1hdgRor6rr9eZJsPx9fgM
 Aj/KznLtF7gGreBaK0h+6nC7+7oF0EtG3i2WOxnG+3iaGzWYKoKa14rJZd+rmb4RFbGk
 a8RGpkU/vbFzBkxEbQFzboinqPrnqgz+mej8EZdCIEmAiS74UuELLDTIjqCeHPTdpgLQ
 WBR/u7U/TryChB83DK0Lz2vvcYJ+JPqot6aRVicTuGSwx+l5UDQk1xQgIXMOvrIBkuJr
 F6oQ==
X-Gm-Message-State: AOAM532gVlzKKDjiwZuOROueUsmxsyjPLAyc28QaqcjeNWnnQPpYr3vG
 QIBbgDzT7R2rsIRvPumZ6uW+op9PYg5gSA==
X-Google-Smtp-Source: ABdhPJx1NUF/f1CTvZjKVRCr+KZxDrX7dnndNqM3He8MexqrjkAKvi+INcwogM6TxSudtkN96GR5vA==
X-Received: by 2002:a17:90b:3811:: with SMTP id
 mq17mr9892506pjb.97.1635388916286; 
 Wed, 27 Oct 2021 19:41:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/56] tcg/optimize: Split out fold_xx_to_x
Date: Wed, 27 Oct 2021 19:41:11 -0700
Message-Id: <20211028024131.1492790-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


