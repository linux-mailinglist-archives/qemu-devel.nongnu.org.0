Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6800FDA832
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 11:21:51 +0200 (CEST)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL1yf-0003Te-V1
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 05:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iL1xo-00031j-1c
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 05:20:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iL1xm-0004RG-As
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 05:20:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:48200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iL1xm-0004QT-5D
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 05:20:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iL1xk-0003Sy-IZ
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 09:20:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 88A0B2E80C0
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 09:20:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Oct 2019 09:06:47 -0000
From: "Laszlo Ersek \(Red Hat\)" <lersek@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h lersek michael-weiser psyhomb
X-Launchpad-Bug-Reporter: Michael Weiser (michael-weiser)
X-Launchpad-Bug-Modifier: Laszlo Ersek (Red Hat) (lersek)
References: <157005622285.15919.12087374175062502233.malonedeb@gac.canonical.com>
Message-Id: <157130320802.18858.281036375628340488.malone@gac.canonical.com>
Subject: [Bug 1846427] Re: 4.1.0: qcow2 corruption on savevm/quit/loadvm cycle
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4107426a155b6bbeeb3dfeff15002710eb79bf57
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
Reply-To: Bug 1846427 <1846427@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After reading the message of commit 69f47505ee66 ("block: avoid
recursive block_status call if possible", 2019-06-04), I'm none the
wiser. But, I can at least confirm that all my qcow2 images are
pre-allocated, as a norm. I create them with the following command:

qemu-img create \
  -f qcow2 \
  -o compat=3D1.1 \
  -o cluster_size=3D65536 \
  -o preallocation=3Dmetadata \
  -o lazy_refcounts=3Don \
  $FILENAME \
  100G

Perhaps this helps reproducing the issue. The commit message says,
"However, lseek is needed when we have metadata-preallocated image", so
that might be a special case that I've hit with some frequency.

I do have a vague suspicion that the following idea:

    The idea is to compare allocation size in POV of filesystem with
    allocations size in POV of Qcow2 (by refcounts). If allocation in fs is
    significantly lower, consider it as metadata-preallocation case.

is not robust enough. From the description, the "metadata-preallocation
case" appears to be determined with *heuristics*, but then again, "lseek
is needed when we have metadata-preallocated image". So if there is a
clear requirement to behave differently / particularly for
metadata-preallocated images, why is it safe to (basically) *guess*
whether a given image had its metadata pre-allocated?

+    threshold =3D MAX(real_clusters * 10 / 9, real_clusters + 2);

Where do those constants come from?

... Not sure if it matters: the host filesystem holding my qcow2 images
is "ext4". Filesystem features (dumped with the fs being mounted r/w at
the moment): has_journal, ext_attr resize_inode, dir_index, filetype,
needs_recovery, extent, flex_bg, sparse_super, large_file, huge_file,
uninit_bg, dir_nlink, extra_isize. Filesystem flags:
signed_directory_hash.

Thanks.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1846427

Title:
  4.1.0: qcow2 corruption on savevm/quit/loadvm cycle

Status in QEMU:
  New

Bug description:
  I'm seeing massive corruption of qcow2 images with qemu 4.1.0 and git
  master as of 7f21573c822805a8e6be379d9bcf3ad9effef3dc after a few
  savevm/quit/loadvm cycles. I've narrowed it down to the following
  reproducer (further notes below):

  # qemu-img check debian.qcow2
  No errors were found on the image.
  251601/327680 =3D 76.78% allocated, 1.63% fragmented, 0.00% compressed cl=
usters
  Image end offset: 18340446208
  # bin/qemu/bin/qemu-system-x86_64 -machine pc-q35-4.0.1,accel=3Dkvm -m 40=
96 -chardev stdio,id=3Dcharmonitor -mon chardev=3Dcharmonitor -drive file=
=3Ddebian.qcow2,id=3Dd -S
  qemu-system-x86_64: warning: dbind: Couldn't register with accessibility =
bus: Did not receive a reply. Possible causes include: the remote applicati=
on did not send a reply, the message bus security policy blocked the reply,=
 the reply timeout expired, or the network connection was broken.
  QEMU 4.1.50 monitor - type 'help' for more information
  (qemu) loadvm foo
  (qemu) c
  (qemu) qcow2_free_clusters failed: Invalid argument
  qcow2_free_clusters failed: Invalid argument
  qcow2_free_clusters failed: Invalid argument
  qcow2_free_clusters failed: Invalid argument
  quit
  [m@nargothrond:~] qemu-img check debian.qcow2
  Leaked cluster 85179 refcount=3D2 reference=3D1
  Leaked cluster 85180 refcount=3D2 reference=3D1
  ERROR cluster 266150 refcount=3D0 reference=3D2
  [...]
  ERROR OFLAG_COPIED data cluster: l2_entry=3D422840000 refcount=3D1

  9493 errors were found on the image.
  Data may be corrupted, or further writes to the image may corrupt it.

  2 leaked clusters were found on the image.
  This means waste of disk space, but no harm to data.
  259266/327680 =3D 79.12% allocated, 1.67% fragmented, 0.00% compressed cl=
usters
  Image end offset: 18340446208

  This is on a x86_64 Linux 5.3.1 Gentoo host with qemu-system-x86_64
  and accel=3Dkvm. The compiler is gcc-9.2.0 with the rest of the system
  similarly current.

  Reproduced with qemu-4.1.0 from distribution package as well as
  vanilla git checkout of tag v4.1.0 and commit
  7f21573c822805a8e6be379d9bcf3ad9effef3dc (today's master). Does not
  happen with qemu compiled from vanilla checkout of tag v4.0.0. Build
  sequence:

  ./configure --prefix=3D$HOME/bin/qemu-bisect --target-list=3Dx86_64-softm=
mu --disable-werror --disable-docs
  [...]
  CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -g
  [...] (can provide full configure output if helpful)
  make -j8 install

  The kind of guest OS does not matter: seen with Debian testing 64bit,
  Windows 7 x86/x64 BIOS and Windows 7 x64 EFI.

  The virtual storage controller does not seem to matter: seen with
  VirtIO SCSI, emulated SCSI and emulated SATA AHCI.

  Caching modes (none, directsync, writeback), aio mode (threads,
  native) or discard (ignore, unmap) or detect-zeroes (off, unmap) does
  not influence occurence either.

  Having more RAM in the guest seems to increase odds of corruption:
  With 512MB to the Debian guest problem hardly occurs at all, with 4GB
  RAM it happens almost instantly.

  An automated reproducer works as follows:

  - the guest *does* mount its root fs and swap with option discard and
  my testing leaves me with the impression that file deletion rather
  than reading is causing the issue

  - foo is a snapshot of the running Debian VM which is already running
  command

  # while true ; do dd if=3D/dev/zero of=3Dfoo bs=3D10240k count=3D400 ; do=
ne

  to produce some I/O to the disk (4GB file with 4GB of RAM).

  - on the host a loop continuously resumes and saves the guest state
  and quits qemu inbetween:

  # while true ; do (echo loadvm foo ; echo c ; sleep 10 ; echo stop ;
  echo savevm foo ; echo quit ) | bin/qemu-bisect/bin/qemu-system-x86_64
  -machine pc-q35-3.1,accel=3Dkvm -m 4096 -chardev stdio,id=3Dcharmonitor
  -mon chardev=3Dcharmonitor -drive file=3Ddebian.qcow2,id=3Dd -S -display
  none ; done

  - quitting qemu inbetween saves and loads seems to be necessary for
  the problem to occur. Just continusouly in one session saving and
  loading guest state does not trigger it.

  - For me, after about 2 to 6 iterations of above loop the image is
  corrupted.

  - corruption manifests with other messages from qemu as well, e.g.:

  (qemu) loadvm foo
  Error: Device 'd' does not have the requested snapshot 'foo'

  Using above reproducer I have to the be best of my ability bisected
  the introduction of the problem to commit
  69f47505ee66afaa513305de0c1895a224e52c45 (block: avoid recursive
  block_status call if possible). qemu compiled from the commit before
  does not exhibit the issue, from that commit on it does and reverting
  the commit off of current master makes it disappear.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1846427/+subscriptions

