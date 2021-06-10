Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF813A2D1E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:33:48 +0200 (CEST)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKod-0000ft-Iy
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrKnF-0007ZE-Oe
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrKnB-0003Ic-2O
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623331935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SpeW1c57s8SqIAh6p7iaG6ZK8LU5aoEQD8BLHhg16iU=;
 b=IuaPPy8bB81w0dbCmrsMkShVLEja+vnidCme+i18I4bPNlAi2kjB1Z8//VzAZ0BzfZ1+hY
 xcLebmoZxynpCtOIYVNYQD4Kz1gmxpBtidkYNrxiDouJQVGGeFKUJd0ZL4yTHAeZxgIRg+
 WloQUJ2KdUc+W7SpuIMlBVNH/MJShQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-XgBbLcgIPxWIiYkMpmlufA-1; Thu, 10 Jun 2021 09:32:10 -0400
X-MC-Unique: XgBbLcgIPxWIiYkMpmlufA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E80528015F8;
 Thu, 10 Jun 2021 13:32:08 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F0146091A;
 Thu, 10 Jun 2021 13:31:59 +0000 (UTC)
Date: Thu, 10 Jun 2021 08:31:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
Message-ID: <20210610133157.epmmsxlfs5bpflhj@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
 <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 02:52:10AM +0300, Nir Soffer wrote:
> > So, as a convenience, we can provide yet another metadata context,
> > "qemu:joint-allocation", which provides the bulk of the same
> > information already available from using "base:allocation" and
> > "qemu:allocation-depth" in parallel; the only difference is that an
> > allocation depth larger than one is collapsed to a single bit, rather
> > than remaining an integer representing actual depth.  By connecting to
> > just this context, a client has less work to perform while still
> > getting at all pieces of information needed to recreate a qcow2
> > backing chain.
> 
> Providing extended allocation is awsome, and makes client life much
> easier. But I'm not sure about the name, that comes from "joining"
> "base:allocation" and "qemu:allocation-depth". This is correct when
> thinking about qemu internals, but this is not really getting both, since
> "qemu:allocation-depth" is reduced to local and backing.
> 
> From a client point of view, I think this is best described as "qemu:allocation"
> which is an extension to NBD protocol, providing the same HOLE and ZERO
> bits, and qemu specific info LOCAL, BACKING. Using different "namespace"
> ("qemu" vs "base") makes it clear that this is not the same.
> 
> We discussed in the past the option to expose also the dirty status of every
> block in the response. Again this info is available using
> "qemu:dirty-bitmap:xxx"
> but just like allocation depth and base allocation, merging the results is hard
> and if we could expose also the dirty bit, this can make clients life
> even better.
> In this case I'm not sure "qemu:allocation" is the best name, maybe something
> more generic like "qemu:extents" or "qemu:block-status" is even better.

Yeah, I'm happy to bike-shed the name.

Note that dirty-bitmap tracking is harder to merge in: qemu supports
exposing more than one dirty bitmap context at once, but where each
context uses the same bit (bit 0, which overlaps with NBD_STATE_HOLE).
We'd have to decide whether we support merging only a single bitmap,
or whether a user can merge in up to 28 bitmaps (where the order in
which they specify dirty bitmaps as part of the
qemu:mega:bitmap1:bitmap2:... context name matters).

And if we decide that merging in even a single dirty bitmap is too
difficult, then clients already have to correlate a dirty bitmap with
everything else, at which point correlating 3 contexts (dirty bitmap
with base:allocation and qemu:allocation-depth) is no harder than
correlating 2 contexts (dirty bitmap with qemu:joint-allocation or
whatever we name it).

> 
> > With regards to exposing this new feature from qemu as NBD server, it
> > is sufficient to reuse the existing 'qemu-nbd -A': since that already
> > exposes allocation depth, it does not hurt to advertise two separate
> > qemu:XXX metadata contexts at once for two different views of
> > allocation depth.  And just because the server supports multiple
> > contexts does not mean a client will want or need to connect to
> > everything available.  On the other hand, the existing hack of using
> > the qemu NBD client option of x-dirty-bitmap to select an alternative
> > context from the client does NOT make it possible to read the extra
> > information exposed by the new metadata context.  For now, you MUST
> > use something like libnbd's 'nbdinfo --map=qemu:joint-allocation' in
> > order to properly see all four bits in action:
> 
> Makes sense.
> 
> >     # Create a qcow2 image with a raw backing file:
> >     $ qemu-img create base.raw $((4*64*1024))
> >     $ qemu-img create -f qcow2 -b base.raw -F raw top.qcow2
> >
> >     # Write to first 3 clusters of base:
> >     $ qemu-io -f raw -c "w -P 65 0 64k" -c "w -P 66 64k 64k" \
> >       -c "w -P 67 128k 64k" base.raw
> >
> >     # Write to second and third clusters of top, hiding base:
> >     $ qemu-io -f qcow2 -c "w -P 69 64k 64k" -c "w -z 128k 64k" top.qcow2
> 
> Looks familiar but nicer :-)

