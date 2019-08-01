Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC47DB7C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 14:29:35 +0200 (CEST)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htAD8-0002b1-J9
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 08:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44923)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA6a-0000ru-Ry
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA6Y-0002JJ-R4
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:48 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48399 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htA6Y-0002HW-JJ
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:46 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 9B4381A2258;
 Thu,  1 Aug 2019 14:22:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 745FE1A21E1;
 Thu,  1 Aug 2019 14:22:32 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 14:21:06 +0200
Message-Id: <1564662076-17964-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 05/15] linux-user: Add support for
 FDSETEMSGTRESH, FDSETMAXERRS, and FDGETMAXERRS ioctls
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
Cc: laurent@vivier.eu, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

FDSETEMSGTRESH, FDSETMAXERRS, and FDGETMAXERRS ioctls are commands
for controlling error reporting of a floppy drive.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h        |  2 ++
 linux-user/syscall_defs.h  | 19 +++++++++++++++++++
 linux-user/syscall_types.h |  7 +++++++
 3 files changed, 28 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index e393ad6..6551938 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -118,6 +118,8 @@
      IOCTL(FDFMTTRK, IOC_W, MK_PTR(MK_STRUCT(STRUCT_format_descr)))
      IOCTL(FDFMTEND, 0, TYPE_NULL)
      IOCTL(FDFLUSH, 0, TYPE_NULL)
+     IOCTL(FDSETMAXERRS, IOC_W, MK_PTR(MK_STRUCT(STRUCT_floppy_max_errors)))
+     IOCTL(FDGETMAXERRS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_floppy_max_errors)))
      IOCTL(FDRESET, 0, TYPE_NULL)
      IOCTL(FDRAWCMD, 0, TYPE_NULL)
      IOCTL(FDTWADDLE, 0, TYPE_NULL)
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 1ca115d..36256b0 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -885,12 +885,31 @@ struct target_pollfd {
 
 /* From <linux/fd.h> */
 
+struct target_floppy_max_errors {
+    abi_uint        abort;
+    abi_uint        read_track;
+    abi_uint        reset;
+    abi_uint        recal;
+    abi_uint        reporting;
+};
+
+struct target_format_descr {
+    abi_uint        device;
+    abi_uint        head;
+    abi_uint        track;
+};
+
 #define TARGET_FDMSGON        TARGET_IO(2, 0x45)
 #define TARGET_FDMSGOFF       TARGET_IO(2, 0x46)
 #define TARGET_FDFMTBEG       TARGET_IO(2, 0x47)
 #define TARGET_FDFMTTRK      TARGET_IOW(2, 0x48, struct target_format_descr)
 #define TARGET_FDFMTEND       TARGET_IO(2, 0x49)
+#define TARGET_FDSETEMSGTRESH TARGET_IO(2, 0x4a)
 #define TARGET_FDFLUSH        TARGET_IO(2, 0x4b)
+#define TARGET_FDSETMAXERRS  TARGET_IOW(2, 0x4c,                               \
+                                        struct target_floppy_max_errors)
+#define TARGET_FDGETMAXERRS  TARGET_IOR(2, 0x0e,                               \
+                                        struct target_floppy_max_errors)
 #define TARGET_FDRESET        TARGET_IO(2, 0x54)
 #define TARGET_FDRAWCMD       TARGET_IO(2, 0x58)
 #define TARGET_FDTWADDLE      TARGET_IO(2, 0x59)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index d82d1a5..5ba7c34 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -261,6 +261,13 @@ STRUCT(blkpg_ioctl_arg,
        TYPE_INT, /* datalen */
        TYPE_PTRVOID) /* data */
 
+STRUCT(floppy_max_errors,
+       TYPE_INT,     /* abort */
+       TYPE_INT,     /* read_track */
+       TYPE_INT,     /* reset */
+       TYPE_INT,     /* recal */
+       TYPE_INT)     /* reporting */
+
 STRUCT(format_descr,
        TYPE_INT,     /* device */
        TYPE_INT,     /* head */
-- 
2.7.4


