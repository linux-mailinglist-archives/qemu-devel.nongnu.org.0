Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4346F669
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 00:35:44 +0200 (CEST)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpKQh-0005lC-E8
	for lists+qemu-devel@lfdr.de; Sun, 21 Jul 2019 18:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hpKQU-0005MC-NZ
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 18:35:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hpKQT-0006dj-F4
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 18:35:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:35816)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hpKQT-0006cl-7i
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 18:35:29 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hpKQR-0008Cy-EK
 for <qemu-devel@nongnu.org>; Sun, 21 Jul 2019 22:35:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 67E432E804C
 for <qemu-devel@nongnu.org>; Sun, 21 Jul 2019 22:35:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Jul 2019 22:25:46 -0000
From: Gergely Kis <1818937@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: crash hvf macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bwibking cuser2 kisg roolebo
X-Launchpad-Bug-Reporter: Chen Zhang (cuser2)
X-Launchpad-Bug-Modifier: Gergely Kis (kisg)
References: <155192472106.28960.15645485731508389788.malonedeb@chaenomeles.canonical.com>
Message-Id: <156374794653.17989.9941695161724116092.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: d6ff35fd92cbd4429148f7782ca224422b1a8407
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1818937] Re: Crash with HV_ERROR on macOS host
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
Reply-To: Bug 1818937 <1818937@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can reproduce this problem with Linux guests as well (running 4.15
Ubuntu Xenial and 4.14 Android kernels). Mac models with integrated GPU
seem to be more affected according to our testing, and the crash does
not always occur, needs multiple tries to be triggered. We would be
happy to assist in debugging, once you have a patch that can generate
more detailed logs.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1818937

Title:
  Crash with HV_ERROR on macOS host

Status in QEMU:
  New

Bug description:
  On macOS host running Windows 10 guest, qemu crashed with error
  message: Error: HV_ERROR.

  Host: macOS Mojave 10.14.3 (18D109) Late 2014 Mac mini presumably Core i5=
 4278U.
  QEMU: git commit a3e3b0a7bd5de211a62cdf2d6c12b96d3c403560
  QEMU parameter: qemu-system-x86_64 -m 3000 -drive file=3Ddisk.img,if=3Dvi=
rtio,discard=3Dunmap -accel hvf -soundhw hda -smp 3

  thread list
  Process 56054 stopped
    thread #1: tid =3D 0x2ffec8, 0x00007fff48d0805a vImage`vLookupTable_Pla=
nar16 + 970, queue =3D 'com.apple.main-thread'
    thread #2: tid =3D 0x2ffecc, 0x00007fff79d6d7de libsystem_kernel.dylib`=
__psynch_cvwait + 10
    thread #3: tid =3D 0x2ffecd, 0x00007fff79d715aa libsystem_kernel.dylib`=
__select + 10
    thread #4: tid =3D 0x2ffece, 0x00007fff79d71d9a libsystem_kernel.dylib`=
__sigwait + 10
  * thread #6: tid =3D 0x2ffed0, 0x00007fff79d7023e libsystem_kernel.dylib`=
__pthread_kill + 10, stop reason =3D signal SIGABRT
    thread #7: tid =3D 0x2ffed1, 0x00007fff79d6d7de libsystem_kernel.dylib`=
__psynch_cvwait + 10
    thread #8: tid =3D 0x2ffed2, 0x00007fff79d6d7de libsystem_kernel.dylib`=
__psynch_cvwait + 10
    thread #11: tid =3D 0x2fff34, 0x00007fff79d6a17a libsystem_kernel.dylib=
`mach_msg_trap + 10, name =3D 'com.apple.NSEventThread'
    thread #30: tid =3D 0x300c04, 0x00007fff79e233f8 libsystem_pthread.dyli=
b`start_wqthread
    thread #31: tid =3D 0x300c16, 0x00007fff79e233f8 libsystem_pthread.dyli=
b`start_wqthread
    thread #32: tid =3D 0x300c17, 0x0000000000000000
    thread #33: tid =3D 0x300c93, 0x00007fff79d6d7de libsystem_kernel.dylib=
`__psynch_cvwait + 10

  =

  Crashed thread:

  * thread #6, stop reason =3D signal SIGABRT
    * frame #0: 0x00007fff79d7023e libsystem_kernel.dylib`__pthread_kill + =
10
      frame #1: 0x00007fff79e26c1c libsystem_pthread.dylib`pthread_kill + 2=
85
      frame #2: 0x00007fff79cd91c9 libsystem_c.dylib`abort + 127
      frame #3: 0x000000010baa476d qemu-system-x86_64`assert_hvf_ok(ret=3D<=
unavailable>) at hvf.c:106 [opt]
      frame #4: 0x000000010baa4c8f qemu-system-x86_64`hvf_vcpu_exec(cpu=3D0=
x00007f8e5283de00) at hvf.c:681 [opt]
      frame #5: 0x000000010b988423 qemu-system-x86_64`qemu_hvf_cpu_thread_f=
n(arg=3D0x00007f8e5283de00) at cpus.c:1636 [opt]
      frame #6: 0x000000010bd9dfce qemu-system-x86_64`qemu_thread_start(arg=
s=3D<unavailable>) at qemu-thread-posix.c:502 [opt]
      frame #7: 0x00007fff79e24305 libsystem_pthread.dylib`_pthread_body + =
126
      frame #8: 0x00007fff79e2726f libsystem_pthread.dylib`_pthread_start +=
 70
      frame #9: 0x00007fff79e23415 libsystem_pthread.dylib`thread_start + 13

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1818937/+subscriptions

