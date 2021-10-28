Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720443D9B5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:13:46 +0200 (CEST)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvrN-0005h7-JB
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMh-0004uO-HY
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMe-0003vH-Vt
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id w16so3391602plg.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+4GM6rwelmTJwNvr/gYfS2ZPgfNCRXjAydc4wwegxg=;
 b=IND0lbejwPOs3G6dJIDtxhSfc6ZHDB0wNOseVsKqypfbvvONkqax3I48kfIgsG787V
 S88q2pG64Zexu2do52WrxRhAIEucZ8c2vEnMHkkayr0rjqtyxX+Zc73/vC4AeNTzFUhn
 rSj/ElY+XGaM56XkCZFc78RClWXAJ/Ek3OG0Z5LvSOlKm9BW9BabB3Bhdeq4qc2+WDRk
 KTO3SDi54hf3xqeqME/F2okC0Tziv2ecjq9249XuuGN42J53uARkyFDR6AFYsHH/uQnx
 4phkSoKX66sq3dXHGBei1iJ2tZ75MHEOTxKoTfc/MWnT4oeCRiIkMQ9r0M8CLH+BbDHG
 jFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+4GM6rwelmTJwNvr/gYfS2ZPgfNCRXjAydc4wwegxg=;
 b=evFSh2rkkVoGSfyK/J4ZjpjphYtCoHiNWGxmkDnIHzLLj4rVvL/mrDnxG6yRy5qBPs
 gFB7euPJktMWbauPsjU+6i/SbJj7fyJk1VA5FZXrp0ICP0554835SSaIfQFP2AYZ+HnR
 OycZGCoTtCO++Od49b5UyVTwMwEj7joPGdDyCYZkFslG0TbkfXQGc+7W2eYMDOFn63Zp
 zbbyEX+N6gqnZvK27yqcb+BUax6N2NstFT9TmCq3YRsljA2dh8WJVj/XL4CD+8FRkelr
 1/VORRdzj4m4sqxWmhaD1n0LSvM2fH0uQRqJtUe9Ng8KNVu93zpvY91WWgZpoPlgStbl
 p61Q==
X-Gm-Message-State: AOAM533G1fptcXsTaDW3IP+Y/RK2qUT7zSKcUy5tJJNb9djb06zaEpT+
 lONXsf1SVCDVhBASp28IfrJM9iE4yKGsjA==
X-Google-Smtp-Source: ABdhPJw3Adw0lcIUvrePezCsPZTgadAbXrgfOKkFPrqn+PXJ/FlZ41kA9LVJFGLouiXzcT1e5emXbw==
X-Received: by 2002:a17:90a:4b0a:: with SMTP id
 g10mr9733771pjh.91.1635388918328; 
 Wed, 27 Oct 2021 19:41:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/56] tcg/optimize: Split out fold_to_not
Date: Wed, 27 Oct 2021 19:41:14 -0700
Message-Id: <20211028024131.1492790-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Split out the conditional conversion from a more complex logical
operation to a simple NOT.  Create a couple more helpers to make
this easy for the outer-most logical operations.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 158 +++++++++++++++++++++++++++----------------------
 1 file changed, 86 insertions(+), 72 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e869fa7e78..21f4251b4f 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -694,6 +694,52 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+/*
+ * Convert @op to NOT, if NOT is supported by the host.
+ * Return true f the conversion is successful, which will still
+ * indicate that the processing is complete.
+ */
+static bool fold_not(OptContext *ctx, TCGOp *op);
+static bool fold_to_not(OptContext *ctx, TCGOp *op, int idx)
+{
+    TCGOpcode not_op;
+    bool have_not;
+
+    switch (ctx->type) {
+    case TCG_TYPE_I32:
+        not_op = INDEX_op_not_i32;
+        have_not = TCG_TARGET_HAS_not_i32;
+        break;
+    case TCG_TYPE_I64:
+        not_op = INDEX_op_not_i64;
+        have_not = TCG_TARGET_HAS_not_i64;
+        break;
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+    case TCG_TYPE_V256:
+        not_op = INDEX_op_not_vec;
+        have_not = TCG_TARGET_HAS_not_vec;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (have_not) {
+        op->opc = not_op;
+        op->args[1] = op->args[idx];
+        return fold_not(ctx, op);
+    }
+    return false;
+}
+
+/* If the binary operation has first argument @i, fold to NOT. */
+static bool fold_ix_to_not(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[1]) && arg_info(op->args[1])->val == i) {
+        return fold_to_not(ctx, op, 2);
+    }
+    return false;
+}
+
 /* If the binary operation has second argument @i, fold to @i. */
 static bool fold_xi_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -703,6 +749,15 @@ static bool fold_xi_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
     return false;
 }
 
