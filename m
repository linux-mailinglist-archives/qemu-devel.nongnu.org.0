Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BEC640008
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymm-0002jB-US; Fri, 02 Dec 2022 00:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymk-0002iP-BH
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:30 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymh-0003My-U4
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:30 -0500
Received: by mail-pg1-x532.google.com with SMTP id 62so3525735pgb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KxCamUeUIq5ZNxrpta7OQIQz8HOjJD91HgCQ1yrQkYo=;
 b=TCjQMws+8ezvK1Psj44tF8iEUI5v6/uooyjAwnxMTQKpc2gekpEwDGvX5UyJnS+crz
 Ork/zFKkPiS4jYW4RWvOb986oEe/YTjvqwtJMkxqRviNmEoHN5cKw6Czsc37Ev2rgpLp
 eob4CoTqqybsagIsf8/TVt8ALyXyQEszEpS61mxAlPQ5p7HVdgLM5qsUeHWiaYtyuo6C
 3dcxvPjUy2DXgsYcgY/lgHQ4c154Z+16laSd5Eyw5f2E0bOCdFI47Omxa04qhatq+dVM
 t/oumFpt/wYzNNWOgSDAdg0bKHDcHtrZDTgb2PLrtelRyqoSab8kvIkWhmock4tESJ94
 qO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KxCamUeUIq5ZNxrpta7OQIQz8HOjJD91HgCQ1yrQkYo=;
 b=ZTxYILvdzCpAWoDoPLupYZ3I1tTzUBBW86VFuZmMRzYRvX6upUY4zkM5uiKzyhD6rh
 gxFSlHS8v3BSTTchQ3yF6qgNDxKzuAWODqwoW/NnMsaWbl9R/XmxTQ3TCglxKQMpGjp8
 khTociHgKNLyGqN7ipgNaZbUsLBTL2IxuJ5hmjiDzYgRhsDdhdPQIvREkyyTtqrldR/p
 E5WO/GDdVjH8AYt7C7J+hRrVac/RF/bzDq9/h+kRo3FovSTxO07iF6tsr2RU9QHwgn/K
 lSzJBplW0NdU/DtpE8MoBGQNlpdCmtaAenAudKXkEOJ9GEmy468U5RuA+Bg25U72JKmN
 pRbg==
X-Gm-Message-State: ANoB5pnjg8PgdhmjRmeNOwsYC9FfMxvaVibq3ys1kwKNHQg6IBkGB5oW
 Qcq0zFvApUkrOCYEWD/n+YDsKJPxgviACF8v
X-Google-Smtp-Source: AA0mqf67pYO6bzH4CvDKNaaA6s0PQl8Vbz7oOosDKMSZQ8JcuYa17KnCvLAvtJa1Lg16q1lifHHl9g==
X-Received: by 2002:a63:fa0b:0:b0:46b:2493:14ad with SMTP id
 y11-20020a63fa0b000000b0046b249314admr63637701pgh.274.1669959627043; 
 Thu, 01 Dec 2022 21:40:27 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/34] tcg: Vary the allocation size for TCGOp
Date: Thu,  1 Dec 2022 21:39:51 -0800
Message-Id: <20221202053958.223890-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

We have been allocating a worst case number of arguments
to support calls.  Instead, allow the size to vary.
By default leave space for 4 args, to maximize reuse,
but allow calls to increase the number of args to 32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h |  2 --
 include/tcg/tcg-op.h       |  2 +-
 include/tcg/tcg.h          | 54 +++++++++++++--------------------
 accel/tcg/plugin-gen.c     | 11 ++++---
 tcg/optimize.c             |  4 +--
 tcg/tcg-op-vec.c           |  8 ++---
 tcg/tcg-op.c               | 12 ++++----
 tcg/tcg.c                  | 61 +++++++++++++++++++++++++-------------
 8 files changed, 82 insertions(+), 72 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index e242fed46e..8bdf0f6ea2 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -133,6 +133,4 @@
 #define DEF_HELPER_7(name, ret, t1, t2, t3, t4, t5, t6, t7) \
     DEF_HELPER_FLAGS_7(name, 0, ret, t1, t2, t3, t4, t5, t6, t7)
 
