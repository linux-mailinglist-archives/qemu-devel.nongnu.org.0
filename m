Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393F743BDCB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:23:48 +0200 (CEST)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVnH-0003KO-AI
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZz-0002wY-Et
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:03 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZt-0001x0-E6
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:01 -0400
Received: by mail-pf1-x435.google.com with SMTP id 127so921144pfu.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sb5338wSOtydZnMtxZpM23PXTg/PYHbWm33mLw5BH3A=;
 b=Q6/nSvNHE5zTnBuWUs5EcHP9xtMu3SDVG3sMIEMS8l2UxZkBRdKAPnRAWko+g4WhTd
 XcVLVIDSk8s98lZoWY77oqCEjxdzxPIKt4X+/j6wKPMvSEQ4lLLoOmb9CEs6wanEX9Ct
 vZENWN0CYTdQ9IO2f7srt1zZkTi64TvJ5XBYHYmy+qtVtEM6Lufctq3CyTOa9CCelokL
 mcs2M7rhKncHPesVsOT0kWFHiS7qnKnHdOzaEtGhA788Wk30wW97GcToAkMckoSPLtmG
 eXU13tVMlPiAXeYid2i6O5ldrhdx8gKoda59LPHOGbhwEFOxOPSdixtNmqs/+k+Q+z94
 pKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sb5338wSOtydZnMtxZpM23PXTg/PYHbWm33mLw5BH3A=;
 b=JBG4/9bPflQKgrbnwQKNdVgs/0lCJQnwAtycnVtV4omeAnmI3YCM7n/7oDZYao6mO7
 8IY/Tuytp8IZCUHnEpK+SxVyKRi6XUJLnO7aG8UswD6upV00B5zxPCHbH0+1rgyi94Fi
 MtEeIWkqFgAp0YFXm4F1mIt0GIlt09vdukrUwSc4QceHfNc5uRRtxydJCDRp9/VDUzOt
 0/q6KZ0pXiP8L+kVmHNVNIf05+i0muV3xZYPZ5a8U9UCwD45Msmt+RHStfm1mQUC8VU7
 u4u2lT2NMW91K0ItIm0idjDQ+9+/2Bk4+KipZyHANb8OkEmx1v5MPPLqpSSuZjVd1pU2
 tOtg==
X-Gm-Message-State: AOAM530xjcnidj8aD5Agj61skawxgDHQDYN+AbBolaONXCf4GIHFHCZN
 C8ysF4g1iIVPOVzYI+zUlp9ohso/L+PdCw==
X-Google-Smtp-Source: ABdhPJzqpU4quQcAlrh7iYTv1GKA24hlTdwmBrr6Uz5kux8BFazQ5r+RtXhi9RiuAm819CncLUyzIw==
X-Received: by 2002:a63:385c:: with SMTP id h28mr10888629pgn.472.1635289795571; 
 Tue, 26 Oct 2021 16:09:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/51] tcg/optimize: Split out finish_folding
Date: Tue, 26 Oct 2021 16:09:04 -0700
Message-Id: <20211026230943.1225890-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