Yeah, I just compressed your example.

> 
> >     # Expose top.qcow2 without backing file over NBD
> >     $ ./qemu-nbd -r -t -f qcow2 -A 'json:{"driver":"qcow2", "backing":null, \
> >       "file":{"driver":"file", "filename":"top.qcow2"}}'
> >     $ nbdinfo --map=qemu:joint-allocation nbd://localhost
> >          0       65536    3
> >      65536       65536    4
> >     131072       65536    7
> >     196608       65536    3
> 
> Using the libnbd patch this shows:
> 
> $ ./nbdinfo --map="qemu:joint-allocation" nbd://localhost
>          0       65536    3  hole,zero,unallocated
>      65536       65536    4  allocated,local
>     131072       65536    7  hole,zero,local
>     196608       65536    3  hole,zero,unallocated
> 
> Looks good.
> 
> We need to convert this output to:
> 
>     {"start": 0, "length": 65536, "zero": true, "hole": true},
>     {"start": 65536, "length": 65536, "zero": false, "hole": false},
>     {"start": 131072, "length": 65536, "zero": true, "hole": false},
>     {"start": 196608, "length": 65536, "zero": true, "hole": true},
> 
> So it seems that we need to use this logic for holes when we inspect a
> single qcow2 image:
> 
>     hole = not (flags & NBD_STATE_LOCAL)
> 
> And ignore the NBD_STATE_HOLE, which is about qcow2 internals.

Correct.  If all you care about is which portions of the image defer
to the backing chain, NBD_STATE_LOCAL is sufficient.  Looking at
NBD_STATE_HOLE merely tells you which portions of the qcow2 file have
not been pre-allocated, but that has no bearing on whether those
clusters defer to the backing chain.

> 
> This patch fixes the critical issue for oVirt, but in a way it returns
> the previous
> state when you could not report holes in raw images. With this patch holes
> in raw image looks like:
> 
>     $ truncate -s 1g empty.raw
>     $  ./qemu-nbd -r -t -f raw empty.raw --allocation-depth
>     $ ./nbdinfo --map="qemu:joint-allocation" nbd://localhost
>          0  1073741824    7  hole,zero,local
> 
> This is not a practical issue for oVirt, but it would be better to report:
> 
>     $ ./nbdinfo --map="qemu:joint-allocation" nbd://localhost
>          0  1073741824    3  hole,zero,unallocated
> 
> This is the output for the empty qcow2 image.

Unfortunately, that is not how qemu tracks things.  Raw files have no
backing file, and therefore 100% of the file reports as
BDRV_BLOCK_ALLOCATED (which really means the raw file is responsible
for 100% of the guest-visible content, and has no bearing to how much
filesystem space is allocated in the host).  Both a completely sparse
and a completely allocated raw file will have the same result of
showing the entire file as 'local'.  Reporting 'hole,zero,unallocated'
would be a lie - it would be claiming that 100% of the raw file defers
to the backing chain but that in turn the backing chain has not been
allocated.  In reality, when bits 2+3 report as 0 (neither
NBD_STATE_LOCAL nor NDD_STATE_BACKING was set), qemu is reporting that
the cluster defaults to reading as zero because we exhausted the
entire backing chain without finding any layer willing to provide
those contents.  Maybe "unallocated" isn't the best term, and I should
use "absent" instead?  That way, we don't perpetuate the confusion of
HOLE (which is about host storage allocation) with backing chain
presence (where a particular layer in a backing chain provides or
defers data regardless of host allocation).

> 
> And this also affects --allocation-depth, for raw empty image we get:
> 
>     $ ./nbdinfo --map="qemu:allocation-depth" nbd://localhost
>          0  1073741824    1  local
> 
> But for empty qcow2 we get:
> 
>     $ ./nbdinfo --map="qemu:allocation-depth" nbd://localhost
>          0  1073741824    0  unallocated

Again, that's what qemu already uses.  A raw file has no backing file,
so the entire guest contents come from the current layer in the
backing chain (there are no deeper layers to look at).  An empty qcow2
file (whether or not a backing file is specified) _does_ defer all
clusters to whatever the backing chain would supply.  Maybe the name
"qemu:allocation-depth" is a misnomer, and we should have called it
"qemu:backing-depth", but since that was chosen in 5.2, it's harder to
change now.