-/* MAX_OPC_PARAM_IARGS must be set to n if last entry is DEF_HELPER_FLAGS_n. */
-
 #endif /* EXEC_HELPER_HEAD_H */
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
index 8bcd60d0ed..d430ea10c8 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -38,20 +38,6 @@
 /* XXX: make safe guess about sizes */
 #define MAX_OP_PER_INSTR 266
 
-#if HOST_LONG_BITS == 32
-#define MAX_OPC_PARAM_PER_ARG 2
-#else
-#define MAX_OPC_PARAM_PER_ARG 1
-#endif
-#define MAX_OPC_PARAM_IARGS 7
-#define MAX_OPC_PARAM_OARGS 1
-#define MAX_OPC_PARAM_ARGS (MAX_OPC_PARAM_IARGS + MAX_OPC_PARAM_OARGS)
-
-/* A Call op needs up to 4 + 2N parameters on 32-bit archs,
- * and up to 4 + N parameters on 64-bit archs
- * (N = number of input arguments + output arguments).  */
-#define MAX_OPC_PARAM (4 + (MAX_OPC_PARAM_PER_ARG * MAX_OPC_PARAM_ARGS))
-
 #define CPU_TEMP_BUF_NLONGS 128
 #define TCG_STATIC_FRAME_SIZE  (CPU_TEMP_BUF_NLONGS * sizeof(long))
 
@@ -493,34 +479,34 @@ typedef struct TCGTempSet {
     unsigned long l[BITS_TO_LONGS(TCG_MAX_TEMPS)];
 } TCGTempSet;
 
-/* While we limit helpers to 6 arguments, for 32-bit hosts, with padding,
-   this imples a max of 6*2 (64-bit in) + 2 (64-bit out) = 14 operands.
-   There are never more than 2 outputs, which means that we can store all
-   dead + sync data within 16 bits.  */
-#define DEAD_ARG  4
-#define SYNC_ARG  1
-typedef uint16_t TCGLifeData;
+/*
+ * With 1 128-bit output, a 32-bit host requires 4 output parameters,
+ * which leaves a maximum of 28 other slots.  Which is enough for 7
+ * 128-bit operands.
+ */
+#define DEAD_ARG  (1 << 4)
+#define SYNC_ARG  (1 << 0)
+typedef uint32_t TCGLifeData;
 
-/* The layout here is designed to avoid a bitfield crossing of
-   a 32-bit boundary, which would cause GCC to add extra padding.  */
 typedef struct TCGOp {
-    TCGOpcode opc   : 8;        /*  8 */
+    TCGOpcode opc   : 8;
+    unsigned nargs  : 8;
 
     /* Parameters for this opcode.  See below.  */
-    unsigned param1 : 4;        /* 12 */
-    unsigned param2 : 4;        /* 16 */
+    unsigned param1 : 8;
+    unsigned param2 : 8;
 
     /* Lifetime data of the operands.  */
-    unsigned life   : 16;       /* 32 */
+    TCGLifeData life;
 
     /* Next and previous opcodes.  */
     QTAILQ_ENTRY(TCGOp) link;
 
-    /* Arguments for the opcode.  */
-    TCGArg args[MAX_OPC_PARAM];
-
     /* Register preferences for the output(s).  */
     TCGRegSet output_pref[2];
+
+    /* Arguments for the opcode.  */
+    TCGArg args[];
 } TCGOp;
 
 #define TCGOP_CALLI(X)    (X)->param1
@@ -1014,10 +1000,12 @@ bool tcg_op_supported(TCGOpcode op);
 
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
index a6aaacd053..c7d6514840 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -258,10 +258,13 @@ static TCGOp *rm_ops(TCGOp *op)
 
 static TCGOp *copy_op_nocheck(TCGOp **begin_op, TCGOp *op)
 {
-    *begin_op = QTAILQ_NEXT(*begin_op, link);
-    tcg_debug_assert(*begin_op);
-    op = tcg_op_insert_after(tcg_ctx, op, (*begin_op)->opc);
-    memcpy(op->args, (*begin_op)->args, sizeof(op->args));
+    TCGOp *old_op = QTAILQ_NEXT(*begin_op, link);
+    unsigned nargs = old_op->nargs;
+
+    *begin_op = old_op;
+    op = tcg_op_insert_after(tcg_ctx, op, old_op->opc, nargs);
+    memcpy(op->args, old_op->args, sizeof(op->args[0]) * nargs);
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
index aae4046e1b..ccbe947222 100644
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
@@ -1513,7 +1513,13 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         }
     }
 
