Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F3065FA5A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:34:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdFA-0003Yq-2J; Thu, 05 Jan 2023 22:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDdEW-0003RZ-DX
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:17:28 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDdES-00015T-UE
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:17:27 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so3953072pjk.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 19:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DXv8TLRFB3/z8iNdsBm+EOutzgZIC8qOABJHFyYU1UE=;
 b=tEXLYlWtc9fD7idHyzthH4WuRjFa6EiRlXCry6OQN7sfPh1Fg896VgxL2VEn89Rf5G
 Gxgktq/AVSGsxun1c6Kt7tKE6I5a+RWapMkuaBngj0+Iz+LXkMzdtbyGblg7xDpH1Suv
 IEBVjSVXL7MuE+/MSBpkYhd7+b/fs8AzP2cqxwJBW3nNcQNNGsw2cAqcRxw4/PuNIJAx
 D7QGv/jOCtdqWYAHjEI613CPbrLJP0vXIR4vY2ED8gVQTsxpBs4yXnUM2p0OudbemHpT
 0AaHX/magtKaqkwyw3PSSJWfOk/OItTz+ut6w8f374caQ7S4+xlf0z+p3hugVzYUD5GT
 NzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXv8TLRFB3/z8iNdsBm+EOutzgZIC8qOABJHFyYU1UE=;
 b=i2JcE6OZaoI9ZIuTj24j5i6yJAuVNPXrxwZzF/iVskq4g3JyAQB8FQmmM+Tc8rCIIa
 wnp4LCcn7PtYEZxvO1ZmOONOh3JgNcsHNqI3DLLZnRgzs8N1wB959KimAKW7tPELA3LK
 MMeH9ghzQ2VKOLHk1l6VETRBHVRWNNWIWPgV1HHC4niJSJzklpiBSiuMu4dG4KMB6UrW
 9l3xMIY1+vdwpL5VBifvoXs2qJagfU6ggVQ7IN+TtNbMzgC6nEh/E8lxIxzXSDvptW1H
 ZprTISN5o6MlnQPiR8MpNtIZVfu9CxEV/NYmCNPteDRkaK2+Cyt9Goa5EBUS3gCS0Uep
 YVNA==
X-Gm-Message-State: AFqh2kruobY6pe9VcQ6ATpXJPj0EtRMjS0lVfkpx6dxpPEIZ0h214ZWt
 uVZsJ0p84VBo5q4Z6xgJGWBNxXi8F7bdTY/9
X-Google-Smtp-Source: AMrXdXtQPLLD6FchyXkG/GQhMzNKaF1u9RHdk1KNpr4MyJPIT3Wy572eRRyBvUIOCxFQJ46jMPyzuw==
X-Received: by 2002:a17:902:768c:b0:189:e360:ce5 with SMTP id
 m12-20020a170902768c00b00189e3600ce5mr69064268pll.12.1672975043097; 
 Thu, 05 Jan 2023 19:17:23 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:2cfd:802:a4a0:c8da])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a170902b18500b00193020e8a90sm1653508plr.294.2023.01.05.19.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 19:17:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL v2 19/47] tcg: Introduce paired register allocation
Date: Thu,  5 Jan 2023 19:17:19 -0800
Message-Id: <20230106031720.1204672-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106031720.1204672-1-richard.henderson@linaro.org>
References: <20230106031720.1204672-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

