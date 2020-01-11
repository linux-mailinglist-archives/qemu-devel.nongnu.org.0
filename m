Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F3E138227
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jan 2020 16:54:52 +0100 (CET)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqJ6B-0002Oq-75
	for lists+qemu-devel@lfdr.de; Sat, 11 Jan 2020 10:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqJ1E-0004sA-Fp
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqJ1D-00067a-Ba
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:49:44 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:50530 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iqJ1D-00061Q-3i
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:49:43 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id F41AF1A1FDD;
 Sat, 11 Jan 2020 16:49:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id DDB401A1187;
 Sat, 11 Jan 2020 16:49:40 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/19] linux-user: Add support for KCOV_INIT_TRACE ioctl
Date: Sat, 11 Jan 2020 16:40:41 +0100
Message-Id: <1578757241-29583-20-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578757241-29583-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1578757241-29583-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
index 39b3825..1da71dd 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -556,4 +556,5 @@
 #ifdef CONFIG_KCOV
   IOCTL(KCOV_ENABLE, 0, TYPE_NULL)
   IOCTL(KCOV_DISABLE, 0, TYPE_NULL)
+  IOCTL(KCOV_INIT_TRACE, IOC_R, TYPE_ULONG)
 #endif
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 87e390d..209c138 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2460,6 +2460,7 @@ struct target_mtpos {
 /* kcov ioctls */
 #define TARGET_KCOV_ENABLE     TARGET_IO('c', 100)
 #define TARGET_KCOV_DISABLE    TARGET_IO('c', 101)
+#define TARGET_KCOV_INIT_TRACE TARGET_IOR('c', 1, abi_ulong)
 
 struct target_sysinfo {
     abi_long uptime;                /* Seconds since boot */
-- 
2.7.4


