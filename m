Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C367425CF9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:10:01 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZiJ-0000sD-Qz
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUJ-0000RS-PR
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:32 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUB-0007Jg-Sp
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:28 -0400
Received: by mail-pl1-x62e.google.com with SMTP id j15so4636050plh.7
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=twiCQpvMWsXn9C04Aryc+Xn7T8xJZQa9v2G7lJnelP8=;
 b=lJ/TaxteZyed2tHg+zaBNQJwLdoHAXiv5xreHlaGGIxvm1mZ6Kxn/dJp/1ZEmuce9y
 l5VvjrahPUEvanm3POA9gXUwvUh+XIn/kpCyCAN+0HW/h0MpkZjnYFcVoLodruVXt6GL
 IhsVRvl8lg6FAQoH+NBV2qEPGvejPmAueg/7/fXSc70KAkNCUJX01b0B8wZ+otXsBE/k
 gAUNNWffyOImmMRwcD1OItjt0Z5LRzk2o9FR9I1RwgCD5+cAt0qeYfYUoIlRWIvXdpL6
 wsn1D0n+Crsyp0/VlbaAgJiIcEijSXz9MPxDEbBCkhtsGRKFS0hh+4KVnn0tMs6sDtyj
 FLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=twiCQpvMWsXn9C04Aryc+Xn7T8xJZQa9v2G7lJnelP8=;
 b=DQkyS25zXK3/ORA7NAm3880j1Y2vc5K0N3TWlvkiuY80YWAq/rMlElcAuQaUrHCwxQ
 DJJ5m0+bEC6/md4Bdw37Ya4rAVEAu105qTc8foX2fItKZ/wqwREJDaE+34fijDO13Q/L
 YMbszezU63IImhKvv0S8xGl90uKZTrbfAPw0Ev8J+96wrn6bp3P/9fWF8parsco8asa9
 fiFZ94pWmFyekBykN5uoA5y0J83ztxNqTWI1fmoMVcq9GZB7FC3fiA9mz2A+0iTNaCM1
 rp6EoLeWAGP97608e1TMBqVJV+Tn61niq5RbADqlW/grU+Y1tgfovE4Vl0ERc6YkI+Z7
 /APA==
X-Gm-Message-State: AOAM531e0tbFx1/TO/YhtjRB8jSwuMv1Gf5z6DuNaVqG8kOzgNatwA9S
 JNf8bkb7hLMHuSY/nDzmlgwP9HbR7DK36g==
X-Google-Smtp-Source: ABdhPJyQTk9eNmsWE5u8wzQ4aMp1dLchNu/CFBCApKrk5eZEgbyHEacuDHxAuuL6kYI2MtJUJb7iDA==
X-Received: by 2002:a17:90a:d195:: with SMTP id
 fu21mr7647322pjb.67.1633636520082; 
 Thu, 07 Oct 2021 12:55:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/48] tcg/optimize: Split out fold_xx_to_x
Date: Thu,  7 Oct 2021 12:54:39 -0700
Message-Id: <20211007195456.1168070-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Pull the "op r, a, a => mov r, a" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 708fb850b0..1ba3a78585 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -704,8 +704,22 @@ static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
     return false;
 }
 
+/* If the binary operation has both arguments equal, fold to identity. */
+static bool fold_xx_to_x(OptContext *ctx, TCGOp *op)
+{
+    if (args_are_copies(op->args[1], op->args[2])) {
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
+    }
+    return false;
+}
+
 /*
  * These outermost fold_<op> functions are sorted alphabetically.
+ *
+ * The ordering of the transformations should be:
+ *   1) those that produce a constant
+ *   2) those that produce a copy
+ *   3) those that produce information about the result value.
  */
 
 static bool fold_add(OptContext *ctx, TCGOp *op)
@@ -748,7 +762,11 @@ static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
 
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_x(ctx, op)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_andc(OptContext *ctx, TCGOp *op)
@@ -1103,7 +1121,11 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_x(ctx, op)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_orc(OptContext *ctx, TCGOp *op)
@@ -1734,19 +1756,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expression for "op r, a, a => mov r, a" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(or):
-        CASE_OP_32_64_VEC(and):
-            if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
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


