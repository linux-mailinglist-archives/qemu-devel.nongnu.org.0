Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053E512FEBE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 23:28:15 +0100 (CET)
Received: from localhost ([::1]:57420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inVQU-0001cm-3v
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 17:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1inVHr-0006z6-JX
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 17:19:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1inVHp-00087x-F6
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 17:19:19 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:53924 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1inVHp-00081m-1m
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 17:19:17 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 8EEA91A1FD7;
 Fri,  3 Jan 2020 23:18:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 694EB1A229B;
 Fri,  3 Jan 2020 23:18:10 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/12] linux-user: Add support for KCOV_INIT_TRACE ioctl
Date: Fri,  3 Jan 2020 23:18:02 +0100
Message-Id: <1578089882-3587-13-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578089882-3587-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1578089882-3587-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

KCOV_INIT_TRACE ioctl plays the role in kernel coverage tracing.
This ioctl's third argument is of type 'unsigned long', and the
implementation in QEMU is straightforward.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h       | 1 +
 linux-user/syscall_defs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 6be143a..e2ccd6f 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -547,4 +547,5 @@
 #ifdef CONFIG_KCOV
   IOCTL(KCOV_ENABLE, 0, TYPE_NULL)
   IOCTL(KCOV_DISABLE, 0, TYPE_NULL)
+  IOCTL(KCOV_INIT_TRACE, IOC_R, TYPE_ULONG)
 #endif
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index ab4414f..4d6599d 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2457,6 +2457,7 @@ struct target_mtpos {
 /* kcov ioctls */
 #define TARGET_KCOV_ENABLE     TARGET_IO('c', 100)
 #define TARGET_KCOV_DISABLE    TARGET_IO('c', 101)
+#define TARGET_KCOV_INIT_TRACE TARGET_IOR('c', 1, abi_ulong)
 
 struct target_sysinfo {
     abi_long uptime;                /* Seconds since boot */
-- 
2.7.4


