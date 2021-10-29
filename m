Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87943F67A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:16:51 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKG0-0005sq-GY
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJde-0002O6-9U
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:10 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJda-0000LK-BZ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:09 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b1so4592518pfm.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YOUc3yXenTRMiM7WTQSICcimIlL2Z5B4rJ9cAL/TpyU=;
 b=yuXia0Pu4A8TIYBPiCK3KJ3ZmweZ8nTu4iCd3rhtROawQHvB9NQg+F80nRLePGPDTE
 JhCxE7njKd/KRPXSoXVeCcKI7sPcrn8DRYgYF7Gu+pe6/VMHajaX2gBdLG+/Usy08asl
 heJrL5iOEr8veYnlVC9HuIaSDxqhbWXJ9UkobLw8qaVNqS+Uy+IMC4mR9JfSn90pfbt7
 boA4oOLjxGfTqw/0e8A6Tgt7TNj4hdwhJXHN3lvIhbf+1TkCHbkL5jszyPMZ3XmXTSkA
 hMpeD631kgU95ZZnA9CIl64YpZElgLKdqigvGb+h8wxWEA68Q/0fJcHwNP7FKS99n2FL
 1OCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YOUc3yXenTRMiM7WTQSICcimIlL2Z5B4rJ9cAL/TpyU=;
 b=jE2yUmFV7HgDF/kubGRw8rEkenfribg+2k4lkM6rUana3CXc/aMV/vvB3JqyvMppM8
 zMEZMZ0P0Vg59sWgChG1FRNTCbWHtMS+DQ7gV9jT1DM2Q4xA8ZQBk654D1QNlKEzAWCG
 tHXZmAlLmoZgd1Bug4FAOA7bOytNPtSTWHaeb0iyoxfJfHOREvim/a1Not1nifyCpOgS
 sd+xTebNZAfsBRB6dUrGSA427UVV/tO6ocxs0uH8ZApPbe4gXvci1ZK3/+rNLcg7WphW
 AcC5gKmRO2OsYBp4Kzs45uJqstCUWcIV0VueEsaQ+L5ii0OimCvzduWOmo7l28S8ngWM
 YQ0w==
X-Gm-Message-State: AOAM530WkFjeQmNfkMALe3DrstHiQ5zyw62XyeORlD2sbq83F9NCeMUn
 zzsN2l01br0hRbW9k2vbOd2kDjdtLh3e0Q==
X-Google-Smtp-Source: ABdhPJxVl+yYHmsm9TbftwhnaZBFHCBgH9Yz3BZNAJ4BkMM5DGceg0tih5vioaIsKPSboq+Lol8l5A==
X-Received: by 2002:a05:6a00:26db:b0:47b:d469:5be0 with SMTP id
 p27-20020a056a0026db00b0047bd4695be0mr8540541pfw.64.1635482224866; 
 Thu, 28 Oct 2021 21:37:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 41/60] tcg/optimize: Split out fold_xi_to_x
Date: Thu, 28 Oct 2021 21:33:10 -0700
Message-Id: <20211029043329.1518029-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, a, i => mov r, a" optimization into a function,
and use them in the outer-most logical operations.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 61 +++++++++++++++++++++-----------------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e0d850ffe4..f5ab0500b7 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -749,6 +749,15 @@ static bool fold_xi_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
     return false;
 }
 
+/* If the binary operation has second argument @i, fold to identity. */
+static bool fold_xi_to_x(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[2]) && arg_info(op->args[2])->val == i) {
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
+    }
+    return false;
+}
+
 /* If the binary operation has second argument @i, fold to NOT. */
 static bool fold_xi_to_not(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -787,7 +796,11 @@ static bool fold_xx_to_x(OptContext *ctx, TCGOp *op)
 
 static bool fold_add(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
@@ -827,6 +840,7 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xi_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
@@ -837,6 +851,7 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_ix_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1044,6 +1059,7 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1237,6 +1253,7 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
@@ -1246,6 +1263,7 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 static bool fold_orc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_ix_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1365,7 +1383,11 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_sub_to_neg(OptContext *ctx, TCGOp *op)
@@ -1408,6 +1430,7 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_sub_to_neg(ctx, op)) {
         return true;
     }
@@ -1423,6 +1446,7 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1546,39 +1570,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expression for "op r, a, const => mov r, a" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(add):
-        CASE_OP_32_64_VEC(sub):
-        CASE_OP_32_64_VEC(or):
-        CASE_OP_32_64_VEC(xor):
-        CASE_OP_32_64_VEC(andc):
-        CASE_OP_32_64(shl):
-        CASE_OP_32_64(shr):
-        CASE_OP_32_64(sar):
-        CASE_OP_32_64(rotl):
-        CASE_OP_32_64(rotr):
-            if (!arg_is_const(op->args[1])
-                && arg_is_const(op->args[2])
-                && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-                continue;
-            }
-            break;
-        CASE_OP_32_64_VEC(and):
-        CASE_OP_32_64_VEC(orc):
-        CASE_OP_32_64(eqv):
-            if (!arg_is_const(op->args[1])
-                && arg_is_const(op->args[2])
-                && arg_info(op->args[2])->val == -1) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-                continue;
-            }
-            break;
-        default:
-            break;
-        }
-
         /* Simplify using known-zero bits. Currently only ops with a single
            output argument is supported. */
         z_mask = -1;
-- 
2.25.1


