Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D443BDE6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:31:14 +0200 (CEST)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVuS-0006Uk-M1
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaH-0003Ml-Hj
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:21 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa9-00020y-Bl
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:20 -0400
Received: by mail-pg1-x529.google.com with SMTP id g184so1023918pgc.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8y4qKou3t3jzIUIj9qEAD2/5WFZAuzm9armlPHHtAYM=;
 b=qTJrt2e9upQeoRYHWtXoX+8t1CsLStlm0/m0t8l/SkHjTyK5Bq7BMcQq3a4wNdJ81M
 Ag67S+DbsvfureTdCqVJyF1ORwBmr4vr/VW8boduiRjx0No5wJMutunhx60rWoZ2IvzD
 kU8b/3P5ev+RAlgGKl94Qb501Y1b0D2bMgruxlk+xJnRiCioKDe6AiDIl4EiKONUGutg
 J6uidmR74GSXVLhfm6BzTka0/OVFte1laStOaTC6BZ4fucF8zmQtAFA1STXKMUJHH4Tb
 5a4MCHu+zmLqRN6DESM2TcC7auzMD6BoFwTIbuhQFi3iST6f9zmxC25GCv9DP7sHgu0P
 zkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8y4qKou3t3jzIUIj9qEAD2/5WFZAuzm9armlPHHtAYM=;
 b=6DhPZYkNWYHPAOU8SS02i3fGzOLqpeH9CKSgwLa5hoktWbeDxcXVE42+HrOLLW3ASN
 XJDLXRBgRocBkd7ryvf0yvqWRRTM6fRo5jfD8c/+eRh8XaltuF2aE6mXtnDYWKGeR8rj
 dxWmGvZEHDFvsYnmiTLRiZ6vFnqBlYqEqp5amPwPD5Lre6a2S3wDAXHkfIJDtIZ4p9hB
 0fvSE9dY/reX2SmUi6NrM06JBPwN5Lu4jC60g2sQaOyO7YwRfxfohVnl5uk+wNHGZOGg
 eZDIXuO+B2skInwEiwEJMDU2J6pHzW3OebyBsjAskze1/8Zt1D9iWvQqPbNwjvSBS9kr
 Q+ZA==
X-Gm-Message-State: AOAM533ZoYGM8WFv/Yd8ZgZOhlkKRk/sxP0xcCbpAXKu+6SWZpuRO2wR
 n+lZ3DaNDrO7rInb+8+19/V/K0S/XtaJeA==
X-Google-Smtp-Source: ABdhPJzEfNiAB5ZmpshStYsqDmFT9GIz7MVFOjPnuQLRb0LV/IBHfXGeibRWtbnDp6Y1P/hbX+Outw==
X-Received: by 2002:a62:dd96:0:b0:47c:1b37:d0f with SMTP id
 w144-20020a62dd96000000b0047c1b370d0fmr4876149pff.1.1635289812221; 
 Tue, 26 Oct 2021 16:10:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/51] tcg/optimize: Split out fold_xx_to_i
Date: Tue, 26 Oct 2021 16:09:22 -0700
Message-Id: <20211026230943.1225890-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, a, a => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5f1bd7cd78..2f55dc56c0 100644
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
@@ -1224,7 +1237,11 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
 
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
@@ -1234,7 +1251,11 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 
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
@@ -1739,20 +1760,6 @@ void tcg_optimize(TCGContext *s)
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


