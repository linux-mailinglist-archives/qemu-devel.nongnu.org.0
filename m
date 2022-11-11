Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EDB62548C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:43:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOg9-0006nu-QY; Fri, 11 Nov 2022 02:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfu-0006g6-Jp
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:09 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfs-00009W-RG
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:06 -0500
Received: by mail-pj1-x102c.google.com with SMTP id l6so3813708pjj.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4Y/D4Kc0/92RtE/IJVZhIY6ejmFtU7crmyDlGuoab6g=;
 b=wpgD0VtP6x1Ds+zCMMA+8TKE2iHe6u/WiHf2Cp0SO45L2+KFONVa3GubRLDZq01gvf
 /FGDi13gdKrUN9rdVngisjSjdRriUq7ByVNv6dZG1B5mIMqFkMb6vLTljqJpzsZnbrJt
 jB9Taar6rc65+OCew246wgIbIpwykEITLRwal3r3XNQ5zfJuf52rXMHMflILIyEF2zNN
 e3I/kOqE8cHKzgB5HJekKyPz75UwUHRTPEqhyKRqNrxem1sRdReRKKD4hKNW49XAQZUW
 MlI+KZf7V4XxtasMi5rYCPaXaeQe+1yFiQ8Q32OebVXXLEAiCZzzPr1uKhrCq77W4yp6
 rQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Y/D4Kc0/92RtE/IJVZhIY6ejmFtU7crmyDlGuoab6g=;
 b=Z3P5gTmN/aAQ4E1aDC0ymwiGDJfGCgcT3gQyTKDxsUNCG7cxPiD8z6YJikNnmQrQZX
 6J51+GmzQUIHxqRJnGMM7pRt5eMX+5Ame41sCx9hxptJH0MyvgnaRPt2OH+KbnMBbZBY
 6wgRcP7bEnjvomTy1S0z3Oz+FH5dPdkYXCSeG9Rh3wgZMM0ArKqeVYpn78VqmGnRpjrY
 zLKbopQM+ddZc75LfJ2vHLrNgXKMFSfoxT7cRJqozrSJpC/hg1BVSy7z7KVTvj6C2VhB
 cGjxjazFOu5ltwnVH3xjNIqDQEuW4StjaJ6iZDxoaS+IU+AxoXX014UTIsW+/n3/1JOu
 jdPg==
X-Gm-Message-State: ANoB5pkHCCtEg23ncxdiiKi2VQ0+xRgBNLggx8Tto4B22nN/kVGlJMQ0
 emvZ53IyAEYlkGeuCWNF+j3r4c0PT5rqIFWR
X-Google-Smtp-Source: AA0mqf7CA/qXxj4Ve6FPZYrwj3Oq0w6ibT5in0+3yN8xTlFkT+y1AQx2a705ARp/VemZLyHwcYDVBw==
X-Received: by 2002:a17:90b:3d0e:b0:20a:d81d:a8 with SMTP id
 pt14-20020a17090b3d0e00b0020ad81d00a8mr594044pjb.177.1668152523462; 
 Thu, 10 Nov 2022 23:42:03 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.42.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:42:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 24/45] tcg: Use output_pref wrapper function
Date: Fri, 11 Nov 2022 17:40:40 +1000
Message-Id: <20221111074101.2069454-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
index 52261417b8..65be472fef 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1957,7 +1957,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
 
         if (have_prefs) {
             for (i = 0; i < nb_oargs; ++i) {
-                TCGRegSet set = op->output_pref[i];
+                TCGRegSet set = output_pref(op, i);
 
                 if (i == 0) {
                     ne_fprintf(f, "  pref=");
@@ -2627,11 +2627,11 @@ static void liveness_pass_1(TCGContext *s)
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
@@ -2793,7 +2793,9 @@ static void liveness_pass_1(TCGContext *s)
                 ts = arg_temp(op->args[i]);
 
                 /* Remember the preference of the uses that followed.  */
-                op->output_pref[i] = *la_temp_pref(ts);
+                if (i < ARRAY_SIZE(op->output_pref)) {
+                    op->output_pref[i] = *la_temp_pref(ts);
+                }
 
                 /* Output args are dead.  */
                 if (ts->state & TS_DEAD) {
@@ -2863,7 +2865,7 @@ static void liveness_pass_1(TCGContext *s)
 
                     set &= ct->regs;
                     if (ct->ialias) {
-                        set &= op->output_pref[ct->alias_index];
+                        set &= output_pref(op, ct->alias_index);
                     }
                     /* If the combination is not possible, restart.  */
                     if (set == 0) {
@@ -3581,7 +3583,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
     TCGType otype, itype;
 
     allocated_regs = s->reserved_regs;
-    preferred_regs = op->output_pref[0];
+    preferred_regs = output_pref(op, 0);
     ots = arg_temp(op->args[0]);
     ts = arg_temp(op->args[1]);
 
@@ -3696,7 +3698,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
         if (IS_DEAD_ARG(1)) {
             temp_dead(s, its);
         }
-        tcg_reg_alloc_do_movi(s, ots, val, arg_life, op->output_pref[0]);
+        tcg_reg_alloc_do_movi(s, ots, val, arg_life, output_pref(op, 0));
         return;
     }
 
@@ -3712,7 +3714,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
             tcg_regset_set_reg(allocated_regs, its->reg);
         }
         ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
-                                 op->output_pref[0], ots->indirect_base);
+                                 output_pref(op, 0), ots->indirect_base);
         ots->val_type = TEMP_VAL_REG;
         ots->mem_coherent = 0;
         s->reg_to_temp[ots->reg] = ots;
@@ -3831,7 +3833,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         switch (arg_ct->pair) {
         case 0: /* not paired */
             if (arg_ct->ialias) {
-                i_preferred_regs = op->output_pref[arg_ct->alias_index];
+                i_preferred_regs = output_pref(op, arg_ct->alias_index);
 
                 /*
                  * If the input is readonly, then it cannot also be an
@@ -3882,7 +3884,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             ts2 = i1 != i2 ? arg_temp(op->args[i2]) : NULL;
 
             if (arg_ct->ialias) {
-                i_preferred_regs = op->output_pref[arg_ct->alias_index];
+                i_preferred_regs = output_pref(op, arg_ct->alias_index);
                 if (IS_DEAD_ARG(i1) &&
                     IS_DEAD_ARG(i2) &&
                     !temp_readonly(ts) &&
@@ -3928,7 +3930,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
         case 3: /* ialias with second output, no first input */
             tcg_debug_assert(arg_ct->ialias);
-            i_preferred_regs = op->output_pref[arg_ct->alias_index];
+            i_preferred_regs = output_pref(op, arg_ct->alias_index);
 
             allocate_new_reg = true;
             if (IS_DEAD_ARG(i) &&
@@ -4018,10 +4020,10 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
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
 
@@ -4032,7 +4034,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
                     break;
                 }
                 reg = tcg_reg_alloc_pair(s, arg_ct->regs, o_allocated_regs,
-                                         op->output_pref[k], ts->indirect_base);
+                                         output_pref(op, k), ts->indirect_base);
                 break;
 
             case 2: /* second of pair */
@@ -4123,7 +4125,7 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
         }
 
         ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
-                                 op->output_pref[0], ots->indirect_base);
+                                 output_pref(op, 0), ots->indirect_base);
         ots->val_type = TEMP_VAL_REG;
         ots->mem_coherent = 0;
         s->reg_to_temp[ots->reg] = ots;
-- 
2.34.1


