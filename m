Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3287B13CD3F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 20:41:37 +0100 (CET)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iroXn-00035k-QC
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 14:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iroTa-0005er-72
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:37:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iroTR-0004oF-EE
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:37:09 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:43176 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1iroTQ-0004hf-O2
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:37:05 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id E43C91A215D;
 Wed, 15 Jan 2020 20:36:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id C049A1A1E6D;
 Wed, 15 Jan 2020 20:36:52 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/13] linux-user: Add support for real time clock and
Date: Wed, 15 Jan 2020 20:36:34 +0100
Message-Id: <1579117007-7565-1-git-send-email-Filip.Bozuta@rt-rk.com>
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, arnd@arndb.de,
 richard.henderson@linaro.org, laurent@vivier.eu, jcmvbkbc@gmail.com,
 amarkovic@wavecomp.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series covers following RTC and sound timer ioctls:

  RTC ioctls(22):

    * RTC_AIE_ON          * RTC_ALM_SET         * RTC_WKALM_SET
    * RTC_AIE_OFF         * RTC_ALM_READ        * RTC_WKALM_RD
    * RTC_UIE_ON          * RTC_RD_TIME         * RTC_PLL_GET
    * RTC_UIE_OFF         * RTC_SET_TIME        * RTC_PLL_SET
    * RTC_PIE_ON          * RTC_IRQP_READ       * RTC_VL_READ
    * RTC_PIE_OFF         * RTC_IRQP_SET        * RTC_VL_CLR
    * RTC_WIE_ON          * RTC_EPOCH_READ
    * RTC_WIE_OFF         * RTC_EPOCH_SET

  Sound timer ioctls(14):

    * SNDRV_TIMER_IOCTL_PVERSION          * SNDRV_TIMER_IOCTL_INFO
    * SNDRV_TIMER_IOCTL_NEXT_DEVICE       * SNDRV_TIMER_IOCTL_PARAMS
    * SNDRV_TIMER_IOCTL_TREAD             * SNDRV_TIMER_IOCTL_STATUS
    * SNDRV_TIMER_IOCTL_GINFO             * SNDRV_TIMER_IOCTL_START
    * SNDRV_TIMER_IOCTL_GPARAMS           * SNDRV_TIMER_IOCTL_STOP
    * SNDRV_TIMER_IOCTL_GSTATUS           * SNDRV_TIMER_IOCTL_CONTINUE
    * SNDRV_TIMER_IOCTL_SELECT            * SNDRV_TIMER_IOCTL_PAUSE

The functionalities of individual ioctls were described in this series
patch commit messages.

Testing method for RTC ioctls:

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

Testing method for sound timer ioctls:

    The alsa ioctl test suite, that can be found on github
    ("https://github.com/alsa-project/alsa-utils"), was used the test
    the implemented ioctls. The file "timer.c", located in this test
    suite, contains test functions that are used to test alsa timer
    ioctls. This file was compiled (sometimes using cross-compilers) 
    for the following architectures:

        * Intel 64-bit (little endian)
        * Power pc 32-bit (big endian)
        * Power pc 64-bit (big endian)

    The corresponding compiled test files were executed without using
    QEMU on following hosts:

        * Intel Core i7-4790K (x86_64 host)
        * Power 7447A (ppc32 host)

    The corresponding native compiled test files were executed without using
    QEMU on following hosts:

        * Intel Core i7-4790K (x86_64 host)
        * Power 7447A (ppc32 host)

    All compiled test files were in turn executed through QEMU
    and the results obtained were the same ones gotten for native
    execution.

    Also, mini test programs were written to test further functionalities
    of individual ioctls. Those programs were, like the file "timer.c",
    compiled for different architectures and were executed both natively
    and thgrough QEMU to compare the results.

    Example of a test program:

        For ioctl SNDRV_TIMER_IOCTL_GINFO the following test program was used:

        #include <stdio.h>
        #include <stdlib.h>
        #include <sys/types.h>
        #include <fcntl.h>
        #include <sys/ioctl.h>
        #include <sound/asound.h>

        #define ERROR -1

        int main()
        {
            int fd = open("/dev/snd/timer", O_RDWR);

            if(fd == ERROR)
            {
                perror("open");
                return -1;
            }

            struct snd_timer_id id = {SNDRV_TIMER_CLASS_GLOBAL, 
                                      SNDRV_TIMER_SCLASS_NONE, -1, 
                                      SNDRV_TIMER_GLOBAL_SYSTEM, 0};

            struct snd_timer_ginfo ginfo;
            ginfo.tid = id;

            if(ioctl(fd, SNDRV_TIMER_IOCTL_GINFO, &ginfo) == ERROR)
            {
                perror("ioctl");
                return -1;
            }

            printf("flags: %u\n", ginfo.flags);
            printf("card: %d\n", ginfo.card);
            printf("id: %s\n", ginfo.id);
            printf("name: %s\n", ginfo.name);
            printf("reserved0: %lu\n", ginfo.reserved0);
            printf("resolution: %lu\n", ginfo.resolution);
            printf("resolution_min: %lu\n", ginfo.resolution_min);
            printf("reolution_max: %lu\n", ginfo.resolution_max);
            printf("clients: %u\n", ginfo.clients);
            printf("reserved: %s\n", ginfo.reserved);

            return 0;
        }

v8:

    * added "Reviewed-by: Laurent Vivier <laurent@vivier.eu>" at the
      end of patch descriptions that were reviewed

v7:

    * added separate patch for support for ioctls that have 'long' and
      'unsigned long' as third argument (this functionality was added
      in v6 but in v7 a separate patch was added for it)

    * modified coding style for files that had styling problems
      detected by script located in 'scripts/checkpatch.pl'

v6:

    * fixed one patch by adding a case statement for 'unsigned long'
      to recognize two ioctls that are implemented in that patch

    * changed patch descriptions a little bit so that they are more
      comprehensible

v5:

    * added support for alsa sound timer ioctls

v4:

    * changed patch descriptions so that they are better
      formatted and more comprehensible

v3:

    * changed two instances of MK_PTR(TYPE_ULONG) to TYPE_ULONG

v2:

    * added description of each ioctl in patches
    * wrote a more detailed cover letter with description of testing
    * changed one instance of TYPE_INT to MK_PTR(TYPE_INT)

Filip Bozuta (13):
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
  linux-user: Add support for getting alsa timer version and id
  linux-user: Add support for setting alsa timer enhanced read using
    ioctl
  linux-user: Add support for getting/setting specified alsa timer
    parameters using ioctls
  linux-user: Add support for selecting alsa timer using ioctl
  linux-user: Add support for getting/setting selected alsa timer
    parameters using ioctls
  linux-user: Add support for selected alsa timer instructions using
    ioctls
  linux-user: Add support for TYPE_LONG and TYPE_ULONG in do_ioctl()

 linux-user/ioctls.h        |  45 +++++++++++++++++
 linux-user/syscall.c       |   4 ++
 linux-user/syscall_defs.h  | 121 +++++++++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_types.h |  91 ++++++++++++++++++++++++++++++++++
 4 files changed, 261 insertions(+)

-- 
2.7.4


