Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B5381143
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:56:51 +0200 (CEST)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdvW-0001Cv-V2
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhduk-0000Xz-Uw
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:56:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:49298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdug-0005RH-Rn
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:56:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdue-0006mc-IU
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:55:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 209092E81D0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:55:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:50:27 -0000
From: Bruno Haible <1705118@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bruno-clisp pmaydell th-huth
X-Launchpad-Bug-Reporter: Bruno Haible (bruno-clisp)
X-Launchpad-Bug-Modifier: Bruno Haible (bruno-clisp)
References: <150041005567.6544.17518405784140614257.malonedeb@gac.canonical.com>
Message-Id: <162102182757.7659.15808595341048282766.malone@gac.canonical.com>
Subject: [Bug 1705118] Re: qemu user mode: rt signals not implemented for
 sparc guests
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 0ca0577ae20503a3aab348bfc1f8016d7b759022
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1705118 <1705118@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The situation in version 6.0.0 is the same as in version 2.11.0: The
cases ppc, ppc64, ppc64le, s390x are fixed, but the sparc64 executable
still crashes.

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1705118

Title:
  qemu user mode: rt signals not implemented for sparc guests

Status in QEMU:
  New

Bug description:
  The documentation
  <https://qemu.weilnetz.de/doc/qemu-doc.html#Features> says that
  qemu in user mode supports POSIX signal handling.

  Catching SIGSEGV according to POSIX, however, does not work on
    ppc, ppc64, ppc64le, s390x, sparc64.
  It does work, however, on
    aarch64, alpha, arm, hppa, m68k, mips, mips64, sh4.

  How to reproduce:
  The attached program runs fine (exits with code 0) on
    - real hardware Linux/PowerPC64 (in 32-bit and 64-bit mode),
    - real hardware Linux/PowerPC64LE,
    - qemu-system-s390x emulated Linux/s390x,
    - real hardware Linux/SPARC64.
  $ gcc -O -Wall testsigsegv.c; ./a.out; echo $?
  0

  For ppc:
  $ powerpc-linux-gnu-gcc-5 -O -Wall -static testsigsegv.c -o testsigsegv-p=
pc
  $ ~/inst-qemu/2.9.0/bin/qemu-ppc testsigsegv-ppc
  $ echo $?
  3

  For ppc64:
  $ powerpc64-linux-gnu-gcc-5 -O -Wall -static testsigsegv.c -o testsigsegv=
-ppc64
  $ ~/inst-qemu/2.9.0/bin/qemu-ppc64 testsigsegv-ppc64
  $ echo $?
  3

  For ppc64le:
  $ powerpc64le-linux-gnu-gcc-5 -O -Wall -static testsigsegv.c -o testsigse=
gv-ppc64le
  $ ~/inst-qemu/2.9.0/bin/qemu-ppc64le testsigsegv-ppc64le
  $ echo $?
  3

  For s390x:
  $ s390x-linux-gnu-gcc-5 -O -Wall -static testsigsegv.c -o testsigsegv-s39=
0x
  $ ~/inst-qemu/2.9.0/bin/qemu-s390x testsigsegv-s390x
  $ echo $?
  3
  $ s390x-linux-gnu-gcc-5 -O -Wall -static testsigsegv.c -DAVOID_LINUX_S390=
X_COMPAT -o testsigsegv-s390x-a
  $ ~/inst-qemu/2.9.0/bin/qemu-s390x testsigsegv-s390x-a
  $ echo $?
  0
  So, the test fails here because the Linux/s390x kernel omits the least
  significant 12 bits of the fault address in the 'si_addr' field. But
  qemu-s390x is not compatible with the Linux/s390x behaviour: it puts
  the complete fault address in the 'si_addr' field.

  For sparc64:
  $ sparc64-linux-gnu-gcc-5 -O -Wall -static testsigsegv.c -o testsigsegv-s=
parc64
  $ ~/inst-qemu/2.9.0/bin/qemu-sparc64 testsigsegv-sparc64
  Segmentation fault (core dumped)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1705118/+subscriptions

