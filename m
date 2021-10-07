Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523F425DAC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:35:50 +0200 (CEST)
Received: from localhost ([::1]:38824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYa7J-0001Nc-1y
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUL-0000SH-1F
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:34 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUJ-0007hs-GO
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:32 -0400
Received: by mail-pl1-x629.google.com with SMTP id c4so4637517pls.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8nskxwkPEdtZ9CUJwGKk8ZbCvAbk0j+Jxy5B05St7jg=;
 b=Jt3K8i+NgZwuxjFtrFu+wUx9G5YHPJ70Nvnhk9kT0SX06FIsiTxFdxc49yWSvdNxdd
 YODVE/4fM8A5WODjUACLmdD9GqBaKdSaIE2XJxSu90cxlI8gKrl+bsiZxBNYdDpKL6Bj
 88R81by00wBF+3zIzwveIyF6z5UJIuVDNLg0ery2tS1Jkt0dnXHXwd25aN0Mjxr8kjMM
 iM3+3tJhPaGcDuibpMJktuQL0uajJvV7Fuvh3F9J6PCg9rXPAZmjpXUeNbvXDoqxJjQa
 QDeGH/LvaTf6KAzYg2L5z0OJZeD5fNhTMwxLN3Uc8X4mVmnDPR3agHDzagyQhgvwtvUH
 Qsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nskxwkPEdtZ9CUJwGKk8ZbCvAbk0j+Jxy5B05St7jg=;
 b=c7Zkba1kq4WTXMyEEOUYMe0MPunR+nB5Ez+F8AB7Nm5zxjclGkQi9p1O653eSuPFwS
 v+Z9A0DnQBuMQMIN9kmzxLhLGev8LZtVRpJLvEiwGI9sC8LKm7ZCFaZOVURUmgIdbVUH
 u41FTFzcu+FMcfVyntEfuabJbCOVTVgWxGXdGguSgXjMhFqZ/+euXWVjsMkqds/7Y2Bt
 MX9v/fW7QdecJfN8TqVwc+8PLDB/vbw+WjRFAnyOC63xhm3+5kaK3yBxyvFTXVGiBnIs
 F3qDdoolpRlmvqDSrhD00AP3UzWdpKupUD35laFUBF9e6+FkuO+GwzNc1GV9aLiaKUos
 CfHw==
X-Gm-Message-State: AOAM533J0umvLhkK2jxcnH0S7qpS7nuh5+o6FuTG/IHq6tVqxuQnC2BL
 a+8tTJUpYhuJ5GrUVWdnZtEvY3hRX5w+Qw==
X-Google-Smtp-Source: ABdhPJxm1quRGAKodWkpS7QnW5lzA5J60YIke9NkiZ8RnlX01gVUUNkICWBRuAJGm2cuXT/wStXeow==
X-Received: by 2002:a17:90a:a60e:: with SMTP id
 c14mr7715444pjq.70.1633636526488; 
 Thu, 07 Oct 2021 12:55:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/48] tcg/optimize: Expand fold_mulu2_i32 to all 4-arg
 multiplies
Date: Thu,  7 Oct 2021 12:54:47 -0700
Message-Id: <20211007195456.1168070-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to fold_multiply2, and handle muls2_i32, mulu2_i64,
and muls2_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 44 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index d82d0f15c7..0011ac31ec 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1400,19 +1400,44 @@ static bool fold_multiply(OptContext *ctx, TCGOp *op)
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
@@ -1912,8 +1937,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(muluh):
             done = fold_multiply(&ctx, op);
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


