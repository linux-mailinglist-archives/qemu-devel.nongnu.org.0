Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362396AA467
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYDvx-0005WD-GP; Fri, 03 Mar 2023 17:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYDvg-0005Pk-4V
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:31:08 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYDvY-0007vH-RK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:31:06 -0500
Received: by mail-pj1-x102b.google.com with SMTP id x34so4173194pjj.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 14:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677882659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UjrCAUK9hqpmBfed71834dqlSNQejblGv7FQtUqKrwI=;
 b=qxQ0FrAabuhgYiQxyv5HcctgsmWMlbWvjJG3NOa2FhqfpeM5jRFAUA1HZ4EZLszUnn
 dRtkA7Uc/QEZBZ/Zxkaa/u0fcTHeAarg4QP/7pz5RGGVvrKs/N1ouiJYe0GA3Q6g1szr
 LqlaBk1GbCw1rc2JC2m0g1UhR4TnwmgsE74L0m/FCOo39wd/UcWDOaU28XlsNzek88GS
 Jh55YP+/XG+LJyL6elDsj0XLb307T83kE+5ZX3Ldp6XQ9XP22k2ziV785aF11G650gHw
 m7L1Nm7ZTZlKH/30+ofZUZx2Kabv0exSRA6YXhynyqi/ei6bvib9sVOLRio18DSqYCYj
 ko4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677882659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UjrCAUK9hqpmBfed71834dqlSNQejblGv7FQtUqKrwI=;
 b=EtHSYj91OJsAt6ohiWIqrSl+wGNRlAjhYtlGNrC+bApFLsoLlCOw50mRv6RnBCJ+Cn
 fbMxCzr1vjPY0z3J38rEBarbYiZ1tH2s3ZGhS09O8jdaRWRZwNxSld8iJp8YgM/IRYMq
 HZtbr743dMnu0wwE5i2EvquUxMgUgoJSas1B+Emdhf+yemGD+034yi94XIP6rYR8A7QW
 UlmXyS0XkWT+MCD7CNNshxuJp1h1ch5l+CPp9c4fioVqeds5HXg22Wh1Ar6ZocZDeVmr
 N01ddaN6RMVeQCsa1JipPa8mxgtemVgM6bzg9fifoQOtvD0GjYUD0PhSZ2hK/enJz87G
 XtXA==
X-Gm-Message-State: AO0yUKWhDQJ+YmOf91Cl0eocp/TNZm7vdPrts7gVx7MjnvuCIu9y50lo
 Y0rfX2+NrKlne+Bg/B5psF4nmIv8443XCQhYaKAHmQ==
X-Google-Smtp-Source: AK7set/IQVXvIMnqhxEi/vBR/bXh5gHHM+RM6nAKFzUBXGERGmi05+trD4fVLTFp/bMSDYj/jLrcnA==
X-Received: by 2002:a17:902:760d:b0:19c:e6c8:db16 with SMTP id
 k13-20020a170902760d00b0019ce6c8db16mr2833529pll.27.1677882659154; 
 Fri, 03 Mar 2023 14:30:59 -0800 (PST)
Received: from stoup.. (174-21-74-159.tukw.qwest.net. [174.21.74.159])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170902b60500b0019a87ede846sm1963742pls.285.2023.03.03.14.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 14:30:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng,
	tsimpson@quicinc.com
Subject: [PATCH 1/2] tcg: Link branches to the labels
Date: Fri,  3 Mar 2023 14:30:55 -0800
Message-Id: <20230303223056.966286-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303223056.966286-1-richard.henderson@linaro.org>
References: <20230303223056.966286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

This allows us to easily find all branches that use a label.
Since 'refs' is only tested vs zero, remove it and test for
an empty list instead.  Drop the use of bitfields, which had
been used to pack refs into a single 32-bit word.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  7 +------
 include/tcg/tcg.h    | 19 +++++++++++++------
 tcg/tcg-op.c         | 22 +++++++++++++++++++---
 tcg/tcg.c            | 30 ++++++++++++++++++++----------
 4 files changed, 53 insertions(+), 25 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 353d430a63..70856147c5 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -259,12 +259,7 @@ static inline void gen_set_label(TCGLabel *l)
     tcg_gen_op1(INDEX_op_set_label, label_arg(l));
 }
 
-static inline void tcg_gen_br(TCGLabel *l)
-{
-    l->refs++;
-    tcg_gen_op1(INDEX_op_br, label_arg(l));
-}
-
+void tcg_gen_br(TCGLabel *l);
 void tcg_gen_mb(TCGBar);
 
 /* Helper calls. */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7e2b954dbc..0dc88011ce 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -238,16 +238,23 @@ struct TCGRelocation {
     int type;
 };
 
+typedef struct TCGOp TCGOp;
+typedef struct TCGLabelUse TCGLabelUse;
+struct TCGLabelUse {
+    QSIMPLEQ_ENTRY(TCGLabelUse) next;
+    TCGOp *op;
+};
+
 typedef struct TCGLabel TCGLabel;
 struct TCGLabel {
-    unsigned present : 1;
-    unsigned has_value : 1;
-    unsigned id : 14;
-    unsigned refs : 16;
+    bool present;
+    bool has_value;
+    uint16_t id;
     union {
         uintptr_t value;
         const tcg_insn_unit *value_ptr;
     } u;
+    QSIMPLEQ_HEAD(, TCGLabelUse) branches;
     QSIMPLEQ_HEAD(, TCGRelocation) relocs;
     QSIMPLEQ_ENTRY(TCGLabel) next;
 };
