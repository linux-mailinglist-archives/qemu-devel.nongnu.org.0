Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18622730
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 18:19:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSOX0-0007sC-9E
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 12:19:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSOUh-0006eh-Tc
	for qemu-devel@nongnu.org; Sun, 19 May 2019 12:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSOUg-0007Fg-U7
	for qemu-devel@nongnu.org; Sun, 19 May 2019 12:17:03 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:53931 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hSOUg-0007F5-OJ
	for qemu-devel@nongnu.org; Sun, 19 May 2019 12:17:02 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id B00E01A202F;
	Sun, 19 May 2019 18:17:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 925921A1182;
	Sun, 19 May 2019 18:17:01 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 18:15:24 +0200
Message-Id: <1558282527-22183-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558282527-22183-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1558282527-22183-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v6 3/6] linux-user: Add support for
 SIOC<G|S>IFPFLAGS ioctls for all targets
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

From: Neng Chen <nchen@wavecomp.com>

Add support for getting and setting extended private flags of a
network device via SIOCSIFPFLAGS and SIOCGIFPFLAGS ioctls.

The ioctl numeric values are platform-independent and determined by
the file include/uapi/linux/sockios.h in Linux kernel source code:

  #define SIOCSIFPFLAGS 0x8934
  #define SIOCGIFPFLAGS	0x8935

These ioctls get (or set) the field ifr_flags of type short in the
structure ifreq. Such functionality is achieved in QEMU by using
MK_STRUCT() and MK_PTR() macros with an appropriate argument, as
it was done for existing similar cases.

Signed-off-by: Neng Chen <nchen@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <1554839486-3527-1-git-send-email-aleksandar.markovic@rt-rk.com>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall_defs.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index c37adc5..76375df 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -206,6 +206,8 @@
   IOCTL(SIOCADDMULTI, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifreq)))
   IOCTL(SIOCDELMULTI, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifreq)))
   IOCTL(SIOCGIFINDEX, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)))
+  IOCTL(SIOCSIFPFLAGS, IOC_W, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
+  IOCTL(SIOCGIFPFLAGS, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
   IOCTL(SIOCSIFLINK, 0, TYPE_NULL)
   IOCTL_SPECIAL(SIOCGIFCONF, IOC_W | IOC_R, do_ioctl_ifconf,
                 MK_PTR(MK_STRUCT(STRUCT_ifconf)))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 2941231..8904d35 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -781,6 +781,8 @@ struct target_pollfd {
 #define TARGET_SIOCADDMULTI    0x8931          /* Multicast address lists      */
 #define TARGET_SIOCDELMULTI    0x8932
 #define TARGET_SIOCGIFINDEX    0x8933
+#define TARGET_SIOCSIFPFLAGS   0x8934          /* set extended flags          */
+#define TARGET_SIOCGIFPFLAGS   0x8935          /* get extended flags          */
 
 /* Bridging control calls */
 #define TARGET_SIOCGIFBR       0x8940          /* Bridging support             */
-- 
2.7.4


