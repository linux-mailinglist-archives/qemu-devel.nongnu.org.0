Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A81192AD5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 15:12:27 +0100 (CET)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH6le-00054J-Vz
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 10:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60606)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jH6k0-0003PI-Lz
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:10:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jH6jz-0003TL-D6
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:10:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:39928)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jH6jz-0003Rh-7f
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:10:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jH6jx-0002gp-Ns
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 14:10:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A355B2E804C
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 14:10:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Mar 2020 14:00:45 -0000
From: Marcin Juszkiewicz <1869006@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hrw
X-Launchpad-Bug-Reporter: Marcin Juszkiewicz (hrw)
X-Launchpad-Bug-Modifier: Marcin Juszkiewicz (hrw)
References: <158514404728.11288.8869885318197124821.malonedeb@soybean.canonical.com>
Message-Id: <158514484531.19577.14109022435936130324.malone@chaenomeles.canonical.com>
Subject: [Bug 1869006] Re: PCIe cards passthrough to TCG guest works on 2GB of
 guest memory but fails on 4GB (vfio_dma_map invalid arg)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 47630c9668627007565b12e31957f6b7f89901a7
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
Reply-To: Bug 1869006 <1869006@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14:57 < aw> hrw: under /sys/kernel/iommu_groups/ there's a
reserved_regions file for every group.  cat the ones associated with the
groups for these devices

14:59 < hrw> 14:58 (0s) hrw@puchatek:28$ cat reserved_regions =

14:59 < hrw> 0x00000000fee00000 0x00000000feefffff msi
14:59 < hrw> 0x000000fd00000000 0x000000ffffffffff reserved

14:59 < hrw> 14:59 (2s) hrw@puchatek:27$ cat reserved_regions =

14:59 < hrw> 0x00000000fee00000 0x00000000feefffff msi
14:59 < hrw> 0x000000fd00000000 0x000000ffffffffff reserved

15:00 < aw> of course, you're on an x86 host, arm has no concept of not
mapping memory at 0xfee00000

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1869006

Title:
  PCIe cards passthrough to TCG guest works on 2GB of guest memory but
  fails on 4GB (vfio_dma_map invalid arg)

Status in QEMU:
  New

Bug description:
  During one meeting coworker asked "did someone tried to passthrough
  PCIe card to other arch guest?" and I decided to check it.

  Plugged SATA and USB3 controllers into spare slots on mainboard and
  started playing. On 1GB VM instance it worked (both cold- and hot-
  plugged). On 4GB one it did not:

  B=C5=82=C4=85d podczas uruchamiania domeny: internal error: process exite=
d while connecting to monitor: 2020-03-25T13:43:39.107524Z qemu-system-aarc=
h64: -device vfio-pci,host=3D0000:29:00.0,id=3Dhostdev0,bus=3Dpci.3,addr=3D=
0x0: VFIO_MAP_DMA: -22
  2020-03-25T13:43:39.107560Z qemu-system-aarch64: -device vfio-pci,host=3D=
0000:29:00.0,id=3Dhostdev0,bus=3Dpci.3,addr=3D0x0: vfio 0000:29:00.0: faile=
d to setup container for group 28: memory listener initialization failed: R=
egion mach-virt.ram: vfio_dma_map(0x563169753c80, 0x40000000, 0x100000000, =
0x7fb2a3e00000) =3D -22 (Invalid argument)

  Traceback (most recent call last):
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 75, in cb_=
wrapper
      callback(asyncjob, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 111, in tm=
pcb
      callback(*args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/libvirtobject.py", lin=
e 66, in newfn
      ret =3D fn(self, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/domain.py", line 1279,=
 in startup
      self._backend.create()
    File "/usr/lib64/python3.8/site-packages/libvirt.py", line 1234, in cre=
ate
      if ret =3D=3D -1: raise libvirtError ('virDomainCreate() failed', dom=
=3Dself)
  libvirt.libvirtError: internal error: process exited while connecting to =
monitor: 2020-03-25T13:43:39.107524Z qemu-system-aarch64: -device vfio-pci,=
host=3D0000:29:00.0,id=3Dhostdev0,bus=3Dpci.3,addr=3D0x0: VFIO_MAP_DMA: -22
  2020-03-25T13:43:39.107560Z qemu-system-aarch64: -device vfio-pci,host=3D=
0000:29:00.0,id=3Dhostdev0,bus=3Dpci.3,addr=3D0x0: vfio 0000:29:00.0: faile=
d to setup container for group 28: memory listener initialization failed: R=
egion mach-virt.ram: vfio_dma_map(0x563169753c80, 0x40000000, 0x100000000, =
0x7fb2a3e00000) =3D -22 (Invalid argument)

  =

  I played with memory and 3054 MB is maximum value possible to boot VM wit=
h coldplugged host PCIe cards.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1869006/+subscriptions

