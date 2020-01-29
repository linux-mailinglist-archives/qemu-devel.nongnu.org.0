Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6714D2BE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 22:53:59 +0100 (CET)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwvHa-0004Nh-H4
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 16:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iwuq8-0007fJ-GC
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:25:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iwuq7-0003DG-9f
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:25:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:40050)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iwuq7-00039y-2d
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:25:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iwuq6-0001gS-27
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 21:25:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0A2852E80AD
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 21:25:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jan 2020 21:18:59 -0000
From: rinigus <rinigus.git@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rinigus-git
X-Launchpad-Bug-Reporter: rinigus (rinigus-git)
X-Launchpad-Bug-Modifier: rinigus (rinigus-git)
Message-Id: <158033273927.19447.5685950954198072756.malonedeb@gac.canonical.com>
Subject: [Bug 1861341] [NEW] ARM QEMU: Unknown syscall 397
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: cdf84f6f1fe5969b4fb8d5d2397d62a9eda2bf4f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Wed, 29 Jan 2020 16:53:17 -0500
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
Reply-To: Bug 1861341 <1861341@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

QEMU is reporting

```
Unknown syscall 397
```

(statx if I read tables right) when used via flatpak for ARM images on
x86_64. This has been reproduced on Fedora and Gentoo.

To reproduce:

- get flatpak KDE 5.12 for arm:

flatpak install --user org.kde.Sdk/arm/5.12 org.kde.Platform/arm/5.12


- run qmake inside Sdk:

QEMU_STRACE=3D1 flatpak run --filesystem=3Dhost --command=3Dqmake
org.kde.Sdk/arm/5.12 .


You will get a host of messages with unknown syscall. In practice, qmake wi=
ll fail to find .pro files if you have them in that folder and libraries in=
 the system.

As far as I understand, Flatpak images are built on AARCH64 hardware.

My config on Gentoo:

kernel: 4.19.86-gentoo x86_64
app-emulation/qemu: ~4.2.0-r1 , same with 4.0.0

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861341

Title:
  ARM QEMU: Unknown syscall 397

Status in QEMU:
  New

Bug description:
  QEMU is reporting

  ```
  Unknown syscall 397
  ```

  (statx if I read tables right) when used via flatpak for ARM images on
  x86_64. This has been reproduced on Fedora and Gentoo.

  To reproduce:

  - get flatpak KDE 5.12 for arm:

  flatpak install --user org.kde.Sdk/arm/5.12 org.kde.Platform/arm/5.12

  =

  - run qmake inside Sdk:

  QEMU_STRACE=3D1 flatpak run --filesystem=3Dhost --command=3Dqmake
  org.kde.Sdk/arm/5.12 .

  =

  You will get a host of messages with unknown syscall. In practice, qmake =
will fail to find .pro files if you have them in that folder and libraries =
in the system.

  As far as I understand, Flatpak images are built on AARCH64 hardware.

  My config on Gentoo:

  kernel: 4.19.86-gentoo x86_64
  app-emulation/qemu: ~4.2.0-r1 , same with 4.0.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861341/+subscriptions

