Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54F7AD37
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 18:05:41 +0200 (CEST)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsUdA-0001pM-G8
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 12:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48979)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hsUYk-0004Qx-RE
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:01:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hsUYj-000507-8i
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:01:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:60752)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hsUYj-0004zm-3W
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:01:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hsUYh-0002fp-Hp
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 16:01:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 845422E80CB
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 16:01:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jul 2019 15:55:19 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andrew-randrianasulu rth
X-Launchpad-Bug-Reporter: Andrew Randrianasulu (andrew-randrianasulu)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <156345756915.8493.13426435768891424211.malonedeb@chaenomeles.canonical.com>
Message-Id: <156450211942.27014.5269484293761053696.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19012";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: a552578cd40125b18ef3f31d914ec149440368e5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1837049] Re: qemu-system-ppc segfaults with
 -display sdl
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
Reply-To: Bug 1837049 <1837049@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Works for me with a 32-bit install of fedora 30.
That's using gcc 9.1.1.

Is building with -Og required to reproduce this?
If so, I'm thinking compiler bug...

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837049

Title:
  qemu-system-ppc segfaults with -display sdl

Status in QEMU:
  New

Bug description:
  Hello.

  I was trying to debug this segfault:
  https://lists.nongnu.org/archive/html/qemu-ppc/2019-07/msg00186.html

  I recompiled latest qemu from git (commit 0b18cfb8f1828c905139b54c8644b0d=
8f4aad879 ), using this configure line:
  ./configure --target-list=3Di386-softmmu,x86_64-softmmu,ppc-softmmu --aud=
io-drv-list=3Dalsa --disable-werror --extra-cflags=3D"-Og" --enable-debug-t=
cg

  after this I tried original line under gdb, it was still segfaulting:

  --------------copy-----------------
  gdb ./ppc-softmmu/qemu-system-ppc
  GNU gdb (GDB) 7.11.1
  Copyright (C) 2016 Free Software Foundation, Inc.
  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.h=
tml>
  This is free software: you are free to change and redistribute it.
  There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
  and "show warranty" for details.
  This GDB was configured as "i586-slackware-linux".
  Type "show configuration" for configuration details.
  For bug reporting instructions, please see:
  <http://www.gnu.org/software/gdb/bugs/>.
  Find the GDB manual and other documentation resources online at:
  <http://www.gnu.org/software/gdb/documentation/>.
  For help, type "help".
  Type "apropos word" to search for commands related to "word"...
  Reading symbols from ./ppc-softmmu/qemu-system-ppc...done.
  warning: File "/dev/shm/qemu/.gdbinit" auto-loading has been declined by =
