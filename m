Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931F9436CC9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:35:09 +0200 (CEST)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfiO-0000Wl-LU
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGO-0007iJ-3w
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:13 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGI-0004hP-TX
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:11 -0400
Received: by mail-pl1-x62b.google.com with SMTP id w17so1275238plg.9
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dYYrowEkqEGLUnh2iKqTl1sGK/D7KVa6nZltIKw454w=;
 b=SfM+bxHLqgh2neuUEN5l6x22ZwsJxnqzo4lGaFcIavHWFeTBmaHQvPeXB19Np/pfEB
 PLKD6roQr+WlW1hbD+AipAsE734ypl22cQhLUn/MhB8fxeGt4WSnSBZN+aplHlwU62A/
 mFMGetrJwhfDgHocPj9aFc/V/iMJBy4KtNNlQhoJRjg5Q3uZ0+z+sM2gZ2Ic0EY6nurC
 FaNt9pUz801UjiR3gip05J2+JDqv5F7fi7UVLl0xirPs0Bjc4gaDaBWF/481tt6oGYHX
 7XAKnHXQwvvk9hYjgahoYi5qcyt3ce9972ed9vJlrcu1ILOAem7qrHHqM36PEpVgfdXD
 EsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dYYrowEkqEGLUnh2iKqTl1sGK/D7KVa6nZltIKw454w=;
 b=i+qRYBGrMe986zchihiIJbxLMCpzr3WyEFL5JBM+khc7j8EezbmvyJLXr7DO6v0BmQ
 geLEQjFS1AJiqFEJ860ob+jpam+SzwbCIULzxIjYPkrGYtCaQKoUJnrE2pX3DGE+tE/q
 gc5Yn6Corjo266T4ZFWmFH0OQTOhkrurliTv0s+p+fPt6qlkHpi4aivWz90LmqJgfY+7
 cVmAvqKIoR/cdF8WBA3vN3Oh3+vn/RHu6j64N/MZ6GWMQxEnB8aDVFIf42kZF7p6GOfT
 cJLPw1G13uLA/8dgihushQAvTj488v6LzpvQaz5AEF3lV6hkeJWfGwdy9uHLGghRa7vj
 UPeg==
X-Gm-Message-State: AOAM531nvZcNG/oCyGtplw31i3l39aL26qH5mtL4d7NgVdcDYYmxOuus
 ivQZ3xOEsg3WigLPY9XLpxpO2kvzi1o=
X-Google-Smtp-Source: ABdhPJwkQd/1FgXrGJ4UVYeevCN/EKkRX5m6OahHIyZnzqduEZm+Iqex+XiNorn66gmPtO+grwpSbQ==
X-Received: by 2002:a17:90b:4a8b:: with SMTP id
 lp11mr9807828pjb.46.1634850365712; 
 Thu, 21 Oct 2021 14:06:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/48] tcg/optimize: Split out fold_to_not
Date: Thu, 21 Oct 2021 14:05:25 -0700
Message-Id: <20211021210539.825582-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Split out the conditional conversion from a more complex logical
operation to a simple NOT.  Create a couple more helpers to make
this easy for the outer-most logical operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 154 +++++++++++++++++++++++++++----------------------
 1 file changed, 86 insertions(+), 68 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c8b6afc745..71b4c3edb4 100644
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
@@ -982,7 +1038,11 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 
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
@@ -1120,7 +1180,11 @@ static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
 
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
@@ -1130,12 +1194,22 @@ static bool fold_neg(OptContext *ctx, TCGOp *op)
 
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
@@ -1149,7 +1223,11 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 
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
@@ -1280,7 +1358,8 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xx_to_i(ctx, op, 0)) {
+        fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
     return false;
@@ -1434,67 +1513,6 @@ void tcg_optimize(TCGContext *s)
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


