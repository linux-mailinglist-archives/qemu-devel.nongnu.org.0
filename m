Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418FD6494EB
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OG8-0006aS-Ot; Sun, 11 Dec 2022 10:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OG2-0006Xb-Dr
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:51 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFu-0007pC-GG
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:45 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 v19-20020a9d5a13000000b0066e82a3872dso5837821oth.5
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdEiZ7vjPxFiLeRTA0LuEkU3pLxvN6ovi79eXVPv7MI=;
 b=I7DUBflXWzmyWBg+lf+l9N8VTtPZ7tcXdiJvCS6OhKNPCy27ArUHR8MipIvdyKMed7
 Pt9HYKnvx7DgDyliP6AxgJn2TJPO4SS9Zm8XVvdQNmlZ8sREnqN42/aMjxNjqjsoz6Do
 JTERPmmFZY//Jav6LEO3aI90uDEBXhXxTay14ju8p5wZryPkOv0dyv3obU9FlO3uSnWp
 SbxlVFQ+qHjVk3HLGWwvFX8SCbgqRwa4opVAdBcyn3Q04vcpEQVB+Xi/ngD3Rx9Sj8ri
 SWzm+CQcKaUyCkSn3Hp5Ao+0ZUzdHWaY+9jLhEqyUP7i2gqBobnv374QEF1GFO2kyvp/
 LnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DdEiZ7vjPxFiLeRTA0LuEkU3pLxvN6ovi79eXVPv7MI=;
 b=xYnAwD5IEmiLY10vd1OggnmvSrtAgEtoQA3pCtNuY+RNDu5hXuypks7aU8iq+2E2VO
 WRPMZZnelJtjCtduidhXdmvqU8b/WZW+JJjozCcN1r6KiKqXTdqAKeEFJyuOIrguyMd2
 meH+7H4Gom0D2oq3Q4ES8bsxVw2n9/5/3Ux7A2q+Rha2JWtbgk6t9Oc6zWu4AcXEwNSR
 WKX95QsEux0VpRPacllDRGKutpJQ2G2QtZjIgiocvA8CGWYzC+QXTe4uwE5ROd8E+PQS
 9Gh2yj2cbp3UfweCpLd+9VzIVMlSsOs+KTdYFfOSzB8KtJKo5s2zrJExKZX8RpX/8ZJ5
 hFSw==
X-Gm-Message-State: ANoB5plIBTbvOFYFQ7m128ASd7PXliezwHLD5NYMZXDRz9hGEn94WFOY
 dUgRl94RPG+iqdNNnmsRAbHnTOCq7Vd9rkQx6mI=
X-Google-Smtp-Source: AA0mqf6JmtHsfwPCApbl+3icEjjT6fdoPKYe+IJuyUGDWD7VDre8vgHOOT6jAsxJY/QI3Ghk6bNH3w==
X-Received: by 2002:a05:6830:4412:b0:66e:a35c:c051 with SMTP id
 q18-20020a056830441200b0066ea35cc051mr8266250otv.35.1670772516703; 
 Sun, 11 Dec 2022 07:28:36 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v2 27/27] target/s390x: Enable TARGET_TB_PCREL
Date: Sun, 11 Dec 2022 09:28:02 -0600
Message-Id: <20221211152802.923900-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu-param.h     |  1 +
 target/s390x/cpu.c           | 12 +++++
 target/s390x/tcg/translate.c | 86 +++++++++++++++++++++++-------------
 3 files changed, 68 insertions(+), 31 deletions(-)

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
index 96562c516d..7e55134255 100644
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
     .restore_state_to_opc = s390x_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 7280498290..036ddd9d20 100644
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
@@ -6451,6 +6466,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     /* Note cpu_get_tb_cpu_state asserts PC is masked for the mode. */
 
+    dc->pc_save = dc->base.pc_first;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
     dc->exit_to_mainloop = per_enabled(dc) || dc->ex_value;
@@ -6463,9 +6479,13 @@ static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
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
 
@@ -6559,7 +6579,11 @@ void s390x_restore_state_to_opc(CPUState *cs,
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


