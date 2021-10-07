Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987D425DAB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:35:48 +0200 (CEST)
Received: from localhost ([::1]:38528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYa7H-0001C0-EW
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXE-0007Uy-FA
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:32 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXC-0003pI-G6
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:32 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so6012349pjb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aloxE+R5K21eCAZdRVlkgeHfD6/SrlIOxi9rYRP75eA=;
 b=NB8djSsAnrxlRwM1ZCoKk6GmgloT/EVIMQugHlDqpjDSUZ+cpZpz0ad6DLqOk+1aMb
 z3CwB2MPceHGi0YepdKyl9BI2aSnlTBxdhjPR4Ij4jKotUsALsTjPb8Kk2ysofs+vyaT
 S1j3vgoKHHLU+jkSviSIc34denvBx4gMzqIQWG8be4LnRzATbf4LAaaHPIw3XEsLE5iU
 J+4UNzT4Bgp1o7kRB8hhgbUbAGlG+MFYvrFEIrb8Jeddsc+GJw4NpuFSshlhueQLY3e1
 XD5SmZFYEkLJwLbmv8KfiLT9Do06kZ9aw81NM4ojbbPx6VWIpGO0JBnWwD/PHuoeQHIJ
 oIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aloxE+R5K21eCAZdRVlkgeHfD6/SrlIOxi9rYRP75eA=;
 b=GmmzxocCWg1gj//H6Qbr86mB/yuqU7GB0rf1YOZjXfJcaiQ/o9JhcQfdCbgDRCp0kD
 aqC+Ul2gXZ01+EMhHwuQL7qXYzWrQbZ10/cfoGPlkQNlBEPa80PKJyxo08TjrtfeKmhq
 +TjGQwn7N7mn0vYcYxjQJ4gSGh3BRzXa9FZYxLdgzAsLAqE0ZeXfc8qc3OqrT3PI4f5l
 HvFx+Pme3hxjH8Y1UIAPNPk6PkdMdJdE1j7iC2roCp0OWQme+oEZISk+3vjjOxmFkGUe
 DnjINl9Q04WOSduggyndob4ym5MKDFJm/mF9ICGM8dYTJTVGsPXEUwuUUamOOZm8P73/
 84KQ==
X-Gm-Message-State: AOAM533tKfFFcW+z+uSh2VjesjS0EKxkcx+DfTJnqRoHwbJT2f0Qzi/M
 FG7QKAC8rdixBbeCVDsjN5od4Ek7MfF9ZQ==
X-Google-Smtp-Source: ABdhPJyh1Ar3h7NnVm1KTOHYm6Y1pxEVHc/WAUSSqKEy4BHKX8vFLooaN7j5vuiIiWLAdQsSHp4eqA==
X-Received: by 2002:a17:902:a414:b0:13e:45cd:1939 with SMTP id
 p20-20020a170902a41400b0013e45cd1939mr5825039plq.54.1633636708789; 
 Thu, 07 Oct 2021 12:58:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm8995380pjf.1.2021.10.07.12.58.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:58:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 41/48] tcg/optimize: Sink commutative operand swapping into
 fold functions
Date: Thu,  7 Oct 2021 12:54:49 -0700
Message-Id: <20211007195456.1168070-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
index 5e662ad8f7..ad94f246ff 100644
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
@@ -1377,8 +1395,20 @@ static bool fold_mov(OptContext *ctx, TCGOp *op)
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
@@ -1415,7 +1445,7 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_i(ctx, op, 0)) {
         return true;
     }
@@ -1424,6 +1454,8 @@ static bool fold_multiply(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 {
+    swap_commutative(op->args[0], &op->args[2], &op->args[3]);
+
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
         uint64_t a = arg_info(op->args[2])->val;
         uint64_t b = arg_info(op->args[3])->val;
@@ -1467,7 +1499,7 @@ static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1496,7 +1528,7 @@ static bool fold_neg(OptContext *ctx, TCGOp *op)
 
 static bool fold_nor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1516,7 +1548,7 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
@@ -1562,8 +1594,13 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
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
@@ -1575,9 +1612,13 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
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
@@ -1755,7 +1796,7 @@ static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
 
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
+    if (fold_const2_commutative(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_xi_to_not(ctx, op, -1)) {
@@ -1808,63 +1849,6 @@ void tcg_optimize(TCGContext *s)
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


