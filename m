Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ED52C7B64
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 22:32:33 +0100 (CET)
Received: from localhost ([::1]:58148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjUJ6-0005kR-F7
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 16:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjUHQ-0005EW-7c
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 16:30:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjUHN-0001aO-MY
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 16:30:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kjUHL-0003NR-IK
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 21:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 645622E8145
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 21:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 29 Nov 2020 21:25:28 -0000
From: johannes <1906185@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: graphics resolution
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fghgfh832
X-Launchpad-Bug-Reporter: johannes (fghgfh832)
X-Launchpad-Bug-Modifier: johannes (fghgfh832)
Message-Id: <160668512846.21904.17586532859181577922.malonedeb@gac.canonical.com>
Subject: [Bug 1906185] [NEW] Guest display resolution cannot be changed when
 using certain graphics/interface combinations
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="12d09381f8e8eee3115395875b132e165fa96574"; Instance="production"
X-Launchpad-Hash: 4a04a4337c3eb6319fca36afe551b076a62b7525
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1906185 <1906185@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Guest display resolution cannot be changed with certain virtual graphics
card (-vga) and interface (-display) combinations.

For example, resolution changing doesn't work with the following QEMU
start commands, it resets to the default resolution immediately:

QXL with SDL interface:
qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubunt=
u-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda -display sdl

QXL with GTK interface:
qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubunt=
u-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda -display gtk

QXL with "remote" SPICE interface via unix socket:
qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubunt=
u-20.04-desktop-amd64.iso -boot d -soundhw hda -vga qxl -device virtio-seri=
al-pci -device virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.spi=
ce.0 -chardev spicevmc,id=3Dspicechannel0,name=3Dvdagent -spice unix,addr=
=3D/tmp/vm_spice.socket,disable-ticketing

for "remote" access:
remote-viewer spice+unix:///tmp/vm_spice.socket


Other tested combinations:
-- virtio + SDL (GL on): works!
-- virtio + GTK (GL on): does not work properly. The resolution is changed =
but window size is not so the guest screen will look like garbage.
-- vmware: The initial Kubuntu setup screen is visible but booting does not=
 progress to the desktop
-- std + GTK: works!
-- std + SDL: works!


QEMU version: 5.1.0
Guest: Kubuntu 20.04 64-bit (live) with 5.4.0-26 kernel; may occur with oth=
er guests as well
Host: Arch Linux, with KDE desktop

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: graphics resolution

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906185

Title:
  Guest display resolution cannot be changed when using certain
  graphics/interface combinations

Status in QEMU:
  New

Bug description:
  Guest display resolution cannot be changed with certain virtual
  graphics card (-vga) and interface (-display) combinations.

  For example, resolution changing doesn't work with the following QEMU
  start commands, it resets to the default resolution immediately:

  QXL with SDL interface:
  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubu=
ntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda -display sdl

  QXL with GTK interface:
  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubu=
ntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda -display gtk

  QXL with "remote" SPICE interface via unix socket:
  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubu=
ntu-20.04-desktop-amd64.iso -boot d -soundhw hda -vga qxl -device virtio-se=
rial-pci -device virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.s=
pice.0 -chardev spicevmc,id=3Dspicechannel0,name=3Dvdagent -spice unix,addr=
=3D/tmp/vm_spice.socket,disable-ticketing

  for "remote" access:
  remote-viewer spice+unix:///tmp/vm_spice.socket


  Other tested combinations:
  -- virtio + SDL (GL on): works!
  -- virtio + GTK (GL on): does not work properly. The resolution is change=
d but window size is not so the guest screen will look like garbage.
  -- vmware: The initial Kubuntu setup screen is visible but booting does n=
ot progress to the desktop
  -- std + GTK: works!
  -- std + SDL: works!

  =

  QEMU version: 5.1.0
  Guest: Kubuntu 20.04 64-bit (live) with 5.4.0-26 kernel; may occur with o=
ther guests as well
  Host: Arch Linux, with KDE desktop

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906185/+subscriptions

