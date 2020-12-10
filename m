Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA62D57A2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:58:04 +0100 (CET)
Received: from localhost ([::1]:50296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIi3-0005T4-WF
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knIIQ-0006cj-0e
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:38408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knIIN-00028f-GM
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:33 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knIIC-0000HU-5b
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 28BA72E813A
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:16:40 -0000
From: Thomas Huth <1680991@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hobbyos philmd pmaydell th-huth
X-Launchpad-Bug-Reporter: Adam Clark (hobbyos)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170408001403.30529.99444.malonedeb@soybean.canonical.com>
Message-Id: <160759180030.11845.2013373169652660927.malone@wampee.canonical.com>
Subject: [Bug 1680991] Re: raspi2: system timer device not implemented
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 9e80466d16139c8f680cce51c30d6fc4f0baba0d
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
Reply-To: Bug 1680991 <1680991@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1680991

Title:
  raspi2: system timer device not implemented

Status in QEMU:
  Fix Released

Bug description:
  In a small hobby kernel for Raspberry Pi 2B, I am using the system
  timer to control wait durations.  This timer is located at 0x3f003000
  and the timer counts are located at 0x3f003004 (CLO) and 0x3f004008
  (CHI).  Reading these memory locations returns 0 for both.

  The basic code for this function is:
  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @@ uint64_t ReadSysTimerCount() -- read the system time running count
  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ReadSysTimerCount:
  	ldr	r0,=3DST_CLO                  @ load the base address of the system =
timer
  	ldrd	r0,r1,[r0]                  @ Get the 64-bit timer "count" into r1:=
r0
  	mov	pc,lr			    @ return

  Tracing back the definition of ST_CLO in my code:
  #define ST_CLO              (ST_BASE+4)                 // Counter Lower =
32 bits
  #define ST_BASE             (HW_BASE+0x3000)            // System Timer b=
ase address
  #define HW_BASE             (0x3f000000)                // this is the ba=
se address for all hardware I/O addresses

  I have tested a similar program that I know to work on real hardware
  with qemu-system-arm reading the same mmio register and have the same
  issue, so I'm pretty sure the issue is not with my code.

  My Host PC is a VM on vmWare esxi running FC25 (8 cores, 8GB RAM): =

  [adam@os-dev ~]$ uname -a
  Linux os-dev.jammin 4.10.8-200.fc25.x86_64 #1 SMP Fri Mar 31 13:20:22 UTC=
 2017 x86_64 x86_64 x86_64 GNU/Linux

  I have confirmed this issue on QEMU 2.7.1 (fc25 Distro) and 2.9.0-rc3
  (git).

  adam@os-dev ~]$ qemu-system-arm --version
  QEMU emulator version 2.7.1(qemu-2.7.1-4.fc25), Copyright (c) 2003-2016 F=
abrice Bellard and the QEMU Project developers

  [adam@os-dev ~]$ ./workspace/qemu/bin/debug/native/arm-softmmu/qemu-syste=
m-arm --version
  QEMU emulator version 2.8.93 (v2.9.0-rc3-15-g5daf9b3)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  A remote debugger for my kernel shows the following:
  (gdb) info reg
  r0             0x0	0
  r1             0x0	0
  r2             0x96	150
  r3             0x0	0
  r4             0xa000	40960
  r5             0x0	0
  r6             0x0	0
  r7             0x0	0
  r8             0x0	0
  r9             0xa000	40960
  r10            0x0	0
  r11            0x7fdc	32732
  r12            0x0	0
  sp             0x7fc8	0x7fc8
  lr             0x8194	33172
  pc             0x80a4	0x80a4
  cpsr           0x800001d3	-2147483181
  (gdb) stepi
  0x000080a8 in ?? ()
  (gdb) info reg
  r0             0x3f003004	1056976900
  r1             0x0	0
  r2             0x96	150
  r3             0x0	0
  r4             0xa000	40960
  r5             0x0	0
  r6             0x0	0
  r7             0x0	0
  r8             0x0	0
  r9             0xa000	40960
  r10            0x0	0
  r11            0x7fdc	32732
  r12            0x0	0
  sp             0x7fc8	0x7fc8
  lr             0x8194	33172
  pc             0x80a8	0x80a8
  cpsr           0x800001d3	-2147483181
  (gdb) stepi
  0x000080ac in ?? ()
  (gdb) info reg
  r0             0x0	0
  r1             0x0	0
  r2             0x96	150
  r3             0x0	0
  r4             0xa000	40960
  r5             0x0	0
  r6             0x0	0
  r7             0x0	0
  r8             0x0	0
  r9             0xa000	40960
  r10            0x0	0
  r11            0x7fdc	32732
  r12            0x0	0
  sp             0x7fc8	0x7fc8
  lr             0x8194	33172
  pc             0x80ac	0x80ac
  cpsr           0x800001d3	-2147483181

  Notice r0 is loaded with the address for CLO and then cleared with 0
  when read.

  I am writing my code against the documented specifications in "BCM2835
  ARM Peripherals" (attached for convenience), section "12 System
  Timer".

  =

  Please let me know if you need anything else from me.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1680991/+subscriptions

