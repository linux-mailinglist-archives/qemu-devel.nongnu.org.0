Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295798FA33
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 07:07:53 +0200 (CEST)
Received: from localhost ([::1]:49327 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyUSt-0002Kb-Pl
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 01:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hyUQt-0000dn-D4
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 01:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hyUQs-00054a-C2
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 01:05:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:52616)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hyUQs-00053u-6d
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 01:05:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hyUQq-0003l3-GN
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 05:05:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2196F2E80CB
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 05:05:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Aug 2019 04:58:35 -0000
From: Thomas Huth <1832353@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Tags: arm tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee christophe-lyon pmaydell rth th-huth
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156025884763.18155.9614824235777300144.malonedeb@wampee.canonical.com>
Message-Id: <156593151577.16423.12920528203189904325.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e127b3f65feae5fadcad9526ec882b71abf6bbcc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1832353] Re: cpu_exec: Assertion
 !have_mmap_lock() failed
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
Reply-To: Bug 1832353 <1832353@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D52ba13f042714c4086416

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832353

Title:
  cpu_exec: Assertion !have_mmap_lock() failed

Status in QEMU:
  Fix Released

Bug description:
  Hi,

  I have isolated a testcase from the GCC testsuite (actually gfortran,
  test proc_ptr_51.f90) which produces tons of:

  qemu-arm: /home/christophe.lyon/src/qemu/accel/tcg/cpu-exec.c:701:
  cpu_exec: Assertion `!have_mmap_lock()' failed.

  including with master qemu as of today.

  I'm attaching a tarball containing:
  qemu-assert:
  cmd  lib  proc_ptr_51.exe

  qemu-assert/lib:
  ld-linux-armhf.so.3  libc.so.6  libgcc_s.so.1  libgfortran.so.5  libm.so.6

  where cmd is the basic command used to launch the test & reproduce the
  failure.

  Note that the test or the generated may actually be buggy: I have
  reported failures on native aarch64 and arm machines. Yet, qemu should
  not fail with a loop of asserts.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1832353/+subscriptions

