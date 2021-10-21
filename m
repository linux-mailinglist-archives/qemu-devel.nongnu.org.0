Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B65436D10
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:48:29 +0200 (CEST)
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfvI-0004gP-GK
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJN-0003vv-An
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:17 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJJ-0008Vs-Ao
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:16 -0400
Received: by mail-pf1-x433.google.com with SMTP id m26so1774621pff.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hLET9P+4Q8tOpGhlnq30E50IovzdBUmNq96PBkRmeZA=;
 b=Ky+kErUKaLqOwT1sdKwrB7MpyWYV1zOKM95lh/COywgVj6pkW1x54+RKoycQmtIJGf
 4C33eh9dqUdFgVzTrQJs0MI+B5vSeHVTxyMqI41faEI2vbU+W1vT8xMkOMdAOUiPocaO
 yZBIPPa0OpgTKqvGS5+NSoGKdTxYHHAiGn7bbsJdhvjYH1xO7yGXxZlcfamRB2pAXpKq
 vgQ5h+yRhu6+5932sSst+qzPmVrSBNEIJJx3zIFTFSUgQhrWPZ8Xl+DkrVYRUJYZjMD2
 oWZrc3TiNIz0bXgdL6fz3NXZlQ54xLySCucPQhKyscRwZJ+Me95pYfCuUDu8+1vYJmDS
 MEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hLET9P+4Q8tOpGhlnq30E50IovzdBUmNq96PBkRmeZA=;
 b=E+0ID8R7VlxZkca7ZHsdVCx3okjA5qAcPcKc0TK7dpsg+8lQ4fxGeUpeMftEgRtduU
 OPAwnQkSQsgqDosxazlQnzU4d3g5nHCBdTYczbB+KKuUm5OUPqLJfnwOSNfyVdDRbSRw
 ub70UGmWhHqzgYIBrYEwOOpA+rnJISajNLrd27Id6JgKi+oWrdU1dL7fUWt2o0JOHa1e
 0MyKS3jE7DZ3ro2fT1rJdpKULPsfp9rWkN1A2H8rVoGhRCxx0zixeAi6Ont+S/R73qiy
 SRteH0sKz9gZLqkn/g8gPI9nRxPegYo8PJZmonesdQNX7aK7HAGmn6zLg16ixKMQ7h3W
 sgDw==
X-Gm-Message-State: AOAM531zt29G/JLZvOX7yJBBf/JVMKHc4tIjG3E8SJqaUc981AQ/nxhf
 lLDbnwtO7P0EDULtjuXqXH7S4nn+r6Stuw==
X-Google-Smtp-Source: ABdhPJyKSFn2JUcRx1EUw1ARHpxl9H7fTda1RceXjwE9wOJnTu+ZsoMN8qqJON5es/W1yqlkdAr2qg==
X-Received: by 2002:aa7:8243:0:b0:44e:599:bfe8 with SMTP id
 e3-20020aa78243000000b0044e0599bfe8mr8080790pfn.36.1634850552005; 
 Thu, 21 Oct 2021 14:09:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i5sm6258856pgo.36.2021.10.21.14.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:09:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 41/48] tcg/optimize: Sink commutative operand swapping into
 fold functions
Date: Thu, 21 Oct 2021 14:05:32 -0700
Message-Id: <20211021210539.825582-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of these are handled by creating a fold_const2_commutative
to handle all of the binary operators.  The rest were already
handled on a case-by-case basis in the switch, and have their
own fold function in which to place the call.

We now have only one major switch on TCGOpcode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 128 ++++++++++++++++++++++---------------------------
 1 file changed, 56 insertions(+), 72 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index ba068e7d3e..92b35a8c3f 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -696,6 +696,12 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
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
@@ -832,7 +838,7 @@ static bool fold_xx_to_x(OptContext *ctx, TCGOp *op)
 
 static bool fold_add(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
@@ -891,6 +897,9 @@ static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
 
 static bool fold_add2(OptContext *ctx, TCGOp *op)
 {
+    swap_commutative(op->args[0], &op->args[2], &op->args[4]);
+    swap_commutative(op->args[1], &op->args[3], &op->args[5]);
+
     return fold_addsub2(ctx, op, true);
 }
 
@@ -898,7 +907,7 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     uint64_t z1, z2;
 
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_xx_to_x(ctx, op)) {
@@ -950,8 +959,13 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
 static bool fold_brcond(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[2];
-    int i = do_constant_folding_cond(ctx->type, op->args[0], op->args[1], cond);
+    int i;
 
+    if (swap_commutative(-1, &op->args[0], &op->args[1])) {
+        op->args[2] = cond = tcg_swap_cond(cond);
+    }
+
+    i = do_constant_folding_cond(ctx->type, op->args[0], op->args[1], cond);
     if (i == 0) {
         tcg_op_remove(ctx->tcg, op);
         return true;
@@ -966,10 +980,14 @@ static bool fold_brcond(OptContext *ctx, TCGOp *op)
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
@@ -1214,7 +1232,7 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
@@ -1376,8 +1394,20 @@ static bool fold_mov(OptContext *ctx, TCGOp *op)
 static bool fold_movcond(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[5];
-    int i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
+    int i;
 
+    if (swap_commutative(-1, &op->args[1], &op->args[2])) {
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
@@ -1414,7 +1444,7 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_i(ctx, op, 0)) {
         return true;
     }
@@ -1423,6 +1453,8 @@ static bool fold_multiply(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 {
+    swap_commutative(op->args[0], &op->args[2], &op->args[3]);
+
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
         uint64_t a = arg_info(op->args[2])->val;
         uint64_t b = arg_info(op->args[3])->val;
@@ -1466,7 +1498,7 @@ static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1495,7 +1527,7 @@ static bool fold_neg(OptContext *ctx, TCGOp *op)
 
 static bool fold_nor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1515,7 +1547,7 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
@@ -1561,8 +1593,13 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
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
@@ -1574,9 +1611,13 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
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
@@ -1754,7 +1795,7 @@ static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
 
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xi_to_not(ctx, op, -1)) {
@@ -1807,63 +1848,6 @@ void tcg_optimize(TCGContext *s)
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


