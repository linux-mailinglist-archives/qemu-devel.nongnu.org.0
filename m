Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B45543D980
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:49:13 +0200 (CEST)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvTc-00058t-87
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMO-0004eL-NW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:44 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:50913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMM-0003G0-Iq
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gn3so3607213pjb.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qA2L+rswn0bgEtnoIqL3DIT4FMCOfg4+ksSKsYoClOk=;
 b=G36gHCrhcij02mz2OAxiReMmvyXNIQeHx+es/a+jRyGLd90P912XlMbu8Z45BGhkWI
 AP9OaOyL6GhAcoyfzt3Xk1W3xqwlkSbj/Bqi2M1451FBa2v0q6M9R5diruy96cDV/LVT
 sjIbt+KBJlXSIBV1SvMNFT2VuCobJKo8JWEdBavyzdo53oO6pH3Bk3eyap6qaniQAPwe
 s4sU7yRV7CyYDL7q2cxvmclxu05gVvejvG+Hc15UMcBC21DWBM9RW1Rs6bNuQZFQ0LA2
 khPTnG9DUpwq/rT4JAW29LlpL8wOLaQ5nEUEtsspu0CalAJo/zBBK3m2lWhVbaBJ7h0x
 0SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qA2L+rswn0bgEtnoIqL3DIT4FMCOfg4+ksSKsYoClOk=;
 b=PGk2FHOnmz+Qjpzu7hot336FHiTrKk/HubSZni66ZRugelEZkImNSDuELxv1ChYNjy
 p9WHonRpd8nAmt157z/aHzJHQn6w19EPDr6+6ibc4xXtrlFLe5lBKBz0bBYONcpqYY26
 IuoHoWm2/G6z8rudch6mIVJUYnZPXrqGGSZRALea9Q5ePGnBdYQAuVcf9xzqVgK7wEwQ
 aqGHDkuzHYdNEd7phUlE6/jxWZsTyYU+OGMcnkiBQu2SH/8qZVgD6naEA8o7TEB3o+WY
 lAHnPW/uzJR0JMcg+JblG+UIKA1GJKfnsyBV6xXyCdk2p2QHEMhUKUWqNABUn0Acz6it
 Fwig==
X-Gm-Message-State: AOAM530sJELemSnmoIGNntO4ZeoVs/IazNcItm5B2YH6m6+zpaOmyL7V
 xpbdayuhUQbrVPwD5h5m+dnMB2/svTp2WA==
X-Google-Smtp-Source: ABdhPJzigT7Tp/FtIzYp5pWYYnVr+1I6bU4HYVEyeUArD2bRDFkSb/ZjHf86F/b1/unGdPjcd5oRQw==
X-Received: by 2002:a17:903:22c9:b0:13e:ed56:70e2 with SMTP id
 y9-20020a17090322c900b0013eed5670e2mr1231003plg.19.1635388901112; 
 Wed, 27 Oct 2021 19:41:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/56] tcg/optimize: Split out fold_call
Date: Wed, 27 Oct 2021 19:40:48 -0700
Message-Id: <20211028024131.1492790-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


