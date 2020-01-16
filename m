Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2590213FC76
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 23:55:39 +0100 (CET)
Received: from localhost ([::1]:49418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isE37-00053W-UM
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 17:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isDz1-0008O5-KT
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isDyz-0002hV-8q
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:22 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:53728 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1isDyy-0002fs-VY
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:21 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 867081A217B;
 Thu, 16 Jan 2020 23:50:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 3740C1A21DB;
 Thu, 16 Jan 2020 23:50:13 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/12] linux-user: Add support for FIFREEZE and FITHAW ioctls
Date: Thu, 16 Jan 2020 23:49:45 +0100
Message-Id: <1579214991-19602-7-git-send-email-aleksandar.markovic@rt-rk.com>
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

Both FIFREEZE and FITHAW ioctls accept an integer as their third
argument.

All ioctls in this group (FI* ioctl) are guarded with "#ifdef", so the
guards are used in this implementation too for consistency (however,
many of ioctls in FI* group became old enough that their #ifdef guards
could be removed, bit this is out of the scope of this patch).

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h       | 6 ++++++
 linux-user/syscall_defs.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index e4f0a04..66f8c4e 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -123,6 +123,12 @@
 #ifdef FIBMAP
      IOCTL(FIBMAP, IOC_W | IOC_R, MK_PTR(TYPE_LONG))
 #endif
+#ifdef FIFREEZE
+     IOCTL(FIFREEZE, IOC_W | IOC_R, TYPE_INT)
+#endif
+#ifdef FITHAW
+     IOCTL(FITHAW, IOC_W | IOC_R, TYPE_INT)
+#endif
 #ifdef FITRIM
      IOCTL(FITRIM, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_fstrim_range)))
 #endif
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 97ab3e1..d4d39de 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -908,6 +908,8 @@ struct target_pollfd {
 #define TARGET_FIBMAP     TARGET_IO(0x00,1)  /* bmap access */
 #define TARGET_FIGETBSZ   TARGET_IO(0x00,2)  /* get the block size used for bmap */
 
+#define TARGET_FIFREEZE   TARGET_IOWR('X', 119, int)    /* Freeze */
+#define TARGET_FITHAW     TARGET_IOWR('X', 120, int)    /* Thaw */
 #define TARGET_FITRIM     TARGET_IOWR('X', 121, struct fstrim_range)
 #define TARGET_FICLONE    TARGET_IOW(0x94, 9, int)
 #define TARGET_FICLONERANGE TARGET_IOW(0x94, 13, struct file_clone_range)
-- 
2.7.4


