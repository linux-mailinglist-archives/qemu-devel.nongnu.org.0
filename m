Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DAC131C7C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 00:39:10 +0100 (CET)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iobxc-0004ny-7p
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 18:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ioY9z-000351-A4
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 14:35:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ioY9x-0000kR-UL
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 14:35:31 -0500
Received: from indium.canonical.com ([91.189.90.7]:45554)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ioY9x-0000jO-O8
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 14:35:29 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ioY9w-0004QQ-9f
 for <qemu-devel@nongnu.org>; Mon, 06 Jan 2020 19:35:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 468A32E80C3
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 19:35:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jan 2020 19:22:25 -0000
From: David Miller <zezuspam@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: audio dos games gus sb16 timed timer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: zezuspam
X-Launchpad-Bug-Reporter: David Miller (zezuspam)
X-Launchpad-Bug-Modifier: David Miller (zezuspam)
Message-Id: <157833854539.28173.10729724748625497755.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1858488] [NEW] qemu git && 4.2:  timed audio issues with sb16,
 gus not working?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 80ace2334ac6114b6489071ec030c6571f1f23ad
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Mon, 06 Jan 2020 18:26:20 -0500
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
Reply-To: Bug 1858488 <1858488@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:


I have built [both] current git, and 4.2.0, there are issues with audio/sou=
ndhw for both.

Specifics:

Linux nullrig 5.3.0-24-generic #26-Ubuntu SMP Thu Nov 14 01:33:18 UTC
2019 x86_64 x86_64 x86_64 GNU/Linux

Out of source build, successful for both:

../configure --prefix=3D/opt/qemu --target-list=3Di386-softmmu,mips64el-
softmmu ---enable-sdl --enable-sdl-image --enable-lzo --enable-bzip2
--enable-avx2 --enable-kvm --enable-membarrier --enable-plugin

Call:

./qemu -machine pc,accel=3Dkvm,usb=3Doff -cpu pentium -m 64 -rtc
base=3Dlocaltime -parallel none -soundhw sb16,adlib,pcspk -device cirrus-
vga,bus=3Dpci.0 -drive id=3Ddisk1,file=3Ddoom.cow,format=3Dqcow2,if=3Dvirtio
-audiodev pa,id=3Dpa

Audio for sb16 sounds ok,  however if i switch to a timer based audio:
-audiodev wav

The output is wrong..  I had assumed it was all timer based audio,
however it seems to be limited to sb16.

So I then tried the next popular/compatible audio device for dos games:
gravis ultrasound [gus].

I get no output at all for it.
I have tried more than one piece of software,  DOOM shareware is any easy e=
xample.

I realize there are better solutions for playing DOS games, however I am
interested in snapshot support which many of them lack.

I am willing to put the work into fixing it myself if need be,  however
i'm not very familiar with the audio backend.   Specifically, it is
already mixed into a single buffer,  if 'adlib' driver is already
working: (audio_pcm_ops.write() output is correct on timer based output)
I failed to see how it affects emulation of the sound blaster.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: audio dos games gus sb16 timed timer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1858488

Title:
  qemu git && 4.2:  timed audio issues with sb16,  gus not working?

Status in QEMU:
  New

Bug description:
  =

  I have built [both] current git, and 4.2.0, there are issues with audio/s=
oundhw for both.

  Specifics:

  Linux nullrig 5.3.0-24-generic #26-Ubuntu SMP Thu Nov 14 01:33:18 UTC
  2019 x86_64 x86_64 x86_64 GNU/Linux

  Out of source build, successful for both:

  ../configure --prefix=3D/opt/qemu --target-list=3Di386-softmmu,mips64el-
  softmmu ---enable-sdl --enable-sdl-image --enable-lzo --enable-bzip2
  --enable-avx2 --enable-kvm --enable-membarrier --enable-plugin

  Call:

  ./qemu -machine pc,accel=3Dkvm,usb=3Doff -cpu pentium -m 64 -rtc
  base=3Dlocaltime -parallel none -soundhw sb16,adlib,pcspk -device
  cirrus-vga,bus=3Dpci.0 -drive
  id=3Ddisk1,file=3Ddoom.cow,format=3Dqcow2,if=3Dvirtio -audiodev pa,id=3Dpa

  Audio for sb16 sounds ok,  however if i switch to a timer based audio:
  -audiodev wav

  The output is wrong..  I had assumed it was all timer based audio,
  however it seems to be limited to sb16.

  So I then tried the next popular/compatible audio device for dos
  games:  gravis ultrasound [gus].

  I get no output at all for it.
  I have tried more than one piece of software,  DOOM shareware is any easy=
 example.

  I realize there are better solutions for playing DOS games, however I
  am interested in snapshot support which many of them lack.

  I am willing to put the work into fixing it myself if need be,
  however i'm not very familiar with the audio backend.   Specifically,
  it is already mixed into a single buffer,  if 'adlib' driver is
  already working: (audio_pcm_ops.write() output is correct on timer
  based output) I failed to see how it affects emulation of the sound
  blaster.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1858488/+subscriptions

