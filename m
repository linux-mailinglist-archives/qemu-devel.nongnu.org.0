Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4778E6504C3
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:21:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p713u-0000xy-EI; Sun, 18 Dec 2022 16:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p713h-0000w5-4f
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:19:01 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p713T-0001rO-PR
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:18:45 -0500
Received: by mail-ed1-x530.google.com with SMTP id a16so10472804edb.9
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDmO2n77pQ7MVys9upcSrNelAk4oEU9PXNOvreGjDAk=;
 b=Ef0/7QYBRLKI+8HsT5GfwahLlYA033sVRg7FYy4xcZ+jd/FcB13zH1vXQfZnogkDUT
 a7JKqTvCzKcU0m/isWHnoWu3nwwHjHNPaXf02KdG9XKDXWfj5cnT9fVHCcwTh6XpHT4m
 iuGIpyVo7CzJPf2z0rznTXI9VIJkmwkLmAQmKxjfWb73IEB0rOhBwDQbYKBvJrSt4+kE
 DNTCmAUylAPx3ebjbfWUfE89bNdI3LDi02BlMUTCVnCUn2eLIKPFNP4290DOyWa+Nj1d
 JUdVgaR/jwQqSw7Lw8VESTkPJYlw4h+jpNo/u73RwIyfAAHSwDXnYZvZK/Dh5scqdaGL
 OQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDmO2n77pQ7MVys9upcSrNelAk4oEU9PXNOvreGjDAk=;
 b=dXy3ibk9ouE9k4+1UK3Ja/n/4nRanVHN2fE0+6xDyHWd0n/vK3sbDNnd989xiHbsw8
 dBO8dWamWyvT8LSq9fnircYkJi+mqKAk9v8YJ+s9qN49x1Qcswq3gfCSHt/kScMitxQd
 faUD+ro2Dcipx7BTblabnGaQSL9pl+uyTdBMOjpybYBZRWqg1NVusg+g/YqaIzVzxuYB
 M+LdVaJMqJe7gN38oHd2JPZhg9GnyLfku/aGra0Ade12hTQ3Czhzt8itupOqkm+tXTrp
 VW0Urd8z7PotvDu/9I8v8CHRkcqa1onQo+nHLoFTk+j+SO/z+ORfIKjD46UFUwV95qEg
 Os2w==
X-Gm-Message-State: AFqh2kqn+lF49ohe4bos14PVo9AU65qgWP9cH94NT21NWyb7vPjq5edW
 g3O2Lz7vAJCIRm91n6c6+kNybCFLfTqKK3srJz8=
X-Google-Smtp-Source: AMrXdXtsj+YdSypM7GIQbnmnaw3JUNog3blRtnn2YNrjaI+g0U9JLBj9Y6yUmgpgpSu5qj+dNpGKeA==
X-Received: by 2002:a05:6402:5d0:b0:474:5de4:a5d1 with SMTP id
 n16-20020a05640205d000b004745de4a5d1mr17281725edx.39.1671398321832; 
 Sun, 18 Dec 2022 13:18:41 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d30-20020a056402401e00b0046b25b93451sm3503170eda.85.2022.12.18.13.18.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Dec 2022 13:18:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 20a/27] tcg: Pass number of arguments to tcg_emit_op() /
 tcg_op_insert_*()
Date: Sun, 18 Dec 2022 22:18:31 +0100
Message-Id: <20221218211832.73312-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221218211832.73312-1-philmd@linaro.org>
References: <20221213212541.1820840-21-richard.henderson@linaro.org>
 <20221218211832.73312-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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

In order to have variable size allocated TCGOp, pass the number
of arguments we use (and would allocate) up to tcg_op_alloc().

This alters tcg_emit_op(), tcg_op_insert_before() and
tcg_op_insert_after() prototypes.

In tcg_op_alloc() ensure the number of arguments is in range.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/plugin-gen.c |  5 ++++-
 include/tcg/tcg-op.h   |  2 +-
 include/tcg/tcg.h      |  8 +++++---
 tcg/optimize.c         |  4 ++--
 tcg/tcg-op-vec.c       |  8 ++++----
 tcg/tcg-op.c           | 12 ++++++------
 tcg/tcg.c              | 30 +++++++++++++++++-------------
 7 files changed, 39 insertions(+), 30 deletions(-)

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
index aae4046e1b..3f172cb1d6 100644
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
2.38.1


