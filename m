Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB9943F6AD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:32:24 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKV5-0007jN-Ba
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdl-0002X6-SW
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:17 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdd-0000MJ-Vk
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:16 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so6505538pjb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sNZW+SE7IkpCycmJxNFsxBL0QVYPzgqHpcz72Yg09Ec=;
 b=lbCBOdrgkyFMoy3VnaIexBjKaAO6WEZQQii25kdGJBAf08/8eo0MflE5nRWVdfyOrU
 mij4l2YeD59d2KYdcDwfVCXuWt5MmAspITTC3NcYvThNALnOFb2T9Ka3OtZ8zvKRUGAF
 eK8mH327pxEJFgQqMRer2r/JLXotvpKRjsgLPiJiZbpDMi+YDyxTnsxwEdE5ljAIOpDT
 gpvYiUgS2/5sVbDSqCHGAoGabsZa3R1uKCJmS4LWv+kNG0QIZq9EroASaAT0DpBUJpLm
 WMiEFuTpclLkhZloi3+76TrWF3chnj213Vfzc94DT8vjutTUL0Kua2uMIRfLDL2F429y
 P4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNZW+SE7IkpCycmJxNFsxBL0QVYPzgqHpcz72Yg09Ec=;
 b=L6H/nl+ChEa0Pj3mfWgJy+LxFJz1XH/kOGaIMyDvZ7Jzi9J968ms8om4HL9aZBYoYW
 qE6Xv1AISvjx3t7H6xodbk1arJ5vIG2wheBjIN8JkmPF1yob6bCFCFp8ZHkF3gqjrsHo
 85IqMoHZkb8RabuiISZQPXbN5/xyjj73elXgoXbrkr1s+GS/z/OCwtUFe6eCXngNMweH
 L83DYrLxqIQiWXH8J4wGRWwDFL04b+G1UuG19s8dIvyEIDoxzQjXTRUIIxMvaBo6ZxDL
 bMXHLbJH1xLmYjBog8tOLHV1vOuDqbBtrasNlq9t/lLFCqE0HR4vPehUmhf/zi3M7e1o
 GJtQ==
X-Gm-Message-State: AOAM531czkl6u/QZuWdonYyqXc01swWq8RodsKlTXyLzbxMYYrltjUJC
 mKOyARSTUju4AoRm6LK83CsAVIXhEnAM8w==
X-Google-Smtp-Source: ABdhPJx+gAGMH2/abxwD6yDA/X81ZRd7hETsaZX8Ty1yVVxuIz3DnmhYPheWChpWUjvXypJ0srdp0Q==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id
 mw15mr17391678pjb.207.1635482227756; 
 Thu, 28 Oct 2021 21:37:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 45/60] tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
Date: Thu, 28 Oct 2021 21:33:14 -0700
Message-Id: <20211029043329.1518029-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to fold_addsub2.
Use Int128 to implement the wider operation.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 65 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e2ecad2884..f723deaafe 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/int128.h"
 #include "tcg/tcg-op.h"
 #include "tcg-internal.h"
 
@@ -838,37 +839,59 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
+static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
 {
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3]) &&
         arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
-        uint32_t al = arg_info(op->args[2])->val;
-        uint32_t ah = arg_info(op->args[3])->val;
-        uint32_t bl = arg_info(op->args[4])->val;
-        uint32_t bh = arg_info(op->args[5])->val;
-        uint64_t a = ((uint64_t)ah << 32) | al;
-        uint64_t b = ((uint64_t)bh << 32) | bl;
+        uint64_t al = arg_info(op->args[2])->val;
+        uint64_t ah = arg_info(op->args[3])->val;
+        uint64_t bl = arg_info(op->args[4])->val;
+        uint64_t bh = arg_info(op->args[5])->val;
         TCGArg rl, rh;
-        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+        TCGOp *op2;
 
-        if (add) {
-            a += b;
+        if (ctx->type == TCG_TYPE_I32) {
+            uint64_t a = deposit64(al, 32, 32, ah);
+            uint64_t b = deposit64(bl, 32, 32, bh);
+
+            if (add) {
+                a += b;
+            } else {
+                a -= b;
+            }
+
+            al = sextract64(a, 0, 32);
+            ah = sextract64(a, 32, 32);
         } else {
-            a -= b;
+            Int128 a = int128_make128(al, ah);
+            Int128 b = int128_make128(bl, bh);
+
+            if (add) {
+                a = int128_add(a, b);
+            } else {
+                a = int128_sub(a, b);
+            }
+
+            al = int128_getlo(a);
+            ah = int128_gethi(a);
         }
 
         rl = op->args[0];
         rh = op->args[1];
-        tcg_opt_gen_movi(ctx, op, rl, (int32_t)a);
-        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(a >> 32));
+
+        /* The proper opcode is supplied by tcg_opt_gen_mov. */
+        op2 = tcg_op_insert_before(ctx->tcg, op, 0);
+
+        tcg_opt_gen_movi(ctx, op, rl, al);
+        tcg_opt_gen_movi(ctx, op2, rh, ah);
         return true;
     }
     return false;
 }
 
-static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_add2(OptContext *ctx, TCGOp *op)
 {
-    return fold_addsub2_i32(ctx, op, true);
+    return fold_addsub2(ctx, op, true);
 }
 
 static bool fold_and(OptContext *ctx, TCGOp *op)
@@ -1725,9 +1748,9 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_sub2(OptContext *ctx, TCGOp *op)
 {
-    return fold_addsub2_i32(ctx, op, false);
+    return fold_addsub2(ctx, op, false);
 }
 
 static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
@@ -1873,8 +1896,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
-        case INDEX_op_add2_i32:
-            done = fold_add2_i32(&ctx, op);
+        CASE_OP_32_64(add2):
+            done = fold_add2(&ctx, op);
             break;
         CASE_OP_32_64_VEC(and):
             done = fold_and(&ctx, op);
@@ -2011,8 +2034,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-        case INDEX_op_sub2_i32:
-            done = fold_sub2_i32(&ctx, op);
+        CASE_OP_32_64(sub2):
+            done = fold_sub2(&ctx, op);
             break;
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
-- 
2.25.1


