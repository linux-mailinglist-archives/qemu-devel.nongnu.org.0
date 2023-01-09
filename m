Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6893663115
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:12:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyS6-0003O0-82; Mon, 09 Jan 2023 15:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRx-0003Mx-Le
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:53 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRv-0007Xk-ND
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:53 -0500
Received: by mail-pl1-x62e.google.com with SMTP id y1so10783262plb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XA3AgmTJV6twi3UhuBbD+P3p6iyT4YFKtf10vXvXuoA=;
 b=Bu1k6uOG8wU0Zt+ABdGzlgPfPQAWfkLnloPxp+xg0xHkab9RiML2BiuETgg1pvHwKF
 USOfhZ+YSeF1SNpnT8u498HiMGY0txa2+LhfLm+x55M6MMNty7T2KUAbJFz7UAJ92s6H
 MF6dWonrA36uu80o23uVi6mLM3a/xSi/TrUGw4htmEW/yizp5fz1/LI0ZWvhemL7aH46
 4hOtANVDtn37/M+Mj1p63H5cDWnEaeihRI0QvSOjJzLJqk2RuSpJSvlVMq3lMVVMOS+P
 7RGDvthn6MqQI1wJcDHZUiCuKnoGpW0Kf2gTE9mpGB4T72yH6Cr+c+5d2hYuCakdWmKv
 /3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XA3AgmTJV6twi3UhuBbD+P3p6iyT4YFKtf10vXvXuoA=;
 b=0QwFRmT7A+eVErU2cHYnMGvlMgk8teIBVTO+Mz1tIS9bl3oOm+GZqHQovFqLMyN0aP
 rKThYUFNoaqG16+RLf+bKIVaHDFJxhY69X13eSpkogLfaHzdvQbE6/4jLzp/mtybFEQ4
 UgS2t5LamGCH4ffuDcIY11WaJLr1o+R5kHY+lLORGRbitALwwsbSZF21VLVJqAYq49KV
 7KVX++dHPhrkbT7/skPQ8bCmuNvtu49yYMsfJ4gDAoMPEdzevfvZo18dX8EsKNd3ESq7
 RBhyJq5SFmf1WKtBYR+zKhhZgSSm+HmM62B0bQnp7XOS3+Q+7OanHyEQWYSAZ8cleorg
 cKng==
X-Gm-Message-State: AFqh2koINtuVkpga8bI3i7gcDLPkFmnZ2hPRu85LqYznw/KADUWMtu3C
 bbe4Psq9IaD/4w8ANuLjfwaKB9f5uhX6kuVj
X-Google-Smtp-Source: AMrXdXuav440RoZWuJHB9gQV7JilrxhWiBfDmd2fKIef/J3pr5gtYbL9DobY075EHhw/KbJ4AQLeuA==
X-Received: by 2002:a17:90a:b10b:b0:225:cc25:802f with SMTP id
 z11-20020a17090ab10b00b00225cc25802fmr58368419pjq.28.1673294930811; 
 Mon, 09 Jan 2023 12:08:50 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 27/27] target/s390x: Enable TARGET_TB_PCREL
Date: Mon,  9 Jan 2023 12:08:19 -0800
Message-Id: <20230109200819.3916395-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu-param.h     |  4 ++
 target/s390x/cpu.c           | 12 +++++
 target/s390x/tcg/translate.c | 86 +++++++++++++++++++++++-------------
 3 files changed, 71 insertions(+), 31 deletions(-)

diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
index bf951a002e..52bb95de57 100644
--- a/target/s390x/cpu-param.h
+++ b/target/s390x/cpu-param.h
@@ -14,4 +14,8 @@
 #define TARGET_VIRT_ADDR_SPACE_BITS 64
 #define NB_MMU_MODES 4
 
+#ifndef CONFIG_USER_ONLY
+# define TARGET_TB_PCREL 1
+#endif
+
 #endif
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index b10a8541ff..933ff06395 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -37,6 +37,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/reset.h"
 #endif
+#include "exec/exec-all.h"
 
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
@@ -83,6 +84,16 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
     return r;
 }
 
