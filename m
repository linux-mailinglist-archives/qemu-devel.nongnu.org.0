Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABFF13C963
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:32:34 +0100 (CET)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlaq-0005CA-Us
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57071)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1irl0P-0005xH-8z
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:54:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1irl0L-0006Dj-6t
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:54:52 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:34176 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1irl0K-0005hY-Q7
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:54:49 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 08C6C1A219F;
 Wed, 15 Jan 2020 16:53:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D01D71A2173;
 Wed, 15 Jan 2020 16:53:43 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/12] linux-user: Add support for getting/setting RTC wakeup
 alarm using ioctls
Date: Wed, 15 Jan 2020 16:53:30 +0100
Message-Id: <1579103618-20217-5-git-send-email-Filip.Bozuta@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579103618-20217-1-git-send-email-Filip.Bozuta@rt-rk.com>
References: <1579103618-20217-1-git-send-email-Filip.Bozuta@rt-rk.com>
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, arnd@arndb.de,
 richard.henderson@linaro.org, laurent@vivier.eu, jcmvbkbc@gmail.com,
 amarkovic@wavecomp.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements functionalities of following ioctls:

RTC_WKALM_SET, RTC_WKALM_GET - Getting/Setting wakeup alarm

    Some RTCs support a more powerful alarm interface, using these
    ioctls to read or write the RTC's alarm time (respectively)
    with this structure:

        struct rtc_wkalrm {
            unsigned char enabled;
            unsigned char pending;
            struct rtc_time time;
        };

    The enabled flag is used to enable or disable the alarm
    interrupt, or to read its current status; when using these
    calls, RTC_AIE_ON and RTC_AIE_OFF are not used. The pending
    flag is used by RTC_WKALM_RD to report a pending interrupt
    (so it's mostly useless on Linux, except when talking to the
    RTC managed by EFI firmware). The time field is as used with
    RTC_ALM_READ and RTC_ALM_SET except that the tm_mday, tm_mon,
    and tm_year fields are also valid. A pointer to this structure
    should be passed as the third ioctl's argument.

Implementation notes:

    All ioctls in this patch have a pointer to a structure
    rtc_wkalrm as their third argument. That is the reason why
    corresponding definition is added in linux-user/syscall_types.h.
    Since all  elements of this structure are either of type
    'unsigned char' or 'struct rtc_time' (that was covered in one
    of previous patches), the rest of the implementation is
    straightforward.

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 linux-user/ioctls.h        | 2 ++
 linux-user/syscall_defs.h  | 2 ++
 linux-user/syscall_types.h | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index accbdee..b09396e 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -85,6 +85,8 @@
      IOCTL(RTC_IRQP_SET, IOC_W, TYPE_ULONG)
      IOCTL(RTC_EPOCH_READ, IOC_R, MK_PTR(TYPE_ULONG))
      IOCTL(RTC_EPOCH_SET, IOC_W, TYPE_ULONG)
+     IOCTL(RTC_WKALM_RD, IOC_R, MK_PTR(MK_STRUCT(STRUCT_rtc_wkalrm)))
+     IOCTL(RTC_WKALM_SET, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rtc_wkalrm)))
 
      IOCTL(BLKROSET, IOC_W, MK_PTR(TYPE_INT))
      IOCTL(BLKROGET, IOC_R, MK_PTR(TYPE_INT))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index bbfa935..37504a2 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -780,6 +780,8 @@ struct target_pollfd {
 #define TARGET_RTC_IRQP_SET         TARGET_IOW('p', 0x0c, abi_ulong)
 #define TARGET_RTC_EPOCH_READ       TARGET_IOR('p', 0x0d, abi_ulong)
 #define TARGET_RTC_EPOCH_SET        TARGET_IOW('p', 0x0e, abi_ulong)
+#define TARGET_RTC_WKALM_RD         TARGET_IOR('p', 0x10, struct rtc_wkalrm)
+#define TARGET_RTC_WKALM_SET        TARGET_IOW('p', 0x0f, struct rtc_wkalrm)
 
 #if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4) ||    \
        defined(TARGET_XTENSA)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index a35072a..820bc8e 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -266,6 +266,11 @@ STRUCT(rtc_time,
        TYPE_INT, /* tm_yday */
        TYPE_INT) /* tm_isdst */
 
+STRUCT(rtc_wkalrm,
+       TYPE_CHAR, /* enabled */
+       TYPE_CHAR, /* pending */
+       MK_STRUCT(STRUCT_rtc_time)) /* time */
+
 STRUCT(blkpg_ioctl_arg,
        TYPE_INT, /* op */
        TYPE_INT, /* flags */
-- 
2.7.4


