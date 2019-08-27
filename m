Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0249DAFF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 03:27:06 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2QGF-0001J0-GA
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 21:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i2QEp-0000WJ-R0
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 21:25:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i2QEo-0002Je-M8
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 21:25:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:56054)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i2QEo-0002J4-Fc
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 21:25:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i2QEn-00075g-4w
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 01:25:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 21E712E80C3
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 01:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Aug 2019 01:14:57 -0000
From: Paul Clarke <pc@us.ibm.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: Paul Clarke (7-pc)
Message-Id: <156686849716.6431.16425651381928336460.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19031";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e2ac106c236c041c07b1f18d50cda061d6fcb35e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1841491] [NEW] floating point emulation can fail
 to set FE_UNDERFLOW
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
Reply-To: Bug 1841491 <1841491@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Floating point emulation can fail to set FE_UNDERFLOW in some
circumstances. This shows up often in glibc's "math" tests. A similar
test is attached.

This is similar to bug #1841442, but not the same problem, and I don't
think the fix will be in the same code.

On ppc64le native:
--
$ gcc -c -O2 fma.c
$ gcc -O2 test-fma.c fma.o -lm -o test-fma
$ ./test-fma $(./test-fma)
fma(0x1.ffffffffffffcp-1022, 0x1.0000000000001p-1, 0x0.0000000000001p-1022)
0x0

0xa000000
FE_INEXACT FE_UNDERFLOW =

0x1p-1022
--

On qemu-system-ppc64:
--
$ ./test-fma $(./test-fma)
fma(0x1.ffffffffffffcp-1022, 0x1.0000000000001p-1, 0x0.0000000000001p-1022)
0x0

0x2000000
FE_INEXACT =

0x1p-1022
--

QEMU versions vary, but not too much, and are pretty close to git HEAD:
- 586f3dced9 (HEAD -> master, origin/master, origin/HEAD) Merge remote-trac=
king branch 'remotes/cohuck/tags/s390x-20190822' into staging
- 864ab31 Update version for v4.1.0-rc4 release

There are worse symptoms on qemu-x86_64, but this is apparently not
surprising per https://bugs.launchpad.net/qemu/+bug/1841442/comments/6.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "testcase reporting exceptions set by simple floating =
point multiply-add"
   https://bugs.launchpad.net/bugs/1841491/+attachment/5284808/+files/test-=
fma.c

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1841491

Title:
  floating point emulation can fail to set FE_UNDERFLOW

Status in QEMU:
  New

Bug description:
  Floating point emulation can fail to set FE_UNDERFLOW in some
  circumstances. This shows up often in glibc's "math" tests. A similar
  test is attached.

  This is similar to bug #1841442, but not the same problem, and I don't
  think the fix will be in the same code.

  On ppc64le native:
  --
  $ gcc -c -O2 fma.c
  $ gcc -O2 test-fma.c fma.o -lm -o test-fma
  $ ./test-fma $(./test-fma)
  fma(0x1.ffffffffffffcp-1022, 0x1.0000000000001p-1, 0x0.0000000000001p-102=
2)
  0x0

  0xa000000
  FE_INEXACT FE_UNDERFLOW =

  0x1p-1022
  --

  On qemu-system-ppc64:
  --
  $ ./test-fma $(./test-fma)
  fma(0x1.ffffffffffffcp-1022, 0x1.0000000000001p-1, 0x0.0000000000001p-102=
2)
  0x0

  0x2000000
  FE_INEXACT =

  0x1p-1022
  --

  QEMU versions vary, but not too much, and are pretty close to git HEAD:
  - 586f3dced9 (HEAD -> master, origin/master, origin/HEAD) Merge remote-tr=
acking branch 'remotes/cohuck/tags/s390x-20190822' into staging
  - 864ab31 Update version for v4.1.0-rc4 release

  There are worse symptoms on qemu-x86_64, but this is apparently not
  surprising per
  https://bugs.launchpad.net/qemu/+bug/1841442/comments/6.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1841491/+subscriptions

