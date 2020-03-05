Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE417B0EB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 22:51:39 +0100 (CET)
Received: from localhost ([::1]:56672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9yP4-0003N2-WD
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 16:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58283)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j9yOB-0002uV-Vi
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 16:50:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j9yOA-00026F-8l
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 16:50:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:43394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j9yOA-00025W-0M
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 16:50:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j9yO7-00066G-FX
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 21:50:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 741E92E80D4
 for <qemu-devel@nongnu.org>; Thu,  5 Mar 2020 21:50:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Mar 2020 21:37:57 -0000
From: Ottavio Caruso <1743191@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: regression
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gson ottaviocr
X-Launchpad-Bug-Reporter: Andreas Gustafsson (gson)
X-Launchpad-Bug-Modifier: Ottavio Caruso (ottaviocr)
References: <151591854188.4596.10964938100242408667.malonedeb@wampee.canonical.com>
Message-Id: <158344427762.12830.17457166762960943310.malone@soybean.canonical.com>
Subject: [Bug 1743191] Re: Interacting with NetBSD serial console boot blocks
 no longer works
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 00f0d7fcef19a6a18a583d5d4bf68fb5b5590b6e
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
Reply-To: Bug 1743191 <1743191@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reverting to Seabios 1.10 (version rel-1.10.3.0-gb76661dd) fixes this
problem.

Steps:

$ cd && mkdir seabios-test && cd seabios-test
$ git clone -b 1.10-stable https://github.com/coreboot/seabios.git
$ cd seabios
$ make
$ qemu-system-x86_64 \
-drive if=3Dvirtio,file=3D/home/oc/VM/img/netbsd.image,index=3D0,media=3Ddi=
sk \
-M q35,accel=3Dkvm -m 350M -cpu host -smp $(nproc) \
-nic user,model=3Dvirtio-net-pci,ipv6=3Doff \
-nographic -bios /home/oc/seabios-test/seabios/out/bios.bin

Result: =

I can interact with NetBSD boot menu and select one of the available option=
s.

Host:
Linux e130 4.9.0-11-amd64 #1 SMP Debian 4.9.189-3+deb9u1 (2019-09-20) x86_6=
4 GNU/Linux

QEMU emulator version 4.2.0


** Also affects: seabios
   Importance: Undecided
       Status: New

** No longer affects: seabios

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1743191

Title:
  Interacting with NetBSD serial console boot blocks no longer works

Status in QEMU:
  New

Bug description:
  The NetBSD boot blocks display a menu allowing the user to make a
  selection using the keyboard.  For example, when booting a NetBSD
  installation CD-ROM, the menu looks like this:

           1. Install NetBSD
           2. Install NetBSD (no ACPI)
           3. Install NetBSD (no ACPI, no SMP)
           4. Drop to boot prompt

      Choose an option; RETURN for default; SPACE to stop countdown.
      Option 1 will be chosen in 30 seconds.

  When booting NetBSD in a recent qemu using an emulated serial console,
  making this menu selection no longer works: when you type the selected
  number, the keyboard input is ignored, and the 30-second countdown
  continues.  In older versions of qemu, it works.

  To reproduce the problem, run:

     wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-7.1.1/amd64/installation/=
cdrom/boot-com.iso
     qemu-system-x86_64 -nographic -cdrom boot-com.iso

  During the 30-second countdown, press 4

  Expected behavior: The countdown stops and you get a ">" prompt

  Incorrect behavior: The countdown continues

  There may also be some corruption of the terminal output; for example,
  "Option 1 will be chosen in 30 seconds" may be displayed as "Option 1
  will be chosen in p0 seconds".

  Using bisection, I have determined that the problem appeared with qemu
  commit 083fab0290f2c40d3d04f7f22eed9c8f2d5b6787, in which seabios was
  updated to 1.11 prerelease, and the problem is still there as of
  commit 7398166ddf7c6dbbc9cae6ac69bb2feda14b40ac.  The host operating
  system used for the tests was Debian 9 x86_64.

  Credit for discovering this bug goes to Paul Goyette.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1743191/+subscriptions

