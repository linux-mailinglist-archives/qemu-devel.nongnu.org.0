Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8378C7A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 15:14:57 +0200 (CEST)
Received: from localhost ([::1]:52082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs5UO-0001KN-Ap
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 09:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40785)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hs5Qq-0003KY-4Y
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hs5Qp-0003O5-7L
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:11:16 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:49393 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hs5Qp-0001VT-16
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:11:15 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 335091A2150;
 Mon, 29 Jul 2019 15:10:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 198C51A20A2;
 Mon, 29 Jul 2019 15:10:12 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 15:09:46 +0200
Message-Id: <1564405791-9147-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564405791-9147-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564405791-9147-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.1 v2 2/7] linux-user: Add support for
 FDMSGON and FDMSGOFF ioctls
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

FDMSGON and FDMSGOFF switch informational messages of floppy drives
on and off.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall_defs.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index fb7b014..9978163 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -112,6 +112,8 @@
      IOCTL(BLKZEROOUT, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
 #endif
 
+     IOCTL(FDMSGON, 0, TYPE_NULL)
+     IOCTL(FDMSGOFF, 0, TYPE_NULL)
      IOCTL(FDFLUSH, 0, TYPE_NULL)
 
 #ifdef FIBMAP
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index fb30bce..cd97e9b 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -885,6 +885,8 @@ struct target_pollfd {
 
 /* From <linux/fd.h> */
 
+#define TARGET_FDMSGON        TARGET_IO(2, 0x45)
+#define TARGET_FDMSGOFF       TARGET_IO(2, 0x46)
 #define TARGET_FDFLUSH        TARGET_IO(2, 0x4b)
 
 #define TARGET_FIBMAP     TARGET_IO(0x00,1)  /* bmap access */
-- 
2.7.4


