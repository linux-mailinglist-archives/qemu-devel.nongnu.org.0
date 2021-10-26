Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55243BDF0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:34:00 +0200 (CEST)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVx9-0003nk-SL
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaD-0003Ej-5S
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZw-0001xm-MI
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:15 -0400
Received: by mail-pj1-x1032.google.com with SMTP id gn3so658434pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4b6zM17cF3RrWL3jUN3e39U/QFtejbDytYKYLpCpWYI=;
 b=qGrZc16LYjF+sTtGwwlQE03MP/oUCHQGAGto5nomfnZoUo6NHyR3rAywFzi7LBht8L
 TxfQErsaB9aeobAsLiik4b7Dr4bofyiH6vcFxAx5ZpHN8iAZszrXl9CMFianrACLCnes
 11WXzGmSppfaRRW2icMpM9whEXp2YfAb4JIYZj2CHd3zXmgFmcDk8EaA5euf9JzQ7d9S
 2jSPBhd+29KGAYjeAtUkH+eKBFxkzTHOmxutEz7/xOqGogbNyCzDN+KFYFB7MBvScGc2
 mwqxEo1mW3KIglWfSm3e2cCaZXUXOSjH7kF2bIhc74tb7Hr2MI4gR312yjWPBKmGZTYd
 3mGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4b6zM17cF3RrWL3jUN3e39U/QFtejbDytYKYLpCpWYI=;
 b=Rx1zjTZoMotcOOwjfTFY27M7qg6snTKJI/1ozMJcVCQpdDsmRsqxIuEeYG+c/lwgQ2
 U1Ft9g8zYeO432aLRUyZn7an1wt/bVC/+VJjiBuPblGKUPsF/y2KqPJUK3SEIAsCjh3r
 epCtUjg/FDuvBMVxRcmzN6uvII7jN/wy2yHzH+viXtGVlMqDq9Pi23MqVr4E9HUiBcHT
 YUBxuoojZKt9G5HEsE/cHfc4KZZZTvqIlb4ccReXmtPVM49xqT3gBpcAW3wg+a+7PMZc
 309N8DFpG+dj9XmjfhMab7TVO//coddyw2enXlviBPLu5Nl8KSoGNFFNapRnnKXV88C/
 v1dw==
X-Gm-Message-State: AOAM530+ZuDrclBPiK6zbp4WTA86lM+NP5DvqIox8835aq7mFq1WNUe8
 QH7jVfR+W9Jo7CeX6KDSzrJy8en/sKngEw==
X-Google-Smtp-Source: ABdhPJzEKdSNWuC4ZVftIoASy7SIHuNwHXKpezbBsMr2xj6UhwOBG/0n+9WxMT5QjQCZhHZLe1e0zA==
X-Received: by 2002:a17:90a:2c02:: with SMTP id
 m2mr1880325pjd.109.1635289799020; 
 Tue, 26 Oct 2021 16:09:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/51] tcg/optimize: Split out fold_setcond2
