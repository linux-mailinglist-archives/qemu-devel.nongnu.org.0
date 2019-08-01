Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135917DB5C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 14:25:08 +0200 (CEST)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htA8p-0002ny-9f
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 08:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA6j-00012g-4g
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:23:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA6i-0002Zf-44
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:57 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:43053 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htA6h-0001cd-SN
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:56 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 1E0131A20CF;
 Thu,  1 Aug 2019 14:21:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 00A741A1F9F;
 Thu,  1 Aug 2019 14:21:52 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 14:21:02 +0200
Message-Id: <1564662076-17964-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 01/15] linux user: Add support for
 FDFLUSH ioctl
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
Cc: Yunqiang Su <ysu@wavecomp.com>, laurent@vivier.eu, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yunqiang Su <ysu@wavecomp.com>

FDFLUSH is used for flushing buffers of floppy drives. Support in
QEMU is needed because some of Debian packages use this ioctl while
running post-build tests. One such example is 'tar' package.

Signed-off-by: Yunqiang Su <ysu@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall.c      | 1 +
 linux-user/syscall_defs.h | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 3281c97..fb7b014 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -112,6 +112,8 @@
      IOCTL(BLKZEROOUT, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
 #endif
 
+     IOCTL(FDFLUSH, 0, TYPE_NULL)
+
 #ifdef FIBMAP
      IOCTL(FIBMAP, IOC_W | IOC_R, MK_PTR(TYPE_LONG))
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8367cb1..ee80175 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -87,6 +87,7 @@
 #include <linux/kd.h>
 #include <linux/mtio.h>
 #include <linux/fs.h>
+#include <linux/fd.h>
 #if defined(CONFIG_FIEMAP)
 #include <linux/fiemap.h>
 #endif
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 0662270..fb30bce 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -883,6 +883,10 @@ struct target_pollfd {
 #define TARGET_BLKROTATIONAL TARGET_IO(0x12, 126)
 #define TARGET_BLKZEROOUT TARGET_IO(0x12, 127)
 
+/* From <linux/fd.h> */
+
+#define TARGET_FDFLUSH        TARGET_IO(2, 0x4b)
+
 #define TARGET_FIBMAP     TARGET_IO(0x00,1)  /* bmap access */
 #define TARGET_FIGETBSZ   TARGET_IO(0x00,2)  /* get the block size used for bmap */
 
-- 
2.7.4


