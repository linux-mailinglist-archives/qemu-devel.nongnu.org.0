Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBDC436C8E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:17:59 +0200 (CEST)
Received: from localhost ([::1]:39526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfRm-0006Ta-JB
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG5-0007O3-BY
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:57 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG3-0004FU-4A
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:53 -0400
Received: by mail-pg1-x533.google.com with SMTP id r2so1386273pgl.10
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ek5wQYkVQoH2sT/1n0bEqo8hkSGClCj2XVIXi5hg7S8=;
 b=aVeNJzZQJtwbQ3Cg8pM/oSWsNayyChEtBDLONjxPlMGH6r/JsUr3a/y+2x1thl3kL9
 1sp2JOIUiLC3NBWr1G1/KStPRrqsWA8y6pfvbZd7oWD5n4Y+GewhFX9xlBu0UUac13sq
 Gnjb01qGkIywwczv53R1sLKS+vN69pQdVfGbp8YOQNlg/ToSLEBj/PBAClxkZg7UY7dU
 RdgdC+ow1OSVcsWR6J5MtcrkkIFjuWjSiLAptUl1Hr2rMoE735+GSL4CFdhbCCneBZF4
 nCc3/X1V4/0n2HvNcijaEtp/7hwUeu41fiTxpu45zagM77CkuJu9HLgBr5on2Eg/goWY
 1FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ek5wQYkVQoH2sT/1n0bEqo8hkSGClCj2XVIXi5hg7S8=;
 b=b2Gyg00HU2F/czRVFY29Ro8Kuhwhn0ZJqGjIqlnw07dXR6croqtdeo7zLLSq2LtLuH
 ya+fgidMVhO3cRs4Us+k0XMiIOv8UzusEFRJWdSCwZBfelDduJq0K502tLcd68KecfVa
 42sXhng0GGfzeB+qx8Dn3ZWfr5SpIxkQMH1WSQAHHPnJT58Obp/Thq7HF6X+hggm13hL
 2pU/wQZ952y+m9v3AGm2QQz2S9NiywIdyKujSKSDiFoqL2yBJlCMiYgWXl2E1rHDXoCL
 7Hl7EuAmbfMBRISIPsFFw10P/goGgjnoLJtPKq+q6HiYA4M/rqRYupliB216x8YTsQ4A
 V2IA==
X-Gm-Message-State: AOAM5317uQPXSL0Z+QIxNp6adxLXvhMwy/d/H2xNSi9S22RjU5QEYBD0
 PSpyzjawvRmDq/C58jbsBHtd/2+Txxg=
X-Google-Smtp-Source: ABdhPJxYpgRV5OcAKH5rQQJoC04/8Z5gYCHHWb7N/bcWvb4/VocCf+i2rlr0NsXuwfIpiVqA3/0DXA==
X-Received: by 2002:a63:9dc4:: with SMTP id i187mr6319371pgd.260.1634850349588; 
 Thu, 21 Oct 2021 14:05:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/48] tcg/optimize: Split out finish_folding
Date: Thu, 21 Oct 2021 14:05:03 -0700
Message-Id: <20211021210539.825582-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Copy z_mask into OptContext, for writeback to the
first output within the new function.

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


