Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79543BDE7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:31:25 +0200 (CEST)
Received: from localhost ([::1]:50936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVue-0006f5-TR
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa6-00033m-Ex
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:10 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa2-0001z9-1L
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:10 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t7so1008890pgl.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C2TgxQz1GB819hSkndrC8NaNVJWCUo0QsMgOlWylEw4=;
 b=QeB7QIxGp4on65pY8952UOWe57wcXZxIXjab9Kgems7C+aoOAiyPtxzEhjFh4gTsMm
 ebPf87DmfVXzjnY1Gi9cFZCr9RF4bT03F8Y8qMayUO026mrxiyGqXSFHw02Q9mQ6FVen
 0aCB3zDZfDxoPW6c2dHudyAgJFAM624ekYxaLRN3Nz/Tlt1Yt9aX0gKzkvneIB/V0feM
 2rnKn5b9AOoC50YsndDO3AQbTJgY4ZBEoEl2bmxgylF7b+dsMS1617MwpuXA6tXEFZbH
 lZTLvNSJKIZQcGlOX/PWuMBMGlt1Tec/YjpxJ+9F+WGvDD8jOyOjSDHeisP2n1ixcNLv
 9JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C2TgxQz1GB819hSkndrC8NaNVJWCUo0QsMgOlWylEw4=;
 b=wq/c9O9SDvGoS2COL69mfVkovt0RktaQM9OgdpBXDvE98STVLFhRF5RdCt3zO81OFx
 P3wfd+NklGQhLd33N9W0NBYMAGZW6kdQLteusI8EHekSMHkoFfOQeybvgtvBVBgnYKSa
 WmFxISQAcphOK9jeW6S1O7xKRrhKSfC8qMsIOfofKfPrE0L4EFXsMCbhA6sRh6uF71HW
 oDL+VnHOvB756hiKjye/37B3Gz5qJSc7laXtVh821Gi8vk2mF4fSujJ6df1+vxy5NJbk
 bjgi3Y4AcezE0g9YT9IZZJ88XxJCXnvJVyYvM2Y0yGiKzvXRCpmA/m7Bv1uyTQlwH4K+
 H7yw==
X-Gm-Message-State: AOAM530NyIivyUzWiJdVfNJKYb5HnLQO7L6ZbpPiAU/Tt89ugGLmmEWT
 bS5If1kUaXvbIs0snI/mgo3NqSmqXCkVDA==
X-Google-Smtp-Source: ABdhPJwVZzlX7g+7s5Tbcez5L+uVVfdAanC473g6cuKPfr3PPHUtORqEz4j8d9Uhse6rPM1slw7V9w==
X-Received: by 2002:a63:7405:: with SMTP id p5mr21262912pgc.426.1635289804620; 
 Tue, 26 Oct 2021 16:10:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/51] tcg/optimize: Split out fold_movcond
Date: Tue, 26 Oct 2021 16:09:14 -0700
Message-Id: <20211026230943.1225890-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 56 ++++++++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9d1d045363..110b3d1cc2 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -922,6 +922,34 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_movcond(OptContext *ctx, TCGOp *op)
+{
+    TCGOpcode opc = op->opc;
+    TCGCond cond = op->args[5];
+    int i = do_constant_folding_cond(opc, op->args[1], op->args[2], cond);
+
+    if (i >= 0) {
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
+    }
+
+    if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
+        uint64_t tv = arg_info(op->args[3])->val;
+        uint64_t fv = arg_info(op->args[4])->val;
+
+        opc = (opc == INDEX_op_movcond_i32
+               ? INDEX_op_setcond_i32 : INDEX_op_setcond_i64);
+
+        if (tv == 1 && fv == 0) {
+            op->opc = opc;
+            op->args[3] = cond;
+        } else if (fv == 1 && tv == 0) {
+            op->opc = opc;
+            op->args[3] = tcg_invert_cond(cond);
+        }
+    }
+    return false;
+}
+
 static bool fold_mul(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1715,31 +1743,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(movcond):
-            i = do_constant_folding_cond(opc, op->args[1],
-                                         op->args[2], op->args[5]);
-            if (i >= 0) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[4 - i]);
-                continue;
-            }
-            if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
-                uint64_t tv = arg_info(op->args[3])->val;
-                uint64_t fv = arg_info(op->args[4])->val;
-                TCGCond cond = op->args[5];
-
-                if (fv == 1 && tv == 0) {
-                    cond = tcg_invert_cond(cond);
-                } else if (!(tv == 1 && fv == 0)) {
-                    break;
-                }
-                op->args[3] = cond;
-                op->opc = opc = (opc == INDEX_op_movcond_i32
-                                 ? INDEX_op_setcond_i32
-                                 : INDEX_op_setcond_i64);
-            }
-            break;
-
-
         default:
             break;
 
@@ -1791,6 +1794,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_mb:
             done = fold_mb(&ctx, op);
             break;
+        CASE_OP_32_64(movcond):
+            done = fold_movcond(&ctx, op);
+            break;
         CASE_OP_32_64(mul):
             done = fold_mul(&ctx, op);
             break;
-- 
2.25.1


