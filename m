Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E918A6593CC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:23:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rf-0003By-NS; Thu, 29 Dec 2022 19:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rX-00039M-2o
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rR-0002kA-U0
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:02 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso24408939pjt.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CYhK4ojXwIJU9A+YUctfxLBE0VXin67Cl0AC2MvLIgU=;
 b=LHcqSbc5t/YjSs7lp/nxmz+S0qr6CtimWICXKT1xGRJLjkOyyhhyfy/yYH0jdOBWak
 XuXypT0uvZ4fqrz+AI+zX2vvsuAE8Sgf4iQoiLgX3g8oCvqc3DkOJB2dCif9Z+EKJeDH
 Lq0c/pEUYHRXPVZQ91Od3ZyKetJSUSysMzhBio3OnLPB1hwTTmubCDa/gWfS75Y5v3Ac
 mKbRItedGguxd7hCWpT/ma2AFmZx8ezC0bLbQcTDG8p1KjClsdxq7I3keamTueGfQJFH
 cs1tLN5g6/0iyDnZvVVjU8ZeLrkSQfOv+oaoVISBPoq5Tu82MRo11phYZj3aZHHQP5p/
 EjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CYhK4ojXwIJU9A+YUctfxLBE0VXin67Cl0AC2MvLIgU=;
 b=aseMyY00nzEvhOazJqzgI3uXUynHCFCSPjpU8AtvcZtLnF3Wnlp8q5C1c5Eb5pJGRW
 M8332ob9oWOPydrSPBtC60jf422bWV7zyL4TJwyQQMJZwY6hTH3JJBf7C8J7YUWALET0
 U9vrUV+hloBD1XNKmdMeGLE9mF8hDFO1SXiHVoolVD5Mdz+3nIvsApjvYl0woRYpCZC1
 adrDW1M+NqTX6eF4FLsio5U3UmZBHcJw1VrJBuHT8hbHWd0/Swa0ypJVyKM4ON9u1WpP
 iQDcl/Ke4L7MeQImuaOZC9aPYWBf+365Ijczuph6wOPz9cyiu3L2+VTqL39DwFXDnFkL
 rosg==
X-Gm-Message-State: AFqh2krgAZjnI7ve0qSZLKuezbNLMBWGW46rJGzhl2ZGG1ftMXfvfcXn
 F6iQ3+q9RPgXk8ki2J6pecutiQHErzShzkRF
X-Google-Smtp-Source: AMrXdXuJ4yZfvLCbL3pZUpUC1TvryNeae1tBsGhYPJsYVEyKrxqbObqgxQ3tuknqVjV1I8r6nr8vEQ==
X-Received: by 2002:a17:902:8f87:b0:189:b36a:5448 with SMTP id
 z7-20020a1709028f8700b00189b36a5448mr33279774plo.44.1672358574970; 
 Thu, 29 Dec 2022 16:02:54 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 35/47] tcg: Pass number of arguments to tcg_emit_op() /
 tcg_op_insert_*()
Date: Thu, 29 Dec 2022 16:02:09 -0800
Message-Id: <20221230000221.2764875-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
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
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

In order to have variable size allocated TCGOp, pass the number
of arguments we use (and would allocate) up to tcg_op_alloc().

This alters tcg_emit_op(), tcg_op_insert_before() and
tcg_op_insert_after() prototypes.

In tcg_op_alloc() ensure the number of arguments is in range.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221218211832.73312-2-philmd@linaro.org>
---
 include/tcg/tcg-op.h   |  2 +-
 include/tcg/tcg.h      |  8 +++++---
 accel/tcg/plugin-gen.c |  5 ++++-
 tcg/optimize.c         |  4 ++--
 tcg/tcg-op-vec.c       |  8 ++++----
 tcg/tcg-op.c           | 12 ++++++------
 tcg/tcg.c              | 30 +++++++++++++++++-------------
 7 files changed, 39 insertions(+), 30 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 8176f194cb..79b1cf786f 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -818,7 +818,7 @@ static inline void tcg_gen_plugin_cb_start(unsigned from, unsigned type,
 
 static inline void tcg_gen_plugin_cb_end(void)
 {
-    tcg_emit_op(INDEX_op_plugin_cb_end);
+    tcg_emit_op(INDEX_op_plugin_cb_end, 0);
 }
 
 #if TARGET_LONG_BITS == 32
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8bcd60d0ed..c55fa21a89 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1014,10 +1014,12 @@ bool tcg_op_supported(TCGOpcode op);
 
 void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args);
 
-TCGOp *tcg_emit_op(TCGOpcode opc);
+TCGOp *tcg_emit_op(TCGOpcode opc, unsigned nargs);
 void tcg_op_remove(TCGContext *s, TCGOp *op);
