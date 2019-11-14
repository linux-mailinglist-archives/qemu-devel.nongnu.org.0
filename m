Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE795FC9AE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 16:16:34 +0100 (CET)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVGrI-0005sr-EY
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 10:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iVGon-0004Nj-AX
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 10:13:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iVGol-0007NY-EI
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 10:13:56 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:52132 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1iVGol-0007MM-7r
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 10:13:55 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5CB991A22CC;
 Thu, 14 Nov 2019 16:13:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 329701A22A8;
 Thu, 14 Nov 2019 16:13:50 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for 5.0 0/6] linux-user: Add support for real time clock
 ioctls
Date: Thu, 14 Nov 2019 16:13:36 +0100
Message-Id: <1573744422-9974-1-git-send-email-Filip.Bozuta@rt-rk.com>
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
Cc: laurent@viver.eu, Filip.Bozuta@rt-rk.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add ioctls for all RTC features that are currently supported in linux kernel.

This series covers following iocts:

    * RTC_AIE_ON
    * RTC_AIE_OFF
    * RTC_UIE_ON
    * RTC_UIE_OFF
    * RTC_PIE_ON
    * RTC_PIE_OFF
    * RTC_WIE_ON
    * RTC_WIE_OFF
    * RTC_ALM_SET
    * RTC_ALM_READ
    * RTC_RD_TIME
    * RTC_SET_TIME
    * RTC_IRQP_READ
    * RTC_IRQP_SET
    * RTC_EPOCH_READ
    * RTC_EPOCH_SET
    * RTC_WKALM_SET
    * RTC_WKALM_RD
    * RTC_PLL_GET
    * RTC_PLL_SET
    * RTC_VL_READ
    * RTC_VL_CLR

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

        * Intel(R) Core(TM) i7-4790K CPU @ 4.00GHz
        *.7447A, (ppc32 host)

    All applicable compiled programs were in turn executed through QEMU
    and the results obtained were the same ones gotten for native
    execution.

Example of a test program:

    For ioctl RTC_RD_TIME we have used the following test program:

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



Filip Bozuta (6):
  linux-user: Add support for enable/disable RTC features using ioctls
  linux-user: Add support for read/set RTC time and alarm using ioctls
  linux-user: Add support for read/set RTC periodic interrupt and epoch
    using ioctls
  linux-user: Add support for get/set RTC wakeup alarm using ioctls
  linux-user: Add support for get/set RTC PLL correction using ioctls
  linux-user: Add support for read/clear RTC voltage low detector using
    ioctls

 linux-user/ioctls.h        | 23 +++++++++++++++++++++++
 linux-user/syscall.c       |  1 +
 linux-user/syscall_defs.h  | 36 ++++++++++++++++++++++++++++++++++++
 linux-user/syscall_types.h | 25 +++++++++++++++++++++++++
 4 files changed, 85 insertions(+)

-- 
2.7.4


