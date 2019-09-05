Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9953DA98E6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 05:32:46 +0200 (CEST)
Received: from localhost ([::1]:42106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5iVp-00084g-6H
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 23:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i5iUA-0007YW-I7
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 23:31:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i5iU2-0003RC-62
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 23:30:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:54386)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i5iTv-0003Jx-B4
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 23:30:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i5iTq-0006HH-Kl
 for <qemu-devel@nongnu.org>; Thu, 05 Sep 2019 03:30:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 99DF82E80C7
 for <qemu-devel@nongnu.org>; Thu,  5 Sep 2019 03:30:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Sep 2019 03:24:04 -0000
From: James Harvey <jamespharvey20@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jamespharvey20
X-Launchpad-Bug-Reporter: James Harvey (jamespharvey20)
X-Launchpad-Bug-Modifier: James Harvey (jamespharvey20)
Message-Id: <156765384458.824.9301349840467221970.malonedeb@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19044";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 18be958a4b6a04e8f024b837af9373257dd3def5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1842787] [NEW] Writes permanently hang with very
 heavy I/O on virtio-scsi - worse on virtio-blk
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
Reply-To: Bug 1842787 <1842787@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Up to date Arch Linux on host and guest.  linux 5.2.11.  QEMU 4.1.0.
Full command line at bottom.

Host gives QEMU two thin LVM volumes.  The first is the root filesystem,
and the second is for heavy I/O, on a Samsung 970 Evo 1TB.

When maxing out the I/O on the second virtual block device using virtio-
blk, I often get a "lockup" in about an hour or two.  From the advise of
iggy in IRC, I switched over to virtio-scsi.  It ran perfectly for a few
days, but then "locked up" in the same way.

By "lockup", I mean writes to the second virtual block device
permanently hang.  I can read files from it, but even "touch foo" never
times out, cannot be "kill -9"'ed, and is stuck in uninterruptible
sleep.

When this happens, writes to the first virtual block device with the
root filesystem are fine, so the O/S itself remains responsive.

The second virtual block device uses BTRFS.  But, I have also tried XFS
and reproduced the issue.

In guest, when this starts, it starts logging "task X blocked for more
than Y seconds".  Below is an example of one of these.  At this point,
anything that is or does in the future write to this block device gets
stuck in uninterruptible sleep.

-----

INFO: task kcompactd:232 blocked for more than 860 seconds.
      Not tained 5.2.11-1 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messae.
kcompactd0      D    0   232      2 0x80004000
Call Trace:
 ? __schedule+0x27f/0x6d0
 schedule+0x3d/0xc0
 io_schedule+0x12/0x40
 __lock_page+0x14a/0x250
 ? add_to_page_cache_lru+0xe0/0xe0
 migrate_pages+0x803/0xb70
 ? isolate_migratepages_block+0x9f0/0x9f0
 ? __reset_isolation_suitable+0x110/0x110
 compact_zone+0x6a2/0xd30
 kcompactd_do_work+0x134/0x260
 ? kvm_clock_read+0x14/0x30
 ? kvm_sched_clock_read+0x5/0x10
 kcompactd+0xd3/0x220
 ? wait_woken+0x80/0x80
 kthread+0xfd/0x130
 ? kcompactd_do_work+0x260/0x260
 ? kthread_park+0x80/0x80
 ret_from_fork+0x35/0x40

-----

In guest, there are no other dmesg/journalctl entries other than
"task...blocked".

On host, there are no dmesg/journalctl entries whatsoever.  Everything
else in host continues to work fine, including other QEMU VM's on the
same underlying SSD (but obviously different lvm volumes.)

I understand there might not be enough to go on here, and I also
understand it's possible this isn't a QEMU bug.  Happy to run given
commands or patches to help diagnose what's going on here.

I'm now running a custom compiled QEMU 4.1.0, with debug symbols, so I
can get a meaningful backtrace from the host point of view.

-----

/usr/bin/qemu-system-x86_64
   -name arch,process=3Dqemu:arch
   -no-user-config
   -nodefaults
   -nographic
   -uuid 0528162b-2371-41d5-b8da-233fe61b6458
   -pidfile /tmp/0528162b-2371-41d5-b8da-233fe61b6458.pid
   -machine q35,accel=3Dkvm,vmport=3Doff,dump-guest-core=3Doff
   -cpu SandyBridge-IBRS
   -smp cpus=3D24,cores=3D12,threads=3D1,sockets=3D2
   -m 24G
   -drive if=3Dpflash,format=3Draw,readonly,file=3D/usr/share/ovmf/x64/OVMF=
_CODE.fd
   -drive if=3Dpflash,format=3Draw,readonly,file=3D/var/qemu/0528162b-2371-=
41d5-b8da-233fe61b6458.fd
   -monitor telnet:localhost:8000,server,nowait,nodelay
   -spice unix,addr=3D/tmp/0528162b-2371-41d5-b8da-233fe61b6458.sock,disabl=
e-ticketing
   -device ioh3420,id=3Dpcie.1,bus=3Dpcie.0,slot=3D0
   -device virtio-vga,bus=3Dpcie.1,addr=3D0
   -usbdevice tablet
   -netdev bridge,id=3Dnetwork0,br=3Dbr0
   -device virtio-net-pci,netdev=3Dnetwork0,mac=3D02:37:de:79:19:09,bus=3Dp=
cie.0,addr=3D3
   -device virtio-scsi-pci,id=3Dscsi1
   -drive driver=3Draw,node-name=3Dhd0,file=3D/dev/lvm/arch_root,if=3Dnone,=
