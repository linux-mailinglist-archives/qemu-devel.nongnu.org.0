Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7247300D72
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:13:22 +0100 (CET)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32o3-0005oW-65
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l32li-0004Ou-3c
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:10:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:35294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l32lb-0004I6-Vi
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:10:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l32la-0002LO-61
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:10:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2227C2E8138
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Jan 2021 20:00:50 -0000
From: =?utf-8?q?Eugenio_P=C3=A9rez?= <1912846@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: iommu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eperezma
X-Launchpad-Bug-Reporter: =?utf-8?q?Eugenio_P=C3=A9rez_=28eperezma=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Eugenio_P=C3=A9rez_=28eperezma=29?=
Message-Id: <161134565058.20216.456048884922676547.malonedeb@wampee.canonical.com>
Subject: [Bug 1912846] [NEW] Assertion hit on hot-unplugging virtio iommu
 enabled device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: 938ba742cfd9dfd6ea417c3fb5c2e74ab8918a1d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1912846 <1912846@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

>From commit ("2d24a646 device-core: use RCU for
list of children of a bus") an assertion is hit when
removing a iommu aware virtio device, since as->listeners
are not properly removed. To reproduce:

/home/qemu/build/x86_64-softmmu/qemu-system-x86_64 -qmp tcp:0:4444,server,n=
owait ... \
=C2=A0=C2=A0=C2=A0=C2=A0-netdev tap,id=3Dhostnet0,vhostforce=3Don,vhost=3Do=
n \
=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,=
mac=3D52:54:00:14:18:cc,bus=3Dpci.1,addr=3D0x0,iommu_platform=3Don,ats=3Don

In QMP:
{'execute': 'qmp_capabilities'}
{"execute": "device_del", "arguments": {"id": "net0"} }

And crash:
../softmmu/memory.c:2818: do_address_space_destroy: Assertion `QTAILQ_EMPTY=
(&as->listeners)' failed.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: iommu

** Description changed:

  From commit ("2d24a646 device-core: use RCU for
  list of children of a bus") an assertion is hit when
- removing a device, since mr->listeners are not properly
+ removing a device, since as->listeners are not properly
  removed. To reproduce:
  =

  /home/qemu/build/x86_64-softmmu/qemu-system-x86_64 -qmp tcp:0:4444,server=
,nowait ... \
-     -netdev tap,id=3Dhostnet0,vhostforce=3Don,vhost=3Don \
-     -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:14:=
18:cc,bus=3Dpci.1,addr=3D0x0,iommu_platform=3Don,ats=3Don
+ =C2=A0=C2=A0=C2=A0=C2=A0-netdev tap,id=3Dhostnet0,vhostforce=3Don,vhost=
=3Don \
+ =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet=
0,mac=3D52:54:00:14:18:cc,bus=3Dpci.1,addr=3D0x0,iommu_platform=3Don,ats=3D=
on
  =

  In QMP:
  {'execute': 'qmp_capabilities'}
  {"execute": "device_del", "arguments": {"id": "net0"} }
  =

  And crash:
  ../softmmu/memory.c:2818: do_address_space_destroy: Assertion `QTAILQ_EMP=
TY(&as->listeners)' failed.

** Description changed:

  From commit ("2d24a646 device-core: use RCU for
  list of children of a bus") an assertion is hit when
- removing a device, since as->listeners are not properly
- removed. To reproduce:
+ removing a iommu aware virtio device, since as->listeners
+ are not properly removed. To reproduce:
  =

  /home/qemu/build/x86_64-softmmu/qemu-system-x86_64 -qmp tcp:0:4444,server=
,nowait ... \
  =C2=A0=C2=A0=C2=A0=C2=A0-netdev tap,id=3Dhostnet0,vhostforce=3Don,vhost=
=3Don \
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet=
0,mac=3D52:54:00:14:18:cc,bus=3Dpci.1,addr=3D0x0,iommu_platform=3Don,ats=3D=
on
  =

  In QMP:
  {'execute': 'qmp_capabilities'}
  {"execute": "device_del", "arguments": {"id": "net0"} }
  =

  And crash:
  ../softmmu/memory.c:2818: do_address_space_destroy: Assertion `QTAILQ_EMP=
TY(&as->listeners)' failed.

** Summary changed:

- Assertion hit on hot-unplugging iommu enabled device
+ Assertion hit on hot-unplugging virtio iommu enabled device

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912846

Title:
  Assertion hit on hot-unplugging virtio iommu enabled device

Status in QEMU:
  New

Bug description:
  From commit ("2d24a646 device-core: use RCU for
  list of children of a bus") an assertion is hit when
  removing a iommu aware virtio device, since as->listeners
  are not properly removed. To reproduce:

  /home/qemu/build/x86_64-softmmu/qemu-system-x86_64 -qmp tcp:0:4444,server=
,nowait ... \
  =C2=A0=C2=A0=C2=A0=C2=A0-netdev tap,id=3Dhostnet0,vhostforce=3Don,vhost=
=3Don \
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet=
0,mac=3D52:54:00:14:18:cc,bus=3Dpci.1,addr=3D0x0,iommu_platform=3Don,ats=3D=
on

  In QMP:
  {'execute': 'qmp_capabilities'}
  {"execute": "device_del", "arguments": {"id": "net0"} }

  And crash:
  ../softmmu/memory.c:2818: do_address_space_destroy: Assertion `QTAILQ_EMP=
TY(&as->listeners)' failed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912846/+subscriptions

