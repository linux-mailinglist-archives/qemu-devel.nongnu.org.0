Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E72436CDA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:38:14 +0200 (CEST)
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdflN-00042q-4h
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGS-0007nE-ES
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:17 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGN-0004mt-Jv
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:14 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so412867pje.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bbujJ/Gml0vlPkv2W75zfuI+JolLNfHI4JOjGTTLUJ4=;
 b=NyC7rn3FwDvI7J376V4y9ywTqYXhg9C/LIOqYUiiMClvNmlgufvpiSWDRYS62i7ZMp
 CLE+c1WKvzLHBWlV+BOKKUwtLQRYxGK/FEayj9uXdXwyBt8RKPXIbu5fPRCQn5owkSww
 /IARg2EGV1YH3y2FkoZfeCv1NMXIKa8b2J8lLI9vUOF9EdrGDNPseTMqkAEs3sq5ggZ7
 AnQcLWTXC9cOluzdbK1VcFlfSV6dzZtXUTeG5ykAP26pWDX+P9+Jz4VaFz0Z3He/WLB2
 DPYXahBx1cHpFG016r0lhzWislKvrfC3CEkyElBujC7miUs8bnTqXJhulz4ni8YsBrTv
 RK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bbujJ/Gml0vlPkv2W75zfuI+JolLNfHI4JOjGTTLUJ4=;
 b=p/u9tkeXjIHs5A/JfO8EDBjKEAh0Age4mifK44H9nreUU0Yb2ozJ6TYZjaHO1xJtw/
 ovqSs1MkbPM/B6NBZGt59e9qXXez37kjKcXe4hZRcP68l4rIH3V2MKkRzXTxQRJcHvpC
 s86YG5DTNxoHRi+Dhws8gaXqoTio/f0O03Zu6jY3l20nQEnLys++jQTG3JeirWc5h205
 NuOcE15qkPx3ZXKyRMlRPPnwPRzrtMrcBYWcAvlXYwAhJul1Hj1Qt9Tfo1BOmFU8em7w
 cyawsqYV7/XJMQPrLtd+qNj1XRHk+8oGThputrgi6EojSv6umrxv7NpvD51Qk9zQZHYv
 qdWA==
X-Gm-Message-State: AOAM531jEBu9q6UAke2ApsH7zniVd0qoRd1TTlIq2M4cj2gw4GAjq8Y6
 3j9kbE0fXT5m3D+bgC67fqtBeSJ7vOE0jw==
X-Google-Smtp-Source: ABdhPJxiLSDl+GYthv3EgiMjLKRKu4pJieC1on7OR2/hkTampkC7rGEDuzj9Qq3K9G8gyigziC/xxA==
X-Received: by 2002:a17:90b:4014:: with SMTP id
 ie20mr9779827pjb.146.1634850369941; 
 Thu, 21 Oct 2021 14:06:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/48] tcg/optimize: Expand fold_mulu2_i32 to all 4-arg
 multiplies
Date: Thu, 21 Oct 2021 14:05:30 -0700
Message-Id: <20211021210539.825582-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to fold_multiply2, and handle muls2_i32, mulu2_i64,
and muls2_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 44 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f0086ee789..efd5f58137 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1398,19 +1398,44 @@ static bool fold_multiply(OptContext *ctx, TCGOp *op)
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
@@ -1910,8 +1935,9 @@ void tcg_optimize(TCGContext *s)
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


