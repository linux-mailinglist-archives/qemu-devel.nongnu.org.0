Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AAF45CC7A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:51:23 +0100 (CET)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxMY-0002I1-6s
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:51:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5c-0007K6-6t
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:52 -0500
Received: from mail.xen0n.name ([115.28.160.31]:43560
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5Z-0004kZ-4F
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:51 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id AD22A60AFD;
 Thu, 25 Nov 2021 02:33:29 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637778809; bh=OClE/tOQKilUDgLxcC19Ho/bF5sQH/M+8KR3uiT2fbQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G+jxSo8AhRnbZs45lsKI4jaY4oPmNiI0W7sVit1hVSLF4P/u9XdbB5wNjZaWSOmFo
 kmB1ClcBKOKgrQfy4T0bhhHu0nuT8p5Esnmo5AQZLFEXKHuQVki1oxoSk7Dp+KrQp7
 Dk1NUsr5EqQxNiJToeTVZDUgsE5jdkA0Vlun3Omg=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v8 19/31] tcg/loongarch64: Implement br/brcond ops
Date: Thu, 25 Nov 2021 02:32:19 +0800
Message-Id: <20211124183231.1503090-20-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211124183231.1503090-1-git@xen0n.name>
References: <20211124183231.1503090-1-git@xen0n.name>
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
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 53 ++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index fb56f3a295..367689c2e2 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -15,6 +15,7 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
+C_O0_I2(rZ, rZ)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 67f07a3853..816b16f10f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -434,6 +434,44 @@ static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
     tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
 }
 
+/*
+ * Branch helpers
+ */
+
+static const struct {
+    LoongArchInsn op;
+    bool swap;
+} tcg_brcond_to_loongarch[] = {
+    [TCG_COND_EQ] =  { OPC_BEQ,  false },
+    [TCG_COND_NE] =  { OPC_BNE,  false },
+    [TCG_COND_LT] =  { OPC_BGT,  true  },
+    [TCG_COND_GE] =  { OPC_BLE,  true  },
+    [TCG_COND_LE] =  { OPC_BLE,  false },
+    [TCG_COND_GT] =  { OPC_BGT,  false },
+    [TCG_COND_LTU] = { OPC_BGTU, true  },
+    [TCG_COND_GEU] = { OPC_BLEU, true  },
+    [TCG_COND_LEU] = { OPC_BLEU, false },
+    [TCG_COND_GTU] = { OPC_BGTU, false }
+};
+
+static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
+                           TCGReg arg2, TCGLabel *l)
+{
+    LoongArchInsn op = tcg_brcond_to_loongarch[cond].op;
+
+    tcg_debug_assert(op != 0);
+
+    if (tcg_brcond_to_loongarch[cond].swap) {
+        TCGReg t = arg1;
+        arg1 = arg2;
+        arg2 = t;
+    }
+
+    /* all conditional branch insns belong to DJSk16-format */
+    tcg_out_reloc(s, s->code_ptr, R_LOONGARCH_BR_SK16, l, 0);
+    tcg_out32(s, encode_djsk16_insn(op, arg1, arg2, 0));
+}
+
 /*
  * Entry-points
  */
@@ -456,6 +494,17 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_jirl(s, TCG_REG_ZERO, a0, 0);
         break;
 
+    case INDEX_op_br:
+        tcg_out_reloc(s, s->code_ptr, R_LOONGARCH_BR_SD10K16, arg_label(a0),
+                      0);
+        tcg_out_opc_b(s, 0);
+        break;
+
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
+        break;
+
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
         tcg_out_ext8s(s, a0, a1);
@@ -779,6 +828,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_goto_ptr:
         return C_O0_I1(r);
 
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        return C_O0_I2(rZ, rZ);
+
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
-- 
2.34.0


