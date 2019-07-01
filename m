Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC100132E9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 19:10:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMbhS-0002OC-PZ
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 13:10:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hMbfY-0001TH-78
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:08:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hMbfX-0003DW-7S
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:08:20 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:46165 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hMbfX-0001gb-0w
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:08:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 2D1091A2217;
	Fri,  3 May 2019 19:07:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 078941A21EF;
	Fri,  3 May 2019 19:07:17 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 19:06:46 +0200
Message-Id: <1556903209-6036-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556903209-6036-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1556903209-6036-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v3 2/5] linux-user: Add support for the
 SIOCSPGRP ioctl
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, thuth@redhat.com, jcmvbkbc@gmail.com,
	arikalo@wavecomp.com, daniel.santos@pobox.com,
	amarkovic@wavecomp.com, nchen@wavecomp.com, philmd@redhat.com,
	aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Add support for setting the process (or process group) to receive SIGIO
or SIGURG signals when I/O becomes possible or urgent data is available,
using SIOCSPGRP ioctl.

The ioctl numeric values for SIOCSPGRP are platform-dependent and are
determined by following files in Linux kernel source tree:

arch/ia64/include/uapi/asm/sockios.h:#define SIOCSPGRP    0x8902
arch/mips/include/uapi/asm/sockios.h:#define SIOCSPGRP    _IOW('s', 8, pid_t)
arch/parisc/include/uapi/asm/sockios.h:#define SIOCSPGRP  0x8902
arch/sh/include/uapi/asm/sockios.h:#define SIOCSPGRP      _IOW('s', 8, pid_t)
arch/xtensa/include/uapi/asm/sockios.h:#define SIOCSPGRP  _IOW('s', 8, pid_t)
arch/alpha/include/uapi/asm/sockios.h:#define SIOCSPGRP   _IOW('s', 8, pid_t)
arch/sparc/include/uapi/asm/sockios.h:#define SIOCSPGRP   0x8902
include/uapi/asm-generic/sockios.h:#define SIOCSPGRP      0x8902

Hence the different definition for alpha, mips, sh4, and xtensa.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h       | 1 +
 linux-user/syscall_defs.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index ae89516..c37adc5 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -218,6 +218,7 @@
   IOCTL(SIOCSRARP, IOC_W, MK_PTR(MK_STRUCT(STRUCT_arpreq)))
   IOCTL(SIOCGRARP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_arpreq)))
   IOCTL(SIOCGIWNAME, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_char_ifreq)))
+  IOCTL(SIOCSPGRP, IOC_W, MK_PTR(TYPE_INT)) /* pid_t */
   IOCTL(SIOCGPGRP, IOC_R, MK_PTR(TYPE_INT)) /* pid_t */
   IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
   IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 1e86fb9..2941231 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -739,11 +739,14 @@ struct target_pollfd {
 #if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4) ||    \
        defined(TARGET_XTENSA)
 #define TARGET_SIOCATMARK      TARGET_IOR('s', 7, int)
+#define TARGET_SIOCSPGRP       TARGET_IOW('s', 8, pid_t)
 #define TARGET_SIOCGPGRP       TARGET_IOR('s', 9, pid_t)
 #else
 #define TARGET_SIOCATMARK      0x8905
+#define TARGET_SIOCSPGRP       0x8902
 #define TARGET_SIOCGPGRP       0x8904
 #endif
+
 #define TARGET_SIOCGSTAMP      0x8906          /* Get stamp (timeval) */
 #define TARGET_SIOCGSTAMPNS    0x8907          /* Get stamp (timespec) */
 
-- 
2.7.4


