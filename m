Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12E142F5D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 17:12:15 +0100 (CET)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itZew-0005II-QU
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 11:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1itZdF-000400-T7
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:10:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1itZdB-0005LW-KG
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:10:29 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:43136 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1itZdB-0004bo-A0
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:10:25 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0EA561A2129;
 Mon, 20 Jan 2020 17:09:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id EA5581A20EF;
 Mon, 20 Jan 2020 17:09:19 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/tcg/multiarch: Add tests for implemented real
Date: Mon, 20 Jan 2020 17:09:12 +0100
Message-Id: <1579536554-30701-1-git-send-email-Filip.Bozuta@rt-rk.com>
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series covers tests for implemented rtc and alsa timer ioctls. The names
of ioctls that are covered by these tests can be found in patch descriptions.
The functionalities of each ioctl that is tested can be found in patches that
implement them.

Some of the features that are accessible through these ioctls are not supported
on all test host pc's. These tests were written so that the implemented ioctls
can be properly tested on pc's that support all of their features.

Both rtc and alsa timer test folders contain separate programs that test functionalities
of individual ioctls and one global program that tests multiple ioctls at once.
Individual tests were written manually while the global tests were obtained remotely and
modified so that they fit the QEMU coding style.

Filip Bozuta (2):
  tests/tcg/multiarch: Add tests for implemented rtc ioctls
  tests/tcg/multiarch: Add tests for implemented alsa sound timer ioctls

 .../Disable/disableEnhancedRead.c                  |  29 +++
 .../EnhancedRead-test/Enable/enableEnhancedRead.c  |  29 +++
 .../alsa-timer-ioctl-tests/GlobalTest/timer.c      | 158 ++++++++++++++
 .../Instructions-tests/Continue/continue.c         |  39 ++++
 .../Instructions-tests/Pause/pause.c               |  39 ++++
 .../Instructions-tests/Start/start.c               |  39 ++++
 .../Instructions-tests/Stop/stop.c                 |  39 ++++
 .../SelectedParameters-tests/Info/info.c           |  46 +++++
 .../SelectedParameters-tests/Params/params.c       |  44 ++++
 .../SelectedParameters-tests/Status/status.c       |  45 ++++
 .../alsa-timer-ioctl-tests/Selecting-test/select.c |  34 +++
 .../SpecifiedParameters-tests/Ginfo/ginfo.c        |  43 ++++
 .../SpecifiedParameters-tests/Gparams/gparams.c    |  37 ++++
 .../SpecifiedParameters-tests/Gstatus/gstatus.c    |  36 ++++
 .../Version-id-tests/NextDevice/nextDevice.c       |  34 +++
 .../Version-id-tests/Pversion/pversion.c           |  30 +++
 .../Alarm-time-test/ReadAlarm/getAlarm.c           |  33 +++
 .../Alarm-time-test/ReadTime/getTime.c             |  35 ++++
 .../Alarm-time-test/SetAlarm/setAlarm.c            |  31 +++
 .../Alarm-time-test/SetTime/setTime.c              |  33 +++
 .../AlarmInterrupt/Disable/disableAlarmInterrupt.c |  29 +++
 .../AlarmInterrupt/Enable/enableAlarmInterrupt.c   |  29 +++
 .../Disable/disablePeriodicInterrupt.c             |  30 +++
 .../Enable/enablePeriodicInterrupt.c               |  29 +++
 .../Disable/disableUpdateInterrupt.c               |  29 +++
 .../UpdateInterrupt/Enable/enableUpdateInterrupt.c |  29 +++
 .../Disable/disableWatchdogInterrupt.c             |  30 +++
 .../Enable/enableWatchdogInterrupt.c               |  31 +++
 .../rtc-ioctl-tests/GlobalTest/rtc-test.c          | 227 +++++++++++++++++++++
 .../ReadEpoch/getEpoch.c                           |  32 +++
 .../ReadPeriodicInterrupt/getPeriodicInterrupt.c   |  31 +++
 .../SetEpoch/setEpoch.c                            |  32 +++
 .../SetPeriodicInterrupt/setPeriodicInterrupt.c    |  31 +++
 .../ReadPllCorrection/getPllCorrection.c           |  35 ++++
 .../SetPllCorrection/setPllCorrection.c            |  32 +++
 .../ClearVoltageLow/clearVoltageLow.c              |  32 +++
 .../ReadVoltageLow/getVoltageLow.c                 |  32 +++
 .../ReadWakeupAlarm/getWakeupAlarm.c               |  36 ++++
 .../SetWakeupAlarm/setWakeupAlarm.c                |  34 +++
 39 files changed, 1643 insertions(+)
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/EnhancedRead-test/Disable/disableEnhancedRead.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/EnhancedRead-test/Enable/enableEnhancedRead.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/GlobalTest/timer.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/Instructions-tests/Continue/continue.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/Instructions-tests/Pause/pause.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/Instructions-tests/Start/start.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/Instructions-tests/Stop/stop.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/SelectedParameters-tests/Info/info.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/SelectedParameters-tests/Params/params.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/SelectedParameters-tests/Status/status.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/Selecting-test/select.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/SpecifiedParameters-tests/Ginfo/ginfo.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/SpecifiedParameters-tests/Gparams/gparams.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/SpecifiedParameters-tests/Gstatus/gstatus.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/Version-id-tests/NextDevice/nextDevice.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/Version-id-tests/Pversion/pversion.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Alarm-time-test/ReadAlarm/getAlarm.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Alarm-time-test/ReadTime/getTime.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Alarm-time-test/SetAlarm/setAlarm.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Alarm-time-test/SetTime/setTime.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Features-test/AlarmInterrupt/Disable/disableAlarmInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Features-test/AlarmInterrupt/Enable/enableAlarmInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Features-test/PeriodicInterrupt/Disable/disablePeriodicInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Features-test/PeriodicInterrupt/Enable/enablePeriodicInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Features-test/UpdateInterrupt/Disable/disableUpdateInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Features-test/UpdateInterrupt/Enable/enableUpdateInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Features-test/WatchdogInterrupt/Disable/disableWatchdogInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Features-test/WatchdogInterrupt/Enable/enableWatchdogInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/GlobalTest/rtc-test.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Periodic-interrupt-epoch-test/ReadEpoch/getEpoch.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Periodic-interrupt-epoch-test/ReadPeriodicInterrupt/getPeriodicInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Periodic-interrupt-epoch-test/SetEpoch/setEpoch.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Periodic-interrupt-epoch-test/SetPeriodicInterrupt/setPeriodicInterrupt.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Pll-correction-test/ReadPllCorrection/getPllCorrection.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Pll-correction-test/SetPllCorrection/setPllCorrection.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Voltage-low-test/ClearVoltageLow/clearVoltageLow.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Voltage-low-test/ReadVoltageLow/getVoltageLow.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Wakeup-alarm-test/ReadWakeupAlarm/getWakeupAlarm.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/Wakeup-alarm-test/SetWakeupAlarm/setWakeupAlarm.c

-- 
2.7.4


