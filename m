Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024104BB5E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 16:24:08 +0200 (CEST)
Received: from localhost ([::1]:38824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdbVP-0000BC-5r
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 10:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54968)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbPY-0004rr-Sl
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:18:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbPX-000195-P1
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:18:04 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50672 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdbPX-0000rn-IA
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:18:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 96D541A2255;
 Wed, 19 Jun 2019 16:17:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 7D2F51A1FB1;
 Wed, 19 Jun 2019 16:17:50 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 16:17:14 +0200
Message-Id: <1560953834-29584-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560953834-29584-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1560953834-29584-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v12 5/5] linux-user: Fix flock structure for
 MIPS O64 ABI
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

Only MIPS O32 and N32 have special (different than other
architectures) definition of structure flock in kernel.

Bring flock definition for MIPS O64 ABI to the correct state.

Reported-by: Dragan Mladjenovic <dmladjenovic@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/generic/fcntl.h     | 2 +-
 linux-user/mips/target_fcntl.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/generic/fcntl.h b/linux-user/generic/fcntl.h
index a775a49..1b48dde 100644
--- a/linux-user/generic/fcntl.h
+++ b/linux-user/generic/fcntl.h
@@ -129,7 +129,7 @@ struct target_flock {
     short l_whence;
     abi_long l_start;
     abi_long l_len;
-#if defined(TARGET_MIPS)
+#if defined(TARGET_MIPS) && (TARGET_ABI_BITS == 32)
     abi_long l_sysid;
 #endif
     int l_pid;
diff --git a/linux-user/mips/target_fcntl.h b/linux-user/mips/target_fcntl.h
index 000527c..795bba7 100644
--- a/linux-user/mips/target_fcntl.h
+++ b/linux-user/mips/target_fcntl.h
@@ -27,7 +27,11 @@
 #define TARGET_F_SETOWN        24       /*  for sockets. */
 #define TARGET_F_GETOWN        23       /*  for sockets. */
 
+#if (TARGET_ABI_BITS == 32)
 #define TARGET_ARCH_FLOCK_PAD abi_long pad[4];
+#else
+#define TARGET_ARCH_FLOCK_PAD
+#endif
 #define TARGET_ARCH_FLOCK64_PAD
 
 #define TARGET_F_GETLK64       33      /*  using 'struct flock64' */
-- 
2.7.4


