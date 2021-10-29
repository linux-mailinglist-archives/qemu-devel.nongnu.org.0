Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1538E43F67F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:21:29 +0200 (CEST)
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKKW-00035J-4I
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJan-00057m-DU
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:13 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaf-00081G-36
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:12 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso6511837pjb.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+4GM6rwelmTJwNvr/gYfS2ZPgfNCRXjAydc4wwegxg=;
 b=zuqHsTas9ToJEWqFjnfLTru4YY5c/qsdHZcKYRkwgJ6ZIDPwXgPIR/YWFdte7fqWhM
 Ybibn3+/sRDFeFMDX5QVedsAY+jGFOdcSAgyZ9V1mKtZ1/jQnznnhXVO9Jte/6DX+krp
 uv+LujbCbbSDURXyp4mHrur9p0H42/TgI8VJxD0gJyoNlIypVOB4vTXdXYb8iPXzZN1v
 sfPadLc0Xu+Hvknk29DeIuyCctnSxWFNcgkOBidJRzUCPfFZf7JpmWgEO5iBxtx3ZaPa
 gR/SQrbw7uucMXyQ6bEiXNJ6FC/2kTrtHCgZj/wfQD4XtpDEot2CTTSNudYXVA76kT0b
 cNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+4GM6rwelmTJwNvr/gYfS2ZPgfNCRXjAydc4wwegxg=;
 b=auY5jptJNY6/yOR3r1UNd6JiLq/966vmAt3QrAlcWxBkYCgerdqPzuaT73i69h4ZG9
 KA/38c82/lnuqC2YGqCuTsF0aUnYaSUFs1ZyZ3LK15ZiUSaKXfZrwpriawdzAX2JSwSH
 1pqadAzMXFa+gAu83rvEEMxMWmBV9L+TarbECKdg+NTogZNHZCoA0GMiAmmiaqU7zKFa
 wARs+JdLDD3mIf98Gh+MrJp0u0De0bQG/1C/oicfhNHB6fyufj82OORptnejm4Y58Yg6
 GeDyBxsKhZ09BAyNHN6xRtSgqwpxntBmW8FA5DBBjfSFrJAtTf35/XMMt8si1RxVoxdK
 E5JQ==
X-Gm-Message-State: AOAM533QgxdFU8+bJJ5YBVkgV0+3XhKodr3fr8YSXGPyzgH+4kAyvGUN
 6Y9BV9+vb4whuRz8c7BIHQKn4U+v5+7PMQ==
X-Google-Smtp-Source: ABdhPJzTaLNTI8fSz9wTbAv/zYPfZrKrMk1ihPkn1p4acCuL/EWQPOKh0GZCXQ7mv0vXVxJlM7E2WA==
X-Received: by 2002:a17:90b:1d8e:: with SMTP id
 pf14mr8923372pjb.125.1635482042859; 
 Thu, 28 Oct 2021 21:34:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:34:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 39/60] tcg/optimize: Split out fold_to_not
Date: Thu, 28 Oct 2021 21:33:08 -0700
Message-Id: <20211029043329.1518029-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


