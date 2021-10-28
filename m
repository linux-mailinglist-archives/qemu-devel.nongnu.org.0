Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0983643D99B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:01:03 +0200 (CEST)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvf2-0008CR-Cu
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMZ-0004qp-BE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:57 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMV-0003Xp-Cc
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:55 -0400
Received: by mail-pg1-x531.google.com with SMTP id m21so4887732pgu.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1Q9hVmZCD5h+WSzcvXil606EiQ6sWYW4OegtZB7+1g=;
 b=Bk9qZNQ07uJLdRdn0l0WX/1QWT9vfCmP0MfxT3iC7NIoBK+uKOZaZ3udPe56rNMVFT
 L4dnO3nxOOLulsdk5ni+FfoNP4GdOklaiHi3PgsHy9WpwFTJm0GnPfzw3tHRlzXqfSFK
 OElDo8MybUbdHhC5aKvknZkseYPJe1g9SGmW07s5VrwBV1axgaI17ymjQ39w+WHW7QP7
 dZuFIvp7DzHtPJoHQdCl2I6CQK03/hKfmh8r3/pupylS3smxI/P/YVxbZTeFdyNWJotm
 pY1NP3OtUnkMKJE2pxKbY8H0JFTqjflFOjMpQZIh4WDtl6n3zCmGht+uminXdsoHL6IT
 Usiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1Q9hVmZCD5h+WSzcvXil606EiQ6sWYW4OegtZB7+1g=;
 b=H5vfqJDzYwm/6MEtBpAAALaTW/n0L3GYq3zNDtdWa/YP1+Ev/cWtZD73B/ygtMt7V8
 yhzSOxn9dbOiicyk6erRNVV5DQhjlZFWLvMeqeW8bh4ccPC27i+M5uyBee1bLrZYSxlI
 QCxKnlxgeuc3ulN0qfLYwL0CHKbAl4bKn7LOw8zZWgGs7HLoriydVEEe4LB/ePQZWylI
 sVV2/EE1DLuYOsLB97OsOBltLgdpVAevOkbJwS1cHy6bdTetcGldzCbivAY0zoBt63CT
 0RYj42gkZW3HaRxTWGEz/FqwuN/giSQASKH+PmMKic6Pxlj4kw5Z52Sm1Vc7njM85Cvn
 /sOg==
X-Gm-Message-State: AOAM532iAWOY628AKuzccWwBW2kcdDoWdeRlEArRW+C9okbwbmjHidl6
 haQH/YH4HAYOvu1gxNJqsj2HRoykmbhUog==
X-Google-Smtp-Source: ABdhPJziDNBmo9VoVFehCaZUKwNFl8h6qTt7f8MZ76ZEBabBlNpQhsJPWv9nq1O13K6v6S9Qva0qSw==
X-Received: by 2002:a05:6a00:731:b0:44c:7c1b:fe6a with SMTP id
 17-20020a056a00073100b0044c7c1bfe6amr1385844pfm.44.1635388909293; 
 Wed, 27 Oct 2021 19:41:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/56] tcg/optimize: Split out fold_mulu2_i32
Date: Wed, 27 Oct 2021 19:41:00 -0700
Message-Id: <20211028024131.1492790-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f79cb44944..805522f99d 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -899,6 +899,24 @@ static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
+        uint32_t a = arg_info(op->args[2])->val;
+        uint32_t b = arg_info(op->args[3])->val;
+        uint64_t r = (uint64_t)a * b;
+        TCGArg rl, rh;
+        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+
+        rl = op->args[0];
+        rh = op->args[1];
+        tcg_opt_gen_movi(ctx, op, rl, (int32_t)r);
+        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(r >> 32));
+        return true;
+    }
+    return false;
+}
+
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1710,22 +1728,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_mulu2_i32:
-            if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
-                uint32_t a = arg_info(op->args[2])->val;
-                uint32_t b = arg_info(op->args[3])->val;
-                uint64_t r = (uint64_t)a * b;
-                TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
-
-                rl = op->args[0];
-                rh = op->args[1];
-                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)r);
-                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(r >> 32));
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1781,6 +1783,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(muluh):
             done = fold_mul_highpart(&ctx, op);
             break;
+        case INDEX_op_mulu2_i32:
+            done = fold_mulu2_i32(&ctx, op);
+            break;
         CASE_OP_32_64(nand):
             done = fold_nand(&ctx, op);
             break;
-- 
2.25.1


