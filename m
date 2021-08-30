Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA33FB146
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:36:39 +0200 (CEST)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKauM-0007hP-8C
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajC-0003v3-Lj
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj9-0007Ui-JW
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:06 -0400
Received: by mail-pl1-x629.google.com with SMTP id j2so7949117pll.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pU+TfWaNabr7baPocO4XBLVY8gDQ0e05DOYx5MFcfKU=;
 b=bMRfYiqsjaV7QSOY/6WNEQUb4sUceIhzg/lwQ4ieDLV/OsyHR6nuK3bcAc0nf6Z3RB
 uCKEeyXqEBkNRMtojNfGjbOZ+XgmcJx/HiMlORqXDAeQ85vQQZz/A9azo/uCTdU4ORlP
 ijH9hFUrGUuVpLKUxfMAQpnVAuvhvzeu7zMXXMjjALJfnVOkIujfKillAv/+BncTl9UU
 IwBTflnC9JyTMtS7Xn1Os0et2E8hW1TbF8qB7e3vuyY/jxETWUTPWsrNRgNxBHhQSIU1
 nqkNP2ysSOFE6rS92OXpYrOsADc8GuVzAWOwIvYaxxXgTLF4FhTBwk5wcbtm0HaRYpyG
 JXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pU+TfWaNabr7baPocO4XBLVY8gDQ0e05DOYx5MFcfKU=;
 b=P3uXHG494aqa70JrlSth5cE7as6Yar0R80J7wIOQz9IiH2QycbrDJelg353sl/h8iE
 hHn/d9MmqEQLPVVhLd3oSn9SWvwINFsKiTCevjiVzPuV8DWrvh5RLj8LPCpM0nhh7CIf
 939+raYh6iYK67YffZ8hQP2xMFs8xeXEwumvD90+ySpMnJXD6bChj5Kl00xvyADDOzqL
 rXl8/ZQvGgdbpFmNuIxG3efGZSq+4hcPRcM5TekDKBme4hp3RosoWE8WPHpZW7elXooH
 dNnMZYQ4zbjgzg7G3knYP7qbb9lJggJkDPcSK9W1HSX1WOMg6Gbog/Y58WVAdkrb7p7o
 NMKQ==
X-Gm-Message-State: AOAM533iTquVCzDRTQlbrs6+4jnaYNMIN2Z3VS57/C2/buPuhQxmIHSD
 0PA6SCLu+H0yAs6NBvawqD94Ia+NEN+cww==
X-Google-Smtp-Source: ABdhPJwrerGRcanKR+yJBnPxSL+UAAbcKW8q1LrO/ULf/nGOPzzXGSY82IBEr94hv2+oZrWeJRMRpQ==
X-Received: by 2002:a17:902:c40a:b0:138:a82d:3aa7 with SMTP id
 k10-20020a170902c40a00b00138a82d3aa7mr12243432plk.54.1630304702155; 
 Sun, 29 Aug 2021 23:25:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/48] tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
Date: Sun, 29 Aug 2021 23:24:17 -0700
Message-Id: <20210830062451.639572-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
index 76f9772648..a3780514e5 100644
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


