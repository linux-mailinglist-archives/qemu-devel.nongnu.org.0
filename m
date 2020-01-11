Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB0013821F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jan 2020 16:52:03 +0100 (CET)
Received: from localhost ([::1]:58536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqJ3S-0006sz-9C
	for lists+qemu-devel@lfdr.de; Sat, 11 Jan 2020 10:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqIyP-0000jG-52
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqIyN-0001yW-UN
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:46:49 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:48737 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iqIyN-0001re-Io
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:46:47 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id E41E61A1FDA;
 Sat, 11 Jan 2020 16:46:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id CA9DF1A1187;
 Sat, 11 Jan 2020 16:46:44 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/19] linux-user: Add support for
 FD<SETEMSGTRESH|SETMAXERRS|GETMAXERRS> ioctls
Date: Sat, 11 Jan 2020 16:40:36 +0100
Message-Id: <1578757241-29583-15-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578757241-29583-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1578757241-29583-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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

FDSETEMSGTRESH's third agrument is a pointer to the structure:

struct floppy_max_errors {
    unsigned int
      abort,      /* number of errors to be reached before aborting */
      read_track, /* maximal number of errors permitted to read an
                   * entire track at once */
      reset,      /* maximal number of errors before a reset is tried */
      recal,      /* maximal number of errors before a recalibrate is
                   * tried */
      /*
       * Threshold for reporting FDC errors to the console.
       * Setting this to zero may flood your screen when using
       * ultra cheap floppies ;-)
       */
      reporting;
};

defined in Linux kernel header <linux/fd.h>.

Since all fields of the structure are of type 'unsigned int', there is
no need to define "target_floppy_max_errors".

FDSETMAXERRS and FDGETMAXERRS ioctls do not use the third argument.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h        | 3 +++
 linux-user/syscall_defs.h  | 3 +++
 linux-user/syscall_types.h | 7 +++++++
 3 files changed, 13 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 66f8c4e..9e3ca90 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -114,7 +114,10 @@
 
      IOCTL(FDMSGON, 0, TYPE_NULL)
      IOCTL(FDMSGOFF, 0, TYPE_NULL)
+     IOCTL(FDSETEMSGTRESH, 0, TYPE_NULL)
      IOCTL(FDFLUSH, 0, TYPE_NULL)
+     IOCTL(FDSETMAXERRS, IOC_W, MK_PTR(MK_STRUCT(STRUCT_floppy_max_errors)))
+     IOCTL(FDGETMAXERRS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_floppy_max_errors)))
      IOCTL(FDRESET, 0, TYPE_NULL)
      IOCTL(FDRAWCMD, 0, TYPE_NULL)
      IOCTL(FDTWADDLE, 0, TYPE_NULL)
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 6b88030..efe3860 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -899,7 +899,10 @@ struct target_pollfd {
 
 #define TARGET_FDMSGON        TARGET_IO(2, 0x45)
 #define TARGET_FDMSGOFF       TARGET_IO(2, 0x46)
+#define TARGET_FDSETEMSGTRESH TARGET_IO(2, 0x4a)
 #define TARGET_FDFLUSH        TARGET_IO(2, 0x4b)
+#define TARGET_FDSETMAXERRS  TARGET_IOW(2, 0x4c, struct floppy_max_errors)
+#define TARGET_FDGETMAXERRS  TARGET_IOR(2, 0x0e, struct floppy_max_errors)
 #define TARGET_FDRESET        TARGET_IO(2, 0x54)
 #define TARGET_FDRAWCMD       TARGET_IO(2, 0x58)
 #define TARGET_FDTWADDLE      TARGET_IO(2, 0x59)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 4e36983..e4e0429 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -261,6 +261,13 @@ STRUCT(blkpg_ioctl_arg,
        TYPE_INT, /* datalen */
        TYPE_PTRVOID) /* data */
 
+STRUCT(floppy_max_errors,
+       TYPE_INT, /* abort */
+       TYPE_INT, /* read_track */
+       TYPE_INT, /* reset */
+       TYPE_INT, /* recal */
+       TYPE_INT) /* reporting */
+
 #if defined(CONFIG_USBFS)
 /* usb device ioctls */
 STRUCT(usbdevfs_ctrltransfer,
-- 
2.7.4


