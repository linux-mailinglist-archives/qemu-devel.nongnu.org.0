Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4031D6B40
	for <lists+qemu-devel@lfdr.de>; Sun, 17 May 2020 19:06:57 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaMka-0001Qp-CL
	for lists+qemu-devel@lfdr.de; Sun, 17 May 2020 13:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jaMjM-0000hJ-K1
 for qemu-devel@nongnu.org; Sun, 17 May 2020 13:05:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:47742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jaMjK-0000DJ-Mk
 for qemu-devel@nongnu.org; Sun, 17 May 2020 13:05:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jaMjJ-00008g-6X
 for <qemu-devel@nongnu.org>; Sun, 17 May 2020 17:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2D0A12E80E7
 for <qemu-devel@nongnu.org>; Sun, 17 May 2020 17:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2020 16:59:55 -0000
From: TheCatFelix <1879175@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: gvt gvtd igd vfio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: thecatfelix
X-Launchpad-Bug-Reporter: TheCatFelix (thecatfelix)
X-Launchpad-Bug-Modifier: TheCatFelix (thecatfelix)
Message-Id: <158973479559.22374.10399274369007569586.malonedeb@gac.canonical.com>
Subject: [Bug 1879175] [NEW] GVTd not working after upgrade to qemu-5.0.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0385b538081bc4718df6fb844a3afc89729c94ce";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 54007cff3cc00d34d2a355d2a1530b993ab87540
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 13:05:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1879175 <1879175@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi QEMU team,


=3D=3D=3D Problem Summary =3D=3D=3D

I have recently upgraded from QEMU-3.1.0 to to QEMU-5.0.0 on Debian
Unstable. Unfortunately GVTd (legacy passthrough of the integrated intel
gpu) stopped working correctly. The guest can still see and loads the
driver for the GPU, but the screen stays black.

The following is the version used:

$ /usr/bin/qemu-system-x86_64 --version
QEMU emulator version 5.0.0 (Debian 1:5.0-5)
Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers


=3D=3D=3D Investigation/Triage done so far =3D=3D=3D

Running QEMU with trace flags enabled shows the following behavior
change for the same VM (left: 3.1.0, right: 5.0.0):

vfio_realize  (0000:00:02.0) group 1                                       =
                             vfio_realize  (0000:00:02.0) group 1
vfio_listener_region_add_ram region_add [ram] 0x0 - 0xbffff [0x7f5b41e00000=
]                       |    vfio_listener_region_add_ram region_add [ram] =
0x0 - 0xbffff [0x7f2bb1e00000]
vfio_listener_region_add_ram region_add [ram] 0xc0000 - 0xdffff [0x7f5d1d40=
0000]                   |    vfio_listener_region_add_ram region_add [ram] =
0xc0000 - 0xdffff [0x7f2d7c800000]
vfio_listener_region_add_ram region_add [ram] 0xe0000 - 0xfffff [0x7f5d1d62=
0000]                   |    vfio_listener_region_add_ram region_add [ram] =
0xe0000 - 0xfffff [0x7f2d84220000]
vfio_listener_region_add_ram region_add [ram] 0x100000 - 0xbfffffff [0x7f5b=
41f00000]               |    vfio_listener_region_add_ram region_add [ram] =
0x100000 - 0xbfffffff [0x7f2bb1f00000]
vfio_listener_region_add_skip SKIPPING region_add 0xfec00000 - 0xfec00fff  =
                             vfio_listener_region_add_skip SKIPPING region_=
add 0xfec00000 - 0xfec00fff
vfio_listener_region_add_skip SKIPPING region_add 0xfee00000 - 0xfeefffff  =
                             vfio_listener_region_add_skip SKIPPING region_=
add 0xfee00000 - 0xfeefffff
vfio_listener_region_add_ram region_add [ram] 0xfffc0000 - 0xffffffff [0x7f=
5d1d600000]             |    vfio_listener_region_add_ram region_add [ram] =
0xfffc0000 - 0xffffffff [0x7f2d84200000]
vfio_listener_region_add_ram region_add [ram] 0x100000000 - 0x201ffffff [0x=
7f5c01e00000]           |    vfio_listener_region_add_ram region_add [ram] =
0x100000000 - 0x201ffffff [0x7f2c71e00000]
vfio_mdev  (0000:00:02.0) is_mdev 0                                        =
                             vfio_mdev  (0000:00:02.0) is_mdev 0
