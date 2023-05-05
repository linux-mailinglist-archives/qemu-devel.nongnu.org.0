Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A956F7A54
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrp-0008HP-32; Thu, 04 May 2023 21:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujri-0008FY-1l
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:06 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrg-0006ww-07
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1a50cb65c92so8230985ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248641; x=1685840641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ATqXAaRyTP9goBurtZyxqTGUYDE3bm5yuJr3IsVaVdU=;
 b=k5fTjFh5dFZe8rrAXTZnszJC0tOu92tnOpmUAPUNoOw0pR/cz0driziuxm3dDijBtx
 5iObV0ZRY9Ly11Vn9YNYLt+kMaL+0Md8NvaDhiT7NHZ9AvD9bmL1fp/LX/BZVWdSpAnW
 7o5bAAgHVisCFS+sywLZ9k8u9lH5DriTbGeF9wzbRqsiSM9vVnQypjw5ojCMhjdgQV+M
 VrfUi2Ztar/qEbyNAXR9EFdMz+EzpLcPRAR2js2pekZcaRj6GhnbR2NHYmVL8o1oqoMu
 OZ/miyAdCTp7vdjqEPQ/D/K+GBFwd5bm+46fDDH/HWeoe50cl3MUwFEeTzGkxlE5nU4u
 ZI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248641; x=1685840641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ATqXAaRyTP9goBurtZyxqTGUYDE3bm5yuJr3IsVaVdU=;
 b=IKI7rdOoXlac5vi8yXkxoDnGMGqO40D+nfMm4AWt3xEAFBeDehMhXmtqB3QNCjx7yv
 ybiHeEVpBx9ymdvE9AG8+ehGmV+tDB4RZTGoKSsvnUJDXnnDhw0kTg7J1pcO0shUX37I
 gMNXe5vdOw7DnAQwuYc57KaVR8RbWFofgcuJMWPKytqUhpCMHALGI/ZvNhUmMVop+E/9
 oiNcxcIVGXldo1WL86F6EIPDroHwg6LmWbJW8lmDxs6NNlWfkFI/uvRQQS2RYaJjEz2L
 4i3rzQNItGeTeuVf9nwSeUFkilQSDSDN4nxr6j/BwFTr/kPkNI9ql7EzR8PPukYxE+O0
 R95A==
X-Gm-Message-State: AC+VfDx4sRuUgILx1Nj3xlS9TfB8Qed9U6lWvUyKfQ8yV6uXynRKZItv
 QWM+ygyg6jOg+xhUVsTSzupcKPR/9gsL5g==
X-Google-Smtp-Source: ACHHUZ67svsbDh/ZidQgN9466GseP6NWV7PgwslqYNeYh39DB2YG564EItqdxyiS22jSJpnm4Oy0LQ==
X-Received: by 2002:a17:902:ceca:b0:1a9:b977:81c7 with SMTP id
 d10-20020a170902ceca00b001a9b97781c7mr6107777plg.62.1683248641146; 
 Thu, 04 May 2023 18:04:01 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:00 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/89] target/riscv: add support for Zcb extension
Date: Fri,  5 May 2023 11:01:25 +1000
Message-Id: <20230505010241.21812-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add encode and trans* functions support for Zcb instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307081403.61950-6-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode                |  23 +++++
 target/riscv/translate.c                  |   2 +
 target/riscv/insn_trans/trans_rvzce.c.inc | 100 ++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index b62664b6af..ab780fa46a 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -43,6 +43,8 @@
 %imm_addi16sp  12:s1 3:2 5:1 2:1 6:1 !function=ex_shift_4
 %imm_lui       12:s1 2:5             !function=ex_shift_12
 
+%uimm_cl_b  5:1 6:1
+%uimm_cl_h  5:1                      !function=ex_shift_1
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -53,6 +55,7 @@
 &b         imm rs2 rs1  !extern
 &u         imm rd       !extern
 &shift     shamt rs1 rd !extern
+&r2        rd rs1       !extern
 
 
 # Formats 16:
@@ -89,6 +92,12 @@
 
 @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
 
+@cu           ... ...  ... .. ... ..  &r2                 rs1=%rs1_3 rd=%rs1_3
+@cl_b         ... . .. ... .. ... ..  &i  imm=%uimm_cl_b  rs1=%rs1_3 rd=%rs2_3
+@cl_h         ... . .. ... .. ... ..  &i  imm=%uimm_cl_h  rs1=%rs1_3 rd=%rs2_3
+@cs_b         ... . .. ... .. ... ..  &s  imm=%uimm_cl_b  rs1=%rs1_3 rs2=%rs2_3
+@cs_h         ... . .. ... .. ... ..  &s  imm=%uimm_cl_h  rs1=%rs1_3 rs2=%rs2_3
+
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
   # Opcode of all zeros is illegal; rd != 0, nzuimm == 0 is reserved.
@@ -180,3 +189,17 @@ sw                110 .  .....  ..... 10 @c_swsp
   sd              111 .  .....  ..... 10 @c_sdsp
   c_fsw           111 .  .....  ..... 10 @c_swsp
 }
+
+# *** RV64 and RV32 Zcb Extension ***
+c_zext_b          100 111  ... 11 000 01 @cu
+c_sext_b          100 111  ... 11 001 01 @cu
+c_zext_h          100 111  ... 11 010 01 @cu
+c_sext_h          100 111  ... 11 011 01 @cu
+c_zext_w          100 111  ... 11 100 01 @cu
+c_not             100 111  ... 11 101 01 @cu
+c_mul             100 111  ... 10 ... 01 @cs_2
+c_lbu             100 000  ... .. ... 00 @cl_b
+c_lhu             100 001  ... 0. ... 00 @cl_h
+c_lh              100 001  ... 1. ... 00 @cl_h
+c_sb              100 010  ... .. ... 00 @cs_b
+c_sh              100 011  ... 0. ... 00 @cs_h
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d1fdd0c2d7..3634137d85 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1091,6 +1091,8 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
+#include "insn_trans/trans_rvzce.c.inc"
+
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
 
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
-- 
2.40.0


