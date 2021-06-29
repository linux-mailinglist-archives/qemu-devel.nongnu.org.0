Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685613B787B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:17:58 +0200 (CEST)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJF7-0005Z5-DG
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItH-0008Gn-CG
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:23 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000tq-3k
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:23 -0400
Received: by mail-pg1-x52d.google.com with SMTP id h4so19372713pgp.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TEPibjiZ3WGZdlbuijoRm6/TkAySQTI8yVWDgR6dGzo=;
 b=nXrjCxUsM0VYCyeUmkNbu+SJdKBBgmWOiDxI3iEVrwiaOYhl3o6mgBavHLyQwGJ3/C
 WuBf7cojznS5HFTngksmHnmBIfT0bwipGhzCRs8TF71BAKc+2Lk35qM8MZQ0fkkMGejj
 QySfSDNJa0ILf33dORYCYMaSt+fXnLMUrp5k5ALwBRsowKDzkQEfwEVyGlsd5/x+pIZY
 AUrVmXl6U0vctTgyhQNfejteqx4C5Q6k2J7COuuFJ0+TvxpKvqjkNBUl5jj+C7KQ0DHx
 HUXm2taPSy550HiQutpDVpQhyG+fLGXZ43H3WsLbDPcN/UusYC1CjaAkIfXu1+CiYbgE
 EHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TEPibjiZ3WGZdlbuijoRm6/TkAySQTI8yVWDgR6dGzo=;
 b=UkVyokoP29JuTqURMhuoeEbH8bwD83v2/sG6iIPMYFPjEQxRGJWtR4O7bvN845R5fZ
 k3dODAqXFpHX7cvILgZweGy81dg2d5FCQ4lcs+aBpYolzidIPJikdAU4Fo3QucHlZn9h
 jEWiHVDBlHJ5qni7bVqfTdi7PUjOCVYS+L6E09QuvWSKGzadEV2MlTtmxQR7IRLoDZ1l
 l8l1o3lFS+JseP4zJU0mvTgIO7thMfJbzH/xk84khdEeyOD1E6yooEkem7hJ4ltRpQ8r
 ansv2nBc7wwfMhWIAZFpFgVssR2tAL623vFUQRvNn/IZTD2Np6kLWUrpHqPLpp3GZHi4
 tgDA==
X-Gm-Message-State: AOAM5309wolWD+wkSR2UndyoHO13n2db5PG1v1XDbfvlbFy5p1v1q9x4
 Ynsk6S5qFm7xIx9oMxlm9OLTbJn5TjA22w==
X-Google-Smtp-Source: ABdhPJzh+RRfbINPjSg1LWLfTvpqnPZLocLChXp/rzSbaroB8fFWvj2W08p+oTip2yJk+4xRHO4vmg==
X-Received: by 2002:a05:6a00:8c4:b029:2b4:8334:ed4d with SMTP id
 s4-20020a056a0008c4b02902b48334ed4dmr31304216pfu.36.1624992909724; 
 Tue, 29 Jun 2021 11:55:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/63] target/cris: Add DISAS_DBRANCH
Date: Tue, 29 Jun 2021 11:54:16 -0700
Message-Id: <20210629185455.3131172-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move delayed branch handling to tb_stop, where we can re-use other
end-of-tb code, e.g. the evaluation of flags.  Honor single stepping.
Validate that we aren't losing state by overwriting is_jmp.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 96 ++++++++++++++++++++++++-----------------
 1 file changed, 56 insertions(+), 40 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index a2124ffcd5..7035426a9c 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -61,6 +61,8 @@
 #define DISAS_UPDATE        DISAS_TARGET_1
 /* Cpu state was modified dynamically, excluding pc -- use npc */
 #define DISAS_UPDATE_NEXT   DISAS_TARGET_2
+/* PC update for delayed branch, see cpustate_changed otherwise */
+#define DISAS_DBRANCH       DISAS_TARGET_3
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3230,50 +3232,22 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     dc->cpustate_changed |= dc->flags_x != (dc->base.tb->flags & X_FLAG);
 
     /*
-     * Check for delayed branches here.  If we do it before
-     * actually generating any host code, the simulator will just
-     * loop doing nothing for on this program location.
+     * All branches are delayed branches, handled immediately below.
+     * We don't expect to see odd combinations of exit conditions.
      */
