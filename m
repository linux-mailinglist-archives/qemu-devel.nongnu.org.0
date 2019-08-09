Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF6287E0B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 17:32:13 +0200 (CEST)
Received: from localhost ([::1]:60112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw6sG-000302-14
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 11:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48739)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hw6qn-0001nV-NV
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hw6qm-0008Ub-Ie
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:30:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:37768)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hw6qm-0008PE-CT
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:30:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hw6ql-0007N4-6o
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 15:30:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 145A22E80C7
 for <qemu-devel@nongnu.org>; Fri,  9 Aug 2019 15:30:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Aug 2019 15:21:28 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz pmaydell
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156518306048.32528.10373743991208371347.malonedeb@chaenomeles.canonical.com>
Message-Id: <156536408863.17199.13601722900620267805.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19021";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e240afbf6e7b0d4442b0b21bf3a88b972d9e58de
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1839325] Re: Go programs crash on qemu-sh4 due to
 issues with atomics
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
Reply-To: Bug 1839325 <1839325@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The immediate cause of the crash here is that the runtime invokes the
Load64() function on a pointer that isn't 8-aligned, which triggers a
hand-coded check-and-panic in the libgo code. I haven't yet tracked down
where that pointer came from.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1839325

Title:
  Go programs crash on qemu-sh4 due to issues with atomics

Status in QEMU:
  New

Bug description:
  After #1738545 [1] was fixed, Go applications work fine on qemu-arm
  but still crash on qemu-sh4. From the backtrace, it looks like an
  issue with the atomics in qemu-sh4:

  (sid-sh4-sbuild)root@epyc:/# cat hello.go
  package main

  import "fmt"

  func main() {
        fmt.Println("hello world")
  }

  (sid-sh4-sbuild)root@epyc:/# gccgo-9 hello.go -o hello
  (sid-sh4-sbuild)root@epyc:/# ./hello =

  panic: (        runtime runtime.errorString) (0x7f74527c,0x80a038)
  fatal error: panic on system stack
  panic: (        runtime runtime.errorString) (0x7f74527c,0x80a038)
  fatal error: panic on system stack

  runtime stack:
  runtime..z2finternal..z2fatomic.Load64
          ../../../src/libgo/go/runtime/internal/atomic/atomic.c:37
  runtime_mstart
          ../../../src/libgo/runtime/proc.c:596

  goroutine 1 [running]:
          goroutine running on other thread; stack unavailable

  runtime stack:
  runtime..z2finternal..z2fatomic.Load64
          ../../../src/libgo/go/runtime/internal/atomic/atomic.c:37
  runtime_mstart
          ../../../src/libgo/runtime/proc.c:596
  (sid-sh4-sbuild)root@epyc:/#

  The same sample Go program runs fine on my SH7785LCR SH4 evaluation
  board:

  root@tirpitz:~> uname -a
  Linux tirpitz 3.16.7-ckt7 #8 PREEMPT Fri Oct 21 18:47:41 CEST 2016 sh4a G=
NU/Linux
  root@tirpitz:~> cat hello.go
  package main

  import "fmt"

  func main() {
        fmt.Println("hello world")
  }

  root@tirpitz:~> gccgo-9 hello.go -o hello
  root@tirpitz:~> ./hello =

  hello world
  root@tirpitz:~>

  Please note: In order to be able to reproduce this, one also needs to
  revert commit 61dedf2af7 [2], otherwise the Go application crashes
  differently:

  (sid-sh4-sbuild)root@epyc:/# ./hello        =

  Unhandled trap: 0x180
  pc=3D0x7e5f7f9e sr=3D0x00000000 pr=3D0x7ee3d582 fpscr=3D0x00080004
  spc=3D0x00000000 ssr=3D0x00000000 gbr=3D0x7e590480 vbr=3D0x00000000
  sgr=3D0x00000000 dbr=3D0x00000000 delayed_pc=3D0x7e5f7f60 fpul=3D0x00034f=
3b
  r0=3D0x008007d4 r1=3D0x00000000 r2=3D0xfffe0b2a r3=3D0x00000002
  r4=3D0x008006e4 r5=3D0x00872000 r6=3D0x00200000 r7=3D0x00000000
  r8=3D0x7f7bca7c r9=3D0x7fffebd4 r10=3D0x00800480 r11=3D0x7f7bc0f0
  r12=3D0x7f7a3fa4 r13=3D0x008004c0 r14=3D0x7f7b2238 r15=3D0x7fffebd0
  r16=3D0x00000000 r17=3D0x00000000 r18=3D0x00000000 r19=3D0x00000000
  r20=3D0x00000000 r21=3D0x00000000 r22=3D0x00000000 r23=3D0x00000000
  (sid-sh4-sbuild)root@epyc:/#

  > [1] https://bugs.launchpad.net/bugs/1738545
  > [2] https://bugs.launchpad.net/bugs/1796520

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1839325/+subscriptions

