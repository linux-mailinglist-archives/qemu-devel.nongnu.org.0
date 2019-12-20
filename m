Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB428128128
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 18:12:47 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiLpW-0004Cs-Gh
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 12:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iiLoY-0003FG-NX
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 12:11:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iiLoX-0003SK-AM
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 12:11:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:33970)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iiLoX-0003QQ-0a
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 12:11:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iiLoU-0007mk-Nd
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 17:11:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ACE092E80CE
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 17:11:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Dec 2019 17:02:28 -0000
From: ecsdn <1856834@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: powerpc ppc softmmu virtio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ecsdn laurent-vivier
X-Launchpad-Bug-Reporter: ecsdn (ecsdn)
X-Launchpad-Bug-Modifier: ecsdn (ecsdn)
References: <157666458990.14847.6716769636962803095.malonedeb@wampee.canonical.com>
Message-Id: <157686134861.27735.4167922142644220101.malone@chaenomeles.canonical.com>
Subject: [Bug 1856834] Re: Virtio broken in qemu ppc in 4.2.0 and other
 versions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 0d58c874ea626c549d4eee5ebdbb596155dfbd56
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1856834 <1856834@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks I tried with:

/root/QEMU/qemu-git-4.2.0rc4/qemu/build/ppc-softmmu/qemu-system-ppc -M
mpc8544ds -nographic -kernel /home/me/boot/uImage-2.6.32 -append
"root=3D/dev/vda rw" -device virtio-blk-pci,drive=3Ddrive0,disable-
modern=3Dtrue -drive
file=3D/home/me/mmcblk0p2.dd,if=3Dnone,id=3Ddrive0,format=3Draw

And again it worked with qemu 2.8.1 but failed with the above 4.2.0rc4
on the same x86_64 host.

On another x86_64 host I confirmed that the below works with qemu 2.8.0

root@myserver:~# qemu-system-ppc -M mpc8544ds -nographic -kernel
/home/me/boot/uImage-2.6.32 -append "root=3D/dev/vda rw" -device virtio-
blk-pci,drive=3Ddrive0,disable-modern=3Dtrue -drive
file=3D/home/me/mmcblk0p2.dd,if=3Dnone,id=3Ddrive0,format=3Draw

But again even on this system 4.2.0 failes with that same command:
root@myserver:~# /root/QEMU/qemu-4.2.0/build/ppc-softmmu/qemu-system-ppc -M=
 mpc8544ds -nographic -kernel /home/me/boot/uImage-2.6.32 -append "root=3D/=
dev/vda rw" -device virtio-blk-pci,drive=3Ddrive0,disable-modern=3Dtrue -dr=
ive file=3D/home/me/mmcblk0p2.dd,if=3Dnone,id=3Ddrive0,format=3Draw

Fails/freezes at the same vda: location.

Running it from its installed location didn't help, the following still
failed at vda: also.

root@myserver:/opt/qemu4.2.0/bin# ./qemu-system-ppc -M mpc8544ds
-nographic -kernel /home/me/boot/uImage-2.6.32 -append "root=3D/dev/vda
rw" -device virtio-blk-pci,drive=3Ddrive0,disable-modern=3Dtrue -drive
file=3D/home/me/mmcblk0p2.dd,if=3Dnone,id=3Ddrive0,format=3Draw

Although I didn't think its required for the softmmu qemu "emulation"
only, ie not "kvm", I even enabled kvm as well as DMAR+IOMMU on the
kernel and recompiled 4.2.0 but had same vda: failure.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856834

Title:
  Virtio broken in qemu ppc in 4.2.0 and other versions

Status in QEMU:
  New

Bug description:
  The same qemu -M mpc... command that works on qemu-system-ppc version
  2.8.0 freezes guest on bootup and shows error for qemu-system-ppc
  version 4.2.0release and 4.19dirtygit:

  qemu-system-ppc: virtio-blk failed to set guest notifier (-24), ensure -a=
ccel kvm is set.
  qemu-system-ppc: virtio_bus_start_ioeventfd: failed. Fallback to userspac=
e (slower).

  ends/freezes at:
  nbd: registered device at major 43
  =C2=A0vda:

  I'm using -drive file=3D/home/me/rawimage.dd,if=3Dvirtio and works fine in
  version 2.8.0 installed with apt-get install (Ubuntu 17.04) and also
  with 2.8.0 official release from git/github that I compiled/built
  myself. But both of the newer releases fail on the same exact machine
  same config.

  I also noticed that qemu-2.8.0 was fine with mtd but the newer ones I tri=
ed weren't, ie gave
  qemu-system-ppc: -drive if=3Dmtd: machine type does not support if=3Dmtd,=
bus=3D0,unit=3D0
  (but I removed -drive if=3Dmtd since wasn't using it anyway)

  I also tried on windows but I think virtio doesn't work on windows
  hosts at all? On windows host it fails the same way, even version 2.12
  as well as 4.1.10...

  used:
  ./configure --prefix=3D/opt/... --enable-fdt --enable-kvm --enable-debug

  (basically all steps the same on same exact system same config, yet
  2.8.0 works fine whether apt-get installed or built from source while
  the others I built, 4.19/4.2.0 or 2.12/4.1.10(win) don't.)

  In case newer qemu versions act weird on various kernels, I did try with =
both vmlinuz-4.10.0-19-generic and vmlinuz-4.13.12-041312-generic (I didn't=
 compile them but I can provide config-..files. This is on Ubuntu 17.04 x86=
_64 host emulating e500v2 cpm guest, ie -M mpc... GUEST kernel 2.6.32.44 wh=
ich is why I can't use -M ppce500 instead..)
  tx
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ecs

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856834/+subscriptions

