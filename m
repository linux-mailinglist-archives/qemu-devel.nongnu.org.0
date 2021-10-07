Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F089D425D33
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:25:58 +0200 (CEST)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZxl-0003e1-LV
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0000Ok-QD
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:29 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTw-00079p-IX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:24 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k26so6243625pfi.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EkJH7YP2c0ZzPN845v369IjZ6rqU1eCv28JZAOL39rA=;
 b=HsM6AnwbSkFbPwvny0N0aj31CPdH27C93pOdROD/hcuiL/QxkwWJIpoN72dU3MVzph
 +FvQmU4Rj1/CPcYzRehUo0H9W9xZz9ljoqb37cT4fBNDt8/hfS/KwqKw9dGeoYxGahT9
 pNLLdr51aOwbO0Ncc/hiVlqab/k8tB/0nRgUX8cn6DpcWemXQw8szlksn5XGk+RbokkQ
 DNzRc4OvVsPZm7jyf5LwgL4NZ13uZcQl8flIJ3YwLwM0kJu266KF2P4UJf0h7WNtm88y
 jSVmO6MOBCZ1nZPYHvho/AsQBDQLNRs6PeMEp7QySuoXDoBDQxTI7SFMxCFL2hgXwMu5
 MFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EkJH7YP2c0ZzPN845v369IjZ6rqU1eCv28JZAOL39rA=;
 b=tWrDkvZ+t4k0OnDvxllh9m/Mbr8nW4XiN1Ed/eM+SELZGdQsTpchL4yEV9RHTdtVtL
 ynkPTnp7KJ9F9zkgVuKgi+HIQRSEP8NqxwnzYZDPlMPJeuNESrdlMsudn2TR7tAdkMOR
 PCYKvQXZSyhSxjnvow1zJKoH3QPylfyohfZri6h2EqTNdal+9BaeAFzeg5oRNOwDVVLW
 8nczdz9MMax4noGhNXpxFe0P5XgbOTvPdiqq2RoPKJwLuiQm8+fJqdXn8woQcytQb82E
 P9Ih0zkCXs9G2EqW/OHfZTqYSHnbeLRwqfh5Fc6IA9iVbpJHuYJtb2RFGbsBAwDTmWok
 wgvA==
X-Gm-Message-State: AOAM530FyFf3bbV89WWxVgG4emvLiikyKhMcBHKPqMUeCzantK84DEvr
 fBLpCw3+b3VrJIDbn1lWzNEuTFoRDn7TNA==
X-Google-Smtp-Source: ABdhPJz4spT4vKmaXSBfyMT1LxaefLyogUMhrn3oPKyFHq4knhdfmvQSNQnTaDUSv8ZeX0Dr6jzf3g==
X-Received: by 2002:aa7:9816:0:b0:447:bdf9:eac2 with SMTP id
 e22-20020aa79816000000b00447bdf9eac2mr6070485pfl.31.1633636506790; 
 Thu, 07 Oct 2021 12:55:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/48] tcg/optimize: Split out finish_folding
Date: Thu,  7 Oct 2021 12:54:20 -0700
Message-Id: <20211007195456.1168070-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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


