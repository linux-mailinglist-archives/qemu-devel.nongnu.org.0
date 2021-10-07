Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217D425D03
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:13:44 +0200 (CEST)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZlv-0006dU-8Y
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU3-0000MZ-54
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:16 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU0-0007D7-QC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:14 -0400
Received: by mail-pf1-x433.google.com with SMTP id u7so6202630pfg.13
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MlsO6ZMAQGud5Wj7+vXSpsi/bOL8QSLMb8UKjMILIrM=;
 b=QD3+3fpQGr+WZaxNfEENX0YSjll+67WNGnwJJtWu1uF/F+ktIBS3LgeSzFE0vguU+f
 c4Yv88EEZWno4PIrsiv2eIjUBL84x/fm9sWut5/t5fBof+YiS4+S5765qdunuSx1D3Fg
 +KjDUdcBqoNtDuPIfv8bRTdjv/4hImXFQhG1ImqBF+N6z/jdk3MVMPae8VRnbXBsPsku
 J345cNsBCC2R814CMTG0HR8mN6yLbhLYe/9IaPwDtre9JaHOcu/JGn30hGSfr0Q98v2u
 iQNaBp+Js3r0MdVAYiLOpghRKIsgjR2cz+o/E2NHAVDsFysWkgBcHoYKwLhGGwgk8f9R
 aPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MlsO6ZMAQGud5Wj7+vXSpsi/bOL8QSLMb8UKjMILIrM=;
 b=LAvCthif97N4xrNSSV6xZRhnoDU1GUGS8n0MkXYXrzqkUIe2QUsdd04JkOrKITpa66
 6phlObUNv9vO2fmcloJ18QYwZS4mRFv9L+9v6zqMVzTbZC8qF3PhrNICvo1a5q7t0s/i
 q+6beqo9Mi6VJFmNpWv+ETrYoriJh35wUTULGL+rFwIBiaJObmo6wCDnPEiDQKQwA8fe
 M9q1xjlvAuvIbKuPWoquBAXbwC+TxmRN1HaECk2lo6SGNLVSysmaPssj3L01/IrJ9J2l
 JxX+tt63vzwfQqqaRusd7+SuGxNE+LX8USscowtI1ROHQs6ZiZcgXtl3belU2uilbQjO
 2kTg==
X-Gm-Message-State: AOAM5306h2xMrFlHVhfhcgN31dUKBYgMJBFYmK+mWsOj+lWE4j/Fz2Ih
 Kzpmf/yCQhqpVxlhe7IoBPYPmFzu/Xh+bw==
X-Google-Smtp-Source: ABdhPJzTlrWGlM64jStY/1bdV5r/8Dp/4md6eIFizlhiVCfJQXIF9U3LRvqe1PRSX6E9/+MfTi52uA==
X-Received: by 2002:aa7:9111:0:b0:44c:c206:ad9a with SMTP id
 17-20020aa79111000000b0044cc206ad9amr4481901pfh.72.1633636510953; 
 Thu, 07 Oct 2021 12:55:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/48] tcg/optimize: Split out fold_brcond
Date: Thu,  7 Oct 2021 12:54:26 -0700
Message-Id: <20211007195456.1168070-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 266787957f..786d46ed66 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -714,6 +714,22 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_brcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[2];
+    int i = do_constant_folding_cond(op->opc, op->args[0], op->args[1], cond);
+
+    if (i == 0) {
+        tcg_op_remove(ctx->tcg, op);
+        return true;
+    }
+    if (i > 0) {
+        op->opc = INDEX_op_br;
+        op->args[0] = op->args[3];
+    }
+    return false;
+}
+
 static bool fold_brcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[4];
@@ -1628,20 +1644,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(brcond):
-            i = do_constant_folding_cond(opc, op->args[0],
-                                         op->args[1], op->args[2]);
-            if (i == 0) {
-                tcg_op_remove(s, op);
-                continue;
-            } else if (i > 0) {
-                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-                op->opc = opc = INDEX_op_br;
-                op->args[0] = op->args[3];
-                break;
-            }
-            break;
-
         CASE_OP_32_64(movcond):
             i = do_constant_folding_cond(opc, op->args[1],
                                          op->args[2], op->args[5]);
@@ -1724,6 +1726,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(andc):
             done = fold_andc(&ctx, op);
             break;
+        CASE_OP_32_64(brcond):
+            done = fold_brcond(&ctx, op);
+            break;
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
-- 
2.25.1


