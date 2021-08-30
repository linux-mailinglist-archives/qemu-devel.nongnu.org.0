Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE7B3FB198
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:06:49 +0200 (CEST)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbNY-0007uj-E7
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamO-0003Bf-4B
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:24 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamL-0001nh-72
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:23 -0400
Received: by mail-pl1-x629.google.com with SMTP id j2so7953506pll.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cPB1vFuAJW/mlwNBh5B1GVBi2EgabM0ZzuDf5t+EDY4=;
 b=jxN/sQ3ix3WGPWIfUeoQZusk/63OE589dgHEjyVLCMUXvufGktrX2wHaHxUY6oGpkZ
 avNZFxmDatbHf9HlI7HFltEtnaRQcJ3ujDn7XFlCyyNwHQIqkdWyJbS3zlHNMS3jpktY
 3KEqXr4wU/U1kwWcCSpUMUXILF8G1xuPG9DBc8+HiqixSD+qDP/ShW/ojdnE+RLuKVMF
 YK4kM8EvxihwC9Wg/EQCcdrSHZ0uqIfkZ6eIZXpuysLb36QP8lTBccLN6c3JWd4HsEfy
 /JBCN+/E89NcjvBH6aH5l/3dY4egCyC+94CVU6wdBEBnRKadcJ2mMfMXNsBBpa1oJv15
 syaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cPB1vFuAJW/mlwNBh5B1GVBi2EgabM0ZzuDf5t+EDY4=;
 b=rY/aCN7/YyDXLCrXQea/hMiPmC8vShuxRsdeADTvX40CUIU4NT8Aj5EA428y1CmCHV
 YVrM9obM/MOMABiBMzsaJx32aItxUZcFSH2G23GkkNNwKHU0FXMtaMht3M8iZC/+anws
 xWlu/2yHuytDv2i2xBBogY6zKfZlSaFxUdGFk5Hc9puWnQgnKKfGhpMq6PXUXcn5gptk
 dPHbEsmtBtgE4X25AbyrpLtjPq6Isk5XtcsjRzi2Y1kjWBhwStK0vLi7rM3dFiZv/eCQ
 XJEYRtIlXHgo9YstQaPdBOmfJbGMEiQToQ1AfwSIFWPWQDG4L/SebgM4fk/1c2g0efms
 s/+Q==
X-Gm-Message-State: AOAM531rztNCn6IpL0glYEQD7TxEdcUFePsV3o6a9JX7x4+FASafymeA
 JYmr8mKfgzNEhaaQrWVpFtdBZL8cD1bs1A==
X-Google-Smtp-Source: ABdhPJxJ2/9RiocuHooo58Fh1sEQh+PMoHANT7I1G75duwGP4jv/RYL4DIh84npbbpd60l6Cl5loyQ==
X-Received: by 2002:a17:90a:8042:: with SMTP id
 e2mr25267889pjw.47.1630304899753; 
 Sun, 29 Aug 2021 23:28:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o6sm13337072pjk.4.2021.08.29.23.28.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:28:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 41/48] tcg/optimize: Sink commutative operand swapping into
 fold functions
Date: Sun, 29 Aug 2021 23:24:44 -0700
Message-Id: <20210830062451.639572-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
index ba1e5631c3..a66ac77c29 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -695,6 +695,12 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
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
@@ -831,7 +837,7 @@ static bool fold_xx_to_x(OptContext *ctx, TCGOp *op)
 
 static bool fold_add(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
@@ -890,6 +896,9 @@ static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
 
 static bool fold_add2(OptContext *ctx, TCGOp *op)
 {
+    swap_commutative(op->args[0], &op->args[2], &op->args[4]);
+    swap_commutative(op->args[1], &op->args[3], &op->args[5]);
+
     return fold_addsub2(ctx, op, true);
 }
 
@@ -897,7 +906,7 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     uint64_t z1, z2;
 
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_xx_to_x(ctx, op)) {
@@ -949,8 +958,13 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
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
@@ -965,10 +979,14 @@ static bool fold_brcond(OptContext *ctx, TCGOp *op)
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
     if (i == 0) {
         goto do_brcond_false;
     } else if (i > 0) {
@@ -1215,7 +1233,7 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
@@ -1378,8 +1396,20 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 {
     TCGOpcode opc = op->opc;
     TCGCond cond = op->args[5];
-    int i = do_constant_folding_cond(opc, op->args[1], op->args[2], cond);
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
+    i = do_constant_folding_cond(opc, op->args[1], op->args[2], cond);
     if (i >= 0) {
         return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
     }
@@ -1407,7 +1437,7 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_i(ctx, op, 0)) {
         return true;
     }
@@ -1416,6 +1446,8 @@ static bool fold_multiply(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 {
+    swap_commutative(op->args[0], &op->args[2], &op->args[3]);
+
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
         uint64_t a = arg_info(op->args[2])->val;
         uint64_t b = arg_info(op->args[3])->val;
@@ -1459,7 +1491,7 @@ static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1488,7 +1520,7 @@ static bool fold_neg(OptContext *ctx, TCGOp *op)
 
 static bool fold_nor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1508,7 +1540,7 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
@@ -1554,8 +1586,13 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
 static bool fold_setcond(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[3];
-    int i = do_constant_folding_cond(op->opc, op->args[1], op->args[2], cond);
+    int i;
 
+    if (swap_commutative(op->args[0], &op->args[1], &op->args[2])) {
+        op->args[3] = cond = tcg_swap_cond(cond);
+    }
+
+    i = do_constant_folding_cond(op->opc, op->args[1], op->args[2], cond);
     if (i >= 0) {
         return tcg_opt_gen_movi(ctx, op, op->args[0], i);
     }
@@ -1567,9 +1604,13 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
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
@@ -1747,7 +1788,7 @@ static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
 
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xi_to_not(ctx, op, -1)) {
@@ -1800,63 +1841,6 @@ void tcg_optimize(TCGContext *s)
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


