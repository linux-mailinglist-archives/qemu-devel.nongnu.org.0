Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FDD43D9B3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:13:09 +0200 (CEST)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvqm-0003IM-F0
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMR-0004iu-5l
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:47 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMP-0003O0-7Q
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id f8so3359740plo.12
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sb5338wSOtydZnMtxZpM23PXTg/PYHbWm33mLw5BH3A=;
 b=rXEQ4MBDQ19Kcu0ZFpeSNNT4gR//tSRHpCkjoHVjc1qR26IMQrFQg6nUeiGqZXxLMR
 p+ZozdsvDlQT1H3QJAcvqD5rcV6g9UqnnR4YhjEZ1D5QgPBikTQSpCuQ8ZxPvUPOYSi8
 /SdewU5R9jivZP1pZ4ftU2i014xMmV1ndKsdw5limDC4H+ZHzjh0FyJSclqcA6GNAtKH
 umhVbNeayjwS5HV6ZmPF66cSSDt44UGOz4jAh8h7HnNv8ACem4ZxjK/fxVZHt3273dhD
 SPV6OePlY9q2gybaRpjUTjJRP9jz+ioYDzOM/nwSOAHcKduDFrN3gccwF/3Y2j0amzbe
 eCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sb5338wSOtydZnMtxZpM23PXTg/PYHbWm33mLw5BH3A=;
 b=usPUjBWIEcWiGo4S7Xfv8rDgnfXj1TGJZCwzPU1fghiMn4MXNOpxajj+u5nY54ZbXs
 uTPl4BOi5h0+kssf1tGdWfnBLckjCqBxm5Kp3m1Fg0sAS4ISArUkQGXXWgRrFobC/Tl/
 pak4kU05NQskorp9eAzrTeWMYe14oc0wsJSmIM57z0sr1x4VvdbBV6u0BPberfJJPf/D
 nzt7ue00Ao+OvE1GUz+KJjtdsrOhPEafeavshVO0MLXAy3vv2YsxjrQ41jWNAxxLeVhm
 vwcu9txjMV8F+x8tkDUTBYIc4PKKsddAdD8YKyth6mUqNuP+pjshRh2BCcjBFV03cLct
 WA+Q==
X-Gm-Message-State: AOAM531z7qF+VNgIMfPzZZ268sMVBNSILOCpxIRiSd6S8rX4EFPtofhm
 3VY54jWFRep2EmyALLg8CJaCJ7J+6hOZKw==
X-Google-Smtp-Source: ABdhPJxC6IWF+HFwYyHRQgLf4ldT2TMM/buq35fXAy8GQrkREbbmQnMKMXqWAyaW9p4w3EN9Ap8t4w==
X-Received: by 2002:a17:90b:1952:: with SMTP id
 nk18mr2494368pjb.135.1635388903969; 
 Wed, 27 Oct 2021 19:41:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/56] tcg/optimize: Split out finish_folding
Date: Wed, 27 Oct 2021 19:40:52 -0700
Message-Id: <20211028024131.1492790-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy z_mask into OptContext, for writeback to the
first output within the new function.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 49 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 066e635f73..368457f4a2 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -48,6 +48,9 @@ typedef struct OptContext {
     TCGContext *tcg;
     TCGOp *prev_mb;
     TCGTempSet temps_used;
+
+    /* In flight values from optimization. */
+    uint64_t z_mask;
 } OptContext;
 
 static inline TempOptInfo *ts_info(TCGTemp *ts)
@@ -629,6 +632,34 @@ static void copy_propagate(OptContext *ctx, TCGOp *op,
     }
 }
 
+static void finish_folding(OptContext *ctx, TCGOp *op)
+{
+    const TCGOpDef *def = &tcg_op_defs[op->opc];
+    int i, nb_oargs;
+
+    /*
+     * For an opcode that ends a BB, reset all temp data.
+     * We do no cross-BB optimization.
+     */
+    if (def->flags & TCG_OPF_BB_END) {
+        memset(&ctx->temps_used, 0, sizeof(ctx->temps_used));
+        ctx->prev_mb = NULL;
+        return;
+    }
+
+    nb_oargs = def->nb_oargs;
+    for (i = 0; i < nb_oargs; i++) {
+        reset_temp(op->args[i]);
+        /*
+         * Save the corresponding known-zero bits mask for the
+         * first output argument (only one supported so far).
+         */
+        if (i == 0) {
+            arg_info(op->args[i])->z_mask = ctx->z_mask;
+        }
+    }
+}
+
 static bool fold_call(OptContext *ctx, TCGOp *op)
 {
     TCGContext *s = ctx->tcg;
@@ -1122,6 +1153,7 @@ void tcg_optimize(TCGContext *s)
             partmask &= 0xffffffffu;
             affected &= 0xffffffffu;
         }
+        ctx.z_mask = z_mask;
 
         if (partmask == 0) {
             tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
@@ -1570,22 +1602,7 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Some of the folding above can change opc. */
-        opc = op->opc;
-        def = &tcg_op_defs[opc];
-        if (def->flags & TCG_OPF_BB_END) {
-            memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-        } else {
-            int nb_oargs = def->nb_oargs;
-            for (i = 0; i < nb_oargs; i++) {
-                reset_temp(op->args[i]);
-                /* Save the corresponding known-zero bits mask for the
-                   first output argument (only one supported so far). */
-                if (i == 0) {
-                    arg_info(op->args[i])->z_mask = z_mask;
-                }
-            }
-        }
+        finish_folding(&ctx, op);
 
         /* Eliminate duplicate and redundant fence instructions.  */
         if (ctx.prev_mb) {
-- 
2.25.1


