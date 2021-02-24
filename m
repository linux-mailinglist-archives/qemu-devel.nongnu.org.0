Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CFD32383D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 09:02:57 +0100 (CET)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEp8K-0002dL-1u
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 03:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lEp6q-0002C7-S5
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:01:24 -0500
Received: from indium.canonical.com ([91.189.90.7]:48542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lEp6o-0004jZ-7O
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:01:24 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lEp6m-0000zZ-GZ
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:01:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5FF352E8143
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:01:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Feb 2021 07:55:07 -0000
From: =?utf-8?q?Jos=C3=A9_Pekkarinen?= <1908832@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: koalinux schoenebeck
X-Launchpad-Bug-Reporter: =?utf-8?q?Jos=C3=A9_Pekkarinen_=28koalinux=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Jos=C3=A9_Pekkarinen_=28koalinux=29?=
References: <160848897234.4298.12739306431901820443.malonedeb@wampee.canonical.com>
Message-Id: <161415330721.7209.10377443778673632209.malone@gac.canonical.com>
Subject: [Bug 1908832] Re: jack audio dev produces no sound
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f759833f01c7f0b01b31b10cf317a55893ebb0ad"; Instance="production"
X-Launchpad-Hash: 6eb3f405b273133b88754846fba356b18bb6a6fb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1908832 <1908832@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I spend some time debugging this during the morning, I found that there is =
a check
while connecting the ports that always exits the function without connectin=
g the
jack ports, simplifying it as in the following diff lets me build and use t=
he
audio outputs correctly in the vm:

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 3b7c18443d..f417e4db8a 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -369,7 +369,7 @@ static size_t qjack_read(HWVoiceIn *hw, void *buf, size=
_t len)
 =

 static void qjack_client_connect_ports(QJackClient *c)
 {
-    if (!c->connect_ports || !c->opt->connect_ports) {
+   if (!c->connect_ports) {
         return;
     }

So, I wonder, what is this c->opt->connect_ports all about, is it needed, o=
r just
wrongly initialized so that it caps the port connection?

Thanks!

Jose.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908832

Title:
  jack audio dev produces no sound

Status in QEMU:
  New

Bug description:
  Hi,

  I'm testing the new jack audiodev backend in my
  laptop. The host system is gentoo, using the
  ebuild for qemu 5.1.0-r2, and I'm using jack
  use flag globally in the system so any ebuild
  that have support for jack should be build with
  it. The jack setup reportedly works as I use it
  with firefox, and mumble with no trouble. When
  I launch the following script, I see the vm
  connects to jack:

  /usr/bin/qemu-system-x86_64 -enable-kvm -M q35 -vga virtio -display gtk,g=
l=3Don \
          -cpu host -smp 2,cores=3D2,threads=3D1 \
          -m 4G -L /usr/share/qemu \
          -global ICH9-LPC.disable_s3=3D1 -global ICH9-LPC.disable_s4=3D1 \
          -drive file=3D/usr/share/edk2-ovmf/OVMF_CODE.fd,if=3Dpflash,forma=
t=3Draw,unit=3D0,readonly=3Don \
          -drive file=3Ddebian_VARS.fd,if=3Dpflash,format=3Draw,unit=3D1 \
          -audiodev id=3Djack,driver=3Djack -device ich9-intel-hda -device =
hda-duplex,audiodev=3Djack \
          -device virtio-serial-pci \
          -device virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.=
spice.0 \
          -chardev spicevmc,id=3Dspicechannel0,name=3Dvdagent \
          -device nec-usb-xhci,id=3Dusb \
          -device usb-host,vendorid=3D0x04ca,productid=3D0x708e \
          -device usb-host,vendorid=3D0x1050,productid=3D0x0407 \
          -chardev spicevmc,name=3Dusbredir,id=3Dusbredirchardev1 \
          -device usb-redir,chardev=3Dusbredirchardev1,id=3Dusbredirdev1 \
          -chardev spicevmc,name=3Dusbredir,id=3Dusbredirchardev2 \
          -device usb-redir,chardev=3Dusbredirchardev2,id=3Dusbredirdev2 \
          -chardev spicevmc,name=3Dusbredir,id=3Dusbredirchardev3 \
          -device usb-redir,chardev=3Dusbredirchardev3,id=3Dusbredirdev3 \
          -netdev user,id=3Duser.0 -device virtio-net-pci,netdev=3Duser.0 \
          -drive file=3Ddebian.qcow2,cache=3Dnone,aio=3Dio_uring,if=3Dvirtio

  Output of vm initialization:

  jack: JACK output configured for 48000Hz (1024 samples)
  jack: JACK input configured for 48000Hz (1024 samples)
  gl_version 46 - core profile enabled
  GLSL feature level 430

  Though executing any application that uses sound,
  for instance, any youtube video through browser,
  I listen nothing. By executing pkill jackd, and
  launching the same script replacing the audiodev
  line for the following:

          -audiodev id=3Dalsa,driver=3Dalsa -device ich9-intel-hda -device
  hda-duplex,audiodev=3Dalsa \

  The audio works, and I can listen to music, or
  any other kind of application, though I cannot
  listen anything else in the host.

  The guest is a simple debian testing(bullseye)
  system with plasma desktop, using pulseaudio,
  nothing fancy.

  Thanks!

  Jos=C3=A9

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908832/+subscriptions