+    assert(dc->base.is_jmp == DISAS_NEXT || dc->cpustate_changed);
+
     if (dc->delayed_branch && --dc->delayed_branch == 0) {
-        if (dc->base.tb->flags & 7) {
-            t_gen_movi_env_TN(dslot, 0);
-        }
+        dc->base.is_jmp = DISAS_DBRANCH;
+        return;
+    }
 
-        if (dc->cpustate_changed) {
-            cris_store_direct_jmp(dc);
-        }
-
-        if (dc->clear_locked_irq) {
-            dc->clear_locked_irq = 0;
-            t_gen_movi_env_TN(locked_irq, 0);
-        }
-
-        if (dc->jmp == JMP_DIRECT_CC) {
-            TCGLabel *l1 = gen_new_label();
-            cris_evaluate_flags(dc);
-
-            /* Conditional jmp.  */
-            tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
-            gen_goto_tb(dc, 1, dc->jmp_pc);
-            gen_set_label(l1);
-            gen_goto_tb(dc, 0, dc->pc);
-            dc->base.is_jmp = DISAS_NORETURN;
-            dc->jmp = JMP_NOJMP;
-        } else if (dc->jmp == JMP_DIRECT) {
-            cris_evaluate_flags(dc);
-            gen_goto_tb(dc, 0, dc->jmp_pc);
-            dc->base.is_jmp = DISAS_NORETURN;
-            dc->jmp = JMP_NOJMP;
-        } else {
-            TCGv c = tcg_const_tl(dc->pc);
-            t_gen_cc_jmp(env_btarget, c);
-            tcg_temp_free(c);
-            dc->base.is_jmp = DISAS_JUMP;
-        }
+    if (dc->base.is_jmp != DISAS_NEXT) {
+        return;
     }
 
     /* Force an update if the per-tb cpu state has changed.  */
-    if (dc->base.is_jmp == DISAS_NEXT && dc->cpustate_changed) {
+    if (dc->cpustate_changed) {
         dc->base.is_jmp = DISAS_UPDATE_NEXT;
         return;
     }
@@ -3283,8 +3257,7 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
      * If we can detect the length of the next insn easily, we should.
      * In the meantime, simply stop when we do cross.
      */
-    if (dc->base.is_jmp == DISAS_NEXT
-        && ((dc->pc ^ dc->base.pc_first) & TARGET_PAGE_MASK) != 0) {
+    if ((dc->pc ^ dc->base.pc_first) & TARGET_PAGE_MASK) {
         dc->base.is_jmp = DISAS_TOO_MANY;
     }
 }
@@ -3314,6 +3287,49 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
     cris_evaluate_flags(dc);
 
+    /* Evaluate delayed branch destination and fold to another is_jmp case. */
+    if (is_jmp == DISAS_DBRANCH) {
+        if (dc->base.tb->flags & 7) {
+            t_gen_movi_env_TN(dslot, 0);
+        }
+
+        switch (dc->jmp) {
+        case JMP_DIRECT:
+            npc = dc->jmp_pc;
+            is_jmp = dc->cpustate_changed ? DISAS_UPDATE_NEXT : DISAS_TOO_MANY;
+            break;
+
+        case JMP_DIRECT_CC:
+            /*
+             * Use a conditional branch if either taken or not-taken path
+             * can use goto_tb.  If neither can, then treat it as indirect.
+             */
+            if (likely(!dc->base.singlestep_enabled)
+                && likely(!dc->cpustate_changed)
+                && (use_goto_tb(dc, dc->jmp_pc) || use_goto_tb(dc, npc))) {
+                TCGLabel *not_taken = gen_new_label();
+
+                tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, not_taken);
+                gen_goto_tb(dc, 1, dc->jmp_pc);
+                gen_set_label(not_taken);
+
+                /* not-taken case handled below. */
+                is_jmp = DISAS_TOO_MANY;
+                break;
+            }
+            tcg_gen_movi_tl(env_btarget, dc->jmp_pc);
+            /* fall through */
+
+        case JMP_INDIRECT:
+            t_gen_cc_jmp(env_btarget, tcg_constant_tl(npc));
+            is_jmp = dc->cpustate_changed ? DISAS_UPDATE : DISAS_JUMP;
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+    }
+
     if (unlikely(dc->base.singlestep_enabled)) {
         switch (is_jmp) {
         case DISAS_TOO_MANY:
-- 
2.25.1


