Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8B425CD8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:03:11 +0200 (CEST)
Received: from localhost ([::1]:44114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZbi-0006MA-Gb
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUE-0000Ou-6T
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:28 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUA-0007JW-7a
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:25 -0400
Received: by mail-pl1-x632.google.com with SMTP id t11so4586003plq.11
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+iP7I5BctgXbBUvM9qfA2jzVAaTcAAgoD5ny2gP5iX8=;
 b=qTSlj1Cmg3/3QESXqvz3Nfqb44FinACsC5s/xELGUWtYz9qyD0ZvccDWou9eaBpna0
 QyrzJY8UQ6ViGeZHQ1F4ttE6C3gU3GCHCAc4qHPi+eajjUZTGjIaIPG+v1C4tfxZc82C
 10+bUVXggmRzd/iwFfMp7itd9a8sp+D7kJn+oz3LLEUf+vXeUOi/CG95PewBSRFJLTzX
 E4BaVShWkrGT5Ne2cVIA2iQvyOAb+xPT4xx2ztmoxfLTd9+z/N6fm16keDcO+W0vOzAY
 fDbgmqBnooxtLvjNbsSJdXkcJJg6v3UxlQgpfTCRyPZ6LrPBYVrM1yOTJb6nKTfMEHtL
 Klrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+iP7I5BctgXbBUvM9qfA2jzVAaTcAAgoD5ny2gP5iX8=;
 b=hHlrCUKbTfFIPcnar7bto8FSwRH/g9Kc+/K2458wQI/spQiU/0tM3d6FJuSDIxkn4b
 J9mqG7lvMMnLG7nUxiySEHUdXoRBfrZBzZCTPv5MkFDD8X4OKgL4EcwsZ4HoEN1aiUXu
 F/slPYWYt2cR5WRZ1GLjaIginsMtF9Uc5QxUCkvRi333XvhyEUm80L/8QBytbtGzHpwI
 GZtBfifKvXih8RzX2kyCKFLoJwLEstpCcgUCtAVNloI7+hIRv8Eif1hDa/TsJkPZNf/C
 F/h/qzEUQAkSJVrxXViHoqENR33YSCOSxK6UsN1diUAaDPmQxdegOngERwjsFyGJvk40
 Qp5g==
X-Gm-Message-State: AOAM5312jRyy4INzTQKaGT8gQ62Wg8i+8f+DCLcgwfB1QnH5BJmrj+DB
 3hPDtVb0WZJUbjHXHMvQrYF34sYY0o7ENw==
X-Google-Smtp-Source: ABdhPJzX8QBSpsticciqvi8NkFan4eymQ64VBVU5kl/3jiZeKBAWheOJt8ecdcNUBdxb7VCzAmL5eg==
X-Received: by 2002:a17:90a:290b:: with SMTP id
 g11mr7517222pjd.35.1633636519412; 
 Thu, 07 Oct 2021 12:55:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/48] tcg/optimize: Split out fold_xx_to_i
Date: Thu,  7 Oct 2021 12:54:38 -0700
Message-Id: <20211007195456.1168070-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, a, a => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 3a923fda10..708fb850b0 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -695,6 +695,15 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+/* If the binary operation has both arguments equal, fold to @i. */
+static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (args_are_copies(op->args[1], op->args[2])) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /*
  * These outermost fold_<op> functions are sorted alphabetically.
  */
@@ -744,7 +753,11 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 
 static bool fold_andc(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_brcond(OptContext *ctx, TCGOp *op)
@@ -1211,7 +1224,11 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
 
 static bool fold_sub(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
@@ -1221,7 +1238,11 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 /* Propagate constants and copies, fold constant expressions. */
@@ -1726,20 +1747,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expression for "op r, a, a => movi r, 0" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(andc):
-        CASE_OP_32_64_VEC(sub):
-        CASE_OP_32_64_VEC(xor):
-            if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
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


