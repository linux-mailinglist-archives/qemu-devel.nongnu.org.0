Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F262C22
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 00:52:04 +0200 (CEST)
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkcUN-0004RV-A9
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 18:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hkcT6-0003qO-Te
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 18:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hkcT3-0000h0-TE
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 18:50:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:36990)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hkcT2-0000em-MP
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 18:50:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hkcSx-0001lT-N7
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 22:50:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9A5C72E80CB
 for <qemu-devel@nongnu.org>; Mon,  8 Jul 2019 22:50:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jul 2019 22:43:04 -0000
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: John Paul Adrian Glaubitz (glaubitz)
Message-Id: <156262578461.2222.11301272429426949561.malonedeb@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 06e7fa64b6d53c23e5ef697b50ef94a955eefa51
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1835839] [NEW] qemu-user: $0 incorrectly always
 reports absolute path
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
Reply-To: Bug 1835839 <1835839@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

We just ran into an issue with the Perl package on Debian/m68k when
being built with qemu-user [1].

The problem can be boiled down to qemu-user always reporting absolute
paths for the shell variable $0 no matter on how the command was
invoked.

A simple reproducer is this:

On normal system (no emulation):

root@nofan:~> sh -c 'echo $0'
sh
root@nofan:~>

On qemu-user:

(sid-m68k-sbuild)root@nofan:/# sh -c 'echo $0'
/bin/sh
(sid-m68k-sbuild)root@nofan:/#

> [1] https://lists.debian.org/debian-68k/2019/07/msg00007.html

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835839

Title:
  qemu-user: $0 incorrectly always reports absolute path

Status in QEMU:
  New

Bug description:
  We just ran into an issue with the Perl package on Debian/m68k when
  being built with qemu-user [1].

  The problem can be boiled down to qemu-user always reporting absolute
  paths for the shell variable $0 no matter on how the command was
  invoked.

  A simple reproducer is this:

  On normal system (no emulation):

  root@nofan:~> sh -c 'echo $0'
  sh
  root@nofan:~>

  On qemu-user:

  (sid-m68k-sbuild)root@nofan:/# sh -c 'echo $0'
  /bin/sh
  (sid-m68k-sbuild)root@nofan:/#

  > [1] https://lists.debian.org/debian-68k/2019/07/msg00007.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835839/+subscriptions

