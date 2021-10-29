Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE1A43F6AA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:29:13 +0200 (CEST)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKS0-0003vr-45
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdl-0002UO-0U
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:17 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdd-0000MA-9d
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:15 -0400
Received: by mail-pg1-x534.google.com with SMTP id b4so1648490pgh.10
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRRRP6JmvKBpZ0VJ9BwC7heQ6m7xhbcAt+61FCJAiek=;
 b=DrZqEtGH51bOeA5e2RNtplZ3Mp9JKjLtxHXI7uPRq/uyP04fvv/cYdN5V/Uj67xH+F
 QyDOB+OZSyRdIwuFkUYl3le9GJ/F2xoBeaezM3c6UduQkW/Pb0S32KRKXAgRvh0kjodH
 toczkiLIgfcf6lxsabmFP+QTJH+ASkljq/CGUKKmkZWqc7J45ILep1JqVd/iZK7WuRBc
 PA1vKPh48jaO7O2N/TQFrlrsgP1rOyrKa8kiexl2f012pEodAzKH8nHG1MDaU8vuyrfu
 laTvyu2XdczMPIKfoHdAexyW9L3iSkUYePAvV4gw3QuywSPaGNdBSHc+3NaZAGhfRBOO
 vorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRRRP6JmvKBpZ0VJ9BwC7heQ6m7xhbcAt+61FCJAiek=;
 b=q2iuK/0rD/yJghO77ObQROlasOQHKDji15v3IjDcGUczxr8QqSn3nohVf2Y4l+vnZ4
 QOgAUZSSW3+Zfgi7z+AJ7L0Ab4rLJoIha9TPPCxZzgtab20UIBgBe6peg7IoGwI11Y4a
 dDStsmg14Gd1hzFGqrVPwKgn0MPo7hvgrFaLXhvaiee2RpSfiYrl7NAw4j8f4pnzy2zk
 KlexiPC6e3VohT9xH81lC0lqVkGNky9Lb+3miNIcaBVa+twoipmys3iJfqR9/ISnJ5xG
 Jm9HXohYzojXCwAshLxqYtAmLqfVCA+loVyQCS+xcBNZCNY+5L4EKw1VrWdTl6S3q8Rg
 i7XA==
X-Gm-Message-State: AOAM530Zq0WwxRcqVxH+HTraC50n2J71VmGrqhjSYqWnCOwxMI77K+wT
 pjS9kGC5tPs8aCOQVeUEp14/cubJJF9hjw==
X-Google-Smtp-Source: ABdhPJybOhaDS8g0GywKaUp8M3PU8oHVRWYq+4YtQtM8baBfdw8H+wPuGaR+3OCNNi/sH4kGFQ9XFg==
X-Received: by 2002:a63:1c03:: with SMTP id c3mr6440217pgc.207.1635482226928; 
 Thu, 28 Oct 2021 21:37:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 44/60] tcg/optimize: Expand fold_mulu2_i32 to all 4-arg
 multiplies
Date: Thu, 28 Oct 2021 21:33:13 -0700
Message-Id: <20211029043329.1518029-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Rename to fold_multiply2, and handle muls2_i32, mulu2_i64,
and muls2_i64.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 44 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e84d10be53..e2ecad2884 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1412,19 +1412,44 @@ static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 {
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
-        uint32_t a = arg_info(op->args[2])->val;
-        uint32_t b = arg_info(op->args[3])->val;
-        uint64_t r = (uint64_t)a * b;
+        uint64_t a = arg_info(op->args[2])->val;
+        uint64_t b = arg_info(op->args[3])->val;
+        uint64_t h, l;
         TCGArg rl, rh;
-        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+        TCGOp *op2;
+
+        switch (op->opc) {
+        case INDEX_op_mulu2_i32:
+            l = (uint64_t)(uint32_t)a * (uint32_t)b;
+            h = (int32_t)(l >> 32);
+            l = (int32_t)l;
+            break;
+        case INDEX_op_muls2_i32:
+            l = (int64_t)(int32_t)a * (int32_t)b;
+            h = l >> 32;
+            l = (int32_t)l;
+            break;
+        case INDEX_op_mulu2_i64:
+            mulu64(&l, &h, a, b);
+            break;
+        case INDEX_op_muls2_i64:
+            muls64(&l, &h, a, b);
+            break;
+        default:
+            g_assert_not_reached();
+        }
 
         rl = op->args[0];
         rh = op->args[1];
-        tcg_opt_gen_movi(ctx, op, rl, (int32_t)r);
-        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(r >> 32));
+
+        /* The proper opcode is supplied by tcg_opt_gen_mov. */
+        op2 = tcg_op_insert_before(ctx->tcg, op, 0);
+
+        tcg_opt_gen_movi(ctx, op, rl, l);
+        tcg_opt_gen_movi(ctx, op2, rh, h);
         return true;
     }
     return false;
@@ -1932,8 +1957,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(muluh):
             done = fold_mul_highpart(&ctx, op);
             break;
-        case INDEX_op_mulu2_i32:
-            done = fold_mulu2_i32(&ctx, op);
+        CASE_OP_32_64(muls2):
+        CASE_OP_32_64(mulu2):
+            done = fold_multiply2(&ctx, op);
             break;
         CASE_OP_32_64(nand):
             done = fold_nand(&ctx, op);
-- 
2.25.1


