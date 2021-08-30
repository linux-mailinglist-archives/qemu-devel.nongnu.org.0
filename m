Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681A3FB14F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:40:52 +0200 (CEST)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKayR-00077E-AN
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajN-0004R8-PI
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:17 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajM-0007fb-3W
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:17 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so13130167pjb.0
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V5PmVAb4ivNsNvtoYskUNMax5pc+QK3d8WJflZpnrPk=;
 b=UTumljSf/DMDa882lVPMn3h9V1yrYgN2rLFopHJ3ZIAjrlyy0OUT6vzck3agsNCKn5
 yeYaP3E4K1HG9MXWedJuDk8LuojI1BEtAfGPFJYjCh60MYUGQkBlJykKd5tjM9cuq4V2
 fcRR67o0pHaM5ctqZ1GK1EMPyI+3Rr3bxSD8suydN5Y9RSEt6sb94T0vGSQpRFJxx9KL
 ts5U98zObrn9Zrn4bV9Snuz8m6o9Y7Y1GwonwVVCwU5BpZ/d6uE0vUJgx9ykbqHszS1j
 k+FK4NLrXBHeKAPCp0gMGo6ShYlwvt4R3nQ+X7kheH9aEiJd64tUC6Nn5wf4u8htG5z0
 U2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V5PmVAb4ivNsNvtoYskUNMax5pc+QK3d8WJflZpnrPk=;
 b=qAsHm95Jhcr0Siv/pilWcwwQcXurqd9p4ylTw/+mnrof/z82s6FciXeaNlIHl9ks6y
 gSXiUG3i0Kg68xFyeQjkPQKH7DWzjFcn11zZHtK5iGvR4mn6ib7X5vCPcHR+f1Hu++1Y
 p50T+eaHXKWxJOVzLH+vlpJKIrJ2j/Zbepx2vjyikPmKwAUYxO5wTRuqEw+UtVCPLrtx
 vlDeAuHJ4Fn2ezDvr/2a6XqUBcDIFJeyEjqABt6T0+MIBbXxdUxStdOvjLBPA4lH9z/p
 9w1YBr5TzYhckap82OWhb5h8IznzzO7zW+AHndQlJztJW7RlpOHhB/xq+eaonrbg79UV
 o7oQ==
X-Gm-Message-State: AOAM530PacnGTJ7Vv36QR0lUBD99SSWwc6bQHMW07It3C/3LrIQY03uk
 pPBScPUOv1VyO8+LsCyGEypG++yZ+hXvRg==
X-Google-Smtp-Source: ABdhPJz1Y7GlmZDeIdaKF7L36PFpWOicDYbtHP0mlltO1EpwY+UODRD+BkmPBO+XbCQ0F4udGh1Weg==
X-Received: by 2002:a17:90a:da02:: with SMTP id
 e2mr38644219pjv.89.1630304714679; 
 Sun, 29 Aug 2021 23:25:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/48] tcg/optimize: Split out fold_to_not
Date: Sun, 29 Aug 2021 23:24:37 -0700
Message-Id: <20210830062451.639572-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
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

Split out the conditional conversion from a more complex logical
operation to a simple NOT.  Create a couple more helpers to make
this easy for the outer-most logical operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 154 +++++++++++++++++++++++++++----------------------
 1 file changed, 86 insertions(+), 68 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f08afdcb52..aba65fdbd3 100644
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
@@ -984,7 +1040,11 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 
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
@@ -1114,7 +1174,11 @@ static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
 
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
@@ -1124,12 +1188,22 @@ static bool fold_neg(OptContext *ctx, TCGOp *op)
 
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
@@ -1143,7 +1217,11 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 
 static bool fold_orc(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_not(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_qemu_ld(OptContext *ctx, TCGOp *op)
@@ -1274,7 +1352,8 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xx_to_i(ctx, op, 0)) {
+        fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
     return false;
@@ -1428,67 +1507,6 @@ void tcg_optimize(TCGContext *s)
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
-                default:
-                    not_op = INDEX_op_not_vec;
-                    have_not = TCG_TARGET_HAS_not_vec;
-                    break;
-                case TCG_TYPE_I64:
-                    not_op = INDEX_op_not_i64;
-                    have_not = TCG_TARGET_HAS_not_i64;
-                    break;
-                case TCG_TYPE_I32:
-                    not_op = INDEX_op_not_i32;
-                    have_not = TCG_TARGET_HAS_not_i32;
-                    break;
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


