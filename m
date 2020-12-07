Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEE2D0A9B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 07:17:35 +0100 (CET)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km9q1-0001HR-Um
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 01:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1km9oK-0000qT-44
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 01:15:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:45258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1km9oF-0007ag-7t
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 01:15:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1km9oD-0006iL-5s
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 06:15:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 28CDD2E8137
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 06:15:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Dec 2020 06:07:14 -0000
From: Gaoning Pan <1907042@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hades0506
X-Launchpad-Bug-Reporter: Gaoning Pan (hades0506)
X-Launchpad-Bug-Modifier: Gaoning Pan (hades0506)
Message-Id: <160732123417.11736.2125519707622289865.malonedeb@soybean.canonical.com>
Subject: [Bug 1907042] [NEW] assert issue locates in hw/usb/core.c:727:
 usb_ep_get: Assertion `pid == USB_TOKEN_IN || pid == USB_TOKEN_OUT' failed 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="15cd58601e77a273f7390fc4f4fcd16efe814a43"; Instance="production"
X-Launchpad-Hash: bdf2a09d836dbeb48b89ee78c923c09212d5da03
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1907042 <1907042@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,

An assertion failure was found in hw/usb/core.c:727 in latest version
5.2.0.

Reproduced environment is as follows:
    Host: ubuntu 18.04
    Guest: ubuntu 18.04

QEMU boot command line:
qemu-system-x86_64 -enable-kvm -boot c -m 4G -drive format=3Dqcow2,file=3D.=
/ubuntu.img -nic user,hostfwd=3Dtcp:0.0.0.0:5555-:22 -device pci-ohci,id=3D=
ohci -device usb-tablet,bus=3Dohci.0,port=3D1,id=3Dusbdev1 -trace usb\*

Backtrace is as follows:
#0  0x00007f13fff14438 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/un=
ix/sysv/linux/raise.c:54
#1  0x00007f13fff1603a in __GI_abort () at abort.c:89
#2  0x00007f13fff0cbe7 in __assert_fail_base (fmt=3D<optimized out>, assert=
ion=3Dassertion@entry=3D0x55f97745ffe0 "pid =3D=3D USB_TOKEN_IN || pid =3D=
=3D USB_TOKEN_OUT", file=3Dfile@entry=3D0x55f97745f6c0 "../hw/usb/core.c", =
line=3Dline@entry=3D727, function=3Dfunction@entry=3D0x55f9774606e0 <__PRET=
TY_FUNCTION__.22877> "usb_ep_get") at assert.c:92
#3  0x00007f13fff0cc92 in __GI___assert_fail (assertion=3D0x55f97745ffe0 "p=
id =3D=3D USB_TOKEN_IN || pid =3D=3D USB_TOKEN_OUT", file=3D0x55f97745f6c0 =
"../hw/usb/core.c", line=3D727, function=3D0x55f9774606e0 <__PRETTY_FUNCTIO=
N__.22877> "usb_ep_get") at assert.c:101
#4  0x000055f975bfc9b2 in usb_ep_get (dev=3D0x62300000c500, pid=3D45, ep=3D=
1) at ../hw/usb/core.c:727
#5  0x000055f975f945db in ohci_service_td (ohci=3D0x6270000191f0, ed=3D0x7f=
fcd9308410) at ../hw/usb/hcd-ohci.c:1044
#6  0x000055f975f95d5e in ohci_service_ed_list (ohci=3D0x6270000191f0, head=
=3D857580576, completion=3D0) at ../hw/usb/hcd-ohci.c:1200
#7  0x000055f975f9656d in ohci_process_lists (ohci=3D0x6270000191f0, comple=
tion=3D0) at ../hw/usb/hcd-ohci.c:1238
#8  0x000055f975f9725c in ohci_frame_boundary (opaque=3D0x6270000191f0) at =
../hw/usb/hcd-ohci.c:1281
#9  0x000055f977212494 in timerlist_run_timers (timer_list=3D0x60b00005b060=
) at ../util/qemu-timer.c:574
#10 0x000055f9772126db in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUAL)=
 at ../util/qemu-timer.c:588
#11 0x000055f977212fde in qemu_clock_run_all_timers () at ../util/qemu-time=
r.c:670
#12 0x000055f9772d5717 in main_loop_wait (nonblocking=3D0) at ../util/main-=
loop.c:531
#13 0x000055f97695100c in qemu_main_loop () at ../softmmu/vl.c:1677
#14 0x000055f9758f7601 in main (argc=3D16, argv=3D0x7ffcd9308888, envp=3D0x=
7ffcd9308910) at ../softmmu/main.c:50
#15 0x00007f13ffeff840 in __libc_start_main (main=3D0x55f9758f75b0 <main>, =
argc=3D16, argv=3D0x7ffcd9308888, init=3D<optimized out>, fini=3D<optimized=
 out>, rtld_fini=3D<optimized out>, stack_end=3D0x7ffcd9308878) at ../csu/l=
ibc-start.c:291
#16 0x000055f9758f74a9 in _start ()


The poc is attached.

Thanks.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "usb_ep_get-assert.zip"
   https://bugs.launchpad.net/bugs/1907042/+attachment/5441571/+files/usb_e=
p_get-assert.zip

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907042

Title:
  assert issue locates in hw/usb/core.c:727: usb_ep_get: Assertion `pid
  =3D=3D USB_TOKEN_IN || pid =3D=3D USB_TOKEN_OUT' failed

