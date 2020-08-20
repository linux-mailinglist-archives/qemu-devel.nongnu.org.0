Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F5524C77D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 23:59:12 +0200 (CEST)
Received: from localhost ([::1]:37562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8saV-0002L3-2i
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 17:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@fromorbit.com>)
 id 1k8sZq-0001w0-6b; Thu, 20 Aug 2020 17:58:30 -0400
Received: from mail105.syd.optusnet.com.au ([211.29.132.249]:57259)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>)
 id 1k8sZn-0001dZ-9D; Thu, 20 Aug 2020 17:58:29 -0400
Received: from dread.disaster.area (pa49-181-146-199.pa.nsw.optusnet.com.au
 [49.181.146.199])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 5EB853A5F39;
 Fri, 21 Aug 2020 07:58:12 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1k8sZX-0007M4-Sg; Fri, 21 Aug 2020 07:58:11 +1000
Date: Fri, 21 Aug 2020 07:58:11 +1000
From: Dave Chinner <david@fromorbit.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH 0/1] qcow2: Skip copy-on-write when allocating a zero
 cluster
Message-ID: <20200820215811.GC7941@dread.disaster.area>
References: <cover.1597416317.git.berto@igalia.com>
 <20200817101019.GD11402@linux.fritz.box>
 <w518sedz3td.fsf@maestria.local.igalia.com>
 <20200817155307.GS11402@linux.fritz.box>
 <w51pn7memr7.fsf@maestria.local.igalia.com>
 <20200819150711.GE10272@linux.fritz.box>
 <20200819175300.GA141399@bfoster>
 <w51v9hdultt.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w51v9hdultt.fsf@maestria.local.igalia.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=QIgWuTDL c=1 sm=1 tr=0 cx=a_idp_d
 a=GorAHYkI+xOargNMzM6qxQ==:117 a=GorAHYkI+xOargNMzM6qxQ==:17
 a=kj9zAlcOel0A:10 a=y4yBn9ojGxQA:10 a=7-415B0cAAAA:8
 a=2Bx8Jmvsl4pN9QuK9MMA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
Received-SPF: none client-ip=211.29.132.249; envelope-from=david@fromorbit.com;
 helo=mail105.syd.optusnet.com.au
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 17:58:22
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Brian Foster <bfoster@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, linux-xfs@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 20, 2020 at 10:03:10PM +0200, Alberto Garcia wrote:
> Cc: linux-xfs
> 
> On Wed 19 Aug 2020 07:53:00 PM CEST, Brian Foster wrote:
> > In any event, if you're seeing unclear or unexpected performance
> > deltas between certain XFS configurations or other fs', I think the
> > best thing to do is post a more complete description of the workload,
> > filesystem/storage setup, and test results to the linux-xfs mailing
> > list (feel free to cc me as well). As it is, aside from the questions
> > above, it's not really clear to me what the storage stack looks like
> > for this test, if/how qcow2 is involved, what the various
> > 'preallocation=' modes actually mean, etc.
> 
> (see [1] for a bit of context)
> 
> I repeated the tests with a larger (125GB) filesystem. Things are a bit
> faster but not radically different, here are the new numbers:
> 
> |----------------------+-------+-------|
> | preallocation mode   |   xfs |  ext4 |
> |----------------------+-------+-------|
> | off                  |  8139 | 11688 |
> | off (w/o ZERO_RANGE) |  2965 |  2780 |
> | metadata             |  7768 |  9132 |
> | falloc               |  7742 | 13108 |
> | full                 | 41389 | 16351 |
> |----------------------+-------+-------|
> 
> The numbers are I/O operations per second as reported by fio, running
> inside a VM.
> 
> The VM is running Debian 9.7 with Linux 4.9.130 and the fio version is
> 2.16-1. I'm using QEMU 5.1.0.
> 
> fio is sending random 4KB write requests to a 25GB virtual drive, this
> is the full command line:
> 
> fio --filename=/dev/vdb --direct=1 --randrepeat=1 --eta=always
>     --ioengine=libaio --iodepth=32 --numjobs=1 --name=test --size=25G
>     --io_limit=25G --ramp_time=5 --rw=randwrite --bs=4k --runtime=60
>   
> The virtual drive (/dev/vdb) is a freshly created qcow2 file stored on
> the host (on an xfs or ext4 filesystem as the table above shows), and
> it is attached to QEMU using a virtio-blk-pci device:
> 
>    -drive if=virtio,file=image.qcow2,cache=none,l2-cache-size=200M

