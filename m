Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0FD651556
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 23:10:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7OKU-0008T7-5v; Mon, 19 Dec 2022 17:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7OKO-0008Si-OJ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:09:44 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7OKL-0003w1-7r
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:09:43 -0500
Received: by mail-ej1-x633.google.com with SMTP id t17so25020363eju.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCa7rvoOYcxml3sS30mPGNdG0+HY4We04jGWTlwlZdc=;
 b=PMkj27TxQgGqg5m4Ns5gh4z04rnBroFHUS4EzR7nOMnbXp+gmzwDbSXXMezMvZH2uD
 F0BpSLH8mDAWx8b4AMTGUdyDXmttcDJDbbDmPZklD/4HhuNIa/54LkPh8Tw5dmxIRdVz
 SP5nBlhQ+SjWXSAh5V3voTrJFZDZfwfPB3C+EdxZhrASdauBIcBoCZKLsWKtDn626IT2
 UEJJMR5YSkZlvdaNPuj7iuut4cdBtAF6UmOdphBSVlxyQvGW+BDMZ8zpZOh2OActtNuO
 sIKJCvhVzhZcIOKYBNSZaDbh1kSkCbwFgGK5yFXcbw0Myfztz16ohfR0OKivo3JBVr59
 eH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yCa7rvoOYcxml3sS30mPGNdG0+HY4We04jGWTlwlZdc=;
 b=RMNuU3GrMYj0EyoSmiVSMpHKn2mp69kKx9UKxuoIecnBKkyIm9n9ULSyFUck0GBUyX
 FKJq1U5ZLT5JN9KNQXVz4bnhfsninZFkOnOrFHNLE37Hbt2epMB1g2z/FlMVD1sbcXfV
 VN5yGEV/HPzyCPFAI+GcMsrZliVbHwaf+QUo6NyUblpssEdNqgYqaBwYXXjaNKUBdFq5
 ugJKAEGkCrUGXGkpm4LImHchSxfnPi9qQf9OzXbQax83p8/LGFBzJSyjneAdpL695nGR
 qpYGtOQxPxS01Akg0MyDgF08sYnHJXnydnpEaJwDkuBkfdUmTtv1JDITXYO3vDev145L
 EN1Q==
X-Gm-Message-State: ANoB5pnlzm9KvpHpJnRW477tIJ6nRR9wmG+mv3OKLxqLq/8jT2ZdQHP4
 92tXg5Ruxuqt4Ramqk8uSsDkaf0DKUraiqerGNI=
X-Google-Smtp-Source: AA0mqf5VYd2Wlewbjlndn3gluJmbAW8hmbczr4UcvqvS/ZcxQ3xcgaPp7SpIJzDgbfKAEcKhjjCqSA==
X-Received: by 2002:a17:906:6bda:b0:7c0:eb38:f8af with SMTP id
 t26-20020a1709066bda00b007c0eb38f8afmr37701382ejs.2.1671487779579; 
 Mon, 19 Dec 2022 14:09:39 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170906355100b007aef930360asm4844015eja.59.2022.12.19.14.09.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 14:09:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 04b/27] tcg: Massage tcg_reg_alloc_op()
Date: Mon, 19 Dec 2022 23:09:24 +0100
Message-Id: <20221219220925.79218-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219220925.79218-1-philmd@linaro.org>
References: <20221213212541.1820840-5-richard.henderson@linaro.org>
 <20221219220925.79218-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