vfio_get_device Device 0000:00:02.0 flags: 3, regions: 12, irqs: 5         =
                             vfio_get_device Device 0000:00:02.0 flags: 3, =
regions: 12, irqs: 5
vfio_region_setup Device 0000:00:02.0, region 0 "0000:00:02.0 BAR 0", flags=
: 0x7, offset: 0x0, s        vfio_region_setup Device 0000:00:02.0, region =
0 "0000:00:02.0 BAR 0", flags: 0x7, offset: 0x0, s
vfio_region_setup Device 0000:00:02.0, region 1 "0000:00:02.0 BAR 1", flags=
: 0x0, offset: 0x1000        vfio_region_setup Device 0000:00:02.0, region =
1 "0000:00:02.0 BAR 1", flags: 0x0, offset: 0x1000
vfio_region_setup Device 0000:00:02.0, region 2 "0000:00:02.0 BAR 2", flags=
: 0x7, offset: 0x2000        vfio_region_setup Device 0000:00:02.0, region =
2 "0000:00:02.0 BAR 2", flags: 0x7, offset: 0x2000
vfio_region_setup Device 0000:00:02.0, region 3 "0000:00:02.0 BAR 3", flags=
: 0x0, offset: 0x3000        vfio_region_setup Device 0000:00:02.0, region =
3 "0000:00:02.0 BAR 3", flags: 0x0, offset: 0x3000
vfio_region_setup Device 0000:00:02.0, region 4 "0000:00:02.0 BAR 4", flags=
: 0x3, offset: 0x4000        vfio_region_setup Device 0000:00:02.0, region =
4 "0000:00:02.0 BAR 4", flags: 0x3, offset: 0x4000
vfio_region_setup Device 0000:00:02.0, region 5 "0000:00:02.0 BAR 5", flags=
: 0x0, offset: 0x5000        vfio_region_setup Device 0000:00:02.0, region =
5 "0000:00:02.0 BAR 5", flags: 0x0, offset: 0x5000
vfio_populate_device_config Device 0000:00:02.0 config:                    =
                             vfio_populate_device_config Device 0000:00:02.=
0 config:
 0x1000, offset: 0x70000000000, flags: 0x3                                 =
                              0x1000, offset: 0x70000000000, flags: 0x3
vfio_region_mmap Region 0000:00:02.0 BAR 0 mmaps[0] [0x0 - 0xffffff]       =
                             vfio_region_mmap Region 0000:00:02.0 BAR 0 mma=
ps[0] [0x0 - 0xffffff]
vfio_region_mmap Region 0000:00:02.0 BAR 2 mmaps[0] [0x0 - 0xfffffff]      =
                             vfio_region_mmap Region 0000:00:02.0 BAR 2 mma=
ps[0] [0x0 - 0xfffffff]
vfio_check_pm_reset 0000:00:02.0 Supports PM reset                         =
                             vfio_check_pm_reset 0000:00:02.0 Supports PM r=
eset
vfio_msi_setup 0000:00:02.0 PCI MSI CAP @0xac                              =
                             vfio_msi_setup 0000:00:02.0 PCI MSI CAP @0xac
vfio_check_pcie_flr 0000:00:02.0 Supports FLR via PCIe cap                 =
                             vfio_check_pcie_flr 0000:00:02.0 Supports FLR =
via PCIe cap
vfio_get_dev_region 0000:00:02.0 index 9, 80008086/18                      =
                        <
vfio_get_dev_region 0000:00:02.0 index 9, 80008086/18                      =
                        <
vfio_get_dev_region 0000:00:02.0 index 10, 80008086/28                     =
                        <
vfio_get_dev_region 0000:00:02.0 index 9, 80008086/18                      =
                        <
vfio_get_dev_region 0000:00:02.0 index 10, 80008086/28                     =
                        <
vfio_get_dev_region 0000:00:02.0 index 11, 80008086/38                     =
                        <
