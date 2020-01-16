Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62A13FC75
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 23:55:37 +0100 (CET)
Received: from localhost ([::1]:49416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isE36-0004zP-0j
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 17:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isDyz-0008Mi-BL
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isDyx-0002fU-Qv
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:21 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:52012 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1isDyw-00024u-EG
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 17:51:19 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B14F01A222F;
 Thu, 16 Jan 2020 23:50:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2702E1A21D6;
 Thu, 16 Jan 2020 23:50:13 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] linux-user: Add support for FITRIM ioctl
Date: Thu, 16 Jan 2020 23:49:44 +0100
Message-Id: <1579214991-19602-6-git-send-email-aleksandar.markovic@rt-rk.com>
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

FITRIM ioctl accepts a pointer to the structure

struct fstrim_range {
    __u64 start;
    __u64 len;
    __u64 minlen;
};

as its third argument.

All ioctls in this group (FI* ioctl) are guarded with "#ifdef", so the
guards are used in this implementation too for consistency (however,
many of ioctls in FI* group became old enough that their #ifdef guards
could be removed, bit this is out of the scope of this patch).

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h        | 3 +++
 linux-user/syscall_defs.h  | 1 +
 linux-user/syscall_types.h | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index e1b89a7..e4f0a04 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -123,6 +123,9 @@
 #ifdef FIBMAP
      IOCTL(FIBMAP, IOC_W | IOC_R, MK_PTR(TYPE_LONG))
 #endif
+#ifdef FITRIM
+     IOCTL(FITRIM, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_fstrim_range)))
+#endif
 #ifdef FICLONE
      IOCTL(FICLONE, IOC_W, TYPE_INT)
      IOCTL(FICLONERANGE, IOC_W, MK_PTR(MK_STRUCT(STRUCT_file_clone_range)))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index e1663b6..97ab3e1 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -908,6 +908,7 @@ struct target_pollfd {
 #define TARGET_FIBMAP     TARGET_IO(0x00,1)  /* bmap access */
 #define TARGET_FIGETBSZ   TARGET_IO(0x00,2)  /* get the block size used for bmap */
 
+#define TARGET_FITRIM     TARGET_IOWR('X', 121, struct fstrim_range)
 #define TARGET_FICLONE    TARGET_IOW(0x94, 9, int)
 #define TARGET_FICLONERANGE TARGET_IOW(0x94, 13, struct file_clone_range)
 
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 4e36983..ca9429e 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -226,6 +226,11 @@ STRUCT(dm_target_versions,
 STRUCT(dm_target_msg,
        TYPE_ULONGLONG) /* sector */
 
+STRUCT(fstrim_range,
+       TYPE_LONGLONG, /* start */
+       TYPE_LONGLONG, /* len */
+       TYPE_LONGLONG) /* minlen */
+
 STRUCT(file_clone_range,
        TYPE_LONGLONG, /* src_fd */
        TYPE_ULONGLONG, /* src_offset */
-- 
2.7.4


