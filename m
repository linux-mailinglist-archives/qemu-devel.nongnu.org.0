Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F13441974
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:07:10 +0100 (CET)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUDe-0003Or-0p
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mhTzn-0005wK-AC
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51054 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mhTzl-0008EQ-2u
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:51 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2u3uH9hbKIjAA--.55994S31; 
 Mon, 01 Nov 2021 17:52:33 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 29/29] linux-user: Add safe syscall handling for
 loongarch64 hosts
Date: Mon,  1 Nov 2021 17:51:51 +0800
Message-Id: <1635760311-20015-30-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxn2u3uH9hbKIjAA--.55994S31
X-Coremail-Antispam: 1UD129KBjvJXoWxWr13CrWUGw13CFy3CFW3ZFb_yoWrCFWrpa
 s3Cw15Kr48GFn7Cr9rXw4UKFyfZr4fJF1Ykr4SvFZYyrZrJr9Yqr1qga4vyF13CrnFkFWj
 vF40y398uF4DWaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Base-on: <20210925173032.2434906-29-git@xen0n.name>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 linux-user/host/loongarch64/hostdep.h          | 23 ++++++++
 linux-user/host/loongarch64/safe-syscall.inc.S | 80 ++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 linux-user/host/loongarch64/safe-syscall.inc.S

diff --git a/linux-user/host/loongarch64/hostdep.h b/linux-user/host/loongarch64/hostdep.h
index 4e55695..e3d5fa7 100644
--- a/linux-user/host/loongarch64/hostdep.h
+++ b/linux-user/host/loongarch64/hostdep.h
@@ -8,4 +8,27 @@
 #ifndef LOONGARCH64_HOSTDEP_H
 #define LOONGARCH64_HOSTDEP_H
 
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
 #endif
diff --git a/linux-user/host/loongarch64/safe-syscall.inc.S b/linux-user/host/loongarch64/safe-syscall.inc.S
new file mode 100644
index 0000000..bb53024
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
1.8.3.1


