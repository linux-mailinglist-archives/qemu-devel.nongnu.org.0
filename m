Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D8243F63B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:42:57 +0200 (CEST)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJjE-00010n-Ce
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaO-00042I-Vj
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:49 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaM-0007x5-SO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:48 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b1so4584826pfm.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sb5338wSOtydZnMtxZpM23PXTg/PYHbWm33mLw5BH3A=;
 b=vSQSNxr5b5FRqG7yjx7Vk1YXjf+XQQ08+ggFgMBjUG1xPoSuMdF/2j8qT59nZheKhl
 kPkUh65OJYczyehvtfTIpGKwPDtQHBBPXyi7JusvsHB7RHlP/TFyn2AN+H7aWYjboyQl
 WxjNPxwvHqo1YCy0UtnHKAoj/MrtwecYGSUreWTEBWnGm8FB+D+lsbBzIcu740S/AsN9
 6h7x7wXH9nzpYEozd9SOFubRcNUIIO/xkcTBYeJpLdDJaDsPH2kyhYHa0OznYU3XcSqp
 1NuDswLiifvP8fu80MDmaZFX6ONSXeoUGhlWtGVHSX0cRdT8qG24GUP/tVTtOHZoI7P0
 YvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sb5338wSOtydZnMtxZpM23PXTg/PYHbWm33mLw5BH3A=;
 b=O2/yuZcE5oYiqXXsZiAfSlId7W7BbDAxc7vpT1cNWQQ/9UgP0frco9xGfFLxMDqVFH
 /qgLGO7PVgeEHD85BftC/tx8xJYzjLYcYixq53OBlgNucdc5cgsCLHreuRvwRXuALu6w
 EgWm8jn2tLaOxLdN80vd/D3hpTWtOLrgm3gpGjGgTNxuH8JA89hO6cedHx4cuDS6xsPI
 utFHWhmEqEDzYNAHV8fYmEuaPXufGihYQ0xiiWnm/cEeR2Rd+MEaRxWedyDDvsMMjzXA
 FCYuC+VVsOLFTVye/oQdNJ9YyCO6fMEJcvSYy++7eOweabOI64Wlrqs4euSBYCemsLMR
 Sdqw==
X-Gm-Message-State: AOAM530G6ScLLOVOUTyDWUXHLjlZGHUcqSTr4DVyjTpS4ZhCKHLgT+qJ
 a84aIVHbEQINCDZPxzJbJXn/tHsULP1cNA==
X-Google-Smtp-Source: ABdhPJwZR4V6dX9cIttuY6coI+7iJA43LoLwVc71XMf8bsauQsroxKXblZjp+yDSe04u2LRV+zhdNA==
X-Received: by 2002:a05:6a00:23c8:b0:47c:37d5:430 with SMTP id
 g8-20020a056a0023c800b0047c37d50430mr8655377pfc.72.1635482025422; 
 Thu, 28 Oct 2021 21:33:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/60] tcg/optimize: Split out finish_folding
Date: Thu, 28 Oct 2021 21:32:46 -0700
Message-Id: <20211029043329.1518029-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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


