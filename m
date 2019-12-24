Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED3129D5E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Dec 2019 05:36:52 +0100 (CET)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijbwA-0007om-I7
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 23:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ijbuH-00068E-Pw
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 23:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ijbuG-0008Em-Oh
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 23:34:53 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:58899 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ijbuG-0008C6-Hy
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 23:34:52 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 97F461A115D;
 Tue, 24 Dec 2019 05:34:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 6005D1A1CFA;
 Tue, 24 Dec 2019 05:34:47 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] linux-user: Add support for FS_IOC_FS<GET|SET>XATTR
 ioctls
Date: Tue, 24 Dec 2019 05:34:38 +0100
Message-Id: <1577162078-29048-7-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577162078-29048-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1577162078-29048-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

These ioctls were relatively recently introduced, so the "#ifdef"
guards are used in this implementation.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h       | 7 +++++++
 linux-user/syscall_defs.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 3affd88..e1b89a7 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -144,6 +144,13 @@
      IOCTL(FS_IOC32_SETFLAGS, IOC_W, MK_PTR(TYPE_INT))
      IOCTL(FS_IOC32_GETVERSION, IOC_R, MK_PTR(TYPE_INT))
      IOCTL(FS_IOC32_SETVERSION, IOC_W, MK_PTR(TYPE_INT))
+#ifdef FS_IOC_FSGETXATTR
+     IOCTL(FS_IOC_FSGETXATTR, IOC_W, MK_PTR(MK_STRUCT(STRUCT_fsxattr)))
+#endif
+#ifdef FS_IOC_FSSETXATTR
+     IOCTL(FS_IOC_FSSETXATTR, IOC_W, MK_PTR(MK_STRUCT(STRUCT_fsxattr)))
+#endif
+
 
 #ifdef CONFIG_USBFS
   /* USB ioctls */
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a73cc3d..12cd3de 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -924,6 +924,8 @@ struct target_pollfd {
 #define TARGET_FS_IOC32_SETFLAGS TARGET_IOW('f', 2, int)
 #define TARGET_FS_IOC32_GETVERSION TARGET_IOR('v', 1, int)
 #define TARGET_FS_IOC32_SETVERSION TARGET_IOW('v', 2, int)
+#define TARGET_FS_IOC_FSGETXATTR TARGET_IOR('X', 31, struct file_clone_range)
+#define TARGET_FS_IOC_FSSETXATTR TARGET_IOR('X', 32, struct file_clone_range)
 
 /* usb ioctls */
 #define TARGET_USBDEVFS_CONTROL TARGET_IOWRU('U', 0)
-- 
2.7.4


