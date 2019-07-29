Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD5478C65
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 15:13:06 +0200 (CEST)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs5Sb-0005xG-MR
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 09:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hs5Ql-00036D-6h
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:11:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hs5Qk-0003H7-6T
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:11:11 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:51389 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hs5Qk-0003DW-0A
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:11:10 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 2338F1A21DC;
 Mon, 29 Jul 2019 15:10:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 09EEC1A20A2;
 Mon, 29 Jul 2019 15:10:18 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 15:09:50 +0200
Message-Id: <1564405791-9147-7-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564405791-9147-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564405791-9147-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.1 v2 6/7] linux-user: Add support for
 RNDRESEEDCRNG ioctl
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

RNDRESEEDCRNG is a newer ioctl (added in kernel 4.17), and an
"ifdef" guard is used for that reason in this patch.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ioctls.h       | 3 +++
 linux-user/syscall_defs.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 6551938..c1fcf7b 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -259,6 +259,9 @@
   IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))
   IOCTL(RNDZAPENTCNT, 0, TYPE_NULL)
   IOCTL(RNDCLEARPOOL, 0, TYPE_NULL)
+#ifdef RNDRESEEDCRNG
+  IOCTL(RNDRESEEDCRNG, 0, TYPE_NULL)
+#endif
 
   IOCTL(CDROMPAUSE, 0, TYPE_NULL)
   IOCTL(CDROMSTART, 0, TYPE_NULL)
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 36256b0..85b732b 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -850,6 +850,7 @@ struct target_pollfd {
 #define TARGET_RNDADDTOENTCNT  TARGET_IOW('R', 0x01, int)
 #define TARGET_RNDZAPENTCNT    TARGET_IO('R', 0x04)
 #define TARGET_RNDCLEARPOOL    TARGET_IO('R', 0x06)
+#define TARGET_RNDRESEEDCRNG   TARGET_IO('R', 0x07)
 
 /* From <linux/fs.h> */
 
-- 
2.7.4


