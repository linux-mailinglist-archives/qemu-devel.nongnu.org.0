Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD543BDCC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:23:52 +0200 (CEST)
Received: from localhost ([::1]:33988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVnL-0003U5-5a
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaB-0003CO-2z
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:15 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa3-0001zj-P3
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:14 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e65so1031261pgc.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F1AVpbG5TP2qMj+ELcN61uRCpwzeIi0grwtPZKRIVFo=;
 b=rznvl8Epvaws3JC8JIdtLugjwowB8xLRJbCAfvMVCTBObNo502nFtgV60b92PdkAPE
 URinGvW3vxkwK6sW/SRQTy/YjTXJBI04A/7rQFUPKvYPzP4vEcMbabCBFmT4lx5bvTG1
 Q11vWvzHzTnNq1j1bnl83wa4zK5M2hZlm6DSWC3RIgb4ly8QctqdATwduxtmmKC9co1v
 bByCw1vYPYyT3kg/8MegFy30TAWJCQ6KebhmAAuYCgcoUDo2ez1OOe/e0QpJ8FVViD81
 jh14IADMAbFyMvy8Ryeudi94NBuTkrT36feNwlg3w2WuoiDSjraBIZ4sEKhoPOtzYSBH
 QVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1AVpbG5TP2qMj+ELcN61uRCpwzeIi0grwtPZKRIVFo=;
 b=v3dV5SqU62oT9+amBhXjwUwfwDdyGJ40w2N7gQ147MUmAi6C+6V2Nkt83/6oCJ5OWY
 MvT4J803niU88K5UvZJAmf+L+yWSTcMzSE3gi8Q7KsZskn8MSCrMoDnG6B7O+x8Jgy/M
 +QO4Lql7Kr+NWhEU54INxY+k29AvgsKWTA85cdN0+4/m0g8tde0d9qugbsIsbIQPd95+
 dLuQjCfoupLg7ejw15o8BJwvb+Bf3GruzeBgw20md9V69ygQ8KEcixRDNRz+r7Cm/0hC
 RoCWD/nGg3b4khV8Zq2SToxzvX5RQVE2GMW2QB2khE2nrY+tYrtxILJ+rG0SO6gBl1Qc
 5Y/g==
X-Gm-Message-State: AOAM531S9vEJQZuxFqmDVSJt8HjP2mXXHJZU4rDLFI+qPEzwnl+Ko0zw
 l4gUUYPkO2AqSzk3zY/aBD57j5D4pLhpCg==
X-Google-Smtp-Source: ABdhPJwA2VRelc+oYC9HPCxD/NJxDiDVqHYhqBzKRlLpfkhM16DwLwYuKscWpbkJz7B5DlBPF4wOtA==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr21590387pgv.453.1635289806548; 
 Tue, 26 Oct 2021 16:10:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/51] tcg/optimize: Split out fold_extract, fold_sextract
Date: Tue, 26 Oct 2021 16:09:16 -0700
Message-Id: <20211026230943.1225890-25-richard.henderson@linaro.org>
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
 tcg/optimize.c | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index faedbdbfb8..3bd5f043c8 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -888,6 +888,18 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = extract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_extract2(OptContext *ctx, TCGOp *op)
 {
     if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
@@ -1126,6 +1138,18 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     return tcg_opt_gen_movi(ctx, op, op->args[0], i);
 }
 
+static bool fold_sextract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = sextract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1727,24 +1751,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract):
-            if (arg_is_const(op->args[1])) {
-                tmp = extract64(arg_info(op->args[1])->val,
-                                op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        CASE_OP_32_64(sextract):
-            if (arg_is_const(op->args[1])) {
-                tmp = sextract64(arg_info(op->args[1])->val,
-                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1779,6 +1785,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract):
+            done = fold_extract(&ctx, op);
+            break;
         CASE_OP_32_64(extract2):
             done = fold_extract2(&ctx, op);
             break;
@@ -1856,6 +1865,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
+        CASE_OP_32_64(sextract):
+            done = fold_sextract(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-- 
2.25.1


