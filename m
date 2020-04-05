Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38119EE55
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Apr 2020 23:52:18 +0200 (CEST)
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLDBh-0005Kv-DX
	for lists+qemu-devel@lfdr.de; Sun, 05 Apr 2020 17:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57587)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jLDAa-0004v8-DN
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 17:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jLDAZ-0005Bo-87
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 17:51:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:45286)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jLDAZ-0005Ae-31
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 17:51:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jLDAU-00032F-BZ
 for <qemu-devel@nongnu.org>; Sun, 05 Apr 2020 21:51:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3CD122E8130
 for <qemu-devel@nongnu.org>; Sun,  5 Apr 2020 21:50:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Apr 2020 21:40:14 -0000
From: =?utf-8?q?Carlo_Marcelo_Arenas_Bel=C3=B3n?= <1821444@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: carenasgm trofi
X-Launchpad-Bug-Reporter: Sergei Trofimovich (trofi)
X-Launchpad-Bug-Modifier: =?utf-8?q?Carlo_Marcelo_Arenas_Bel=C3=B3n_=28care?=
 =?utf-8?q?nasgm=29?=
References: <155333538976.18284.9399017131279358822.malonedeb@gac.canonical.com>
Message-Id: <158612281413.12209.9116188112743085724.malone@chaenomeles.canonical.com>
Subject: [Bug 1821444] Re: qemu-ppc (user) incorrectly translates float32
 arithmetics
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: bb3e409d53ce8902c4804330ea0a6352d5073a71
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1821444 <1821444@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fix committed with c0e6616b6685ffdb4c5e091bc152e46e14703dd1 and released
with 4.2.0

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1821444

Title:
  qemu-ppc (user) incorrectly translates float32 arithmetics

Status in QEMU:
  Fix Released

Bug description:
  I'm using qemu-3.1.0 (Gentoo).

  When I was running regression test suite via qemu-ppc for GHC I
  noticed a few uint32_t<->float32 failures I did not expect to
  encounter.

  Here is an example

  $ cat a.c
  #include <stdio.h>
  #include <stdint.h>

  int main() {
      volatile uint32_t i =3D 1;
      printf("0x1 =3D %e\n", *(volatile float*)&i);
  }

  $ powerpc-unknown-linux-gnu-gcc -O2 a.c -Wall -o a -fno-strict-aliasing -=
fno-stack-protector -static && ./a
  0x1 =3D 2.802597e-45

  $ scp a timberdoodle.ppc64.dev.gentoo.org:~/
  a                                                                        =
                               100%  826KB 102.0KB/s   00:08    =


  $ ssh timberdoodle.ppc64.dev.gentoo.org ./a
  0x1 =3D 1.401298e-45
  $ qemu-ppc ./a
  0x1 =3D 2.802597e-45

  Looks like off-by-one bit somewhere. I'm not sure if it's FPU
  instruction or some internals of printf() that are emulated
  incorrectly.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1821444/+subscriptions

