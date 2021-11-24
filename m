Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FC545CC2E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:36:13 +0100 (CET)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpx7r-0000ec-DS
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:36:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5I-00067L-QK
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:32 -0500
Received: from mail.xen0n.name ([115.28.160.31]:43324
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5E-0004gG-Tm
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:32 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E5C5160AEF;
 Thu, 25 Nov 2021 02:33:25 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637778806; bh=vhiQx6d6BuiQV2N7K6InfyjN8H+X/Ai6flZWrm1w7jQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJPvrwaO57wsVkeM+qPf4QkRiFvFvu0aFvZmWpG96gpa6Dd0Btn70SweWQjBZcdlK
 TsaiwHrLng9z0gGjdv3YIRXzRvy1d7xelnAZ2JgE6xrkXtb2t2pUJxr+bZ0ZRi+ZXL
 hspfgIzYCpvge0TK5TBH1PizJRmUobppFqM67jt0=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v8 05/31] tcg/loongarch64: Add register names,
 allocation order and input/output sets
Date: Thu, 25 Nov 2021 02:32:05 +0800
Message-Id: <20211124183231.1503090-6-git@xen0n.name>
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
 tcg/loongarch64/tcg-target.c.inc | 118 +++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 tcg/loongarch64/tcg-target.c.inc

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
new file mode 100644
index 0000000000..42eebef78e
--- /dev/null
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -0,0 +1,118 @@
+/*
+ * Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ *
+ * Based on tcg/riscv/tcg-target.c.inc
+ *
+ * Copyright (c) 2018 SiFive, Inc
+ * Copyright (c) 2008-2009 Arnaud Patard <arnaud.patard@rtp-net.org>
+ * Copyright (c) 2009 Aurelien Jarno <aurelien@aurel32.net>
+ * Copyright (c) 2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifdef CONFIG_DEBUG_TCG
+static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
+    "zero",
+    "ra",
+    "tp",
+    "sp",
+    "a0",
+    "a1",
+    "a2",
+    "a3",
+    "a4",
+    "a5",
+    "a6",
+    "a7",
+    "t0",
+    "t1",
+    "t2",
+    "t3",
+    "t4",
+    "t5",
+    "t6",
+    "t7",
+    "t8",
+    "r21", /* reserved in the LP64 ABI, hence no ABI name */
+    "s9",
+    "s0",
+    "s1",
+    "s2",
+    "s3",
+    "s4",
+    "s5",
+    "s6",
+    "s7",
+    "s8"
+};
+#endif
+
+static const int tcg_target_reg_alloc_order[] = {
+    /* Registers preserved across calls */
+    /* TCG_REG_S0 reserved for TCG_AREG0 */
+    TCG_REG_S1,
+    TCG_REG_S2,
+    TCG_REG_S3,
+    TCG_REG_S4,
+    TCG_REG_S5,
+    TCG_REG_S6,
+    TCG_REG_S7,
+    TCG_REG_S8,
+    TCG_REG_S9,
+
+    /* Registers (potentially) clobbered across calls */
+    TCG_REG_T0,
+    TCG_REG_T1,
+    TCG_REG_T2,
+    TCG_REG_T3,
+    TCG_REG_T4,
+    TCG_REG_T5,
+    TCG_REG_T6,
+    TCG_REG_T7,
+    TCG_REG_T8,
+
+    /* Argument registers, opposite order of allocation.  */
+    TCG_REG_A7,
+    TCG_REG_A6,
+    TCG_REG_A5,
+    TCG_REG_A4,
+    TCG_REG_A3,
+    TCG_REG_A2,
+    TCG_REG_A1,
+    TCG_REG_A0,
+};
+
+static const int tcg_target_call_iarg_regs[] = {
+    TCG_REG_A0,
+    TCG_REG_A1,
+    TCG_REG_A2,
+    TCG_REG_A3,
+    TCG_REG_A4,
+    TCG_REG_A5,
+    TCG_REG_A6,
+    TCG_REG_A7,
+};
+
+static const int tcg_target_call_oarg_regs[] = {
+    TCG_REG_A0,
+    TCG_REG_A1,
+};
-- 
2.34.0


