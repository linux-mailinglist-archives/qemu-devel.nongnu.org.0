Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8875D425D24
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:21:35 +0200 (CEST)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZtW-0003kT-Kc
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUG-0000PI-8K
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUD-0007bT-OX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:28 -0400
Received: by mail-pj1-x1034.google.com with SMTP id kk10so5738245pjb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i4kG4VWlj+Rxcmce4aIwEOwzX7nV5pr9aS5aMS82Wzg=;
 b=fTmV5GY7snLHiFKCppM14nOIYQeKwZgVPIed0ar3380zCnonZoCmEJOxX1dJxeRm9i
 w62ExKvMsVvy0yKK1tTRxlWlHK799G1+cDx8h/PasgniQlpVcxMIY7CpqI0LimCdDv3j
 JE6Uw3YRru9nKSH0FWUqzk0cJEnyiMznfu5N6XCO9kDZvbJicmaoTnWwlIBgiQXMUIAe
 Le8CAQkQEp3deNOsNu29R3sw8aeLIg1j04w9D46ys0XVElEdLzMJQ8B5Vg6FDs1AzOco
 aHhsg9zMQcq9QaOel1jJwPsLqzINIfcobApaXBBlwlDAYNamFjTXdbCNjQm0dXbEUh4O
 h8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i4kG4VWlj+Rxcmce4aIwEOwzX7nV5pr9aS5aMS82Wzg=;
 b=HdCsTZbGiZYsH7K162JwsexNes7WtwYqF7IY8XEfGWX5eDmodBEmMCxO9KH8qdmqoW
 6wy7eVwmrl9PSNnn3e0NHCYM/qmDGp0akQ4nFZ5ImxVfltztPAVt/HV2Mwj8EFjM8i8M
 mmXqxZ6KkjNK2RUPJBjgWrxjVbk4eNx/XWKl3U3ghcRk7Sce8Gi7/C5nIOEtrFBzTGlP
 IUVZGmeoWEd6Jp9MbwBnetZJDuWziPw7i/dO4wAE5UpSqHk/Ou6ZUfhjQ/o2bPFZ+W8m
 RXc2ClJDhZKoU7xzJ3BaYadncA+44OAIEkqyi3s8pjgx3GHBmwkyMZPkY/VG4RUBVxHX
 M9CA==
X-Gm-Message-State: AOAM530whOhoakNtjG1Xu+FrElmzKyTuK58jzkwSZfbcDWmyGnIfaE6A
 UjGdsL8PY6NTs/ux4P2KJjnN0baF+dqSqA==
X-Google-Smtp-Source: ABdhPJzROKjWApgo00EpGMQmjegwx+jVmb459m/Hm2Cl3DIQIDDa1hx9B8RlOlei/o4ldPoI31mRIg==
X-Received: by 2002:a17:90b:33cb:: with SMTP id
 lk11mr308201pjb.0.1633636524317; 
 Thu, 07 Oct 2021 12:55:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/48] tcg/optimize: Split out fold_xi_to_x
Date: Thu,  7 Oct 2021 12:54:44 -0700
Message-Id: <20211007195456.1168070-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, a, i => mov r, a" optimization into a function,
and use them int the outer-most logical operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 60 +++++++++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 35 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9d7b174443..d1d0f3f60c 100644
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
@@ -1041,6 +1056,7 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1225,6 +1241,7 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
@@ -1348,7 +1365,11 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 
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
@@ -1391,6 +1412,7 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_sub_to_neg(ctx, op)) {
         return true;
     }
@@ -1406,6 +1428,7 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1529,39 +1552,6 @@ void tcg_optimize(TCGContext *s)
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