In preparation of introducing paired registers in the next
commit, massage tcg_reg_alloc_op() a bit by converting it to
a switch with a single case: the current non-paired register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Split from bigger patch, 2/3]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/tcg/tcg.h |  1 +
 tcg/tcg.c         | 98 ++++++++++++++++++++++++++++-------------------
 2 files changed, 59 insertions(+), 40 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d84bae6e3f..2f7bbf4882 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -951,6 +951,7 @@ typedef struct TCGArgConstraint {
     unsigned ct : 16;
     unsigned alias_index : 4;
     unsigned sort_index : 4;
+    unsigned pair : 1;  /* 0: not paired, 1: illegal */
     bool oalias : 1;
     bool ialias : 1;
     bool newreg : 1;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 92141bd79a..67cf36ace8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3550,8 +3550,8 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
     /* satisfy input constraints */
     for (k = 0; k < nb_iargs; k++) {
-        TCGRegSet i_preferred_regs;
-        bool allocate_new_reg;
+        TCGRegSet i_preferred_regs, i_required_regs;
+        bool allocate_new_reg, copyto_new_reg;
 
         i = def->args_ct[nb_oargs + k].sort_index;
         arg = op->args[i];
@@ -3568,43 +3568,54 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
         reg = ts->reg;
         i_preferred_regs = 0;
+        i_required_regs = arg_ct->regs;
         allocate_new_reg = false;
+        copyto_new_reg = false;
 
-        if (arg_ct->ialias) {
-            i_preferred_regs = op->output_pref[arg_ct->alias_index];
+        switch (arg_ct->pair) {
+        case 0: /* not paired */
+            if (arg_ct->ialias) {
+                i_preferred_regs = op->output_pref[arg_ct->alias_index];
 
-            /*
-             * If the input is readonly, then it cannot also be an
-             * output and aliased to itself.  If the input is not
-             * dead after the instruction, we must allocate a new
-             * register and move it.
-             */
-            if (temp_readonly(ts) || !IS_DEAD_ARG(i)) {
-                allocate_new_reg = true;
-            } else if (ts->val_type == TEMP_VAL_REG) {
                 /*
-                 * Check if the current register has already been
-                 * allocated for another input.
+                 * If the input is not dead after the instruction,
+                 * we must allocate a new register and move it.
                  */
-                allocate_new_reg = tcg_regset_test_reg(i_allocated_regs, reg);
+                if (!IS_DEAD_ARG(i)) {
+                    allocate_new_reg = true;
+                } else if (ts->val_type == TEMP_VAL_REG) {
+                    /*
+                     * Check if the current register has already been
+                     * allocated for another input.
+                     */
+                    allocate_new_reg =
+                        tcg_regset_test_reg(i_allocated_regs, reg);
+                }
             }
+            if (!allocate_new_reg) {
+                temp_load(s, ts, i_required_regs, i_allocated_regs,
+                          i_preferred_regs);
+                reg = ts->reg;
+                allocate_new_reg = !tcg_regset_test_reg(i_required_regs, reg);
+            }
+            if (allocate_new_reg) {
+                /*
+                 * Allocate a new register matching the constraint
+                 * and move the temporary register into it.
+                 */
+                temp_load(s, ts, tcg_target_available_regs[ts->type],
+                          i_allocated_regs, 0);
+                reg = tcg_reg_alloc(s, i_required_regs, i_allocated_regs,
+                                    i_preferred_regs, ts->indirect_base);
+                copyto_new_reg = true;
+            }
+            break;
+
+        default:
+            g_assert_not_reached();
         }
 
-        if (!allocate_new_reg) {
-            temp_load(s, ts, arg_ct->regs, i_allocated_regs, i_preferred_regs);
-            reg = ts->reg;
-            allocate_new_reg = !tcg_regset_test_reg(arg_ct->regs, reg);
-        }
-
-        if (allocate_new_reg) {
-            /*
-             * Allocate a new register matching the constraint
-             * and move the temporary register into it.
-             */
-            temp_load(s, ts, tcg_target_available_regs[ts->type],
-                      i_allocated_regs, 0);
-            reg = tcg_reg_alloc(s, arg_ct->regs, i_allocated_regs,
-                                i_preferred_regs, ts->indirect_base);
+        if (copyto_new_reg) {
             if (!tcg_out_mov(s, ts->type, reg, ts->reg)) {
                 /*
                  * Cross register class move not supported.  Sync the
@@ -3656,15 +3667,22 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             /* ENV should not be modified.  */
             tcg_debug_assert(!temp_readonly(ts));
 
-            if (arg_ct->oalias && !const_args[arg_ct->alias_index]) {
-                reg = new_args[arg_ct->alias_index];
-            } else if (arg_ct->newreg) {
-                reg = tcg_reg_alloc(s, arg_ct->regs,
-                                    i_allocated_regs | o_allocated_regs,
-                                    op->output_pref[k], ts->indirect_base);
-            } else {
-                reg = tcg_reg_alloc(s, arg_ct->regs, o_allocated_regs,
-                                    op->output_pref[k], ts->indirect_base);
+            switch (arg_ct->pair) {
+            case 0: /* not paired */
+                if (arg_ct->oalias && !const_args[arg_ct->alias_index]) {
+                    reg = new_args[arg_ct->alias_index];
+                } else if (arg_ct->newreg) {
+                    reg = tcg_reg_alloc(s, arg_ct->regs,
+                                        i_allocated_regs | o_allocated_regs,
+                                        op->output_pref[k], ts->indirect_base);
+                } else {
+                    reg = tcg_reg_alloc(s, arg_ct->regs, o_allocated_regs,
+                                        op->output_pref[k], ts->indirect_base);
+                }
+                break;
+
+            default:
+                g_assert_not_reached();
             }
             tcg_regset_set_reg(o_allocated_regs, reg);
             set_temp_val_reg(s, ts, reg);
-- 
2.38.1


