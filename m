Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52D6A4366
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:54:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdvZ-0006d0-Ks; Mon, 27 Feb 2023 08:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvV-0006YZ-A6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:25 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvT-0005TY-JQ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FPAnU2eoTUOHIVAPGWUVJM936af5bDpPeKc/JrTBUuo=; b=FwWs6vi7Ng6igOzIP5BAA/sbmV
 DpDfzTFbZC5WqcAOzasP6LFt1PeEPP1DVBeGEcfnObg66+YpGYX7TBpkeUUjGYa62sKex+Ve56aFR
 gQJGE92PI+05HWGn/fs1hGvoGMOzmcdBLqE7jRTWu0Vsz8BrVIsm8vLryztBQee8Hj6c=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v3 06/27] target/arm: Replace `TARGET_TB_PCREL` with `CF_PCREL`
Date: Mon, 27 Feb 2023 14:51:41 +0100
Message-Id: <20230227135202.9710-7-anjo@rev.ng>
In-Reply-To: <20230227135202.9710-1-anjo@rev.ng>
References: <20230227135202.9710-1-anjo@rev.ng>
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
 target/arm/cpu.c           | 8 ++++----
 target/arm/translate-a64.c | 8 ++++----
 target/arm/translate.c     | 6 +++---
 target/arm/translate.h     | 2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c38420a4d1..c05cb86a47 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -78,8 +78,8 @@ static vaddr arm_cpu_get_pc(CPUState *cs)
 void arm_cpu_synchronize_from_tb(CPUState *cs,
                                  const TranslationBlock *tb)
 {
-    /* The program counter is always up to date with TARGET_TB_PCREL. */
-    if (!TARGET_TB_PCREL) {
+    /* The program counter is always up to date with CF_PCREL. */
+    if (!(tb_cflags(tb) & CF_PCREL)) {
         CPUARMState *env = cs->env_ptr;
         /*
          * It's OK to look at env for the current mode here, because it's
@@ -100,7 +100,7 @@ void arm_restore_state_to_opc(CPUState *cs,
     CPUARMState *env = cs->env_ptr;
 
     if (is_a64(env)) {
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(tb) & CF_PCREL) {
             env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
         } else {
             env->pc = data[0];
@@ -108,7 +108,7 @@ void arm_restore_state_to_opc(CPUState *cs,
         env->condexec_bits = 0;
         env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     } else {
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(tb) & CF_PCREL) {
             env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
         } else {
             env->regs[15] = data[0];
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index da9f877476..b6d00b81da 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -143,7 +143,7 @@ static void reset_btype(DisasContext *s)
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, target_long diff)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_i64(dest, cpu_pc, (s->pc_curr - s->pc_save) + diff);
     } else {
         tcg_gen_movi_i64(dest, s->pc_curr + diff);
@@ -393,7 +393,7 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
          * update to pc to the unlinked path.  A long chain of links
          * can thus avoid many updates to the PC.
          */
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(s->base.tb) & CF_PCREL) {
             gen_a64_update_pc(s, diff);
             tcg_gen_goto_tb(n);
         } else {
@@ -4297,7 +4297,7 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
     if (page) {
         /* ADRP (page based) */
         offset <<= 12;
-        /* The page offset is ok for TARGET_TB_PCREL. */
+        /* The page offset is ok for CF_PCREL. */
         offset -= s->pc_curr & 0xfff;
     }
 
@@ -14809,7 +14809,7 @@ static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     target_ulong pc_arg = dc->base.pc_next;
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
     }
     tcg_gen_insn_start(pc_arg, 0, 0);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c23a3462bf..0e7d3b8561 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -269,7 +269,7 @@ static target_long jmp_diff(DisasContext *s, target_long diff)
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
 {
     assert(s->pc_save != -1);
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(s->base.tb) & CF_PCREL) {
         tcg_gen_addi_i32(var, cpu_R[15], (s->pc_curr - s->pc_save) + diff);
     } else {
         tcg_gen_movi_i32(var, s->pc_curr + diff);
@@ -2620,7 +2620,7 @@ static void gen_goto_tb(DisasContext *s, int n, target_long diff)
          * update to pc to the unlinked path.  A long chain of links
          * can thus avoid many updates to the PC.
          */
-        if (TARGET_TB_PCREL) {
+        if (tb_cflags(s->base.tb) & CF_PCREL) {
             gen_update_pc(s, diff);
             tcg_gen_goto_tb(n);
         } else {
@@ -9542,7 +9542,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t condexec_bits;
     target_ulong pc_arg = dc->base.pc_next;
 
-    if (TARGET_TB_PCREL) {
+    if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
     }
     if (dc->eci) {
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3717824b75..4001372acd 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -23,7 +23,7 @@ typedef struct DisasContext {
     /* The address of the current instruction being translated. */
     target_ulong pc_curr;
     /*
-     * For TARGET_TB_PCREL, the full value of cpu_pc is not known
+     * For CF_PCREL, the full value of cpu_pc is not known
      * (although the page offset is known).  For convenience, the
      * translation loop uses the full virtual address that triggered
      * the translation, from base.pc_start through pc_curr.
-- 
2.39.1