> 
> I think we have a bug reporting
> BDRV_BLOCK_ALLOCATED when the BDRV_BLOCK_DATA bit is not set.

No, that's not a bug, but intentional behavior, and changing it would
break how qemu-img convert and friends operate.

> > +For NBD_OPT_LIST_META_CONTEXT the following queries are supported in
> > +addition to the specific "qemu:allocation-depth",
> > +"qemu:joint-allocation", and
> >  "qemu:dirty-bitmap:<dirty-bitmap-export-name>":
> 
> Sending NBD_OPT_LIST_META_CONTEXT with "qemu:joint-allocation"
> should tell if the feature is available, right?
> 
> If we don't find it we will fallback to "base:allocation".

Correct - the shortest sequence would be first sending
NBD_OPT_SET_META_CONTEXT with _just_ "qemu:joint-allocation".  If the
server answers with a context id, you're set; if it answers with an
error, the server doesn't support contexts at all so there's no point
trying anything else (your fallbacks would also fail).  If it answers
with 0 contexts, then the context id was unrecognized (you are not
talking to a version of qemu that recognizes it), so your fallback
would then be a second NBD_OPT_SET_META_CONTEXT, this time with both
"base:allocation" and "qemu:allocation-depth", and see if you get 1 or
2 ids back.  (If you can assume that all qemu versions in your
downstream ecosystem have been patched such that qemu:joint-allocation
is always present if base:allocation does not have 5.2 semantics, then
you can simplify the fallback to using just "base:allocation", but
that's only safe in a curated downstream ecosystem.)

> >  * "qemu:" - returns list of all available metadata contexts in the
> > @@ -68,3 +92,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
> >  * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
> >  NBD_CMD_FLAG_FAST_ZERO
> >  * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
> > +* 6.1: NBD_CMD_BLOCK_STATUS for "qemu:joint-allocation"
> > diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> > index ee862fa0bc02..975ef5cedd14 100644
> > --- a/docs/tools/qemu-nbd.rst
> > +++ b/docs/tools/qemu-nbd.rst
> > @@ -75,8 +75,8 @@ driver options if ``--image-opts`` is specified.
> >  .. option:: -A, --allocation-depth
> >
> >    Expose allocation depth information via the
> > -  ``qemu:allocation-depth`` metadata context accessible through
> > -  NBD_OPT_SET_META_CONTEXT.
> > +  ``qemu:allocation-depth`` and ``qemu:joint-allocation`` metadata
> > +  contexts accessible through NBD_OPT_SET_META_CONTEXT.
> >
> >  .. option:: -B, --bitmap=NAME
> 
> It would be awesome if this would enable NBD_STATE_DIRTY bit
> in the response, in he same way that -A enables NBD_STATE_LOCAL/BACKING

But remember that qemu can expose more than one dirty bitmap at a
time, so then we start having to further complicate things by
determining _which_ bit in the combined context would represent
_which_ dirty bitmap.  Merging things that only depend on
bdrv_block_status() was easy, but merging multiple bitmaps starts to
make the qemu implementation complicated enough that I'm leaning
towards requiring the client to do the cross-context correlation
rather than burdening the server with the task.

> > +static int blockjoint_to_extents(BlockDriverState *bs, uint64_t offset,
> > +                                 uint64_t bytes, NBDExtentArray *ea)
> > +{
> > +    while (bytes) {
> > +        uint32_t flags = 0;
> > +        int64_t num, num1, num2;
> > +        int ret1 = bdrv_block_status_above(bs, NULL, offset, bytes, &num1,
> > +                                           NULL, NULL);
> > +        int ret2 = bdrv_is_allocated_above(bs, NULL, false, offset, bytes,
> > +                                           &num2);
> 
> Do we really need to make 2 calls?

Both calls boil down to bdrv_block_status at some point, so you are
right that figuring out how to get the information consolidated in 1
call would be more efficient.

> 
> I tried this quick hack on top of your patch:
> 
> diff --git a/block/io.c b/block/io.c
> index 1a05f320d3..aaf01c9119 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -2656,6 +2656,15 @@ int bdrv_block_status_above(BlockDriverState
> *bs, BlockDriverState *base,
>                                            pnum, map, file, NULL);
>  }
> 
> +int bdrv_block_status_above_depth(BlockDriverState *bs, BlockDriverState *base,
> +                                 int64_t offset, int64_t bytes, int64_t *pnum,
> +                                 int64_t *map, BlockDriverState **file,
> +                                 int *depth)
> +{
> +    return bdrv_common_block_status_above(bs, base, false, true, offset, bytes,
> +                                          pnum, map, file, depth);
> +}
> +

Indeed, adding yet another wrapper around the core functionality of
bdrv_block_status to get what we want in one call is a nice idea.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


