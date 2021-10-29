Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9643B43F66F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:03:23 +0200 (CEST)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgK30-0006OL-ND
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJae-0004pP-U2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:04 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJab-00080Q-0w
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:03 -0400
Received: by mail-pf1-x431.google.com with SMTP id x7so3094773pfh.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8y4qKou3t3jzIUIj9qEAD2/5WFZAuzm9armlPHHtAYM=;
 b=XLvxUz27kEiDNar3H9ZuDXHvapTjoDY71MnDRa0rhMFPzzKksS/35qhCTggtDkQGOk
 L9XovJIOr+ilquMXMqx1HbZ1YEjcRbuyDKxtpEzN/A3KqXq8fygnmKV8+gILkT4OEoEw
 QOBg+LdeEDViZ5UHkLqEoBGJXrKutlnOcp0NQamDYD8nWPkFrlVWXk7FwQeERRkiZnjW
 rT4H1epa+RFSwcD6XdszGHHThHpv+WicxA/dkRdTxYXhzqjbgHpRnWDJ+mSpCmTf2Nk+
 lpLZoN3LQwYgcknYlNdLA0UiFAMqrd5mCoGbYbUmSQFi0tyzezLvHIKcXNcKM0XyX59V
 Eumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8y4qKou3t3jzIUIj9qEAD2/5WFZAuzm9armlPHHtAYM=;
 b=1zO0EkbkO0Jukg37vR0zSj7FHpbN0qbIzKRKNOPx+uRYg3AUQwTwBQCT1bFrTU9Mn3
 WlhLvt+DdCUOQRvbu2vJJjCROxGmNfCh821n6chOghTEc37XLBX5TMAli7tyJ3v6BY70
 pBqlH8WcIjUHwQo92mgh+ElSx5UnOOkUm6p7ehN5FXf+V4ItA5P5kQWTHGLxjiHB9aJJ
 LTljl1RjPGOEatEclqqdfeCnmlmn42YIaV/WJv2Yx5RdmRRmnpmhIGjcL3TmWuYFqMiS
 D5ubuUMiSFTSNvxnabmtRza5OgNGwpuTJ8+53yRzdTuiosgeaeS/gPxWLWXKAtlhw8Ht
 IVlw==
X-Gm-Message-State: AOAM533vtpHBRmPTfaXdFoc9kwylcrVfbE2MGR0xYAIdkXulST0G6F1u
 SOCBEuG5FMliUkliIx8pM9i0oSrT86hKTQ==
X-Google-Smtp-Source: ABdhPJzV3RMQcylAo30vEqUHHwkQxXoaHHdu4mpjMPdQmwPod4pIOFOvx5DLadT4WOqEuAqUx5zHQw==
X-Received: by 2002:a63:6808:: with SMTP id d8mr6344134pgc.72.1635482039749;
 Thu, 28 Oct 2021 21:33:59 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 35/60] tcg/optimize: Split out fold_xx_to_i
Date: Thu, 28 Oct 2021 21:33:04 -0700
Message-Id: <20211029043329.1518029-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Pull the "op r, a, a => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5f1bd7cd78..2f55dc56c0 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -695,6 +695,15 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+/* If the binary operation has both arguments equal, fold to @i. */
+static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (args_are_copies(op->args[1], op->args[2])) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /*
  * These outermost fold_<op> functions are sorted alphabetically.
  */
@@ -744,7 +753,11 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 
 static bool fold_andc(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_brcond(OptContext *ctx, TCGOp *op)
@@ -1224,7 +1237,11 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
 
 static bool fold_sub(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
@@ -1234,7 +1251,11 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 /* Propagate constants and copies, fold constant expressions. */
@@ -1739,20 +1760,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expression for "op r, a, a => movi r, 0" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(andc):
-        CASE_OP_32_64_VEC(sub):
-        CASE_OP_32_64_VEC(xor):
-            if (args_are_copies(op->args[1], op->args[2])) {
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