vfio_listener_region_del region_del 0x0 - 0xbffff                          =
                        <
vfio_listener_region_add_ram region_add [ram] 0x0 - 0x9ffff [0x7f5b41e00000=
]                       <
vfio_listener_region_add_skip SKIPPING region_add 0xa0000 - 0xbffff        =
                        <
vfio_pci_igd_lpc_bridge_enabled 0000:00:02.0                               =
                        <
vfio_pci_igd_host_bridge_enabled 0000:00:02.0                              =
                        <
vfio_pci_igd_opregion_enabled 0000:00:02.0                                 =
                        <
vfio_pci_igd_bdsm_enabled 0000:00:02.0 40MB                                =
                        <
vfio_intx_enable_kvm  (0000:00:02.0) KVM INTx accel enabled                =
                             vfio_intx_enable_kvm  (0000:00:02.0) KVM INTx =
accel enabled
vfio_intx_enable  (0000:00:02.0)                                           =
                             vfio_intx_enable  (0000:00:02.0)
 0x100, offset: 0x70000000000, flags: 0x3                                  =
                              0x100, offset: 0x70000000000, flags: 0x3
vfio_populate_device_get_irq_info_failure VFIO_DEVICE_GET_IRQ_INFO failure:=
 Invalid argument            vfio_populate_device_get_irq_info_failure VFIO=
_DEVICE_GET_IRQ_INFO failure: Invalid argument
vfio_pci_reset  (0000:00:02.0)                                             =
                             vfio_pci_reset  (0000:00:02.0)
vfio_intx_disable_kvm  (0000:00:02.0) KVM INTx accel disabled              =
                             vfio_intx_disable_kvm  (0000:00:02.0) KVM INTx=
 accel disabled
vfio_region_mmaps_set_enabled Region 0000:00:02.0 BAR 0 mmaps enabled: 1   =
                             vfio_region_mmaps_set_enabled Region 0000:00:0=
2.0 BAR 0 mmaps enabled: 1
vfio_region_mmaps_set_enabled Region 0000:00:02.0 BAR 2 mmaps enabled: 1   =
                             vfio_region_mmaps_set_enabled Region 0000:00:0=
2.0 BAR 2 mmaps enabled: 1
vfio_region_mmaps_set_enabled Region 0000:00:02.0 BAR 4 mmaps enabled: 1   =
                             vfio_region_mmaps_set_enabled Region 0000:00:0=
2.0 BAR 4 mmaps enabled: 1
vfio_intx_disable  (0000:00:02.0)                                          =
                             vfio_intx_disable  (0000:00:02.0)
vfio_pci_write_config  (0000:00:02.0, @0x4, 0x0, len=3D0x2)                =
                               vfio_pci_write_config  (0000:00:02.0, @0x4, =
0x0, len=3D0x2)
vfio_listener_region_del region_del 0x0 - 0x9ffff                          =
                        <
vfio_listener_region_del_skip SKIPPING region_del 0xa0000 - 0xbffff        =
                        <
vfio_listener_region_add_ram region_add [ram] 0x0 - 0xbffff [0x7f5b41e00000=
]                       <
vfio_pci_reset_flr 0000:00:02.0 FLR/VFIO_DEVICE_RESET                      =
                             vfio_pci_reset_flr 0000:00:02.0 FLR/VFIO_DEVIC=
E_RESET
vfio_intx_enable  (0000:00:02.0)                                           =
                             vfio_intx_enable  (0000:00:02.0)
vfio_listener_region_del region_del 0x0 - 0xbffff                          =
                             vfio_listener_region_del region_del 0x0 - 0xbf=
fff
vfio_listener_region_del region_del 0xc0000 - 0xdffff                      =
                             vfio_listener_region_del region_del 0xc0000 - =
0xdffff
vfio_listener_region_del region_del 0xe0000 - 0xfffff                      =
                             vfio_listener_region_del region_del 0xe0000 - =
0xfffff
vfio_listener_region_del region_del 0x100000 - 0xbfffffff                  =
                             vfio_listener_region_del region_del 0x100000 -=
 0xbfffffff
