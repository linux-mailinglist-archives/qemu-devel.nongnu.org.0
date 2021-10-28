Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E87943D9C8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:19:00 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvwR-0000ZG-6r
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPk-0001a1-Bo
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:12 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:56139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPb-00065A-92
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:11 -0400
Received: by mail-pj1-x102b.google.com with SMTP id om14so3569114pjb.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRRRP6JmvKBpZ0VJ9BwC7heQ6m7xhbcAt+61FCJAiek=;
 b=RZKTdaDFlLejimHaHk4cxnDD77ufpxatfxLfpHuoFFLXcV1NQTqj5ypbFN9QZxjAAy
 LfPcEsICkQIK8a62UWad4yPGClDMGQJLMPtdh6N7HruwJMG+judshRk/eUShF3a+/RJu
 Hem9O/fe5POalpjsaR7Wq2+abXbtm7fgb+Wbc+JvZsi4Xl+XbCN4qyEdMNYD8l+q99Cu
 16L1+XNmZwDbKqKVWgPDYTsEEHELMY0DHJN8l92ujT5iUHyKstvEMAAO0yBDKpG8rOQe
 jfe+CstSRewThdZV+K1IVPa5Ntvu9XPBdANYISrxr7U6/CV5UeTB/qqRIujNsxeW1S9r
 +41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRRRP6JmvKBpZ0VJ9BwC7heQ6m7xhbcAt+61FCJAiek=;
 b=iJoJ7Jr/M/SjN6dabY3CdpIkKqm5MZwCpF46DA6ADvtz5lh1uZxQEG1TegWtbPtmIN
 2vY6OzXB6Ry3AstEa2HOjSJwvHKjKM62ihlYTOEc4Xd7y7lHOJMx5OQUSgSRXQ3l1X+X
 YVLqQNMteoT3bwrYAdOsrtA85kXfvPbpIgoDLLb3K3ecMM0J3qkVrurvhlS9vJ20Rvqv
 wV3FMhYBmghoq9qWlOn4hWlI0kc/c8vwSadBl6+PDdKWLwf/JHXAfVNxNJ71x/CF15mL
 ERPRtKKVUVkHaxddNjtWKb39fjNNxvBvE+sq1UV6S0TnuFZzhug5aXdwrGeOuXxctlTg
 47AA==
X-Gm-Message-State: AOAM533fS96q4VqEo341cMKR9zT0CdCyIcFwOvXf5/YGP+QwEDgTEevz
 8FkjFiiakrDsGsf+KjSrAROEnw76oIe6bQ==
X-Google-Smtp-Source: ABdhPJzJfXY5NNEzjtSLfqjlKRug9AIIXfm47Wq0ZWo5AqCNZ1+oAeo439QRHjKakbVorgYjLooO7w==
X-Received: by 2002:a17:90b:4d8e:: with SMTP id
 oj14mr1595146pjb.160.1635389101999; 
 Wed, 27 Oct 2021 19:45:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/56] tcg/optimize: Expand fold_mulu2_i32 to all 4-arg
 multiplies
Date: Wed, 27 Oct 2021 19:41:19 -0700
Message-Id: <20211028024131.1492790-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


