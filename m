Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB82DEB5B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 23:01:27 +0100 (CET)
Received: from localhost ([::1]:60368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqNoT-0006o6-09
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 17:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1kqMmT-0002BQ-Ts
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:55:17 -0500
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:43120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1kqMmK-00039M-Lt
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:55:17 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits)) (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 2F5407D82B
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:55:07 +0000 (UTC)
 (envelope-from imp@freebsd.org)
Received: from freefall.freebsd.org (freefall.freebsd.org [96.47.72.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "freefall.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4CyLj70fg7z3hGd;
 Fri, 18 Dec 2020 20:55:07 +0000 (UTC) (envelope-from imp@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1608324907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/r6chktgbIrDbSS7qyA38KN6tD1Mq1ME7ZKBN8UXsQ=;
 b=PZH3fzMxeK0CEPLTj8ujRWpJQS3GAbbxCOo9zy4Ype4qKZ96VS5oyhFG3sFEj8qtN3Uldo
 UZc2TfrmMcQAVdtsNpzuF7shFFSWmxOBOJxFF7P1rBqmBkvMfBspwF37Sglmzh7iXOsfh7
 C9BWoB1kNjo02hgZpWOvPUdGwQGaGv89p2xyRrBU2pxAQdl7QUFTiWw8M0XUTOymoNfFqg
 kmN/i31FAinUBeu2gdsBOEOrmn3HZnVusMsbUlPpMa39YDG1YOz1a3s8pBff/T6KwML1AV
 Ig68Dpm6xQvp352yzrEUxkVB7e6rtCSl0SC86uf2V1jwfCg56f4E6wHI3oFVuQ==
Received: by freefall.freebsd.org (Postfix, from userid 547)
 id 06DDFE7B6; Fri, 18 Dec 2020 20:55:07 +0000 (UTC)
From: imp@freebsd.org
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] bsd-user: move strace OS/arch dependent code to host/arch
 dirs
Date: Fri, 18 Dec 2020 13:54:50 -0700
Message-Id: <20201218205451.10559-4-imp@freebsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201218205451.10559-1-imp@freebsd.org>
References: <20201218205451.10559-1-imp@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1608324907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/r6chktgbIrDbSS7qyA38KN6tD1Mq1ME7ZKBN8UXsQ=;
 b=BUn9HiYio+j255g3J0c5W02Me+61rOJti8zO7DLe6g5KnUtk+ZqjF/633j6Wa/E9ev12HL
 dBLzTcmyDVAgR0yG3mAY+r8Z5N5aKU2qu5RS+KHFZWetUA8UwTbXf6iEzo33aI7rxjqEZq
 7PAzMUOrrXfza+XswM4S8/MdWC57wlRc+sGPwYHMV3wsqk+3hPsX6Mo+ygwNh6hfKzidd+
 J7mZwKQGrBUwlSnln6p0UvVPbsa373zSoWjSKpvYDhPTXGWnC9V9pcDx0dkSpjnceZ1Jsh
 YYnLxXt8sCii/XtL+z+cdmYlmoWRWS6iSW+mOzqUU9lk0i6TAoO7Ux3XBrHsMQ==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1608324907; a=rsa-sha256; cv=none;
 b=xHCaaeFSsaMCmUxVyVfzx7VlIv88LSto2wDbeeD2PRZ9s3elR2MEhyM9+V13EgIPGiPs5v
 LBxkyhqe1tfMzYbowBd1qKYXoqyo6CN/tH7b7HYfbAFaRh5bZrgkBSY7+tXsqLArI8yujh
 nln86XecUUf7hiMwZXLY3btdtiUxQgx6jYz0UU0Q1ZNleXkfp7ECQsmWDhEsVOrhZ4P5pD
 /IWc1bW7FdBQl7XKzteHutscP8sTPjlZt6hIFg9zsXsPMhQ5j9MyovXmK7LL0AgsPivyS7
 pHH0+GDurgHq9hWLRFgSgCiV9+i2NwptprKy9C4MCZqB3QBVi6D6D4iaKO+0xg==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=imp@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Dec 2020 16:50:11 -0500
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
Cc: Sean Bruno <sburno@FreeBSD.org>, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stacey Son <sson@FreeBSD.org>

This change moves host OS and arch dependent code for the sysarch
system call related to the -strace functionality into the
appropriate host OS and target arch directories.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Sean Bruno <sburno@FreeBSD.org>
[ imp integrated minor build fixes from sbruno ]
Signed-off-by: Warner Losh <imp@FreeBSD.org>
---
 bsd-user/arm/target_arch_sysarch.h     | 78 ++++++++++++++++++++++++++
 bsd-user/arm/target_syscall.h          | 36 ++++++++++++
 bsd-user/freebsd/os-strace.h           | 29 ++++++++++
 bsd-user/freebsd/strace.list           |  3 +-
 bsd-user/i386/target_arch_sysarch.h    | 77 +++++++++++++++++++++++++
 bsd-user/i386/target_syscall.h         | 19 +++++++
 bsd-user/mips/target_arch_sysarch.h    | 69 +++++++++++++++++++++++
 bsd-user/mips/target_syscall.h         | 52 +++++++++++++++++
 bsd-user/mips64/target_arch_sysarch.h  | 69 +++++++++++++++++++++++
 bsd-user/mips64/target_syscall.h       | 53 +++++++++++++++++
 bsd-user/netbsd/os-strace.h            |  1 +
 bsd-user/openbsd/os-strace.h           |  1 +
 bsd-user/sparc/target_arch_sysarch.h   | 52 +++++++++++++++++
 bsd-user/sparc/target_syscall.h        | 24 +++++++-
 bsd-user/sparc64/target_arch_sysarch.h | 52 +++++++++++++++++
 bsd-user/sparc64/target_syscall.h      | 24 +++++++-
 bsd-user/strace.c                      | 11 ++++
 bsd-user/x86_64/target_arch_sysarch.h  | 76 +++++++++++++++++++++++++
 bsd-user/x86_64/target_syscall.h       | 21 ++++++-
 meson.build                            |  1 +
 20 files changed, 744 insertions(+), 4 deletions(-)
 create mode 100644 bsd-user/arm/target_arch_sysarch.h
 create mode 100644 bsd-user/arm/target_syscall.h
 create mode 100644 bsd-user/freebsd/os-strace.h
 create mode 100644 bsd-user/i386/target_arch_sysarch.h
 create mode 100644 bsd-user/mips/target_arch_sysarch.h
 create mode 100644 bsd-user/mips/target_syscall.h
 create mode 100644 bsd-user/mips64/target_arch_sysarch.h
 create mode 100644 bsd-user/mips64/target_syscall.h
 create mode 100644 bsd-user/netbsd/os-strace.h
 create mode 100644 bsd-user/openbsd/os-strace.h
 create mode 100644 bsd-user/sparc/target_arch_sysarch.h
 create mode 100644 bsd-user/sparc64/target_arch_sysarch.h
 create mode 100644 bsd-user/x86_64/target_arch_sysarch.h

diff --git a/bsd-user/arm/target_arch_sysarch.h b/bsd-user/arm/target_arch_sysarch.h
new file mode 100644
index 0000000000..632a5cd453
--- /dev/null
+++ b/bsd-user/arm/target_arch_sysarch.h
@@ -0,0 +1,78 @@
+/*
+ *  arm sysarch() system call emulation
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef BSD_USER_ARCH_SYSARCH_H_
+#define BSD_USER_ARCH_SYSARCH_H_
+
+#include "target_syscall.h"
+#include "target_arch.h"
+
+static inline abi_long do_freebsd_arch_sysarch(CPUARMState *env, int op,
+        abi_ulong parms)
+{
+    int ret = 0;
+
+    switch (op) {
+    case TARGET_FREEBSD_ARM_SYNC_ICACHE:
+    case TARGET_FREEBSD_ARM_DRAIN_WRITEBUF:
+        break;
+
+    case TARGET_FREEBSD_ARM_SET_TP:
+        target_cpu_set_tls(env, parms);
+        break;
+
+    case TARGET_FREEBSD_ARM_GET_TP:
+        ret = target_cpu_get_tls(env);
+        break;
+
+    default:
+        ret = -TARGET_EINVAL;
+        break;
+    }
+    return ret;
+}
+
+static inline void do_freebsd_arch_print_sysarch(
+        const struct syscallname *name, abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+
+    switch (arg1) {
+    case TARGET_FREEBSD_ARM_SYNC_ICACHE:
+        gemu_log("%s(ARM_SYNC_ICACHE, ...)", name->name);
+        break;
+
+    case TARGET_FREEBSD_ARM_DRAIN_WRITEBUF:
+        gemu_log("%s(ARM_DRAIN_WRITEBUF, ...)", name->name);
+        break;
+
+    case TARGET_FREEBSD_ARM_SET_TP:
+        gemu_log("%s(ARM_SET_TP, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
+        break;
+
+    case TARGET_FREEBSD_ARM_GET_TP:
+        gemu_log("%s(ARM_GET_TP, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
+        break;
+
+    default:
+        gemu_log("UNKNOWN OP: %d, " TARGET_ABI_FMT_lx ")", (int)arg1, arg2);
+    }
+}
+
+#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/arm/target_syscall.h b/bsd-user/arm/target_syscall.h
new file mode 100644
index 0000000000..ef4b37f017
--- /dev/null
+++ b/bsd-user/arm/target_syscall.h
@@ -0,0 +1,36 @@
+#ifndef BSD_USER_ARCH_SYSCALL_H_
+#define BSD_USER_ARCH_SYSCALL_H_
+
+struct target_pt_regs {
+    abi_long uregs[17];
+};
+
+#define ARM_cpsr    uregs[16]
+#define ARM_pc      uregs[15]
+#define ARM_lr      uregs[14]
+#define ARM_sp      uregs[13]
+#define ARM_ip      uregs[12]
+#define ARM_fp      uregs[11]
+#define ARM_r10     uregs[10]
+#define ARM_r9      uregs[9]
+#define ARM_r8      uregs[8]
+#define ARM_r7      uregs[7]
+#define ARM_r6      uregs[6]
+#define ARM_r5      uregs[5]
+#define ARM_r4      uregs[4]
+#define ARM_r3      uregs[3]
+#define ARM_r2      uregs[2]
+#define ARM_r1      uregs[1]
+#define ARM_r0      uregs[0]
+
+#define ARM_SYSCALL_BASE    0 /* XXX: FreeBSD only */
+
+#define TARGET_FREEBSD_ARM_SYNC_ICACHE      0
+#define TARGET_FREEBSD_ARM_DRAIN_WRITEBUF   1
+#define TARGET_FREEBSD_ARM_SET_TP       2
+#define TARGET_FREEBSD_ARM_GET_TP       3
+
+#define TARGET_HW_MACHINE       "arm"
+#define TARGET_HW_MACHINE_ARCH  "armv6"
+
+#endif /* !BSD_USER_ARCH_SYSCALL_H_ */
diff --git a/bsd-user/freebsd/os-strace.h b/bsd-user/freebsd/os-strace.h
new file mode 100644
index 0000000000..a222f093b5
--- /dev/null
+++ b/bsd-user/freebsd/os-strace.h
@@ -0,0 +1,29 @@
+/*
+ *  FreeBSD dependent strace print functions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "target_arch_sysarch.h"    /* architecture dependent functions */
+
+
+static inline void do_os_print_sysarch(const struct syscallname *name,
+        abi_long arg1, abi_long arg2, abi_long arg3, abi_long arg4,
+        abi_long arg5, abi_long arg6)
+{
+    /* This is arch dependent */
+    do_freebsd_arch_print_sysarch(name, arg1, arg2, arg3, arg4, arg5, arg6);
+}
diff --git a/bsd-user/freebsd/strace.list b/bsd-user/freebsd/strace.list
index 2800a2d4eb..d8f2eb66a6 100644
--- a/bsd-user/freebsd/strace.list
+++ b/bsd-user/freebsd/strace.list
@@ -28,6 +28,7 @@
 { TARGET_FREEBSD_NR___acl_set_fd, "__acl_set_fd", "%s(%d, %d, %#x)", NULL, NULL },
 { TARGET_FREEBSD_NR___acl_set_file, "__acl_set_file", "%s(\"%s\", %d, %#x)", NULL, NULL },
 { TARGET_FREEBSD_NR___acl_set_link, "__acl_set_link", "%s(\"%s\", %d, %#x)", NULL, NULL },
+{ TARGET_FREEBSD_NR___getcwd, "__getcwd", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR___semctl, "__semctl", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR___syscall, "__syscall", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR___sysctl, "__sysctl", NULL, print_sysctl, NULL },
@@ -209,7 +210,7 @@
 { TARGET_FREEBSD_NR_statfs, "statfs", "%s(\"%s\",%p)", NULL, NULL },
 { TARGET_FREEBSD_NR_symlink, "symlink", "%s(\"%s\",\"%s\")", NULL, NULL },
 { TARGET_FREEBSD_NR_sync, "sync", NULL, NULL, NULL },
-{ TARGET_FREEBSD_NR_sysarch, "sysarch", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_sysarch, "sysarch", NULL, print_sysarch, NULL },
 { TARGET_FREEBSD_NR_syscall, "syscall", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_thr_create, "thr_create", "%s(%#x, %#x, %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_thr_exit, "thr_exit", "%s(%#x)", NULL, NULL },
diff --git a/bsd-user/i386/target_arch_sysarch.h b/bsd-user/i386/target_arch_sysarch.h
new file mode 100644
index 0000000000..e9ab98ec32
--- /dev/null
+++ b/bsd-user/i386/target_arch_sysarch.h
@@ -0,0 +1,77 @@
+/*
+ *  i386 sysarch system call emulation
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef BSD_USER_ARCH_SYSARCH_H_
+#define BSD_USER_ARCH_SYSARCH_H_
+
+#include "target_syscall.h"
+
+static inline abi_long do_freebsd_arch_sysarch(CPUX86State *env, int op,
+        abi_ulong parms)
+{
+    abi_long ret = 0;
+    abi_ulong val;
+    int idx;
+
+    switch (op) {
+    case TARGET_FREEBSD_I386_SET_GSBASE:
+    case TARGET_FREEBSD_I386_SET_FSBASE:
+        if (op == TARGET_FREEBSD_I386_SET_GSBASE) {
+            idx = R_GS;
+        } else {
+            idx = R_FS;
+        }
+        if (get_user(val, parms, abi_ulong)) {
+            return -TARGET_EFAULT;
+        }
+        cpu_x86_load_seg(env, idx, 0);
+        env->segs[idx].base = val;
+        break;
+
+    case TARGET_FREEBSD_I386_GET_GSBASE:
+    case TARGET_FREEBSD_I386_GET_FSBASE:
+        if (op == TARGET_FREEBSD_I386_GET_GSBASE) {
+            idx = R_GS;
+        } else {
+            idx = R_FS;
+        }
+        val = env->segs[idx].base;
+        if (put_user(val, parms, abi_ulong)) {
+            return -TARGET_EFAULT;
+        }
+        break;
+
+    /* XXX handle the others... */
+    default:
+        ret = -TARGET_EINVAL;
+        break;
+    }
+    return ret;
+}
+
+static inline void do_freebsd_arch_print_sysarch(
+        const struct syscallname *name, abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+
+    gemu_log("%s(%d, " TARGET_ABI_FMT_lx ", " TARGET_ABI_FMT_lx ", "
+        TARGET_ABI_FMT_lx ")", name->name, (int)arg1, arg2, arg3, arg4);
+}
+
+#endif /* !BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/i386/target_syscall.h b/bsd-user/i386/target_syscall.h
index 8f201386af..940c687a52 100644
--- a/bsd-user/i386/target_syscall.h
+++ b/bsd-user/i386/target_syscall.h
@@ -1,3 +1,20 @@
+/*
+ *  i386 system call definitions
+ *
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
 #ifndef TARGET_SYSCALL_H
 #define TARGET_SYSCALL_H
 
@@ -161,5 +178,7 @@ struct target_vm86plus_struct {
 
 
 #define UNAME_MACHINE "i386"
+#define TARGET_HW_MACHINE UNAME_MACHINE
+#define TARGET_HW_MACHINE_ARCH UNAME_MACHINE
 
 #endif /* TARGET_SYSCALL_H */
diff --git a/bsd-user/mips/target_arch_sysarch.h b/bsd-user/mips/target_arch_sysarch.h
new file mode 100644
index 0000000000..6da803a408
--- /dev/null
+++ b/bsd-user/mips/target_arch_sysarch.h
@@ -0,0 +1,69 @@
+/*
+ *  mips sysarch() system call emulation
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef BSD_USER_ARCH_SYSARCH_H_
+#define BSD_USER_ARCH_SYSARCH_H_
+
+#include "target_syscall.h"
+#include "target_arch.h"
+
+static inline abi_long do_freebsd_arch_sysarch(CPUMIPSState *env, int op,
+        abi_ulong parms)
+{
+    int ret = 0;
+
+    switch (op) {
+    case TARGET_MIPS_SET_TLS:
+        target_cpu_set_tls(env, parms);
+        break;
+
+    case TARGET_MIPS_GET_TLS:
+        if (put_user(target_cpu_get_tls(env), parms, abi_ulong)) {
+            ret = -TARGET_EFAULT;
+        }
+        break;
+
+    default:
+        ret = -TARGET_EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+static inline void do_freebsd_arch_print_sysarch(
+        const struct syscallname *name, abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+
+    switch (arg1) {
+    case TARGET_MIPS_SET_TLS:
+        gemu_log("%s(SET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
+        break;
+
+    case TARGET_MIPS_GET_TLS:
+        gemu_log("%s(GET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
+        break;
+
+    default:
+        gemu_log("UNKNOWN OP: %d, " TARGET_ABI_FMT_lx ")", (int)arg1, arg2);
+    }
+}
+
+#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/mips/target_syscall.h b/bsd-user/mips/target_syscall.h
new file mode 100644
index 0000000000..aacc6ddf9f
--- /dev/null
+++ b/bsd-user/mips/target_syscall.h
@@ -0,0 +1,52 @@
+/*
+ *  mips system call definitions
+ *
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _MIPS_SYSCALL_H_
+#define _MIPS_SYSCALL_H_
+
+/*
+ * struct target_pt_regs defines the way the registers are stored on the stack
+ * during a system call.
+ */
+
+struct target_pt_regs {
+    /* Saved main processor registers. */
+    abi_ulong regs[32];
+
+    /* Saved special registers. */
+    abi_ulong cp0_status;
+    abi_ulong lo;
+    abi_ulong hi;
+    abi_ulong cp0_badvaddr;
+    abi_ulong cp0_cause;
+    abi_ulong cp0_epc;
+};
+
+#if defined(TARGET_WORDS_BIGENDIAN)
+#define UNAME_MACHINE "mips"
+#else
+#define UNAME_MACHINE "mipsel"
+#endif
+
+#define TARGET_HW_MACHINE       "mips"
+#define TARGET_HW_MACHINE_ARCH   UNAME_MACHINE
+
+/* sysarch() commands */
+#define TARGET_MIPS_SET_TLS     1
+#define TARGET_MIPS_GET_TLS     2
+
+#endif /* !_MIPS_SYSCALL_H_ */
diff --git a/bsd-user/mips64/target_arch_sysarch.h b/bsd-user/mips64/target_arch_sysarch.h
new file mode 100644
index 0000000000..e6f9c00d5f
--- /dev/null
+++ b/bsd-user/mips64/target_arch_sysarch.h
@@ -0,0 +1,69 @@
+/*
+ *  mips64 sysarch() system call emulation
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef BSD_USER_ARCH_SYSARCH_H_
+#define BSD_USER_ARCH_SYSARCH_H_
+
+#include "target_syscall.h"
+#include "target_arch.h"
+
+static inline abi_long do_freebsd_arch_sysarch(CPUMIPSState *env, int op,
+        abi_ulong parms)
+{
+    int ret = 0;
+
+    switch (op) {
+    case TARGET_MIPS_SET_TLS:
+        target_cpu_set_tls(env, parms);
+        break;
+
+    case TARGET_MIPS_GET_TLS:
+        if (put_user(target_cpu_get_tls(env), parms, abi_ulong)) {
+            ret = -TARGET_EFAULT;
+        }
+        break;
+
+    default:
+        ret = -TARGET_EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+static inline void do_freebsd_arch_print_sysarch(
+        const struct syscallname *name, abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+
+    switch (arg1) {
+    case TARGET_MIPS_SET_TLS:
+        gemu_log("%s(SET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
+        break;
+
+    case TARGET_MIPS_GET_TLS:
+        gemu_log("%s(GET_TLS, 0x" TARGET_ABI_FMT_lx ")", name->name, arg2);
+        break;
+
+    default:
+        gemu_log("UNKNOWN OP: %d, " TARGET_ABI_FMT_lx ")", (int)arg1, arg2);
+    }
+}
+
+#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/mips64/target_syscall.h b/bsd-user/mips64/target_syscall.h
new file mode 100644
index 0000000000..bf4c598b13
--- /dev/null
+++ b/bsd-user/mips64/target_syscall.h
@@ -0,0 +1,53 @@
+/*
+ *  mips64 system call definitions
+ *
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _MIPS64_SYSCALL_H_
+#define _MIPS64_SYSCALL_H_
+
+/*
+ * struct target_pt_regs defines the way the registers are stored on the stack
+ * during a system call.
+ */
+
+struct target_pt_regs {
+    /* Saved main processor registers. */
+    abi_ulong regs[32];
+
+    /* Saved special registers. */
+    abi_ulong cp0_status;
+    abi_ulong lo;
+    abi_ulong hi;
+    abi_ulong cp0_badvaddr;
+    abi_ulong cp0_cause;
+    abi_ulong cp0_epc;
+};
+
+
+#if defined(TARGET_WORDS_BIGENDIAN)
+#define UNAME_MACHINE "mips64"
+#else
+#define UNAME_MACHINE "mips64el"
+#endif
+
+#define TARGET_HW_MACHINE       "mips"
+#define TARGET_HW_MACHINE_ARCH  UNAME_MACHINE
+
+/* sysarch() commands */
+#define TARGET_MIPS_SET_TLS     1
+#define TARGET_MIPS_GET_TLS     2
+
+#endif /* !_MIPS64_SYSCALL_H_ */
diff --git a/bsd-user/netbsd/os-strace.h b/bsd-user/netbsd/os-strace.h
new file mode 100644
index 0000000000..70cf51d63a
--- /dev/null
+++ b/bsd-user/netbsd/os-strace.h
@@ -0,0 +1 @@
+/* XXX NetBSD dependent strace print functions */
diff --git a/bsd-user/openbsd/os-strace.h b/bsd-user/openbsd/os-strace.h
new file mode 100644
index 0000000000..9161390433
--- /dev/null
+++ b/bsd-user/openbsd/os-strace.h
@@ -0,0 +1 @@
+/* XXX OpenBSD dependent strace print functions */
diff --git a/bsd-user/sparc/target_arch_sysarch.h b/bsd-user/sparc/target_arch_sysarch.h
new file mode 100644
index 0000000000..d0b85ef6bb
--- /dev/null
+++ b/bsd-user/sparc/target_arch_sysarch.h
@@ -0,0 +1,52 @@
+/*
+ *  SPARC sysarch() system call emulation
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef BSD_USER_ARCH_SYSARCH_H_
+#define BSD_USER_ARCH_SYSARCH_H_
+
+#include "target_syscall.h"
+
+static inline abi_long do_freebsd_arch_sysarch(void *env, int op,
+        abi_ulong parms)
+{
+    int ret = 0;
+
+    switch (op) {
+    case TARGET_SPARC_SIGTRAMP_INSTALL:
+        /* XXX not currently handled */
+    case TARGET_SPARC_UTRAP_INSTALL:
+        /* XXX not currently handled */
+    default:
+        ret = -TARGET_EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+static inline void do_freebsd_arch_print_sysarch(
+        const struct syscallname *name, abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+
+    gemu_log("%s(%d, " TARGET_ABI_FMT_lx ", " TARGET_ABI_FMT_lx ", "
+        TARGET_ABI_FMT_lx ")", name->name, (int)arg1, arg2, arg3, arg4);
+}
+
+#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/sparc/target_syscall.h b/bsd-user/sparc/target_syscall.h
index dfdf9f82f5..151284754b 100644
--- a/bsd-user/sparc/target_syscall.h
+++ b/bsd-user/sparc/target_syscall.h
@@ -1,3 +1,20 @@
+/*
+ *  sparc dependent system call definitions
+ *
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
 #ifndef TARGET_SYSCALL_H
 #define TARGET_SYSCALL_H
 
@@ -9,6 +26,11 @@ struct target_pt_regs {
 	abi_ulong u_regs[16];
 };
 
-#define UNAME_MACHINE "sun4"
+#define UNAME_MACHINE           "sun4"
+#define TARGET_HW_MACHINE       "sparc"
+#define TARGET_HW_MACHINE_ARCH  "sparc"
+
+#define TARGET_SPARC_UTRAP_INSTALL      1
+#define TARGET_SPARC_SIGTRAMP_INSTALL   2
 
 #endif /* TARGET_SYSCALL_H */
diff --git a/bsd-user/sparc64/target_arch_sysarch.h b/bsd-user/sparc64/target_arch_sysarch.h
new file mode 100644
index 0000000000..e6f17c1504
--- /dev/null
+++ b/bsd-user/sparc64/target_arch_sysarch.h
@@ -0,0 +1,52 @@
+/*
+ *  SPARC64 sysarch() system call emulation
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef BSD_USER_ARCH_SYSARCH_H_
+#define BSD_USER_ARCH_SYSARCH_H_
+
+#include "target_syscall.h"
+
+static inline abi_long do_freebsd_arch_sysarch(void *env, int op,
+        abi_ulong parms)
+{
+    int ret = 0;
+
+    switch (op) {
+    case TARGET_SPARC_SIGTRAMP_INSTALL:
+        /* XXX not currently handled */
+    case TARGET_SPARC_UTRAP_INSTALL:
+        /* XXX not currently handled */
+    default:
+        ret = -TARGET_EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+static inline void do_freebsd_arch_print_sysarch(
+        const struct syscallname *name, abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+
+    gemu_log("%s(%d, " TARGET_ABI_FMT_lx ", " TARGET_ABI_FMT_lx ", "
+        TARGET_ABI_FMT_lx ")", name->name, (int)arg1, arg2, arg3, arg4);
+}
+
+#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/sparc64/target_syscall.h b/bsd-user/sparc64/target_syscall.h
index 3a9f4c2ef9..b7d986a76d 100644
--- a/bsd-user/sparc64/target_syscall.h
+++ b/bsd-user/sparc64/target_syscall.h
@@ -1,3 +1,20 @@
+/*
+ *  sparc64 dependent system call definitions
+ *
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
 #ifndef TARGET_SYSCALL_H
 #define TARGET_SYSCALL_H
 
@@ -10,6 +27,11 @@ struct target_pt_regs {
 	abi_ulong fprs;
 };
 
-#define UNAME_MACHINE "sun4u"
+#define UNAME_MACHINE           "sun4u"
+#define TARGET_HW_MACHINE       "sparc"
+#define TARGET_HW_MACHINE_ARCH  "sparc64"
+
+#define TARGET_SPARC_UTRAP_INSTALL      1
+#define TARGET_SPARC_SIGTRAMP_INSTALL   2
 
 #endif /* TARGET_SYSCALL_H */
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index fa66fe1ee2..2c3b59caf0 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -20,9 +20,12 @@
 #include <sys/select.h>
 #include <sys/syscall.h>
 #include <sys/ioccom.h>
+#include <ctype.h>
 
 #include "qemu.h"
 
+#include "os-strace.h"  /* OS dependent strace print functions */
+
 int do_strace;
 
 /*
@@ -104,6 +107,14 @@ static void print_ioctl(const struct syscallname *name,
             arg3);
 }
 
+static void print_sysarch(const struct syscallname *name, abi_long arg1,
+        abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
+        abi_long arg6)
+{
+    /* This is os dependent. */
+    do_os_print_sysarch(name, arg1, arg2, arg3, arg4, arg5, arg6);
+}
+
 /*
  * Variants for the return value output function
  */
diff --git a/bsd-user/x86_64/target_arch_sysarch.h b/bsd-user/x86_64/target_arch_sysarch.h
new file mode 100644
index 0000000000..5c36fc0752
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_sysarch.h
@@ -0,0 +1,76 @@
+/*
+ *  x86_64 sysarch() syscall emulation
+ *
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef BSD_USER_ARCH_SYSARCH_H_
+#define BSD_USER_ARCH_SYSARCH_H_
+
+#include "target_syscall.h"
+
+static inline abi_long do_freebsd_arch_sysarch(CPUX86State *env, int op,
+        abi_ulong parms)
+{
+    abi_long ret = 0;
+    abi_ulong val;
+    int idx;
+
+    switch (op) {
+    case TARGET_FREEBSD_AMD64_SET_GSBASE:
+    case TARGET_FREEBSD_AMD64_SET_FSBASE:
+        if (op == TARGET_FREEBSD_AMD64_SET_GSBASE) {
+            idx = R_GS;
+        } else {
+            idx = R_FS;
+        }
+        if (get_user(val, parms, abi_ulong)) {
+            return -TARGET_EFAULT;
+        }
+        cpu_x86_load_seg(env, idx, 0);
+        env->segs[idx].base = val;
+        break;
+
+    case TARGET_FREEBSD_AMD64_GET_GSBASE:
+    case TARGET_FREEBSD_AMD64_GET_FSBASE:
+        if (op == TARGET_FREEBSD_AMD64_GET_GSBASE) {
+            idx = R_GS;
+        } else {
+            idx = R_FS;
+        }
+        val = env->segs[idx].base;
+        if (put_user(val, parms, abi_ulong)) {
+            return -TARGET_EFAULT;
+        }
+        break;
+
+    /* XXX handle the others... */
+    default:
+        ret = -TARGET_EINVAL;
+        break;
+    }
+    return ret;
+}
+
+static inline void do_freebsd_arch_print_sysarch(
+        const struct syscallname *name, abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+
+    gemu_log("%s(%d, " TARGET_ABI_FMT_lx ", " TARGET_ABI_FMT_lx ", "
+        TARGET_ABI_FMT_lx ")", name->name, (int)arg1, arg2, arg3, arg4);
+}
+
+#endif /*! BSD_USER_ARCH_SYSARCH_H_ */
diff --git a/bsd-user/x86_64/target_syscall.h b/bsd-user/x86_64/target_syscall.h
index a5d779884f..a8e6274b76 100644
--- a/bsd-user/x86_64/target_syscall.h
+++ b/bsd-user/x86_64/target_syscall.h
@@ -1,3 +1,20 @@
+/*
+ *  x86_64 system call definitions
+ *
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
 #ifndef TARGET_SYSCALL_H
 #define TARGET_SYSCALL_H
 
@@ -111,7 +128,9 @@ struct target_msqid64_ds {
 #define TARGET_FREEBSD_AMD64_SET_GSBASE	131
 
 
-#define UNAME_MACHINE "x86_64"
+#define UNAME_MACHINE           "x86_64"
+#define TARGET_HW_MACHINE       "amd64"
+#define TARGET_HW_MACHINE_ARCH  "amd64"
 
 #define TARGET_ARCH_SET_GS 0x1001
 #define TARGET_ARCH_SET_FS 0x1002
diff --git a/meson.build b/meson.build
index 372576f82c..55a73a0895 100644
--- a/meson.build
+++ b/meson.build
@@ -1800,6 +1800,7 @@ foreach target : target_dirs
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
     else
       base_dir = 'bsd-user'
+      target_inc += include_directories('bsd-user/freebsd')
     endif
     target_inc += include_directories(
       base_dir,
-- 
2.22.1