vfio_listener_region_add_ram region_add [ram] 0x0 - 0xcffff [0x7f5b41e00000=
]                       |    vfio_listener_region_add_ram region_add [ram] =
0x0 - 0xcffff [0x7f2bb1e00000]

We can see here, the following key lines are not printed in 5.0.0:

vfio_pci_igd_lpc_bridge_enabled 0000:00:02.0                               =
                        <
vfio_pci_igd_host_bridge_enabled 0000:00:02.0                              =
                        <
vfio_pci_igd_opregion_enabled 0000:00:02.0                                 =
                        <
vfio_pci_igd_bdsm_enabled 0000:00:02.0 40MB                                =
                        <

Looking through the code and bisecting the problem (I can provide more
detail if helpful), shows the following ifdef statement lines introduce
the problem:

https://github.com/qemu/qemu/blob/master/hw/vfio/pci-quirks.c#L1253

  1246  void vfio_bar_quirk_setup(VFIOPCIDevice *vdev, int nr)
  1247  {
  1248      vfio_probe_ati_bar4_quirk(vdev, nr);
  1249      vfio_probe_ati_bar2_quirk(vdev, nr);
  1250      vfio_probe_nvidia_bar5_quirk(vdev, nr);
  1251      vfio_probe_nvidia_bar0_quirk(vdev, nr);
  1252      vfio_probe_rtl8168_bar2_quirk(vdev, nr);
  1253  #ifdef CONFIG_VFIO_IGD
  1254      vfio_probe_igd_bar4_quirk(vdev, nr);
  1255  #endif
  1256  }

This was added by the following commits:

https://github.com/qemu/qemu/commit/29d62771c81d8fd244a67c14a1d968c268d3fb19
#diff-38093e21794c7a4987feb71e498dbdc6

Reading through the commit message, I suspect the something may be
happening with the Kconfig switches mentioned there.


=3D=3D=3D Validation/Workaround =3D=3D=3D

I have rebuilt the package with the following two changes:

root@debian:/home/test/src# diff debian_*/qemu-5.0/hw/vfio/pci-quirks.c
0a1
> #define CONFIG_VFIO_IGD y
root@debian:/home/test/src# diff debian_*/qemu-5.0/hw/vfio/Kconfig
42c42
<     default y if PC_PCI
---
>     default y
root@debian:/home/test/src#

GVTd started working fine again (Screen shows output again).

I have tried with either change alone:

- with only the ifdef in pci-quirks.c compilation fails with linker errors
- with only the Kconfig it compiles, but GVTd still does not work (black sc=
reen)


Please take a look and thank you very much for a fantastic product!

TheCatFelix

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: gvt gvtd igd vfio

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879175

Title:
  GVTd not working after upgrade to qemu-5.0.0

Status in QEMU:
  New

Bug description:
  Hi QEMU team,

  =

  =3D=3D=3D Problem Summary =3D=3D=3D

  I have recently upgraded from QEMU-3.1.0 to to QEMU-5.0.0 on Debian
  Unstable. Unfortunately GVTd (legacy passthrough of the integrated
  intel gpu) stopped working correctly. The guest can still see and
  loads the driver for the GPU, but the screen stays black.

  The following is the version used:

  $ /usr/bin/qemu-system-x86_64 --version
  QEMU emulator version 5.0.0 (Debian 1:5.0-5)
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers


  =3D=3D=3D Investigation/Triage done so far =3D=3D=3D

  Running QEMU with trace flags enabled shows the following behavior
  change for the same VM (left: 3.1.0, right: 5.0.0):

  vfio_realize  (0000:00:02.0) group 1                                     =
                               vfio_realize  (0000:00:02.0) group 1
  vfio_listener_region_add_ram region_add [ram] 0x0 - 0xbffff [0x7f5b41e000=
00]                       |    vfio_listener_region_add_ram region_add [ram=
] 0x0 - 0xbffff [0x7f2bb1e00000]
  vfio_listener_region_add_ram region_add [ram] 0xc0000 - 0xdffff [0x7f5d1d=
400000]                   |    vfio_listener_region_add_ram region_add [ram=
] 0xc0000 - 0xdffff [0x7f2d7c800000]
  vfio_listener_region_add_ram region_add [ram] 0xe0000 - 0xfffff [0x7f5d1d=
620000]                   |    vfio_listener_region_add_ram region_add [ram=
] 0xe0000 - 0xfffff [0x7f2d84220000]
  vfio_listener_region_add_ram region_add [ram] 0x100000 - 0xbfffffff [0x7f=
5b41f00000]               |    vfio_listener_region_add_ram region_add [ram=
] 0x100000 - 0xbfffffff [0x7f2bb1f00000]
  vfio_listener_region_add_skip SKIPPING region_add 0xfec00000 - 0xfec00fff=
                               vfio_listener_region_add_skip SKIPPING regio=
