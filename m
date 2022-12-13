Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF5764BE7D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmy-0000i6-Ta; Tue, 13 Dec 2022 16:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmv-0000gi-JO
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:10 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmt-0003HS-JB
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:09 -0500
Received: by mail-oi1-x233.google.com with SMTP id k189so1036419oif.7
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HrfsNyGJ4cFlPj1QXpR5FkACHHSum2rmLa4iU9J/XqE=;
 b=gT5v+iVW9Fn1RXwKCtUHljwXk8vzEiKklrXDRW79V5U4duuAxkbmHivJGvar2wKgK/
 FIkd6CcsJHmlqi0o8OcPwtE+C0a1V1Q9E0WQZsf9ImCWHiW+2MJ5IMk9rXbb7VCS+/j3
 R5VkwLnZXnVPb6V/SK/DFS27xZL7NmHmjm0px7c8CVCXPA9mANCarYWx69s6zsb7xRTW
 45rqZ6txKvKZAXxtKVnkP0Cc9RYWJT6Y4lyNJQpwgcVv4lEVmDque3ta5M67fNKlAqrn
 BMGJWEqNeIlI4swZqmpR/lhalZGI+2HKU3OQJUMFCVZNQX5Libe5JmR9WVFiRv4zKPVb
 2T4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HrfsNyGJ4cFlPj1QXpR5FkACHHSum2rmLa4iU9J/XqE=;
 b=o8hBfIudfCRSi+KfH+zlXvMcaOBh3O0lX1N9cdqkSxP6+i/50SsUMAQcKD4gCE9Lvw
 +GeYhpZLyc+aongXKDVo+9t77vTlyp1xDKLPSfH+xN289sGxrKnFkHqyRVzCo7MTc+/4
 PLI3ScZkLhlBaR009mjF+0JXreGLmgUHe7otn8GNv9XRRQDPbaWxXgRCa1NwzhL55uDS
 eGFg9ErfDLq5V8HjKNF0YbkbC5toGjsOitoCSjoKXmnQqgYsURkD2waf/q8IkZ2ab7Wx
 ivuK+jF3tHhUoTYsD3Xbjl09gY150x/K1RUQCc/W21xC1dLRup4DDwIyRUm97gdWguX5
 Zm6w==
X-Gm-Message-State: ANoB5pkOCW1k2WxqKXSiAoD8NqX3s5jEObfvVt/AIcayXU/F6I7mwTT/
 GWpH+x4RQK1aLiTZ2CQ5RSHqWbh8t96YE3L3KpU=
X-Google-Smtp-Source: AA0mqf4X/zSGsmAXbdxDGaodszVgO9YZ3v49Qcu9NJDmD/yhNLEpV3pA9fKUecu2eyyCHOYzfd1MUA==
X-Received: by 2002:a54:440a:0:b0:35c:84f:7357 with SMTP id
 k10-20020a54440a000000b0035c084f7357mr10781756oiw.37.1670966765521; 
 Tue, 13 Dec 2022 13:26:05 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:26:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 21/27] tcg: Use output_pref wrapper function
Date: Tue, 13 Dec 2022 15:25:35 -0600
Message-Id: <20221213212541.1820840-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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

