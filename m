Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E54129D5D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Dec 2019 05:36:49 +0100 (CET)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijbw8-0007oK-Md
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 23:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ijbuH-00067W-08
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 23:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ijbuF-0008CN-Oo
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 23:34:52 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:58368 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ijbuF-00086P-Gp
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 23:34:51 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 8798E1A1158;
 Tue, 24 Dec 2019 05:34:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4A0C61A1D39;
 Tue, 24 Dec 2019 05:34:47 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] linux-user: Add support for FS_IOC_<GET|SET>VERSION
 ioctls
Date: Tue, 24 Dec 2019 05:34:35 +0100
Message-Id: <1577162078-29048-4-git-send-email-aleksandar.markovic@rt-rk.com>
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

A very specific thing for these two ioctls is that their code
implies that their third argument is of type 'long', but the
kernel uses that argument as if it is of type 'int'. This anomaly
is recognized also in commit 6080723 (linux-user: Implement
FS_IOC_GETFLAGS and FS_IOC_SETFLAGS ioctls).

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall_defs.h | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index c6b9d6a..c44f42e 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -138,6 +138,8 @@
 
      IOCTL(FS_IOC_GETFLAGS, IOC_R, MK_PTR(TYPE_INT))
      IOCTL(FS_IOC_SETFLAGS, IOC_W, MK_PTR(TYPE_INT))
+     IOCTL(FS_IOC_GETVERSION, IOC_R, MK_PTR(TYPE_INT))
+     IOCTL(FS_IOC_SETVERSION, IOC_W, MK_PTR(TYPE_INT))
 
 #ifdef CONFIG_USBFS
   /* USB ioctls */
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 98c2119..f68a8b6 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -911,12 +911,14 @@ struct target_pollfd {
 #define TARGET_FICLONE    TARGET_IOW(0x94, 9, int)
 #define TARGET_FICLONERANGE TARGET_IOW(0x94, 13, struct file_clone_range)
 
-/* Note that the ioctl numbers claim type "long" but the actual type
- * used by the kernel is "int".
+/*
+ * Note that the ioctl numbers for FS_IOC_<GET|SET><FLAGS|VERSION>
+ * claim type "long" but the actual type used by the kernel is "int".
  */
 #define TARGET_FS_IOC_GETFLAGS TARGET_IOR('f', 1, abi_long)
 #define TARGET_FS_IOC_SETFLAGS TARGET_IOW('f', 2, abi_long)
-
+#define TARGET_FS_IOC_GETVERSION TARGET_IOR('v', 1, abi_long)
+#define TARGET_FS_IOC_SETVERSION TARGET_IOW('v', 2, abi_long)
 #define TARGET_FS_IOC_FIEMAP TARGET_IOWR('f',11,struct fiemap)
 
 /* usb ioctls */
-- 
2.7.4


