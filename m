Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3EA3FB124
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:27:23 +0200 (CEST)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKalJ-00075h-EN
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajA-0003lT-2i
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:04 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj8-0007Tr-C0
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:03 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n4so834375plh.9
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=liy2IxUxYk4Q9x1eucfRtbE1W0cpiKHniKE8oZoSFNA=;
 b=IKnLndzdedR5YHvGL6RJon0e+RknnS6zFHiNQNUaSNBHxNMNTtQhSaGs09ZcaY6Rgo
 jssl4sS5LfhuriRM7DxhrI3mZntCq9hgF9T+RBezoYwdMNvuZwaCMnnx5JWOjMgfFZHq
 J88vvG5TEWJYw49L551rRRgfW49qhAQgw/luNqwicZx/BN7gloMSB5U+3kqM/4oefimb
 NQKo58UJySmHFglKepOhWg3mg7bZZivN/9CUVTOCrqG9WUcKM7Vn+M1iXVOCYB45zRNV
 gosyrPv6DTwm2VkHVnC3Xk70FYo8qL8rqh/jiEUxFZZg8G8d8SjBjyQ0Ey0GjbROoAHU
 /7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=liy2IxUxYk4Q9x1eucfRtbE1W0cpiKHniKE8oZoSFNA=;
 b=DqK3fGbPbxomu8ir1bW6PUz4ccJ7TuQARAOnSlQQheZyL/+wy+cQ5owymPRxb314VQ
 YlemPa/ryS0s1PGUveT77MLe+zVTYePZ2YOcACeF+nE56nuH5n6zxHuZEajKMPK4536f
 7/61B6BZoh2CBM6ekTi+aL8IXy/BJUQRroFxJ2a6LSpwWtG5BQ6oOI7lK4qWRuIOCRvn
 1/5I5c1Vbsiqho0heK4V/0d1WzeJaMBP+3+c1cG1fHUwPimrkjyBfcwi2UkYfnAIBAo4
 52EWL8QTgWai4X9q0j2ksndHQvJIFg+HLw9FRGeQcyc7UxC6HGyyUntTUm2y4TG8lbcV
 ECZQ==
X-Gm-Message-State: AOAM533bYyLw3QHTbAgfgKketRzBKIYpZb/5a00KaHkJAHJ9sVwKR8oC
 ALLcwyh3E6dt2S9dQgcIbtqUFQ3QWvYMpA==
X-Google-Smtp-Source: ABdhPJyDaxwgmjnC8U6K2HKFzl0Hz3zyq3SscskzpuMdqD7D2egZ0KPMYztSzDEfYxPbrswBu1aR6w==
X-Received: by 2002:a17:902:7803:b0:138:c171:c1a4 with SMTP id
 p3-20020a170902780300b00138c171c1a4mr7006897pll.48.1630304700960; 
 Sun, 29 Aug 2021 23:25:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/48] tcg/optimize: Split out finish_folding
Date: Sun, 29 Aug 2021 23:24:15 -0700
Message-Id: <20210830062451.639572-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy z_mask into OptContext, for writeback to the
first output within the new function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 49 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c4559d32be..d202515369 100644
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


