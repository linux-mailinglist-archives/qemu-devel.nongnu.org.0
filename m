Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2844BB65
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 16:25:11 +0200 (CEST)
Received: from localhost ([::1]:38840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdbWO-0002Sn-Ep
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 10:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54970)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbPZ-0004sV-2r
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:18:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbPX-00019a-Re
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:18:05 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50596 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdbPX-0000qZ-Hu
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:18:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 328FB1A451C;
 Wed, 19 Jun 2019 16:17:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 1792D1A4515;
 Wed, 19 Jun 2019 16:17:49 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 16:17:13 +0200
Message-Id: <1560953834-29584-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560953834-29584-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1560953834-29584-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v12 4/5] linux-user: Add support for strace for
 statx() syscall
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
Cc: laurent@vivier.eu, amarkovic@wavecomp.com, Jim Wilson <jimw@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jim Wilson <jimw@sifive.com>

All of the flags need to be conditional as old systems don't have statx
support.  Otherwise it works the same as other stat family syscalls.
This requires the pending patch to add statx support.

Tested on Ubuntu 16.04 (no host statx) and Ubuntu 19.04 (with host statx)
using a riscv32-linux toolchain.

Signed-off-by: Jim Wilson <jimw@sifive.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 86 ++++++++++++++++++++++++++++++++++++++++++++++++++
 linux-user/strace.list |  3 ++
 2 files changed, 89 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 6f72a74..c80e93b 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -976,6 +976,76 @@ UNUSED static struct flags msg_flags[] = {
     FLAG_END,
 };
 
+UNUSED static struct flags statx_flags[] = {
+#ifdef AT_EMPTY_PATH
+    FLAG_GENERIC(AT_EMPTY_PATH),
+#endif
+#ifdef AT_NO_AUTOMOUNT
+    FLAG_GENERIC(AT_NO_AUTOMOUNT),
+#endif
+#ifdef AT_SYMLINK_NOFOLLOW
+    FLAG_GENERIC(AT_SYMLINK_NOFOLLOW),
+#endif
+#ifdef AT_STATX_SYNC_AS_STAT
+    FLAG_GENERIC(AT_STATX_SYNC_AS_STAT),
+#endif
+#ifdef AT_STATX_FORCE_SYNC
+    FLAG_GENERIC(AT_STATX_FORCE_SYNC),
+#endif
+#ifdef AT_STATX_DONT_SYNC
+    FLAG_GENERIC(AT_STATX_DONT_SYNC),
+#endif
+    FLAG_END,
+};
+
+UNUSED static struct flags statx_mask[] = {
+/* This must come first, because it includes everything.  */
+#ifdef STATX_ALL
+    FLAG_GENERIC(STATX_ALL),
+#endif
+/* This must come second; it includes everything except STATX_BTIME.  */
+#ifdef STATX_BASIC_STATS
+    FLAG_GENERIC(STATX_BASIC_STATS),
+#endif
+#ifdef STATX_TYPE
+    FLAG_GENERIC(STATX_TYPE),
+#endif
+#ifdef STATX_MODE
+    FLAG_GENERIC(STATX_MODE),
+#endif
+#ifdef STATX_NLINK
+    FLAG_GENERIC(STATX_NLINK),
+#endif
+#ifdef STATX_UID
+    FLAG_GENERIC(STATX_UID),
+#endif
+#ifdef STATX_GID
+    FLAG_GENERIC(STATX_GID),
+#endif
+#ifdef STATX_ATIME
+    FLAG_GENERIC(STATX_ATIME),
+#endif
+#ifdef STATX_MTIME
+    FLAG_GENERIC(STATX_MTIME),
+#endif
+#ifdef STATX_CTIME
+    FLAG_GENERIC(STATX_CTIME),
+#endif
+#ifdef STATX_INO
+    FLAG_GENERIC(STATX_INO),
+#endif
+#ifdef STATX_SIZE
+    FLAG_GENERIC(STATX_SIZE),
+#endif
+#ifdef STATX_BLOCKS
+    FLAG_GENERIC(STATX_BLOCKS),
+#endif
+#ifdef STATX_BTIME
+    FLAG_GENERIC(STATX_BTIME),
+#endif
+    FLAG_END,
+};
+
 /*
  * print_xxx utility functions.  These are used to print syscall
  * parameters in certain format.  All of these have parameter
@@ -2611,6 +2681,22 @@ print_tgkill(const struct syscallname *name,
 }
 #endif
 
+#ifdef TARGET_NR_statx
+static void
+print_statx(const struct syscallname *name,
+            abi_long arg0, abi_long arg1, abi_long arg2,
+            abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_at_dirfd(arg0, 0);
+    print_string(arg1, 0);
+    print_flags(statx_flags, arg2, 0);
+    print_flags(statx_mask, arg3, 0);
+    print_pointer(arg4, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 /*
  * An array of all of the syscalls we know about
  */
diff --git a/linux-user/strace.list b/linux-user/strace.list
index db21ce4..63a9466 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1650,3 +1650,6 @@
 #ifdef TARGET_NR_atomic_barrier
 { TARGET_NR_atomic_barrier, "atomic_barrier", NULL, NULL, NULL },
 #endif
+#ifdef TARGET_NR_statx
+{ TARGET_NR_statx, "statx", NULL, print_statx, NULL },
+#endif
-- 
2.7.4


