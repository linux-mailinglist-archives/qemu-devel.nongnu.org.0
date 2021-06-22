Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A363B09B1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:58:42 +0200 (CEST)
Received: from localhost ([::1]:44960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvinR-0001UB-OA
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvide-0005CU-89
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:34 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvida-0005Km-6R
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:33 -0400
Received: by mail-pf1-x435.google.com with SMTP id k6so16701408pfk.12
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LTBLncsUbYrMsyIs2nbSrT7yfNY/jwcxLFcirc/DO5k=;
 b=tFAFR/G/2OlY18mRVExd/o4z5rjjjb6q1px3rbPxXxIRVodWFrKE84fL+MMOGGykPa
 xc6c62sN8DnmNtxrHfYZaBRvdD9TpcD4AUP42vPSOAnAsBue8zGj9RGn24fxct7OMEn+
 4tEGGVa0El3gz5YT3fTZm8cZqMAkglKrlEEvXVfoykdWgdrL9+GF1O9uBq0jJ3iaPrF7
 o2QurVj04z4opfKin6naTIGT5Kzuw4lJhn+uJRzFCjI0FM13Qrnnnvn9cPi43NXZ94SU
 CoULC7OVPy7w1BdNtwqLbkVD0Urox0KoJljQR7lfoXg+LIjlt/KPV1i/poh6sAItZkaH
 VZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LTBLncsUbYrMsyIs2nbSrT7yfNY/jwcxLFcirc/DO5k=;
 b=flqrb/GZpGBM0PGPyIeBXL/W9/3bvBQN5qBklMOfCkBBXx7fl2S8Y+SLGU7RSlbuHv
 miIUtiVB3fd+v0BT8tdeTwQHlYDvHamoCMVoIBF21EnjEq2lbWuvMAy7bdvN0fKy0o5T
 npgbt13dQX5EHxzLtqoNrqljoEmwfcUYcs74Mu/hJ/ZOaCwI2xdZnlTUu7crE3tzQ67u
 aG+t8lzO2her7v7ifRnuzk24ssTI05h0hZ+w7e1zWwI4OAeT+KBECKMfl3iHM7QXmbgs
 voPROGK8ziMpk1naIQvI5dEgslo02/+K+7PMersa9RfQTdU2e8FJsUnaXIrwPHqCmZsc
 lgkg==
X-Gm-Message-State: AOAM530tbzu8UiodDFJfE1o2JrK/ACW6Bqla0azNDJmJGIKARB0iGy/R
 VI6giWhLu/l0QsdMsAY+Q43qMnXJdDdR+Q==
X-Google-Smtp-Source: ABdhPJzZzOy3YWmGfaopSyCtOFp25zhs8B1LzmpH9Vye8FNTrFKUEB9FDiBWxBXvrRpIP7N3QZesug==
X-Received: by 2002:a62:1ccf:0:b029:304:3c28:b96c with SMTP id
 c198-20020a621ccf0000b02903043c28b96cmr4339217pfc.52.1624376908900; 
 Tue, 22 Jun 2021 08:48:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/15] target/cris: Add DISAS_DBRANCH
Date: Tue, 22 Jun 2021 08:48:16 -0700
Message-Id: <20210622154820.1978982-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move delayed branch handling to tb_stop, where we can re-use other
end-of-tb code, e.g. the evaluation of flags.  Honor single stepping.
Validate that we aren't losing state by overwriting is_jmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 96 ++++++++++++++++++++++++-----------------
 1 file changed, 56 insertions(+), 40 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index c9822eae4c..f58f6f2e5e 100644
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
@@ -3228,50 +3230,22 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
@@ -3281,8 +3255,7 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
      * If we can detect the length of the next insn easily, we should.
      * In the meantime, simply stop when we do cross.
      */
-    if (dc->base.is_jmp == DISAS_NEXT
-        && ((dc->pc ^ dc->base.pc_first) & TARGET_PAGE_MASK) != 0) {
+    if ((dc->pc ^ dc->base.pc_first) & TARGET_PAGE_MASK) {
         dc->base.is_jmp = DISAS_TOO_MANY;
     }
 }
@@ -3312,6 +3285,49 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
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


