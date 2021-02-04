Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B330EF8D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:22:25 +0100 (CET)
Received: from localhost ([::1]:59580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7aqG-0001Hy-5E
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7aot-0000lp-Sc
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:20:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:53744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7aor-0008IC-Da
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:20:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7aop-0007Ao-Aa
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:20:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 091942E813A
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 09:20:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Feb 2021 09:11:12 -0000
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
Message-Id: <161242987247.2612.7461643252308869226.malone@gac.canonical.com>
Subject: [Bug 1912224] Re: qemu may freeze during drive-mirroring on
 fragmented FS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: fcdd09f3911f6c6037c707a2cf5c743825864025
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, LOTS_OF_MONEY=0.001, MONEY_NOHTML=1.142,
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

It helps a lot, and it goes fast !

live block migration of 400GB raw disk:
master      1130s (362MB/s) qemu  unstable/frozen
master+fix  445s  (920MB/s) qemu  stable

Thanks Max, It will be nice to have this one merged.

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

