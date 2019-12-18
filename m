Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14009124374
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 10:39:14 +0100 (CET)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihVnU-0001dB-QB
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 04:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44325)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1ihVjw-0005QK-7e
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 04:35:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1ihVju-0001Aq-AF
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 04:35:31 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:34118 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1ihVjt-0005f3-UK
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 04:35:30 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 20F861A2248;
 Wed, 18 Dec 2019 10:34:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D551B1A153B;
 Wed, 18 Dec 2019 10:34:19 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] linux-user: Add support for real time clock ioctls
Date: Wed, 18 Dec 2019 10:34:06 +0100
Message-Id: <1576661652-2870-1-git-send-email-Filip.Bozuta@rt-rk.com>
X-Mailer: git-send-email 2.7.4
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add ioctls for all RTC features that are currently supported in linux kernel.

This series covers following 22 iocts:

    * RTC_AIE_ON          * RTC_ALM_SET         * RTC_WKALM_SET
    * RTC_AIE_OFF         * RTC_ALM_READ        * RTC_WKALM_RD
    * RTC_UIE_ON          * RTC_RD_TIME         * RTC_PLL_GET
    * RTC_UIE_OFF         * RTC_SET_TIME        * RTC_PLL_SET
    * RTC_PIE_ON          * RTC_IRQP_READ       * RTC_VL_READ
    * RTC_PIE_OFF         * RTC_IRQP_SET        * RTC_VL_CLR
    * RTC_WIE_ON          * RTC_EPOCH_READ
    * RTC_WIE_OFF         * RTC_EPOCH_SET


The functionalities of individual ioctls were described in this series
patch commit messages.

Testing method:

    Mini test programs were written for each ioctl. Those programs were
    compiled (sometimes using cross-compilers) for the following
    architectures:

        * Intel 64-bit (little endian)
        * Power pc 32-bit (big endian)
        * Power pc 64-bit (big endian)

    The corresponding native programs were executed without using
    QEMU on following hosts:

        * Intel Core i7-4790K (x86_64 host)
        * Power 7447A (ppc32 host)

    All applicable compiled programs were in turn executed through QEMU
    and the results obtained were the same ones gotten for native
    execution.

Example of a test program:

    For ioctl RTC_RD_TIME the following test program was used:

    #include <stdio.h>
    #include <stdlib.h>
    #include <linux/rtc.h>
    #include <fcntl.h>
    #include <linux/input.h>
    #include <sys/types.h>
    #include <unistd.h>

    #define ERROR -1

    int main()
    {

        int fd = open("/dev/rtc", O_RDWR | O_NONBLOCK);

        if(fd == ERROR)
        {
            perror("open");
            return -1;
        }

        struct rtc_time cur_time;

        if(ioctl(fd, RTC_RD_TIME, &cur_time) < 0)
        {
            perror("ioctl");
            return -1;
        }

        printf("Second: %d, Minute: %d, Hour: %d, Day: %d, Month: %d, Year: %d,",
            cur_time.tm_sec, cur_time.tm_min, cur_time.tm_hour, 
            cur_time.tm_mday, cur_time.tm_mon, cur_time.tm_year);

        return 0;
    }

Limitations of testing:
    
    The test host pc that was used for testing (intel pc) has RTC
    that doesn't support all RTC features that are accessible
    through ioctls. This means that testing can't discover
    functionality errors related to the third argument of ioctls
    that are used for features which are not supported. For example,
    running the test program for ioctl RTC_EPOCH_READ gives
    the error output: inappropriate ioctl for device. As expected,
    the same output was obtained through QEMU which means that this
    ioctl is recognized in QEMU but doesn't really do anything
    because it is not supported in the host computer's RTC.

    Conclusion: Some RTC ioctls need to be tested on computers
    that support their functionalities so that it can be inferred
    that they are really supported in QEMU. In absence of such
    test hosts, the specifications of those ioctls need to be
    carefully checked manually and the implementations should be
    updated accordingly.

v4:

    * changed patch descriptions so that they are better
      formatted and more cemprehensible

v3:

    * changed two instances of MK_PTR(TYPE_ULONG) to TYPE_ULONG

v2:

    * added description of each ioctl in patches
    * wrote a more detailed cover letter with description of testing
    * changed one instance of TYPE_INT to MK_PTR(TYPE_INT)

Filip Bozuta (6):
  linux-user: Add support for enabling/disabling RTC features using
    ioctls
  linux-user: Add support for getting/setting RTC time and alarm using
    ioctls
  linux-user: Add support for getting/setting RTC periodic interrupt and
    epoch using ioctls
  linux-user: Add support for getting/setting RTC wakeup alarm using
    ioctls
  linux-user: Add support for getting/setting RTC PLL correction using
    ioctls
  linux-user: Add support for read/clear RTC voltage low detector using
    ioctls

 linux-user/ioctls.h        | 23 +++++++++++++++++++++++
 linux-user/syscall.c       |  1 +
 linux-user/syscall_defs.h  | 36 ++++++++++++++++++++++++++++++++++++
 linux-user/syscall_types.h | 25 +++++++++++++++++++++++++
 4 files changed, 85 insertions(+)

-- 
2.7.4


