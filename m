Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556DB308994
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:39:02 +0100 (CET)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5UvN-0000Pi-D0
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5UsE-0007WO-0S
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:35:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:56088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5UsB-0005qS-VY
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:35:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l5Us7-0005so-4Z
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 14:35:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 202A72E8089
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 14:35:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Jan 2021 14:29:05 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1911216@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr hades0506
X-Launchpad-Bug-Reporter: Gaoning Pan (hades0506)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161046678346.29947.74345360490259273.malonedeb@chaenomeles.canonical.com>
Message-Id: <161193054632.32468.10808357750649183175.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1911216] Re: abort issue locates in
 hw/usb/hcd-ohci.c:1297:ohci_frame_boundary
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 03e723a2bde98131aac2a6b14f857a89bbf87eb8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1911216 <1911216@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: fuzzer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911216

Title:
  abort issue locates in hw/usb/hcd-ohci.c:1297:ohci_frame_boundary

Status in QEMU:
  New

Bug description:
  Hello,

  I found an assertion failure in hw/usb/hcd-ohci.c:1297

  This was found in latest version 5.2.0.

  my reproduced environment is as follows:
      Host: ubuntu 18.04
      Guest: ubuntu 18.04

  QEMU boot command line:
  qemu-system-x86_64 -enable-kvm -boot c -m 4G -drive format=3Dqcow2,file=
=3D./ubuntu.img -nic user,hostfwd=3Dtcp:0.0.0.0:5555-:22 -display none -dev=
ice pci-ohci,id=3Dohci -device usb-tablet,bus=3Dohci.0,port=3D1,id=3Dusbdev1

  =

  backtrace is as follows =

  pwndbg> bt
  #0  0x00007fdf392aa438 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/=
unix/sysv/linux/raise.c:54
  #1  0x00007fdf392ac03a in __GI_abort () at abort.c:89
  #2  0x000055c613721118 in ohci_frame_boundary (opaque=3D0x6270000191f0) a=
t hw/usb/hcd-ohci.c:1297
  #3  0x000055c6140bdf0e in timerlist_run_timers (timer_list=3D0x60b00005bc=
c0) at util/qemu-timer.c:572
  #4  0x000055c6140be15a in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUA=
L) at util/qemu-timer.c:586
  #5  0x000055c6140beac7 in qemu_clock_run_all_timers () at util/qemu-timer=
.c:672
  #6  0x000055c6140a1938 in main_loop_wait (nonblocking=3D0) at util/main-l=
oop.c:523
  #7  0x000055c6125d87e9 in qemu_main_loop () at /home/dell/qemu5-hyperviso=
r/vm/fuzz-seedpool/hcd-ohci/qemu-5.1.0/softmmu/vl.c:1676
  #8  0x000055c613f216ea in main (argc=3D7, argv=3D0x7fff174cdd28, envp=3D0=
x7fff174cdd68) at /home/dell/qemu5-hypervisor/vm/fuzz-seedpool/hcd-ohci/qem=
u-5.1.0/softmmu/main.c:49
  #9  0x00007fdf39295840 in __libc_start_main (main=3D0x55c613f21699 <main>=
, argc=3D7, argv=3D0x7fff174cdd28, init=3D<optimized out>, fini=3D<optimize=
d out>, rtld_fini=3D<optimized out>, stack_end=3D0x7fff174cdd18) at ../csu/=
libc-start.c:291
  #10 0x000055c6120a4349 in _start ()

  The poc is attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1911216/+subscriptions

