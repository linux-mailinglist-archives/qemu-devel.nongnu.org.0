Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDBF148B7F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 16:52:50 +0100 (CET)
Received: from localhost ([::1]:43902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv1GL-0003JX-UU
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 10:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iv1CM-0005Yn-70
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 10:48:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iv1CK-0006Mh-OI
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 10:48:41 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:43597 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iv1CK-0005xA-G9
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 10:48:40 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 49CE71A2006;
 Fri, 24 Jan 2020 16:47:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 0D3001A20B8;
 Fri, 24 Jan 2020 16:47:35 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] linux-user: Add support for FIFREEZE and FITHAW ioctls
Date: Fri, 24 Jan 2020 16:47:18 +0100
Message-Id: <1579880839-31466-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579880839-31466-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1579880839-31466-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
 linux-user/syscall_defs.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 944fbeb..adc07ad 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -152,6 +152,12 @@
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
index 8761841..ae4c048 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -950,7 +950,11 @@ struct target_rtc_pll_info {
 #define TARGET_FIBMAP     TARGET_IO(0x00,1)  /* bmap access */
 #define TARGET_FIGETBSZ   TARGET_IO(0x00,2)  /* get the block size used for bmap */
 
+#define TARGET_FIFREEZE   TARGET_IOWR('X', 119, int)    /* Freeze */
+#define TARGET_FITHAW     TARGET_IOWR('X', 120, int)    /* Thaw */
+#ifdef FITRIM
 #define TARGET_FITRIM     TARGET_IOWR('X', 121, struct fstrim_range)
+#endif
 #define TARGET_FICLONE    TARGET_IOW(0x94, 9, int)
 #define TARGET_FICLONERANGE TARGET_IOW(0x94, 13, struct file_clone_range)
 
-- 
2.7.4


