Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206633B7858
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:13:10 +0200 (CEST)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJAT-00078G-4a
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItE-00088Y-74
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:20 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIt9-0000sx-Vg
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:19 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o3so42952plg.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t0BZw837rtG1/qKvMeg+BUbNh24zWhCtJZPnucx0CFE=;
 b=Di1tUUiAuDusPtpkN4AX8I6umpq6hLGE17gI18klAnpxG7fneESbc8XH1A52dPKRCg
 1yoVHDLj5RTMvo8O7/LDZ8c5guoqWtbeUOpNHEx1Hmr+F+tuZcUWYjflcsyQeGrthxyP
 kh6kn+flL+5vIAM8Hz2CG8YgeiPpdlotXDvpIdflTe9AaaqQox64Ajz9Hq+YDKm2pb9j
 /1pCYwtvsgGR+hxcVpn8cek7XFvwSwy6yelQDQI4/WOu3b+YwEeW24OOMsm+v3GPU4jx
 BsthuFUp/61GFX/Qf2xODSbhq1H5/sHG0cmWuLJ4JNSG6GZdXaSyoWDSb0Bie07HH4e6
 jLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t0BZw837rtG1/qKvMeg+BUbNh24zWhCtJZPnucx0CFE=;
 b=GI1eZZd13AmOjXQfTwbweVD53tQauZ8z4JHrXXHoTHE7Eezx2syazp02I7tN6DDu/f
 xuyIttiUJzf144IQi9JWQdI/9R98fOT1y/VLVix0fY4T2wqm2xkFhAq1gd2ExMTkyQ/S
 jq3do2TIOgFsRvttqw1XffTGDaRB6jrY8lIjJIVuTm+ydJW2LlUs5ms8vUX7AUHow3oA
 0G1F1M6rg3AGy7LaHz2J9Mir3mZAuaz5KcgrgRWqO+EzcYilfW+3jve20sRBS7EvITSU
 d6xs37lnJAyi6qN3Zn7u4ESmTdqL4mqOGTnSjmMXSZXqhEsGllJXuLtanfQ7CJtbOk8/
 V5vg==
X-Gm-Message-State: AOAM532H6qRdL/MgRCL5fyePkdacVJ+7PGtpJNlWq6Iyv5T+z/7yxyeZ
 ytdoRkpOSQLxhk7j4F4xiDUxpCwRLxWssQ==
X-Google-Smtp-Source: ABdhPJwIFrXfHHmSfdNYXOzoF5K4+XFyWRzMOsaPayL36BtXqJQ7+AE1hLA8brl5Txmdp8XY6jM4sw==
X-Received: by 2002:a17:90b:8cc:: with SMTP id
 ds12mr35599456pjb.36.1624992903619; 
 Tue, 29 Jun 2021 11:55:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/63] target/cris: Add DisasContextBase to DisasContext