+static void s390_cpu_synchronize_from_tb(CPUState *cs,
+                                         const TranslationBlock *tb)
+{
+    /* The program counter is always up to date with TARGET_TB_PCREL. */
+    if (!TARGET_TB_PCREL) {
+        S390CPU *cpu = S390_CPU(cs);
+        cpu->env.psw.addr = tb_pc(tb);
+    }
+}
+
 static void s390_cpu_set_pc(CPUState *cs, vaddr value)
 {
     S390CPU *cpu = S390_CPU(cs);
@@ -274,6 +285,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
+    .synchronize_from_tb = s390_cpu_synchronize_from_tb,
     .restore_state_to_opc = s390x_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index afed4e2981..704db55cd4 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -139,6 +139,7 @@ struct DisasContext {
     DisasContextBase base;
     const DisasInsn *insn;
     TCGOp *insn_start;
+    target_ulong pc_save;
     DisasFields fields;
     uint64_t ex_value;
     uint32_t ilen;
@@ -163,29 +164,6 @@ static uint64_t inline_branch_hit[CC_OP_MAX];
 static uint64_t inline_branch_miss[CC_OP_MAX];
 #endif
 
-static void gen_psw_addr_disp(DisasContext *s, TCGv_i64 dest, int64_t disp)
-{
-    tcg_gen_movi_i64(dest, s->base.pc_next + disp);
-}
-
-static void pc_to_link_info(TCGv_i64 out, DisasContext *s)
-{
-    TCGv_i64 tmp;
-
-    if (s->base.tb->flags & FLAG_MASK_64) {
-        gen_psw_addr_disp(s, out, s->ilen);
-        return;
-    }
-
-    tmp = tcg_temp_new_i64();
-    gen_psw_addr_disp(s, tmp, s->ilen);
-    if (s->base.tb->flags & FLAG_MASK_32) {
-        tcg_gen_ori_i64(tmp, tmp, 0x80000000);
-    }
-    tcg_gen_deposit_i64(out, out, tmp, 0, 32);
-    tcg_temp_free_i64(tmp);
-}
-
 static TCGv_i64 psw_addr;
 static TCGv_i64 psw_mask;
 static TCGv_i64 gbea;
@@ -336,9 +314,39 @@ static void return_low128(TCGv_i64 dest)
     tcg_gen_ld_i64(dest, cpu_env, offsetof(CPUS390XState, retxl));
 }
 
+static void gen_psw_addr_disp(DisasContext *s, TCGv_i64 dest, int64_t disp)
+{
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        disp += s->base.pc_next - s->pc_save;
+        tcg_gen_addi_i64(dest, psw_addr, disp);
+    } else {
+        tcg_gen_movi_i64(dest, s->base.pc_next + disp);
+    }
+}
+
+static void pc_to_link_info(TCGv_i64 out, DisasContext *s)
+{
+    TCGv_i64 tmp;
+
+    if (s->base.tb->flags & FLAG_MASK_64) {
+        gen_psw_addr_disp(s, out, s->ilen);
+        return;
+    }
+
+    tmp = tcg_temp_new_i64();
+    gen_psw_addr_disp(s, tmp, s->ilen);
+    if (s->base.tb->flags & FLAG_MASK_32) {
+        tcg_gen_ori_i64(tmp, tmp, 0x80000000);
+    }
+    tcg_gen_deposit_i64(out, out, tmp, 0, 32);
+    tcg_temp_free_i64(tmp);
+}
+
 static void update_psw_addr_disp(DisasContext *s, int64_t disp)
 {
     gen_psw_addr_disp(s, psw_addr, disp);
+    s->pc_save = s->base.pc_next + disp;
 }
 
 static inline bool per_enabled(DisasContext *s)
@@ -1172,6 +1180,7 @@ static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
 {
     per_breaking_event(s);
     tcg_gen_mov_i64(psw_addr, dest);
+    s->pc_save = -1;
     per_branch_dest(s, psw_addr);
     return DISAS_PC_UPDATED;
 }
@@ -1181,6 +1190,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
 {
     DisasJumpType ret;
     int64_t disp = (int64_t)imm * 2;
+    TCGv_i64 cdest_save = NULL;
     TCGLabel *lab;
 
     /* Take care of the special cases first.  */
@@ -1213,12 +1223,12 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
     update_cc_op(s);
 
     /*
-     * Store taken branch destination before the brcond.  This
-     * avoids having to allocate a new local temp to hold it.
-     * We'll overwrite this in the not taken case anyway.
+     * Save taken branch destination across the brcond if required.
      */
     if (!is_imm) {
-        tcg_gen_mov_i64(psw_addr, cdest);
+        cdest_save = tcg_temp_local_new_i64();
+        tcg_gen_mov_i64(cdest_save, cdest);
+        cdest = cdest_save;
     }
 
     lab = gen_new_label();
@@ -1234,6 +1244,11 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
     per_breaking_event(s);
     if (is_imm) {
         gen_psw_addr_disp(s, psw_addr, disp);
+    } else {
+        tcg_gen_mov_i64(psw_addr, cdest);
+    }
+    if (cdest_save) {
+        tcg_temp_free_i64(cdest_save);
     }
     per_branch_dest(s, psw_addr);
 
@@ -1247,15 +1262,15 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
     gen_set_label(lab);
 
     /* Branch not taken.  */
+    gen_psw_addr_disp(s, psw_addr, s->ilen);
     if (use_goto_tb(s, s->base.pc_next + s->ilen)) {
         tcg_gen_goto_tb(1);
-        gen_psw_addr_disp(s, psw_addr, s->ilen);
         tcg_gen_exit_tb(s->base.tb, 1);
     } else {
-        gen_psw_addr_disp(s, psw_addr, s->ilen);
         tcg_gen_lookup_and_goto_ptr();
     }
 
+    s->pc_save = -1;
     ret = DISAS_NORETURN;
 
  egress:
@@ -6453,6 +6468,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     /* Note cpu_get_tb_cpu_state asserts PC is masked for the mode. */
 
+    dc->pc_save = dc->base.pc_first;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
     dc->exit_to_mainloop = per_enabled(dc) || dc->ex_value;
@@ -6465,9 +6481,13 @@ static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
 static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
+    target_ulong pc_arg = dc->base.pc_next;
 
+    if (TARGET_TB_PCREL) {
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
     /* Delay the set of ilen until we've read the insn. */
-    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op, 0);
+    tcg_gen_insn_start(pc_arg, dc->cc_op, 0);
     dc->insn_start = tcg_last_op();
 }
 
@@ -6561,7 +6581,11 @@ void s390x_restore_state_to_opc(CPUState *cs,
     CPUS390XState *env = &cpu->env;
     int cc_op = data[1];
 
-    env->psw.addr = data[0];
+    if (TARGET_TB_PCREL) {
+        env->psw.addr = (env->psw.addr & TARGET_PAGE_MASK) | data[0];
+    } else {
+        env->psw.addr = data[0];
+    }
 
     /* Update the CC opcode if it is not already up-to-date.  */
     if ((cc_op != CC_OP_DYNAMIC) && (cc_op != CC_OP_STATIC)) {
-- 
2.34.1