-    op = tcg_emit_op(INDEX_op_call);
+    /*
+     * A Call op needs up to 4 + 2N parameters on 32-bit archs,
+     * and up to 4 + N parameters on 64-bit archs
+     * (N = number of input arguments + output arguments).
+     */
+    max_args = (64 / TCG_TARGET_REG_BITS) * nargs + 4;
+    op = tcg_emit_op(INDEX_op_call, max_args);
 
     pi = 0;
     if (ret != NULL) {
@@ -1590,7 +1596,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
     /* Make sure the fields didn't overflow.  */
     tcg_debug_assert(TCGOP_CALLI(op) == real_args);
-    tcg_debug_assert(pi <= ARRAY_SIZE(op->args));
+    tcg_debug_assert(pi <= max_args);
 
     if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
         for (i = 0; i < nargs; ++i) {
@@ -2294,41 +2300,56 @@ void tcg_remove_ops_after(TCGOp *op)
     }
 }
 
-static TCGOp *tcg_op_alloc(TCGOpcode opc)
+static TCGOp *tcg_op_alloc(TCGOpcode opc, unsigned nargs)
 {
     TCGContext *s = tcg_ctx;
-    TCGOp *op;
+    TCGOp *op = NULL;
 
-    if (likely(QTAILQ_EMPTY(&s->free_ops))) {
-        op = tcg_malloc(sizeof(TCGOp));
-    } else {
-        op = QTAILQ_FIRST(&s->free_ops);
-        QTAILQ_REMOVE(&s->free_ops, op, link);
+    if (unlikely(!QTAILQ_EMPTY(&s->free_ops))) {
+        QTAILQ_FOREACH(op, &s->free_ops, link) {
+            if (nargs <= op->nargs) {
+                QTAILQ_REMOVE(&s->free_ops, op, link);
+                nargs = op->nargs;
+                goto found;
+            }
+        }
     }
+
+    /* Most opcodes have 3 or 4 operands: reduce fragmentation. */
+    nargs = MAX(4, nargs);
+    op = tcg_malloc(sizeof(TCGOp) + sizeof(TCGArg) * nargs);
+
+ found:
     memset(op, 0, offsetof(TCGOp, link));
     op->opc = opc;
-    s->nb_ops++;
+    op->nargs = nargs;
 
+    /* Check for bitfield overflow. */
+    tcg_debug_assert(op->nargs == nargs);
+
+    s->nb_ops++;
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
@@ -2937,7 +2958,7 @@ static bool liveness_pass_2(TCGContext *s)
                     TCGOpcode lopc = (arg_ts->type == TCG_TYPE_I32
                                       ? INDEX_op_ld_i32
                                       : INDEX_op_ld_i64);
-                    TCGOp *lop = tcg_op_insert_before(s, op, lopc);
+                    TCGOp *lop = tcg_op_insert_before(s, op, lopc, 3);
 
                     lop->args[0] = temp_arg(dir_ts);
                     lop->args[1] = temp_arg(arg_ts->mem_base);
@@ -3003,7 +3024,7 @@ static bool liveness_pass_2(TCGContext *s)
                     TCGOpcode sopc = (arg_ts->type == TCG_TYPE_I32
                                       ? INDEX_op_st_i32
                                       : INDEX_op_st_i64);
-                    TCGOp *sop = tcg_op_insert_after(s, op, sopc);
+                    TCGOp *sop = tcg_op_insert_after(s, op, sopc, 3);
                     TCGTemp *out_ts = dir_ts;
 
                     if (IS_DEAD_ARG(0)) {
@@ -3039,7 +3060,7 @@ static bool liveness_pass_2(TCGContext *s)
                     TCGOpcode sopc = (arg_ts->type == TCG_TYPE_I32
                                       ? INDEX_op_st_i32
                                       : INDEX_op_st_i64);
-                    TCGOp *sop = tcg_op_insert_after(s, op, sopc);
+                    TCGOp *sop = tcg_op_insert_after(s, op, sopc, 3);
 
                     sop->args[0] = temp_arg(dir_ts);
                     sop->args[1] = temp_arg(arg_ts->mem_base);
-- 
2.34.1


