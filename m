Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBAC4AF4B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 03:04:57 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdP20-0007K5-IK
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 21:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50736)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hdOyR-0006jQ-Jd
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 21:01:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hdOyP-0003LS-KD
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 21:01:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:55848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hdOyN-0002oU-Kt
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 21:01:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hdOy2-00015w-3j
 for <qemu-devel@nongnu.org>; Wed, 19 Jun 2019 01:00:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1945A2E806F
 for <qemu-devel@nongnu.org>; Wed, 19 Jun 2019 01:00:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Jun 2019 00:52:54 -0000
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=alistair@alistair23.me; 
X-Launchpad-Bug-Tags: riscv
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 qemu-bug
X-Launchpad-Bug-Reporter: QEMU (qemu-bug)
X-Launchpad-Bug-Modifier: Alistair Francis (alistair2323)
References: <156034277180.16851.16263953909128956213.malonedeb@soybean.canonical.com>
Message-Id: <156090557500.21587.14659841562107909557.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18986";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 8843d989c2b82e01c60733c3b326f046f7eb4cfa
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1832535] Re: [riscv/regression] Missing tlb flush
 introduced in refactoring
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
Reply-To: Bug 1832535 <1832535@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Thanks for reporting a bug.

Can you please include details to reproduce the problems that you are
seeing? This includes images and command line arguments.

Do you also mind including the diff of what fixes the problem for you?

Alistair

** Changed in: qemu
       Status: New =3D> Incomplete

** Changed in: qemu
     Assignee: (unassigned) =3D> Alistair Francis (alistair2323)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832535

Title:
  [riscv/regression] Missing tlb flush introduced in refactoring

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  In qemu-system-riscv64, following a QEMU update, I get all sort of
  weird and not easily reproducible crashes in my risc-v guest.

  I have bissected this issue to commit c7b951718815694284501ed01fec7acb865=
4db7b.
  Some TLB flushes were removed in the following places:
  target/riscv/cpu_helper.c: `csr_write_helper(env, s, CSR_MSTATUS);` -> `e=
nv->mstatus =3D s;` (twice)
  target/riscv/op_helper.c: `csr_write_helper(env, s, CSR_MSTATUS);` -> `en=
v->mstatus =3D s;` (twice)

  Adding TLB flushes in all 4 places fixes the issues for me.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1832535/+subscriptions

