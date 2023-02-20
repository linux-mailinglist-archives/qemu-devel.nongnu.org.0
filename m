Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E369D31D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:48:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8H-0006yc-Ae; Mon, 20 Feb 2023 13:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6k-0004jp-0k
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:50 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6g-0004HV-Aw
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:48 -0500
Received: by mail-pl1-x634.google.com with SMTP id s5so2424396plg.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhcflml4JRvY7oryEDQJR+jOvLdQs2W3Z2C+LbDJ1BM=;
 b=IEIzH0rIvFf92LFH1hJ1HGSmkgBLjZKvt8aG+VBE1PbsmUzda5pKy9nLYpIysf923v
 jt9bN59f8hYERM93RDZ6GiCzybAC0gTUujBxLLSJA4zLL5AwAraQ3Nfg1WfE9KjFxTOv
 DVox7THA7/Ypw/C+a5EMaQ60Wj8VMITM9O3pXBhaSo+cKPQIUvVawwZ1p37iYZcADQeC
 Vh2iFdSYFshFUxHh0KgVEW1mdEBkmICi3g/Si90Iu3n4L56rjmJ5EYidbd1noXI8yKp3
 1bPIEpFXySISkjbd33AUbrFGr6W4+4hzZjexYuutVAvTtgzOJnYFzcdYu38DyrxXroH2
 nUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhcflml4JRvY7oryEDQJR+jOvLdQs2W3Z2C+LbDJ1BM=;
 b=irs+hT162O5CfdFbljOADNllnLlkyrUPCf/XhCrMBrewkNlvgeEbpvvNPKkb+vozFz
 282wKrlbkfs/KW1M9BiwH16LmLFe1+1eDfPRYbHB3U17O/tMroLFkG4wcfcqB7FX5pL4
 ZTqmK3H4sZUizpW5EHuEHchpUJ+xBqsOqU8bR7v4ZlvRY53eIoVn2tH3mCnG7YjbyZmB
 2ATdQGrlsO/9pAcEmbOhhW0F39Y8u0c2aOLFSLY/TTAUHevPjqutY7wvsh7YPm/jtHkT
 fWsboWxrNqbybQBBRcn7KawMKpOZVG433kI/DBKzn2Sj8DxGEig8MM4QJTg+RWD6cvCH
 MSHA==
X-Gm-Message-State: AO0yUKXHHDFnQuzZSOgVV8+B5mCDyduernI/lM05EvhuUOGTRcltzysi
 J3XH+IR9u5vKPpQyE2ml7gFQF7HM/YzSwLrau+g=
X-Google-Smtp-Source: AK7set90OnXRIMCC3UbDQura0xuzUGoesBktKyhbKoln8tuC+dmYBZHUikJB3Ktazls3TMUNrafl+w==
X-Received: by 2002:a17:902:e74f:b0:199:2e77:fe56 with SMTP id
 p15-20020a170902e74f00b001992e77fe56mr4502851plf.52.1676918504980; 
 Mon, 20 Feb 2023 10:41:44 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 27/27] target/s390x: Enable TARGET_TB_PCREL
Date: Mon, 20 Feb 2023 08:40:52 -1000
Message-Id: <20230220184052.163465-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index e4db5f1c02..a016d23d53 100644
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
@@ -348,9 +326,39 @@ static void return_low128(TCGv_i64 dest)
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
@@ -1188,6 +1196,7 @@ static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
 {
     per_breaking_event(s);
     tcg_gen_mov_i64(psw_addr, dest);
+    s->pc_save = -1;
     per_branch_dest(s, psw_addr);
     return DISAS_PC_UPDATED;
 }
@@ -1197,6 +1206,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
 {
     DisasJumpType ret;
     int64_t disp = (int64_t)imm * 2;
+    TCGv_i64 cdest_save = NULL;
     TCGLabel *lab;
 
     /* Take care of the special cases first.  */
@@ -1229,12 +1239,12 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
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
@@ -1250,6 +1260,11 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
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
 
@@ -1263,15 +1278,15 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
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
@@ -6523,6 +6538,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     /* Note cpu_get_tb_cpu_state asserts PC is masked for the mode. */
 
+    dc->pc_save = dc->base.pc_first;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
     dc->exit_to_mainloop = per_enabled(dc) || dc->ex_value;
@@ -6535,9 +6551,13 @@ static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
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
 
@@ -6631,7 +6651,11 @@ void s390x_restore_state_to_opc(CPUState *cs,
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