You're not using AIO on this image file, so it can't do
concurrent IO? what happens when you add "aio=native" to this?

> cache=none means that the image is opened with O_DIRECT and
> l2-cache-size is large enough so QEMU is able to cache all the
> relevant qcow2 metadata in memory.

What happens when you just use a sparse file (i.e. a raw image) with
aio=native instead of using qcow2? XFS, ext4, btrfs, etc all support
sparse files so using qcow2 to provide sparse image file support is
largely an unnecessary layer of indirection and overhead...

And with XFS, you don't need qcow2 for snapshots either because you
can use reflink copies to take an atomic copy-on-write snapshot of
the raw image file... (assuming you made the xfs filesystem with
reflink support (which is the TOT default now)).

I've been using raw sprase files on XFS for all my VMs for over a
decade now, and using reflink to create COW copies of golden
image files iwhen deploying new VMs for a couple of years now...

> The host is running Linux 4.19.132 and has an SSD drive.
> 
> About the preallocation modes: a qcow2 file is divided into clusters
> of the same size (64KB in this case). That is the minimum unit of
> allocation, so when writing 4KB to an unallocated cluster QEMU needs
> to fill the other 60KB with zeroes. So here's what happens with the
> different modes:

Which is something that sparse files on filesystems do not need to
do. If, on XFS, you really want 64kB allocation clusters, use an
extent size hint of 64kB. Though for image files, I highly recommend
using 1MB or larger extent size hints.


> 1) off: for every write request QEMU initializes the cluster (64KB)
>         with fallocate(ZERO_RANGE) and then writes the 4KB of data.
> 
> 2) off w/o ZERO_RANGE: QEMU writes the 4KB of data and fills the rest
>         of the cluster with zeroes.
> 
> 3) metadata: all clusters were allocated when the image was created
>         but they are sparse, QEMU only writes the 4KB of data.
> 
> 4) falloc: all clusters were allocated with fallocate() when the image
>         was created, QEMU only writes 4KB of data.
> 
> 5) full: all clusters were allocated by writing zeroes to all of them
>         when the image was created, QEMU only writes 4KB of data.
> 
> As I said in a previous message I'm not familiar with xfs, but the
> parts that I don't understand are
> 
>    - Why is (4) slower than (1)?

Because fallocate() is a full IO serialisation barrier at the
filesystem level. If you do:

fallocate(whole file)
<IO>
<IO>
<IO>
.....

The IO can run concurrent and does not serialise against anything in
the filesysetm except unwritten extent conversions at IO completion
(see answer to next question!)

However, if you just use (4) you get:

falloc(64k)
  <wait for inflight IO to complete>
  <allocates 64k as unwritten>
<4k io>
  ....
falloc(64k)
  <wait for inflight IO to complete>
  ....
  <4k IO completes, converts 4k to written>
  <allocates 64k as unwritten>
<4k io>
falloc(64k)
  <wait for inflight IO to complete>
  ....
  <4k IO completes, converts 4k to written>
  <allocates 64k as unwritten>
<4k io>
  ....

until all the clusters in the qcow2 file are intialised. IOWs, each
fallocate() call serialises all IO in flight. Compare that to using
extent size hints on a raw sparse image file for the same thing:

<set 64k extent size hint>
<4k IO>
  <allocates 64k as unwritten>
  ....
<4k IO>
  <allocates 64k as unwritten>
  ....
<4k IO>
  <allocates 64k as unwritten>
  ....
...
  <4k IO completes, converts 4k to written>
  <4k IO completes, converts 4k to written>
  <4k IO completes, converts 4k to written>
....

See the difference in IO pipelining here? You get the same "64kB
cluster initialised at a time" behaviour as qcow2, but you don't get
the IO pipeline stalls caused by fallocate() having to drain all the
IO in flight before it does the allocation.

>    - Why is (5) so much faster than everything else?

The full file allocation in (5) means the IO doesn't have to modify
the extent map hence all extent mapping is uses shared locking and
the entire IO path can run concurrently without serialisation at
all.

Thing is, once your writes into sprase image files regularly start
hitting written extents, the performance of (1), (2) and (4) will
trend towards (5) as writes hit already allocated ranges of the file
and the serialisation of extent mapping changes goes away. This
occurs with guest filesystems that perform overwrite in place (such
as XFS) and hence overwrites of existing data will hit allocated
space in the image file and not require further allocation.

IOWs, typical "write once" benchmark testing indicates the *worst*
performance you are going to see. As the guest filesytsem ages and
initialises more of the underlying image file, it will get faster,
not slower.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

