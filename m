Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE9876386
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 12:28:48 +0200 (CEST)
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqxSw-0003z6-GX
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 06:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34437)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hqxRt-0000Eu-RG
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hqxRq-00064b-QT
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:27:39 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:34552 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hqxRq-0001Vl-Io
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:27:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0F1D61A1186;
 Fri, 26 Jul 2019 12:26:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 8287F1A2292;
 Fri, 26 Jul 2019 12:23:21 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 12:23:11 +0200
Message-Id: <1564136594-23628-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564136594-23628-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564136594-23628-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v2 3/6] linux-user: Add support for
 FDRESET, FDRAWCMD, FDTWADDLE, and FDEJECT ioctls
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

FDRESET, FDRAWCMD, FDTWADDLE, and FDEJECT ioctls are misc commands
for controlling a floppy drive.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h       | 4 ++++
 linux-user/syscall_defs.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 7fac4fc..7c14b93 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -115,6 +115,10 @@
      IOCTL(FDMSGON, 0, TYPE_NULL)
      IOCTL(FDMSGOFF, 0, TYPE_NULL)
      IOCTL(FDFLUSH, 0, TYPE_NULL)
+     IOCTL(FDRESET, 0, TYPE_NULL)
+     IOCTL(FDRAWCMD, 0, TYPE_NULL)
+     IOCTL(FDTWADDLE, 0, TYPE_NULL)
+     IOCTL(FDEJECT, 0, TYPE_NULL)
 
 #ifdef FIBMAP
      IOCTL(FIBMAP, IOC_W | IOC_R, MK_PTR(TYPE_LONG))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 850e1ae..4b9f159 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -862,6 +862,10 @@ struct target_pollfd {
 #define TARGET_FDMSGON       TARGET_IO(2, 0x45)
 #define TARGET_FDMSGOFF      TARGET_IO(2, 0x46)
 #define TARGET_FDFLUSH       TARGET_IO(2, 0x4b)
+#define TARGET_FDRESET       TARGET_IO(2, 0x54)
+#define TARGET_FDRAWCMD      TARGET_IO(2, 0x58)
+#define TARGET_FDTWADDLE     TARGET_IO(2, 0x59)
+#define TARGET_FDEJECT       TARGET_IO(2, 0x5a)
 
 #define TARGET_FIBMAP     TARGET_IO(0x00,1)  /* bmap access */
 #define TARGET_FIGETBSZ   TARGET_IO(0x00,2)  /* get the block size used for bmap */
-- 
2.7.4


