Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8178943F650
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:52:50 +0200 (CEST)
Received: from localhost ([::1]:54370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJsn-000673-Hi
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaU-0004IX-Sx
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaQ-0007xj-1U
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id om14so6331129pjb.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4b6zM17cF3RrWL3jUN3e39U/QFtejbDytYKYLpCpWYI=;
 b=mFHQeBFA3mI0H+0vAaAzFU1wp6YwYLLGh+ZuYoyB+LurHBbYyhF/N4gVkiNXSGL18c
 wGriJZrtyTLcybqkHxWud8jcoCylvRxSrG9d+L1h0QWa9qa1zeMUYJr497GNF+vCRvkz
 osv4qn7+i3MppLG2AyS17hIn7cT/QmFkKLc0pCau7mFeyb9TQWIt3c3JRJHZ8Q0QsHwj
 uuTb0bUGyDvgm1LDU8OlBWUwXONcO3KhsFwLKS14hO7lPFh5sVQM727rmxgCZjDmUPrO
 z0REgy8GmZ7JyJLMgZtv6h/Kqj+dvewk5W++vHN7yr8t28zKU3CvwcML9ON3ZssZrmzi
 DuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4b6zM17cF3RrWL3jUN3e39U/QFtejbDytYKYLpCpWYI=;
 b=CZWat9cXa9NGy/T/cdfI15SDXuiXEVmuZkPbMdQAJt/LMiOl3krXuToiKArpPcHAo+
 BcnFa9U1ZMdlkYC8JsIAl8Njflcba271OkRPMM7snjuk4Cg1jTTdUHVqz68Dl3fQwFoQ
 2sc6pFg0o0x/thKhq2UC+Cp+K49mntmzQs65cD406I/hXdmMBNbbhSGSZ1qYNS3OI9j9
 y4HH28Z5D2rqoQxAUxvlA76DtIlvNm22I3znxCSm6BcLvXQgugNiUStEXewDbSQLb+I0
 Cv0cRru5CQJQCmv8oG0Zr8NYkUjhxZeZcPWpiviYgqZmH8d3NlgXgfjsmh1rE/ksokcW
 /PBA==
X-Gm-Message-State: AOAM531W8q1UCzlyamYSbD7wvsDbKNXcTR3NTMN3DIHojg3JVti25DwF
 1cV45WwYfVnf6PFPMvpQfVYgHuOP4TaCkQ==
X-Google-Smtp-Source: ABdhPJx3g+vRl1oxBj413RFQe2DACCXmMYOtJMluAm9+WJlx+H2HuwAZPzdZiHluLG84qfZMfuFq4Q==
X-Received: by 2002:a17:902:d88c:b0:13f:f584:f630 with SMTP id
 b12-20020a170902d88c00b0013ff584f630mr7651504plz.58.1635482028725; 
 Thu, 28 Oct 2021 21:33:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 21/60] tcg/optimize: Split out fold_setcond2
Date: Thu, 28 Oct 2021 21:32:50 -0700
Message-Id: <20211029043329.1518029-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


