Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCC741163E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:04:03 +0200 (CEST)
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJtq-0001Zx-2b
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEPA-000087-85
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:12:00 -0400
Received: from [115.28.160.31] (port=35598 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEP5-0005SC-RN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:12:00 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A6E5763409;
 Mon, 20 Sep 2021 16:06:10 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125170; bh=Q9oBbBpC4cxD0x+pbaGsc3akHZSv9dGWPw0p0YmNOdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c/L/l9YO1PR9uRDeC0q7TMexbMit6PRs3IXHvLnmzrYyU25zoHyEUiwDp9/DqUXrJ
 BTtyQbSrjwFOFJDtLCjPpi5uFnINZYfcZj1GKX6TvUoritYaXUSisIt5X4bEyanXuS
 bKNE6gbiSpGrpC0R9nEhbW4WdZjjcAT/9OZzXfc0=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/30] tcg/loongarch: Implement tcg_target_qemu_prologue
Date: Mon, 20 Sep 2021 16:04:45 +0800
Message-Id: <20210920080451.408655-25-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Sep 2021 09:57:24 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch/tcg-target.c.inc | 66 ++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index 0b6f16bde0..10df007087 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -887,6 +887,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
  * Entry-points
  */
 
+static const tcg_insn_unit *tb_ret_addr;
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1401,3 +1403,67 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
+    tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
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
2.33.0


