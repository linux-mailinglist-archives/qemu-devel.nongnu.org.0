Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E899747B9DC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 07:08:52 +0100 (CET)
Received: from localhost ([::1]:33464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzYKO-0008AT-4B
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 01:08:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mzXvC-0001wz-WC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:42:47 -0500
Received: from mail.xen0n.name ([115.28.160.31]:56612
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mzXvA-00024X-Jk
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:42:46 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 02432606EB;
 Tue, 21 Dec 2021 13:42:28 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1640065349; bh=N9HiSwdU291ak1plx2iLiGCGG8qZVu8NSIaq+hvji7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FS0fw4Hp7l6QJSHEwT3Zx3VR54nJdbTrcfueYRfzM36WqSgHJhetRUuymtiovLtXC
 ZcA663YgGrC1M6Y5yIZzj8IgzDC2hCGMqtE/CyJp8TZd9EN2inhREfHLajqk7ND3nD
 yR2pI3ons8H7RHOO+RMVFa5OJYD9oNbU2d1FVYA0=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 22/31] tcg/loongarch64: Implement simple load/store ops
Date: Tue, 21 Dec 2021 13:40:56 +0800
Message-Id: <20211221054105.178795-23-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211221054105.178795-1-git@xen0n.name>
References: <20211221054105.178795-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/loongarch64/tcg-target-con-set.h |   1 +
 tcg/loongarch64/tcg-target.c.inc     | 131 +++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index a2ec61237e..e54ca9b2de 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -15,6 +15,7 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
+C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 151d3308ea..3d1d7c33c0 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -565,6 +565,73 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
     tcg_out_call_int(s, arg, false);
 }
 
+/*
+ * Load/store helpers
+ */
+
+static void tcg_out_ldst(TCGContext *s, LoongArchInsn opc, TCGReg data,
+                         TCGReg addr, intptr_t offset)
+{
+    intptr_t imm12 = sextreg(offset, 0, 12);
+
+    if (offset != imm12) {
+        intptr_t diff = offset - (uintptr_t)s->code_ptr;
+
+        if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
+            imm12 = sextreg(diff, 0, 12);
+            tcg_out_opc_pcaddu12i(s, TCG_REG_TMP2, (diff - imm12) >> 12);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP2, offset - imm12);
+            if (addr != TCG_REG_ZERO) {
+                tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, addr);
+            }
+        }
+        addr = TCG_REG_TMP2;
+    }
+
+    switch (opc) {
+    case OPC_LD_B:
+    case OPC_LD_BU:
+    case OPC_LD_H:
+    case OPC_LD_HU:
+    case OPC_LD_W:
+    case OPC_LD_WU:
+    case OPC_LD_D:
+    case OPC_ST_B:
+    case OPC_ST_H:
+    case OPC_ST_W:
+    case OPC_ST_D:
+        tcg_out32(s, encode_djsk12_insn(opc, data, addr, imm12));
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
+{
+    bool is_32bit = type == TCG_TYPE_I32;
+    tcg_out_ldst(s, is_32bit ? OPC_LD_W : OPC_LD_D, arg, arg1, arg2);
+}
+
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
+{
+    bool is_32bit = type == TCG_TYPE_I32;
+    tcg_out_ldst(s, is_32bit ? OPC_ST_W : OPC_ST_D, arg, arg1, arg2);
+}
+
+static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
+                        TCGReg base, intptr_t ofs)
+{
+    if (val == 0) {
+        tcg_out_st(s, type, TCG_REG_ZERO, base, ofs);
+        return true;
+    }
+    return false;
+}
+
 /*
  * Entry-points
  */
@@ -913,6 +980,49 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_setcond(s, args[3], a0, a1, a2, c2);
         break;
 
+    case INDEX_op_ld8s_i32:
+    case INDEX_op_ld8s_i64:
+        tcg_out_ldst(s, OPC_LD_B, a0, a1, a2);
+        break;
+    case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8u_i64:
+        tcg_out_ldst(s, OPC_LD_BU, a0, a1, a2);
+        break;
+    case INDEX_op_ld16s_i32:
+    case INDEX_op_ld16s_i64:
+        tcg_out_ldst(s, OPC_LD_H, a0, a1, a2);
+        break;
+    case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16u_i64:
+        tcg_out_ldst(s, OPC_LD_HU, a0, a1, a2);
+        break;
+    case INDEX_op_ld_i32:
+    case INDEX_op_ld32s_i64:
+        tcg_out_ldst(s, OPC_LD_W, a0, a1, a2);
+        break;
+    case INDEX_op_ld32u_i64:
+        tcg_out_ldst(s, OPC_LD_WU, a0, a1, a2);
+        break;
+    case INDEX_op_ld_i64:
+        tcg_out_ldst(s, OPC_LD_D, a0, a1, a2);
+        break;
+
+    case INDEX_op_st8_i32:
+    case INDEX_op_st8_i64:
+        tcg_out_ldst(s, OPC_ST_B, a0, a1, a2);
+        break;
+    case INDEX_op_st16_i32:
+    case INDEX_op_st16_i64:
+        tcg_out_ldst(s, OPC_ST_H, a0, a1, a2);
+        break;
+    case INDEX_op_st_i32:
+    case INDEX_op_st32_i64:
+        tcg_out_ldst(s, OPC_ST_W, a0, a1, a2);
+        break;
+    case INDEX_op_st_i64:
+        tcg_out_ldst(s, OPC_ST_D, a0, a1, a2);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
@@ -927,6 +1037,15 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_goto_ptr:
         return C_O0_I1(r);
 
+    case INDEX_op_st8_i32:
+    case INDEX_op_st8_i64:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st16_i64:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i32:
+    case INDEX_op_st_i64:
+        return C_O0_I2(rZ, r);
+
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
@@ -954,6 +1073,18 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
     case INDEX_op_bswap64_i64:
+    case INDEX_op_ld8s_i32:
+    case INDEX_op_ld8s_i64:
+    case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8u_i64:
+    case INDEX_op_ld16s_i32:
+    case INDEX_op_ld16s_i64:
+    case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16u_i64:
+    case INDEX_op_ld32s_i64:
+    case INDEX_op_ld32u_i64:
+    case INDEX_op_ld_i32:
+    case INDEX_op_ld_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
-- 
2.34.0


