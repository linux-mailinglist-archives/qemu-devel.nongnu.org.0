Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2013A0105
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 20:49:28 +0200 (CEST)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqgn1-0005mk-2X
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 14:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqgjr-0003eU-29
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqgjl-0008IQ-NC
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623177964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cmfjnaCk0F9DgmBqH2l7sWU9fKaF9iWJnK0E84odws4=;
 b=HrY8GnMU3ICPsGK0G+4ATIjg1ZjdHxqRoXQf6j89KAWdNplomauGinnhBpq2bXIc73vJfg
 sWs9mIqLxs4koTxG9HiN0OfOrVrtgDf8lBGmEe0CGtzgDRYBhk2uRQoQIHMZ/tIA07vt2k
 v0RSmcTNDyUMcGGh5Mjs65LNvut5LlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-ooSEOM4QNgSHi87c0hoT_A-1; Tue, 08 Jun 2021 14:46:00 -0400
X-MC-Unique: ooSEOM4QNgSHi87c0hoT_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F973805759;
 Tue,  8 Jun 2021 18:45:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B4C7608BA;
 Tue,  8 Jun 2021 18:45:22 +0000 (UTC)
Date: Tue, 8 Jun 2021 13:45:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Message-ID: <20210608184517.vozskgu4a2c5fusj@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 07:38:10PM +0300, Nir Soffer wrote:
> On Tue, Jun 8, 2021 at 12:22 AM Eric Blake <eblake@redhat.com> wrote:
> >
> > On Mon, Jun 07, 2021 at 11:22:04PM +0300, Nir Soffer wrote:
> > > When zeroing a cluster in an image with backing file, qemu-img and
> > > qemu-nbd reported the area as a hole. This does not affect the guest
> > > since the area is read as zero, but breaks code trying to reconstruct
> > > the image chain based on qemu-img map or qemu-nbd block status response.
> >
> > Trying to reconstruct the image chain based on qemu-nbd block status
> > should not be attempted on just base:allocation data, but should also
> > take into account qemu:allocation-depth.
> 
> This is correct when looking at the entire chain, but when we reconstruct
> image data, we copy each image in the layer *without* the backing chain.
> 
> The example I provided was not detailed enough, what we actually do is:
> 
>     qemu-nbd .. 'json:{"driver": "qcow2", "backing": null, "file":
> {"driver": "file", "filename": "top.qcow2"}}'
> 
> So there is no backing chain and allocation depth is not relevant.
> - Allocated areas should be reported with flags 0
> - Zero areas which are not holes should be reported as NBD_STATE_ZERO
> - Zero areas which are holes (not allocated in this image) should be
> reported as NBD_STATE_HOLE

Again, what you WANT is qemu:allocation-depth.

$ ./qemu-nbd -r -t -f qcow2 -A 'json:{"driver":"qcow2", "backing":null, \
  "file":{"driver":"file", "filename":"top.qcow2"}}'
$ nbdinfo --map=qemu:allocation-depth nbd://localhost
         0       65536    0  unallocated
     65536      131072    1  local
    196608       65536    0  unallocated

$ nbdinfo --map nbd://localhost
         0       65536    3  hole,zero
     65536       65536    0  allocated
    131072      131072    3  hole,zero

You don't care whether the information reads as zero or not, but
whether top.qcow2 is responsible for the data at that cluster.
base:allocation does not answer that question.  But
qemu:allocation-depth answers it perfectly.

> 
> > From the perspective of the
> > core NBD protocol, there is no backing file, so trying to guess what
> > the backing file contains without using qemu extensions is unlikely to
> > be correct, as shown in your example.  The fact that you could abuse
> > it with qemu 5.2 but it broke in 6.0
> 
> I'm not abusing anything, I'm only using public APIs. qemu-nbd behavior
> should not change without good reason, and we did not have any good
> reason to change the behavior for qcow2 images.

Ah, but we did.  Exposing BDRV_BLOCK_ALLOCATED as server, but
consuming it as BDRV_BLOCK_DATA as client, was inconsistent.  It was a
bug that we ever used BLOCK_ALLOCATED in the first place, when it has
_always_ been that the NBD semantics were supposed to be modeled on
our definition of BLOCK_DATA.  That it took us a couple of years to
notice our bug is unfortunate, but we DO have a good reason for the
change - we were fixing an actual bug where we were reporting
incorrect information compared to what the NBD spec was documenting.

> 
> >  is not necessarily the sign of a
> > regression in 6.0, but rather could be evidence that you have been
> > trying to use an undocumented implementation quirk rather than a
> > stable interface.
> 
> I'm pretty convinced that this is a regression in qemu-nbd 6.0 since I created
> this regression :-)

