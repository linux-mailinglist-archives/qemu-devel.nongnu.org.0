Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31DC3CCF8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 15:29:25 +0200 (CEST)
Received: from localhost ([::1]:58974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hagq4-0006mK-L5
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 09:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hagmc-0003fR-Up
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 09:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hagmb-00017j-A4
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 09:25:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:39944)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hagmb-0000tU-1O
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 09:25:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hagmM-0004pw-8v
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 13:25:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 35E3F2E80C9
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 13:25:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Jun 2019 13:14:07 -0000
From: Christophe Lyon <christophe.lyon+launchpad@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: christophe-lyon
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Christophe Lyon (christophe-lyon)
Message-Id: <156025884763.18155.9614824235777300144.malonedeb@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18978";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 28a1ad9eb7be5957b314d15c05e3321c204f0621
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1832353] [NEW] cpu_exec: Assertion
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

Public bug reported:

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

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "qemu-assert.tar.xz"
   https://bugs.launchpad.net/bugs/1832353/+attachment/5270140/+files/qemu-=
assert.tar.xz

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832353

Title:
  cpu_exec: Assertion !have_mmap_lock() failed

Status in QEMU:
  New

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

