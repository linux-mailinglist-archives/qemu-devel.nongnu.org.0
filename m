Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85624EFF6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 00:00:40 +0200 (CEST)
Received: from localhost ([::1]:56070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9y2Z-0003Ad-Al
	for lists+qemu-devel@lfdr.de; Sun, 23 Aug 2020 18:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@fromorbit.com>)
 id 1k9y1O-0002ex-Qs; Sun, 23 Aug 2020 17:59:26 -0400
Received: from mail104.syd.optusnet.com.au ([211.29.132.246]:55519)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>)
 id 1k9y1M-0002vs-9J; Sun, 23 Aug 2020 17:59:26 -0400
Received: from dread.disaster.area (pa49-181-146-199.pa.nsw.optusnet.com.au
 [49.181.146.199])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 0FDD58235D1;
 Mon, 24 Aug 2020 07:59:08 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1k9y15-0000V5-Em; Mon, 24 Aug 2020 07:59:07 +1000
Date: Mon, 24 Aug 2020 07:59:07 +1000
From: Dave Chinner <david@fromorbit.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH 0/1] qcow2: Skip copy-on-write when allocating a zero
 cluster
Message-ID: <20200823215907.GH7941@dread.disaster.area>
References: <w518sedz3td.fsf@maestria.local.igalia.com>
 <20200817155307.GS11402@linux.fritz.box>
 <w51pn7memr7.fsf@maestria.local.igalia.com>
 <20200819150711.GE10272@linux.fritz.box>
 <20200819175300.GA141399@bfoster>
 <w51v9hdultt.fsf@maestria.local.igalia.com>
 <20200820215811.GC7941@dread.disaster.area>
 <20200821110506.GB212879@bfoster>
 <w51364gjkcj.fsf@maestria.local.igalia.com>
 <w51zh6oi4en.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w51zh6oi4en.fsf@maestria.local.igalia.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LPwYv6e9 c=1 sm=1 tr=0 cx=a_idp_d
 a=GorAHYkI+xOargNMzM6qxQ==:117 a=GorAHYkI+xOargNMzM6qxQ==:17
 a=kj9zAlcOel0A:10 a=y4yBn9ojGxQA:10 a=20KFwNOVAAAA:8 a=7-415B0cAAAA:8
 a=KKWFYgnz2FB2mNuqyY4A:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
Received-SPF: none client-ip=211.29.132.246; envelope-from=david@fromorbit.com;
 helo=mail104.syd.optusnet.com.au
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/23 17:59:18
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L5=2.5, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

On Fri, Aug 21, 2020 at 02:12:32PM +0200, Alberto Garcia wrote:
> On Fri 21 Aug 2020 01:42:52 PM CEST, Alberto Garcia wrote:
> > On Fri 21 Aug 2020 01:05:06 PM CEST, Brian Foster <bfoster@redhat.com> wrote:
> >>> > 1) off: for every write request QEMU initializes the cluster (64KB)
> >>> >         with fallocate(ZERO_RANGE) and then writes the 4KB of data.
> >>> > 
> >>> > 2) off w/o ZERO_RANGE: QEMU writes the 4KB of data and fills the rest
> >>> >         of the cluster with zeroes.
> >>> > 
> >>> > 3) metadata: all clusters were allocated when the image was created
> >>> >         but they are sparse, QEMU only writes the 4KB of data.
> >>> > 
> >>> > 4) falloc: all clusters were allocated with fallocate() when the image
> >>> >         was created, QEMU only writes 4KB of data.
> >>> > 
> >>> > 5) full: all clusters were allocated by writing zeroes to all of them
> >>> >         when the image was created, QEMU only writes 4KB of data.
> >>> > 
> >>> > As I said in a previous message I'm not familiar with xfs, but the
> >>> > parts that I don't understand are
> >>> > 
> >>> >    - Why is (4) slower than (1)?
> >>> 
> >>> Because fallocate() is a full IO serialisation barrier at the
> >>> filesystem level. If you do:
> >>> 
> >>> fallocate(whole file)
> >>> <IO>
> >>> <IO>
> >>> <IO>
> >>> .....
> >>> 
> >>> The IO can run concurrent and does not serialise against anything in
> >>> the filesysetm except unwritten extent conversions at IO completion
> >>> (see answer to next question!)
> >>> 
> >>> However, if you just use (4) you get:
> >>> 
> >>> falloc(64k)
> >>>   <wait for inflight IO to complete>
> >>>   <allocates 64k as unwritten>
> >>> <4k io>
> >>>   ....
> >>> falloc(64k)
> >>>   <wait for inflight IO to complete>
> >>>   ....
> >>>   <4k IO completes, converts 4k to written>
> >>>   <allocates 64k as unwritten>
> >>> <4k io>
> >>> falloc(64k)
> >>>   <wait for inflight IO to complete>
> >>>   ....
> >>>   <4k IO completes, converts 4k to written>
> >>>   <allocates 64k as unwritten>
> >>> <4k io>
> >>>   ....
> >>> 
> >>
> >> Option 4 is described above as initial file preallocation whereas
> >> option 1 is per 64k cluster prealloc. Prealloc mode mixup aside, Berto
> >> is reporting that the initial file preallocation mode is slower than
> >> the per cluster prealloc mode. Berto, am I following that right?
> 
> After looking more closely at the data I can see that there is a peak of
> ~30K IOPS during the first 5 or 6 seconds and then it suddenly drops to
> ~7K for the rest of the test.

