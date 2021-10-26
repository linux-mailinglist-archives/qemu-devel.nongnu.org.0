Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C443BE22
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:49:50 +0200 (CEST)
Received: from localhost ([::1]:54872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWCT-0003NY-JW
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdG-0008Vl-El
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:26 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdE-00036O-3z
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:26 -0400
Received: by mail-pf1-x42c.google.com with SMTP id t184so960586pfd.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n47MTXgHZalE95TWi53dEjc+mKQRRvcdCV84YGe7Grc=;
 b=n5xJrzJ9vDW1W2fDtJEwwupCACxPvYpTKSLgMJ21sWZB/rvoUBy6DUPe3zJb7RW3yz
 fXGVreq2iEj7PxCesM2UKhBGc8e47bu/8mDgwcXikSzGBFRI5hQskNaao91uJ9a2RjAQ
 nz8zjukmqRsEWwR9Cv5NN3haix2v1Xn4ua8owgnqCmbFmalequqszfW2BxUkvywSXBCk
 JMY1OhLB7KhM72mH57pVmwJCAmjtPdxqUe4v9QJquY+AePA9RC13LcWeGRIbjSlgaf5M
 dKVgGX2gLFlyGzjxHcG5HovYBuwks7/PWCpSlOWDdGwRVfwNLFK+ceCldWJ+WwedfccP
 3GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n47MTXgHZalE95TWi53dEjc+mKQRRvcdCV84YGe7Grc=;
 b=DsSHGGbJn9P/dZcQQhM9w8KyG/5Q2rAec07czjxjNYinuZ95wAqDSl/h8Ph5aSRhcx
 s6gcgyJNdiz74gcBDp+KLDMbrtJOZOO6nQo4XlHheS5Xq4y9sR2D+jozGMQkPLEpFl7d
 eEXKtUeU6ppTAwJ78Ru6ZNapJegezFznmS1sNyAWgjiUVx9w93dvWKwnJOutHpZbsywT
 AVk2Ds4xaeXRIE+WGE4/lIhrQthTAnrhzM6gGCA11Hiu8WhqbcIzN2UeUoFuG/TMMh6x
 7z0yt61xqn18cscL/2oguI+6T4UbYrWCYwD2tDLA3WJeY0OR8ZZWl915cwIkcQ3AzJ4q
 ekdg==
X-Gm-Message-State: AOAM532WgvTNK8+u94SdeaYBDYzEFWbTMKuzp6SpAZe254v7eaoMgNLk
 8thc951Q7U2otRp1yQREgUMAQJ7fLhI0CA==
X-Google-Smtp-Source: ABdhPJw+pLjBVgU5CcsdNKEO2ywNqAnBIXRnlk5aPKdXxtxc57wDMvoQhUvJRobf2gYxKoi6SKK7rQ==
X-Received: by 2002:a63:9308:: with SMTP id b8mr21249662pge.104.1635290002811; 
 Tue, 26 Oct 2021 16:13:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 41/51] tcg/optimize: Sink commutative operand swapping into
 fold functions
Date: Tue, 26 Oct 2021 16:09:33 -0700
Message-Id: <20211026230943.1225890-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Most of these are handled by creating a fold_const2_commutative
to handle all of the binary operators.  The rest were already
handled on a case-by-case basis in the switch, and have their
own fold function in which to place the call.

We now have only one major switch on TCGOpcode.

Introduce NO_DEST and a block comment for swap_commutative in
order to make the handling of brcond and movcond opcodes cleaner.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 141 ++++++++++++++++++++++++-------------------------
 1 file changed, 69 insertions(+), 72 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 6189637dd8..b72a01910a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -577,6 +577,19 @@ static int do_constant_folding_cond2(TCGArg *p1, TCGArg *p2, TCGCond c)
     return -1;
 }
 
