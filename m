Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06A62220
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 17:23:01 +0200 (CEST)
Received: from localhost ([::1]:42616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkVTo-0003Vr-Qm
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 11:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57381)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hkVRe-0002yy-9E
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 11:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hkVRc-0008SV-VM
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 11:20:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:38548)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hkVRc-0008Jr-Oj
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 11:20:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hkVRZ-0002Zj-Kr
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 15:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9A4BB2E80BA
 for <qemu-devel@nongnu.org>; Mon,  8 Jul 2019 15:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jul 2019 15:11:27 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mintriago pmaydell
X-Launchpad-Bug-Reporter: Matthew Intriago (mintriago)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156259768655.23216.11898576300198780398.malonedeb@chaenomeles.canonical.com>
Message-Id: <156259868748.23172.15735392480581630204.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 7b5529ba272d4990f8c17976efa1c9051027e6d1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1835793] Re: Running an edk2 based bios
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
Reply-To: Bug 1835793 <1835793@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Guest has not initialized display" simply means that the guest code
you're running has not done anything to the display device (VGA in this
case). There are two main reasons for this:

 (1) the guest code isn't intended to output to the display -- perhaps
it sends its output to the serial port instead. In this case the fix is
to use the right QEMU arguments to send the serial port output somewhere
you can read it (or to reconfigure the guest code to output where you
want it to).

 (2) the guest code is intended to output to the display, but it crashed
before it got as far as doing that. In this case, the fix is to debug
your guest code. QEMU's gdbstub is usually a good tool to use here. If
you control the guest code (ie you can modify and recompile it) you can
also add extra debugging to it (like making it output more information
earlier, or output debugging trace information to the serial port so you
can see how far it has got).

My guess would be that this is a variation on 2 caused by your BIOS
being compiled to assume different hardware from what QEMU is providing
-- if the BIOS tries to write to a device that isn't present it will
likely crash or go into an infinite loop.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835793

Title:
  Running an edk2 based bios

Status in QEMU:
  New

Bug description:
  This is not necessarily a bug, however I wasn't sure were to get help.

  I am currently working on using QEMU  to run a BIOS my company has
  developed. In order to see if the software was working correctly, I
  was able to successfully run the edk2 bios using the following
  command:

  qemu-system-x86_64.exe -bios
  "C:\Users\matthew.intriago\Desktop\ovmf.fd" -net none

  However, when running the same command using  our personalized bios,
  QEMU launches stating that =E2=80=9Cguest has not initialized display=E2=
=80=9D.
  Theoretically, QEMU should be able to run the bios since it is edk2
  based, the only difference between the two is that our bios has more
  features.

  If anyone has any insight on what the issue might be I would greatly
  appreciate any help.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835793/+subscriptions

