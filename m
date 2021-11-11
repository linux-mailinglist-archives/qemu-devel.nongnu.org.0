Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB6444D9B2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:00:27 +0100 (CET)
Received: from localhost ([::1]:40680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCV0-0002Td-OS
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:00:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCRy-0003mx-SR; Thu, 11 Nov 2021 10:57:20 -0500
Received: from mail142-36.mail.alibaba.com ([198.11.142.36]:39031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCRv-0008PZ-Ow; Thu, 11 Nov 2021 10:57:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0116271-0.000182734-0.98819;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LrJS3fw_1636646223; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrJS3fw_1636646223)
 by smtp.aliyun-inc.com(10.147.42.241);
 Thu, 11 Nov 2021 23:57:03 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 10/20] target/riscv: Calculate address according to XLEN
Date: Thu, 11 Nov 2021 23:51:39 +0800
Message-Id: <20211111155149.58172-11-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.36; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-36.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define one common function to compute a canonical address from a register
plus offset. Merge gen_pm_adjust_address into this function.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rva.c.inc |  9 +++------
 target/riscv/insn_trans/trans_rvd.c.inc | 19 ++---------------
 target/riscv/insn_trans/trans_rvf.c.inc | 19 ++---------------
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++---------------
 target/riscv/translate.c                | 27 ++++++++++++-------------
 5 files changed, 22 insertions(+), 70 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 40fe132b04..1f64b8d332 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -20,12 +20,11 @@
 
 static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
+    TCGv src1 = get_address(ctx, a->rs1, 0);
 
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
-    src1 = gen_pm_adjust_address(ctx, src1);
     tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -44,8 +43,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
-    src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
-    src1 = gen_pm_adjust_address(ctx, src1);
+    src1 = get_address(ctx, a->rs1, 0);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
     /*
@@ -83,10 +81,9 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     MemOp mop)
 {
     TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src1 = get_address(ctx, a->rs1, 0);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
 
-    src1 = gen_pm_adjust_address(ctx, src1);
     func(dest, src1, src2, ctx->mem_idx, mop);
 
     gen_set_gpr(ctx, a->rd, dest);
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 64fb0046f7..88a491375c 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -25,14 +25,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    addr = get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
-    }
-    addr = gen_pm_adjust_address(ctx, addr);
-
+    addr = get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
 
     mark_fs_dirty(ctx);
@@ -46,16 +39,8 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    addr = get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
-    }
-    addr = gen_pm_adjust_address(ctx, addr);
-
+    addr = get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
-
     return true;
 }
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index b5459249c4..0aac87f7db 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -31,14 +31,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    addr = get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
-    }
-    addr = gen_pm_adjust_address(ctx, addr);
-
+    addr = get_address(ctx, a->rs1, a->imm);
     dest = cpu_fpr[a->rd];
     tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
     gen_nanbox_s(dest, dest);
@@ -54,16 +47,8 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    addr = get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp = tcg_temp_new();
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
-    }
-    addr = gen_pm_adjust_address(ctx, addr);
-
+    addr = get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
-
     return true;
 }
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 40c81421f2..cb73a2f1ee 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -137,14 +137,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
     TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
-    }
-    addr = gen_pm_adjust_address(ctx, addr);
+    TCGv addr = get_address(ctx, a->rs1, a->imm);
 
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
     gen_set_gpr(ctx, a->rd, dest);
@@ -178,16 +171,9 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr = get_address(ctx, a->rs1, a->imm);
     TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
 
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
-    }
-    addr = gen_pm_adjust_address(ctx, addr);
-
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6cb74c6355..fd75f7c4bc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -284,21 +284,20 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-/*
- * Generates address adjustment for PointerMasking
- */
-static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
-{
-    TCGv temp;
-    if (!s->pm_enabled) {
-        /* Load unmodified address */
-        return src;
-    } else {
-        temp = temp_new(s);
-        tcg_gen_andc_tl(temp, src, pm_mask);
-        tcg_gen_or_tl(temp, temp, pm_base);
-        return temp;
+/* Compute a canonical address from a register plus offset. */
+static TCGv get_address(DisasContext *ctx, int rs1, int imm)
+{
+    TCGv addr = temp_new(ctx);
+    TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
+
+    tcg_gen_addi_tl(addr, src1, imm);
+    if (ctx->pm_enabled) {
+        tcg_gen_and_tl(addr, addr, pm_mask);
+        tcg_gen_or_tl(addr, addr, pm_base);
+    } else if (get_xl(ctx) == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
     }
+    return addr;
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1


