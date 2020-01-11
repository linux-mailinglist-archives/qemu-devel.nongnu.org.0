Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6262E138229
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jan 2020 16:55:45 +0100 (CET)
Received: from localhost ([::1]:58566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqJ72-0003i5-1d
	for lists+qemu-devel@lfdr.de; Sat, 11 Jan 2020 10:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqIyR-0000mf-S1
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:46:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqIyQ-00026k-92
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:46:51 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:48749 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iqIyP-00022M-Qn
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:46:50 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A8CC21A1FDA;
 Sat, 11 Jan 2020 16:46:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 8F6491A1187;
 Sat, 11 Jan 2020 16:46:47 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/19] linux-user: Add support for FDGETFDCSTAT ioctl
Date: Sat, 11 Jan 2020 16:40:38 +0100
Message-Id: <1578757241-29583-17-git-send-email-aleksandar.markovic@rt-rk.com>
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

FDGETFDCSTAT's third agrument is a pointer to the structure:

struct floppy_fdc_state {
    int spec1;
    int spec2;
    int dtr;
    unsigned char version;
    unsigned char dor;
    unsigned long address;
    unsigned int rawcmd:2;
    unsigned int reset:1;
    unsigned int need_configure:1;
    unsigned int perp_mode:2;
    unsigned int has_fifo:1;
    unsigned int driver_version;
    unsigned char track[4];
};

defined in Linux kernel header <linux/fd.h>.

Since there is a fields of the structure of type 'unsigned long', there is
a need to define "target_format_descr". Also, five fields rawcmd, reset,
need_configure, perp_mode, and has_fifo are all just bitfields and are
part od a single 'unsigned int' field.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h        |  2 ++
 linux-user/syscall_defs.h  | 18 ++++++++++++++++++
 linux-user/syscall_types.h | 12 ++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index e754a6b..d72cd76 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -122,6 +122,8 @@
      IOCTL(FDSETMAXERRS, IOC_W, MK_PTR(MK_STRUCT(STRUCT_floppy_max_errors)))
      IOCTL(FDGETMAXERRS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_floppy_max_errors)))
      IOCTL(FDRESET, 0, TYPE_NULL)
+     IOCTL(FDGETFDCSTAT, IOC_R,
+           MK_PTR(MK_STRUCT(STRUCT_target_floppy_fdc_state)))
      IOCTL(FDRAWCMD, 0, TYPE_NULL)
      IOCTL(FDTWADDLE, 0, TYPE_NULL)
      IOCTL(FDEJECT, 0, TYPE_NULL)
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index d85ab46..225dcfb 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -897,6 +897,23 @@ struct target_pollfd {
 
 /* From <linux/fd.h> */
 
+struct target_floppy_fdc_state {
+    int spec1;      /* spec1 value last used */
+    int spec2;      /* spec2 value last used */
+    int dtr;
+    unsigned char version;  /* FDC version code */
+    unsigned char dor;
+    abi_long address;  /* io address */
+    unsigned int rawcmd:2;
+    unsigned int reset:1;
+    unsigned int need_configure:1;
+    unsigned int perp_mode:2;
+    unsigned int has_fifo:1;
+    unsigned int driver_version;    /* version code for floppy driver */
+    unsigned char track[4];
+};
+
+
 #define TARGET_FDMSGON        TARGET_IO(2, 0x45)
 #define TARGET_FDMSGOFF       TARGET_IO(2, 0x46)
 #define TARGET_FDFMTBEG       TARGET_IO(2, 0x47)
@@ -907,6 +924,7 @@ struct target_pollfd {
 #define TARGET_FDSETMAXERRS  TARGET_IOW(2, 0x4c, struct floppy_max_errors)
 #define TARGET_FDGETMAXERRS  TARGET_IOR(2, 0x0e, struct floppy_max_errors)
 #define TARGET_FDRESET        TARGET_IO(2, 0x54)
+#define TARGET_FDGETFDCSTAT  TARGET_IOR(2, 0x15, struct target_floppy_fdc_state)
 #define TARGET_FDRAWCMD       TARGET_IO(2, 0x58)
 #define TARGET_FDTWADDLE      TARGET_IO(2, 0x59)
 #define TARGET_FDEJECT        TARGET_IO(2, 0x5a)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 8ff78a6..a111c61 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -273,6 +273,18 @@ STRUCT(floppy_max_errors,
        TYPE_INT, /* recal */
        TYPE_INT) /* reporting */
 
+STRUCT(target_floppy_fdc_state,
+       TYPE_INT, /* spec1 */
+       TYPE_INT, /* spec2 */
+       TYPE_INT, /* dtr */
+       TYPE_CHAR, /* version */
+       TYPE_CHAR, /* dor */
+       TYPE_ULONG, /* address */
+       TYPE_INT, /* bit field for rawcmd:2, reset:1, need_configure:1, */
+                 /* perp_mode:2, and has_fifo:1 */
+       TYPE_INT, /* driver_version */
+       MK_ARRAY(TYPE_CHAR, 4)) /* track */
+
 #if defined(CONFIG_USBFS)
 /* usb device ioctls */
 STRUCT(usbdevfs_ctrltransfer,
-- 
2.7.4


