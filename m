Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B0B135CE6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 16:37:25 +0100 (CET)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipZsC-0001Lg-0N
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 10:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipZqi-0008M0-OL
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 10:35:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipZqh-0008GJ-D2
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 10:35:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:60650)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipZqh-0008B5-6P
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 10:35:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipZqe-0007fR-UT
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2020 15:35:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E28892E80F4
 for <qemu-devel@nongnu.org>; Thu,  9 Jan 2020 15:35:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jan 2020 15:24:35 -0000
From: Paul Clarke <pc@us.ibm.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc rth th-huth
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: Paul Clarke (7-pc)
References: <156686849716.6431.16425651381928336460.malonedeb@gac.canonical.com>
Message-Id: <157858347556.2711.11048625870513863453.malone@soybean.canonical.com>
Subject: [Bug 1841491] Re: floating point emulation can fail to set
 FE_UNDERFLOW
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 47b68223fa4c80e595da82d0f9fd162507e6978a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1841491 <1841491@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Comment #5 suggested splitting the "float" issue to a separate bug,
which was done some time ago (bug #1841592).

I think this ticket can be closed.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1841491

Title:
  floating point emulation can fail to set FE_UNDERFLOW

Status in QEMU:
  Confirmed

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

