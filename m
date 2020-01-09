Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5011359C3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 14:10:54 +0100 (CET)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipXaP-00079I-8g
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 08:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1ipXQc-0003JH-MW
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:00:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1ipXQa-00039p-S1
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:00:46 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:42115 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1ipXQY-00034z-Of
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:00:44 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0708C1A20C3;
 Thu,  9 Jan 2020 13:59:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id DA46C1A213D;
 Thu,  9 Jan 2020 13:59:33 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] linux-user: Add support for getting/setting RTC PLL
 correction using ioctls
Date: Thu,  9 Jan 2020 13:59:16 +0100
Message-Id: <1578574763-8327-6-git-send-email-Filip.Bozuta@rt-rk.com>
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

This patch implements functionalities of following ioctls:

RTC_PLL_GET - Getting PLL correction

    Read the PLL correction for RTCs that support PLL. The PLL correction
    is returned in the following structure:

        struct rtc_pll_info {
            int pll_ctrl;        /* placeholder for fancier control */
            int pll_value;       /* get/set correction value */
            int pll_max;         /* max +ve (faster) adjustment value */
            int pll_min;         /* max -ve (slower) adjustment value */
            int pll_posmult;     /* factor for +ve correction */
            int pll_negmult;     /* factor for -ve correction */
            long pll_clock;      /* base PLL frequency */
        };

    A pointer to this structure should be passed as the third
    ioctl's argument.

RTC_PLL_SET - Setting PLL correction

    Sets the PLL correction for RTCs that support PLL. The PLL correction
    that is set is specified by the rtc_pll_info structure pointed to by
    the third ioctl's' argument.

Implementation notes:

    All ioctls in this patch have a pointer to a structure rtc_pll_info
    as their third argument. All elements of this structure are of
    type 'int', except the last one that is of type 'long'. That is
    the reason why a separate target structure (target_rtc_pll_info)
    is defined in linux-user/syscall_defs. The rest of the
    implementation is straightforward.

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 linux-user/ioctls.h        |  2 ++
 linux-user/syscall_defs.h  | 14 ++++++++++++++
 linux-user/syscall_types.h |  9 +++++++++
 3 files changed, 25 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index b09396e..0a4e3f1 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -87,6 +87,8 @@
      IOCTL(RTC_EPOCH_SET, IOC_W, TYPE_ULONG)
      IOCTL(RTC_WKALM_RD, IOC_R, MK_PTR(MK_STRUCT(STRUCT_rtc_wkalrm)))
      IOCTL(RTC_WKALM_SET, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rtc_wkalrm)))
+     IOCTL(RTC_PLL_GET, IOC_R, MK_PTR(MK_STRUCT(STRUCT_rtc_pll_info)))
+     IOCTL(RTC_PLL_SET, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rtc_pll_info)))
 
      IOCTL(BLKROSET, IOC_W, MK_PTR(TYPE_INT))
      IOCTL(BLKROGET, IOC_R, MK_PTR(TYPE_INT))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 37504a2..8370f41 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -763,6 +763,16 @@ struct target_pollfd {
 #define TARGET_KDSETLED        0x4B32	/* set led state [lights, not flags] */
 #define TARGET_KDSIGACCEPT     0x4B4E
 
+struct target_rtc_pll_info {
+    int pll_ctrl;
+    int pll_value;
+    int pll_max;
+    int pll_min;
+    int pll_posmult;
+    int pll_negmult;
+    abi_long pll_clock;
+};
+
 /* real time clock ioctls */
 #define TARGET_RTC_AIE_ON           TARGET_IO('p', 0x01)
 #define TARGET_RTC_AIE_OFF          TARGET_IO('p', 0x02)
@@ -782,6 +792,10 @@ struct target_pollfd {
 #define TARGET_RTC_EPOCH_SET        TARGET_IOW('p', 0x0e, abi_ulong)
 #define TARGET_RTC_WKALM_RD         TARGET_IOR('p', 0x10, struct rtc_wkalrm)
 #define TARGET_RTC_WKALM_SET        TARGET_IOW('p', 0x0f, struct rtc_wkalrm)
+#define TARGET_RTC_PLL_GET          TARGET_IOR('p', 0x11,                      \
+                                               struct target_rtc_pll_info)
+#define TARGET_RTC_PLL_SET          TARGET_IOW('p', 0x12,                      \
+                                               struct target_rtc_pll_info)
 
 #if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4) ||    \
        defined(TARGET_XTENSA)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 820bc8e..4027272 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -271,6 +271,15 @@ STRUCT(rtc_wkalrm,
        TYPE_CHAR, /* pending */
        MK_STRUCT(STRUCT_rtc_time)) /* time */
 
+STRUCT(rtc_pll_info,
+       TYPE_INT, /* pll_ctrl */
+       TYPE_INT, /* pll_value */
+       TYPE_INT, /* pll_max */
+       TYPE_INT, /* pll_min */
+       TYPE_INT, /* pll_posmult */
+       TYPE_INT, /* pll_negmult */
+       TYPE_LONG) /* pll_clock */
+
 STRUCT(blkpg_ioctl_arg,
        TYPE_INT, /* op */
        TYPE_INT, /* flags */
-- 
2.7.4


