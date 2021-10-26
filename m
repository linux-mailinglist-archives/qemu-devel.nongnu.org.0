Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C2443BE2A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:51:17 +0200 (CEST)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWDs-0004bg-OT
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaM-0003Xn-C5
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:26 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaH-00025M-D3
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso3550882pjm.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKMWDGbunLx5T4t+f20qgfpyiKn0M08bSNTZbum3miU=;
 b=GkLqpY+9qKB/gDKGoHlm6VJcelTx1say+WiaYCBM+lpHp5EDsdM6LhJ3ktN9VI6xc3
 hwGHL90m+MdD36WsF7DctCoae0rrFHyR6i5EUfrWB9dsNDZ8OCoP1325cLl6XN1Y53X1
 3Y7cbBlgnh8g2VrQFzXDsdeB3cL3n79xcPlNAvNrvhBzE5OpkoSeEhjL5PVItxVv96tw
 VbcFnIN5snrUoecDBWhtN9sSt/iuPCyvxyXadF6S3QDkkKD24etO4LDUN8hLbCG3Wogr
 63cx/mBgMoqk20BlgOxNWxgmaYVk8fQph5nw5GEhHFIQceXwBoFNvvwQsgYSfHPOWMWm
 mOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BKMWDGbunLx5T4t+f20qgfpyiKn0M08bSNTZbum3miU=;
 b=CInpIO2e+dNqgGX/usnkLPiAxs8VrWvJEOhVA+1hGk5d+BimwehroMkXeQsSMYI7Vr
 n85hks4TDEjv5F5BVjIRkcAb10VYJppTqOLXLq74F0aNwuKMeUiGLLngqU0P25gt1tAo
 b8f5rLoQrLbtd9ZUt6S+yxjj7WwLVSzLh2fXm6a+pRlvhOgBvVs22GYjXB75VuhlbOq+
 AxCH2puzUn2LXQzIQhbSpnFVikhF6OB63IkIGgAlcF0vnM1WCdDHlfP9FRFUL5ul2WzG
 DDVVcD2Q5nzJ6nE1zdO0fqeSTJJb0A9qdlh/0KEtwRwioTz2rQkJmPy0GLVktQUOoTBF
 yHSQ==
X-Gm-Message-State: AOAM532V2a8FsbGK/r8w7ENnpJfH1EWhEpP/R77qcXwgHPyrJeuORqA+
 L2X1aJGUksAZR4n07n+XOWiLx3ALKRU3jg==
X-Google-Smtp-Source: ABdhPJxOD+9QPXi84UuJ+LmlqDz4DvJxnFOoJHOPnGLJzcqFX1Bi9XAsk5QtbHVTu4VwrmXJqwIFFA==
X-Received: by 2002:a17:90b:3505:: with SMTP id
 ls5mr1908646pjb.31.1635289820172; 
 Tue, 26 Oct 2021 16:10:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 39/51] tcg/optimize: Expand fold_mulu2_i32 to all 4-arg
 multiplies
Date: Tue, 26 Oct 2021 16:09:31 -0700
Message-Id: <20211026230943.1225890-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
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

Rename to fold_multiply2, and handle muls2_i32, mulu2_i64,
and muls2_i64.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 44 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index cca1e37256..7597655a43 100644
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