-TCGOp *tcg_op_insert_before(TCGContext *s, TCGOp *op, TCGOpcode opc);
-TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op, TCGOpcode opc);
+TCGOp *tcg_op_insert_before(TCGContext *s, TCGOp *op,
+                            TCGOpcode opc, unsigned nargs);
+TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op,
+                           TCGOpcode opc, unsigned nargs);
 
 /**
  * tcg_remove_ops_after:
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index a6aaacd053..62e775d34d 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -258,10 +258,13 @@ static TCGOp *rm_ops(TCGOp *op)
 
 static TCGOp *copy_op_nocheck(TCGOp **begin_op, TCGOp *op)
 {
+    unsigned nargs = ARRAY_SIZE(op->args);
+
     *begin_op = QTAILQ_NEXT(*begin_op, link);
     tcg_debug_assert(*begin_op);
-    op = tcg_op_insert_after(tcg_ctx, op, (*begin_op)->opc);
+    op = tcg_op_insert_after(tcg_ctx, op, (*begin_op)->opc, nargs);
     memcpy(op->args, (*begin_op)->args, sizeof(op->args));
+
     return op;
 }
 
diff --git a/tcg/optimize.c b/tcg/optimize.c
index ae081ab29c..1afd50175b 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -962,7 +962,7 @@ static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
         rh = op->args[1];
 
         /* The proper opcode is supplied by tcg_opt_gen_mov. */
-        op2 = tcg_op_insert_before(ctx->tcg, op, 0);
+        op2 = tcg_op_insert_before(ctx->tcg, op, 0, 2);
 
         tcg_opt_gen_movi(ctx, op, rl, al);
         tcg_opt_gen_movi(ctx, op2, rh, ah);
@@ -1613,7 +1613,7 @@ static bool fold_multiply2(OptContext *ctx, TCGOp *op)
         rh = op->args[1];
 
         /* The proper opcode is supplied by tcg_opt_gen_mov. */
-        op2 = tcg_op_insert_before(ctx->tcg, op, 0);
+        op2 = tcg_op_insert_before(ctx->tcg, op, 0, 2);
 
         tcg_opt_gen_movi(ctx, op, rl, l);
         tcg_opt_gen_movi(ctx, op2, rh, h);
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 5bf100ea7d..966d41d65a 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -152,7 +152,7 @@ bool tcg_can_emit_vecop_list(const TCGOpcode *list,
 
 void vec_gen_2(TCGOpcode opc, TCGType type, unsigned vece, TCGArg r, TCGArg a)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 2);
     TCGOP_VECL(op) = type - TCG_TYPE_V64;
     TCGOP_VECE(op) = vece;
     op->args[0] = r;
@@ -162,7 +162,7 @@ void vec_gen_2(TCGOpcode opc, TCGType type, unsigned vece, TCGArg r, TCGArg a)
 void vec_gen_3(TCGOpcode opc, TCGType type, unsigned vece,
                TCGArg r, TCGArg a, TCGArg b)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 3);
     TCGOP_VECL(op) = type - TCG_TYPE_V64;
     TCGOP_VECE(op) = vece;
     op->args[0] = r;
@@ -173,7 +173,7 @@ void vec_gen_3(TCGOpcode opc, TCGType type, unsigned vece,
 void vec_gen_4(TCGOpcode opc, TCGType type, unsigned vece,
                TCGArg r, TCGArg a, TCGArg b, TCGArg c)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 4);
     TCGOP_VECL(op) = type - TCG_TYPE_V64;
     TCGOP_VECE(op) = vece;
     op->args[0] = r;
@@ -185,7 +185,7 @@ void vec_gen_4(TCGOpcode opc, TCGType type, unsigned vece,
 static void vec_gen_6(TCGOpcode opc, TCGType type, unsigned vece, TCGArg r,
                       TCGArg a, TCGArg b, TCGArg c, TCGArg d, TCGArg e)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 6);
     TCGOP_VECL(op) = type - TCG_TYPE_V64;
     TCGOP_VECE(op) = vece;
     op->args[0] = r;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 6168327030..cd1cd4e736 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -33,20 +33,20 @@
 
 void tcg_gen_op1(TCGOpcode opc, TCGArg a1)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 1);
     op->args[0] = a1;
 }
 
 void tcg_gen_op2(TCGOpcode opc, TCGArg a1, TCGArg a2)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 2);
     op->args[0] = a1;
     op->args[1] = a2;
 }
 
 void tcg_gen_op3(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 3);
     op->args[0] = a1;
     op->args[1] = a2;
     op->args[2] = a3;
@@ -54,7 +54,7 @@ void tcg_gen_op3(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3)
 
 void tcg_gen_op4(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3, TCGArg a4)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 4);
     op->args[0] = a1;
     op->args[1] = a2;
     op->args[2] = a3;
@@ -64,7 +64,7 @@ void tcg_gen_op4(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3, TCGArg a4)
 void tcg_gen_op5(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3,
                  TCGArg a4, TCGArg a5)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 5);
     op->args[0] = a1;
     op->args[1] = a2;
     op->args[2] = a3;
