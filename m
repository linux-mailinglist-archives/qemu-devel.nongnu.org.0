Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A541359BB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 14:08:53 +0100 (CET)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipXYR-0004U1-Tf
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 08:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1ipXQc-0003JE-LO
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:00:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1ipXQa-00038l-Ip
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:00:46 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:42107 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1ipXQY-00034p-P3
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:00:44 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 122431A213D;
 Thu,  9 Jan 2020 13:59:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id E71841A204B;
 Thu,  9 Jan 2020 13:59:33 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/12] linux-user: Add support for read/clear RTC voltage low
 detector using ioctls
Date: Thu,  9 Jan 2020 13:59:17 +0100
Message-Id: <1578574763-8327-7-git-send-email-Filip.Bozuta@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578574763-8327-1-git-send-email-Filip.Bozuta@rt-rk.com>
References: <1578574763-8327-1-git-send-email-Filip.Bozuta@rt-rk.com>
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
Cc: riku.voipio@iki.fi, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RTC_VL_READ - Read voltage low detection information

    Read the voltage low for RTCs that support voltage low.
    The third ioctl's' argument points to an int in which
    the voltage low is returned.

RTC_VL_CLR - Clear voltage low information

    Clear the information about voltage low for RTCs that
    support voltage low. The third ioctl(2) argument is
    ignored.

Implementation notes:

    Since one ioctl has a pointer to 'int' as its third agrument,
    and another ioctl has NULL as its third argument, their
    implementation was straightforward.

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall_defs.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 0a4e3f1..1f1f3e6 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -89,6 +89,8 @@
      IOCTL(RTC_WKALM_SET, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rtc_wkalrm)))
      IOCTL(RTC_PLL_GET, IOC_R, MK_PTR(MK_STRUCT(STRUCT_rtc_pll_info)))
      IOCTL(RTC_PLL_SET, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rtc_pll_info)))
+     IOCTL(RTC_VL_READ, IOC_R, MK_PTR(TYPE_INT))
+     IOCTL(RTC_VL_CLR, 0, TYPE_NULL)
 
      IOCTL(BLKROSET, IOC_W, MK_PTR(TYPE_INT))
      IOCTL(BLKROGET, IOC_R, MK_PTR(TYPE_INT))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 8370f41..af4f366 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -796,6 +796,8 @@ struct target_rtc_pll_info {
                                                struct target_rtc_pll_info)
 #define TARGET_RTC_PLL_SET          TARGET_IOW('p', 0x12,                      \
                                                struct target_rtc_pll_info)
+#define TARGET_RTC_VL_READ          TARGET_IOR('p', 0x13, int)
+#define TARGET_RTC_VL_CLR           TARGET_IO('p', 0x14)
 
 #if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4) ||    \
        defined(TARGET_XTENSA)
-- 
2.7.4


