Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E3139AFF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 21:54:12 +0100 (CET)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir6gQ-0004vL-7Q
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 15:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6Tb-0005Lb-Iw
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:38:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6TU-0006hv-DW
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:38:19 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:47073 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ir6TU-0006gS-6h
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:38:12 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 13C131A1FB3;
 Mon, 13 Jan 2020 21:38:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id F17181A1F9E;
 Mon, 13 Jan 2020 21:38:09 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/20] linux-user: Add support for
 FS_IOC32_<GET|SET>VERSION ioctls
Date: Mon, 13 Jan 2020 21:34:34 +0100
Message-Id: <1578947683-21011-12-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

These FS_IOC32_<GET|SET>VERSION ioctls are identical to
FS_IOC_<GET|SET>VERSION ioctls, but without the anomaly of their
number defined as if their third argument is of type long, while
it is treated internally in kernel as is of type int.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall_defs.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 4fd6939..3affd88 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -142,6 +142,8 @@
      IOCTL(FS_IOC_SETVERSION, IOC_W, MK_PTR(TYPE_INT))
      IOCTL(FS_IOC32_GETFLAGS, IOC_R, MK_PTR(TYPE_INT))
      IOCTL(FS_IOC32_SETFLAGS, IOC_W, MK_PTR(TYPE_INT))
+     IOCTL(FS_IOC32_GETVERSION, IOC_R, MK_PTR(TYPE_INT))
+     IOCTL(FS_IOC32_SETVERSION, IOC_W, MK_PTR(TYPE_INT))
 
 #ifdef CONFIG_USBFS
   /* USB ioctls */
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 964b2b4..a73cc3d 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -922,6 +922,8 @@ struct target_pollfd {
 #define TARGET_FS_IOC_FIEMAP TARGET_IOWR('f',11,struct fiemap)
 #define TARGET_FS_IOC32_GETFLAGS TARGET_IOR('f', 1, int)
 #define TARGET_FS_IOC32_SETFLAGS TARGET_IOW('f', 2, int)
+#define TARGET_FS_IOC32_GETVERSION TARGET_IOR('v', 1, int)
+#define TARGET_FS_IOC32_SETVERSION TARGET_IOW('v', 2, int)
 
 /* usb ioctls */
 #define TARGET_USBDEVFS_CONTROL TARGET_IOWRU('U', 0)
-- 
2.7.4


