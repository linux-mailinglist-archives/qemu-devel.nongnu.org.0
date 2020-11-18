Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27FA2B7551
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 05:12:45 +0100 (CET)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfEpn-0001SV-L3
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 23:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfEoR-00011N-64
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 23:11:19 -0500
Received: from indium.canonical.com ([91.189.90.7]:60074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfEoO-0004b7-W9
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 23:11:18 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfEoN-0008Qy-5w
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 04:11:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2A0DE2E804E
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 04:11:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2020 03:57:06 -0000
From: "Cheol-Woo,Myung" <1904652@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cwmyung
X-Launchpad-Bug-Reporter: Cheol-Woo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Cheol-Woo,Myung (cwmyung)
Message-Id: <160567182664.18318.5998464734058327883.malonedeb@wampee.canonical.com>
Subject: [Bug 1904652] [NEW] Assertion failure in usb-ohci
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: a379dfebf44a9999704befe6c77cec42138118fd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 22:20:38
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1904652 <1904652@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,

Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
usb-ohci.

A malicious guest user/process could use this flaw to abort the QEMU
process on the host, resulting in a denial of service.

This was found in version 5.2.0 (master)

--------

```

Program terminated with signal SIGABRT, Aborted.

#0  __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/unix/sysv/linux/raise.=
c:51
51      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
[Current thread is 1 (Thread 0x7f34d0411440 (LWP 9418))]
gdb-peda$ bt
#0  0x00007f34c8d4ef47 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/=
unix/sysv/linux/raise.c:51
#1  0x00007f34c8d508b1 in __GI_abort () at abort.c:79
#2  0x000055d3a2081844 in ohci_frame_boundary (opaque=3D0x55d3a4ecdaf0) at =
../hw/usb/hcd-ohci.c:1297
#3  0x000055d3a25be155 in timerlist_run_timers (timer_list=3D0x55d3a3fd9840=
) at ../util/qemu-timer.c:574
#4  0x000055d3a25beaba in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUAL)=
 at ../util/qemu-timer.c:588
#5  0x000055d3a25beaba in qemu_clock_run_all_timers () at ../util/qemu-time=
r.c:670
#6  0x000055d3a25e69a1 in main_loop_wait (nonblocking=3D<optimized out>) at=
 ../util/main-loop.c:531
#7  0x000055d3a2433972 in qemu_main_loop () at ../softmmu/vl.c:1678
#8  0x000055d3a1d0969b in main (argc=3D<optimized out>, argc@entry=3D0x15, =
argv=3D<optimized out>,
    argv@entry=3D0x7ffc6de722a8, envp=3D<optimized out>) at ../softmmu/main=
.c:50
#9  0x00007f34c8d31b97 in __libc_start_main (main=3D
    0x55d3a1d09690 <main>, argc=3D0x15, argv=3D0x7ffc6de722a8, init=3D<opti=
mized out>, fini=3D<optimized out>, rtld_fini=3D<optimized out>, stack_end=
=3D0x7ffc6de72298) at ../csu/libc-start.c:310
#10 0x000055d3a1d095aa in _start ()
```

To reproduce the assertion failure, please run the QEMU with the
following command line.

```
[Terminal 1]

$ qemu-system-i386 -m 512 -drive
file=3D./fs.img,index=3D1,media=3Ddisk,format=3Draw -drive
file=3D./hyfuzz.img,index=3D0,media=3Ddisk,format=3Draw -drive
if=3Dnone,id=3Dstick,file=3D./usbdisk.img,format=3Draw -device pci-ohci,id=
=3Dusb
-device usb-storage,bus=3Dusb.0,drive=3Dstick

[Terminal 2]

$ ./repro_log ./fs.img ./pci-ohci

```

Please let me know if I can provide any further info.
-Cheolwoo, Myung (Seoul National University)

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "attachment.zip"
   https://bugs.launchpad.net/bugs/1904652/+attachment/5435350/+files/attac=
hment.zip

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904652

Title:
  Assertion failure in usb-ohci

Status in QEMU:
  New

Bug description:
  Hello,

  Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
  usb-ohci.

  A malicious guest user/process could use this flaw to abort the QEMU
  process on the host, resulting in a denial of service.

  This was found in version 5.2.0 (master)

  --------

  ```

  Program terminated with signal SIGABRT, Aborted.

  #0  __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/unix/sysv/linux/rais=
e.c:51
  51      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
  [Current thread is 1 (Thread 0x7f34d0411440 (LWP 9418))]
  gdb-peda$ bt
  #0  0x00007f34c8d4ef47 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdep=
s/unix/sysv/linux/raise.c:51
  #1  0x00007f34c8d508b1 in __GI_abort () at abort.c:79
  #2  0x000055d3a2081844 in ohci_frame_boundary (opaque=3D0x55d3a4ecdaf0) a=
t ../hw/usb/hcd-ohci.c:1297
  #3  0x000055d3a25be155 in timerlist_run_timers (timer_list=3D0x55d3a3fd98=
40) at ../util/qemu-timer.c:574
  #4  0x000055d3a25beaba in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUA=
L) at ../util/qemu-timer.c:588
  #5  0x000055d3a25beaba in qemu_clock_run_all_timers () at ../util/qemu-ti=
mer.c:670
  #6  0x000055d3a25e69a1 in main_loop_wait (nonblocking=3D<optimized out>) =
at ../util/main-loop.c:531
  #7  0x000055d3a2433972 in qemu_main_loop () at ../softmmu/vl.c:1678
  #8  0x000055d3a1d0969b in main (argc=3D<optimized out>, argc@entry=3D0x15=
, argv=3D<optimized out>,
      argv@entry=3D0x7ffc6de722a8, envp=3D<optimized out>) at ../softmmu/ma=
in.c:50
  #9  0x00007f34c8d31b97 in __libc_start_main (main=3D
      0x55d3a1d09690 <main>, argc=3D0x15, argv=3D0x7ffc6de722a8, init=3D<op=
timized out>, fini=3D<optimized out>, rtld_fini=3D<optimized out>, stack_en=
d=3D0x7ffc6de72298) at ../csu/libc-start.c:310
  #10 0x000055d3a1d095aa in _start ()
  ```

  To reproduce the assertion failure, please run the QEMU with the
  following command line.

  ```
  [Terminal 1]

  $ qemu-system-i386 -m 512 -drive
  file=3D./fs.img,index=3D1,media=3Ddisk,format=3Draw -drive
  file=3D./hyfuzz.img,index=3D0,media=3Ddisk,format=3Draw -drive
  if=3Dnone,id=3Dstick,file=3D./usbdisk.img,format=3Draw -device pci-ohci,i=
d=3Dusb
  -device usb-storage,bus=3Dusb.0,drive=3Dstick

  [Terminal 2]

  $ ./repro_log ./fs.img ./pci-ohci

  ```

  Please let me know if I can provide any further info.
  -Cheolwoo, Myung (Seoul National University)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904652/+subscriptions

