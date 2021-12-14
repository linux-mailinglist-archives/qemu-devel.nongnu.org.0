Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6E5473E3F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 09:28:42 +0100 (CET)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx3Av-0007Qt-Ko
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 03:28:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2n2-0007Pc-Tf
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:04:00 -0500
Received: from mail.xen0n.name ([115.28.160.31]:48778
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2mz-0000Xq-Ua
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:04:00 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3974A606EB;
 Tue, 14 Dec 2021 16:03:40 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639469020; bh=m3Ltfi4U9a0aIpo4hwq2UcjhE8tC9FCFyHr+yLzaEXY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dWQr/o3e0NDEe1wGbcbtV3iWQxd90snkRtyjS4yNvNWUHYJgEavW9K0WrPyzLam8w
 2tpb82g49O4cd3K/gIDx4xc6or808OAbvxUYXxNxhl2PkcqoBqm9S6CGrgk2zU5ae7
 nloAQPuddVTVXR9+1wWfdExVWAic6pmBZkFkV4bQ=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 28/31] common-user: Add safe syscall handling for
 loongarch64 hosts
Date: Tue, 14 Dec 2021 16:01:51 +0800
Message-Id: <20211214080154.196350-29-git@xen0n.name>
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
 .../host/loongarch64/safe-syscall.inc.S       | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S

diff --git a/common-user/host/loongarch64/safe-syscall.inc.S b/common-user/host/loongarch64/safe-syscall.inc.S
new file mode 100644
index 0000000000..61dc6554eb
--- /dev/null
+++ b/common-user/host/loongarch64/safe-syscall.inc.S
@@ -0,0 +1,81 @@
+/*
+ * safe-syscall.inc.S : host-specific assembly fragment
+ * to handle signals occurring at the same time as system calls.
+ * This is intended to be included by common-user/safe-syscall.S
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
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, @function
+        .type   safe_syscall_start, @function
+        .type   safe_syscall_end, @function
+
+        /*
+         * This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         */
+safe_syscall_base:
+        .cfi_startproc
+        /*
+         * The syscall calling convention is nearly the same as C:
+         * we enter with a0 == &signal_pending
+         *               a1 == syscall number
+         *               a2 ... a7 == syscall arguments
+         *               and return the result in a0
+         * and the syscall instruction needs
+         *               a7 == syscall number
+         *               a0 ... a5 == syscall arguments
+         *               and returns the result in a0
+         * Shuffle everything around appropriately.
+         */
+        move    $t0, $a0        /* signal_pending pointer */
+        move    $t1, $a1        /* syscall number */
+        move    $a0, $a2        /* syscall arguments */
+        move    $a1, $a3
+        move    $a2, $a4
+        move    $a3, $a5
+        move    $a4, $a6
+        move    $a5, $a7
+        move    $a7, $t1
+
+        /*
+         * This next sequence of code works in conjunction with the
+         * rewind_if_safe_syscall_function(). If a signal is taken
+         * and the interrupted PC is anywhere between 'safe_syscall_start'
+         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+         * The code sequence must therefore be able to cope with this, and
+         * the syscall instruction must be the final one in the sequence.
+         */
+safe_syscall_start:
+        /* If signal_pending is non-zero, don't do the call */
+        ld.w    $t1, $t0, 0
+        bnez    $t1, 2f
+        syscall 0
+safe_syscall_end:
+        /* code path for having successfully executed the syscall */
+        li.w    $t2, -4096
+        bgtu    $a0, $t2, 0f
+        jr      $ra
+
+        /* code path setting errno */
+0:      sub.d   $a0, $zero, $a0
+        b       safe_syscall_set_errno_tail
+
+        /* code path when we didn't execute the syscall */
+2:      li.w    $a0, QEMU_ERESTARTSYS
+        b       safe_syscall_set_errno_tail
+        .cfi_endproc
+        .size   safe_syscall_base, .-safe_syscall_base
-- 
2.34.0