+/**
+ * swap_commutative:
+ * @dest: TCGArg of the destination argument, or NO_DEST.
+ * @p1: first paired argument
+ * @p2: second paired argument
+ *
+ * If *@p1 is a constant and *@p2 is not, swap.
+ * If *@p2 matches @dest, swap.
+ * Return true if a swap was performed.
+ */
+
+#define NO_DEST  temp_arg(NULL)
+
 static bool swap_commutative(TCGArg dest, TCGArg *p1, TCGArg *p2)
 {
     TCGArg a1 = *p1, a2 = *p2;
@@ -696,6 +709,12 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_const2_commutative(OptContext *ctx, TCGOp *op)
+{
+    swap_commutative(op->args[0], &op->args[1], &op->args[2]);
+    return fold_const2(ctx, op);
+}
+
 static bool fold_masks(OptContext *ctx, TCGOp *op)
 {
     uint64_t a_mask = ctx->a_mask;
@@ -832,7 +851,7 @@ static bool fold_xx_to_x(OptContext *ctx, TCGOp *op)
 
 static bool fold_add(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
@@ -891,6 +910,9 @@ static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
 
 static bool fold_add2(OptContext *ctx, TCGOp *op)
 {
+    swap_commutative(op->args[0], &op->args[2], &op->args[4]);
+    swap_commutative(op->args[1], &op->args[3], &op->args[5]);
+
     return fold_addsub2(ctx, op, true);
 }
 
@@ -898,7 +920,7 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     uint64_t z1, z2;
 
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_xx_to_x(ctx, op)) {
@@ -950,8 +972,13 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
 static bool fold_brcond(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[2];
-    int i = do_constant_folding_cond(ctx->type, op->args[0], op->args[1], cond);
+    int i;
 
+    if (swap_commutative(NO_DEST, &op->args[0], &op->args[1])) {
+        op->args[2] = cond = tcg_swap_cond(cond);
+    }
+
+    i = do_constant_folding_cond(ctx->type, op->args[0], op->args[1], cond);
     if (i == 0) {
         tcg_op_remove(ctx->tcg, op);
         return true;
@@ -966,10 +993,14 @@ static bool fold_brcond(OptContext *ctx, TCGOp *op)
 static bool fold_brcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[4];
-    int i = do_constant_folding_cond2(&op->args[0], &op->args[2], cond);
     TCGArg label = op->args[5];
-    int inv = 0;
+    int i, inv = 0;
 
+    if (swap_commutative2(&op->args[0], &op->args[2])) {
+        op->args[4] = cond = tcg_swap_cond(cond);
+    }
+
+    i = do_constant_folding_cond2(&op->args[0], &op->args[2], cond);
     if (i >= 0) {
         goto do_brcond_const;
     }
@@ -1219,7 +1250,7 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
@@ -1381,8 +1412,20 @@ static bool fold_mov(OptContext *ctx, TCGOp *op)
 static bool fold_movcond(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[5];
-    int i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
+    int i;
 
+    if (swap_commutative(NO_DEST, &op->args[1], &op->args[2])) {
+        op->args[5] = cond = tcg_swap_cond(cond);
+    }
+    /*
+     * Canonicalize the "false" input reg to match the destination reg so
+     * that the tcg backend can implement a "move if true" operation.
+     */
+    if (swap_commutative(op->args[0], &op->args[4], &op->args[3])) {
+        op->args[5] = cond = tcg_invert_cond(cond);
+    }
+
+    i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
     if (i >= 0) {
         return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
     }
@@ -1428,7 +1471,7 @@ static bool fold_mul(OptContext *ctx, TCGOp *op)
 
 static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_i(ctx, op, 0)) {
         return true;
     }
@@ -1437,6 +1480,8 @@ static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 {
+    swap_commutative(op->args[0], &op->args[2], &op->args[3]);
+
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
         uint64_t a = arg_info(op->args[2])->val;
         uint64_t b = arg_info(op->args[3])->val;
@@ -1480,7 +1525,7 @@ static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1509,7 +1554,7 @@ static bool fold_neg(OptContext *ctx, TCGOp *op)
 
 static bool fold_nor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1529,7 +1574,7 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
@@ -1581,8 +1626,13 @@ static bool fold_remainder(OptContext *ctx, TCGOp *op)
 static bool fold_setcond(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[3];
-    int i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
+    int i;
 
+    if (swap_commutative(op->args[0], &op->args[1], &op->args[2])) {
+        op->args[3] = cond = tcg_swap_cond(cond);
+    }
+
+    i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
     if (i >= 0) {
         return tcg_opt_gen_movi(ctx, op, op->args[0], i);
     }
@@ -1594,9 +1644,13 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
 static bool fold_setcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[5];
-    int i = do_constant_folding_cond2(&op->args[1], &op->args[3], cond);
-    int inv = 0;
+    int i, inv = 0;
 
+    if (swap_commutative2(&op->args[1], &op->args[3])) {
+        op->args[5] = cond = tcg_swap_cond(cond);
+    }
+
+    i = do_constant_folding_cond2(&op->args[1], &op->args[3], cond);
     if (i >= 0) {
         goto do_setcond_const;
     }
@@ -1774,7 +1828,7 @@ static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
 
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xi_to_not(ctx, op, -1)) {
@@ -1827,63 +1881,6 @@ void tcg_optimize(TCGContext *s)
             ctx.type = TCG_TYPE_I32;
         }
 
-        /* For commutative operations make constant second argument */
-        switch (opc) {
-        CASE_OP_32_64_VEC(add):
-        CASE_OP_32_64_VEC(mul):
-        CASE_OP_32_64_VEC(and):
-        CASE_OP_32_64_VEC(or):
-        CASE_OP_32_64_VEC(xor):
-        CASE_OP_32_64(eqv):
-        CASE_OP_32_64(nand):
-        CASE_OP_32_64(nor):
-        CASE_OP_32_64(muluh):
-        CASE_OP_32_64(mulsh):
-            swap_commutative(op->args[0], &op->args[1], &op->args[2]);
-            break;
-        CASE_OP_32_64(brcond):
-            if (swap_commutative(-1, &op->args[0], &op->args[1])) {
-                op->args[2] = tcg_swap_cond(op->args[2]);
-            }
-            break;
-        CASE_OP_32_64(setcond):
-            if (swap_commutative(op->args[0], &op->args[1], &op->args[2])) {
-                op->args[3] = tcg_swap_cond(op->args[3]);
-            }
-            break;
-        CASE_OP_32_64(movcond):
-            if (swap_commutative(-1, &op->args[1], &op->args[2])) {
-                op->args[5] = tcg_swap_cond(op->args[5]);
-            }
-            /* For movcond, we canonicalize the "false" input reg to match
-               the destination reg so that the tcg backend can implement
-               a "move if true" operation.  */
-            if (swap_commutative(op->args[0], &op->args[4], &op->args[3])) {
-                op->args[5] = tcg_invert_cond(op->args[5]);
-            }
-            break;
-        CASE_OP_32_64(add2):
-            swap_commutative(op->args[0], &op->args[2], &op->args[4]);
-            swap_commutative(op->args[1], &op->args[3], &op->args[5]);
-            break;
-        CASE_OP_32_64(mulu2):
-        CASE_OP_32_64(muls2):
-            swap_commutative(op->args[0], &op->args[2], &op->args[3]);
-            break;
-        case INDEX_op_brcond2_i32:
-            if (swap_commutative2(&op->args[0], &op->args[2])) {
-                op->args[4] = tcg_swap_cond(op->args[4]);
-            }
-            break;
-        case INDEX_op_setcond2_i32:
-            if (swap_commutative2(&op->args[1], &op->args[3])) {
-                op->args[5] = tcg_swap_cond(op->args[5]);
-            }
-            break;
-        default:
-            break;
-        }
-
         /* Assume all bits affected, and no bits known zero. */
         ctx.a_mask = -1;
         ctx.z_mask = -1;
-- 
2.25.1


