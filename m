Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0B543BDBF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:21:02 +0200 (CEST)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVkb-00060h-LG
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZw-0002um-UB
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:01 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZu-0001xJ-JT
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:59 -0400
Received: by mail-pg1-x531.google.com with SMTP id 83so1014117pgc.8
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnJy1DPqTKH9tszR9agXW3yGGHUuzxkGQ+Lpc0L3P3o=;
 b=NBWay6pjTwR2VLfGzoCANQLV2FqMLnE/HhTqLsIYcGRFlFNWJUSjUwfrrX996aKT8G
 DiT6O6X0vgSUEP/LXdXyd6il/RC7BOiJ5U174zugMdktraaWvfFzqLdvwo6yXwCS2I8M
 szMQQoM6NjOp9QMy4gMa7jYDtEivpntDrPTbRzXQYBRKucHHuIXySqA1A7X/uQ62eswd
 ++5TUBN7zb1a5KLx9dHmoJXOn3/xnQIwOdgMsr6nBCJ/3AcHGfz8xgpaARYec6BRaJlp
 3LDA0udfnifQ0n2phWTRXhpLciaU/6HHWPCS9j11XSJwUUrZTRm7hXzHxCrA1u6bnVrx
 78Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnJy1DPqTKH9tszR9agXW3yGGHUuzxkGQ+Lpc0L3P3o=;
 b=shTJli8r6wIgeLvQlzehYUY0yl78Ysszgk1ZU+bB/Kth2B15t1qDBpKF94H6bq4k9R
 EOENuxLNZwkF0/gRMzLe7kykGZgtexCdExC1R1GD+QTJb2stf8bx/QphAj2l4dQZupL9
 Tr6KHCozTHSDYZRoTw+kQyVRHQ3N5h0O7+m4MqVFcfNl3CPgTzgHUXcc80NCHCL9GKkA
 XJPlbRHwTNEQoCsfDrKikpM3iH2W0XfyWTl/c6ZJfh42jPjfppAoMaCsdAgCAVv2TiaU
 NoEX7YbwoEZFdiLgOGH7X1IQ4jCf5j5EpfbS5l2mbAPI2ajY2xpuJ6PestwTBAePf8J5
 xKbQ==
X-Gm-Message-State: AOAM530QLH1HaOux18BHJ8yhn7UkcYYTDYtMuwysF2D7ZqzU1Rpc+/7R
 OTw/D/gRXAfQfGHyUeB/vVx2zL5n35NCtg==
X-Google-Smtp-Source: ABdhPJwLSt8MR9kcU2Pi3HWPGD3PMFMnrfFOlQCoOvR+GCRGTkI7xbhlSaTD9vDtje03BsovBvgv5w==
X-Received: by 2002:a63:8ac7:: with SMTP id y190mr13195487pgd.55.1635289797331; 
 Tue, 26 Oct 2021 16:09:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/51] tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
Date: Tue, 26 Oct 2021 16:09:06 -0700
Message-Id: <20211026230943.1225890-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This puts the separate mb optimization into the same framework
as the others.  While fold_qemu_{ld,st} are currently identical,
that won't last as more code gets moved.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


