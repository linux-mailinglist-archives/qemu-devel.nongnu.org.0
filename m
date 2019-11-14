Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B821FB592
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 17:50:45 +0100 (CET)
Received: from localhost ([::1]:47422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUvqu-0008AK-33
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 11:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iUviu-0000v7-23
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 11:42:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iUvis-0005kh-Fn
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 11:42:27 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:35076 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1iUvir-0005TN-Ij
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 11:42:25 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 8FD161A22C8;
 Wed, 13 Nov 2019 17:41:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 65BCD1A22B2;
 Wed, 13 Nov 2019 17:41:20 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 5.0 3/6] linux-user: Add read and set for rtc periodic
 interrupt and epoch using ioctls
Date: Wed, 13 Nov 2019 17:41:08 +0100
Message-Id: <1573663271-31519-4-git-send-email-Filip.Bozuta@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573663271-31519-1-git-send-email-Filip.Bozuta@rt-rk.com>
References: <1573663271-31519-1-git-send-email-Filip.Bozuta@rt-rk.com>
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
Cc: laurent@viver.eu, Filip.Bozuta@rt-rk.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 linux-user/ioctls.h       | 4 ++++
 linux-user/syscall_defs.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index ff1cdd2..7d76a9f 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -81,6 +81,10 @@
      IOCTL(RTC_ALM_READ, IOC_R, MK_PTR(MK_STRUCT(STRUCT_rtc_time)))
      IOCTL(RTC_RD_TIME, IOC_R, MK_PTR(MK_STRUCT(STRUCT_rtc_time)))
      IOCTL(RTC_SET_TIME, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rtc_time)))
+     IOCTL(RTC_IRQP_READ, IOC_R, MK_PTR(TYPE_ULONG))
+     IOCTL(RTC_IRQP_SET, IOC_W, MK_PTR(TYPE_ULONG))
+     IOCTL(RTC_EPOCH_READ, IOC_R, MK_PTR(TYPE_ULONG))
+     IOCTL(RTC_EPOCH_SET, IOC_W, MK_PTR(TYPE_ULONG))
 
      IOCTL(BLKROSET, IOC_W, MK_PTR(TYPE_INT))
      IOCTL(BLKROGET, IOC_R, MK_PTR(TYPE_INT))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 2298547..e69071f 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -776,6 +776,10 @@ struct target_pollfd {
 #define TARGET_RTC_ALM_READ         TARGET_IOR('p', 0x08, struct rtc_time)
 #define TARGET_RTC_RD_TIME          TARGET_IOR('p', 0x09, struct rtc_time)
 #define TARGET_RTC_SET_TIME         TARGET_IOW('p', 0x0a, struct rtc_time)
+#define TARGET_RTC_IRQP_READ        TARGET_IOR('p', 0x0b, abi_ulong)
+#define TARGET_RTC_IRQP_SET         TARGET_IOW('p', 0x0c, abi_ulong)
+#define TARGET_RTC_EPOCH_READ       TARGET_IOR('p', 0x0d, abi_ulong)
+#define TARGET_RTC_EPOCH_SET        TARGET_IOW('p', 0x0e, abi_ulong)
 
 #if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4) ||    \
        defined(TARGET_XTENSA)
-- 
2.7.4


