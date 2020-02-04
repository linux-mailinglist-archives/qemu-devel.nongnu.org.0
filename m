Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42B3151DA7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 16:51:58 +0100 (CET)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz0UX-0005iC-T2
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 10:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iz0TD-0004r4-Dc
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 10:50:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iz0TB-00023W-Tb
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 10:50:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:52062)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iz0TB-0001vt-Nj
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 10:50:33 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iz0TA-0002Ip-7W
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 15:50:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1ABC32E8082
 for <qemu-devel@nongnu.org>; Tue,  4 Feb 2020 15:50:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Feb 2020 15:43:11 -0000
From: Maarten <1861884@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mvgijssel
X-Launchpad-Bug-Reporter: Maarten (mvgijssel)
X-Launchpad-Bug-Modifier: Maarten (mvgijssel)
Message-Id: <158083099190.20144.2427615447806299744.malonedeb@wampee.canonical.com>
Subject: [Bug 1861884] [NEW] qemu socket multicast not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 20b4cef65a90f2c3fea377e05ba8e42b3d979136
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
Reply-To: Bug 1861884 <1861884@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Running two qemu vms on the same socket multicast address:

=C2=A0=C2=A0qemu-system-x86_64 -m 2048 -smp 2 -serial mon:stdio
=C2=A0=C2=A0=C2=A0=C2=A0-display none -vga none
=C2=A0=C2=A0=C2=A0=C2=A0-nodefaults -accel hax
=C2=A0=C2=A0=C2=A0=C2=A0-netdev user,id=3Dmynet0
=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dmynet0
=C2=A0=C2=A0=C2=A0=C2=A0-netdev socket,id=3Dvlan,mcast=3D239.192.0.1:1235
=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dvlan
=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-rng-pci
=C2=A0=C2=A0=C2=A0=C2=A0-drive file=3Dworker.qcow2,if=3Dvirtio
=C2=A0=C2=A0=C2=A0=C2=A0-drive file=3Dcloud-init.iso,format=3Draw,if=3Dvirt=
io

The two machines have a static ip on the socket network interface,
192.168.100.11 and 192.168.100.12, but are unable to reach each other.

Result when using ping command

  PING 192.168.100.11 (192.168.100.11) 56(84) bytes of data.
  From 192.168.100.12 icmp_seq=3D1 Destination Host Unreachable
  From 192.168.100.12 icmp_seq=3D2 Destination Host Unreachable
  From 192.168.100.12 icmp_seq=3D3 Destination Host Unreachable

Is there additional configuration necessary on macos? Does this only
work on Linux? Is there additional configuration required inside of the
guest OS?

guest OS: Debian 10 (Buster)
host OS: macOS 10.15.2
qemu: 4.2.0

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

  Running two qemu vms on the same socket multicast address:
  =

-   qemu-system-x86_64 -m 2048 -smp 2 -serial mon:stdio -display none -vga =
none
-     -nodefaults -accel hax
-     -netdev user,id=3Dmynet0
-     -device virtio-net-pci,netdev=3Dmynet0
-     -netdev socket,id=3Dvlan,mcast=3D239.192.0.1:1235
-     -device virtio-net-pci,netdev=3Dvlan
-     -device virtio-rng-pci
-     -drive file=3Dworker.qcow2,if=3Dvirtio
-     -drive file=3Dcloud-init.iso,format=3Draw,if=3Dvirtio
+ =C2=A0=C2=A0qemu-system-x86_64 -m 2048 -smp 2 -serial mon:stdio
+     -display none -vga none
+ =C2=A0=C2=A0=C2=A0=C2=A0-nodefaults -accel hax
+ =C2=A0=C2=A0=C2=A0=C2=A0-netdev user,id=3Dmynet0
+ =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dmynet0
+ =C2=A0=C2=A0=C2=A0=C2=A0-netdev socket,id=3Dvlan,mcast=3D239.192.0.1:1235
+ =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dvlan
+ =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-rng-pci
+ =C2=A0=C2=A0=C2=A0=C2=A0-drive file=3Dworker.qcow2,if=3Dvirtio
+ =C2=A0=C2=A0=C2=A0=C2=A0-drive file=3Dcloud-init.iso,format=3Draw,if=3Dvi=
rtio
  =

  The two machines have a static ip on the socket network interface,
  192.168.100.11 and 192.168.100.12, but are unable to reach each other.
  =

  Is there additional configuration necessary on macos? Does this only
  work on Linux?
  =

  guest OS: Debian 10 (Buster)
  host OS: macOS 10.15.2
  qemu: 4.2.0

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861884

Title:
  qemu socket multicast not working

Status in QEMU:
  New

Bug description:
  Running two qemu vms on the same socket multicast address:

  =C2=A0=C2=A0qemu-system-x86_64 -m 2048 -smp 2 -serial mon:stdio
  =C2=A0=C2=A0=C2=A0=C2=A0-display none -vga none
  =C2=A0=C2=A0=C2=A0=C2=A0-nodefaults -accel hax
  =C2=A0=C2=A0=C2=A0=C2=A0-netdev user,id=3Dmynet0
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dmynet0
  =C2=A0=C2=A0=C2=A0=C2=A0-netdev socket,id=3Dvlan,mcast=3D239.192.0.1:1235
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,netdev=3Dvlan
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-rng-pci
  =C2=A0=C2=A0=C2=A0=C2=A0-drive file=3Dworker.qcow2,if=3Dvirtio
  =C2=A0=C2=A0=C2=A0=C2=A0-drive file=3Dcloud-init.iso,format=3Draw,if=3Dvi=
rtio

  The two machines have a static ip on the socket network interface,
  192.168.100.11 and 192.168.100.12, but are unable to reach each other.

  Result when using ping command

    PING 192.168.100.11 (192.168.100.11) 56(84) bytes of data.
    From 192.168.100.12 icmp_seq=3D1 Destination Host Unreachable
    From 192.168.100.12 icmp_seq=3D2 Destination Host Unreachable
    From 192.168.100.12 icmp_seq=3D3 Destination Host Unreachable

  Is there additional configuration necessary on macos? Does this only
  work on Linux? Is there additional configuration required inside of
  the guest OS?

  guest OS: Debian 10 (Buster)
  host OS: macOS 10.15.2
  qemu: 4.2.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861884/+subscriptions

