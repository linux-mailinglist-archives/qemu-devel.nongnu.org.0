Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5D9D42D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 18:40:02 +0200 (CEST)
Received: from localhost ([::1]:55714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2I2D-0002sU-Kd
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 12:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i2HoI-0001UD-Ea
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i2HoH-0007cK-2o
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:25:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:53324)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i2HoG-0007bH-Pe
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:25:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i2HoD-0002Uv-R5
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 16:25:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AF4462E80CC
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 16:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Aug 2019 16:11:35 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc ajbennee rth
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <156683160080.31851.8159878323909291412.malonedeb@soybean.canonical.com>
 <156683348223.2485.3705708265196858485.malone@chaenomeles.canonical.com>
Message-Id: <87imqjzz2g.fsf@linaro.org>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19031";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 90c944bfb2cfb19e7fcdb7c4a6241f7c4b15f411
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: Re: [Qemu-devel] [Bug 1841442] Re: floating point emulation can
 fail to set FE_INEXACT
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
Reply-To: Bug 1841442 <1841442@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <rth@twiddle.net> writes:

> Well, maybe yes and maybe no.  What you've done is choose two targets
> whose floating point emulation have not been well maintained.

So this is a failure on the x86_64 and ppc64 frontends to correctly set
the softfloat modes when their appropriate registers are set?

>
> If I try this same test on aarch64, it passes:
>
> $ ~/a.out 0x0000000000000001
> 0x0000000000000001 0.000000
> 0x0
>
> 0x18
> FE_INEXACT FE_UNDERFLOW
> 0x0000000000000000 0.000000
>
> $ ./aarch64-linux-user/qemu-aarch64 ~/a.out 0x0000000000000001
> 0x0000000000000001 0.000000
> 0x0
>
> 0x18
> FE_INEXACT FE_UNDERFLOW
> 0x0000000000000000 0.000000


--
Alex Benn=C3=A9e

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1841442

Title:
  floating point emulation can fail to set FE_INEXACT

Status in QEMU:
  New

Bug description:
  Floating point emulation can fail to set FE_INEXACT in some
  circumstances. This shows up quite often in glibc's "math" tests.  A
  similar test is attached.

  On ppc64le native:
  --
  $ gcc nextafter.c -o nextafter -lm
  $ ./nextafter $(./nextafter)
  0x0000000000000001 0.000000
  0x0

  0xa000000
  FE_INEXACT FE_UNDERFLOW
  0x0000000000000000 0.000000
  --

  On x86_64:
  --
  $ gcc nextafter.c -o nextafter -lm
  $ ./nextafter $(./nextafter)
  0x0000000000000001 0.000000
  0x0

  0x30
  FE_INEXACT FE_UNDERFLOW =

  0x0000000000000000 0.000000
  --

  Using qemu-system-ppc64
  --
  $ ./nextafter $(./nextafter)
  0x0000000000000001 0.000000
  0x0

  0x8000000
  FE_UNDERFLOW =

  0x0000000000000000 0.000000
  --

  Using qemu-x86_64:
  --
  $ ./nextafter $(./nextafter)
  0x0000000000000001 0.000000
  0x0

  0x0

  0x0000000000000000 0.000000
  --

  QEMU versions vary, but not too much, and are pretty close to git HEAD:
  - 586f3dced9 (HEAD -> master, origin/master, origin/HEAD) Merge remote-tr=
acking branch 'remotes/cohuck/tags/s390x-20190822' into staging
  - 864ab31 Update version for v4.1.0-rc4 release

  Since the issue happens nearly identically on different targets, I
  suspect the issue lies somewhere in fpu/softfloat.c.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1841442/+subscriptions

