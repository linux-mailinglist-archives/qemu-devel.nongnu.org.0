Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7070E2954C9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 00:27:35 +0200 (CEST)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVMZy-0003E8-GB
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 18:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kVMY7-00029m-EN
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 18:25:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kVMY5-0000xv-Ds
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 18:25:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kVMY3-0001Eu-LX
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 22:25:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9ED2B2E8025
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 22:25:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2020 22:19:39 -0000
From: bwidawsk <1900919@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bwidawsk
X-Launchpad-Bug-Reporter: bwidawsk (bwidawsk)
X-Launchpad-Bug-Modifier: bwidawsk (bwidawsk)
Message-Id: <160331877993.30496.14778848047318719784.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1900919] [NEW] PXB selected as root bus incorrectly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bc5a16cfdc4ba776ecdf84a052201ef8fb1f3321"; Instance="production"
X-Launchpad-Hash: 1ad83dfd113bb0ed8ffe6166528aa9310bc6e89d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 18:25:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1900919 <1900919@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

release: 4c41341af76cfc85b5a6c0f87de4838672ab9f89

qdev_device_add() will search for the "closest" bus possible, and bail out =
early if that bus is a root bus. pxb devices are considered root buses and =
so if you either
1. Add a PCI device on the QEMU command line *after* a pxb device, or
2. Add an integrated PCI device (like a watchdog)

#1: -device pxb-pcie,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52 -device ahci,id=3D=
sata0,addr=3D0x8
#2: -watchdog i6300esb -device pxb-pcie,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52

The PXB will get selected as the bus (instead of the real root bus) and
this will cause an assertion failure with the message like "qemu-system-
x86_64: -device ahci,id=3Dsata0,addr=3D0x8: PCI: Only PCI/PCIe bridges can
be plugged into pxb-pcie"

I think this is relatively solvable in the code base by determining if a
bus is an expander, and skipping it if so. However, I wonder if it makes
more sense to just allow expanders to have endpoint devices.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1900919

Title:
  PXB selected as root bus incorrectly

Status in QEMU:
  New

Bug description:
  release: 4c41341af76cfc85b5a6c0f87de4838672ab9f89

  qdev_device_add() will search for the "closest" bus possible, and bail ou=
t early if that bus is a root bus. pxb devices are considered root buses an=
d so if you either
  1. Add a PCI device on the QEMU command line *after* a pxb device, or
  2. Add an integrated PCI device (like a watchdog)

  #1: -device pxb-pcie,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52 -device ahci,id=
=3Dsata0,addr=3D0x8
  #2: -watchdog i6300esb -device pxb-pcie,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D=
52

  The PXB will get selected as the bus (instead of the real root bus)
  and this will cause an assertion failure with the message like "qemu-
  system-x86_64: -device ahci,id=3Dsata0,addr=3D0x8: PCI: Only PCI/PCIe
  bridges can be plugged into pxb-pcie"

  I think this is relatively solvable in the code base by determining if
  a bus is an expander, and skipping it if so. However, I wonder if it
  makes more sense to just allow expanders to have endpoint devices.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1900919/+subscriptions

