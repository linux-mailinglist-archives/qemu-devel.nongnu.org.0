Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE9C43F67E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:20:50 +0200 (CEST)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKJt-0001rR-M7
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdi-0002Rs-0v
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdb-0000LO-TU
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:11 -0400
Received: by mail-pf1-x42b.google.com with SMTP id l1so1679725pfu.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c9WNRlGeOHz8VZWPjOaGMMZX6Dax33jheJzEQdYsE1k=;
 b=KBrcc2jOyuRIq62Ys/g+LncOvrFqqJRI7V7dWnytbYSvEKONBuRBxzNE0529OkrJAT
 ksOkbfN0RYrKFWe2AdKz1FEDKBWcq95//MTpuKhihYUYufVL3GyzlsqRTUv1Xw5xoRbh
 zFTBsPtJ4eD1SntUDLoKV58zsJc8uJa7s6kwSBY3YxQHLQ1aacx9gXGhAyVqfAgb5kRm
 M0+RcDzndDBrowYeqOwqq9++M+jzR6C0y2QuzcPMriNw4RaP3IDMCY5Uac2jnY/i/Sbb
 7dWEW5lPYgyfYUQ4JAzoXFpsXwj2KRMcN7zUMi1jYIFfsND3/E+LZfS2xfSknfTQ7nac
 KzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c9WNRlGeOHz8VZWPjOaGMMZX6Dax33jheJzEQdYsE1k=;
 b=b8dtx9xAKA070f+yGioGUBMogHIrie+K62XvHlIdFCFnDIJxkik0pRwhIDJvcESf5C
 Ma+xSd+NMeB6GKgsqYmw7tLsWidgKRpTWbwjlI089jIz8+UW/Zlue3Rwk063rCjdi2IM
 QIPFUyUW2IYh14+UYEmi6FRxnPmKHPPzsCYlJJDHVaQmyWfpeJiEPZD3RZjt0/dYLqIU
 4rwV2yn2EQH5zcz+KEvUoVB7XFQ5zDSZ7H5sz1F5sgDYqhKVNux+WylCWGavCGtoElQP
 Jx+wGZtliABwSXjawbl17ZeeX3yBK8VEiuuVaGqyMkkht/9rkQE8/JrBBHQC2d4xK0Q+
 COyQ==
X-Gm-Message-State: AOAM530ynGvPgFIEYVb8mPHCfDLqrmp4QhoZR4xFhZUeJYj6ldTA/K8e
 zCTmHZa5lujK+TDE183m8KSR1JFLun0r7w==
X-Google-Smtp-Source: ABdhPJyJB4qWDvFIRtd+5aSCTy8zPLDAW7enypBH91Wf4icZcA9Ukhns1lErLd2Da7hxPANZrzYH+g==
X-Received: by 2002:a05:6a00:1a8c:b0:47e:4b18:dc2b with SMTP id
 e12-20020a056a001a8c00b0047e4b18dc2bmr7187862pfv.10.1635482225442; 
 Thu, 28 Oct 2021 21:37:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 42/60] tcg/optimize: Split out fold_ix_to_i
Date: Thu, 28 Oct 2021 21:33:11 -0700
Message-Id: <20211029043329.1518029-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Pull the "op r, 0, b => movi r, 0" optimization into a function,
and use it in fold_shift.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f5ab0500b7..bf74b77355 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -731,6 +731,15 @@ static bool fold_to_not(OptContext *ctx, TCGOp *op, int idx)
     return false;
 }
 
+/* If the binary operation has first argument @i, fold to @i. */
+static bool fold_ix_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[1]) && arg_info(op->args[1])->val == i) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /* If the binary operation has first argument @i, fold to NOT. */
 static bool fold_ix_to_not(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -1384,6 +1393,7 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_ix_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
@@ -1552,24 +1562,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expressions for "shift/rot r, 0, a => movi r, 0",
-           and "sub r, 0, a => neg r, a" case.  */
-        switch (opc) {
-        CASE_OP_32_64(shl):
-        CASE_OP_32_64(shr):
-        CASE_OP_32_64(sar):
-        CASE_OP_32_64(rotl):
-        CASE_OP_32_64(rotr):
-            if (arg_is_const(op->args[1])
-                && arg_info(op->args[1])->val == 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
-                continue;
-            }
-            break;
-        default:
-            break;
-        }
-
         /* Simplify using known-zero bits. Currently only ops with a single
            output argument is supported. */
         z_mask = -1;
-- 
2.25.1


