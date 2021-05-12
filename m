Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57FC37BBBC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:27:21 +0200 (CEST)
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgn1M-00060W-Nr
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgn02-0004c8-UT
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgn01-0007pI-1J
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgmzx-0003z9-MY
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 23B282E8189
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 11:20:02 -0000
From: Thomas Huth <1911216@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr hades0506 th-huth
X-Launchpad-Bug-Reporter: Gaoning Pan (hades0506)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161046678346.29947.74345360490259273.malonedeb@chaenomeles.canonical.com>
Message-Id: <162081840220.30850.5025088053443478596.malone@gac.canonical.com>
Subject: [Bug 1911216] Re: abort issue locates in
 hw/usb/hcd-ohci.c:1297:ohci_frame_boundary
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 8012871b2c018b661a2ad021e985f39453afc534
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1911216 <1911216@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi! Can you still reproduce this issue with QEMU v6.0 ? At least
Alexander's reproducer does not seem to trigger this issue anymore...

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911216

Title:
  abort issue locates in hw/usb/hcd-ohci.c:1297:ohci_frame_boundary

Status in QEMU:
  Incomplete

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

