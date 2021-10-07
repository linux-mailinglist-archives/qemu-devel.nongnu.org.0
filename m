Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3EB425D5E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:30:14 +0200 (CEST)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYa1t-00020m-1v
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUG-0000PE-Iv
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:29 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0007TL-B7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:27 -0400
Received: by mail-pj1-x1031.google.com with SMTP id np13so5713711pjb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GipdC9oOLsD+NYzRq3rz7fps15o9dIN62Mshbauq4As=;
 b=vpsNv/TriQy9aJvzTqTOBp3TWMJ/959HqFKvJMFDBZ2zN4sbcOBJBP8A4sq/GJSojv
 MY6HUmJPjT3FMHyz3bd3GeOo7udg6W+E7jnrWAEDblwX4ysPPhK+lBILvjjwzUXUcp5t
 EOYugrVwgDSv4jWzEjFlDjaa3mRpqsQ9hT3GRCxVxtC1wWXuHR+ZE9pJOCHGDkPcu+aD
 x/MY8JWQqGeieiaoqAXPgGeJ16Mf4BNWHWTlkA9ylxn6anXIrfGlJnKZ0/bWXaFRWUes
 VXKXVbZFzaBqzDb33+16nj7U+lT3vNbfW1EaAY7v7ol89o8hIzUpDOSS8MbezpOXGFnz
 SL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GipdC9oOLsD+NYzRq3rz7fps15o9dIN62Mshbauq4As=;
 b=HWUOibchLZojdcGNwWl/Yt5uORrZCWCXRH7xiPEg59hhZRl4EoKVp5kmUnPOP/xeYP
 V7v2uTH4pw0EMnCwy39uiNSiVqdLH843mi7ZjT82zz7/ZuL+MwCL9BHhUGPSXYdZdw+z
 oS4XxT+1h0ocShIXV5StQwp5wMdFS0jJhsmCegZY45Odu4DYCMK/3WNBTV7g7FS+EMOq
 xJb+A1agYyszz0pHkJBgqGEHS5uXKuc3msuFnWNXsG1H8Pra745BSywhQH5KYG8U56hs
 3dtEcBr0oxRYwBPOLZCW3k1SUl4ZBB+5sNQbayMAKOvPILBCIM6EkKJmD37DrWmlRzHV
 Wg2Q==
X-Gm-Message-State: AOAM532kO5LCgAh+heEnenyrNsMeFP2woUgXs+z2RI/JfKGfKrZr1VQt
 YzmkrQPio44xAoe2hZGssNa73rWth69ZoA==
X-Google-Smtp-Source: ABdhPJwj+Msvz3LH4ir1e8H38mV0II75vcXSYZCtRRoxfm+RhbeL1esV1hMKuuVwfHhjxWU/FRRU8A==
X-Received: by 2002:a17:90a:bb82:: with SMTP id
 v2mr6496890pjr.57.1633636522856; 
 Thu, 07 Oct 2021 12:55:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/48] tcg/optimize: Split out fold_to_not
Date: Thu,  7 Oct 2021 12:54:42 -0700
Message-Id: <20211007195456.1168070-35-richard.henderson@linaro.org>
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

Split out the conditional conversion from a more complex logical
operation to a simple NOT.  Create a couple more helpers to make
this easy for the outer-most logical operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 154 +++++++++++++++++++++++++++----------------------
 1 file changed, 86 insertions(+), 68 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 324866cbf1..1574954668 100644
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
@@ -1122,7 +1182,11 @@ static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
 
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
@@ -1132,12 +1196,22 @@ static bool fold_neg(OptContext *ctx, TCGOp *op)
 
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
@@ -1151,7 +1225,11 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 
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
@@ -1282,7 +1360,8 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xx_to_i(ctx, op, 0)) {
+        fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
     return false;
@@ -1436,67 +1515,6 @@ void tcg_optimize(TCGContext *s)
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


