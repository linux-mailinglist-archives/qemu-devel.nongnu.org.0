Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E073924C127
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 17:03:56 +0200 (CEST)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8m6d-0004kp-V6
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 11:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8m4D-00032D-5W
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:01:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:47216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8m46-0005VB-UC
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:01:24 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8m43-0006Kz-Fd
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:01:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8A6312E810F
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:01:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2020 14:53:29 -0000
From: Thomas Huth <1889411@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 lewurm-gmx
X-Launchpad-Bug-Reporter: Bernhard Urban-Forster (lewurm-gmx)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159602652086.4898.17497826293618974596.malonedeb@soybean.canonical.com>
Message-Id: <159793521039.1928.14865133358229602189.launchpad@wampee.canonical.com>
Subject: [Bug 1889411] Re: RISC-V: Unable to unwind the stack upon signals
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: 42c5abbd77d28d2c53849287775738110ffdaeb7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 10:50:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1889411 <1889411@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1889411

Title:
  RISC-V: Unable to unwind the stack upon signals

Status in QEMU:
  Incomplete

Bug description:
  Consider the following program:

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  #include <stdio.h>
  #include <stdlib.h>

  #define NOINLINE __attribute__ ((noinline))

  void NOINLINE abort_me(void) { abort(); /* trigger SIGABRT */ }

  void NOINLINE level1(void) { abort_me(); }

  void NOINLINE level2(void) { level1(); }

  void NOINLINE level3(void) { level2(); }

  void NOINLINE level4(void) { level3();}

  int main(void) {
  	level4();
  	return 0;
  }
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  $ riscv64-linux-gnu-gcc -march=3Drv64imafdc -O0 -g c.c
  $ qemu-riscv64 -g 31337 ./c &
  $ riscv64-unknown-linux-gnu-gdb -q -ex 'target remote localhost:31337' -e=
x 'b abort_me' -ex c -ex bt ./c
  Reading symbols from c...
  Remote debugging using localhost:31337
  Reading symbols from /home/lewurm/riscv/sysroot/lib/ld-linux-riscv64-lp64=
d.so.1...
  0x0000004000804f30 in _start () from /home/lewurm/riscv/sysroot/lib/ld-li=
nux-riscv64-lp64d.so.1
  Breakpoint 1 at 0x4000000632: file c.c, line 7.
  Continuing.

  Breakpoint 1, abort_me () at c.c:7
  7               abort(); /* trigger SIGABRT */
  #0  abort_me () at c.c:7
  #1  0x0000004000000642 in level1 () at c.c:11
  #2  0x0000004000000658 in level2 () at c.c:15
  #3  0x000000400000066e in level3 () at c.c:19
  #4  0x0000004000000684 in level4 () at c.c:23
  #5  0x000000400000069a in main () at c.c:27
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  So far so good, I get a proper backtrace as expected. If I let the
  signal trigger however, gdb is not able to unwind the stack:

  (gdb) c
  Continuing.

  Program received signal SIGABRT, Aborted.
  0x0000004000858074 in ?? ()
  (gdb) bt
  #0  0x0000004000858074 in ?? ()


  I get the same behaviour for SIGSEGV and SIGILL, I didn't try other
  signals. Apparently this scenario works on real hardware (see linked
  gdb issue below), and presumably it would work with system qemu (I
  haven't tested that yet though). So my guess is that qemu does
  something differently around signal handling than the linux kernel.

  =

  Full reproducer: https://gist.github.com/lewurm/befb9ddf5894bad9628b1df77=
258598b
  RISC-V GDB issue: https://github.com/riscv/riscv-binutils-gdb/issues/223

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1889411/+subscriptions