Date: Tue, 26 Oct 2021 16:09:08 -0700
Message-Id: <20211026230943.1225890-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Reduce some code duplication by folding the NE and EQ cases.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 145 ++++++++++++++++++++++++-------------------------
 1 file changed, 72 insertions(+), 73 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5c3f8e8fcd..80e43deb8e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -854,6 +854,75 @@ static bool fold_remainder(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_setcond2(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[5];
+    int i = do_constant_folding_cond2(&op->args[1], &op->args[3], cond);
+    int inv = 0;
+
+    if (i >= 0) {
+        goto do_setcond_const;
+    }
+
+    switch (cond) {
+    case TCG_COND_LT:
+    case TCG_COND_GE:
+        /*
+         * Simplify LT/GE comparisons vs zero to a single compare
+         * vs the high word of the input.
+         */
+        if (arg_is_const(op->args[3]) && arg_info(op->args[3])->val == 0 &&
+            arg_is_const(op->args[4]) && arg_info(op->args[4])->val == 0) {
+            goto do_setcond_high;
+        }
+        break;
+
+    case TCG_COND_NE:
+        inv = 1;
+        QEMU_FALLTHROUGH;
+    case TCG_COND_EQ:
+        /*
+         * Simplify EQ/NE comparisons where one of the pairs
+         * can be simplified.
+         */
+        i = do_constant_folding_cond(INDEX_op_setcond_i32, op->args[1],
+                                     op->args[3], cond);
+        switch (i ^ inv) {
+        case 0:
+            goto do_setcond_const;
+        case 1:
+            goto do_setcond_high;
+        }
+
+        i = do_constant_folding_cond(INDEX_op_setcond_i32, op->args[2],
+                                     op->args[4], cond);
+        switch (i ^ inv) {
+        case 0:
+            goto do_setcond_const;
+        case 1:
+            op->args[2] = op->args[3];
+            op->args[3] = cond;
+            op->opc = INDEX_op_setcond_i32;
+            break;
+        }
+        break;
+
+    default:
+        break;
+
+    do_setcond_high:
+        op->args[1] = op->args[2];
+        op->args[2] = op->args[4];
+        op->args[3] = cond;
+        op->opc = INDEX_op_setcond_i32;
+        break;
+    }
+    return false;
+
+ do_setcond_const:
+    return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+}
+
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1653,79 +1722,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_setcond2_i32:
-            i = do_constant_folding_cond2(&op->args[1], &op->args[3],
-                                          op->args[5]);
-            if (i >= 0) {
-            do_setcond_const:
-                tcg_opt_gen_movi(&ctx, op, op->args[0], i);
-                continue;
-            }
-            if ((op->args[5] == TCG_COND_LT || op->args[5] == TCG_COND_GE)
-                 && arg_is_const(op->args[3])
-                 && arg_info(op->args[3])->val == 0
-                 && arg_is_const(op->args[4])
-                 && arg_info(op->args[4])->val == 0) {
-                /* Simplify LT/GE comparisons vs zero to a single compare
-                   vs the high word of the input.  */
-            do_setcond_high:
-                reset_temp(op->args[0]);
-                arg_info(op->args[0])->z_mask = 1;
-                op->opc = INDEX_op_setcond_i32;
-                op->args[1] = op->args[2];
-                op->args[2] = op->args[4];
-                op->args[3] = op->args[5];
-                break;
-            }
-            if (op->args[5] == TCG_COND_EQ) {
-                /* Simplify EQ comparisons where one of the pairs
-                   can be simplified.  */
-                i = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                             op->args[1], op->args[3],
-                                             TCG_COND_EQ);
-                if (i == 0) {
-                    goto do_setcond_const;
-                } else if (i > 0) {
-                    goto do_setcond_high;
-                }
-                i = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                             op->args[2], op->args[4],
-                                             TCG_COND_EQ);
-                if (i == 0) {
-                    goto do_setcond_high;
-                } else if (i < 0) {
-                    break;
-                }
-            do_setcond_low:
-                reset_temp(op->args[0]);
-                arg_info(op->args[0])->z_mask = 1;
-                op->opc = INDEX_op_setcond_i32;
-                op->args[2] = op->args[3];
-                op->args[3] = op->args[5];
-                break;
-            }
-            if (op->args[5] == TCG_COND_NE) {
-                /* Simplify NE comparisons where one of the pairs
-                   can be simplified.  */
-                i = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                             op->args[1], op->args[3],
-                                             TCG_COND_NE);
-                if (i == 0) {
-                    goto do_setcond_high;
-                } else if (i > 0) {
-                    goto do_setcond_const;
-                }
-                i = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                             op->args[2], op->args[4],
-                                             TCG_COND_NE);
-                if (i == 0) {
-                    goto do_setcond_low;
-                } else if (i > 0) {
-                    goto do_setcond_const;
-                }
-            }
-            break;
-
         default:
             break;
 
@@ -1813,6 +1809,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(shr):
             done = fold_shift(&ctx, op);
             break;
+        case INDEX_op_setcond2_i32:
+            done = fold_setcond2(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-- 
2.25.1


