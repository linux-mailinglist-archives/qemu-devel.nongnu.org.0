Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5059965732D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 07:23:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAPoA-0000UH-7G; Wed, 28 Dec 2022 01:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pAPo4-0000SF-EY; Wed, 28 Dec 2022 01:20:52 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pAPo1-0000vS-0F; Wed, 28 Dec 2022 01:20:52 -0500
Received: from localhost.localdomain (unknown [61.165.33.198])
 by APP-01 (Coremail) with SMTP id qwCowABX2ewx4KtjqJCSCQ--.53263S7;
 Wed, 28 Dec 2022 14:20:38 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v9 5/9] target/riscv: add support for Zcb extension
Date: Wed, 28 Dec 2022 14:20:24 +0800
Message-Id: <20221228062028.29415-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228062028.29415-1-liweiwei@iscas.ac.cn>
References: <20221228062028.29415-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABX2ewx4KtjqJCSCQ--.53263S7
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1Dtw13Cr18try7tF15XFb_yoW7trWrpF
 1xCryUGFyqgFyIyayfKF13XF17Wr4fWrWUK39xAw1kGayYgFWDJF1DKay3Ka1DXr4DWr4j
 k3WDAayUJ3y0q37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
X-Originating-IP: [61.165.33.198]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

Add encode and trans* functions support for Zcb instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode                |  24 ++++++
 target/riscv/insn_trans/trans_rvzce.c.inc | 100 ++++++++++++++++++++++
 target/riscv/translate.c                  |   2 +
 3 files changed, 126 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index b62664b6af..47603ec1e0 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -43,6 +43,8 @@
 %imm_addi16sp  12:s1 3:2 5:1 2:1 6:1 !function=ex_shift_4
 %imm_lui       12:s1 2:5             !function=ex_shift_12
 
+%zcb_b_uimm  5:1 6:1
+%zcb_h_uimm  5:1                     !function=ex_shift_1
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -53,6 +55,7 @@
 &b         imm rs2 rs1  !extern
 &u         imm rd       !extern
 &shift     shamt rs1 rd !extern
+&r2        rd rs1       !extern
 
 
 # Formats 16:
@@ -89,6 +92,13 @@
 
 @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
 
+@zcb_unary    ... ...  ... .. ... ..  &r2                  rs1=%rs1_3 rd=%rs1_3
+@zcb_binary   ... ...  ... .. ... ..  &r  rs2=%rs2_3       rs1=%rs1_3 rd=%rs1_3
+@zcb_lb       ... . .. ... .. ... ..  &i  imm=%zcb_b_uimm  rs1=%rs1_3 rd=%rs2_3
+@zcb_lh       ... . .. ... .. ... ..  &i  imm=%zcb_h_uimm  rs1=%rs1_3 rd=%rs2_3
+@zcb_sb       ... . .. ... .. ... ..  &s  imm=%zcb_b_uimm  rs1=%rs1_3 rs2=%rs2_3
+@zcb_sh       ... . .. ... .. ... ..  &s  imm=%zcb_h_uimm  rs1=%rs1_3 rs2=%rs2_3
+
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
   # Opcode of all zeros is illegal; rd != 0, nzuimm == 0 is reserved.
@@ -180,3 +190,17 @@ sw                110 .  .....  ..... 10 @c_swsp
   sd              111 .  .....  ..... 10 @c_sdsp
   c_fsw           111 .  .....  ..... 10 @c_swsp
 }
+
+# *** RV64 and RV32 Zcb Extension ***
+c_zext_b          100 111  ... 11 000 01 @zcb_unary
+c_sext_b          100 111  ... 11 001 01 @zcb_unary
+c_zext_h          100 111  ... 11 010 01 @zcb_unary
+c_sext_h          100 111  ... 11 011 01 @zcb_unary
+c_zext_w          100 111  ... 11 100 01 @zcb_unary
+c_not             100 111  ... 11 101 01 @zcb_unary
+c_mul             100 111  ... 10 ... 01 @zcb_binary
+c_lbu             100 000  ... .. ... 00 @zcb_lb
+c_lhu             100 001  ... 0. ... 00 @zcb_lh
+c_lh              100 001  ... 1. ... 00 @zcb_lh
+c_sb              100 010  ... .. ... 00 @zcb_sb
+c_sh              100 011  ... 0. ... 00 @zcb_sh
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
new file mode 100644
index 0000000000..de96c4afaf
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -0,0 +1,100 @@
+/*
+ * RISC-V translation routines for the Zcb Standard Extension.
+ *
+ * Copyright (c) 2021-2022 PLCT Lab
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define REQUIRE_ZCB(ctx) do {   \
+    if (!ctx->cfg_ptr->ext_zcb) \
+        return false;           \
+} while (0)
+
+static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8u_tl);
+}
+
+static bool trans_c_zext_h(DisasContext *ctx, arg_c_zext_h *a)
+{
+    REQUIRE_ZCB(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
+}
+
+static bool trans_c_sext_b(DisasContext *ctx, arg_c_sext_b *a)
+{
+    REQUIRE_ZCB(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
+}
+
+static bool trans_c_sext_h(DisasContext *ctx, arg_c_sext_h *a)
+{
+    REQUIRE_ZCB(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
+}
+
+static bool trans_c_zext_w(DisasContext *ctx, arg_c_zext_w *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZCB(ctx);
+    REQUIRE_ZBA(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext32u_tl);
+}
+
+static bool trans_c_not(DisasContext *ctx, arg_c_not *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_not_tl);
+}
+
+static bool trans_c_mul(DisasContext *ctx, arg_c_mul *a)
+{
+    REQUIRE_ZCB(ctx);
+    REQUIRE_M_OR_ZMMUL(ctx);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
+}
+
+static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_load(ctx, a, MO_UB);
+}
+
+static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_load(ctx, a, MO_UW);
+}
+
+static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_load(ctx, a, MO_SW);
+}
+
+static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_store(ctx, a, MO_UB);
+}
+
+static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_store(ctx, a, MO_UW);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 93ec2b7c55..76d1a9661c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1069,6 +1069,8 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
+#include "insn_trans/trans_rvzce.c.inc"
+
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
 
-- 
2.25.1