n_add 0xfec00000 - 0xfec00fff
  vfio_listener_region_add_skip SKIPPING region_add 0xfee00000 - 0xfeefffff=
                               vfio_listener_region_add_skip SKIPPING regio=
n_add 0xfee00000 - 0xfeefffff
  vfio_listener_region_add_ram region_add [ram] 0xfffc0000 - 0xffffffff [0x=
7f5d1d600000]             |    vfio_listener_region_add_ram region_add [ram=
] 0xfffc0000 - 0xffffffff [0x7f2d84200000]
  vfio_listener_region_add_ram region_add [ram] 0x100000000 - 0x201ffffff [=
0x7f5c01e00000]           |    vfio_listener_region_add_ram region_add [ram=
] 0x100000000 - 0x201ffffff [0x7f2c71e00000]
  vfio_mdev  (0000:00:02.0) is_mdev 0                                      =
                               vfio_mdev  (0000:00:02.0) is_mdev 0
  vfio_get_device Device 0000:00:02.0 flags: 3, regions: 12, irqs: 5       =
                               vfio_get_device Device 0000:00:02.0 flags: 3=
, regions: 12, irqs: 5
  vfio_region_setup Device 0000:00:02.0, region 0 "0000:00:02.0 BAR 0", fla=
gs: 0x7, offset: 0x0, s        vfio_region_setup Device 0000:00:02.0, regio=
n 0 "0000:00:02.0 BAR 0", flags: 0x7, offset: 0x0, s
  vfio_region_setup Device 0000:00:02.0, region 1 "0000:00:02.0 BAR 1", fla=
gs: 0x0, offset: 0x1000        vfio_region_setup Device 0000:00:02.0, regio=
n 1 "0000:00:02.0 BAR 1", flags: 0x0, offset: 0x1000
  vfio_region_setup Device 0000:00:02.0, region 2 "0000:00:02.0 BAR 2", fla=
gs: 0x7, offset: 0x2000        vfio_region_setup Device 0000:00:02.0, regio=
n 2 "0000:00:02.0 BAR 2", flags: 0x7, offset: 0x2000
  vfio_region_setup Device 0000:00:02.0, region 3 "0000:00:02.0 BAR 3", fla=
gs: 0x0, offset: 0x3000        vfio_region_setup Device 0000:00:02.0, regio=
n 3 "0000:00:02.0 BAR 3", flags: 0x0, offset: 0x3000
  vfio_region_setup Device 0000:00:02.0, region 4 "0000:00:02.0 BAR 4", fla=
gs: 0x3, offset: 0x4000        vfio_region_setup Device 0000:00:02.0, regio=
n 4 "0000:00:02.0 BAR 4", flags: 0x3, offset: 0x4000
  vfio_region_setup Device 0000:00:02.0, region 5 "0000:00:02.0 BAR 5", fla=
gs: 0x0, offset: 0x5000        vfio_region_setup Device 0000:00:02.0, regio=
n 5 "0000:00:02.0 BAR 5", flags: 0x0, offset: 0x5000
  vfio_populate_device_config Device 0000:00:02.0 config:                  =
                               vfio_populate_device_config Device 0000:00:0=
2.0 config:
   0x1000, offset: 0x70000000000, flags: 0x3                               =
                                0x1000, offset: 0x70000000000, flags: 0x3
  vfio_region_mmap Region 0000:00:02.0 BAR 0 mmaps[0] [0x0 - 0xffffff]     =
                               vfio_region_mmap Region 0000:00:02.0 BAR 0 m=
