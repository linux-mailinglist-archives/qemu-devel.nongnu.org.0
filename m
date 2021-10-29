Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038543F659
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:56:40 +0200 (CEST)
Received: from localhost ([::1]:35216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJwV-0003rj-Cz
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaL-0003t0-NK
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:45 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaJ-0007vg-GB
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 83so8681891pgc.8
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qA2L+rswn0bgEtnoIqL3DIT4FMCOfg4+ksSKsYoClOk=;
 b=SkJyA04E0Mf84gLzLAhMqTj0H0GQCBFs9vFmaaGlwQKrYIGK8u9bCQAZ4XycK5gsT6
 zyT1X60O1WwguIOU7lDIcrcAtpQMvY8LSat/HPz766E0qwpgOqJfwyrYG26FbkxmA+At
 z5U0ouJLZy3oCFSfDN9PNSGV85txPAl0IuWRRSAgSS0OFoSSjQeAhc4+HT/BjubP8wW1
 /rYB5z3lTj9j261+E1N3cYyFn6Cj35Z86h1gwiKVs7G6eTeJNCDnmEfnQJnfobLvohbR
 xhUTcgaXa5m9ORDUeLWZaFG86ss3VxPtmA8s0esldYDYbTkgp9JH1+waE6cJv/HVbxVA
 A6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qA2L+rswn0bgEtnoIqL3DIT4FMCOfg4+ksSKsYoClOk=;
 b=wXv9qdBD2szJ6B0nWsrW2abc5t3rBfcO2UfXO9+x0XUxP1KPrCk24N6/j6kzqSviK8
 qb76M06DCgVzMRyBar+fduZ0ag/lnIAVm9snx7QFPKMFmfFjkdSOW8UdtX90TFrT0BpF
 R6bB683k/kqicfLMJXvCOkbRBf5LfrFPU8ByM1h+ar7Uwji3QZVV5DQ8wQcyh5LWp1NG
 ckxOyBslErFI35L8BeTwVlRSyP1dwxxeC6IZg+FzDqgTPtTuqdFREcoZerulUdYDOCYX
 FIEy7Y8shpB35G3/Kxe1MvpbMfzcFIpnOZPF8EiM4YEamYT7L2Idb2jBpXpoLafj83b2
 p6tw==
X-Gm-Message-State: AOAM533/rWyUKeKKVmE9zzgKIMfxRCAy5YjAh7mtImR+FcE8uI1eZFJc
 zhJeusCqazYG0hKXzCs5E5iX4BJdRF3d+A==
X-Google-Smtp-Source: ABdhPJxklkF1+nTnivOWSKKS45V2p8sgwy69nLt3xvtku9Va94QNnrRc+cOaHH0/5jfLUwRzkZ8cuw==
X-Received: by 2002:a62:194d:0:b0:47b:e3ee:6d43 with SMTP id
 74-20020a62194d000000b0047be3ee6d43mr8495626pfz.82.1635482022170; 
 Thu, 28 Oct 2021 21:33:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/60] tcg/optimize: Split out fold_call
Date: Thu, 28 Oct 2021 21:32:42 -0700
Message-Id: <20211029043329.1518029-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Calls are special in that they have a variable number
of arguments, and need to be able to clobber globals.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
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


