Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C8469EA1B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUayf-0006R5-1o; Tue, 21 Feb 2023 17:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pUay7-0005w4-1e
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:18:40 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pUay5-0005m0-4o
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C6mjPvLTY+Rt4ddZV5rRt65dkzbQtkDCLBJ25teMr1Q=; b=ScLSzXZq20T7YYz75/yhBX5Bk5
 YMu3CMsrbr9vdGLfP1ckQAx95zWbFDzO+IjTYqPwG20/x6gXOemzc7PcYNd2woygMru5WqLjefvUV
 QR0ggmQc/i1o6cVqf1lj6tUG0ijRd8SRtfFWnnHCi1kiheU/WRm3c+Veu9ZmFRPneBSo=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v2 07/27] target/i386: Replace `TARGET_TB_PCREL` with
 `CF_PCREL`
Date: Tue, 21 Feb 2023 23:17:58 +0100
Message-Id: <20230221221818.9382-8-anjo@rev.ng>
In-Reply-To: <20230221221818.9382-1-anjo@rev.ng>
References: <20230221221818.9382-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/helper.c        |  2 +-
 target/i386/tcg/tcg-cpu.c   |  6 +++---
 target/i386/tcg/translate.c | 26 +++++++++++++-------------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/i386/helper.c b/target/i386/helper.c
index 0ac2da066d..8857444819 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -520,7 +520,7 @@ static inline target_ulong get_memio_eip(CPUX86State *env)
     }
 
     /* Per x86_restore_state_to_opc. */
-    if (TARGET_TB_PCREL) {
+    if (cs->tcg_cflags & CF_PCREL) {
         return (env->eip & TARGET_PAGE_MASK) | data[0];
     } else {
         return data[0] - env->segs[R_CS].base;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 79ac5908f7..c090ce152b 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -49,8 +49,8 @@ static void x86_cpu_exec_exit(CPUState *cs)
 static void x86_cpu_synchronize_from_tb(CPUState *cs,
                                         const TranslationBlock *tb)
 {
-    /* The instruction pointer is always up to date with TARGET_TB_PCREL. */
-    if (!TARGET_TB_PCREL) {
+    /* The instruction pointer is always up to date with CF_PCREL. */
+    if (!(tb_cflags(tb) & CF_PCREL)) {
         CPUX86State *env = cs->env_ptr;
         env->eip = tb_pc(tb) - tb->cs_base;
     }
@@ -64,7 +64,7 @@ static void x86_restore_state_to_opc(CPUState *cs,
     CPUX86State *env = &cpu->env;
     int cc_op = data[1];
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(tb) & CF_PCREL) {
         env->eip = (env->eip & TARGET_PAGE_MASK) | data[0];
     } else {
         env->eip = data[0] - tb->cs_base;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9d9392b009..3fed6d96f9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -545,7 +545,7 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
 static void gen_update_eip_cur(DisasContext *s)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_tl(cpu_eip, cpu_eip, s->base.pc_next - s->pc_save);
     } else {
         tcg_gen_movi_tl(cpu_eip, s->base.pc_next - s->cs_base);
@@ -556,7 +556,7 @@ static void gen_update_eip_cur(DisasContext *s)
 static void gen_update_eip_next(DisasContext *s)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_tl(cpu_eip, cpu_eip, s->pc - s->pc_save);
     } else {
         tcg_gen_movi_tl(cpu_eip, s->pc - s->cs_base);
@@ -588,7 +588,7 @@ static TCGv_i32 eip_next_i32(DisasContext *s)
     if (CODE64(s)) {
         return tcg_constant_i32(-1);
     }
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         TCGv_i32 ret = tcg_temp_new_i32();
         tcg_gen_trunc_tl_i32(ret, cpu_eip);
         tcg_gen_addi_i32(ret, ret, s->pc - s->pc_save);
@@ -601,7 +601,7 @@ static TCGv_i32 eip_next_i32(DisasContext *s)
 static TCGv eip_next_tl(DisasContext *s)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         TCGv ret = tcg_temp_new();
         tcg_gen_addi_tl(ret, cpu_eip, s->pc - s->pc_save);
         return ret;
@@ -613,7 +613,7 @@ static TCGv eip_next_tl(DisasContext *s)
 static TCGv eip_cur_tl(DisasContext *s)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         TCGv ret = tcg_temp_new();
         tcg_gen_addi_tl(ret, cpu_eip, s->base.pc_next - s->pc_save);
         return ret;
@@ -1830,7 +1830,7 @@ static void gen_rot_rm_T1(DisasContext *s, MemOp ot, int op1, int is_right)
     tcg_temp_free_i32(t0);
     tcg_temp_free_i32(t1);
 
-    /* The CC_OP value is no longer predictable.  */ 
+    /* The CC_OP value is no longer predictable.  */
     set_cc_op(s, CC_OP_DYNAMIC);
 }
 
@@ -1923,7 +1923,7 @@ static void gen_rotc_rm_T1(DisasContext *s, MemOp ot, int op1,
         gen_op_ld_v(s, ot, s->T0, s->A0);
     else
         gen_op_mov_v_reg(s, ot, s->T0, op1);
-    
+
     if (is_right) {
         switch (ot) {
         case MO_8:
@@ -2319,7 +2319,7 @@ static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a, bool is_vsib)
         ea = cpu_regs[a.base];
     }
     if (!ea) {
-        if (TARGET_TB_PCREL && a.base == -2) {
+        if (tb_cflags(s->base.tb) & CF_PCREL && a.base == -2) {
             /* With cpu_eip ~= pc_save, the expression is pc-relative. */
             tcg_gen_addi_tl(s->A0, cpu_eip, a.disp - s->pc_save);
         } else {
@@ -2867,7 +2867,7 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     if (!CODE64(s)) {
         if (ot == MO_16) {
             mask = 0xffff;
-            if (TARGET_TB_PCREL && CODE32(s)) {
+            if (tb_cflags(s->base.tb) & CF_PCREL && CODE32(s)) {
                 use_goto_tb = false;
             }
         } else {
@@ -2879,7 +2879,7 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     gen_update_cc_op(s);
     set_cc_op(s, CC_OP_DYNAMIC);
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_tl(cpu_eip, cpu_eip, new_pc - s->pc_save);
         /*
          * If we can prove the branch does not leave the page and we have
@@ -2896,13 +2896,13 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
         translator_use_goto_tb(&s->base, new_eip + s->cs_base)) {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
-        if (!TARGET_TB_PCREL) {
+        if (!(tb_cflags(s->base.tb) & CF_PCREL)) {
             tcg_gen_movi_tl(cpu_eip, new_eip);
         }
         tcg_gen_exit_tb(s->base.tb, tb_num);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
-        if (!TARGET_TB_PCREL) {
+        if (!(tb_cflags(s->base.tb) & CF_PCREL)) {
             tcg_gen_movi_tl(cpu_eip, new_eip);
         }
         if (s->jmp_opt) {
@@ -7065,7 +7065,7 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     target_ulong pc_arg = dc->base.pc_next;
 
     dc->prev_insn_end = tcg_last_op();
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg -= dc->cs_base;
         pc_arg &= ~TARGET_PAGE_MASK;
     }
-- 
2.39.1


