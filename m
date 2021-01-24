Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB15301ECA
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:47:09 +0100 (CET)
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3mHr-0002um-TV
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3mGT-0002OK-Fc
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 15:45:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3mGQ-0002uj-Dl
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 15:45:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l3mGO-0006FX-CG
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 20:45:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 579842E8137
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 20:45:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 Jan 2021 20:38:18 -0000
From: Bruno Haible <1892441@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: s390x softmmu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn bruno-clisp th-huth
X-Launchpad-Bug-Reporter: Ahmed Karaman (ahmedkrmn)
X-Launchpad-Bug-Modifier: Bruno Haible (bruno-clisp)
References: <159797545688.2805.5115079878417995484.malonedeb@chaenomeles.canonical.com>
Message-Id: <161152069870.10605.17475201461312326628.malone@gac.canonical.com>
Subject: [Bug 1892441] Re: "No zIPL section in IPL2 record" error when
 emulating Debian 10.5.0 on s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: a45938c42e225d534247b8604571c3002c63f110
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1892441 <1892441@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes. For booting Debian images using QEMU (<=3D 5.0.0) I use this recipe:

machine_args=3D"-M s390-ccw-virtio -m 512"
disk_args=3D"-drive file=3Ddebian86.img,if=3Dnone,format=3Draw,id=3Dhd0 -de=
vice virtio-blk-ccw,drive=3Dhd0"
net_args=3D""
display_args=3D"-display gtk -monitor stdio"
common_args=3D"$machine_args $disk_args $net_args $display_args"

Pull kernel and initrd from the ftp server:
mkdir boot-for-install
(cd boot-for-install
 wget ftp://ftp.de.debian.org/pub/debian/dists/jessie/main/installer-s390x/=
current/images/generic/kernel.debian
 wget ftp://ftp.de.debian.org/pub/debian/dists/jessie/main/installer-s390x/=
current/images/generic/initrd.debian)

Then, for running the installer:
qemu-system-s390x $common_args -kernel boot-for-install/kernel.debian -init=
rd boot-for-install/initrd.debian

For booting from disk:
qemu-system-s390x $common_args -kernel boot/vmlinuz -initrd boot/initrd.img=
 -append "root=3D/dev/vda2"

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892441

Title:
  "No zIPL section in IPL2 record" error when emulating Debian 10.5.0 on
  s390x

Status in QEMU:
  Invalid

Bug description:
  Hi,

  I want to emulate Debian 10.5.0 for the s390x architecture on an
  Ubuntu x86_64 host.

  The Debian image is downloaded from the following link:
  https://cdimage.debian.org/debian-cd/current/s390x/iso-cd/debian-10.5.0-s=
390x-netinst.iso

  Using the latest QEMU version 5.1.0, the Debian image is emulated using t=
he given command:
  qemu-system-s390x -boot d -m 4096 -hda debian.qcow -cdrom debian-10.5.0-s=
390x-netinst.iso -nographic

  Running the command causes the output below:

      LOADPARM=3D[        ]
      Using virtio-blk.
      Using guessed DASD geometry.
      Using ECKD scheme (block size  4096), CDL
      =

      ! No zIPL section in IPL2 record. !

  Using exactly the same qemu command above with the Alpine 3.12 image
  for s390x ran successfully without any errors.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892441/+subscriptions

