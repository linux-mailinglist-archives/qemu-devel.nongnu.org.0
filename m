Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE3C316840
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:47:32 +0100 (CET)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9pq7-0004JK-BN
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9por-0003ph-4S
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:46:13 -0500
Received: from indium.canonical.com ([91.189.90.7]:45348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9poo-0000jO-GH
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:46:12 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9pok-0003Mx-H5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:46:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6FB162E8138
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:46:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Feb 2021 13:36:48 -0000
From: Alexandre arents <1912224@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aarents xanclic
X-Launchpad-Bug-Reporter: Alexandre arents (aarents)
X-Launchpad-Bug-Modifier: Alexandre arents (aarents)
References: <161098039664.6686.1246044899603761821.malonedeb@wampee.canonical.com>
Message-Id: <161296420905.28234.4479153298965943032.malone@soybean.canonical.com>
Subject: [Bug 1912224] Re: qemu may freeze during drive-mirroring on
 fragmented FS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: 3baaba42cad060c82a9a52181523c41163e5de3b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, LOTS_OF_MONEY=0.001, MONEY_NOHTML=1.853,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1912224 <1912224@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some more data for Qcow2,

Qcow2 format is not impacted by the issue because it
does not do SEEK_DATA/HOLE at all, because as you said it knows
from its own metadata.
But qcow2 instances with a RAW backing file does..
So qcow2 instances laverage also benefit of the patch,
if they have big RAW backing file (or smaller but fragmented).
Openstack default is RAW backing file for qcow2
instance images_type.

I made others test on local mirror:
*57 GiB disk in on ssd, mirror file is on a nvme device
*the disk is on fragmented file
 (Average size per extent 2125 KB, nb_extent: 28495, ext4)
*both qcow2 and raw test are run on the same fragmented file,
 only content change(format/data).

RESULTS
master____ RAW_________ 203s 291MB/s qemu freeze
master-fix RAW_________ 113s 523MB/s qemu stable (+56% perf)

master____ QCOW2_______ 115s 505MB/s qemu stable
master-fix QCOW2_______ 116s 505MB/s qemu stable

master____ QCOW2-SML_BF 113s 523MB/s qemu stable (1)
master-fix QCOW2-SML_BF 113s 523MB/s qemu stable (1)

master____ QCOW2-BIG_BF 201s 294MB/s qemu freeze (2)
master-fix QCOW2-BIG_BF 112s 523MB/s qemu stable (2) (+56% perf)


(1) qcow2 disk with small RAW backing file (1.5GB)
    big part of data are in qcow2 format

(2) qcow2 disk with all data in RAW backing file (57GiB)

Here are some stap metrics during test:
(see script at the end)

find_allocation: total count of qemu find_allocation calls
iomap_seek_hole: count SEEK_HOLE (fs/iomap.c)
iomap_apply: count file extent iomap (fs/iomap.c) =


iomap_seek_hole loop iomap_apply calls on all file extent until
it finds a hole or EOF, it can be 1 up to 28495 in worst case
in the test file.


master____ RAW_________ 203s 291MB/s qemu freeze
find_allocation: 59139
iomap_seek_hole: 59139 (each find_allocation call SEEK_HOLE)
iomap_apply: 843330989 (this breaks qemu)
master-fix RAW_________ 113s 523MB/s qemu stable (+56% perf)
find_allocation: 59167
iomap_seek_hole: 4 (hole cache hit 99.993%) =

iomap_apply: 113286 (avg iomap_apply call per SEEK_HOLE: 28321)

master____ QCOW2_______ 115s 505MB/s qemu stable
find_allocation: 0
iomap_seek_hole: 0
iomap_apply: 0
master-fix QCOW2_______ 116s 505MB/s qemu stable
find_allocation: 0
iomap_seek_hole: 0
iomap_apply: 0

master____ QCOW2-SML_BF 113s 523MB/s qemu stable (1)
find_allocation: 1418
iomap_seek_hole: 1297
iomap_apply: 7297
master-fix QCOW2-SML_BF 113s 523MB/s qemu stable (1)
find_allocation: 1418
iomap_seek_hole: 145  (hole cache hit 0.898%)
iomap_apply: 794

master____ QCOW2-BIG_BF 201s 294MB/s qemu freeze (2)
find_allocation: 59133
iomap_seek_hole: 59133
iomap_apply: 843172534
master-fix QCOW2-BIG_BF 112s 523MB/s qemu stable (2) (+56% perf)
find_allocation: 59130
iomap_seek_hole: 1 (hole cache hit 0.999%)
iomap_apply: 28494

################# seek_hole.stp ###############################
global iomap_apply, iomap_seek_hole, find_allocation
probe kernel.function("iomap_seek_hole").call {
  if (pid() =3D=3D target()) {
    iomap_seek_hole ++
  }
}
probe kernel.function("iomap_apply").call {
  if (pid() =3D=3D target()) {
  iomap_apply  ++
  }
}
probe process("/usr/bin/qemu-system-x86_64").function("find_allocation").ca=
ll {
  if (pid() =3D=3D target()) {
      find_allocation ++
  }
}
probe end {
 printf ("find_allocation: %d\niomap_seek_hole: %d\niomap_apply: %d\n",find=
_allocation, iomap_seek_hole, iomap_apply)
}

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912224

Title:
  qemu may freeze during drive-mirroring on fragmented FS

Status in QEMU:
  New

Bug description:
  =

  We have odd behavior in operation where qemu freeze during long
  seconds, We started an thread about that issue here:
  https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05623.html

  It happens at least during openstack nova snapshot (qemu blockdev-mirror)
  or live block migration(which include network copy of disk).

  After further troubleshoots, it seems related to FS fragmentation on
  host.

  reproducible at least on:
  Ubuntu 18.04.3/4.18.0-25-generic/qemu-4.0
  Ubuntu 16.04.6/5.10.6/qemu-5.2.0-rc2

  # Lets create a dedicated file system on a SSD/Nvme 60GB disk in my case:
  $sudo mkfs.ext4 /dev/sda3
  $sudo mount /dev/sda3 /mnt
  $df -h /mnt
  Filesystem      Size  Used Avail Use% Mounted on
  /dev/sda3         59G   53M   56G   1% /mnt

  #Create a fragmented disk on it using 2MB Chunks (about 30min):
  $sudo python3 create_fragged_disk.py /mnt 2
  Filling up FS by Creating chunks files in:  /mnt/chunks
  We are probably full as expected!!:  [Errno 28] No space left on device
  Creating fragged disk file:  /mnt/disk

  $ls -lhs =

  59G -rw-r--r-- 1 root root 59G Jan 15 14:08 /mnt/disk

  $ sudo e4defrag -c /mnt/disk
   Total/best extents                             41971/30
   Average size per extent                        1466 KB
   Fragmentation score                            2
   [0-30 no problem: 31-55 a little bit fragmented: 56- needs defrag]
   This file (/mnt/disk) does not need defragmentation.
   Done.

  # the tool^^^ says it is not enough fragmented to be able to defrag.

  #Inject an image on fragmented disk
  sudo chown ubuntu /mnt/disk
  wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudim=
g-amd64.img
  qemu-img convert -O raw  bionic-server-cloudimg-amd64.img \
                           bionic-server-cloudimg-amd64.img.raw
  dd conv=3Dnotrunc iflag=3Dfullblock if=3Dbionic-server-cloudimg-amd64.img=
.raw \
                  of=3D/mnt/disk bs=3D1M
  virt-customize -a /mnt/disk --root-password password:xxxx

  # logon run console activity ex: ping -i 0.3 127.0.0.1
  $qemu-system-x86_64 -m 2G -enable-kvm  -nographic \
      -chardev socket,id=3Dtest,path=3D/tmp/qmp-monitor,server,nowait \
      -mon chardev=3Dtest,mode=3Dcontrol \
      -drive file=3D/mnt/disk,format=3Draw,if=3Dnone,id=3Ddrive-virtio-disk=
0,cache=3Dnone,discard\
      -device virtio-blk-pci,scsi=3Doff,drive=3Ddrive-virtio-disk0,id=3Dvir=
tio-disk0,bootindex=3D1,write-cache=3Don

  $sync
  $echo 3 | sudo tee -a /proc/sys/vm/drop_caches

  #start drive-mirror via qmp on another SSD/nvme partition
  nc -U /tmp/qmp-monitor
  {"execute":"qmp_capabilities"}
  {"execute":"drive-mirror","arguments":{"device":"drive-virtio-disk0","tar=
get":"/home/ubuntu/mirror","sync":"full","format":"qcow2"}}
  ^^^ qemu console may start to freeze at this step.

  NOTE:
   - smaller chunk sz and bigger disk size the worst it is.
     In operation we also have issue on 400GB disk size with average 13MB/e=
xtent
   - Reproducible also on xfs

  =

  Expected behavior:
  -------------------
  QEMU should remain steady, eventually only have decrease storage Performa=
nce
  or mirroring, because of fragmented fs.

  Observed behavior:
  -------------------
  Perf of mirroring is still quite good even on fragmented FS,
  but it breaks qemu.

  =

  ######################  create_fragged_disk.py ############
  import sys
  import os
  import tempfile
  import glob
  import errno

  MNT_DIR =3D sys.argv[1]
  CHUNK_SZ_MB =3D int(sys.argv[2])
  CHUNKS_DIR =3D MNT_DIR + '/chunks'
  DISK_FILE =3D MNT_DIR + '/disk'

  if not os.path.exists(CHUNKS_DIR):
      os.makedirs(CHUNKS_DIR)

  with open("/dev/urandom", "rb") as f_rand:
       mb_rand=3Df_rand.read(1024 * 1024)

  print("Filling up FS by Creating chunks files in: ",CHUNKS_DIR)
  try:
      while True:
          tp =3D tempfile.NamedTemporaryFile(dir=3DCHUNKS_DIR,delete=3DFals=
e)
          for x in range(CHUNK_SZ_MB):
              tp.write(mb_rand)
          os.fsync(tp)
          tp.close()
  except Exception as ex:
      print("We are probably full as expected!!: ",ex)

  chunks =3D glob.glob(CHUNKS_DIR + '/*')

  print("Creating fragged disk file: ",DISK_FILE)
  with open(DISK_FILE, "w+b") as f_disk:
      for chunk in chunks:
          try:
              os.unlink(chunk)
              for x in range(CHUNK_SZ_MB):
                  f_disk.write(mb_rand)
              os.fsync(f_disk)
          except IOError as ex:
              if ex.errno !=3D errno.ENOSPC:
                  raise
  ###########################################################3

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912224/+subscriptions

