Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E845CC84
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:52:50 +0100 (CET)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxNx-000760-IU
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:52:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5n-0007Vs-26
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:34:04 -0500
Received: from mail.xen0n.name ([115.28.160.31]:43574
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5k-0004mG-Mw
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:34:02 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4EE7060B03;
 Thu, 25 Nov 2021 02:33:31 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637778811; bh=0th7picu79b9GZssY1KrUJjyQw0OD5pYZVdOTKfzXko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J7DAIfi39LWeVZUGZ2RkqoOkkJgQmBvz2Kp/47RgJn/FH2cs+f+KPIe7x2Gc1elMG
 f5vAKRQGbV9fJ4IICDukqs6OOm0q73q94+Yvc5dYGlFyhtKbee30DKUdNBLaNMw8ER
 Hij6LKih9F7Qd++fUb1nj8Nb5eUiLFLXy6WnDQwg=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v8 25/31] tcg/loongarch64: Implement exit_tb/goto_tb
Date: Thu, 25 Nov 2021 02:32:25 +0800
Message-Id: <20211124183231.1503090-26-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211124183231.1503090-1-git@xen0n.name>
References: <20211124183231.1503090-1-git@xen0n.name>
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
 tcg/loongarch64/tcg-target.c.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a806e3352e..2d066a035d 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -980,6 +980,25 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c2 = const_args[2];
 
     switch (opc) {
+    case INDEX_op_exit_tb:
+        /* Reuse the zeroing that exists for goto_ptr.  */
+        if (a0 == 0) {
+            tcg_out_call_int(s, tcg_code_gen_epilogue, true);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A0, a0);
+            tcg_out_call_int(s, tb_ret_addr, true);
+        }
+        break;
+
+    case INDEX_op_goto_tb:
+        assert(s->tb_jmp_insn_offset == 0);
+        /* indirect jump method */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
+                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        set_jmp_reset_offset(s, a0);
+        break;
+
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
-- 
2.34.0


