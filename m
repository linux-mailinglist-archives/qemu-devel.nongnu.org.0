Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08143BDB6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:18:34 +0200 (CEST)
Received: from localhost ([::1]:44950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfViD-0000Lo-8J
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZr-0002st-MH
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:57 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZp-0001wR-MZ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:55 -0400
Received: by mail-pj1-x102e.google.com with SMTP id gn3so658297pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qA2L+rswn0bgEtnoIqL3DIT4FMCOfg4+ksSKsYoClOk=;
 b=yf2+ISHytanOHrx6tv0AgloZ/M9N7lMUzcKYQ7vJyrPbYD8DZFGn+PwJ02CoZ+hxTQ
 uZS3JP0YsrNLR6ePgaQR4obcQNrS7zcYeScnZnbYoRyhczoSRC0g3S9INfdDWZAgkYZb
 Sn7ydUW61ivUcY3eUBHPiLkKR2+NnzEHZ2lNLrKcrUTSiMkWPnoGfOphsyWBc+11TLlf
 mIapsgbRU8L5OrESOxJ9do2JqYJNviQm0r0pKIQwg0vPJs4se1iUnb6s1r3GB5Bh6aGF
 KTtFxoWhMpXkHi2dUmCMYjJWrjFFFlJ648MwnC/ALzQYKu5dEezYaStOYw1aJlq7AjVW
 iKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qA2L+rswn0bgEtnoIqL3DIT4FMCOfg4+ksSKsYoClOk=;
 b=lM6aGy7I9wNEx7NoM0JmpudLFU7lXFFcPuC1IHpgfq8+544vDh+pAJ6wzMV5Jc2xrk
 MlBmzXVLGfaFWbHv501++Y30uXTldpm+ImCNQnRvEJmUkbF9QIQm9fmvpBqq5M6uNsxb
 nA5QngB4r6OydVi0gnoNgHhAoBqO3ps9EbM3AYikgBW7fg1xXZS7oF7USf6NJVkYRqxP
 mdvr4w8th1SJa1DpB3vxPSirP8lRKaWdWxXyv2xKC1ZD7hd6pn9dBYdjcIxzvdWF4vWM
 QEMd+/bjpEg4v3eQyVa6W5pdsXkLUdOsHrwE7Ab2ROuG1l1+F01D4oQRe5sGxigH5+Wr
 51tA==
X-Gm-Message-State: AOAM5309/s5zydXLj0DKUryhAjusXc+oWYhbHbLa/dJsQde5T+7xZ1pQ
 4WEjRtW4+gB7xtA6eFzNS9C4WwekN3z7Dg==
X-Google-Smtp-Source: ABdhPJxMdug2ZNDKW8Xcf2k4hSk7tYeap5xho1PwU+/8kYJLcoNEcQuC/7S5ukqtG+8/ppyVh3CeBA==
X-Received: by 2002:a17:90a:c795:: with SMTP id
 gn21mr1920709pjb.112.1635289792207; 
 Tue, 26 Oct 2021 16:09:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/51] tcg/optimize: Split out fold_call
Date: Tue, 26 Oct 2021 16:09:00 -0700
Message-Id: <20211026230943.1225890-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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