@@ -75,7 +75,7 @@ void tcg_gen_op5(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3,
 void tcg_gen_op6(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3,
                  TCGArg a4, TCGArg a5, TCGArg a6)
 {
-    TCGOp *op = tcg_emit_op(opc);
+    TCGOp *op = tcg_emit_op(opc, 6);
     op->args[0] = a1;
     op->args[1] = a2;
     op->args[2] = a3;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a5ecc92591..25c131fd77 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1479,7 +1479,7 @@ bool tcg_op_supported(TCGOpcode op)
    and endian swap in tcg_reg_alloc_call(). */
 void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 {
-    int i, real_args, nb_rets, pi;
+    int i, real_args, nb_rets, pi, max_args;
     unsigned typemask;
     const TCGHelperInfo *info;
     TCGOp *op;
@@ -1513,7 +1513,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         }
     }
 
-    op = tcg_emit_op(INDEX_op_call);
+    max_args = ARRAY_SIZE(op->args);
+    op = tcg_emit_op(INDEX_op_call, max_args);
 
     pi = 0;
     if (ret != NULL) {
@@ -1590,7 +1591,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
     /* Make sure the fields didn't overflow.  */
     tcg_debug_assert(TCGOP_CALLI(op) == real_args);
-    tcg_debug_assert(pi <= ARRAY_SIZE(op->args));
+    tcg_debug_assert(pi <= max_args);
 
     if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
         for (i = 0; i < nargs; ++i) {
@@ -2294,11 +2295,12 @@ void tcg_remove_ops_after(TCGOp *op)
     }
 }
 
-static TCGOp *tcg_op_alloc(TCGOpcode opc)
+static TCGOp *tcg_op_alloc(TCGOpcode opc, unsigned nargs)
 {
     TCGContext *s = tcg_ctx;
     TCGOp *op;
 
+    assert(nargs < ARRAY_SIZE(op->args));
     if (likely(QTAILQ_EMPTY(&s->free_ops))) {
         op = tcg_malloc(sizeof(TCGOp));
     } else {
@@ -2312,23 +2314,25 @@ static TCGOp *tcg_op_alloc(TCGOpcode opc)
     return op;
 }
 
-TCGOp *tcg_emit_op(TCGOpcode opc)
+TCGOp *tcg_emit_op(TCGOpcode opc, unsigned nargs)
 {
-    TCGOp *op = tcg_op_alloc(opc);
+    TCGOp *op = tcg_op_alloc(opc, nargs);
     QTAILQ_INSERT_TAIL(&tcg_ctx->ops, op, link);
     return op;
 }
 
-TCGOp *tcg_op_insert_before(TCGContext *s, TCGOp *old_op, TCGOpcode opc)
+TCGOp *tcg_op_insert_before(TCGContext *s, TCGOp *old_op,
+                            TCGOpcode opc, unsigned nargs)
 {
-    TCGOp *new_op = tcg_op_alloc(opc);
+    TCGOp *new_op = tcg_op_alloc(opc, nargs);
     QTAILQ_INSERT_BEFORE(old_op, new_op, link);
     return new_op;
 }
 
-TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op, TCGOpcode opc)
+TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
+                           TCGOpcode opc, unsigned nargs)
 {
-    TCGOp *new_op = tcg_op_alloc(opc);
+    TCGOp *new_op = tcg_op_alloc(opc, nargs);
     QTAILQ_INSERT_AFTER(&s->ops, old_op, new_op, link);
     return new_op;
 }
@@ -2937,7 +2941,7 @@ static bool liveness_pass_2(TCGContext *s)
                     TCGOpcode lopc = (arg_ts->type == TCG_TYPE_I32
                                       ? INDEX_op_ld_i32
                                       : INDEX_op_ld_i64);
-                    TCGOp *lop = tcg_op_insert_before(s, op, lopc);
+                    TCGOp *lop = tcg_op_insert_before(s, op, lopc, 3);
 
                     lop->args[0] = temp_arg(dir_ts);
                     lop->args[1] = temp_arg(arg_ts->mem_base);
@@ -3003,7 +3007,7 @@ static bool liveness_pass_2(TCGContext *s)
                     TCGOpcode sopc = (arg_ts->type == TCG_TYPE_I32
                                       ? INDEX_op_st_i32
                                       : INDEX_op_st_i64);
-                    TCGOp *sop = tcg_op_insert_after(s, op, sopc);
+                    TCGOp *sop = tcg_op_insert_after(s, op, sopc, 3);
                     TCGTemp *out_ts = dir_ts;
 
                     if (IS_DEAD_ARG(0)) {
@@ -3039,7 +3043,7 @@ static bool liveness_pass_2(TCGContext *s)
                     TCGOpcode sopc = (arg_ts->type == TCG_TYPE_I32
                                       ? INDEX_op_st_i32
                                       : INDEX_op_st_i64);
-                    TCGOp *sop = tcg_op_insert_after(s, op, sopc);
+                    TCGOp *sop = tcg_op_insert_after(s, op, sopc, 3);
 
                     sop->args[0] = temp_arg(dir_ts);
                     sop->args[1] = temp_arg(arg_ts->mem_base);
-- 
2.34.1


