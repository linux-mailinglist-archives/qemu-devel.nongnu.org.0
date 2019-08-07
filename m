Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317684980
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 12:31:57 +0200 (CEST)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvJEa-0001qz-88
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 06:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44613)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hvJDp-00013i-EF
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:31:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hvJDn-0006qY-FY
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:31:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:53378)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hvJDl-0006oX-HP
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:31:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hvJDh-0002KX-7J
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 10:31:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F197C2E80CB
 for <qemu-devel@nongnu.org>; Wed,  7 Aug 2019 10:31:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Aug 2019 10:18:39 -0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bjoern-teipel dgilbert-h
X-Launchpad-Bug-Reporter: Bjoern Teipel (bjoern-teipel)
X-Launchpad-Bug-Modifier: Dr. David Alan Gilbert (dgilbert-h)
References: <156460681322.6584.3709701644111615718.malonedeb@soybean.canonical.com>
Message-Id: <156517311944.16542.4521636132971914031.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19015";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 767927b6501af597b1fd23b2b378e90b91f2ddc4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838569] Re: virtio-balloon change breaks post
 4.0 upgrade
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
Reply-To: Bug 1838569 <1838569@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bjoern,
  I don't think this is the same bug as the one you reference; that's a con=
fig space disagreement, not a virtio queue disagreeement.

It almost feels like the old 4a1e48becab81020adfb74b22c76a595f2d02a01
stats migration fix; but that went in with 2.8 so shouldn't be a problem
going 2.10 to 2.11

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838569

Title:
  virtio-balloon change breaks post 4.0 upgrade

Status in QEMU:
  New

Bug description:
  We upgraded the libvirt UCA packages from 3.6 to 4.0 and qemu 2.10 to 2.1=
1  as part of a queens upgrade and noticed that
  virtio-ballon is broken when instances live migrate (started with a prior=
 3.6 version)  with:

  2019-07-24T06:46:49.487109Z qemu-system-x86_64: warning: Unknown firmware=
 file in legacy mode: etc/msr_feature_control
  2019-07-24T06:47:22.187749Z qemu-system-x86_64: VQ 2 size 0x80 < last_ava=
il_idx 0xb57 - used_idx 0xb59
  2019-07-24T06:47:22.187768Z qemu-system-x86_64: Failed to load virtio-bal=
loon:virtio
  2019-07-24T06:47:22.187771Z qemu-system-x86_64: error while loading state=
 for instance 0x0 of device '0000:00:05.0/virtio-balloon'
  2019-07-24T06:47:22.188194Z qemu-system-x86_64: load of migration failed:=
 Operation not permitted
  2019-07-24 06:47:22.430+0000: shutting down, reason=3Dfailed

  This seem to be the exact problem as reported by
  https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg02228.html

  Listed the packages which changed:

  Start-Date: 2019-07-06  06:40:55
  Commandline: /usr/bin/apt-get -y -o Dpkg::Options::=3D--force-confdef -o =
Dpkg::Options::=3D--force-confold install libvirt-bin python-libvirt qemu q=
emu-utils qemu-system qemu-system-arm qemu-system-mips qemu-system-ppc qemu=
-system-sparc qemu-system-x86 qemu-system-misc qemu-block-extra qemu-utils =
qemu-user qemu-kvm
  Install: librdmacm1:amd64 (17.1-1ubuntu0.1~cloud0, automatic), libvirt-da=
emon-driver-storage-rbd:amd64 (4.0.0-1ubuntu8.10~cloud0, automatic), ipxe-q=
emu-256k-compat-efi-roms:amd64 (1.0.0+git-20150424.a25a16d-0ubuntu2~cloud0,=
 automatic)
  Upgrade: qemu-system-mips:amd64 (1:2.10+dfsg-0ubuntu3.8~cloud1, 1:2.11+df=
sg-1ubuntu7.13~cloud0), qemu-system-misc:amd64 (1:2.10+dfsg-0ubuntu3.8~clou=
d1, 1:2.11+dfsg-1ubuntu7.13~cloud0), qemu-system-ppc:amd64 (1:2.10+dfsg-0ub=
untu3.8~cloud1, 1:2.11+dfsg-1ubuntu7.13~cloud0), python-libvirt:amd64 (3.5.=
0-1build1~cloud0, 4.0.0-1~cloud0), qemu-system-x86:amd64 (1:2.10+dfsg-0ubun=
tu3.8~cloud1, 1:2.11+dfsg-1ubuntu7.13~cloud0), libvirt-clients:amd64 (3.6.0=
-1ubuntu6.8~cloud0, 4.0.0-1ubuntu8.10~cloud0), qemu-user:amd64 (1:2.10+dfsg=
-0ubuntu3.8~cloud1, 1:2.11+dfsg-1ubuntu7.13~cloud0), libvirt-bin:amd64 (3.6=
.0-1ubuntu6.8~cloud0, 4.0.0-1ubuntu8.10~cloud0), qemu:amd64 (1:2.10+dfsg-0u=
buntu3.8~cloud1, 1:2.11+dfsg-1ubuntu7.13~cloud0), qemu-utils:amd64 (1:2.10+=
dfsg-0ubuntu3.8~cloud1, 1:2.11+dfsg-1ubuntu7.13~cloud0), libvirt-daemon-sys=
tem:amd64 (3.6.0-1ubuntu6.8~cloud0, 4.0.0-1ubuntu8.10~cloud0), qemu-system-=
sparc:amd64 (1:2.10+dfsg-0ubuntu3.8~cloud1, 1:2.11+dfsg-1ubuntu7.13~cloud0)=
, qemu-user-binfmt:amd64 (1:2.10+dfsg-0ubuntu3.8~cloud1, 1:2.11+dfsg-1ubunt=
u7.13~cloud0), qemu-kvm:amd64 (1:2.10+dfsg-0ubuntu3.8~cloud1, 1:2.11+dfsg-1=
ubuntu7.13~cloud0), libvirt0:amd64 (3.6.0-1ubuntu6.8~cloud0, 4.0.0-1ubuntu8=
.10~cloud0), qemu-system-arm:amd64 (1:2.10+dfsg-0ubuntu3.8~cloud1, 1:2.11+d=
fsg-1ubuntu7.13~cloud0), qemu-block-extra:amd64 (1:2.10+dfsg-0ubuntu3.8~clo=
ud1, 1:2.11+dfsg-1ubuntu7.13~cloud0), qemu-system-common:amd64 (1:2.10+dfsg=
-0ubuntu3.8~cloud1, 1:2.11+dfsg-1ubuntu7.13~cloud0), qemu-system:amd64 (1:2=
.10+dfsg-0ubuntu3.8~cloud1, 1:2.11+dfsg-1ubuntu7.13~cloud0), libvirt-daemon=
:amd64 (3.6.0-1ubuntu6.8~cloud0, 4.0.0-1ubuntu8.10~cloud0)
  End-Date: 2019-07-06  06:41:08

  At this point the instances would have to be hard rebooted or
  stopped/started to fix the issue for future live migration attemps

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838569/+subscriptions

