Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4E4425D11
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:17:13 +0200 (CEST)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZpI-00048b-I4
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUE-0000P1-NC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:29 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUB-0007Km-TD
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:26 -0400
Received: by mail-pl1-x630.google.com with SMTP id c4so4637400pls.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/ruj9D2RAvl/WUBwZC73jxDYCJS59pO2tGcXETuKaA=;
 b=ckl+JZt+VpcFP047pB7xw8DjsgNemyHuxN1LB3Bkl66/qZBTueUOoQhybZ/2dqiRL/
 GzVEsBC4TOB5lvHK/gJIRmw1cbO4A9oi/s3v+M6GBjYaJhhyoOiEQJV1L4ud49wGFg/M
 OmkVB7t4NqNzExZkYdQB6hcMj64IMAoSwqo43vFlkm6h0uK08W4JTjerz9gbkDP87Zgz
 JTefKblD81x4B6xZZwTDeX285Y7wRxdZrw8SWb+/0CPRZX8XMV2ZriJqjDnXpvrfBOgp
 iKx7n2QdKeyj5QG0a0aoc6mszBTxRWGGifq+2zEJ9tq8C63wuY7mBX/PP0b657CgscNt
 xeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/ruj9D2RAvl/WUBwZC73jxDYCJS59pO2tGcXETuKaA=;
 b=jCzyYt29EXhuBWi7r8tr5lxh2pyY9CQCEshSqpO5imj39fiLv1DHXLvX/639DRG8q2
 5qHx+V825kHx/uZ8XQd2egjr3ijmNEmLuXLzBV2fcYPfOt4eRCDB3IXcaZA3fzZSYoZ3
 dlmA2NNRD3/irdmWZ+gt6yt2mLM1rhEBk+oLm2GEDk6c7P2plkje64Bxc9Mtvq2kTXk6
 FnmIT38Rra9TxsOZHXNgsYjalWkCCcSSvvlluUfph4ickDyLA1HD9MzaS4N3BTL/ZWDp
 OA9Ke6BG6XZYDpXUVsCaU+ZECyLHNNmModJ3ON2Xbyk8Pn0dSRYPIqFoUeGfQwJ9GEXY
 kqbg==
X-Gm-Message-State: AOAM5331T8UeeqWcYT1ep3z2SPmbUts5OytZWalVd2O7nJw2blF3AP8j
 kT629YW9nOVMpLRTlDQxP1pesfpKEgl4dw==
X-Google-Smtp-Source: ABdhPJzzE30dyhmLbRAagk6qX7oFmR0eaEzWgtzf7V5YfgUE7w0orLvH5uT30SZ9kxLd5j9imN+Wyg==
X-Received: by 2002:a17:90a:9a8f:: with SMTP id
 e15mr7773517pjp.198.1633636520635; 
 Thu, 07 Oct 2021 12:55:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/48] tcg/optimize: Split out fold_xi_to_i
Date: Thu,  7 Oct 2021 12:54:40 -0700
Message-Id: <20211007195456.1168070-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, a, 0 => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 1ba3a78585..0734bcb42e 100644
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
@@ -1078,7 +1088,11 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
@@ -1740,22 +1754,6 @@ void tcg_optimize(TCGContext *s)
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


