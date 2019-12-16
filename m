Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE35A11F410
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 21:55:08 +0100 (CET)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igERP-00068k-Ta
	for lists+qemu-devel@lfdr.de; Sat, 14 Dec 2019 15:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1igEPV-0003zR-0c
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 15:53:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1igEPT-000602-JM
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 15:53:08 -0500
Received: from indium.canonical.com ([91.189.90.7]:49778)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1igEPT-0005s2-A7
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 15:53:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1igAO8-00022A-HY
 for <qemu-devel@nongnu.org>; Sat, 14 Dec 2019 16:35:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7C1142E80C7
 for <qemu-devel@nongnu.org>; Sat, 14 Dec 2019 16:35:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Dec 2019 16:24:38 -0000
From: Simon Brand <1856399@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: simonbrand1992
X-Launchpad-Bug-Reporter: Simon Brand (simonbrand1992)
X-Launchpad-Bug-Modifier: Simon Brand (simonbrand1992)
Message-Id: <157634067875.7231.7677894888746798043.malonedeb@soybean.canonical.com>
Subject: [Bug 1856399] [NEW] Intel GVT-g works in X11, segfaults in wayland
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9b8ee2ec4b3611fca7867d9f34bebf3439469122
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1856399 <1856399@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,

I am using an uptodate Arch Linux 64bit with qemu version 4.2.0, but the pr=
oblem was also present in older versions. The problem occurs with Linux 5.4=
 and 4.19.
The problem also occurs with Debian as guest. I am running sway.
If I provide -vga std, then qemu works fine until I use the qemu window to =
switch to the vfio-pci device. There are no problems under X11/xwayland at =
all.

Commandline:
qemu-system-x86_64
=C2=A0=C2=A0=C2=A0=C2=A0-enable-kvm
=C2=A0=C2=A0=C2=A0=C2=A0-cpu host
=C2=A0=C2=A0=C2=A0=C2=A0-smp 2
=C2=A0=C2=A0=C2=A0=C2=A0-m 8192
=C2=A0=C2=A0=C2=A0=C2=A0-display gtk,gl=3Don
=C2=A0=C2=A0=C2=A0=C2=A0-device vfio-pci,sysfsdev=3D/sys/devices/pci0000:00=
/0000:00:02.0/[ID]/,x-igd-opregion=3Don,display=3Don
=C2=A0=C2=A0=C2=A0=C2=A0-cdrom archlinux-2019.11.01-x86_64.iso
=C2=A0=C2=A0=C2=A0=C2=A0-vga none

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856399

Title:
  Intel GVT-g works in X11, segfaults in wayland

Status in QEMU:
  New

Bug description:
  Hello,

  I am using an uptodate Arch Linux 64bit with qemu version 4.2.0, but the =
problem was also present in older versions. The problem occurs with Linux 5=
.4 and 4.19.
  The problem also occurs with Debian as guest. I am running sway.
  If I provide -vga std, then qemu works fine until I use the qemu window t=
o switch to the vfio-pci device. There are no problems under X11/xwayland a=
t all.

  Commandline:
  qemu-system-x86_64
  =C2=A0=C2=A0=C2=A0=C2=A0-enable-kvm
  =C2=A0=C2=A0=C2=A0=C2=A0-cpu host
  =C2=A0=C2=A0=C2=A0=C2=A0-smp 2
  =C2=A0=C2=A0=C2=A0=C2=A0-m 8192
  =C2=A0=C2=A0=C2=A0=C2=A0-display gtk,gl=3Don
  =C2=A0=C2=A0=C2=A0=C2=A0-device vfio-pci,sysfsdev=3D/sys/devices/pci0000:=
00/0000:00:02.0/[ID]/,x-igd-opregion=3Don,display=3Don
  =C2=A0=C2=A0=C2=A0=C2=A0-cdrom archlinux-2019.11.01-x86_64.iso
  =C2=A0=C2=A0=C2=A0=C2=A0-vga none

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856399/+subscriptions

