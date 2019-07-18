Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A76D347
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 19:55:55 +0200 (CEST)
Received: from localhost ([::1]:40124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoAdG-00084D-4M
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 13:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hoAd2-0007fj-Kl
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 13:55:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hoAd0-00065B-FB
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 13:55:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:35070)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hoAcy-00062g-GE
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 13:55:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hoAcw-0002JY-29
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 17:55:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9754E2E80D3
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 17:55:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jul 2019 17:47:39 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1837094@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: slirp
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
Message-Id: <156347205992.30489.16276823737610194084.malonedeb@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e5d20805552f5e80ca51af093f1b9517d6d647ce
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1837094] [NEW] UndefinedBehaviorSanitizer crash
 around slirp::ip_reass()
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
Reply-To: Bug 1837094 <1837094@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

tag: v4.1.0-rc1

./configure --enable-sanitizers --extra-cflags=3D-O1

=3D=3D26130=3D=3DERROR: UndefinedBehaviorSanitizer: SEGV on unknown address=
 0x000000000008 (pc 0x00000046d588 bp 0x7fff6ee9f940 sp 0x7fff6ee9f8e8 T261=
30)
=3D=3D26130=3D=3DThe signal is caused by a WRITE memory access.
=3D=3D26130=3D=3DHint: address points to the zero page.
    #0 0x0000561ad346d587 in ip_deq() at slirp/src/ip_input.c:411:55
    #1 0x0000561ad346cffb in ip_reass() at slirp/src/ip_input.c:304:9
    #2 0x0000561ad346cb6f in ip_input() at slirp/src/ip_input.c:184:18

I only had access to the last packet which isn't the culprit, I'm now
seeing how to log the network traffic of the guest to provide more
useful information.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: slirp

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837094

Title:
  UndefinedBehaviorSanitizer crash around slirp::ip_reass()

Status in QEMU:
  New

Bug description:
  tag: v4.1.0-rc1

  ./configure --enable-sanitizers --extra-cflags=3D-O1

  =3D=3D26130=3D=3DERROR: UndefinedBehaviorSanitizer: SEGV on unknown addre=
ss 0x000000000008 (pc 0x00000046d588 bp 0x7fff6ee9f940 sp 0x7fff6ee9f8e8 T2=
6130)
  =3D=3D26130=3D=3DThe signal is caused by a WRITE memory access.
  =3D=3D26130=3D=3DHint: address points to the zero page.
      #0 0x0000561ad346d587 in ip_deq() at slirp/src/ip_input.c:411:55
      #1 0x0000561ad346cffb in ip_reass() at slirp/src/ip_input.c:304:9
      #2 0x0000561ad346cb6f in ip_input() at slirp/src/ip_input.c:184:18

  I only had access to the last packet which isn't the culprit, I'm now
  seeing how to log the network traffic of the guest to provide more
  useful information.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837094/+subscriptions

