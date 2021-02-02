Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7C30BA52
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 09:52:13 +0100 (CET)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6rPv-0006xc-S4
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 03:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6rOd-0006RU-LU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 03:50:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:33852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6rOa-00016U-BF
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 03:50:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l6rOX-0004gZ-O5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 08:50:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9F2D92E813A
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 08:50:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Feb 2021 08:36:10 -0000
From: Alexandre arents <1912224@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aarents
X-Launchpad-Bug-Reporter: Alexandre arents (aarents)
X-Launchpad-Bug-Modifier: Alexandre arents (aarents)
References: <161098039664.6686.1246044899603761821.malonedeb@wampee.canonical.com>
Message-Id: <161225497153.13540.11108404669369396416.malone@soybean.canonical.com>
Subject: [Bug 1912224] Re: qemu may freeze during drive-mirroring on
 fragmented FS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 388fea849867d84ddd0bf98b6b0652d04d597704
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, LOTS_OF_MONEY=0.001, MONEY_NOHTML=1.147,
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

I think the issue come from  SEEK_HOLE call.
SEEK_HOLE is fine until we find a hole close to the offset,
It becomes a very expensive call when the HOLE is at the
end of file of a big file (or smaller fragmented file =

because there is a lot of FS extent the driver should check.)

When we run a mirror on a 400GB raw file fully written (not fragmented):
for each 1MB chunk we do:
 mirror_iteration(MirrorBlockJob *s)
   -> bdrv_block_status_above(..)
      ... -> find_allocation (file-posix.c)
	 -> offs =3D lseek(s->fd, start, SEEK_HOLE);

In strace this result like this:
[pid 105339] 17:41:05.548334 lseek(38, 0, SEEK_HOLE) =3D 429496729600 <0.01=
5172>
[pid 105339] 17:41:05.564798 lseek(38, 1048576, SEEK_HOLE) =3D 429496729600=
 <0.008762>
[pid 105339] 17:41:05.576223 lseek(38, 2097152, SEEK_HOLE) =3D 429496729600=
 <0.006250>
[pid 105339] 17:41:05.583299 lseek(38, 3145728, SEEK_HOLE) =3D 429496729600=
 <0.005511>
[pid 105339] 17:41:05.589771 lseek(38, 4194304, SEEK_HOLE) =3D 429496729600=
 <0.005181>
[pid 105339] 17:41:05.596390 lseek(38, 5242880, SEEK_HOLE) =3D 429496729600=
 <0.005829>
[pid 105339] 17:41:05.603473 lseek(38, 6291456, SEEK_HOLE) =3D 429496729600=
 <0.005276>
[pid 105339] 17:41:05.609833 lseek(38, 7340032, SEEK_HOLE) =3D 429496729600=
 <0.006089>

^^ for each MB FS driver is going accross all file extent till the end of t=
he file,
 the qemu unstability comes from that.

Maybe one way to fix that is to not run SEEK_HOLE at each iteration
but run it only when needed.
Some thing like adding a property in MirrorBlockJob like hole_offest,
that store where is the last known offset where there is a hole.
And pass it on find_allocation and evaluate the need
to run SEEK_HOLE or not.

Like this:
typedef struct MirrorBlockJob {
...
   int64_t hole_offset; /* last known hole_offset during migration */
}

mirror_iteration(MirrorBlockJob *s)
 -> bdrv_block_status_above(...., &s->hole_offset)
   ...   =

   -> find_allocation (...., hole_offest)
        evaluate offset and  hole_offest to run or not SEEK_HOLE.

Note this involve adding an additional arg to bdrv_block_status_above(), an=
d we need to update
code for all driver.

Is there a better way to fix that issue ?

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

