Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FE95BDD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 12:01:50 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i00xZ-0001ps-PQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 06:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i00wY-0001Ni-RB
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 06:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i00wX-0002hU-GR
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 06:00:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:43334)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i00wX-0002go-9c
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 06:00:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i00wW-0003VC-Bt
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 10:00:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 445B02E806E
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 10:00:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Aug 2019 09:53:56 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1840719@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: bios floppy x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156625651066.23088.12772675524876649281.malonedeb@chaenomeles.canonical.com>
Message-Id: <156629483715.26974.16945751893003944455.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 8c10302765d16b7b6372b18cd3a279f71827b530
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1840719] Re: win98se floppy fails to boot with
 isapc machine
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
Reply-To: Bug 1840719 <1840719@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And the (SeaBIOS) winner is...

4a6dbcea3e412fe12effa2f812f50dd7eae90955 is the first bad commit
commit 4a6dbcea3e412fe12effa2f812f50dd7eae90955
Author: Nikolay Nikolov <nickysn@users.sourceforge.net>
Date:   Sun Feb 4 17:27:01 2018 +0200

    floppy: Use timer_check() in floppy_wait_irq()
    =

    Use timer_check() instead of using floppy_motor_counter in BDA for the
    timeout check in floppy_wait_irq().
    =

    The problem with using floppy_motor_counter was that, after it reaches
    0, it immediately stops the floppy motors, which is not what is
    supposed to happen on real hardware. Instead, after a timeout (like in
    the end of every floppy operation, regardless of the result - success,
    timeout or error), the floppy motors must be kept spinning for
    additional 2 seconds (the FLOPPY_MOTOR_TICKS). So, now the
    floppy_motor_counter is initialized to 255 (the max value) in the
    beginning of the floppy operation. For IRQ timeouts, a different
    timeout is used, specified by the new FLOPPY_IRQ_TIMEOUT constant
    (currently set to 5 seconds - a fairly conservative value, but should
    work reliably on most floppies).
    =

    After the floppy operation, floppy_drive_pio() resets the
    floppy_motor_counter to 2 seconds (FLOPPY_MOTOR_TICKS).
    =

    This is also consistent with what other PC BIOSes do.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840719

Title:
  win98se floppy fails to boot with isapc machine

Status in QEMU:
  New

Bug description:
  QEMU emulator version 4.1.50 (commit 50d69ee0d)

  floppy image from:
  https://winworldpc.com/download/417d71c2-ae18-c39a-11c3-a4e284a2c3a5

  $ qemu-system-i386 -M isapc -fda Windows\ 98\ Second\ Edition\ Boot.img
  SeaBIOS (version rel-1.12.1-0...)
  Booting from Floppy...
  Boot failed: could not read the boot disk

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840719/+subscriptions

