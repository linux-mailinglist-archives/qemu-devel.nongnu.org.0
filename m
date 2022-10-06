Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660D05F6014
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:25:17 +0200 (CEST)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIRg-0005v9-GC
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHob-0004P4-L9
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:53 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoY-00040F-PO
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:53 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 n18-20020a17090ade9200b0020b0012097cso1009971pjv.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1Q41KTfEeoa+dlW3TQe8h7vnXWIPJTTZEuUzFK2vahQ=;
 b=MhYUUJayIX+M6/WUngbEHu1krtVLOOrFzC0/MRJsKIh7gLPmeYyaT7L1XRnTYeZK/E
 B2vDNtIUxaq2++C7Uzp669jRTWVUP/ztMJLUU7zVnGm8F3MS3j32I4d956VpnVh2WcDR
 ea5019sWmGPxL0hLfpONjR3pdGCPzh3ESPvXtfBzBLKQu2RhYA1GOeKztONnstD3Yqqv
 7ssCz+w6I7DH2p7Rq3h3rWJfap63XefAnUAcwQfgXW3CKF9cg/71W7W8sFSGEAQkqlww
 4CAhxBrpa/874YM9AYqtpJd1NcLhlOUd0Z443bBh7isaTxxEUIhRbj+PjKI6lFqEkPJo
 ROAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1Q41KTfEeoa+dlW3TQe8h7vnXWIPJTTZEuUzFK2vahQ=;
 b=4Po6qjnOuUHAcaXuP8RXmyTA3grHDryiCqsJCyozaBO0Fwoxez4iQd/wB6nrSav6IB
 h9Vt76diteO6fCMCyBHcOKsVxBohqt+PE1Y5cGB7nXRb9JtW5301ZTU6yhyl5fmAAAbX
 7ATbXEsbo0oQSvQHu6C9Pw4BhY581qTRhgd+sCLf74NKIll/TslyIh6junkd8VvYJ4Rq
 JCb01Rb6zinqshbVfKBGCUYICtYHI4SplrkChAWYg9BUOxfgFeCSs4kOCAt4Jy06gHnS
 ekH+O7TBQ+HYKbnJQRUAoiKaiOzpcO2yUqdc62mQ3LC+0YK87hJcKNSzTBoQ3p36DwL6
 QHyQ==
X-Gm-Message-State: ACrzQf2Vx2a/5UV4a8vq0xB4iYk2iO7YaEFJYkdG32zWxOsbgT1GVWVX
 CJIN09Vrhd6do11bK81140trysTtSphfTQ==
X-Google-Smtp-Source: AMsMyM79SgGgOhrJLax0ODzthJnH+NsbLcnwuUbtfeoaDIyHlfn3iE2llesF2eUW+yPpFq56KZaCog==
X-Received: by 2002:a17:90b:1e0a:b0:202:e897:9bb3 with SMTP id
 pg10-20020a17090b1e0a00b00202e8979bb3mr8359406pjb.169.1665027887784; 
 Wed, 05 Oct 2022 20:44:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 26/26] target/s390x: Enable TARGET_TB_PCREL
Date: Wed,  5 Oct 2022 20:44:21 -0700
Message-Id: <20221006034421.1179141-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu-param.h     |  1 +
 target/s390x/cpu.c           | 12 +++++
 target/s390x/tcg/translate.c | 88 +++++++++++++++++++++++-------------
 3 files changed, 69 insertions(+), 32 deletions(-)

diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
index bf951a002e..467ecade8c 100644
--- a/target/s390x/cpu-param.h
+++ b/target/s390x/cpu-param.h
@@ -13,5 +13,6 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 64
 #define TARGET_VIRT_ADDR_SPACE_BITS 64
 #define NB_MMU_MODES 4
+#define TARGET_TB_PCREL 1
 
 #endif
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index df00040e95..e77849dd50 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -35,6 +35,7 @@
 #include "fpu/softfloat-helpers.h"
 #include "disas/capstone.h"
 #include "sysemu/tcg.h"
+#include "exec/exec-all.h"
 
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
@@ -81,6 +82,16 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
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
@@ -272,6 +283,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
+    .synchronize_from_tb = s390_cpu_synchronize_from_tb,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = s390_cpu_record_sigsegv,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index b27e34f712..c33dcc115d 100644
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
-    if (!is_imm) {
-        tcg_gen_mov_i64(psw_addr, cdest);
+    if (!is_imm && tcg_temp_is_normal_i64(cdest)) {
+        cdest_save = tcg_temp_ebb_new_i64();
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
@@ -6443,6 +6458,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
+    dc->pc_save = dc->base.pc_first;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
     dc->exit_to_mainloop = per_enabled(dc) || dc->ex_value;
@@ -6455,9 +6471,13 @@ static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
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
 
@@ -6548,7 +6568,11 @@ void restore_state_to_opc(CPUS390XState *env, TranslationBlock *tb,
 {
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


