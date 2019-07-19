Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC776E743
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 16:25:58 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoTpc-00016U-Ja
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 10:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49745)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hoTpI-0000K5-2Q
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 10:25:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hoTpG-0006Cw-OC
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 10:25:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:34556)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hoTpG-0006CB-Iu
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 10:25:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hoTpF-0001RS-Cf
 for <qemu-devel@nongnu.org>; Fri, 19 Jul 2019 14:25:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5CADB2E8070
 for <qemu-devel@nongnu.org>; Fri, 19 Jul 2019 14:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jul 2019 14:18:06 -0000
From: post-factum <1837218@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: post-factum
X-Launchpad-Bug-Reporter: post-factum (post-factum)
X-Launchpad-Bug-Modifier: post-factum (post-factum)
Message-Id: <156354588692.30209.14783168884867057348.malonedeb@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 86ab7a859b3eae4fcd0cfb28f01dd6090d865c9e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1837218] [NEW] qemu segfaults after spice update
 with bochs-display
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
Reply-To: Bug 1837218 <1837218@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Description:

qemu segfaults after latest spice update with bochs-display. Downgrading
spice solves the issue. Switching to qxl-vga and/or virtio-gpu also
works even with new spice.

Additional info:
* package version(s)

spice 0.14.2-1 (0.14.0 is unaffected)
qemu-headless 4.0.0-3

* config and/or log files etc.

pf@defiant:~ =C2=BB /mnt/vms/02-archlinux/start.sh
/mnt/vms/02-archlinux/start.sh: line 41: 13501 Segmentation fault (core dum=
ped) qemu-system-x86_64 -name "${NAME}" -display none -spice ipv4,addr=3D12=
7.0.0.1,port=3D270${ID},disable-ticketing,disable-copy-paste,disable-agent-=
file-xfer,agent-mouse=3Doff -serial mon:telnet:127.0.0.1:280${ID},server,no=
wait,nodelay -gdb tcp::260${ID} -nodefaults -machine q35,accel=3Dkvm -cpu m=
ax -smp cores=3D${CPU},threads=3D1,sockets=3D1 -m ${MEM} -drive if=3Dpflash=
,format=3Draw,readonly,file=3D"${BIOS}" -drive if=3Dpflash,format=3Draw,fil=
e=3D"${VARS}" -device virtio-rng -device bochs-display -device virtio-keybo=
ard -netdev bridge,id=3Dbridge.0,br=3Dvm0 -device virtio-net,mac=3D${_MAC}:=
01,netdev=3Dbridge.0,mq=3Don,vectors=3D${_VECTORS} -fsdev local,id=3D"${NAM=
E}",path=3D"${SHARED}",security_model=3Dmapped,writeout=3Dimmediate -device=
 virtio-9p-pci,fsdev=3D"${NAME}",mount_tag=3D"shared" -device virtio-scsi,i=
d=3Dscsi,num_queues=3D${CPU},vectors=3D${_VECTORS} -device scsi-hd,drive=3D=
hd1 -drive if=3Dnone,media=3Ddisk,id=3Dhd1,file=3D"${DISK1}",format=3Draw,c=
ache=3Ddirectsync,discard=3Dunmap,detect-zeroes=3Dunmap -device scsi-hd,dri=
ve=3Dhd2 -drive if=3Dnone,media=3Ddisk,id=3Dhd2,file=3D"${DISK2}",format=3D=
raw,cache=3Ddirectsync,discard=3Dunmap,detect-zeroes=3Dunmap -device scsi-c=
d,drive=3Dcd1 -drive if=3Dnone,media=3Dcdrom,id=3Dcd1,file=3D"${CDROM1}",fo=
rmat=3Draw,cache=3Ddirectsync

Steps to reproduce:

Update spice, launch a VM like the above and observe a segfault.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837218

Title:
  qemu segfaults after spice update with bochs-display

Status in QEMU:
  New

Bug description:
  Description:

  qemu segfaults after latest spice update with bochs-display.
  Downgrading spice solves the issue. Switching to qxl-vga and/or
  virtio-gpu also works even with new spice.

  Additional info:
  * package version(s)

  spice 0.14.2-1 (0.14.0 is unaffected)
  qemu-headless 4.0.0-3

  * config and/or log files etc.

  pf@defiant:~ =C2=BB /mnt/vms/02-archlinux/start.sh
  /mnt/vms/02-archlinux/start.sh: line 41: 13501 Segmentation fault (core d=
umped) qemu-system-x86_64 -name "${NAME}" -display none -spice ipv4,addr=3D=
127.0.0.1,port=3D270${ID},disable-ticketing,disable-copy-paste,disable-agen=
t-file-xfer,agent-mouse=3Doff -serial mon:telnet:127.0.0.1:280${ID},server,=
nowait,nodelay -gdb tcp::260${ID} -nodefaults -machine q35,accel=3Dkvm -cpu=
 max -smp cores=3D${CPU},threads=3D1,sockets=3D1 -m ${MEM} -drive if=3Dpfla=
sh,format=3Draw,readonly,file=3D"${BIOS}" -drive if=3Dpflash,format=3Draw,f=
ile=3D"${VARS}" -device virtio-rng -device bochs-display -device virtio-key=
board -netdev bridge,id=3Dbridge.0,br=3Dvm0 -device virtio-net,mac=3D${_MAC=
}:01,netdev=3Dbridge.0,mq=3Don,vectors=3D${_VECTORS} -fsdev local,id=3D"${N=
AME}",path=3D"${SHARED}",security_model=3Dmapped,writeout=3Dimmediate -devi=
ce virtio-9p-pci,fsdev=3D"${NAME}",mount_tag=3D"shared" -device virtio-scsi=
,id=3Dscsi,num_queues=3D${CPU},vectors=3D${_VECTORS} -device scsi-hd,drive=
=3Dhd1 -drive if=3Dnone,media=3Ddisk,id=3Dhd1,file=3D"${DISK1}",format=3Dra=
w,cache=3Ddirectsync,discard=3Dunmap,detect-zeroes=3Dunmap -device scsi-hd,=
drive=3Dhd2 -drive if=3Dnone,media=3Ddisk,id=3Dhd2,file=3D"${DISK2}",format=
=3Draw,cache=3Ddirectsync,discard=3Dunmap,detect-zeroes=3Dunmap -device scs=
i-cd,drive=3Dcd1 -drive if=3Dnone,media=3Dcdrom,id=3Dcd1,file=3D"${CDROM1}"=
,format=3Draw,cache=3Ddirectsync

  Steps to reproduce:

  Update spice, launch a VM like the above and observe a segfault.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837218/+subscriptions

