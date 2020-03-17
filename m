Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCECB187816
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 04:21:50 +0100 (CET)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE2nd-0007aj-T3
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 23:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jE2md-0006lO-7j
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 23:20:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jE2mb-0001tl-VB
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 23:20:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:33912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jE2mb-0001lG-Og
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 23:20:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jE2ma-00077D-KB
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 03:20:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 816092E80C8
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 03:20:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Mar 2020 03:11:11 -0000
From: Robert Henry <1824344@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: amd64 i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mhodog zsojka
X-Launchpad-Bug-Reporter: =?utf-8?q?Zden=C4=9Bk_Sojka_=28zsojka=29?=
X-Launchpad-Bug-Modifier: Robert Henry (mhodog)
References: <155498568620.8246.6921870539036246816.malonedeb@wampee.canonical.com>
Message-Id: <158441467201.20839.514684479500679762.malone@wampee.canonical.com>
Subject: [Bug 1824344] Re: x86: retf or iret pagefault sets wrong error code
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: b5836738e2d6ab3d5c841a5933637cc64dcc35ef
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
Reply-To: Bug 1824344 <1824344@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This appears to be similar to
https://bugs.launchpad.net/qemu/+bug/1866892 (and much simpler)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1824344

Title:
  x86: retf or iret pagefault sets wrong error code

Status in QEMU:
  New

Bug description:
  With a x86_64 or i386 guest, non-KVM, when trying to execute a
  "iret/iretq/retf" instruction in userspace with invalid stack pointer
  (under a protected mode OS, like Linux), wrong bits are set in the
  pushed error code; bit 2 is not set, indicating the error comes from
  kernel space.

  If the guest OS is using this flag to decide whether this was a kernel
  or user page fault, it will mistakenly decide a kernel has irrecoverably
  faulted, possibly causing guest OS panic.

  =

  How to reproduce the problem a guest (non-KVM) Linux:
  Note, on recent Linux kernel version, this needs a CPU with SMAP support
  (eg. -cpu max)

  $ cat tst.c
  int main()
  {
  __asm__ volatile (
  "mov $0,%esp\n"
  "retf"
  );
  return 0;
  }

  $ gcc tst.c
  $ ./a.out
  Killed

  =

  "dmesg" shows the kernel has in fact triggered a "BUG: unable to handle
  kernel NULL pointer dereference...", but it has "recovered" by killing
  the faulting process (see attached screenshot).

  =

  Using self-compiled qemu from git:
  commit 532cc6da74ec25b5ba6893b5757c977d54582949 (HEAD -> master, tag: v4.=
0.0-rc3, origin/master, origin/HEAD)
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Wed Apr 10 15:38:59 2019 +0100

      Update version for v4.0.0-rc3 release
      =

      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1824344/+subscriptions

