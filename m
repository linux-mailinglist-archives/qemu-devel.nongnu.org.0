Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC917DB5F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 14:25:34 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htA9F-000480-Rk
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 08:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44908)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA6Z-0000qP-Ue
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA6Y-0002JR-RK
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:47 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48398 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htA6Y-0002HX-Jp
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:46 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 4E0011A21E1;
 Thu,  1 Aug 2019 14:22:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 351B11A216C;
 Thu,  1 Aug 2019 14:22:38 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 14:21:07 +0200
Message-Id: <1564662076-17964-7-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 06/15] linux-user: Add support for
 HDIO_GET_NICE and HDIO_SET_NICE ioctls
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

Add support for HDIO_GET_NICE and HDIO_SET_NICE ioctls.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall_defs.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 6551938..895ba35 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -434,6 +434,7 @@
   IOCTL(HDIO_GET_NOWERR, IOC_R, MK_PTR(TYPE_INT))
   IOCTL(HDIO_GET_DMA, IOC_R, MK_PTR(TYPE_INT))
   IOCTL(HDIO_GET_32BIT, IOC_R, MK_PTR(TYPE_INT))
+  IOCTL(HDIO_GET_NICE, IOC_R, MK_PTR(TYPE_INT))
   IOCTL(HDIO_DRIVE_CMD, IOC_R, MK_PTR(TYPE_INT))
   IOCTL(HDIO_SET_UNMASKINTR, 0, TYPE_INT)
   IOCTL(HDIO_SET_MULTCOUNT, 0, TYPE_INT)
@@ -442,6 +443,7 @@
   IOCTL(HDIO_SET_DMA, 0, TYPE_INT)
   IOCTL(HDIO_SET_32BIT, 0, TYPE_INT)
   IOCTL(HDIO_SET_PIO_MODE, 0, TYPE_INT)
+  IOCTL(HDIO_SET_NICE, 0, TYPE_INT)
 
   IOCTL(VFAT_IOCTL_READDIR_BOTH, IOC_R, MK_PTR(MK_ARRAY(MK_STRUCT(STRUCT_dirent), 2)))
   IOCTL(VFAT_IOCTL_READDIR_SHORT, IOC_R, MK_PTR(MK_ARRAY(MK_STRUCT(STRUCT_dirent), 2)))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 36256b0..4e219a1 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1064,6 +1064,7 @@ struct target_format_descr {
 #define TARGET_HDIO_GET_32BIT         0x0309  /* get current io_32bit setting */
 #define TARGET_HDIO_GET_NOWERR        0x030a  /* get ignore-write-error flag */
 #define TARGET_HDIO_GET_DMA           0x030b  /* get use-dma flag */
+#define TARGET_HDIO_GET_NICE          0x030c  /* get nice flags */
 #define TARGET_HDIO_GET_IDENTITY      0x030d  /* get IDE identification info */
 #define TARGET_HDIO_DRIVE_CMD         0x031f  /* execute a special drive command */
 
@@ -1075,6 +1076,7 @@ struct target_format_descr {
 #define TARGET_HDIO_SET_NOWERR        0x0325  /* change ignore-write-error flag */
 #define TARGET_HDIO_SET_DMA           0x0326  /* change use-dma flag */
 #define TARGET_HDIO_SET_PIO_MODE      0x0327  /* reconfig interface to new speed */
+#define TARGET_HDIO_SET_NICE          0x0329  /* set nice flags */
 
 /* loop ioctls */
 #define TARGET_LOOP_SET_FD            0x4C00
-- 
2.7.4


