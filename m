Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C34458CD0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 11:56:51 +0100 (CET)
Received: from localhost ([::1]:33148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp70E-0002yw-4o
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 05:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6n5-0001bA-HQ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:15 -0500
Received: from mail.xen0n.name ([115.28.160.31]:40704
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6mx-0007fb-EA
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:15 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4E38560AF8;
 Mon, 22 Nov 2021 18:42:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637577772; bh=j7mGQRWQBWt6QDMxP84npaaUq/zGlE8tjYPq+3URdAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cds+hT9dMk6aEhFsDcS0WCRAgCt+HjD5MVPZvmLtt0m/BIV0AIoiZo66ofuxK1ChR
 KGcbexxP8OqafZkO6S2PEoBceeRpLGqn7A4g/rC6glYbEeNSaBCQvDCutRueLfDdZL
 PwfaClp3FOVHuW0OH4tqXevpv/pv31HbF4UEso7M=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/31] tcg/loongarch64: Implement clz/ctz ops
Date: Mon, 22 Nov 2021 18:41:45 +0800
Message-Id: <20211122104201.112695-16-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122104201.112695-1-git@xen0n.name>
References: <20211122104201.112695-1-git@xen0n.name>
MIME-Version: 1.0
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
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 42 ++++++++++++++++++++++++++++
 tcg/loongarch64/tcg-target.h         |  8 +++---
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index d958183020..2975e03127 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -18,4 +18,5 @@ C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, rU)
+C_O1_I2(r, r, rW)
 C_O1_I2(r, 0, rZ)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 9adac5b3fc..4c1c1d6182 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -412,6 +412,28 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_addi_w(s, ret, arg, 0);
 }
 
+static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
+                           TCGReg a0, TCGReg a1, TCGReg a2,
+                           bool c2, bool is_32bit)
+{
+    if (c2) {
+        /*
+         * Fast path: semantics already satisfied due to constraint and
+         * insn behavior, single instruction is enough.
+         */
+        tcg_debug_assert(a2 == (is_32bit ? 32 : 64));
+        /* all clz/ctz insns belong to DJ-format */
+        tcg_out32(s, encode_dj_insn(opc, a0, a1));
+        return;
+    }
+
+    tcg_out32(s, encode_dj_insn(opc, TCG_REG_TMP0, a1));
+    /* a0 = a1 ? REG_TMP0 : a2 */
+    tcg_out_opc_maskeqz(s, TCG_REG_TMP0, TCG_REG_TMP0, a1);
+    tcg_out_opc_masknez(s, a0, a2, a1);
+    tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
+}
+
 /*
  * Entry-points
  */
@@ -572,6 +594,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_revb_d(s, a0, a1);
         break;
 
+    case INDEX_op_clz_i32:
+        tcg_out_clzctz(s, OPC_CLZ_W, a0, a1, a2, c2, true);
+        break;
+    case INDEX_op_clz_i64:
+        tcg_out_clzctz(s, OPC_CLZ_D, a0, a1, a2, c2, false);
+        break;
+
+    case INDEX_op_ctz_i32:
+        tcg_out_clzctz(s, OPC_CTZ_W, a0, a1, a2, c2, true);
+        break;
+    case INDEX_op_ctz_i64:
+        tcg_out_clzctz(s, OPC_CTZ_D, a0, a1, a2, c2, false);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -632,6 +668,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* LoongArch reg-imm bitops have their imms ZERO-extended */
         return C_O1_I2(r, r, rU);
 
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
+        return C_O1_I2(r, r, rW);
+
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
         /* Must deposit into the same register as input */
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 02d17d2f6d..ef489cbc86 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -120,8 +120,8 @@ typedef enum {
 #define TCG_TARGET_HAS_eqv_i32          0
 #define TCG_TARGET_HAS_nand_i32         0
 #define TCG_TARGET_HAS_nor_i32          1
-#define TCG_TARGET_HAS_clz_i32          0
-#define TCG_TARGET_HAS_ctz_i32          0
+#define TCG_TARGET_HAS_clz_i32          1
+#define TCG_TARGET_HAS_ctz_i32          1
 #define TCG_TARGET_HAS_ctpop_i32        0
 #define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_brcond2          0
@@ -156,8 +156,8 @@ typedef enum {
 #define TCG_TARGET_HAS_eqv_i64          0
 #define TCG_TARGET_HAS_nand_i64         0
 #define TCG_TARGET_HAS_nor_i64          1
-#define TCG_TARGET_HAS_clz_i64          0
-#define TCG_TARGET_HAS_ctz_i64          0
+#define TCG_TARGET_HAS_clz_i64          1
+#define TCG_TARGET_HAS_ctz_i64          1
 #define TCG_TARGET_HAS_ctpop_i64        0
 #define TCG_TARGET_HAS_add2_i64         0
 #define TCG_TARGET_HAS_sub2_i64         0
-- 
2.34.0