There are several instances where we need to be able to
allocate a pair of registers to related inputs/outputs.
Add 'p' and 'm' register constraints for this, in order to
be able to allocate the even/odd register first or second.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |   2 +
 tcg/tcg.c         | 424 ++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 378 insertions(+), 48 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d84bae6e3f..5c2254ce9f 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -951,6 +951,8 @@ typedef struct TCGArgConstraint {
     unsigned ct : 16;
     unsigned alias_index : 4;
     unsigned sort_index : 4;
+    unsigned pair_index : 4;
+    unsigned pair : 2;  /* 0: none, 1: first, 2: second, 3: second alias */
     bool oalias : 1;
     bool ialias : 1;
     bool newreg : 1;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 92141bd79a..2cf24b4453 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1969,15 +1969,32 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
 static int get_constraint_priority(const TCGOpDef *def, int k)
 {
     const TCGArgConstraint *arg_ct = &def->args_ct[k];
-    int n;
+    int n = ctpop64(arg_ct->regs);
 
-    if (arg_ct->oalias) {
-        /* an alias is equivalent to a single register */
-        n = 1;
-    } else {
-        n = ctpop64(arg_ct->regs);
+    /*
+     * Sort constraints of a single register first, which includes output
+     * aliases (which must exactly match the input already allocated).
+     */
+    if (n == 1 || arg_ct->oalias) {
+        return INT_MAX;
     }
-    return TCG_TARGET_NB_REGS - n + 1;
+
+    /*
+     * Sort register pairs next, first then second immediately after.
+     * Arbitrarily sort multiple pairs by the index of the first reg;
+     * there shouldn't be many pairs.
+     */
+    switch (arg_ct->pair) {
+    case 1:
+    case 3:
+        return (k + 1) * 2;
+    case 2:
+        return (arg_ct->pair_index + 1) * 2 - 1;
+    }
+
+    /* Finally, sort by decreasing register count. */
+    assert(n > 1);
+    return -n;
 }
 
 /* sort from highest priority to lowest */
@@ -2012,7 +2029,8 @@ static void process_op_defs(TCGContext *s)
     for (op = 0; op < NB_OPS; op++) {
         TCGOpDef *def = &tcg_op_defs[op];
         const TCGTargetOpDef *tdefs;
-        int i, o, nb_args;
+        bool saw_alias_pair = false;
+        int i, o, i2, o2, nb_args;
 
         if (def->flags & TCG_OPF_NOT_PRESENT) {
             continue;
@@ -2053,6 +2071,9 @@ static void process_op_defs(TCGContext *s)
                 /* The input sets ialias. */
                 def->args_ct[i].ialias = 1;
                 def->args_ct[i].alias_index = o;
+                if (def->args_ct[i].pair) {
+                    saw_alias_pair = true;
+                }
                 tcg_debug_assert(ct_str[1] == '\0');
                 continue;
 
@@ -2061,6 +2082,38 @@ static void process_op_defs(TCGContext *s)
                 def->args_ct[i].newreg = true;
                 ct_str++;
                 break;
+
+            case 'p': /* plus */
+                /* Allocate to the register after the previous. */
+                tcg_debug_assert(i > (input_p ? def->nb_oargs : 0));
+                o = i - 1;
+                tcg_debug_assert(!def->args_ct[o].pair);
+                tcg_debug_assert(!def->args_ct[o].ct);
+                def->args_ct[i] = (TCGArgConstraint){
+                    .pair = 2,
+                    .pair_index = o,
+                    .regs = def->args_ct[o].regs << 1,
+                };
+                def->args_ct[o].pair = 1;
+                def->args_ct[o].pair_index = i;
+                tcg_debug_assert(ct_str[1] == '\0');
+                continue;
+
+            case 'm': /* minus */
+                /* Allocate to the register before the previous. */
+                tcg_debug_assert(i > (input_p ? def->nb_oargs : 0));
+                o = i - 1;
+                tcg_debug_assert(!def->args_ct[o].pair);
+                tcg_debug_assert(!def->args_ct[o].ct);
+                def->args_ct[i] = (TCGArgConstraint){
+                    .pair = 1,
+                    .pair_index = o,
+                    .regs = def->args_ct[o].regs >> 1,
+                };
+                def->args_ct[o].pair = 2;
+                def->args_ct[o].pair_index = i;
+                tcg_debug_assert(ct_str[1] == '\0');
+                continue;
             }
 
             do {
@@ -2084,6 +2137,8 @@ static void process_op_defs(TCGContext *s)
                 default:
                 case '0' ... '9':
                 case '&':
+                case 'p':
+                case 'm':
                     /* Typo in TCGTargetOpDef constraint. */
                     g_assert_not_reached();
                 }
@@ -2093,6 +2148,79 @@ static void process_op_defs(TCGContext *s)
         /* TCGTargetOpDef entry with too much information? */
         tcg_debug_assert(i == TCG_MAX_OP_ARGS || tdefs->args_ct_str[i] == NULL);
 
+        /*
+         * Fix up output pairs that are aliased with inputs.
+         * When we created the alias, we copied pair from the output.
+         * There are three cases:
+         *    (1a) Pairs of inputs alias pairs of outputs.
+         *    (1b) One input aliases the first of a pair of outputs.
+         *    (2)  One input aliases the second of a pair of outputs.
+         *
+         * Case 1a is handled by making sure that the pair_index'es are
+         * properly updated so that they appear the same as a pair of inputs.
+         *
+         * Case 1b is handled by setting the pair_index of the input to
+         * itself, simply so it doesn't point to an unrelated argument.
+         * Since we don't encounter the "second" during the input allocation
+         * phase, nothing happens with the second half of the input pair.
+         *
+         * Case 2 is handled by setting the second input to pair=3, the
+         * first output to pair=3, and the pair_index'es to match.
+         */
+        if (saw_alias_pair) {
+            for (i = def->nb_oargs; i < nb_args; i++) {
+                /*
+                 * Since [0-9pm] must be alone in the constraint string,
+                 * the only way they can both be set is if the pair comes
+                 * from the output alias.
+                 */
+                if (!def->args_ct[i].ialias) {
+                    continue;
+                }
+                switch (def->args_ct[i].pair) {
+                case 0:
+                    break;
+                case 1:
+                    o = def->args_ct[i].alias_index;
+                    o2 = def->args_ct[o].pair_index;
+                    tcg_debug_assert(def->args_ct[o].pair == 1);
+                    tcg_debug_assert(def->args_ct[o2].pair == 2);
+                    if (def->args_ct[o2].oalias) {
+                        /* Case 1a */
+                        i2 = def->args_ct[o2].alias_index;
+                        tcg_debug_assert(def->args_ct[i2].pair == 2);
+                        def->args_ct[i2].pair_index = i;
+                        def->args_ct[i].pair_index = i2;
+                    } else {
+                        /* Case 1b */
+                        def->args_ct[i].pair_index = i;
+                    }
+                    break;
+                case 2:
+                    o = def->args_ct[i].alias_index;
+                    o2 = def->args_ct[o].pair_index;
+                    tcg_debug_assert(def->args_ct[o].pair == 2);
+                    tcg_debug_assert(def->args_ct[o2].pair == 1);
+                    if (def->args_ct[o2].oalias) {
+                        /* Case 1a */
+                        i2 = def->args_ct[o2].alias_index;
+                        tcg_debug_assert(def->args_ct[i2].pair == 1);
+                        def->args_ct[i2].pair_index = i;
+                        def->args_ct[i].pair_index = i2;
+                    } else {
+                        /* Case 2 */
+                        def->args_ct[i].pair = 3;
+                        def->args_ct[o2].pair = 3;
+                        def->args_ct[i].pair_index = o2;
+                        def->args_ct[o2].pair_index = i;
+                    }
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
+            }
+        }
+
         /* sort the constraints (XXX: this is just an heuristic) */
         sort_constraints(def, 0, def->nb_oargs);
         sort_constraints(def, def->nb_oargs, def->nb_iargs);
@@ -3141,6 +3269,52 @@ static TCGReg tcg_reg_alloc(TCGContext *s, TCGRegSet required_regs,
     tcg_abort();
 }
 
+static TCGReg tcg_reg_alloc_pair(TCGContext *s, TCGRegSet required_regs,
+                                 TCGRegSet allocated_regs,
+                                 TCGRegSet preferred_regs, bool rev)
+{
+    int i, j, k, fmin, n = ARRAY_SIZE(tcg_target_reg_alloc_order);
+    TCGRegSet reg_ct[2];
+    const int *order;
+
+    /* Ensure that if I is not in allocated_regs, I+1 is not either. */
+    reg_ct[1] = required_regs & ~(allocated_regs | (allocated_regs >> 1));
+    tcg_debug_assert(reg_ct[1] != 0);
+    reg_ct[0] = reg_ct[1] & preferred_regs;
+
+    order = rev ? indirect_reg_alloc_order : tcg_target_reg_alloc_order;
+
+    /*
+     * Skip the preferred_regs option if it cannot be satisfied,
+     * or if the preference made no difference.
+     */
+    k = reg_ct[0] == 0 || reg_ct[0] == reg_ct[1];
+
+    /*
+     * Minimize the number of flushes by looking for 2 free registers first,
+     * then a single flush, then two flushes.
+     */
+    for (fmin = 2; fmin >= 0; fmin--) {
+        for (j = k; j < 2; j++) {
+            TCGRegSet set = reg_ct[j];
+
+            for (i = 0; i < n; i++) {
+                TCGReg reg = order[i];
+
+                if (tcg_regset_test_reg(set, reg)) {
+                    int f = !s->reg_to_temp[reg] + !s->reg_to_temp[reg + 1];
+                    if (f >= fmin) {
+                        tcg_reg_free(s, reg, allocated_regs);
+                        tcg_reg_free(s, reg + 1, allocated_regs);
+                        return reg;
+                    }
+                }
+            }
+        }
+    }
+    tcg_abort();
+}
+
 /* Make sure the temporary is in a register.  If needed, allocate the register
    from DESIRED while avoiding ALLOCATED.  */
 static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
@@ -3550,8 +3724,10 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
     /* satisfy input constraints */
     for (k = 0; k < nb_iargs; k++) {
-        TCGRegSet i_preferred_regs;
-        bool allocate_new_reg;
+        TCGRegSet i_preferred_regs, i_required_regs;
+        bool allocate_new_reg, copyto_new_reg;
+        TCGTemp *ts2;
+        int i1, i2;
 
         i = def->args_ct[nb_oargs + k].sort_index;
         arg = op->args[i];
@@ -3568,43 +3744,164 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
         reg = ts->reg;
         i_preferred_regs = 0;
+        i_required_regs = arg_ct->regs;
         allocate_new_reg = false;
+        copyto_new_reg = false;
 
-        if (arg_ct->ialias) {
+        switch (arg_ct->pair) {
+        case 0: /* not paired */
+            if (arg_ct->ialias) {
+                i_preferred_regs = op->output_pref[arg_ct->alias_index];
+
+                /*
+                 * If the input is readonly, then it cannot also be an
+                 * output and aliased to itself.  If the input is not
+                 * dead after the instruction, we must allocate a new
+                 * register and move it.
+                 */
+                if (temp_readonly(ts) || !IS_DEAD_ARG(i)) {
+                    allocate_new_reg = true;
+                } else if (ts->val_type == TEMP_VAL_REG) {
+                    /*
+                     * Check if the current register has already been
+                     * allocated for another input.
+                     */
+                    allocate_new_reg =
+                        tcg_regset_test_reg(i_allocated_regs, reg);
+                }
+            }
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
+        case 1:
+            /* First of an input pair; if i1 == i2, the second is an output. */
+            i1 = i;
+            i2 = arg_ct->pair_index;
+            ts2 = i1 != i2 ? arg_temp(op->args[i2]) : NULL;
+
+            /*
+             * It is easier to default to allocating a new pair
+             * and to identify a few cases where it's not required.
+             */
+            if (arg_ct->ialias) {
+                i_preferred_regs = op->output_pref[arg_ct->alias_index];
+                if (IS_DEAD_ARG(i1) &&
+                    IS_DEAD_ARG(i2) &&
+                    !temp_readonly(ts) &&
+                    ts->val_type == TEMP_VAL_REG &&
+                    ts->reg < TCG_TARGET_NB_REGS - 1 &&
+                    tcg_regset_test_reg(i_required_regs, reg) &&
+                    !tcg_regset_test_reg(i_allocated_regs, reg) &&
+                    !tcg_regset_test_reg(i_allocated_regs, reg + 1) &&
+                    (ts2
+                     ? ts2->val_type == TEMP_VAL_REG &&
+                       ts2->reg == reg + 1 &&
+                       !temp_readonly(ts2)
+                     : s->reg_to_temp[reg + 1] == NULL)) {
+                    break;
+                }
+            } else {
+                /* Without aliasing, the pair must also be an input. */
+                tcg_debug_assert(ts2);
+                if (ts->val_type == TEMP_VAL_REG &&
+                    ts2->val_type == TEMP_VAL_REG &&
+                    ts2->reg == reg + 1 &&
+                    tcg_regset_test_reg(i_required_regs, reg)) {
+                    break;
+                }
+            }
+            reg = tcg_reg_alloc_pair(s, i_required_regs, i_allocated_regs,
+                                     0, ts->indirect_base);
+            goto do_pair;
+
+        case 2: /* pair second */
+            reg = new_args[arg_ct->pair_index] + 1;
+            goto do_pair;
+
+        case 3: /* ialias with second output, no first input */
+            tcg_debug_assert(arg_ct->ialias);
             i_preferred_regs = op->output_pref[arg_ct->alias_index];
 
-            /*
-             * If the input is readonly, then it cannot also be an
-             * output and aliased to itself.  If the input is not
-             * dead after the instruction, we must allocate a new
-             * register and move it.
-             */
-            if (temp_readonly(ts) || !IS_DEAD_ARG(i)) {
-                allocate_new_reg = true;
-            } else if (ts->val_type == TEMP_VAL_REG) {
-                /*
-                 * Check if the current register has already been
-                 * allocated for another input.
-                 */
-                allocate_new_reg = tcg_regset_test_reg(i_allocated_regs, reg);
+            if (IS_DEAD_ARG(i) &&
+                !temp_readonly(ts) &&
+                ts->val_type == TEMP_VAL_REG &&
+                reg > 0 &&
+                s->reg_to_temp[reg - 1] == NULL &&
+                tcg_regset_test_reg(i_required_regs, reg) &&
+                !tcg_regset_test_reg(i_allocated_regs, reg) &&
+                !tcg_regset_test_reg(i_allocated_regs, reg - 1)) {
+                tcg_regset_set_reg(i_allocated_regs, reg - 1);
+                break;
             }
-        }
+            reg = tcg_reg_alloc_pair(s, i_required_regs >> 1,
+                                     i_allocated_regs, 0,
+                                     ts->indirect_base);
+            tcg_regset_set_reg(i_allocated_regs, reg);
+            reg += 1;
+            goto do_pair;
 
-        if (!allocate_new_reg) {
-            temp_load(s, ts, arg_ct->regs, i_allocated_regs, i_preferred_regs);
-            reg = ts->reg;
-            allocate_new_reg = !tcg_regset_test_reg(arg_ct->regs, reg);
-        }
-
-        if (allocate_new_reg) {
+        do_pair:
             /*
-             * Allocate a new register matching the constraint
-             * and move the temporary register into it.
+             * If an aliased input is not dead after the instruction,
+             * we must allocate a new register and move it.
              */
-            temp_load(s, ts, tcg_target_available_regs[ts->type],
-                      i_allocated_regs, 0);
-            reg = tcg_reg_alloc(s, arg_ct->regs, i_allocated_regs,
-                                i_preferred_regs, ts->indirect_base);
+            if (arg_ct->ialias && (!IS_DEAD_ARG(i) || temp_readonly(ts))) {
+                TCGRegSet t_allocated_regs = i_allocated_regs;
+
+                /*
+                 * Because of the alias, and the continued life, make sure
+                 * that the temp is somewhere *other* than the reg pair,
+                 * and we get a copy in reg.
+                 */
+                tcg_regset_set_reg(t_allocated_regs, reg);
+                tcg_regset_set_reg(t_allocated_regs, reg + 1);
+                if (ts->val_type == TEMP_VAL_REG && ts->reg == reg) {
+                    /* If ts was already in reg, copy it somewhere else. */
+                    TCGReg nr;
+                    bool ok;
+
+                    tcg_debug_assert(ts->kind != TEMP_FIXED);
+                    nr = tcg_reg_alloc(s, tcg_target_available_regs[ts->type],
+                                       t_allocated_regs, 0, ts->indirect_base);
+                    ok = tcg_out_mov(s, ts->type, nr, reg);
+                    tcg_debug_assert(ok);
+
+                    set_temp_val_reg(s, ts, nr);
+                } else {
+                    temp_load(s, ts, tcg_target_available_regs[ts->type],
+                              t_allocated_regs, 0);
+                    copyto_new_reg = true;
+                }
+            } else {
+                /* Preferably allocate to reg, otherwise copy. */
+                i_required_regs = (TCGRegSet)1 << reg;
+                temp_load(s, ts, i_required_regs, i_allocated_regs,
+                          i_preferred_regs);
+                copyto_new_reg = ts->reg != reg;
+            }
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+
+        if (copyto_new_reg) {
             if (!tcg_out_mov(s, ts->type, reg, ts->reg)) {
                 /*
                  * Cross register class move not supported.  Sync the
@@ -3656,15 +3953,46 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
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
+            case 1: /* first of pair */
+                tcg_debug_assert(!arg_ct->newreg);
+                if (arg_ct->oalias) {
+                    reg = new_args[arg_ct->alias_index];
+                    break;
+                }
+                reg = tcg_reg_alloc_pair(s, arg_ct->regs, o_allocated_regs,
+                                         op->output_pref[k], ts->indirect_base);
+                break;
+
+            case 2: /* second of pair */
+                tcg_debug_assert(!arg_ct->newreg);
+                if (arg_ct->oalias) {
+                    reg = new_args[arg_ct->alias_index];
+                } else {
+                    reg = new_args[arg_ct->pair_index] + 1;
+                }
+                break;
+
+            case 3: /* first of pair, aliasing with a second input */
+                tcg_debug_assert(!arg_ct->newreg);
+                reg = new_args[arg_ct->pair_index] - 1;
+                break;
+
+            default:
+                g_assert_not_reached();
             }
             tcg_regset_set_reg(o_allocated_regs, reg);
             set_temp_val_reg(s, ts, reg);
-- 
2.34.1


