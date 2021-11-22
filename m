Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB8C458CF6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:07:37 +0100 (CET)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Ae-0008W9-8f
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:07:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6nM-000233-GY
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:33 -0500
Received: from mail.xen0n.name ([115.28.160.31]:40912
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6nH-0007jD-IK
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:30 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B0F4D60B05;
 Mon, 22 Nov 2021 18:42:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637577777; bh=Y3nJxiz3rtVGiB2s1Z3MmbsHG1ZNEXNrDVtvdvw1MQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cjuj9WJHTWEQqf0rmzKYo229LzvOjSOacUxmQSVOrZhGUuhM+rgNxiZUhsJ2eNWKl
 rFJSdUpCSt0jTiZkJXxHLAtkTGVKxjGdLvN5kQCGooKSFyeU0OSzR84fXhXqfAeXub
 n6V0rk912eKHIK1WipzFEyO9fRfqeouqWNPoVlRU=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 28/31] linux-user: Add safe syscall handling for
 loongarch64 hosts
Date: Mon, 22 Nov 2021 18:41:58 +0800
Message-Id: <20211122104201.112695-29-git@xen0n.name>
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
 linux-user/host/loongarch64/hostdep.h         | 34 ++++++++
 .../host/loongarch64/safe-syscall.inc.S       | 80 +++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 linux-user/host/loongarch64/hostdep.h
 create mode 100644 linux-user/host/loongarch64/safe-syscall.inc.S

diff --git a/linux-user/host/loongarch64/hostdep.h b/linux-user/host/loongarch64/hostdep.h
new file mode 100644
index 0000000000..e3d5fa703f
--- /dev/null
+++ b/linux-user/host/loongarch64/hostdep.h
@@ -0,0 +1,34 @@
+/*
+ * hostdep.h : things which are dependent on the host architecture
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef LOONGARCH64_HOSTDEP_H
+#define LOONGARCH64_HOSTDEP_H
+
+/* We have a safe-syscall.inc.S */
+#define HAVE_SAFE_SYSCALL
+
+#ifndef __ASSEMBLER__
+
+/* These are defined by the safe-syscall.inc.S file */
+extern char safe_syscall_start[];
+extern char safe_syscall_end[];
+
+/* Adjust the signal context to rewind out of safe-syscall if we're in it */
+static inline void rewind_if_in_safe_syscall(void *puc)
+{
+    ucontext_t *uc = puc;
+    unsigned long long *pcreg = &uc->uc_mcontext.__pc;
+
+    if (*pcreg > (uintptr_t)safe_syscall_start
+        && *pcreg < (uintptr_t)safe_syscall_end) {
+        *pcreg = (uintptr_t)safe_syscall_start;
+    }
+}
+
+#endif /* __ASSEMBLER__ */
+
+#endif
diff --git a/linux-user/host/loongarch64/safe-syscall.inc.S b/linux-user/host/loongarch64/safe-syscall.inc.S
new file mode 100644
index 0000000000..bb530248b3
--- /dev/null
+++ b/linux-user/host/loongarch64/safe-syscall.inc.S
@@ -0,0 +1,80 @@
+/*
+ * safe-syscall.inc.S : host-specific assembly fragment
+ * to handle signals occurring at the same time as system calls.
+ * This is intended to be included by linux-user/safe-syscall.S
+ *
+ * Ported to LoongArch by WANG Xuerui <git@xen0n.name>
+ *
+ * Based on safe-syscall.inc.S code for every other architecture,
+ * originally written by Richard Henderson <rth@twiddle.net>
+ * Copyright (C) 2018 Linaro, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+	.global safe_syscall_base
+	.global safe_syscall_start
+	.global safe_syscall_end
+	.type	safe_syscall_base, @function
+	.type	safe_syscall_start, @function
+	.type	safe_syscall_end, @function
+
+	/*
+	 * This is the entry point for making a system call. The calling
+	 * convention here is that of a C varargs function with the
+	 * first argument an 'int *' to the signal_pending flag, the
+	 * second one the system call number (as a 'long'), and all further
+	 * arguments being syscall arguments (also 'long').
+	 * We return a long which is the syscall's return value, which
+	 * may be negative-errno on failure. Conversion to the
+	 * -1-and-errno-set convention is done by the calling wrapper.
+	 */
+safe_syscall_base:
+	.cfi_startproc
+	/*
+	 * The syscall calling convention is nearly the same as C:
+	 * we enter with a0 == *signal_pending
+	 *               a1 == syscall number
+	 *               a2 ... a7 == syscall arguments
+	 *               and return the result in a0
+	 * and the syscall instruction needs
+	 *               a7 == syscall number
+	 *               a0 ... a5 == syscall arguments
+	 *               and returns the result in a0
+	 * Shuffle everything around appropriately.
+	 */
+	move	$t0, $a0	/* signal_pending pointer */
+	move	$t1, $a1	/* syscall number */
+	move	$a0, $a2	/* syscall arguments */
+	move	$a1, $a3
+	move	$a2, $a4
+	move	$a3, $a5
+	move	$a4, $a6
+	move	$a5, $a7
+	move	$a7, $t1
+
+	/*
+	 * This next sequence of code works in conjunction with the
+	 * rewind_if_safe_syscall_function(). If a signal is taken
+	 * and the interrupted PC is anywhere between 'safe_syscall_start'
+	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+	 * The code sequence must therefore be able to cope with this, and
+	 * the syscall instruction must be the final one in the sequence.
+	 */
+safe_syscall_start:
+	/* If signal_pending is non-zero, don't do the call */
+	ld.w	$t1, $t0, 0
+	bnez	$t1, 0f
+	syscall	0
+safe_syscall_end:
+	/* code path for having successfully executed the syscall */
+	jr	$ra
+
+0:
+	/* code path when we didn't execute the syscall */
+	li.w	$a0, -TARGET_ERESTARTSYS
+	jr	$ra
+	.cfi_endproc
+
+	.size	safe_syscall_base, .-safe_syscall_base
-- 
2.34.0


