Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C93210AB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:05:01 +0100 (CET)
Received: from localhost ([::1]:54156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4L6-0004u6-6g
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lE4Hi-0001fD-1i
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:01:30 -0500
Received: from indium.canonical.com ([91.189.90.7]:59474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lE4Hf-0006cO-La
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:01:29 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lE4Hd-0000jw-BW
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:01:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4FD002E8101
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:01:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Feb 2021 05:48:02 -0000
From: Ravishankar <1836501@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm kvm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor pmaydell rreddy78 skandal
X-Launchpad-Bug-Reporter: Lutz (skandal)
X-Launchpad-Bug-Modifier: Ravishankar (rreddy78)
References: <156313770910.15255.7682693906978508241.malonedeb@soybean.canonical.com>
Message-Id: <161397288251.16952.17649598963435999906.malone@wampee.canonical.com>
Subject: [Bug 1836501] Re: cpu_address_space_init fails with assertion
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bbfee60eef9f7fd8d30b24b3f53e75656e4d5fb0"; Instance="production"
X-Launchpad-Hash: a65d7c47e288cc359d68063cae0ab3c1631df5c4
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
Reply-To: Bug 1836501 <1836501@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When I use gdb i see that the assert line uses:

   /* KVM cannot currently support multiple address spaces. */
    assert(asidx =3D=3D 0 || !kvm_enabled());

the asidx is 1. So since KVM is not supporting multiple addresses spaces
that the Raspi3 requires the assertion occurs.

I wonder what the workaround could be for this

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836501

Title:
  cpu_address_space_init fails with assertion

Status in QEMU:
  Expired

Bug description:
  qemu-system-arm does not start with version >=3D 2.6 and KVM enabled.

    cpu_address_space_init: Assertion `asidx =3D=3D 0 || !kvm_enabled()'
  failed.

  Hardware is Odroid XU4 with Exynos with 4.9.61+ Tested with Debian
  Stretch (9) or Buster (10).

  Without KVM it is running fine but slow. I'm operating Debian Jessie
  with qemu 2.1 for a long time with KVM virtualization working
  flawlessly. When I upgraded to Stretch I ran into the trouble
  described before. I tried Debian Stretch and Buster with all Kernels
  provided by the Board manufacturer (Hardkernel).

  It seems to be related to the feature introduced in Version 2.6:
  https://wiki.qemu.org/ChangeLog/2.6
  - Support for a separate EL3 address space

  KVM is enabled, so I assume the adress space index asidx to be causing
  the assert to fail.

  dmesg | grep -i KVM
  [    0.741714] kvm [1]: 8-bit VMID
  [    0.741721] kvm [1]: IDMAP page: 40201000
  [    0.741729] kvm [1]: HYP VA range: c0000000:ffffffff
  [    0.742543] kvm [1]: Hyp mode initialized successfully
  [    0.742600] kvm [1]: vgic-v2@10484000
  [    0.742924] kvm [1]: vgic interrupt IRQ16
  [    0.742943] kvm [1]: virtual timer IRQ60

  Full command line is:
  qemu-system-arm -M vexpress-a15 -smp 2 -m 512 -cpu host -enable-kvm -kern=
el vmlinuz -initrd initrd.gz -dtb vexpress-v2p-ca15-tc1.dtb -device virtio-=
blk-device,drive=3Dinst-blk -drive file=3DPATHTOFILE,id=3Dinst-blk,if=3Dnon=
e,format=3Draw -append "vga=3Dnormal rw console=3DttyAMA0" -nographic

  Is there anything to do to understand, if this is a hardware related
  failure or probably just a missing parameter?

  Regards

  Lutz

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836501/+subscriptions

