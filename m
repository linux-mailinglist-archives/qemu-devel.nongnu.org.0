Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4969113FC89
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 23:59:48 +0100 (CET)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isE79-0002mj-6o
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 17:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isDz1-0008OA-LG
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isDyz-0002hJ-8O
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:23 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:53723 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1isDyy-0002fe-Vu
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:21 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A4AB01A2196;
 Thu, 16 Jan 2020 23:50:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4827D1A21F9;
 Thu, 16 Jan 2020 23:50:13 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] linux-user: Add support for FDFMT<BEG|TRK|END> ioctls
Date: Thu, 16 Jan 2020 23:49:47 +0100
Message-Id: <1579214991-19602-9-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579214991-19602-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1579214991-19602-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

FDFMTBEG, FDFMTTRK, and FDFMTEND ioctls provide means for controlling
formatting of a floppy drive.

FDFMTTRK's third agrument is a pointer to the structure:

struct format_descr {
    unsigned int device,head,track;
};

defined in Linux kernel header <linux/fd.h>.

Since all fields of the structure are of type 'unsigned int', there is
no need to define "target_format_descr".

FDFMTBEG and FDFMTEND ioctls do not use the third argument.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h        | 3 +++
 linux-user/syscall_defs.h  | 3 +++
 linux-user/syscall_types.h | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 9e3ca90..e754a6b 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -115,6 +115,9 @@
      IOCTL(FDMSGON, 0, TYPE_NULL)
      IOCTL(FDMSGOFF, 0, TYPE_NULL)
      IOCTL(FDSETEMSGTRESH, 0, TYPE_NULL)
+     IOCTL(FDFMTBEG, 0, TYPE_NULL)
+     IOCTL(FDFMTTRK, IOC_W, MK_PTR(MK_STRUCT(STRUCT_format_descr)))
+     IOCTL(FDFMTEND, 0, TYPE_NULL)
      IOCTL(FDFLUSH, 0, TYPE_NULL)
      IOCTL(FDSETMAXERRS, IOC_W, MK_PTR(MK_STRUCT(STRUCT_floppy_max_errors)))
      IOCTL(FDGETMAXERRS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_floppy_max_errors)))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index e317115..9fbf04a 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -899,6 +899,9 @@ struct target_pollfd {
 
 #define TARGET_FDMSGON        TARGET_IO(2, 0x45)
 #define TARGET_FDMSGOFF       TARGET_IO(2, 0x46)
+#define TARGET_FDFMTBEG       TARGET_IO(2, 0x47)
+#define TARGET_FDFMTTRK      TARGET_IOW(2, 0x48, struct format_descr)
+#define TARGET_FDFMTEND       TARGET_IO(2, 0x49)
 #define TARGET_FDSETEMSGTRESH TARGET_IO(2, 0x4a)
 #define TARGET_FDFLUSH        TARGET_IO(2, 0x4b)
 #define TARGET_FDSETMAXERRS  TARGET_IOW(2, 0x4c, struct floppy_max_errors)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 434ce1c..ff60240 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -266,6 +266,11 @@ STRUCT(blkpg_ioctl_arg,
        TYPE_INT, /* datalen */
        TYPE_PTRVOID) /* data */
 
+STRUCT(format_descr,
+       TYPE_INT,     /* device */
+       TYPE_INT,     /* head */
+       TYPE_INT)     /* track */
+
 STRUCT(floppy_max_errors,
        TYPE_INT, /* abort */
        TYPE_INT, /* read_track */
-- 
2.7.4


