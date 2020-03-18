Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804C189AB9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 12:34:21 +0100 (CET)
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEWxo-00006N-A5
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 07:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jEWuV-00065Q-1n
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 07:30:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jEWuT-0000jk-Na
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 07:30:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:34672)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jEWuS-0000ce-Cg
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 07:30:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jEWuQ-0003pY-UD
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 11:30:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E2D9F2E80CC
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 11:30:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Mar 2020 11:21:24 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1867519@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: focal
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mohamadh paelzer
X-Launchpad-Bug-Reporter: Mohammad Heib (mohamadh)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <158428174672.11238.3583143675239092561.malonedeb@soybean.canonical.com>
Message-Id: <158453048428.20526.15578667591193542210.malone@wampee.canonical.com>
Subject: [Bug 1867519] Re: qemu 4.2 segfaults on VF detach
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: cfc223da28b94475ce0ce9e5e33bb6dbf9541bbf
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

I changed the bug task to Qemu (Ubuntu) as this isn't a libvirt error.

I also added an upstream qemu task in case this is a known issue for the
developers there. Someone might be able to point us at a known
discussion/fix.

The Backtrace I added in the last comment should help to identify known
cases.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1867519

Title:
  qemu 4.2 segfaults on VF detach

Status in QEMU:
  New
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