maps[0] [0x0 - 0xffffff]
  vfio_region_mmap Region 0000:00:02.0 BAR 2 mmaps[0] [0x0 - 0xfffffff]    =
                               vfio_region_mmap Region 0000:00:02.0 BAR 2 m=
maps[0] [0x0 - 0xfffffff]
  vfio_check_pm_reset 0000:00:02.0 Supports PM reset                       =
                               vfio_check_pm_reset 0000:00:02.0 Supports PM=
 reset
  vfio_msi_setup 0000:00:02.0 PCI MSI CAP @0xac                            =
                               vfio_msi_setup 0000:00:02.0 PCI MSI CAP @0xac
  vfio_check_pcie_flr 0000:00:02.0 Supports FLR via PCIe cap               =
                               vfio_check_pcie_flr 0000:00:02.0 Supports FL=
R via PCIe cap
  vfio_get_dev_region 0000:00:02.0 index 9, 80008086/18                    =
                          <
  vfio_get_dev_region 0000:00:02.0 index 9, 80008086/18                    =
                          <
  vfio_get_dev_region 0000:00:02.0 index 10, 80008086/28                   =
                          <
  vfio_get_dev_region 0000:00:02.0 index 9, 80008086/18                    =
                          <
  vfio_get_dev_region 0000:00:02.0 index 10, 80008086/28                   =
                          <
  vfio_get_dev_region 0000:00:02.0 index 11, 80008086/38                   =
                          <
  vfio_listener_region_del region_del 0x0 - 0xbffff                        =
                          <
  vfio_listener_region_add_ram region_add [ram] 0x0 - 0x9ffff [0x7f5b41e000=
00]                       <
  vfio_listener_region_add_skip SKIPPING region_add 0xa0000 - 0xbffff      =
                          <
  vfio_pci_igd_lpc_bridge_enabled 0000:00:02.0                             =
                          <
  vfio_pci_igd_host_bridge_enabled 0000:00:02.0                            =
                          <
  vfio_pci_igd_opregion_enabled 0000:00:02.0                               =
                          <
  vfio_pci_igd_bdsm_enabled 0000:00:02.0 40MB                              =
                          <
  vfio_intx_enable_kvm  (0000:00:02.0) KVM INTx accel enabled              =
                               vfio_intx_enable_kvm  (0000:00:02.0) KVM INT=
x accel enabled
  vfio_intx_enable  (0000:00:02.0)                                         =
                               vfio_intx_enable  (0000:00:02.0)
   0x100, offset: 0x70000000000, flags: 0x3                                =
                                0x100, offset: 0x70000000000, flags: 0x3
  vfio_populate_device_get_irq_info_failure VFIO_DEVICE_GET_IRQ_INFO failur=
e: Invalid argument            vfio_populate_device_get_irq_info_failure VF=
IO_DEVICE_GET_IRQ_INFO failure: Invalid argument
  vfio_pci_reset  (0000:00:02.0)                                           =
                               vfio_pci_reset  (0000:00:02.0)
  vfio_intx_disable_kvm  (0000:00:02.0) KVM INTx accel disabled            =
                               vfio_intx_disable_kvm  (0000:00:02.0) KVM IN=
Tx accel disabled
  vfio_region_mmaps_set_enabled Region 0000:00:02.0 BAR 0 mmaps enabled: 1 =
                               vfio_region_mmaps_set_enabled Region 0000:00=
:02.0 BAR 0 mmaps enabled: 1
  vfio_region_mmaps_set_enabled Region 0000:00:02.0 BAR 2 mmaps enabled: 1 =
                               vfio_region_mmaps_set_enabled Region 0000:00=
:02.0 BAR 2 mmaps enabled: 1
  vfio_region_mmaps_set_enabled Region 0000:00:02.0 BAR 4 mmaps enabled: 1 =
                               vfio_region_mmaps_set_enabled Region 0000:00=
