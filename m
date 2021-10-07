Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4DE425CB6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 21:57:30 +0200 (CEST)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZWD-0003F1-QI
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 15:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU1-0000LA-JT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:14 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTy-0007AI-Cr
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:13 -0400
Received: by mail-pg1-x530.google.com with SMTP id e7so840778pgk.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ivbtox5EsaYRIQBScoD/oS8vfaIIGA8BHzU4lzD24ws=;
 b=UKLkGtour8uZurYiOGrVHa4n2KL1QSqHxGLk6Yntr10Fain1AFNp88dZ+xGHPpuOZo
 cb2+WXHCGjTFGotDXAzFOo+BY9zMRmu83n9/fURO1qsdDaP7FKTPbtoJ2ilJi5s7y0a0
 cRIMLOqGP2x4SYdDJYjB9Ns/BrCZYQNGtKuo5xaPJOCeQIHKR97sRWHGvavV8KDj27r2
 2ePacKHftDSJ5dAXbsFs6TzN688LZFUJbnz+liRe3mEt0gUNJdzemtqLtXSdLWC4Bs+4
 tcS3hyxL1mKpWFdajLEdSZfTGWS7lPw3CIDD2oNnB3AvIk5PXtttOchNLDfJKujxm683
 m11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivbtox5EsaYRIQBScoD/oS8vfaIIGA8BHzU4lzD24ws=;
 b=YJqCoFnXWfCjL3Z29Fkvkp77U93Bb3PFf09nPrNvjFIDEDDkLqnJ/yGin1+8uoVOsG
 3VmPqfmWS8Je9e5He1ODlF5AXAcR1KvzJGbBvg3yLtKcJ0A7nngTP4cHWCGXS3G2eZER
 WHoT6MCXMAd3sQxz/6V9snWN53MSEDQLqfFkrKpjoQdSHP1pwRbc8gkd4sxzCdayjALA
 kBCJYlTjm9XvPxVsCptmNvxrSwBxeBuzIiAqJaXXkGejM4iOneHAhjpehWgE3HumdSOi
 ZtrEoH5ne1xqQLXos/F6nPchyqOlNoNPBIAKz2iA/oXVyV2cKbKucEfshvUS6G5+cdDF
 CYag==
X-Gm-Message-State: AOAM53323hiWm0K3J3nWmIBGWMqvjs6w2B1xoX0jv2RgjF0iv3so9xto
 mMA2bOoXxyD9wx8lX0j5zyPWkp4gQUw72g==
X-Google-Smtp-Source: ABdhPJz3fqPG+ZtaMiqdBnLef2wLgd49mZ2DxSwVBaOnhKZFlY8nNWIGNSjprQAFGJ/8hi6YfaE1FA==
X-Received: by 2002:a63:dc03:: with SMTP id s3mr1248058pgg.88.1633636508120;
 Thu, 07 Oct 2021 12:55:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/48] tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
Date: Thu,  7 Oct 2021 12:54:22 -0700
Message-Id: <20211007195456.1168070-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

This puts the separate mb optimization into the same framework
as the others.  While fold_qemu_{ld,st} are currently identical,
that won't last as more code gets moved.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 89 +++++++++++++++++++++++++++++---------------------
 1 file changed, 51 insertions(+), 38 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 699476e2f1..159a5a9ee5 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -692,6 +692,44 @@ static bool fold_call(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_mb(OptContext *ctx, TCGOp *op)
+{
+    /* Eliminate duplicate and redundant fence instructions.  */
+    if (ctx->prev_mb) {
+        /*
+         * Merge two barriers of the same type into one,
+         * or a weaker barrier into a stronger one,
+         * or two weaker barriers into a stronger one.
+         *   mb X; mb Y => mb X|Y
+         *   mb; strl => mb; st
+         *   ldaq; mb => ld; mb
+         *   ldaq; strl => ld; mb; st
+         * Other combinations are also merged into a strong
+         * barrier.  This is stricter than specified but for
+         * the purposes of TCG is better than not optimizing.
+         */
+        ctx->prev_mb->args[0] |= op->args[0];
+        tcg_op_remove(ctx->tcg, op);
+    } else {
+        ctx->prev_mb = op;
+    }
+    return true;
+}
+
+static bool fold_qemu_ld(OptContext *ctx, TCGOp *op)
+{
+    /* Opcodes that touch guest memory stop the mb optimization.  */
+    ctx->prev_mb = NULL;
+    return false;
+}
+
+static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
+{
+    /* Opcodes that touch guest memory stop the mb optimization.  */
+    ctx->prev_mb = NULL;
+    return false;
+}
+
 /* Propagate constants and copies, fold constant expressions. */
 void tcg_optimize(TCGContext *s)
 {
@@ -1599,6 +1637,19 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
+        case INDEX_op_mb:
+            done = fold_mb(&ctx, op);
+            break;
+        case INDEX_op_qemu_ld_i32:
+        case INDEX_op_qemu_ld_i64:
+            done = fold_qemu_ld(&ctx, op);
+            break;
+        case INDEX_op_qemu_st_i32:
+        case INDEX_op_qemu_st8_i32:
+        case INDEX_op_qemu_st_i64:
+            done = fold_qemu_st(&ctx, op);
+            break;
+
         default:
             break;
         }
@@ -1606,43 +1657,5 @@ void tcg_optimize(TCGContext *s)
         if (!done) {
             finish_folding(&ctx, op);
         }
-
-        /* Eliminate duplicate and redundant fence instructions.  */
-        if (ctx.prev_mb) {
-            switch (opc) {
-            case INDEX_op_mb:
-                /* Merge two barriers of the same type into one,
-                 * or a weaker barrier into a stronger one,
-                 * or two weaker barriers into a stronger one.
-                 *   mb X; mb Y => mb X|Y
-                 *   mb; strl => mb; st
-                 *   ldaq; mb => ld; mb
-                 *   ldaq; strl => ld; mb; st
-                 * Other combinations are also merged into a strong
-                 * barrier.  This is stricter than specified but for
-                 * the purposes of TCG is better than not optimizing.
-                 */
-                ctx.prev_mb->args[0] |= op->args[0];
-                tcg_op_remove(s, op);
-                break;
-
-            default:
-                /* Opcodes that end the block stop the optimization.  */
-                if ((def->flags & TCG_OPF_BB_END) == 0) {
-                    break;
-                }
-                /* fallthru */
-            case INDEX_op_qemu_ld_i32:
-            case INDEX_op_qemu_ld_i64:
-            case INDEX_op_qemu_st_i32:
-            case INDEX_op_qemu_st8_i32:
-            case INDEX_op_qemu_st_i64:
-                /* Opcodes that touch guest memory stop the optimization.  */
-                ctx.prev_mb = NULL;
-                break;
-            }
-        } else if (opc == INDEX_op_mb) {
-            ctx.prev_mb = op;
-        }
     }
 }
-- 
2.25.1