@@ -487,7 +494,7 @@ typedef struct TCGTempSet {
 #define SYNC_ARG  (1 << 0)
 typedef uint32_t TCGLifeData;
 
-typedef struct TCGOp {
+struct TCGOp {
     TCGOpcode opc   : 8;
     unsigned nargs  : 8;
 
@@ -506,7 +513,7 @@ typedef struct TCGOp {
 
     /* Arguments for the opcode.  */
     TCGArg args[];
-} TCGOp;
+};
 
 #define TCGOP_CALLI(X)    (X)->param1
 #define TCGOP_CALLO(X)    (X)->param2
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index f2269a1b91..befc7c000d 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -84,6 +84,22 @@ void tcg_gen_op6(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3,
     op->args[5] = a6;
 }
 
+/* Generic ops.  */
+
+static void last_is_label_use(TCGLabel *l)
+{
+    TCGLabelUse *u = tcg_malloc(sizeof(TCGLabelUse));
+
+    u->op = tcg_last_op();
+    QSIMPLEQ_INSERT_TAIL(&l->branches, u, next);
+}
+
+void tcg_gen_br(TCGLabel *l)
+{
+    tcg_gen_op1(INDEX_op_br, label_arg(l));
+    last_is_label_use(l);
+}
+
 void tcg_gen_mb(TCGBar mb_type)
 {
     if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {
@@ -216,8 +232,8 @@ void tcg_gen_brcond_i32(TCGCond cond, TCGv_i32 arg1, TCGv_i32 arg2, TCGLabel *l)
     if (cond == TCG_COND_ALWAYS) {
         tcg_gen_br(l);
     } else if (cond != TCG_COND_NEVER) {
-        l->refs++;
         tcg_gen_op4ii_i32(INDEX_op_brcond_i32, arg1, arg2, cond, label_arg(l));
+        last_is_label_use(l);
     }
 }
 
@@ -1474,7 +1490,6 @@ void tcg_gen_brcond_i64(TCGCond cond, TCGv_i64 arg1, TCGv_i64 arg2, TCGLabel *l)
     if (cond == TCG_COND_ALWAYS) {
         tcg_gen_br(l);
     } else if (cond != TCG_COND_NEVER) {
-        l->refs++;
         if (TCG_TARGET_REG_BITS == 32) {
             tcg_gen_op6ii_i32(INDEX_op_brcond2_i32, TCGV_LOW(arg1),
                               TCGV_HIGH(arg1), TCGV_LOW(arg2),
@@ -1483,6 +1498,7 @@ void tcg_gen_brcond_i64(TCGCond cond, TCGv_i64 arg1, TCGv_i64 arg2, TCGLabel *l)
             tcg_gen_op4ii_i64(INDEX_op_brcond_i64, arg1, arg2, cond,
                               label_arg(l));
         }
+        last_is_label_use(l);
     }
 }
 
@@ -1493,12 +1509,12 @@ void tcg_gen_brcondi_i64(TCGCond cond, TCGv_i64 arg1, int64_t arg2, TCGLabel *l)
     } else if (cond == TCG_COND_ALWAYS) {
         tcg_gen_br(l);
     } else if (cond != TCG_COND_NEVER) {
-        l->refs++;
         tcg_gen_op6ii_i32(INDEX_op_brcond2_i32,
                           TCGV_LOW(arg1), TCGV_HIGH(arg1),
                           tcg_constant_i32(arg2),
                           tcg_constant_i32(arg2 >> 32),
                           cond, label_arg(l));
+        last_is_label_use(l);
     }
 }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5cccc06ae3..a8ec11dfb9 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -282,6 +282,7 @@ TCGLabel *gen_new_label(void)
 
     memset(l, 0, sizeof(TCGLabel));
     l->id = s->nb_labels++;
+    QSIMPLEQ_INIT(&l->branches);
     QSIMPLEQ_INIT(&l->relocs);
 
     QSIMPLEQ_INSERT_TAIL(&s->labels, l, next);
@@ -2519,23 +2520,32 @@ static void process_op_defs(TCGContext *s)
     }
 }
 
+static void remove_label_use(TCGOp *op, int idx)
+{
+    TCGLabel *label = arg_label(op->args[idx]);
+    TCGLabelUse *use;
+
+    QSIMPLEQ_FOREACH(use, &label->branches, next) {
+        if (use->op == op) {
+            QSIMPLEQ_REMOVE(&label->branches, use, TCGLabelUse, next);
+            return;
+        }
+    }
+    g_assert_not_reached();
+}
+
 void tcg_op_remove(TCGContext *s, TCGOp *op)
 {
-    TCGLabel *label;
-
     switch (op->opc) {
     case INDEX_op_br:
-        label = arg_label(op->args[0]);
-        label->refs--;
+        remove_label_use(op, 0);
         break;
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        label = arg_label(op->args[3]);
-        label->refs--;
+        remove_label_use(op, 3);
         break;
     case INDEX_op_brcond2_i32:
-        label = arg_label(op->args[5]);
-        label->refs--;
+        remove_label_use(op, 5);
         break;
     default:
         break;
@@ -2647,7 +2657,7 @@ reachable_code_pass(TCGContext *s)
                 dead = false;
             }
 
-            if (label->refs == 0) {
+            if (QSIMPLEQ_EMPTY(&label->branches)) {
                 /*
                  * While there is an occasional backward branch, virtually
                  * all branches generated by the translators are forward.
@@ -4891,7 +4901,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
         bool error = false;
 
         QSIMPLEQ_FOREACH(l, &s->labels, next) {
-            if (unlikely(!l->present) && l->refs) {
+            if (unlikely(!l->present) && !QSIMPLEQ_EMPTY(&l->branches)) {
                 qemu_log_mask(CPU_LOG_TB_OP,
                               "$L%d referenced but not present.\n", l->id);
                 error = true;
-- 
2.34.1


