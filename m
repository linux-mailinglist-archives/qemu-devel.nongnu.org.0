Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648415AE6D0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:45:18 +0200 (CEST)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVX13-000425-FK
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVf9-0003y8-5d
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:35 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVes-0005JP-JE
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id k9so14727759wri.0
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HUlJz3BTam22498ATvxGRZB5iusPGsSAquDVzoUZi34=;
 b=iEOFWZx42nsBo4IWCutwHhgzFgn/s6TtixcIWbjLzyQ0XnYUVUmrHEYn+C7Bevt0ci
 OtBFGuCg9ylDadpxg2G1nKjaVas/ARTjg3x1Zkfsl53u9T42lEK/jzaxzNe/PZkoWqAM
 zQFp93A6Xpk2cAD3wmX6YvAkrh6UTffifd/ZZilciMeBo3s/afTBolBULiufOAYQzS7j
 sosHv6DD3C6pJhSkYNN+Tt174PuhKLmIWxppoGMSq9xxW+RGzMFjTb0ZtTL8gZdwQCLO
 xr8ZB+S+FFNaDv1vzPzbgUPb1LXd5Q0+FYPEQIrf8vqJSGpCzIvwwg6Dv9lEBx3H5dY8
 mvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HUlJz3BTam22498ATvxGRZB5iusPGsSAquDVzoUZi34=;
 b=Uh8lqwrqTjk67w9J7cKCJAb0Yr4FGGLTM/pX3lLfLIK0faSscjsTonAs78pcTmRIuU
 GIGwo+nbTPGmk0t57WlQ5QhWM+QSlC1kzsw4z1YhJBxGX7CCMzg0DYCNg4jUk2m8TtVf
 hxogA9mTOLiplo0O0sK1+GDQ8DGniqpLT7fZxbVt96Ws99bS/sxAJ/7Oh+Hf7nyEtDVj
 broi7FH/R2DcrvVAxpoZ4ZsDxCdNzAwrSihlnnOSvM+tZ0a3D+bAh2zPhMSSTtcDBX9X
 1Utqm8iBxX/sF0Y4oPUpOEpJmfBKUdUjtI6vwNFJ1b4/L4YNEoIun3XXmsWgMRW7N+eI
 6LNw==
X-Gm-Message-State: ACgBeo0bIXNOiXEEkAtAMO7f38MciqvYL83lXoC95OuDLFyqZTYAXk2A
 hYywVfYym2H8bhVfQNVBS5IyNGQo1mUm5x9I
X-Google-Smtp-Source: AA6agR4I8wr6S1qJ80lreprJ0i1/jL0ZSPqvY/hSpMqygEYcZHr6wZQpIyN+evwzgMMQZ/rm6MZKGQ==
X-Received: by 2002:a5d:60ca:0:b0:228:d77e:4b25 with SMTP id
 x10-20020a5d60ca000000b00228d77e4b25mr1751209wrt.139.1662459496433; 
 Tue, 06 Sep 2022 03:18:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 26/26] target/s390x: Enable TARGET_TB_PCREL
Date: Tue,  6 Sep 2022 11:17:47 +0100
Message-Id: <20220906101747.344559-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 target/s390x/cpu.c           | 14 ++++--
 target/s390x/tcg/translate.c | 88 +++++++++++++++++++++++-------------
 3 files changed, 66 insertions(+), 37 deletions(-)

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
index c31bb2351f..6721bf937c 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -35,6 +35,7 @@
 #include "fpu/softfloat-helpers.h"
 #include "disas/capstone.h"
 #include "sysemu/tcg.h"
+#include "exec/exec-all.h"
 
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
@@ -81,11 +82,14 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
     return r;
 }
 
-static void s390_cpu_set_pc(CPUState *cs, vaddr value)
+static void s390_cpu_synchronize_from_tb(CPUState *cs,
+                                         const TranslationBlock *tb)
 {
-    S390CPU *cpu = S390_CPU(cs);
-
-    cpu->env.psw.addr = value;
+    /* The program counter is always up to date with TARGET_TB_PCREL. */
+    if (!TARGET_TB_PCREL) {
+        S390CPU *cpu = S390_CPU(cs);
+        cpu->env.psw.addr = tb_pc(tb);
+    }
 }
 
 static bool s390_cpu_has_work(CPUState *cs)
@@ -265,6 +269,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
+    .synchronize_from_tb = s390_cpu_synchronize_from_tb,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = s390_cpu_record_sigsegv,
@@ -296,7 +301,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = s390_cpu_class_by_name,
     cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
-    cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
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