+/* If the binary operation has second argument @i, fold to NOT. */
+static bool fold_xi_to_not(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[2]) && arg_info(op->args[2])->val == i) {
+        return fold_to_not(ctx, op, 1);
+    }
+    return false;
+}
+
 /* If the binary operation has both arguments equal, fold to @i. */
 static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -781,7 +836,8 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 static bool fold_andc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xx_to_i(ctx, op, 0)) {
+        fold_xx_to_i(ctx, op, 0) ||
+        fold_ix_to_not(ctx, op, -1)) {
         return true;
     }
     return false;
@@ -987,7 +1043,11 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_not(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_extract(OptContext *ctx, TCGOp *op)
@@ -1134,7 +1194,11 @@ static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
 
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_not(ctx, op, -1)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_neg(OptContext *ctx, TCGOp *op)
@@ -1144,12 +1208,22 @@ static bool fold_neg(OptContext *ctx, TCGOp *op)
 
 static bool fold_nor(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_not(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_not(OptContext *ctx, TCGOp *op)
 {
-    return fold_const1(ctx, op);
+    if (fold_const1(ctx, op)) {
+        return true;
+    }
+
+    /* Because of fold_to_not, we want to always return true, via finish. */
+    finish_folding(ctx, op);
+    return true;
 }
 
 static bool fold_or(OptContext *ctx, TCGOp *op)
@@ -1163,7 +1237,11 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 
 static bool fold_orc(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_ix_to_not(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_qemu_ld(OptContext *ctx, TCGOp *op)
@@ -1299,7 +1377,8 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xx_to_i(ctx, op, 0)) {
+        fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
     return false;
@@ -1458,71 +1537,6 @@ void tcg_optimize(TCGContext *s)
                 }
             }
             break;
-        CASE_OP_32_64_VEC(xor):
-        CASE_OP_32_64(nand):
-            if (!arg_is_const(op->args[1])
-                && arg_is_const(op->args[2])
-                && arg_info(op->args[2])->val == -1) {
-                i = 1;
-                goto try_not;
-            }
-            break;
-        CASE_OP_32_64(nor):
-            if (!arg_is_const(op->args[1])
-                && arg_is_const(op->args[2])
-                && arg_info(op->args[2])->val == 0) {
-                i = 1;
-                goto try_not;
-            }
-            break;
-        CASE_OP_32_64_VEC(andc):
-            if (!arg_is_const(op->args[2])
-                && arg_is_const(op->args[1])
-                && arg_info(op->args[1])->val == -1) {
-                i = 2;
-                goto try_not;
-            }
-            break;
-        CASE_OP_32_64_VEC(orc):
-        CASE_OP_32_64(eqv):
-            if (!arg_is_const(op->args[2])
-                && arg_is_const(op->args[1])
-                && arg_info(op->args[1])->val == 0) {
-                i = 2;
-                goto try_not;
-            }
-            break;
-        try_not:
-            {
-                TCGOpcode not_op;
-                bool have_not;
-
-                switch (ctx.type) {
-                case TCG_TYPE_I32:
-                    not_op = INDEX_op_not_i32;
-                    have_not = TCG_TARGET_HAS_not_i32;
-                    break;
-                case TCG_TYPE_I64:
-                    not_op = INDEX_op_not_i64;
-                    have_not = TCG_TARGET_HAS_not_i64;
-                    break;
-                case TCG_TYPE_V64:
-                case TCG_TYPE_V128:
-                case TCG_TYPE_V256:
-                    not_op = INDEX_op_not_vec;
-                    have_not = TCG_TARGET_HAS_not_vec;
-                    break;
-                default:
-                    g_assert_not_reached();
-                }
-                if (!have_not) {
-                    break;
-                }
-                op->opc = not_op;
-                reset_temp(op->args[0]);
-                op->args[1] = op->args[i];
-                continue;
-            }
         default:
             break;
         }
-- 
2.25.1