Status in QEMU:
  New

Bug description:
  Hello,

  An assertion failure was found in hw/usb/core.c:727 in latest version
  5.2.0.

  Reproduced environment is as follows:
      Host: ubuntu 18.04
      Guest: ubuntu 18.04

  QEMU boot command line:
  qemu-system-x86_64 -enable-kvm -boot c -m 4G -drive format=3Dqcow2,file=
=3D./ubuntu.img -nic user,hostfwd=3Dtcp:0.0.0.0:5555-:22 -device pci-ohci,i=
d=3Dohci -device usb-tablet,bus=3Dohci.0,port=3D1,id=3Dusbdev1 -trace usb\*

  Backtrace is as follows:
  #0  0x00007f13fff14438 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/=
unix/sysv/linux/raise.c:54
  #1  0x00007f13fff1603a in __GI_abort () at abort.c:89
  #2  0x00007f13fff0cbe7 in __assert_fail_base (fmt=3D<optimized out>, asse=
rtion=3Dassertion@entry=3D0x55f97745ffe0 "pid =3D=3D USB_TOKEN_IN || pid =
=3D=3D USB_TOKEN_OUT", file=3Dfile@entry=3D0x55f97745f6c0 "../hw/usb/core.c=
", line=3Dline@entry=3D727, function=3Dfunction@entry=3D0x55f9774606e0 <__P=
RETTY_FUNCTION__.22877> "usb_ep_get") at assert.c:92
  #3  0x00007f13fff0cc92 in __GI___assert_fail (assertion=3D0x55f97745ffe0 =
"pid =3D=3D USB_TOKEN_IN || pid =3D=3D USB_TOKEN_OUT", file=3D0x55f97745f6c=
0 "../hw/usb/core.c", line=3D727, function=3D0x55f9774606e0 <__PRETTY_FUNCT=
ION__.22877> "usb_ep_get") at assert.c:101
  #4  0x000055f975bfc9b2 in usb_ep_get (dev=3D0x62300000c500, pid=3D45, ep=
=3D1) at ../hw/usb/core.c:727
  #5  0x000055f975f945db in ohci_service_td (ohci=3D0x6270000191f0, ed=3D0x=
7ffcd9308410) at ../hw/usb/hcd-ohci.c:1044
  #6  0x000055f975f95d5e in ohci_service_ed_list (ohci=3D0x6270000191f0, he=
ad=3D857580576, completion=3D0) at ../hw/usb/hcd-ohci.c:1200
  #7  0x000055f975f9656d in ohci_process_lists (ohci=3D0x6270000191f0, comp=
letion=3D0) at ../hw/usb/hcd-ohci.c:1238
  #8  0x000055f975f9725c in ohci_frame_boundary (opaque=3D0x6270000191f0) a=
t ../hw/usb/hcd-ohci.c:1281
  #9  0x000055f977212494 in timerlist_run_timers (timer_list=3D0x60b00005b0=
60) at ../util/qemu-timer.c:574
  #10 0x000055f9772126db in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUA=
L) at ../util/qemu-timer.c:588
  #11 0x000055f977212fde in qemu_clock_run_all_timers () at ../util/qemu-ti=
mer.c:670
  #12 0x000055f9772d5717 in main_loop_wait (nonblocking=3D0) at ../util/mai=
n-loop.c:531
  #13 0x000055f97695100c in qemu_main_loop () at ../softmmu/vl.c:1677
  #14 0x000055f9758f7601 in main (argc=3D16, argv=3D0x7ffcd9308888, envp=3D=
0x7ffcd9308910) at ../softmmu/main.c:50
  #15 0x00007f13ffeff840 in __libc_start_main (main=3D0x55f9758f75b0 <main>=
, argc=3D16, argv=3D0x7ffcd9308888, init=3D<optimized out>, fini=3D<optimiz=
ed out>, rtld_fini=3D<optimized out>, stack_end=3D0x7ffcd9308878) at ../csu=
/libc-start.c:291
  #16 0x000055f9758f74a9 in _start ()

  =

  The poc is attached.

  Thanks.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907042/+subscriptions

