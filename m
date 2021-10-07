Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEFD425CFA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:10:04 +0200 (CEST)
Received: from localhost ([::1]:60846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZiN-0000sH-66
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTv-0000HM-Ez
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:08 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTs-00076s-V9
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:07 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 133so842755pgb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/vbKJTGG/osCQnHCopwdaDi44nUoZOlB0Lh8d456MxE=;
 b=Nn1aeNWEnBDVFCwL9AjEh6P7uZBIhgVjZ8COfn0356ocFooRzXjslN2vSijm4Ey8Vr
 sqkrWjgc98mk1vQWLb42NNBBvf1s7AihrFa1EBx/S+j7UIpfjgv4wr8uIvrD0wajTd9q
 cc2Oph6YdxCWxqUI2MzktrmMFq4O154qwRJyjojD8bdmW+E2O7rUCoamkUzWVYsjgLtd
 NdDO5b3rbVP2pFCz+RysHSrLOs36/aEhpTljbKTS/10ahURM973Ycg4O+US204dFsmY2
 lwY2/AzEvB/W+o2R3xNUBaLe4gCM9iCMJ39eo0tja5m3+vgrFZB81eIexLaa/6DOKg6i
 MVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vbKJTGG/osCQnHCopwdaDi44nUoZOlB0Lh8d456MxE=;
 b=w1MmguEtWRGFVnLQyQN8YARoPmBdDfsiAOidAkxwAxhiRwWaj6r1KGWXeQ1W6brVto
 nLVMOVNgY+F9S/8xapTAEjvLmna2kIMjBOqQq40a88lRIVNaue9qzUDxkmdi/P8cjpDB
 kHvCMpsWguA/+QIBrQafW6Lgm3d+gd1PCgDYk98RS0MWKh6Ro0xB8T1ylTx53DggSUeS
 /WJ4iIkTstgCfXp7eEMVtDs0Na05sg8hSwwf6DoqBNkBVBNXrHVKAxxmrt6HWbAQaWST
 wtF3ywBqNqjsX1CGH82r7qwyqN9vhSO8Lz4KwStJPjhadg+uB0E1gGqkqm9TbbQRNSSG
 1wng==
X-Gm-Message-State: AOAM531HDGZ/boum7E1FGB75EpgtT5haEZ7Gnd5bNV+ksMLOQt1fJPzw
 YYTTqFIBdg7g4rmoJzNfHULeqW4rrKN3uw==
X-Google-Smtp-Source: ABdhPJy1tykAFk2gjolVALfyfbEeND/L0oIS2TN3VJjj57s73/VU9LSodJ+9xkdKiqKg/A7Lk6aoJw==
X-Received: by 2002:a05:6a00:14c2:b0:44c:d483:4df3 with SMTP id
 w2-20020a056a0014c200b0044cd4834df3mr1147028pfu.52.1633636503597; 
 Thu, 07 Oct 2021 12:55:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/48] tcg/optimize: Split out fold_call
Date: Thu,  7 Oct 2021 12:54:16 -0700
Message-Id: <20211007195456.1168070-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Calls are special in that they have a variable number
of arguments, and need to be able to clobber globals.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 63 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index fad6f5de1f..74b9aa025a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -624,10 +624,42 @@ static void copy_propagate(OptContext *ctx, TCGOp *op,
     }
 }
 
+static bool fold_call(OptContext *ctx, TCGOp *op)
+{
+    TCGContext *s = ctx->tcg;
+    int nb_oargs = TCGOP_CALLO(op);
+    int nb_iargs = TCGOP_CALLI(op);
+    int flags, i;
+
+    init_arguments(ctx, op, nb_oargs + nb_iargs);
+    copy_propagate(ctx, op, nb_oargs, nb_iargs);
+
+    /* If the function reads or writes globals, reset temp data. */
+    flags = tcg_call_flags(op);
+    if (!(flags & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS))) {
+        int nb_globals = s->nb_globals;
+
+        for (i = 0; i < nb_globals; i++) {
+            if (test_bit(i, ctx->temps_used.l)) {
+                reset_ts(&ctx->tcg->temps[i]);
+            }
+        }
+    }
+
+    /* Reset temp data for outputs. */
+    for (i = 0; i < nb_oargs; i++) {
+        reset_temp(op->args[i]);
+    }
+
+    /* Stop optimizing MB across calls. */
+    ctx->prev_mb = NULL;
+    return true;
+}
+
 /* Propagate constants and copies, fold constant expressions. */
 void tcg_optimize(TCGContext *s)
 {
-    int nb_temps, nb_globals, i;
+    int nb_temps, i;
     TCGOp *op, *op_next;
     OptContext ctx = { .tcg = s };
 
@@ -637,8 +669,6 @@ void tcg_optimize(TCGContext *s)
        available through the doubly linked circular list. */
 
     nb_temps = s->nb_temps;
-    nb_globals = s->nb_globals;
-
     for (i = 0; i < nb_temps; ++i) {
         s->temps[i].state_ptr = NULL;
     }
@@ -647,17 +677,17 @@ void tcg_optimize(TCGContext *s)
         uint64_t z_mask, partmask, affected, tmp;
         int nb_oargs, nb_iargs;
         TCGOpcode opc = op->opc;
-        const TCGOpDef *def = &tcg_op_defs[opc];
+        const TCGOpDef *def;
 
-        /* Count the arguments, and initialize the temps that are
-           going to be used */
+        /* Calls are special. */
         if (opc == INDEX_op_call) {
-            nb_oargs = TCGOP_CALLO(op);
-            nb_iargs = TCGOP_CALLI(op);
-        } else {
-            nb_oargs = def->nb_oargs;
-            nb_iargs = def->nb_iargs;
+            fold_call(&ctx, op);
+            continue;
         }
+
+        def = &tcg_op_defs[opc];
+        nb_oargs = def->nb_oargs;
+        nb_iargs = def->nb_iargs;
         init_arguments(&ctx, op, nb_oargs + nb_iargs);
         copy_propagate(&ctx, op, nb_oargs, nb_iargs);
 
@@ -1549,16 +1579,6 @@ void tcg_optimize(TCGContext *s)
         if (def->flags & TCG_OPF_BB_END) {
             memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
         } else {
-            if (opc == INDEX_op_call &&
-                !(tcg_call_flags(op)
-                  & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS))) {
-                for (i = 0; i < nb_globals; i++) {
-                    if (test_bit(i, ctx.temps_used.l)) {
-                        reset_ts(&s->temps[i]);
-                    }
-                }
-            }
-
             for (i = 0; i < nb_oargs; i++) {
                 reset_temp(op->args[i]);
                 /* Save the corresponding known-zero bits mask for the
@@ -1599,7 +1619,6 @@ void tcg_optimize(TCGContext *s)
             case INDEX_op_qemu_st_i32:
             case INDEX_op_qemu_st8_i32:
             case INDEX_op_qemu_st_i64:
-            case INDEX_op_call:
                 /* Opcodes that touch guest memory stop the optimization.  */
                 ctx.prev_mb = NULL;
                 break;
-- 
2.25.1


