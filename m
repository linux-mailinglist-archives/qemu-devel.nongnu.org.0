Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2A488C7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:23:45 +0200 (CEST)
Received: from localhost ([::1]:49062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcuQ5-0004SO-4s
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hctka-0003dH-Lz
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:40:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hctkY-0007cn-Jj
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:40:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:46952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hctkW-0007ZE-PX
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:40:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hctkT-0002g5-MG
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 15:40:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9B3C22E8076
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 15:40:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Jun 2019 15:33:56 -0000
From: David Lindsay <asmqb7@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: pl111 vexpress-a9
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: asmqb7
X-Launchpad-Bug-Reporter: David Lindsay (asmqb7)
X-Launchpad-Bug-Modifier: David Lindsay (asmqb7)
Message-Id: <156078563656.24847.5055295179031840026.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18981";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 53694497b83d88193d67b325b712f597adf0f984
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1833101] [NEW] vexpress-a9 (but not -a15) creates
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

Public bug reported:

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

vexpress-a15 does not appear to be affected (my -a9 kernel does not work
with it, but I see only one pl111 created).

Understandably (but still annoyingly), -nodefaults has no effect.

This bug is most evident when using SDL (so I can use ",frame=3Doff"),
which dumps two top-level windows onto the screen. GTK hides this
because, coincidentally, the pl111 that ends up being used is the one
that is selected (possibly the one created last?), relegating this to an
obscure glitch only noticeable if you scrutinize the menu.

This is a bugreport as opposed to a pull request as I have no idea which
call to remove - and complete ignorance of the potential housekeeping
and consideration that may be warranted first.

FWIW, a simple testcase can be made with the vmlinuz from
https://people.debian.org/~aurel32/qemu/armhf/ and

qemu-system-arm -M vexpress-a9 -kernel vmlinuz-3.2.0-4-vexpress
-nodefaults -sdl

Thanks!

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: pl111 vexpress-a9

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1833101

Title:
  vexpress-a9 (but not -a15) creates two pl111 LCDs due to duplicate
  sysbus_create_simple("pl111", ...) calls

Status in QEMU:
  New

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

