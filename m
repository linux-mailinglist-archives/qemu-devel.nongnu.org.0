Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700FC24D5A4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 15:01:34 +0200 (CEST)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k96fl-00049Y-Fd
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 09:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bfoster@redhat.com>)
 id 1k96ei-0003Zg-EK
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 09:00:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29942
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bfoster@redhat.com>)
 id 1k96ef-0004hL-Ji
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 09:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598014823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+LQ8GTLmp2P5ctZzLR7WCdxL3glFXWbr1uNxQsx5Svs=;
 b=a+l70nWJdaORKsosw8Yt9hNrN8rlvrNAD+BDPZqV9rcKZWzXaMRccQVsUucqNT2qPRYt3A
 3qsdhAndx/33N9eiwjYBGXbpKs2wtgNKKafnDFD4yiD//qBrpo9vFj6vXrJInvIxR4fGrg
 sXh4+jFxuGbdw1VNkF+ShhjXSN9mFEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-cHYLhd90Ne227NVuRmo9Ng-1; Fri, 21 Aug 2020 09:00:19 -0400
X-MC-Unique: cHYLhd90Ne227NVuRmo9Ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B43301008228;
 Fri, 21 Aug 2020 12:59:46 +0000 (UTC)
Received: from bfoster (ovpn-112-11.rdu2.redhat.com [10.10.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB2E119D6C;
 Fri, 21 Aug 2020 12:59:45 +0000 (UTC)
Date: Fri, 21 Aug 2020 08:59:44 -0400
From: Brian Foster <bfoster@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH 0/1] qcow2: Skip copy-on-write when allocating a zero
 cluster
Message-ID: <20200821125944.GC212879@bfoster>
References: <20200817101019.GD11402@linux.fritz.box>
 <w518sedz3td.fsf@maestria.local.igalia.com>
 <20200817155307.GS11402@linux.fritz.box>
 <w51pn7memr7.fsf@maestria.local.igalia.com>
 <20200819150711.GE10272@linux.fritz.box>
 <20200819175300.GA141399@bfoster>
 <w51v9hdultt.fsf@maestria.local.igalia.com>
 <20200820215811.GC7941@dread.disaster.area>
 <20200821110506.GB212879@bfoster>
 <w51364gjkcj.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w51364gjkcj.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=205.139.110.120; envelope-from=bfoster@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Dave Chinner <david@fromorbit.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, linux-xfs@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 21, 2020 at 01:42:52PM +0200, Alberto Garcia wrote:
> On Fri 21 Aug 2020 01:05:06 PM CEST, Brian Foster <bfoster@redhat.com> wrote:
> >> > 1) off: for every write request QEMU initializes the cluster (64KB)
> >> >         with fallocate(ZERO_RANGE) and then writes the 4KB of data.
> >> > 
> >> > 2) off w/o ZERO_RANGE: QEMU writes the 4KB of data and fills the rest
> >> >         of the cluster with zeroes.
> >> > 
> >> > 3) metadata: all clusters were allocated when the image was created
> >> >         but they are sparse, QEMU only writes the 4KB of data.
> >> > 
> >> > 4) falloc: all clusters were allocated with fallocate() when the image
> >> >         was created, QEMU only writes 4KB of data.
> >> > 
> >> > 5) full: all clusters were allocated by writing zeroes to all of them
> >> >         when the image was created, QEMU only writes 4KB of data.
> >> > 
> >> > As I said in a previous message I'm not familiar with xfs, but the
> >> > parts that I don't understand are
> >> > 
> >> >    - Why is (4) slower than (1)?
> >> 
> >> Because fallocate() is a full IO serialisation barrier at the
> >> filesystem level. If you do:
> >> 
> >> fallocate(whole file)
> >> <IO>
> >> <IO>
> >> <IO>
> >> .....
> >> 
> >> The IO can run concurrent and does not serialise against anything in
> >> the filesysetm except unwritten extent conversions at IO completion
> >> (see answer to next question!)
> >> 
> >> However, if you just use (4) you get:
> >> 
> >> falloc(64k)
> >>   <wait for inflight IO to complete>
> >>   <allocates 64k as unwritten>
> >> <4k io>
> >>   ....
> >> falloc(64k)
> >>   <wait for inflight IO to complete>
> >>   ....
> >>   <4k IO completes, converts 4k to written>
> >>   <allocates 64k as unwritten>
> >> <4k io>
> >> falloc(64k)
> >>   <wait for inflight IO to complete>
> >>   ....
> >>   <4k IO completes, converts 4k to written>
> >>   <allocates 64k as unwritten>
> >> <4k io>
> >>   ....
> >> 
> >
> > Option 4 is described above as initial file preallocation whereas
> > option 1 is per 64k cluster prealloc. Prealloc mode mixup aside, Berto
> > is reporting that the initial file preallocation mode is slower than
> > the per cluster prealloc mode. Berto, am I following that right?
> 
> Option (1) means that no qcow2 cluster is allocated at the beginning of
> the test so, apart from updating the relevant qcow2 metadata, each write
> request clears the cluster first (with fallocate(ZERO_RANGE)) then
> writes the requested 4KB of data. Further writes to the same cluster
> don't need changes on the qcow2 metadata so they go directly to the area
> that was cleared with fallocate().
> 
> Option (4) means that all clusters are allocated when the image is
> created and they are initialized with fallocate() (actually with
> posix_fallocate() now that I read the code, I suppose it's the same for
> xfs?). Only after that the test starts. All write requests are simply
> forwarded to the disk, there is no need to touch any qcow2 metadata nor
> do anything else.
> 

Ok, I think that's consistent with what I described above (sorry, I find
the preallocation mode names rather confusing so I was trying to avoid
using them). Have you confirmed that posix_fallocate() in this case
translates directly to fallocate()? I suppose that's most likely the
case, otherwise you'd see numbers more like with preallocation=full
(file preallocated via writing zeroes).

> And yes, (4) is a bit slower than (1) in my tests. On ext4 I get 10%
> more IOPS.
> 
> I just ran the tests with aio=native and with a raw image instead of
> qcow2, here are the results:
> 
> qcow2:
> |----------------------+-------------+------------|
> | preallocation        | aio=threads | aio=native |
> |----------------------+-------------+------------|
> | off                  |        8139 |       7649 |
> | off (w/o ZERO_RANGE) |        2965 |       2779 |
> | metadata             |        7768 |       8265 |
> | falloc               |        7742 |       7956 |
> | full                 |       41389 |      56668 |
> |----------------------+-------------+------------|
> 

So this seems like Dave's suggestion to use native aio produced more
predictable results with full file prealloc being a bit faster than per
cluster prealloc. Not sure why that isn't the case with aio=threads. I
was wondering if perhaps the threading affects something indirectly like
the qcow2 metadata allocation itself, but I guess that would be
inconsistent with ext4 showing a notable jump from (1) to (4) (assuming
the previous ext4 numbers were with aio=threads).

> raw:
> |---------------+-------------+------------|
> | preallocation | aio=threads | aio=native |
> |---------------+-------------+------------|
> | off           |        7647 |       7928 |
> | falloc        |        7662 |       7856 |
> | full          |       45224 |      58627 |
> |---------------+-------------+------------|
> 
> A qcow2 file with preallocation=metadata is more or less similar to a
> sparse raw file (and the numbers are indeed similar).
> 
> preallocation=off on qcow2 does not have an equivalent on raw files.
> 

It sounds like preallocation=off for qcow2 would be roughly equivalent
to a raw file with a 64k extent size hint (on XFS).

Brian

> Berto
> 


