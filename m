Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364B6436C97
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:20:07 +0200 (CEST)
Received: from localhost ([::1]:48080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfTq-0003lm-7v
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGA-0007P6-C9
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:58 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG4-0004Gh-7B
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:56 -0400
Received: by mail-pl1-x632.google.com with SMTP id u6so1303309ple.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXAcxan7S9VdDzWZ6hubQvAQCG5PQ50y7tm1Z6dakPA=;
 b=JrnNYoTldP28ng84Bc9+Ixk4/ak0unO3AXg/VfqlLwFJeiIY8f2QHbKN/GF+ihbZTG
 qS1K+qphUsNEba3FMtnSuXotx+bjtKIWiqHBTZd9egcqOiV89uvFQkY0heIvfRgmlmy2
 FEWFd/liyRxrsWZ8GGLcpuWAKh+8VuLOxK5TFTtwufj8tciHjq2Tg4hiNS6rUknfZOgy
 zf+BRTo4+BaMtA3RF34kFoUN+1A3Wo34r5LE1ORdW1JBKv0bdPIqymBmYzybeY/la+4W
 O50B6w3Yn1NURRItjzbU/XBfNqslPsJpdo0vlpMEHGvvn4zT0J/qsY87q/PKgKZmpjm9
 9IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nXAcxan7S9VdDzWZ6hubQvAQCG5PQ50y7tm1Z6dakPA=;
 b=53q78qI0Xme4kP4BFH8YzF9PGQj+8nPvdSCwmgXPduU2Uy5UK8tJnZnYMsnW11519c
 4trYZehOReUoOFKYdCH9yXLcYST/3kBeIaRgEsgjIF9nDBU/1X0z1N1k7PA7ACC/KZ5g
 HfMclXOjOuxqxrF2Gm0uGtFKelPcFqNgFN76wyq1AQ6mIOrizepg+I9ShtBjGh+NKKWj
 8vc0l+OnvIeKJJGRvksFJzL/JW5qa52IWf7xVNuw304vw4rHdiinWKD0xD8UyTBOh96a
 WlOU/rumhOozt13mU44pnJNAQG+34WwYGfR4bQ8GqtE3oZAQM8SgSN2sCoD14dweBKn+
 Ip5Q==
X-Gm-Message-State: AOAM530JJ5VDBpz6UNBVd96OFZBcXQs8pLK6+GkcELXyX2UjOYsXnUkc
 LH/Pc2zWM0FA9EYmBq0Wo5vSCNaMf1fUIQ==
X-Google-Smtp-Source: ABdhPJxNbLlN9TerjdTRQPT3mP+JUZmsu20Ys9kDt/1+WbVsqop5pOgQOfhHS+/0MxqgmxxleQB7vQ==
X-Received: by 2002:a17:90a:6942:: with SMTP id
 j2mr5969238pjm.113.1634850350940; 
 Thu, 21 Oct 2021 14:05:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/48] tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
Date: Thu, 21 Oct 2021 14:05:05 -0700
Message-Id: <20211021210539.825582-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

This puts the separate mb optimization into the same framework
as the others.  While fold_qemu_{ld,st} are currently identical,
that won't last as more code gets moved.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
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


