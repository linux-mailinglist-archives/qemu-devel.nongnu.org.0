Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192143D9B6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:13:53 +0200 (CEST)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvrU-00062B-EN
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPf-0001Y0-E9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:07 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPc-0006CT-TN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:07 -0400
Received: by mail-pg1-x531.google.com with SMTP id q187so4972880pgq.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kKgmC2gHMMUvFs/AnAI16cdc8E9nMTcv1IhY3bF9FCU=;
 b=IhYeIiK+uYh6C5zBJixhKWb/4IakqvfhZU/PiZKz5yMDbaR8f5SVPpU3/uoFxQemdN
 78EXIfhJW3q+McjQHoaQwfpd2ZU3KneSWd1OPkqcy/BJC/Re6HGUmQXoXbqeT3XSCUjj
 l7wJbvaKde7+yFoIxzb1FgRWxM6IlzzDUfqn34fWOeOPuinFpI+9jWcW1qtHsXRCmsc3
 tBjlHIQOIMVyF0a1clGQ0c1H+rj1/T1TwA1LKMISwxA8YiwlpLo+ryUfRGT5b5DhwnlR
 djpMtbX98HX+Bf+V1uqA/hb3Kkbu+R+hadsjVtns/X9pqzKcVumUPLTPHXRt9E1BK62w
 Z14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kKgmC2gHMMUvFs/AnAI16cdc8E9nMTcv1IhY3bF9FCU=;
 b=kr5wabrefz5330+YOMtOOaKfSFFasCe3qNCkwWnE3ADpSYSuHAxMi3QhSJ5xrThuJt
 5Bkm/cvHBSm3VD6LjTyodDWeUo+aXgn1oT7hY+72zLKwCFT4+l1aJEU7tz+dw0QUARSY
 /yqI+uHSBc2SqWCCRgiCHNtQ5fJJRZZ9oY6QoRvP+VcK8FvCRk0w6fsD9LiGGECnx4sc
 u/Fymj3WKfpnv3/WdcZ2uRqXAFG9g0yDizbxQB8Lhch4KBH4StoGq3GDC9W/5nwaEf6s
 v5f71nn87TZly1MI+crrss+JXYj5i32c6nZOnw6j/govqUKFtgA+975JugmePoJO/89T
 WdDA==
X-Gm-Message-State: AOAM532jPYRRjhoBDLEEwgyvZKXqpqPxw2yT0w0+4hQe5BFL24KUGtAl
 qsqBCiy4R9TgMBGch6rtZWPw+3CjIfrMkQ==
X-Google-Smtp-Source: ABdhPJx3TRGw9m3lUcQ3rb9cLWO8INdBLy6KREgirpeiDgnHcOdPxu4tXxEYF43pdlPpbMtTR47ALA==
X-Received: by 2002:a63:1415:: with SMTP id u21mr1177438pgl.165.1635389103266; 
 Wed, 27 Oct 2021 19:45:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/56] tcg/optimize: Sink commutative operand swapping into
 fold functions
Date: Wed, 27 Oct 2021 19:41:21 -0700
Message-Id: <20211028024131.1492790-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Most of these are handled by creating a fold_const2_commutative
to handle all of the binary operators.  The rest were already
handled on a case-by-case basis in the switch, and have their
own fold function in which to place the call.

We now have only one major switch on TCGOpcode.

Introduce NO_DEST and a block comment for swap_commutative in
order to make the handling of brcond and movcond opcodes cleaner.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 142 ++++++++++++++++++++++++-------------------------
 1 file changed, 70 insertions(+), 72 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f723deaafe..e42f5a145f 100644
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
@@ -891,6 +910,10 @@ static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
 
 static bool fold_add2(OptContext *ctx, TCGOp *op)
 {
+    /* Note that the high and low parts may be independently swapped. */
+    swap_commutative(op->args[0], &op->args[2], &op->args[4]);
+    swap_commutative(op->args[1], &op->args[3], &op->args[5]);
+
     return fold_addsub2(ctx, op, true);
 }
 
@@ -898,7 +921,7 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     uint64_t z1, z2;
 
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_xx_to_x(ctx, op)) {
@@ -950,8 +973,13 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
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
@@ -966,10 +994,14 @@ static bool fold_brcond(OptContext *ctx, TCGOp *op)
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
@@ -1219,7 +1251,7 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
@@ -1381,8 +1413,20 @@ static bool fold_mov(OptContext *ctx, TCGOp *op)
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
@@ -1428,7 +1472,7 @@ static bool fold_mul(OptContext *ctx, TCGOp *op)
 
 static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_i(ctx, op, 0)) {
         return true;
     }
@@ -1437,6 +1481,8 @@ static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 {
+    swap_commutative(op->args[0], &op->args[2], &op->args[3]);
+
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
         uint64_t a = arg_info(op->args[2])->val;
         uint64_t b = arg_info(op->args[3])->val;
@@ -1480,7 +1526,7 @@ static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1509,7 +1555,7 @@ static bool fold_neg(OptContext *ctx, TCGOp *op)
 
 static bool fold_nor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1529,7 +1575,7 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
@@ -1581,8 +1627,13 @@ static bool fold_remainder(OptContext *ctx, TCGOp *op)
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
@@ -1594,9 +1645,13 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
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
@@ -1774,7 +1829,7 @@ static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
 
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xi_to_not(ctx, op, -1)) {
@@ -1827,63 +1882,6 @@ void tcg_optimize(TCGContext *s)
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