your `auto-load safe-path' set to "$debugdir:$datadir/auto-load".
  To enable execution of this file add
          add-auto-load-safe-path /dev/shm/qemu/.gdbinit
  line to your configuration file "/home/guest/.gdbinit".
  To completely disable this security protection add
          set auto-load safe-path /
  line to your configuration file "/home/guest/.gdbinit".
  For more information about this security protection see the
  "Auto-loading safe path" section in the GDB manual.  E.g., run from the s=
hell:
          info "(gdb)Auto-loading safe path"
  (gdb) run  -M mac99,via=3Dpmu -L ../queue-vga/pc-bios -cdrom /mnt/sdb1/PP=
C-img/lubuntu-16.04-desktop-powerpc.iso -m 512 -display sdl,gl=3Don -vga st=
d -d guest_errors,unimp -boot d -cpu G4 -g 1024x768x24 -device ES1370
  Starting program: /dev/shm/qemu/ppc-softmmu/qemu-system-ppc -M mac99,via=
=3Dpmu -L ../queue-vga/pc-bios -cdrom /mnt/sdb1/PPC-img/lubuntu-16.04-deskt=
op-powerpc.iso -m 512 -display sdl,gl=3Don -vga std -d guest_errors,unimp -=
boot d -cpu G4 -g 1024x768x24 -device ES1370
  [Thread debugging using libthread_db enabled]
  Using host libthread_db library "/lib/libthread_db.so.1".
  [New Thread 0xf560cb40 (LWP 8100)]
  [New Thread 0xf4c1ab40 (LWP 8101)]
  [New Thread 0xec1b7b40 (LWP 8102)]
  [New Thread 0xc5821b40 (LWP 8104)]
  [Thread 0xf4c1ab40 (LWP 8101) exited]
  [New Thread 0xf4c1ab40 (LWP 8119)]

  Thread 4 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
  [Switching to Thread 0xec1b7b40 (LWP 8102)]
  0xf26c2e44 in code_gen_buffer ()
  (gdb) bt full
  #0  0xffffffff in code_gen_buffer ()
  #1  0x56710cf6 in cpu_exec (itb=3D<optimized out>, cpu=3D<optimized out>)=
 at /dev/shm/qemu/accel/tcg/cpu-exec.c:173
          env =3D <optimized out>
          ret =3D <optimized out>
          last_tb =3D <optimized out>
          tb_exit =3D <optimized out>
          tb_ptr =3D 0xf26c2cc0 <code_gen_buffer+103976094> "=E2=80=B9]=D1=
=88=E2=80=A6=D0=AB\017=D0=8A=D0=91\020"
          ret =3D 0
          insns_left =3D <optimized out>
          cflags =3D <optimized out>
          tb =3D 0x5722fe58
          last_tb =3D <optimized out>
          tb_exit =3D <optimized out>
          cc =3D <optimized out>
          __func__ =3D "cpu_exec"
          ret =3D <optimized out>
          sc =3D <optimized out>
  #2  0x56710cf6 in cpu_exec (tb_exit=3D<synthetic pointer>, last_tb=3D<syn=
thetic pointer>, tb=3D<optimized out>, cpu=3D<optimized out>) at /dev/shm/q=
emu/accel/tcg/cpu-exec.c:621
          ret =3D 0
          insns_left =3D <optimized out>
          cflags =3D <optimized out>
          tb =3D 0x5722fe58
          last_tb =3D <optimized out>
          tb_exit =3D <optimized out>
          cc =3D <optimized out>
          __func__ =3D "cpu_exec"
          ret =3D <optimized out>
          sc =3D <optimized out>
  #3  0x56710cf6 in cpu_exec (cpu=3D0x573db8f8) at /dev/shm/qemu/accel/tcg/=
cpu-exec.c:732
          cflags =3D <optimized out>
          tb =3D 0x5722fe58
          last_tb =3D <optimized out>
          tb_exit =3D <optimized out>
          cc =3D <optimized out>
          __func__ =3D "cpu_exec"
          ret =3D <optimized out>
          sc =3D <optimized out>
  #4  0x566cfade in tcg_cpu_exec (cpu=3D0x573db8f8) at /dev/shm/qemu/cpus.c=
:1435
          ret =3D <optimized out>
  #5  0x566d1e6d in qemu_tcg_rr_cpu_thread_fn (arg=3D0x573db8f8) at /dev/sh=
m/qemu/cpus.c:1537
          r =3D <optimized out>
          cpu =3D 0x573db8f8
          __PRETTY_FUNCTION__ =3D "qemu_tcg_rr_cpu_thread_fn"
  #6  0x56b56fe0 in qemu_thread_start (args=3D0x57400668) at util/qemu-thre=
ad-posix.c:502
          __cancel_buf =3D {__cancel_jmp_buf =3D {{__cancel_jmp_buf =3D {14=
61911128, 1463813736, 1461911128, -333745816, 247778263, 1392237730}, __mas=
k_was_saved =3D 0}}, __pad =3D {0xec1b70d0, 0x0, 0x0, 0x0}}
          __cancel_routine =3D 0x56b57040 <qemu_thread_atexit_notify>
          __not_first_call =3D <optimized out>
          qemu_thread_args =3D 0x57400668
          start_routine =3D 0x566d1a30 <qemu_tcg_rr_cpu_thread_fn>
          arg =3D 0x573db8f8
          r =3D <optimized out>
  #7  0xffffffff in start_thread () at /lib/libpthread.so.0
  #8  0xffffffff in clone () at /lib/libc.so.6
  (gdb) quit
  A debugging session is active.

          Inferior 1 [process 8096] will be killed.

  Quit anyway? (y or n) y
  --------------copy end----------

  But when I take away -display sdl, or replace it with -display gtk -
  same line was booting to desktop!

  Changing cpu to G3 also allowed boot:

  ./ppc-softmmu/qemu-system-ppc -M mac99,via=3Dpmu -L ../queue-vga/pc-bios
  -cdrom /mnt/sdb1/PPC-img/lubuntu-16.04-desktop-powerpc.iso -m 512
  -display sdl -vga std -d guest_errors,unimp -boot d -cpu G3 -g
  1024x768x24 -device ES1370

  This is 32-bit qemu complied with Slackware's gcc 5.5.0. =

  64-bit qemu works fine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837049/+subscriptions

