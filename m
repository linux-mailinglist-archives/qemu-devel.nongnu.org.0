Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E5436CA1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:25:58 +0200 (CEST)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfZV-00061F-Tj
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGM-0007gv-Vl
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGJ-0004fg-Fw
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:10 -0400
Received: by mail-pg1-x530.google.com with SMTP id g184so1411012pgc.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fh7DFu4XKWjYbSJ+Cjp1/tLglXpgvD0yDYhrX9eTXV8=;
 b=cwrbrd1vLRrPJ4CF436y8Z4feyY39mEEUvaL9tG5GDwSAAaROTQM+9hjBpP6g6mnZZ
 9mDC5r171qWG85547UfyJaQo0Z4jfWKvq3qtjkDptBEO/vj7NHF3vIvnyIjHb+YvaUzj
 bQbd0GTFXbUD6y3BjebCk+d7VW2l53nIxGAMC3Gf0j3oU2+qpOl8lwT8qofR5rIuQukx
 FTmLi4lZJLjRzz8vtN8T8Hw4L9wG5KdX86HHW7mGtkPRIaBt4yZAbD85TH3tfn45ta/C
 +Wq7Beo7qgB4NyODa9vLosbc+VDCRkUvC0GWNjDSRQsI5soyOVyJWFJXriVpnjrQLFwd
 E4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fh7DFu4XKWjYbSJ+Cjp1/tLglXpgvD0yDYhrX9eTXV8=;
 b=U6FIOmhqjH5V9BYXYSpZRXg5Wpfd7KJswkuVtN0k2vOHDZ+dkaB7TPNE7tYVndi6yS
 E0tIzpR++UKfgTAfeltObz/oNANfdVlKwssOROr8XadNXxPplAzE3ABYoHj50d9otZOO
 pEBVVn34RJHUBuLGvWFUzMhsb4LZ+h058Je67waIlOgS5QX9dTUhUHHokdLpuT2C5sSH
 4+i+EOM38vv5hBTZFqzmZ4Omxd38MJecMv7+WVED4JNXS97psyAwFTJ34lhTKWv12yny
 j20xG7mq5ume8G1/taRyy811pRKFE5DxebEkSlc5sudpuMl3deRsIDGUMfhJNq9EdEKv
 imCQ==
X-Gm-Message-State: AOAM5339WjYEh/UnyF2moMLdRiAQEsVxeCjXLZYr+nLKdispCN2ng8YZ
 SoXV334xKBpbb6wFn+iqzGRYYYv337H9pw==
X-Google-Smtp-Source: ABdhPJyC45TarsCjs2rT+TLV6TixxtReb/HEdEWooBMRc/XSNjKmvDe3lGXIb4azep/jf6eDsLLwFw==
X-Received: by 2002:a05:6a00:1147:b029:3e0:8c37:938e with SMTP id
 b7-20020a056a001147b02903e08c37938emr8080954pfm.65.1634850364247; 
 Thu, 21 Oct 2021 14:06:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 32/48] tcg/optimize: Split out fold_xi_to_i
Date: Thu, 21 Oct 2021 14:05:23 -0700
Message-Id: <20211021210539.825582-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 8dfe8694da..78e2ff5b38 100644
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
@@ -1076,7 +1086,11 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
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
@@ -1738,22 +1752,6 @@ void tcg_optimize(TCGContext *s)
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


