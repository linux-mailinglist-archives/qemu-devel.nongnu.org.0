Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4E318AF80
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 10:17:34 +0100 (CET)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jErIz-0003Mn-Vo
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 05:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jErHR-0002Bo-8l
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 05:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jErHP-00033L-H0
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 05:15:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:49038)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jErHP-000305-AI
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 05:15:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jErHM-0005Cy-V4
 for <qemu-devel@nongnu.org>; Thu, 19 Mar 2020 09:15:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E64AF2E8048
 for <qemu-devel@nongnu.org>; Thu, 19 Mar 2020 09:15:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Mar 2020 09:01:47 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1867519@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: focal
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange mohamadh paelzer
X-Launchpad-Bug-Reporter: Mohammad Heib (mohamadh)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <158428174672.11238.3583143675239092561.malonedeb@soybean.canonical.com>
Message-Id: <158460850723.19727.16998058232947361986.malone@chaenomeles.canonical.com>
Subject: [Bug 1867519] Re: qemu 4.2 segfaults on VF detach
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: b0d6c91b2777d5534b263a68f5bb32850469c4cc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1867519 <1867519@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I regularly before a release pull in fixes that were posted for qemu-stable.
This is one of them, I'll again do such a build and retest this issue with =
it.

I identified and backported (only one needed modification) 33 patches.
But as usual there might be some context needed on top - I have build that =
over night in [1]

Testing that on my reproducer

Attach-host:
[84652.671123] vfio-pci 0000:08:00.2: enabling device (0000 -> 0002)

Attach-guest:
[   45.199920] pci 0000:00:08.0: [15b3:1016] type 00 class 0x020000
[   45.200374] pci 0000:00:08.0: reg 0x10: [mem 0x00000000-0x000fffff 64bit=
 pref]
[   45.201358] pci 0000:00:08.0: enabling Extended Tags
[   45.202726] pci 0000:00:08.0: 0.000 Gb/s available PCIe bandwidth, limit=
ed by Unknown speed x0 link at 0000:00:08.0 (capable of 63.008 Gb/s with 8 =
GT/s x8 link)
[   45.208316] pci 0000:00:08.0: BAR 0: assigned [mem 0x100000000-0x1000fff=
ff 64bit pref]
[   45.256566] mlx5_core 0000:00:08.0: enabling device (0000 -> 0002)
[   45.262103] mlx5_core 0000:00:08.0: firmware version: 14.27.1016
[   45.544010] mlx5_core 0000:00:08.0: MLX5E: StrdRq(0) RqSz(1024) StrdSz(2=
56) RxCqeCmprss(0)
[   45.710123] mlx5_core 0000:00:08.0 ens8: renamed from eth0
[   60.992547] random: crng init done
[   60.992552] random: 3 urandom warning(s) missed due to ratelimiting

Detach-host:
[84926.767411] mlx5_core 0000:08:00.2: enabling device (0000 -> 0002)
[84926.767514] mlx5_core 0000:08:00.2: firmware version: 14.27.1016
[84927.036146] mlx5_core 0000:08:00.2: MLX5E: StrdRq(0) RqSz(1024) StrdSz(2=
56) RxCqeCmprss(0)
[84927.208523] mlx5_core 0000:08:00.2 ens1v1: renamed from eth0

Detach-guest:
<nothing>


So yes, these changes fix the issue here (and a bunch of others).
I'll open up an MP to get these changes into Ubuntu 20.04.

[1]: https://launchpad.net/~ci-train-ppa-service/+archive/ubuntu/3981

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1867519

Title:
  qemu 4.2 segfaults on VF detach

Status in QEMU:
  Fix Committed
Status in qemu package in Ubuntu:
  Confirmed

Bug description:
  After updating Ubuntu 20.04 to the Beta version, we get the following
  error and the virtual machines stucks when detaching PCI devices using
  virsh command:

  Error:
  error: Failed to detach device from /tmp/vf_interface_attached.xml
  error: internal error: End of file from qemu monitor

  steps to reproduce:
   1. create a VM over Ubuntu 20.04 (5.4.0-14-generic)
   2. attach PCI device to this VM (Mellanox VF for example)
   3. try to detaching  the PCI device using virsh command:
     a. create a pci interface xml file:
          =

        <hostdev mode=3D'subsystem' type=3D'pci' managed=3D'yes'>
        <driver name=3D'vfio'/>
        <source>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x11' slot=3D'0x00' =
function=3D'0x2' />
        </source>
        </hostdev>
      =

     b.  #virsh detach-device <VM-Doman-name> <pci interface xml file>


  - Ubuntu release:
    Description:    Ubuntu Focal Fossa (development branch)
    Release:        20.04

  - Package ver:
    libvirt0:
    Installed: 6.0.0-0ubuntu3
    Candidate: 6.0.0-0ubuntu5
    Version table:
       6.0.0-0ubuntu5 500
          500 http://il.archive.ubuntu.com/ubuntu focal/main amd64 Packages
   *** 6.0.0-0ubuntu3 100
          100 /var/lib/dpkg/status

  - What you expected to happen: =

    PCI device detached without any errors.

  - What happened instead:
    getting the errors above and he VM stuck

  additional info:
  after downgrading the libvirt0 package and all the dependent packages to =
5.4 the previous, version, seems that the issue disappeared

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1867519/+subscriptions

