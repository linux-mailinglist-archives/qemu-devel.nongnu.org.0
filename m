Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100572E2EE7
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 19:02:59 +0100 (CET)
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktDu5-0000su-LR
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 13:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ktDsB-0000Ol-CX
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 13:00:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:36312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ktDs7-0002SO-FB
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 13:00:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ktDs4-0002jI-GE
 for <qemu-devel@nongnu.org>; Sat, 26 Dec 2020 18:00:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 781442E8137
 for <qemu-devel@nongnu.org>; Sat, 26 Dec 2020 18:00:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Dec 2020 17:53:21 -0000
From: =?utf-8?q?Andreas_K=2E_H=C3=BCttel?= <1906193@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 dilfridge
X-Launchpad-Bug-Reporter: =?utf-8?q?Andreas_K=2E_H=C3=BCttel_=28dilfridge?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Andreas_K=2E_H=C3=BCttel_=28dilfridge?=
 =?utf-8?q?=29?=
References: <160669515259.21126.12178770886175022752.malonedeb@gac.canonical.com>
Message-Id: <160900520121.4506.920868464547325376.malone@wampee.canonical.com>
Subject: [Bug 1906193] Re: riscv32 user mode emulation: fork return values
 broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: 70a90a3b5193f91ad06662dbde559bc6e86225f8
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
Reply-To: Bug 1906193 <1906193@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just as a general remark, while this specific problem seems to be
solved, there may still be issues surrounding waitid().

(With this patch applied, in a rather complex environment I see bash
processes hanging in an infinite loop, with waitid involved. I am
working on isolating the problem and providing a simple test case, but
so far I have not even found the code triggering it.)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906193

Title:
  riscv32 user mode emulation: fork return values broken

Status in QEMU:
  Confirmed

Bug description:
  When running in a chroot with riscv32 (on x86_64; qemu git master as
  of today):

  The following short program forks; the child immediately returns with
  exit(42). The parent checks for the return value - and obtains 40!

  gcc-10.2

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  #include <stdlib.h>
  #include <unistd.h>
  #include <stdio.h>
  #include <sys/wait.h>

  main(c, v)
       int c;
       char **v;
  {
    pid_t pid, p;
    int s, i, n;

    s =3D 0;
    pid =3D fork();
    if (pid =3D=3D 0)
      exit(42);

    /* wait for the process */
    p =3D wait(&s);
    if (p !=3D pid)
      exit (255);

    if (WIFEXITED(s))
    {
       int r=3DWEXITSTATUS(s);
       if (r!=3D42) {
        printf("child wants to return %i (0x%X), parent received %i (0x%X),=
 difference %i\n",42,42,r,r,r-42);
       }
    }
  }
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  (riscv-ilp32 chroot) farino /tmp # ./wait-test-short =

  child wants to return 42 (0x2A), parent received 40 (0x28), difference -2

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  (riscv-ilp32 chroot) farino /tmp # gcc --version
  gcc (Gentoo 10.2.0-r1 p2) 10.2.0
  Copyright (C) 2020 Free Software Foundation, Inc.
  Dies ist freie Software; die Kopierbedingungen stehen in den Quellen. Es
  gibt KEINE Garantie; auch nicht f=C3=BCr MARKTG=C3=84NGIGKEIT oder F=C3=
=9CR SPEZIELLE ZWECKE.

  (riscv-ilp32 chroot) farino /tmp # ld --version
  GNU ld (Gentoo 2.34 p6) 2.34.0
  Copyright (C) 2020 Free Software Foundation, Inc.
  This program is free software; you may redistribute it under the terms of
  the GNU General Public License version 3 or (at your option) a later vers=
ion.
  This program has absolutely no warranty.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906193/+subscriptions

