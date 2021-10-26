Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDDB43BE29
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:51:08 +0200 (CEST)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWDj-0004QQ-Ny
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaI-0003P2-DK
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:22 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaB-00021C-4A
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v20so638329plo.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YxTcI07P5KgjPUJAeZlSj6fs12sCJJNKN5YAni+jya0=;
 b=Kgqx5ALSKO/OGZtx5F9sNF4T1sWZFznFktoBCQ4gpuUXJAj2z2FEXtJ1OOvVjfOgBu
 9iTII7bq16Jc4jYZD9GdKANyeNwWHp8F3QdNxqHdUhACS3+pKH6XlLgT+ic6Kj1QjmO+
 MQ8gdzYdy1mpIDT14yHQ2d44SRXdwWwSEFlMok2hISmswTRMOomUfdt9kAAcJtRWk+PH
 iFO/w3Tleb/ynl4IWxUrpZicgKTRIglRFlkHu7jo2kLCdQbogDXwjCBNzgNmqzVfFfj6
 egTTEy0+JexaZIDIpvbbSF27vKalyUQykuyk4rXG8je3raAS5VNYdErgmYg9+en5XHgj
 p/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YxTcI07P5KgjPUJAeZlSj6fs12sCJJNKN5YAni+jya0=;
 b=mf+G2VHqGQ/JY/voB8PVKuXqWzGeP6nDJGlyBbGGfqkPrO2JtDbtWMGkSzmPmMOyYc
 di0iqndAxRhC/4X6TRmCUWHbqNiXePboYeo14OWy4KQsVbMFubAekblrxHSirxdp9Uo7
 O8blSegbQAbVBJ0qNyTWB8wBCyZDy9bLOArWthhEZCDkAXHeU11YO4bKRYOr1uVbuiFx
 lxWidaUQx0vb/BgKm/WqvhQVgsBTfhKSKLpDchmifs94dynta7xYZEKWmmS8ucCOIF+v
 +S/psZveoNj1BjaM44WM1xJRtt9y8+cwchuC+EefjpsVEZH2GSiCDifGBquH1/QBtL2h
 9pBA==
X-Gm-Message-State: AOAM531e972LRjR5apxgoZ3RdGcv+x3nf0RokjnfkTD6wwsYhPBGrZjy
 kVg4z5d+7Ye5c2jUd5QU7b/Fjb0dA6xnXA==
X-Google-Smtp-Source: ABdhPJyXD+xTdg2gqXjHpYQ6Dv795HMGEx6uQiSeRvm6m5M8/z5BLCWanSqLf0JELwyoJ9hVYtM/vg==
X-Received: by 2002:a17:902:d483:b0:13f:342d:ec92 with SMTP id
 c3-20020a170902d48300b0013f342dec92mr24869773plg.67.1635289813813; 
 Tue, 26 Oct 2021 16:10:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 32/51] tcg/optimize: Split out fold_xi_to_i
Date: Tue, 26 Oct 2021 16:09:24 -0700
Message-Id: <20211026230943.1225890-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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


