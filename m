Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E32B32FB
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 09:42:11 +0100 (CET)
Received: from localhost ([::1]:60970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keDbu-0006MQ-Gb
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 03:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keDab-0005w6-Ez
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 03:40:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:45298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keDaX-0005NI-Ah
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 03:40:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1keDaV-00042f-5m
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 08:40:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 071982E80E9
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 08:40:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2020 08:31:33 -0000
From: Takumi Nakamura <1904315@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chapuni
X-Launchpad-Bug-Reporter: Takumi Nakamura (chapuni)
X-Launchpad-Bug-Modifier: Takumi Nakamura (chapuni)
Message-Id: <160542909340.674.17512745365232880697.malonedeb@gac.canonical.com>
Subject: [Bug 1904315] [NEW] CTRL+ALT is ignored on gtk window (configured
 with gtk and sdl)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: f4db8f427c879a04f878a54108ebe946681b5ad4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 03:40:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1904315 <1904315@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I am building and using qemu on Windows 10 via git.
Building for targeting windows, on debian.

Since meson is introduced, my executable, qemu-system-x86_64.exe, tends to =
ignore hotkeys
(like CTRL+ATL+G, CTRL+ALT+2)

As far as I have been investigating the issue, I am suspicious that gtk and=
 sdl might be incompatible.
With configure --disable-sdl, my executable works fine.
My application doesn't require sdl.

Possibly due to link order, especially SDLmain, I guess.

I suggest;
- Clarify that gtk and sdl are incompatible.
- Tweak built script or startup not to prevent gtk and sdl each other.

Excuse me, the issue has not been reproduced at home yet. I met it at work.
(My manager said it's fine to report issues by me at home)
I will construct reproducible environment at home, if my further investigat=
ion would be required.

Thanks.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904315

Title:
  CTRL+ALT is ignored on gtk window (configured with gtk and sdl)

Status in QEMU:
  New

Bug description:
  I am building and using qemu on Windows 10 via git.
  Building for targeting windows, on debian.

  Since meson is introduced, my executable, qemu-system-x86_64.exe, tends t=
o ignore hotkeys
  (like CTRL+ATL+G, CTRL+ALT+2)

  As far as I have been investigating the issue, I am suspicious that gtk a=
nd sdl might be incompatible.
  With configure --disable-sdl, my executable works fine.
  My application doesn't require sdl.

  Possibly due to link order, especially SDLmain, I guess.

  I suggest;
  - Clarify that gtk and sdl are incompatible.
  - Tweak built script or startup not to prevent gtk and sdl each other.

  Excuse me, the issue has not been reproduced at home yet. I met it at wor=
k.
  (My manager said it's fine to report issues by me at home)
  I will construct reproducible environment at home, if my further investig=
ation would be required.

  Thanks.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904315/+subscriptions

