Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFEC413B93
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:41:35 +0200 (CEST)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSma6-0004oq-GD
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmFB-0004my-8a
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:57 -0400
Received: from [115.28.160.31] (port=56030 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmF8-0000Z2-MN
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:56 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D96DC63409;
 Wed, 22 Sep 2021 04:19:28 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255568; bh=fGkQOcGADAuUktIClX7xY2mHnWiUB+bW/6Ha7Vi4tvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xFwhE69/wwRE0BuygSEVoq0m8R3sm2jipDueGvAknorh7mEfjBE35dp/lvQ+ciJmG
 8uIHZ++LLB7cwvGtYg1J0akVDxcqXqa8T0RVoGF3oD9lQ2E8RprSkPlnQeB2Wg3y+v
 SBvfU6AEny8rpnDeuNJl0wi7z7AsqPaEot/Ugnk8=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/30] tcg/loongarch64: Implement tcg_target_qemu_prologue
Date: Wed, 22 Sep 2021 04:19:09 +0800
Message-Id: <20210921201915.601245-25-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921201915.601245-1-git@xen0n.name>
References: <20210921201915.601245-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index bbb6b7f47d..0c413c4c95 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -906,6 +906,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
  * Entry-points
  */
 
+static const tcg_insn_unit *tb_ret_addr;
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1454,3 +1456,69 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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
2.33.0


