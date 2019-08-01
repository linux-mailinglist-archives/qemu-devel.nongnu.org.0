Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37E07DB67
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 14:26:32 +0200 (CEST)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htAAB-0006OZ-Qo
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 08:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45064)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA75-0001Ch-7Y
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:23:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA71-0002gE-Hz
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:23:18 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:49325 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htA6s-0002bD-2y
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:23:06 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B1E581A215B;
 Thu,  1 Aug 2019 14:23:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 98A281A20CF;
 Thu,  1 Aug 2019 14:23:00 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 14:21:09 +0200
Message-Id: <1564662076-17964-9-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 08/15] linux-user: Add support for
 HDIO_GET_ACOUSTIC and HDIO_SET_ACOUSTIC ioctls
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

Add support for HDIO_GET_ACOUSTIC and HDIO_SET_ACOUSTIC ioctls.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall_defs.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index b54a184..c9b82eb 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -436,6 +436,7 @@
   IOCTL(HDIO_GET_32BIT, IOC_R, MK_PTR(TYPE_INT))
   IOCTL(HDIO_GET_NICE, IOC_R, MK_PTR(TYPE_INT))
   IOCTL(HDIO_GET_WCACHE, IOC_R, MK_PTR(TYPE_INT))
+  IOCTL(HDIO_GET_ACOUSTIC, IOC_R, MK_PTR(TYPE_INT))
   IOCTL(HDIO_DRIVE_CMD, IOC_R, MK_PTR(TYPE_INT))
   IOCTL(HDIO_SET_UNMASKINTR, 0, TYPE_INT)
   IOCTL(HDIO_SET_MULTCOUNT, 0, TYPE_INT)
@@ -446,6 +447,7 @@
   IOCTL(HDIO_SET_PIO_MODE, 0, TYPE_INT)
   IOCTL(HDIO_SET_NICE, 0, TYPE_INT)
   IOCTL(HDIO_SET_WCACHE, 0, TYPE_INT)
+  IOCTL(HDIO_SET_ACOUSTIC, 0, TYPE_INT)
 
   IOCTL(VFAT_IOCTL_READDIR_BOTH, IOC_R, MK_PTR(MK_ARRAY(MK_STRUCT(STRUCT_dirent), 2)))
   IOCTL(VFAT_IOCTL_READDIR_SHORT, IOC_R, MK_PTR(MK_ARRAY(MK_STRUCT(STRUCT_dirent), 2)))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index fb42d32..b9d1242 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1067,6 +1067,7 @@ struct target_format_descr {
 #define TARGET_HDIO_GET_NICE          0x030c  /* get nice flags */
 #define TARGET_HDIO_GET_IDENTITY      0x030d  /* get IDE identification info */
 #define TARGET_HDIO_GET_WCACHE        0x030e  /* get write cache mode on|off */
+#define TARGET_HDIO_GET_ACOUSTIC      0x030f  /* get acoustic value */
 #define TARGET_HDIO_DRIVE_CMD         0x031f  /* execute a special drive command */
 
 /* hd/ide ctl's that pass (arg) non-ptr values are numbered 0x032n/0x033n */
@@ -1079,6 +1080,7 @@ struct target_format_descr {
 #define TARGET_HDIO_SET_PIO_MODE      0x0327  /* reconfig interface to new speed */
 #define TARGET_HDIO_SET_NICE          0x0329  /* set nice flags */
 #define TARGET_HDIO_SET_WCACHE        0x032b  /* change write cache mode */
+#define TARGET_HDIO_SET_ACOUSTIC      0x032c  /* change acoustic behavior */
 
 /* loop ioctls */
 #define TARGET_LOOP_SET_FD            0x4C00
-- 
2.7.4


