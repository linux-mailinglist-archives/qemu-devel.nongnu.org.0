Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C23D57E3
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Oct 2019 21:52:08 +0200 (CEST)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJjuR-0003Xl-9N
	for lists+qemu-devel@lfdr.de; Sun, 13 Oct 2019 15:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36672)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iJjtB-0002zh-NC
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 15:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iJjtA-0002LH-LO
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 15:50:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:60934)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iJjtA-0002JG-Ft
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 15:50:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iJjt7-0005xy-Tj
 for <qemu-devel@nongnu.org>; Sun, 13 Oct 2019 19:50:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DF8DE2E80CE
 for <qemu-devel@nongnu.org>; Sun, 13 Oct 2019 19:50:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Oct 2019 19:36:57 -0000
From: zenojevski <1847906@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: corwin-amber zenojevski
X-Launchpad-Bug-Reporter: Shachar Itzhaky (corwin-amber)
X-Launchpad-Bug-Modifier: zenojevski (zenojevski)
References: <157097450557.5820.4200729468686724078.malonedeb@gac.canonical.com>
Message-Id: <157099541752.6588.16417560834242612328.malone@gac.canonical.com>
Subject: [Bug 1847906] Re: Cocoa display hangs on macOS 10.15 (Catalina)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="af2eefe214bd95389a09b7c956720881bab16807";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a8902e28d14ae0498e5ae1a3b69d7086738da558
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
Reply-To: Bug 1847906 <1847906@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am also affected by this after upgrading to 10.15 Catalina.

I experience the same behavior using `qemu-system-x86_64`, but I can't
confirm whether other systems are also affected.

Building with SDL also fixed it for me so far:

* `brew edit`
* add `depends_on "sdl2"` among other dependencies
* replace `--enable-cocoa` with `--disable-cocoa`
* replace `--disable-sdl` with `--enable-sdl`
* save, quit, and `brew install --build-from-source qemu`

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1847906

Title:
  Cocoa display hangs on macOS 10.15 (Catalina)

Status in QEMU:
  New

Bug description:
  I have downloaded the latest stable source tarball 4.1.0 and compiled
  it (i386-softmmu target).

  After opening a black window, QEMU hangs (spinning beach ball).
  When building with `--disable-cocoa --enable-sdl`, display seems to work =
fine.

  The same happened when I tried to build QEMU through HomeBrew and
  MacPorts.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1847906/+subscriptions