:02.0 BAR 4 mmaps enabled: 1
  vfio_intx_disable  (0000:00:02.0)                                        =
                               vfio_intx_disable  (0000:00:02.0)
  vfio_pci_write_config  (0000:00:02.0, @0x4, 0x0, len=3D0x2)              =
                                 vfio_pci_write_config  (0000:00:02.0, @0x4=
, 0x0, len=3D0x2)
  vfio_listener_region_del region_del 0x0 - 0x9ffff                        =
                          <
  vfio_listener_region_del_skip SKIPPING region_del 0xa0000 - 0xbffff      =
                          <
  vfio_listener_region_add_ram region_add [ram] 0x0 - 0xbffff [0x7f5b41e000=
00]                       <
  vfio_pci_reset_flr 0000:00:02.0 FLR/VFIO_DEVICE_RESET                    =
                               vfio_pci_reset_flr 0000:00:02.0 FLR/VFIO_DEV=
ICE_RESET
  vfio_intx_enable  (0000:00:02.0)                                         =
                               vfio_intx_enable  (0000:00:02.0)
  vfio_listener_region_del region_del 0x0 - 0xbffff                        =
                               vfio_listener_region_del region_del 0x0 - 0x=
bffff
  vfio_listener_region_del region_del 0xc0000 - 0xdffff                    =
                               vfio_listener_region_del region_del 0xc0000 =
- 0xdffff
  vfio_listener_region_del region_del 0xe0000 - 0xfffff                    =
                               vfio_listener_region_del region_del 0xe0000 =
- 0xfffff
  vfio_listener_region_del region_del 0x100000 - 0xbfffffff                =
                               vfio_listener_region_del region_del 0x100000=
 - 0xbfffffff
  vfio_listener_region_add_ram region_add [ram] 0x0 - 0xcffff [0x7f5b41e000=
00]                       |    vfio_listener_region_add_ram region_add [ram=
] 0x0 - 0xcffff [0x7f2bb1e00000]

  We can see here, the following key lines are not printed in 5.0.0:

  vfio_pci_igd_lpc_bridge_enabled 0000:00:02.0                             =
                          <
  vfio_pci_igd_host_bridge_enabled 0000:00:02.0                            =
                          <
  vfio_pci_igd_opregion_enabled 0000:00:02.0                               =
                          <
  vfio_pci_igd_bdsm_enabled 0000:00:02.0 40MB                              =
                          <

  Looking through the code and bisecting the problem (I can provide more
  detail if helpful), shows the following ifdef statement lines
  introduce the problem:

  https://github.com/qemu/qemu/blob/master/hw/vfio/pci-quirks.c#L1253

    1246  void vfio_bar_quirk_setup(VFIOPCIDevice *vdev, int nr)
    1247  {
    1248      vfio_probe_ati_bar4_quirk(vdev, nr);
    1249      vfio_probe_ati_bar2_quirk(vdev, nr);
    1250      vfio_probe_nvidia_bar5_quirk(vdev, nr);
    1251      vfio_probe_nvidia_bar0_quirk(vdev, nr);
    1252      vfio_probe_rtl8168_bar2_quirk(vdev, nr);
    1253  #ifdef CONFIG_VFIO_IGD
    1254      vfio_probe_igd_bar4_quirk(vdev, nr);
    1255  #endif
    1256  }

  This was added by the following commits:

  https://github.com/qemu/qemu/commit/29d62771c81d8fd244a67c14a1d968c268d3f=
b19
  #diff-38093e21794c7a4987feb71e498dbdc6

  Reading through the commit message, I suspect the something may be
  happening with the Kconfig switches mentioned there.


  =3D=3D=3D Validation/Workaround =3D=3D=3D

  I have rebuilt the package with the following two changes:

  root@debian:/home/test/src# diff debian_*/qemu-5.0/hw/vfio/pci-quirks.c
  0a1
  > #define CONFIG_VFIO_IGD y
  root@debian:/home/test/src# diff debian_*/qemu-5.0/hw/vfio/Kconfig
  42c42
  <     default y if PC_PCI
  ---
  >     default y
  root@debian:/home/test/src#

  GVTd started working fine again (Screen shows output again).

  I have tried with either change alone:

  - with only the ifdef in pci-quirks.c compilation fails with linker errors
  - with only the Kconfig it compiles, but GVTd still does not work (black =
screen)


  Please take a look and thank you very much for a fantastic product!

  TheCatFelix

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879175/+subscriptions

