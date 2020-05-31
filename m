Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC91E94E5
	for <lists+qemu-devel@lfdr.de>; Sun, 31 May 2020 03:16:49 +0200 (CEST)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfCam-00054E-PP
	for lists+qemu-devel@lfdr.de; Sat, 30 May 2020 21:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jfCZi-0004CL-LJ
 for qemu-devel@nongnu.org; Sat, 30 May 2020 21:15:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:46014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jfCZh-0002st-Eq
 for qemu-devel@nongnu.org; Sat, 30 May 2020 21:15:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jfCZe-0001GM-6G
 for <qemu-devel@nongnu.org>; Sun, 31 May 2020 01:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 256242E80E7
 for <qemu-devel@nongnu.org>; Sun, 31 May 2020 01:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2020 01:02:33 -0000
From: Ahmed Karaman <1881450@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: m68k
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn
X-Launchpad-Bug-Reporter: Ahmed Karaman (ahmedkrmn)
X-Launchpad-Bug-Modifier: Ahmed Karaman (ahmedkrmn)
Message-Id: <159088695339.29529.1797786788240960646.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1881450] [NEW] Emulation of a math function fails for m68k Linux
 user mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="275d46a24253e557e4403d52832837e4bfa425b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ebc321fed3cf06d217ece6d6d21fbea6b63757d7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/30 21:15:38
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1881450 <1881450@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Please check the attached math-example.c file.
When running the m68k executable under QEMU, it results in an =

"Illegal instruction" error.
Other targets don't produce this error.

Steps to reproduce the bug:

1. Download the math-example.c attached file.
2. Compile it by running:
=C2=A0=C2=A0=C2=A0m68k-linux-gnu-gcc -O2 -static math-example.c -o math-exa=
mple-m68k -lm
3. Run the executable with QEMU:
=C2=A0=C2=A0=C2=A0/build/qemu-5.0.0/build-gcc/m68k-linux-user/qemu-m68k mat=
h-example-m68k

The output of execution is:
=C2=A0=C2=A0=C2=A0Profiling function expm1f():
=C2=A0=C2=A0=C2=A0qemu: uncaught target signal 4 (Illegal instruction) - co=
re dumped
=C2=A0=C2=A0=C2=A0Illegal instruction (core dumped)

Output when running on other targets:
=C2=A0=C2=A0=C2=A0Profiling function expm1f():
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Elapsed time: 47 ms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Control result: 71804.953125

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: m68k

** Attachment added: "Emulating the expm1f() function."
   https://bugs.launchpad.net/bugs/1881450/+attachment/5378913/+files/math-=
example.c

** Description changed:

  Please check the attached math-example.c file.
- When running the m68k executable under QEMU, it results in an "Illegal in=
struction" error.
+ When running the m68k executable under QEMU, it results in an =

+ "Illegal instruction" error.
  Other targets don't produce this error.
  =

  Steps to reproduce the bug:
  =

  1. Download the math-example.c attached file.
  2. Compile it by running:
-         m68k-linux-gnu-gcc -O2 -static math-example.c -o math-example-m68=
k -lm
+ =C2=A0=C2=A0=C2=A0m68k-linux-gnu-gcc -O2 -static math-example.c -o math-e=
xample-m68k -lm
  3. Run the executable with QEMU:
-         /build/qemu-5.0.0/build-gcc/m68k-linux-user/qemu-m68k math-exampl=
e-m68k =

+ =C2=A0=C2=A0=C2=A0/build/qemu-5.0.0/build-gcc/m68k-linux-user/qemu-m68k m=
ath-example-m68k
  =

  The output of execution is:
-         Profiling function expm1f():
-         qemu: uncaught target signal 4 (Illegal instruction) - core dumped
-         Illegal instruction (core dumped)
+ =C2=A0=C2=A0=C2=A0Profiling function expm1f():
+ =C2=A0=C2=A0=C2=A0qemu: uncaught target signal 4 (Illegal instruction) - =
core dumped
+ =C2=A0=C2=A0=C2=A0Illegal instruction (core dumped)
  =

- Expected output:
-         Profiling function expm1f():
-           Elapsed time: 47 ms
-           Control result: 71804.953125
+ Output when running on other targets:
+ =C2=A0=C2=A0=C2=A0Profiling function expm1f():
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Elapsed time: 47 ms
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Control result: 71804.953125

** Attachment removed: "math-example.c"
   https://bugs.launchpad.net/qemu/+bug/1881450/+attachment/5378913/+files/=
math-example.c

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1881450

Title:
  Emulation of a math function fails for m68k Linux user mode

Status in QEMU:
  New

Bug description:
  Please check the attached math-example.c file.
  When running the m68k executable under QEMU, it results in an =

  "Illegal instruction" error.
  Other targets don't produce this error.

  Steps to reproduce the bug:

  1. Download the math-example.c attached file.
  2. Compile it by running:
  =C2=A0=C2=A0=C2=A0m68k-linux-gnu-gcc -O2 -static math-example.c -o math-e=
xample-m68k -lm
  3. Run the executable with QEMU:
  =C2=A0=C2=A0=C2=A0/build/qemu-5.0.0/build-gcc/m68k-linux-user/qemu-m68k m=
ath-example-m68k

  The output of execution is:
  =C2=A0=C2=A0=C2=A0Profiling function expm1f():
  =C2=A0=C2=A0=C2=A0qemu: uncaught target signal 4 (Illegal instruction) - =
core dumped
  =C2=A0=C2=A0=C2=A0Illegal instruction (core dumped)

  Output when running on other targets:
  =C2=A0=C2=A0=C2=A0Profiling function expm1f():
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Elapsed time: 47 ms
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Control result: 71804.953125

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1881450/+subscriptions

