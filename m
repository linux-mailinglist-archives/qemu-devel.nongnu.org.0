Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84743F649
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:49:09 +0200 (CEST)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJpF-0000GZ-1h
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaQ-000464-8R
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:50 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaO-0007xG-63
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:49 -0400
Received: by mail-pf1-x436.google.com with SMTP id m14so8079391pfc.9
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnJy1DPqTKH9tszR9agXW3yGGHUuzxkGQ+Lpc0L3P3o=;
 b=Nk3/ku4EjEvlu1QbeTLB6s8RCWWp0lxugR4bcrX6Z3UGMMT/gED+opsm9n9Xl5IiSw
 7ExcfWE8UfkdAxUjtAqd/jbjSA51J6majwbQQLthQ8eEDpsDN+CB7cjwFWrjHeR5eKTC
 YWFW8m40gLJmUm9XK50obLZ4hGAW0IW+gd4wQNiwxBr+R/96P7xBDsTo3brNjWgPA6d1
 MnXVfHn3F0jMCJvPLX1Lg1LcHuMIPDoi4upa3PiYvNOAOhcsyqTL2G0m5xki0nFU9Sth
 VIF9ChR9vclEkfAvVdR91ZaTqXGvEKviJz+tZBNMa+CRDf882oUqjnGHaZ85yXMIst7A
 FSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnJy1DPqTKH9tszR9agXW3yGGHUuzxkGQ+Lpc0L3P3o=;
 b=dDd8FL+8qRn80WQ69ygnPSYmzj5dXTYWbX+ozcQ2A+QSiONO7B/NQ2gTZhk0+0VgBQ
 TihFA8MJygRbvTThKzrp5pJz8xZqOEEK77L5HULQd8fDbcoXEV5FthHJgzhSIE4dfURQ
 hzcJd8c2Ph/f3UXRi4GGzdUgVz74KWYQEXFqJScUlnZvjm3SaLMcDf25JzvQhO1jYsnb
 3hUl5wJsBzQs48/vh1G3j+pusGvdjHHtOqGsRYLxJRMn4dj7swTywOFbjuH5Aliwk07F
 o5gxA4JzDU0h05VzwgJFQDydqbuTnFT4joZfeSrkh8hPQRz9M1bSMEeAi7d1bQktjKHq
 kHdA==
X-Gm-Message-State: AOAM530gvAKpiFbJgdAo/VXqutYN13foh0s8EzAiVVdCsnPy08lyEMqT
 jLBo7bBnFqNnEZB7NvIUReFyk5Lg647o1Q==
X-Google-Smtp-Source: ABdhPJxRVWDX3Tqgjmbdwf4p4DipaBEo4A/YEcerbAeCPGvb3yGh4q5jCEcWpbnrCspnFcRdtSYfWg==
X-Received: by 2002:a05:6a00:138e:b0:47c:205:ac62 with SMTP id
 t14-20020a056a00138e00b0047c0205ac62mr8676408pfg.48.1635482026675; 
 Thu, 28 Oct 2021 21:33:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 19/60] tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
Date: Thu, 28 Oct 2021 21:32:48 -0700
Message-Id: <20211029043329.1518029-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