I understand that you were surprised by the ramifications of your
patch causing more changes than what you expected, but I still argue
that your patch was correct and that the decision to incorporate it
was intentional because it was the right thing to do.  Papering over
the fallout for the sake of clients that should be using
qemu:allocation-depth instead does not seem like it is worth the
maintenance nightmare to me.

> 
> Since we started using qemu-nbd in 2018, qemu-nbd has always reported
> holes in qcow2 images, but not in raw files. We discussed this several times,
> and you explained that we have allocation information from qcow2, but not
> from raw format.
> 
> My attempt to fix hole reporting in raw images has failed; reporting holes in
> raw images is nice to have, but it broke the behavior of qemu-nbd with qcow2
> images, which is a critical issue for ovirt.

Rather, ovirt had been relying on buggy behavior, and now that the bug
has been fixed, we are scrambling to figure out how to make ovirt
still play nicely.  But my answer to that is to use
qemu:allocation-depth.  It was introduced in 5.2, so it predates the
point where base:allocation behavior was fixed, and it provides the
answer to the question you are really asking (which parts of my image
came from the image directly, rather than a backing file), rather than
merely an indirect answer (how can I abuse the determination of which
parts of the image are allocated or sparse to imply that those same
portions must come from a backing image).  There is nothing
semantically wrong with a sparse cluster in the top layer overriding a
non-sparse cluster from the backing file.

> 
> The code using this was tested and released 3-4 month ago. This was added
> to support backup vendors using snapshot based backup, so they can move
> to use the NBD based pipeline, which is safer than the old way, uploading
> qcow2 images directly to storage.

Downstream can play games with backporting or reverting patches as
needed to make the entire ecosystem play nicely, but upstream, I don't
think it is right to take a patch that re-introduces a bug in
base:allocation merely because a client was unwilling to use the
correct interface of qemu:allocation-depth to get the answer to the
question they really meant to ask.

> 
> If I revert:
> 
> commit 0da9856851dcca09222a1467e16ddd05dc66e460
> Author: Nir Soffer <nirsof@gmail.com>
> Date:   Fri Feb 19 18:07:52 2021 +0200
> 
>     nbd: server: Report holes for raw images
> 
> qemu-nbd reports zeroed areas in a useful way like it always did:
> 
> $ ./qemu-nbd -r -t 'json:{"driver": "qcow2", "backing": null, "file":
> {"driver": "file", "filename": "top.qcow2"}}' &
> 
> $ nbdinfo --map nbd://localhost
>          0       65536    3  hole,zero
>      65536       65536    0  allocated
>     131072       65536    2  zero
>     196608       65536    3  hole,zero
> 
> There is no need to use allocation depth info, the base:allocation works fine
> for this use case, and the output makes sense.

