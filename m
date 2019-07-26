Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB72976387
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 12:28:53 +0200 (CEST)
Received: from localhost ([::1]:38124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqxT2-0004hn-RZ
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 06:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34419)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hqxRs-0000Ep-Cd
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:27:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hqxRn-0005rJ-Mx
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:27:37 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:46873 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hqxRn-0005g2-Dz
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:27:35 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 1BBF01A21DE;
 Fri, 26 Jul 2019 12:26:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 96A801A2297;
 Fri, 26 Jul 2019 12:23:21 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 12:23:13 +0200
Message-Id: <1564136594-23628-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564136594-23628-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564136594-23628-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v2 5/6] linux-user: Add support for
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
 linux-user/syscall_defs.h  | 11 +++++++++++
 linux-user/syscall_types.h |  7 +++++++
 3 files changed, 20 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 0e15fe1..5a5dbdb 100644
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
index a8fc943..741c260 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -859,6 +859,14 @@ struct target_pollfd {
 
 /* From <linux/fd.h> */
 
+struct target_floppy_max_errors {
+    abi_uint        abort;
+    abi_uint        read_track;
+    abi_uint        reset;
+    abi_uint        recal;
+    abi_uint        reporting;
+};
+
 struct target_format_descr {
     abi_uint        device;
     abi_uint        head;
@@ -870,7 +878,10 @@ struct target_format_descr {
 #define TARGET_FDFMTBEG      TARGET_IO(2, 0x47)
 #define TARGET_FDFMTTRK     TARGET_IOW(2, 0x48, struct target_format_descr)
 #define TARGET_FDFMTEND      TARGET_IO(2, 0x49)
+#define TARGET_FDSETEMSGTRESH TARGET_IO(2, 0x4a)
 #define TARGET_FDFLUSH       TARGET_IO(2, 0x4b)
+#define TARGET_FDSETMAXERRS TARGET_IOW(2, 0x4c, struct target_floppy_max_errors)
+#define TARGET_FDGETMAXERRS TARGET_IOR(2, 0x0e, struct target_floppy_max_errors)
 #define TARGET_FDRESET       TARGET_IO(2, 0x54)
 #define TARGET_FDRAWCMD      TARGET_IO(2, 0x58)
 #define TARGET_FDTWADDLE     TARGET_IO(2, 0x59)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 57cd9e5..902ff34 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -267,6 +267,13 @@ STRUCT(blkpg_ioctl_arg,
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


