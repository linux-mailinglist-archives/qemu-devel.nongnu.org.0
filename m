Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304F436CAA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:31:45 +0200 (CEST)
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdff6-0000Kb-AM
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGL-0007fS-E4
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:09 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGH-0004bT-RL
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:09 -0400
Received: by mail-pl1-x62a.google.com with SMTP id t21so1283838plr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+uohhzNTf7E5o0HvirytHnR+Nn+FzxrY7IKuf21OlIs=;
 b=uoTduUiw0VNq2G20WtL0fK3YpHmLXYFNyhYdb9HjDo3WnkBPEcZcivjB8fXIKoiDNE
 ukBW6FSnLV1lwmpnn529Yf7h62Tig1675XOUZutQleRMOwwG3qgp024gXBHoUybO4YF2
 v9yR0bnREiY0Cd9Mwwn4JFBKZZY9af0IWsfm/00cTiA1opY4loDkB5+pXdSoMn0ro8VP
 c0zzBKd2pHgDHZSbqE854YUEiu8NwO3FsBz8R7bASm1kdsTaR473fsaYPkb5wRPSHHdi
 DwC2/6oh10r2y7i9rujDuqz3S+3cqnXWtJumpK/TBnTo7vTkfP8IUJwfh4Xa3ekXrVZw
 2NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+uohhzNTf7E5o0HvirytHnR+Nn+FzxrY7IKuf21OlIs=;
 b=htJxo86OIwsmamcOynzbOWFhx+wImHY0x01Lny/l8CFHrco/S30NjS91+31eG7er5T
 lNpLOj6ATtAYcbLc258FPT15AHSQpNvcz9/j/Nofu60k0Lk5d1Tktz2S63IKmUW/6GmQ
 TAXOoE7ACM1coSY4Enc9PmEUCTwmOLmIvOyDuONV3e4v5bdNuRDiIKguq74B6tJw/mn5
 GM+Lm/JYQaGGy1MI8xAEFaZTEOWiXVjpc/bOPVUjRnVLMZ4PDlnrr22y5PCDSJbjDSSS
 Mh3F+2aXRvWQkLhrOPMz4aacUp+gL+tW/bsnEmzFF07dWKP91Q1L73HsqWj9SgKGYlmG
 SoZA==
X-Gm-Message-State: AOAM531zsvuEJoEs+h6bM1VGs4pdX9tlB65PtxsjOSgIyl7mUNQtGta4
 ZrdCTuBg+c/CMw4aFHhU4eyGKqrZdKc=
X-Google-Smtp-Source: ABdhPJwBaL73rFpIU7z59vDLIvTDgSx/wUMVyN0rIudoC6L4aqbtHA9I0M6SxrKSwfwwvITp5yruZA==
X-Received: by 2002:a17:90a:6b0d:: with SMTP id
 v13mr9331861pjj.138.1634850363487; 
 Thu, 21 Oct 2021 14:06:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/48] tcg/optimize: Split out fold_xx_to_x
Date: Thu, 21 Oct 2021 14:05:22 -0700
Message-Id: <20211021210539.825582-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Pull the "op r, a, a => mov r, a" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5ac7a45597..8dfe8694da 100644
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
@@ -1101,7 +1119,11 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 
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
@@ -1732,19 +1754,6 @@ void tcg_optimize(TCGContext *s)
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