But you have to remember that the NBD specification for
base:allocation is that flags are OPTIONAL at all times.  You are at
the mercy of the server for which flags it sets; it is ALWAYS valid
for a server to reply with status 0 for any cluster; any server is
free to return 0 in the future where it returned 1 today (perhaps
because the server changed its mind on how expensive it was to compute
when it is safe to set the bit to 1), or to return 1 in the future
where it returned 0 today (perhaps because the server gained insight
into how to quickly report something that happens to be true about
that cluster).  Basing decisions on what was returned as a 1 bit in
NBD_CMD_BLOCK_STATUS is okay if those decisions are solely for an
optimization purpose (because we KNOW this portion of this disk will
read as zero, we don't have to read it), but wrong if they are for an
accuracy purpose (assuming that only clusters where hole is clear is a
1:1 correspondence to which clusters override a backing image).  And
this is a case where qcow2 happens to quickly know that a sparse zero
cluster exists, so reporting hole,zero IS more accurate than mere
zero.  The fact that we failed to omit hole in the past was not a
violation of the NBD spec, but rather a bug in our code for looking at
the wrong bit of information.  But the mere presence of the hole bit
is NOT sufficient knowledge to know that the NBD server is serving a
qcow2 image that has a non-allocated zero cluster overriding the
backing image, because we can't even guarantee the server is visiting
a qcow2 file.

> > ...but since NBD has no notion of a backing file, there is nothing
> > that qemu can do to report depth information itself.  If you want to
> > reconstruct the backing chain, you should be able to further query
> > qemu:allocation-depth, and piece the two queries together to get what
> > you need:
> >
> > $ ./qemu-nbd -r -t -f qcow2 top.qcow2 -A
> 
> What suggest is:
> 
> 1. Get base:allocation - where the cluster is wrongly reported a hole

The report is not wrong.  That portion of the qcow2 file IS a hole, in
that it is not pre-allocated and therefore has no on-disk storage
reserved.  It will still read as all-zeroes rather than deferring to
the backing image, but calling it a hole is not wrong.

> 2. Get also qemu:allocation-depath
> 3. Merge both lists of extents, splitting and extending extents as needed
>    since there is no guarantee that we get same lists describing same extents
> 4. Finally get correct base:allocation showing the zero range is not a hole
> 
> This is a lot of unneeded and complicated work to cover a bug in qemu,
> and it should be done in all clients. I don't find this an attractive solution.

Unfortunately, it is the only viable long-term solution.  I would love
to make libnbd handle the reconstruction of a unified view of multiple
NBD metadata contexts in an easier manner, so that upper-layer
applications could simply use libnbd to get at that work without
having to repeat the coding of reconstructing things themselves.  But
I don't see any way around the fact that from a correctness
perspective, this really IS the only way to get at the information you
need (not only a knowledge of which portions of the disk are holes,
but also which portions of the disk override a backing image).

> 
> > > cluster is merged with forth cluster which is actually a hole.
> > >
> > > This is incorrect since if it was a hole, the third cluster would be
> > > exposed to the guest. Programs using qemu-nbd output to reconstruct the
> > > image chain on other storage would be confused and copy only the first 2
> > > cluster. The results of this copy will be an image exposing the third
> > > cluster from the base image, corrupting the guest data.
> >
> > This is where I disagree - if the NBD protocol exposed the notion of a
> > backing file, then reporting a local hole should indeed imply reading
> > from the backing file.  But since base NBD protocol does NOT support
> > backing images of any sort, you cannot make any assumptions about what
> > base:allocation says about holes, other than that the image presented
> > over NBD was not fully allocated in some manner at that location.  You
> > instead need to fix your tooling to query qemu:allocation-depth if you
> > are trying to reconstruct all state known by qemu.
> 
> When we look at the entire chain, you are correct, but when we disable
> the backing file and have no backing chain, NBD protocol hole bit is
> the right way to describe an unallocated area in a qcow2 image.

Your problem is that qcow2 images have two ways to represent a zero
cluster.  One is a pre-allocated cluster (there is host storage
reserved; the host storage might or might not read as zero, but the
qcow2 code will return zero, regardless of whether there is a backing
file); the other is an unallocated cluster (there is no host storage
reserved, but the qcow2 code still reads zero regardless of whether
there is a backing file).  One of those is allocated, the other is
sparse.  And NBD_STATE_HOLE is a great fit for telling those two types
of clusters apart.

In short, qemu has 3 bits of interesting information per cluster:
whether it reads as zero, whether it has allocated space, and whether
it overrides a backing file.  The NBD protocol base:allocation only
provides two of those bits of information (BDRV_BLOCK_DATA and
BDRV_BLOCK_ZERO); to get at the third (BDRV_BLOCK_ALLOCATED), you HAVE
to use a qemu-specific extension.

That said, we CAN provide a _new_ qemu:block-status metacontext, which
returns a bitmap of bit 0 (NBD_STATE_HOLE), bit 1 (NBD_STATE_ZERO),
and bit 2 (BDRV_BLOCK_ALLOCATED) all from a single context, at which
point you don't have to reconstruct the combination of base:allocation
(two bits) and qemu:allocation-depth (an arbitrary integer) across
possibly differing reporting lengths yourself.

I'll post a counter-proposal patch along those lines, shortly.

> 
> > > I found that it can be fixed using BDRV_BLOCK_OFFSET_VALID when
> > > reporting the status of the extent. When we have a valid offset, we
> > > report based on BDRV_BLOCK_DATA. Otherwise we report based on
> > > BDRV_BLOCK_ALLOCATED.
> >
> > That sounds hairy.  As an initial reaction, I'm not sure I like it.
> >
> > >
> > > With this fix we get:
> > >
> > >     $ build/qemu-img map --output json top.qcow2
> > >     [{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": true, "offset": 0},
> > >     { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
> > >     { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": true},
> >
> > Earlier, this line was "data":false, which made sense - there was no
> > offset in either top.qcow2 nor in raw.base at which you could mmap to
> > read the actual zeroes that were implied by the unallocated zero
> > cluster.  Your change here is reporting "data":true to state that the
> > zeroes explicitly come from the "depth":0 layer, although it is a bit
> > misleading because we did not actually allocate clusters in top.qcow2
> > for reading the zeroes.  In reality, this really IS an instance of a
> > qcow2 unallocated cluster, where "data":false fits better for the
> > definitions in include/block/block.h.
> 
> Well, this cluster is not a hole. How do you describe "not a hole" in
> qemu-img map?

Ah, but the cluster _is_ a hole.  There is no storage space occupied
in the qcow2 file corresponding to that slice of the file.  So from
the qcow2's perspective, that region of guest-visible address space
comes from a hole, where the guest writing to it will require an
allocation of additional host storage space.

"not a hole" in qcow2 corresponds to any pre-allocated cluster, and
shows up in qemu-img map as "data":true.

> data=true seem that be the only way.
> 
> But again we can leave qemu-img map as is since we have the depth argument.

And since the depth parameter answered your question with direct
qcow2, it should also answer your question over NBD with
qemu:allocation-depth.  In other words, you are using 3 bits of
information to reconstruct your qcow2 file, so you need to ask for all
3 pieces of information over NBD.

> 
> > >     { "start": 196608, "length": 65536, "depth": 1, "zero": true, "data": false, "offset": 196608}]
> > >
> > >     $ build/qemu-nbd -r -t -f qcow2 top.qcow2 &
> > >     $ qemu-img map --output json nbd://localhost
> > >     [{ "start": 0, "length": 131072, "depth": 0, "zero": false, "data": true, "offset": 0},
> > >     { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": true, "offset": 131072},
> > >     { "start": 196608, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": 196608}]
> >
> > Meanwhile, this output is indeed arguably more precise, although it
> > differs from the qcow2 output in that you provide an offset for
> > cluster 2.
> 
> I guess qemu-img have less information when using qemu-nbd, the image
> is presented as
> a raw image.
> 
...
> > > -        flags = (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE) |
> > > -                (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
> > > +        flags = (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
> > > +
> > > +        if (ret & BDRV_BLOCK_OFFSET_VALID)
> > > +            flags |= (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE);
> > > +        else
> > > +            flags |= (ret & BDRV_BLOCK_ALLOCATED ? 0 : NBD_STATE_HOLE);
> >
> > This will fall apart on compressed or encrypted images, where data is
> > allocated but offset_valid is false.
> 
> So this is not the right way to trigger the use of BDRV_BLOCK_DATA.

The intent, all along, was that NBD's STATE_HOLE was identical in
semantics to !BDRV_BLOCK_DATA (the inverted value was chosen because
having a default of all 0s as the safe point was easier to document in
the NBD spec).  Vladimir and I had a bug when first implementing that
intent, but your patch fixed that bug.  Unfortunately, as you have
pointed out, that fix has now exposed clients that were abusing the
bug to infer information about an NBD server that was not actually
viable to be inferred (whether a portion of an image is a hole is NOT
a reliable indicator of whether that portion of the image overrides a
backing file, but it wasn't until we started accurately reporting
HOLEs in more contexts that it actually tripped you up).

> 
> > >          if (nbd_extent_array_add(ea, num, flags) < 0) {
> > >              return 0;
> > > diff --git a/qemu-img.c b/qemu-img.c
> > > index a5993682aa..6808e12d87 100644
> > > --- a/qemu-img.c
> > > +++ b/qemu-img.c
> > > @@ -3039,7 +3039,9 @@ static int get_block_status(BlockDriverState *bs, int64_t offset,
> > >      *e = (MapEntry) {
> > >          .start = offset,
> > >          .length = bytes,
> > > -        .data = !!(ret & BDRV_BLOCK_DATA),
> > > +        .data = !!(has_offset
> > > +            ? ret & BDRV_BLOCK_DATA
> > > +            : ret & BDRV_BLOCK_ALLOCATED),
> >
> > I'm really not sure about this.  You are not only changing what
> > qemu-nbd advertises as a server, but also what qemu-img interprets as
> > a client.  Are you sure this will still work when you mix-and-match
> > old server + new client, or new server + old client?
> 
> I did not test these combinations, but let's simplify by removing this change
> for now.
> 
> > >          .zero = !!(ret & BDRV_BLOCK_ZERO),
> > >          .offset = map,
> > >          .has_offset = has_offset,
> > > --
> > > 2.26.3
> > >
> 
> Since the original change introduced a regression breaking existing users, we
> don't have good enough tests in this area, and is not clear how this
> can be fixed
> properly, I suggest to revert the original change for 6.0. Then we have time to
> work on a proper fix upstream.

6.0 is already released upstream, so you are stuck with that new
behavior.  And I think it is worse to ping-pong the behavior back to
the way it was in 5.2 for 6.1, than to just keep the 6.0 behavior
(which fixed a bug) unchanged going forward into 6.1 upstream.

Downstream, we can backport and/or revert whatever patches we want to
make the downstream ecosystem play nicely.  But that is an argument
for downstream.

> 
> What do you think?

I'll go ahead and work up my counter-proposal patch to add yet another
qemu:... context to make it easier for you to get combined status in
one go.  I don't know whether it will be attractive enough to be worth
incorporating upstream, but if it is, that is certainly another option
that downstream can use, because it is easier to backport a new qemu:
context than it is to play games with "which behavior will
base:allocation have" - you are guaranteed that if qemu knows how to
advertise the new context, it provides the information you want.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