discard=3Dunmap
   -device scsi-hd,drive=3Dhd0,bootindex=3D1
   -drive driver=3Draw,node-name=3Dhd1,file=3D/dev/lvm/arch_nvme,if=3Dnone,=
discard=3Dunmap
   -device scsi-hd,drive=3Dhd1,bootindex=3D2

-----

** Affects: qemu
     Importance: Undecided
         Status: New

** Summary changed:

- irtiWrites permanently hang with very heavy I/O on vo-scsi - worse on vir=
tio-blk
+ Writes permanently hang with very heavy I/O on virtio-scsi - worse on vir=
tio-blk

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1842787

Title:
  Writes permanently hang with very heavy I/O on virtio-scsi - worse on
  virtio-blk

Status in QEMU:
  New

Bug description:
  Up to date Arch Linux on host and guest.  linux 5.2.11.  QEMU 4.1.0.
  Full command line at bottom.

  Host gives QEMU two thin LVM volumes.  The first is the root
  filesystem, and the second is for heavy I/O, on a Samsung 970 Evo 1TB.

  When maxing out the I/O on the second virtual block device using
  virtio-blk, I often get a "lockup" in about an hour or two.  From the
  advise of iggy in IRC, I switched over to virtio-scsi.  It ran
  perfectly for a few days, but then "locked up" in the same way.

  By "lockup", I mean writes to the second virtual block device
  permanently hang.  I can read files from it, but even "touch foo"
  never times out, cannot be "kill -9"'ed, and is stuck in
  uninterruptible sleep.

  When this happens, writes to the first virtual block device with the
  root filesystem are fine, so the O/S itself remains responsive.

  The second virtual block device uses BTRFS.  But, I have also tried
  XFS and reproduced the issue.

  In guest, when this starts, it starts logging "task X blocked for more
  than Y seconds".  Below is an example of one of these.  At this point,
  anything that is or does in the future write to this block device gets
  stuck in uninterruptible sleep.

  -----

  INFO: task kcompactd:232 blocked for more than 860 seconds.
        Not tained 5.2.11-1 #1
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messae.
  kcompactd0      D    0   232      2 0x80004000
  Call Trace:
   ? __schedule+0x27f/0x6d0
   schedule+0x3d/0xc0
   io_schedule+0x12/0x40
   __lock_page+0x14a/0x250
   ? add_to_page_cache_lru+0xe0/0xe0
   migrate_pages+0x803/0xb70
   ? isolate_migratepages_block+0x9f0/0x9f0
   ? __reset_isolation_suitable+0x110/0x110
   compact_zone+0x6a2/0xd30
   kcompactd_do_work+0x134/0x260
   ? kvm_clock_read+0x14/0x30
   ? kvm_sched_clock_read+0x5/0x10
   kcompactd+0xd3/0x220
   ? wait_woken+0x80/0x80
   kthread+0xfd/0x130
   ? kcompactd_do_work+0x260/0x260
   ? kthread_park+0x80/0x80
   ret_from_fork+0x35/0x40

  -----

  In guest, there are no other dmesg/journalctl entries other than
  "task...blocked".

  On host, there are no dmesg/journalctl entries whatsoever.  Everything
  else in host continues to work fine, including other QEMU VM's on the
  same underlying SSD (but obviously different lvm volumes.)

  I understand there might not be enough to go on here, and I also
  understand it's possible this isn't a QEMU bug.  Happy to run given
  commands or patches to help diagnose what's going on here.

  I'm now running a custom compiled QEMU 4.1.0, with debug symbols, so I
  can get a meaningful backtrace from the host point of view.

  -----

  /usr/bin/qemu-system-x86_64
     -name arch,process=3Dqemu:arch
     -no-user-config
     -nodefaults
     -nographic
     -uuid 0528162b-2371-41d5-b8da-233fe61b6458
     -pidfile /tmp/0528162b-2371-41d5-b8da-233fe61b6458.pid
     -machine q35,accel=3Dkvm,vmport=3Doff,dump-guest-core=3Doff
     -cpu SandyBridge-IBRS
     -smp cpus=3D24,cores=3D12,threads=3D1,sockets=3D2
     -m 24G
     -drive if=3Dpflash,format=3Draw,readonly,file=3D/usr/share/ovmf/x64/OV=
MF_CODE.fd
     -drive if=3Dpflash,format=3Draw,readonly,file=3D/var/qemu/0528162b-237=
1-41d5-b8da-233fe61b6458.fd
     -monitor telnet:localhost:8000,server,nowait,nodelay
     -spice unix,addr=3D/tmp/0528162b-2371-41d5-b8da-233fe61b6458.sock,disa=
ble-ticketing
     -device ioh3420,id=3Dpcie.1,bus=3Dpcie.0,slot=3D0
     -device virtio-vga,bus=3Dpcie.1,addr=3D0
     -usbdevice tablet
     -netdev bridge,id=3Dnetwork0,br=3Dbr0
     -device virtio-net-pci,netdev=3Dnetwork0,mac=3D02:37:de:79:19:09,bus=
=3Dpcie.0,addr=3D3
     -device virtio-scsi-pci,id=3Dscsi1
     -drive driver=3Draw,node-name=3Dhd0,file=3D/dev/lvm/arch_root,if=3Dnon=
e,discard=3Dunmap
     -device scsi-hd,drive=3Dhd0,bootindex=3D1
     -drive driver=3Draw,node-name=3Dhd1,file=3D/dev/lvm/arch_nvme,if=3Dnon=
e,discard=3Dunmap
     -device scsi-hd,drive=3Dhd1,bootindex=3D2

  -----

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1842787/+subscriptions