How big is the filesystem, how big is the log? (xfs_info output,
please!)

In general, there are three typical causes of this. The first is
typical of the initial burst of allocations running on an empty
journal, then allocation transactions getting throttling back to the
speed at which metadata can be flushed once the journal fills up. If
you have a small filesystem and a default sized log, this is quite
likely to happen.

The second is that have large logs and you are running on hardware
where device cache flushes and FUA writes hammer overall device
performance. Hence when the CIL initially fills up and starts
flushing (journal writes are pre-flush + FUA so do both) device
performance goes way down because now it has to write it's cached
data to physical media rather than just cache it in volatile device
RAM. IOWs, journal writes end up forcing all volatile data to stable
media and so that can slow the device down. ALso, cache flushes
might not be queued commands, hence journal writes will also create IO
pipeline stalls...

The third is the hardware capability.  Consumer hardware is designed
to have extremely fast bursty behaviour, but then steady state
performance is much lower (think "SLC" burst caches in TLC SSDs). I
have isome consumer SSDs here that can sustain 400MB/s random 4kB
write for about 10-15s, then they drop to about 50MB/s once the
burst buffer is full. OTOH, I have enterprise SSDs that will sustain
a _much_ higher rate of random 4kB writes indefinitely than the
consumer SSDs burst at.  However, most consumer workloads don't move
this sort of data around, so this sort of design tradeoff is fine
for that market (Benchmarketing 101 stuff :).

IOWs, this behaviour could be filesystem config, it could be cache
flush behaviour, it could simply be storage device design
capability. Or it could be a combination of all three things.
Watching a set of fast sampling metrics that tell you what the
device and filesytem are doing in real time (e.g. I use PCP for this
and visualise ithe behaviour in real time via pmchart) gives a lot
of insight into exactly what is changing during transient workload
changes liek starting a benchmark...

> I was running fio with --ramp_time=5 which ignores the first 5 seconds
> of data in order to let performance settle, but if I remove that I can
> see the effect more clearly. I can observe it with raw files (in 'off'
> and 'prealloc' modes) and qcow2 files in 'prealloc' mode. With qcow2 and
> preallocation=off the performance is stable during the whole test.

What does "preallocation=off" mean again? Is that using
fallocate(ZERO_RANGE) prior to the data write rather than
preallocating the metadata/entire file? If so, I would expect the
limiting factor is the rate at which IO can be issued because of the
fallocate() triggered pipeline bubbles. That leaves idle device time
so you're not pushing the limits of the hardware and hence none of
the behaviours above will be evident...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