We will shortly have the possibility of more that two outputs,
though only for calls (for which preferences are moot).  Avoid
direct references to op->output_pref[] when possible.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  5 +++++
 tcg/tcg.c         | 34 ++++++++++++++++++----------------
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d430ea10c8..a6310b898f 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -518,6 +518,11 @@ typedef struct TCGOp {
 /* Make sure operands fit in the bitfields above.  */
 QEMU_BUILD_BUG_ON(NB_OPS > (1 << 8));
 
+static inline TCGRegSet output_pref(const TCGOp *op, unsigned i)
+{
+    return i < ARRAY_SIZE(op->output_pref) ? op->output_pref[i] : 0;
+}
+
 typedef struct TCGProfile {
     int64_t cpu_exec_time;
     int64_t tb_count1;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ccbe947222..d08323db49 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1966,7 +1966,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
 
         if (have_prefs) {
             for (i = 0; i < nb_oargs; ++i) {
-                TCGRegSet set = op->output_pref[i];
+                TCGRegSet set = output_pref(op, i);
 
                 if (i == 0) {
                     ne_fprintf(f, "  pref=");
@@ -2636,11 +2636,11 @@ static void liveness_pass_1(TCGContext *s)
                     }
                     ts->state = TS_DEAD;
                     la_reset_pref(ts);
-
-                    /* Not used -- it will be tcg_target_call_oarg_regs[i].  */
-                    op->output_pref[i] = 0;
                 }
 
+                /* Not used -- it will be tcg_target_call_oarg_reg().  */
+                memset(op->output_pref, 0, sizeof(op->output_pref));
+
                 if (!(call_flags & (TCG_CALL_NO_WRITE_GLOBALS |
                                     TCG_CALL_NO_READ_GLOBALS))) {
                     la_global_kill(s, nb_globals);
@@ -2802,7 +2802,9 @@ static void liveness_pass_1(TCGContext *s)
                 ts = arg_temp(op->args[i]);
 
                 /* Remember the preference of the uses that followed.  */
-                op->output_pref[i] = *la_temp_pref(ts);
+                if (i < ARRAY_SIZE(op->output_pref)) {
+                    op->output_pref[i] = *la_temp_pref(ts);
+                }
 
                 /* Output args are dead.  */
                 if (ts->state & TS_DEAD) {
@@ -2872,7 +2874,7 @@ static void liveness_pass_1(TCGContext *s)
 
                     set &= ct->regs;
                     if (ct->ialias) {
-                        set &= op->output_pref[ct->alias_index];
+                        set &= output_pref(op, ct->alias_index);
                     }
                     /* If the combination is not possible, restart.  */
                     if (set == 0) {
@@ -3539,7 +3541,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
     TCGReg oreg, ireg;
 
     allocated_regs = s->reserved_regs;
-    preferred_regs = op->output_pref[0];
+    preferred_regs = output_pref(op, 0);
     ots = arg_temp(op->args[0]);
     ts = arg_temp(op->args[1]);
 
@@ -3656,7 +3658,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
         if (IS_DEAD_ARG(1)) {
             temp_dead(s, its);
         }
-        tcg_reg_alloc_do_movi(s, ots, val, arg_life, op->output_pref[0]);
+        tcg_reg_alloc_do_movi(s, ots, val, arg_life, output_pref(op, 0));
         return;
     }
 
@@ -3673,7 +3675,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
             tcg_regset_set_reg(allocated_regs, its->reg);
         }
         oreg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
-                             op->output_pref[0], ots->indirect_base);
+                             output_pref(op, 0), ots->indirect_base);
         set_temp_val_reg(s, ots, oreg);
     }
 
@@ -3792,7 +3794,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         switch (arg_ct->pair) {
         case 0: /* not paired */
             if (arg_ct->ialias) {
-                i_preferred_regs = op->output_pref[arg_ct->alias_index];
+                i_preferred_regs = output_pref(op, arg_ct->alias_index);
 
                 /*
                  * If the input is not dead after the instruction,
@@ -3839,7 +3841,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
              * and to identify a few cases where it's not required.
              */
             if (arg_ct->ialias) {
-                i_preferred_regs = op->output_pref[arg_ct->alias_index];
+                i_preferred_regs = output_pref(op, arg_ct->alias_index);
                 if (IS_DEAD_ARG(i1) &&
                     IS_DEAD_ARG(i2) &&
                     ts->val_type == TEMP_VAL_REG &&
@@ -3873,7 +3875,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
         case 3: /* ialias with second output, no first input */
             tcg_debug_assert(arg_ct->ialias);
-            i_preferred_regs = op->output_pref[arg_ct->alias_index];
+            i_preferred_regs = output_pref(op, arg_ct->alias_index);
 
             if (IS_DEAD_ARG(i) &&
                 ts->val_type == TEMP_VAL_REG &&
@@ -3993,10 +3995,10 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
                 } else if (arg_ct->newreg) {
                     reg = tcg_reg_alloc(s, arg_ct->regs,
                                         i_allocated_regs | o_allocated_regs,
-                                        op->output_pref[k], ts->indirect_base);
+                                        output_pref(op, k), ts->indirect_base);
                 } else {
                     reg = tcg_reg_alloc(s, arg_ct->regs, o_allocated_regs,
-                                        op->output_pref[k], ts->indirect_base);
+                                        output_pref(op, k), ts->indirect_base);
                 }
                 break;
 
@@ -4007,7 +4009,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
                     break;
                 }
                 reg = tcg_reg_alloc_pair(s, arg_ct->regs, o_allocated_regs,
-                                         op->output_pref[k], ts->indirect_base);
+                                         output_pref(op, k), ts->indirect_base);
                 break;
 
             case 2: /* second of pair */
@@ -4090,7 +4092,7 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
         }
 
         oreg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
-                             op->output_pref[0], ots->indirect_base);
+                             output_pref(op, 0), ots->indirect_base);
         set_temp_val_reg(s, ots, oreg);
     }
 
-- 
2.34.1


