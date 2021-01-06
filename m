Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985BA2EC0CF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 17:03:53 +0100 (CET)
Received: from localhost ([::1]:53462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxBHs-0007Ca-MU
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 11:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxBFV-0005ze-LP
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:01:30 -0500
Received: from indium.canonical.com ([91.189.90.7]:51810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxBFS-0000eC-GH
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:01:25 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxBFQ-0000c9-Cd
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 16:01:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2F5942E813A
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 16:01:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 Jan 2021 15:45:36 -0000
From: "Vladislav K. Valtchev" <1873769@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aperamak markostamcar vvaltchev
X-Launchpad-Bug-Reporter: =?utf-8?q?Marko_=C5=A0tamcar_=28markostamcar=29?=
X-Launchpad-Bug-Modifier: Vladislav K. Valtchev (vvaltchev)
References: <158737489336.27883.11672421823937229418.malonedeb@gac.canonical.com>
Message-Id: <160994793685.6668.11043649945431605601.malone@soybean.canonical.com>
Subject: [Bug 1873769] Re: SB16 audio playback freezes emulation in Windows 95
 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: b34c7a76e9cbb84f6131c76a70698f9a103d5732
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1873769 <1873769@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Allan, =

I've hit EXACTLY the same problem, while writing a SB16 driver.

Reproducing the bug
----------------------
I've tried to QEMU 4 in several scenarios (GTK UI, text mode with the -curs=
es option,
just serial console with -nographic and with virt-manager which uses Spice)=
. It works
as expected in all the cases EXCEPT for the GTK UI: in that case, the video=
 freezes
while playing the sound, exactly as in the video posted by Marko; even QEMU=
's menu
doesn't respond while the audio is playing (the bug affects the whole QEMU =
UI).

Regression
---------------------
I've also tried the same test with QEMU 2.11, on another machine with Ubunt=
u 18.04 (LTS)
and there the problem simply does *not* exist. QEMU's UI (does QEMU 2.x use=
s GTK?),
works GREAT while playing SB16 audio.

Conclusion
----------------
Is there any chance this bug could be fixed easily, or a fix would necessar=
ily require
a (partial) re-design of the way the GTK UI works? In particular, why on QE=
MU 2.11 the
problem does not exist?


Thanks in advance,
Vlad

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873769

Title:
  SB16 audio playback freezes emulation in Windows 95 guest

Status in QEMU:
  New

Bug description:
  - QEMU 4.2.93 (v5.0.0-rc3) built from latest git master
  20038cd7a8412feeb49c01f6ede89e36c8995472 using MSYS2 on Windows 10 and
  launched on same Windows 10

  - Launched using "qemu-system-i386.exe -drive format=3Draw,file=3Dhdd-
  2gb.img -soundhw pcspk,sb16 -m 16 -cpu pentium -vga std -cdrom
  Windows_95.iso -boot c"

  - I have attached video screen capture of the issue

  ---

  I decided to make my first ever QEMU build after encountering the
  dsound issues using the latest 4.2.0 binary from
  https://qemu.weilnetz.de/w64/. In my 5.0.0-rc3 build the sound
  playback is working correctly, however the whole Windows 95 UI freezes
  while sound is playing.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873769/+subscriptions

