Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C53443F67C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:17:33 +0200 (CEST)
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKGi-0006wT-9Z
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJae-0004ot-Qs
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:04 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJac-00080q-NI
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:04 -0400
Received: by mail-pg1-x533.google.com with SMTP id s136so8693443pgs.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YxTcI07P5KgjPUJAeZlSj6fs12sCJJNKN5YAni+jya0=;
 b=QFig7IxRmh9xDzLhA6sncFDcI2UtqKClhaautq33DGvawkz8yrrTvG58JH6rEcKwlX
 w3rCdzxnDov3ax1pDOieYRc7FaFp5JBW7vMDi6lguuqrsfBEpLYe07Fi43qjQp788fLa
 avoNpDcM0Hdc6AglpDOXprA2hXpwNaCR27IS0ogdD4q236156jd0kK0y1e5KsjgSNwcg
 jYQCpcaZbFvySGKZQ8OIhctmuWRcJknRs9qRd/W48G12uIHGj39T8NmCrUPWICnsgTdo
 z8xjA3S97gkZhKdq6Nm4gh/4vXw6NKUuhXU05iGsAenGXnsaOs+TVkWrnjRrrYG7eZXQ
 9lKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YxTcI07P5KgjPUJAeZlSj6fs12sCJJNKN5YAni+jya0=;
 b=TVW8rlz5RPD8frCuRJLHmS6DQAE61XjsuBsouvM+UI8m6+7h2qSUSs47Hd8sv3eErY
 9LRpR/Nd+iwmx46KnY8EtsULn6UQ+z/9t7bBFgdLy2ZMjjwz2ssIjoI3HbMnjraQZCGH
 kd6vsv/mjkTLwoOYOOdLVReTpq3qLOI4qi96wh2TUsn7R2vnVOjpwQfjFaWOw0zj7fJ6
 eOwpteFM7qLBaSN8j8UCKj6sgWdz4k66K+d7i6J76SXl4G8LsNM83aw0T2mvKnqog4k+
 14YU1de665wEEkg3i3JFTUl5F6HWul+2vviyY5GtDVLLoZxL2ys8pvTeXNHcGiIAUB+e
 163g==
X-Gm-Message-State: AOAM533Ae+ReAJu0ieDFYvNabmyVYICQCWQmEeSBzOzpBPlrNroCXgj7
 pgZiR20aCFc899yCmJFTY4pzjt+yZ0srCA==
X-Google-Smtp-Source: ABdhPJyyQE78ua2oWo/sLKe4pcw3XYKQqRs9h2dwIhtJ2bgXKpLBnIKULV6fdwJI/u6yqt+j/a2m3w==
X-Received: by 2002:a05:6a00:2ab:b0:47b:ee2c:62fb with SMTP id
 q11-20020a056a0002ab00b0047bee2c62fbmr8468053pfs.82.1635482041434; 
 Thu, 28 Oct 2021 21:34:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:34:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 37/60] tcg/optimize: Split out fold_xi_to_i
Date: Thu, 28 Oct 2021 21:33:06 -0700
Message-Id: <20211029043329.1518029-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Pull the "op r, a, 0 => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index ab96849edf..cfdc53c964 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -695,6 +695,15 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+/* If the binary operation has second argument @i, fold to @i. */
+static bool fold_xi_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[2]) && arg_info(op->args[2])->val == i) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /* If the binary operation has both arguments equal, fold to @i. */
 static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -763,6 +772,7 @@ static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_i(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
@@ -1081,12 +1091,20 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
 static bool fold_mul(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
@@ -1753,22 +1771,6 @@ void tcg_optimize(TCGContext *s)
             continue;
         }
 
-        /* Simplify expression for "op r, a, 0 => movi r, 0" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(and):
-        CASE_OP_32_64_VEC(mul):
-        CASE_OP_32_64(muluh):
-        CASE_OP_32_64(mulsh):
-            if (arg_is_const(op->args[2])
-                && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
-                continue;
-            }
-            break;
-        default:
-            break;
-        }
-
         /*
          * Process each opcode.
          * Sorted alphabetically by opcode as much as possible.
-- 
2.25.1