Date: Tue, 29 Jun 2021 11:54:05 -0700
Message-Id: <20210629185455.3131172-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Migrate the is_jmp, tb and singlestep_enabled fields
from DisasContext into the base.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 49 +++++++++++++++++----------------
 target/cris/translate_v10.c.inc |  4 +--
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 6dd5a267a6..bed7a7ed10 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -85,6 +85,8 @@ static TCGv env_pc;
 
 /* This is the state at translation time.  */
 typedef struct DisasContext {
+    DisasContextBase base;
+
     CRISCPU *cpu;
     target_ulong pc, ppc;
 
@@ -121,7 +123,6 @@ typedef struct DisasContext {
     int clear_locked_irq; /* Clear the irq lockout.  */
     int cpustate_changed;
     unsigned int tb_flags; /* tb dependent flags.  */
-    int is_jmp;
 
 #define JMP_NOJMP     0
 #define JMP_DIRECT    1
@@ -131,9 +132,6 @@ typedef struct DisasContext {
     uint32_t jmp_pc;
 
     int delayed_branch;
-
-    TranslationBlock *tb;
-    int singlestep_enabled;
 } DisasContext;
 
 static void gen_BUG(DisasContext *dc, const char *file, int line)
@@ -531,7 +529,7 @@ static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
 static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
 #ifndef CONFIG_USER_ONLY
-    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
+    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
            (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
 #else
     return true;
@@ -543,7 +541,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
     if (use_goto_tb(dc, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(env_pc, dest);
-        tcg_gen_exit_tb(dc->tb, n);
+        tcg_gen_exit_tb(dc->base.tb, n);
     } else {
         tcg_gen_movi_tl(env_pc, dest);
         tcg_gen_exit_tb(NULL, 0);
@@ -2037,14 +2035,14 @@ static int dec_setclrf(CPUCRISState *env, DisasContext *dc)
     /* Break the TB if any of the SPI flag changes.  */
     if (flags & (P_FLAG | S_FLAG)) {
         tcg_gen_movi_tl(env_pc, dc->pc + 2);
-        dc->is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_UPDATE;
         dc->cpustate_changed = 1;
     }
 
     /* For the I flag, only act on posedge.  */
     if ((flags & I_FLAG)) {
         tcg_gen_movi_tl(env_pc, dc->pc + 2);
-        dc->is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_UPDATE;
         dc->cpustate_changed = 1;
     }
 
@@ -2886,14 +2884,14 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
         LOG_DIS("rfe\n");
         cris_evaluate_flags(dc);
         gen_helper_rfe(cpu_env);
-        dc->is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_UPDATE;
         break;
     case 5:
         /* rfn.  */
         LOG_DIS("rfn\n");
         cris_evaluate_flags(dc);
         gen_helper_rfn(cpu_env);
-        dc->is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_UPDATE;
         break;
     case 6:
         LOG_DIS("break %d\n", dc->op1);
@@ -2904,7 +2902,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
         /* Breaks start at 16 in the exception vector.  */
         t_gen_movi_env_TN(trap_vector, dc->op1 + 16);
         t_gen_raise_exception(EXCP_BREAK);
-        dc->is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_UPDATE;
         break;
     default:
         printf("op2=%x\n", dc->op2);
@@ -3146,13 +3144,16 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
      * delayslot, like in real hw.
      */
     pc_start = tb->pc & ~1;
-    dc->cpu = env_archcpu(env);
-    dc->tb = tb;
 
-    dc->is_jmp = DISAS_NEXT;
+    dc->base.tb = tb;
+    dc->base.pc_first = pc_start;
+    dc->base.pc_next = pc_start;
+    dc->base.is_jmp = DISAS_NEXT;
+    dc->base.singlestep_enabled = cs->singlestep_enabled;
+
+    dc->cpu = env_archcpu(env);
     dc->ppc = pc_start;
     dc->pc = pc_start;
-    dc->singlestep_enabled = cs->singlestep_enabled;
     dc->flags_uptodate = 1;
     dc->flagx_known = 1;
     dc->flags_x = tb->flags & X_FLAG;
@@ -3189,7 +3190,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
             cris_evaluate_flags(dc);
             tcg_gen_movi_tl(env_pc, dc->pc);
             t_gen_raise_exception(EXCP_DEBUG);
-            dc->is_jmp = DISAS_UPDATE;
+            dc->base.is_jmp = DISAS_UPDATE;
             /* The address covered by the breakpoint must be included in
                [tb->pc, tb->pc + tb->size) in order to for it to be
                properly cleared -- thus we increment the PC here so that
@@ -3242,18 +3243,18 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                     gen_goto_tb(dc, 1, dc->jmp_pc);
                     gen_set_label(l1);
                     gen_goto_tb(dc, 0, dc->pc);
-                    dc->is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_TB_JUMP;
                     dc->jmp = JMP_NOJMP;
                 } else if (dc->jmp == JMP_DIRECT) {
                     cris_evaluate_flags(dc);
                     gen_goto_tb(dc, 0, dc->jmp_pc);
-                    dc->is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_TB_JUMP;
                     dc->jmp = JMP_NOJMP;
                 } else {
                     TCGv c = tcg_const_tl(dc->pc);
                     t_gen_cc_jmp(env_btarget, c);
                     tcg_temp_free(c);
-                    dc->is_jmp = DISAS_JUMP;
+                    dc->base.is_jmp = DISAS_JUMP;
                 }
                 break;
             }
@@ -3264,7 +3265,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
         if (!(tb->pc & 1) && cs->singlestep_enabled) {
             break;
         }
-    } while (!dc->is_jmp && !dc->cpustate_changed
+    } while (!dc->base.is_jmp && !dc->cpustate_changed
             && !tcg_op_buf_full()
             && !singlestep
             && (dc->pc - page_start < TARGET_PAGE_SIZE)
@@ -3277,10 +3278,10 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     npc = dc->pc;
 
     /* Force an update if the per-tb cpu state has changed.  */
-    if (dc->is_jmp == DISAS_NEXT
+    if (dc->base.is_jmp == DISAS_NEXT
         && (dc->cpustate_changed || !dc->flagx_known
         || (dc->flags_x != (tb->flags & X_FLAG)))) {
-        dc->is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_UPDATE;
         tcg_gen_movi_tl(env_pc, npc);
     }
     /* Broken branch+delayslot sequence.  */
@@ -3293,12 +3294,12 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     cris_evaluate_flags(dc);
 
     if (unlikely(cs->singlestep_enabled)) {
-        if (dc->is_jmp == DISAS_NEXT) {
+        if (dc->base.is_jmp == DISAS_NEXT) {
             tcg_gen_movi_tl(env_pc, npc);
         }
         t_gen_raise_exception(EXCP_DEBUG);
     } else {
-        switch (dc->is_jmp) {
+        switch (dc->base.is_jmp) {
         case DISAS_NEXT:
             gen_goto_tb(dc, 1, npc);
             break;
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index f7cd67be37..dd44a7eb97 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -1169,7 +1169,7 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                     t_gen_mov_env_TN(trap_vector, c);
                     tcg_temp_free(c);
                     t_gen_raise_exception(EXCP_BREAK);
-                    dc->is_jmp = DISAS_UPDATE;
+                    dc->base.is_jmp = DISAS_UPDATE;
                     return insn_len;
                 }
                 LOG_DIS("%d: jump.%d %d r%d r%d\n", __LINE__, size,
@@ -1277,7 +1277,7 @@ static unsigned int crisv10_decoder(CPUCRISState *env, DisasContext *dc)
     if (dc->clear_prefix && dc->tb_flags & PFIX_FLAG) {
         dc->tb_flags &= ~PFIX_FLAG;
         tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~PFIX_FLAG);
-        if (dc->tb_flags != dc->tb->flags) {
+        if (dc->tb_flags != dc->base.tb->flags) {
             dc->cpustate_changed = 1;
         }
     }
-- 
2.25.1


