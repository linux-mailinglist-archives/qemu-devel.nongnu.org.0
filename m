Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD7473E17
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 09:14:40 +0100 (CET)
Received: from localhost ([::1]:47574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx2xL-0006SI-Gb
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 03:14:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2mz-0007Ic-97
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:03:57 -0500
Received: from mail.xen0n.name ([115.28.160.31]:48756
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2mx-0000XK-9P
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:03:57 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 06BBF606C3;
 Tue, 14 Dec 2021 16:03:37 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639469017; bh=pe+MEW31cRr8jfsHQtSqaYbqsmgo0zBdyE/cjStZiho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KRctuDBiTlAULJzoGMwLqNRRcG1gAVGL5AAA376hBQgP455yK1qS84GjZ/3NMQ7YV
 btLjEPda8Qn8GF07Ao3uK8OGqECHObZyIYSwrUG0QpgHMHWqCDP3tXx+xOKgSEfzAP
 ArkT/56GliESqELU9fFZeww0m6YYg/C9ntE7MPt0=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 24/31] tcg/loongarch64: Implement tcg_target_qemu_prologue
Date: Tue, 14 Dec 2021 16:01:47 +0800
Message-Id: <20211214080154.196350-25-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211214080154.196350-1-git@xen0n.name>
References: <20211214080154.196350-1-git@xen0n.name>
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
 tcg/loongarch64/tcg-target.c.inc | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index c92587c823..a806e3352e 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -968,6 +968,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
  * Entry-points
  */
 
+static const tcg_insn_unit *tb_ret_addr;
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1517,3 +1519,69 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         g_assert_not_reached();
     }
 }
+
+static const int tcg_target_callee_save_regs[] = {
+    TCG_REG_S0,     /* used for the global env (TCG_AREG0) */
+    TCG_REG_S1,
+    TCG_REG_S2,
+    TCG_REG_S3,
+    TCG_REG_S4,
+    TCG_REG_S5,
+    TCG_REG_S6,
+    TCG_REG_S7,
+    TCG_REG_S8,
+    TCG_REG_S9,
+    TCG_REG_RA,     /* should be last for ABI compliance */
+};
+
+/* Stack frame parameters.  */
+#define REG_SIZE   (TCG_TARGET_REG_BITS / 8)
+#define SAVE_SIZE  ((int)ARRAY_SIZE(tcg_target_callee_save_regs) * REG_SIZE)
+#define TEMP_SIZE  (CPU_TEMP_BUF_NLONGS * (int)sizeof(long))
+#define FRAME_SIZE ((TCG_STATIC_CALL_ARGS_SIZE + TEMP_SIZE + SAVE_SIZE \
+                     + TCG_TARGET_STACK_ALIGN - 1) \
+                    & -TCG_TARGET_STACK_ALIGN)
+#define SAVE_OFS   (TCG_STATIC_CALL_ARGS_SIZE + TEMP_SIZE)
+
+/* We're expecting to be able to use an immediate for frame allocation.  */
+QEMU_BUILD_BUG_ON(FRAME_SIZE > 0x7ff);
+
+/* Generate global QEMU prologue and epilogue code */
+static void tcg_target_qemu_prologue(TCGContext *s)
+{
+    int i;
+
+    tcg_set_frame(s, TCG_REG_SP, TCG_STATIC_CALL_ARGS_SIZE, TEMP_SIZE);
+
+    /* TB prologue */
+    tcg_out_opc_addi_d(s, TCG_REG_SP, TCG_REG_SP, -FRAME_SIZE);
+    for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); i++) {
+        tcg_out_st(s, TCG_TYPE_REG, tcg_target_callee_save_regs[i],
+                   TCG_REG_SP, SAVE_OFS + i * REG_SIZE);
+    }
+
+#if !defined(CONFIG_SOFTMMU)
+    if (USE_GUEST_BASE) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
+        tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
+    }
+#endif
+
+    /* Call generated code */
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
+    tcg_out_opc_jirl(s, TCG_REG_ZERO, tcg_target_call_iarg_regs[1], 0);
+
+    /* Return path for goto_ptr. Set return value to 0 */
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
+    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_A0, TCG_REG_ZERO);
+
+    /* TB epilogue */
+    tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
+    for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); i++) {
+        tcg_out_ld(s, TCG_TYPE_REG, tcg_target_callee_save_regs[i],
+                   TCG_REG_SP, SAVE_OFS + i * REG_SIZE);
+    }
+
+    tcg_out_opc_addi_d(s, TCG_REG_SP, TCG_REG_SP, FRAME_SIZE);
+    tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_RA, 0);
+}
-- 
2.34.0


