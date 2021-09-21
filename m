Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073C413BAD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:46:21 +0200 (CEST)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmei-0004g1-DV
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmFM-0005MY-L0
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:20:08 -0400
Received: from [115.28.160.31] (port=56038 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmFJ-0000fj-9n
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:20:08 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 70A076340D;
 Wed, 22 Sep 2021 04:19:29 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255569; bh=8E1dSeQfKtNvj4JBOEWU1+MP7Y2urtXi3sxcHU9lHGA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RcUIJ5qUbJr5FIy+VVKuvEpTbuRo6xO/9d3ACBqB6Ns/uWMRvyUXWKI1mGn4Kc+D3
 gpI5LEJIiQc0abp2wlzZyu+dbWRTg5tzNlc2aajEyrKSNj8mfvuifRLA71C6wstprj
 69ZJRV+hVVvSxCAk60oQww9pWdY7Fm5lYDR+YXfE=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/30] linux-user: Add safe syscall handling for
 loongarch64 hosts
Date: Wed, 22 Sep 2021 04:19:13 +0800
Message-Id: <20210921201915.601245-29-git@xen0n.name>
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
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
2.33.0


