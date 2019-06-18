Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180254A1C1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 15:11:51 +0200 (CEST)
Received: from localhost ([::1]:57798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdDtt-0000Ek-OT
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 09:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45015)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hdDt3-0008Es-7i
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 09:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hdDt1-0000Pb-Rx
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 09:10:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:48996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hdDt1-0000O7-MW
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 09:10:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hdDsz-0003T0-ES
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 13:10:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5A6282E80CC
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 13:10:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Jun 2019 12:56:09 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: pl111 vexpress-a9
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: asmqb7 pmaydell
X-Launchpad-Bug-Reporter: David Lindsay (asmqb7)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156078563656.24847.5055295179031840026.malonedeb@gac.canonical.com>
Message-Id: <156086256942.24530.5770898525674471283.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18981";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 0f0828ccd16110b6f7673ac8a1b467ceb4905f13
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1833101] Re: vexpress-a9 (but not -a15) creates
 two pl111 LCDs due to duplicate sysbus_create_simple("pl111", ...) calls
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
Reply-To: Bug 1833101 <1833101@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You might want to check our advice on how to pick a machine type for Arm: h=
ttps://wiki.qemu.org/Documentation/Platforms/ARM#Guidelines_for_choosing_a_=
QEMU_machine
Basically we suggest 'virt' unless you have a strong reason for wanting to =
emulate something else.

NB that we don't support PCI in our vexpress model (this is one reason
we don't recommend it, it makes it a bit inflexible).

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1833101

Title:
  vexpress-a9 (but not -a15) creates two pl111 LCDs due to duplicate
  sysbus_create_simple("pl111", ...) calls

Status in QEMU:
  Invalid

Bug description:
  Hi,

  Just a small report that (12ec8bd is current master)

  https://github.com/qemu/qemu/blob/12ec8bd/hw/arm/vexpress.c#L652:

    ...
    vexpress_common_init() {
      ...
      sysbus_create_simple("pl111", map[VE_CLCD], pic[14]);
      ...
    ...

  and

  https://github.com/qemu/qemu/blob/12ec8bd/hw/arm/vexpress.c#L304:

    ...
    a9_daughterboard_init() {
      ...
      sysbus_create_simple("pl111", 0x10020000, pic[44]);
      ...
    ...

  result in two LCD panels when using vexpress-a9.

  vexpress-a15 does not appear to be affected (my -a9 kernel does not
  work with it, but I see only one pl111 created).

  Understandably (but still annoyingly), -nodefaults has no effect.

  This bug is most evident when using SDL (so I can use ",frame=3Doff"),
  which dumps two top-level windows onto the screen. GTK hides this
  because, coincidentally, the pl111 that ends up being used is the one
  that is selected (possibly the one created last?), relegating this to
  an obscure glitch only noticeable if you scrutinize the menu.

  This is a bugreport as opposed to a pull request as I have no idea
  which call to remove - and complete ignorance of the potential
  housekeeping and consideration that may be warranted first.

  FWIW, a simple testcase can be made with the vmlinuz from
  https://people.debian.org/~aurel32/qemu/armhf/ and

  qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress
  -nodefaults -sdl

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1833101/+subscriptions

