Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1A178C78
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 15:14:32 +0200 (CEST)
Received: from localhost ([::1]:52072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs5Tz-0008UI-Mu
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 09:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hs5Qu-0003Wu-8Y
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hs5Qt-0003VF-8O
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:11:20 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50065 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hs5Qt-0001cC-1z
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:11:19 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 611321A21BB;
 Mon, 29 Jul 2019 15:10:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4891F1A20A2;
 Mon, 29 Jul 2019 15:10:16 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 15:09:48 +0200
Message-Id: <1564405791-9147-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564405791-9147-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564405791-9147-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.1 v2 4/7] linux-user: Add support for
 FDFMTBEG, FDFMTTRK, and FDFMTEND ioctls
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

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h        | 3 +++
 linux-user/syscall_defs.h  | 3 +++
 linux-user/syscall_types.h | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index ab4ef2e..e393ad6 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -114,6 +114,9 @@
 
      IOCTL(FDMSGON, 0, TYPE_NULL)
      IOCTL(FDMSGOFF, 0, TYPE_NULL)
+     IOCTL(FDFMTBEG, 0, TYPE_NULL)
+     IOCTL(FDFMTTRK, IOC_W, MK_PTR(MK_STRUCT(STRUCT_format_descr)))
+     IOCTL(FDFMTEND, 0, TYPE_NULL)
      IOCTL(FDFLUSH, 0, TYPE_NULL)
      IOCTL(FDRESET, 0, TYPE_NULL)
      IOCTL(FDRAWCMD, 0, TYPE_NULL)
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 4185391..1ca115d 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -887,6 +887,9 @@ struct target_pollfd {
 
 #define TARGET_FDMSGON        TARGET_IO(2, 0x45)
 #define TARGET_FDMSGOFF       TARGET_IO(2, 0x46)
+#define TARGET_FDFMTBEG       TARGET_IO(2, 0x47)
+#define TARGET_FDFMTTRK      TARGET_IOW(2, 0x48, struct target_format_descr)
+#define TARGET_FDFMTEND       TARGET_IO(2, 0x49)
 #define TARGET_FDFLUSH        TARGET_IO(2, 0x4b)
 #define TARGET_FDRESET        TARGET_IO(2, 0x54)
 #define TARGET_FDRAWCMD       TARGET_IO(2, 0x58)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 4e36983..d82d1a5 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -261,6 +261,11 @@ STRUCT(blkpg_ioctl_arg,
        TYPE_INT, /* datalen */
        TYPE_PTRVOID) /* data */
 
+STRUCT(format_descr,
+       TYPE_INT,     /* device */
+       TYPE_INT,     /* head */
+       TYPE_INT)     /* track */
+
 #if defined(CONFIG_USBFS)
 /* usb device ioctls */
 STRUCT(usbdevfs_ctrltransfer,
-- 
2.7.4


