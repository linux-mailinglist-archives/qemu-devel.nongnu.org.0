Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DB03FB132
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:30:21 +0200 (CEST)
Received: from localhost ([::1]:43840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKaoG-0004MO-BO
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj7-0003eO-HH
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:01 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj5-0007R2-Qk
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:01 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so13103224pjw.2
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lXZM/5jYXScEjt5M/i1wW+ywq3nz+BwjDuI5NM59gwI=;
 b=ahfw6+BE5lyvqQVC1uUDyc7o/Foj/ahiYTmoE8I3HOWYE+wmqcGIPJUB4QAMSTx0LZ
 t97DRjZFsBl4eALi8DiEvAI3zXmL7xU3LzQvXXEdah9sUE3E1OvO/CLZopXEwjvcPROM
 g2FaGDQrpEL9GNWXWzECIZriiJMwfgbHxxomQu1OziOD4RJnkeHPtfoBr5luHlWDFzkl
 rzvRvETufYqaWTwwLEeMNTkiavunF25ut1Dh/nPu3vqBe5WrOMoK9KEf8U7HvGea3qty
 ZZ/9zvBWU6vPsW2mJYnNjErIEbICpD5EIlSuE9tE6R7xa5mb6iW0/fbIssqO/b7fjUIC
 AQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lXZM/5jYXScEjt5M/i1wW+ywq3nz+BwjDuI5NM59gwI=;
 b=m2GYbERs7UvPNgR1Pg5tUy+XD7J57hsTVXRwqCs5FYiLSznNujYSB3X55TpSTqpBBY
 enJRED25HkZbCCajdz8shKGisgB794yVPslFXcQ61aoPS24+YTwpRFpz5hd5D1Qmp9XF
 PzcAasgf3K2Pjt8zf2iSu1mhBgI4EbCnp16HC3+EBDGq5S39PG8jkhAXlbRLoWaJVa/+
 Oye5J7bXRrIvnp3u+zQ4jwMW94fMmYtMCZqKy8nTxeCU6lvVun6Q6Ev1WEzZ2vOx35Ef
 bfvA2Ql6NqtDtwJ7iHnsrpI8ETuiLgEfu0Pk4VbLXK2YXKiARes3RJr7TWvR5OKWcU0P
 C5hQ==
X-Gm-Message-State: AOAM530ZjBKiUESe05MJqfL7VgQ/RfZyFdsFqGUAGxNYrb8hLAjWBw6q
 U9nA/BO/4Hg44d+WBub9CXNHDEBgNtclMw==
X-Google-Smtp-Source: ABdhPJywKn92Gbw3GGqRrjql7aS6PiWRCGhN6oNeD+Bj8OUqAZuEaX8UNnjKXFABasXegZmgNT0fog==
X-Received: by 2002:a17:90a:c293:: with SMTP id
 f19mr4474190pjt.106.1630304698477; 
 Sun, 29 Aug 2021 23:24:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.24.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:24:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/48] tcg/optimize: Split out fold_call
Date: Sun, 29 Aug 2021 23:24:11 -0700
Message-Id: <20210830062451.639572-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Calls are special in that they have a variable number
of arguments, and need to be able to clobber globals.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 63 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index a668c5f0df..4a0949d1c0 100644
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


