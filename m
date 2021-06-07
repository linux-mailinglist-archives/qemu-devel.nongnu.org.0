Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3FC39E919
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 23:23:33 +0200 (CEST)
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqMia-00021t-69
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 17:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqMhf-00016x-EB
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:22:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqMhc-0000ZU-A1
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623100951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yOlymZxifUJQFyOkD1mP4Lw40LmrDvJfltl/AWyNFlo=;
 b=FIM5RL1b2Xn17EXo/2ZIxpZpV+Eyekz/4YjogYF9Ha8a9PKe9kj0TjwJBOpzCCVOoPB6dh
 HY23FMGCOOq2/YSMYFU9+RX0HD4Zxx3/3awyh6dyJ3dYPpZ8kMVYM2freWfd4GFVaeS6qv
 Pge7XDUEyxrngzRGrzOW+HEvvetxXpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-_l1Bj9V8OMmMhCDaRM87yQ-1; Mon, 07 Jun 2021 17:22:28 -0400
X-MC-Unique: _l1Bj9V8OMmMhCDaRM87yQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5355281843F;
 Mon,  7 Jun 2021 21:22:27 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9F536060F;
 Mon,  7 Jun 2021 21:22:26 +0000 (UTC)
Date: Mon, 7 Jun 2021 16:22:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nirsof@gmail.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Message-ID: <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607202204.1805199-1-nsoffer@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 11:22:04PM +0300, Nir Soffer wrote:
> When zeroing a cluster in an image with backing file, qemu-img and
> qemu-nbd reported the area as a hole. This does not affect the guest
> since the area is read as zero, but breaks code trying to reconstruct
> the image chain based on qemu-img map or qemu-nbd block status response.

Trying to reconstruct the image chain based on qemu-nbd block status
should not be attempted on just base:allocation data, but should also
take into account qemu:allocation-depth.  From the perspective of the
core NBD protocol, there is no backing file, so trying to guess what
the backing file contains without using qemu extensions is unlikely to
be correct, as shown in your example.  The fact that you could abuse
it with qemu 5.2 but it broke in 6.0 is not necessarily the sign of a
regression in 6.0, but rather could be evidence that you have been
trying to use an undocumented implementation quirk rather than a
stable interface.

> 
> Here is simpler reproducer:
> 
>     # Create a qcow2 image with a raw backing file:
>     $ qemu-img create base.raw $((4*64*1024))
>     $ qemu-img create -f qcow2 -b base.raw -F raw top.qcow2
> 
>     # Write to first 3 clusters of base:
>     $ qemu-io -f raw -c "write -P 65 0 64k" base.raw
>     $ qemu-io -f raw -c "write -P 66 64k 64k" base.raw
>     $ qemu-io -f raw -c "write -P 67 128k 64k" base.raw
> 
>     # Write to second cluster of top, hiding second cluster of base:
>     $ qemu-io -f qcow2 -c "write -P 69 64k 64k" top.qcow2
> 
>     # Write zeroes to third cluster of top, hiding third cluster of base:
>     $ qemu-io -f qcow2 -c "write -z 128k 64k" top.qcow2
> 
> This creates:
> 
>     top:  -D0-
>     base: ABC-
> 
> How current qemu-img and qemu-nbd report the state:
> 
>     $ qemu-img map --output json top.qcow2
>     [{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": true, "offset": 0},
>     { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>     { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
>     { "start": 196608, "length": 65536, "depth": 1, "zero": true, "data": false, "offset": 196608}]

Note how this one reports "depth":1 when the backing file is consulted...

> 
>     $ qemu-nbd -r -t -f qcow2 top.qcow2 &
>     $ qemu-img map --output json nbd://localhost
>     [{ "start": 0, "length": 131072, "depth": 0, "zero": false, "data": true, "offset": 0},
>     { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false, "offset": 131072}]

...but since NBD has no notion of a backing file, there is nothing
that qemu can do to report depth information itself.  If you want to
reconstruct the backing chain, you should be able to further query
qemu:allocation-depth, and piece the two queries together to get what
you need:

$ ./qemu-nbd -r -t -f qcow2 top.qcow2 -A
$ nbdinfo --map=qemu:allocation-depth nbd://localhost
         0      131072    1  local
    131072      131072    2  backing depth 2

However, _that_ output looks odd - it claims that clusters 0 and 1 are
local, and 2 and 3 come from a backing file.  Without reading code, I
would have expected something closer to the qcow2 view, claiming that
clusters 1 and 2 are local, while 0 and 3 come from a backing file (3
could also be reported as unallocated, but only if you use a qcow2 as
the backing file instead of raw, since we have no easy way to
determine which holes map to file system allocations in raw files).

/me goes to debug...  I'll need to reply in a later email when I've
spent more time on that.

[Oh, and that reminds me, I would love to patch nbdinfo to let --map
query all available contexts, not just base:allocation, without having
to explicitly name alternative --map=FOO... But it missed today's
stable release of libnbd 1.8]

[The same information can be obtained via qemu-img using
x-dirty-bitmap and --image-opts, but is so much more of a hack that
for now I will just refer to iotest 309 instead of spelling it out
here]

> 
>     $ nbdinfo --map nbd://localhost
>              0      131072    0  allocated
>         131072      131072    3  hole,zero

This faithfully reflects what qemu-img saw, which is all the more the
NBD protocol lets us send without the use of extensions like
qemu:allocation-depth.

> 
> The third extents is reported as a hole in both cases. In qmeu-nbd the

qemu

> cluster is merged with forth cluster which is actually a hole.
> 
> This is incorrect since if it was a hole, the third cluster would be
> exposed to the guest. Programs using qemu-nbd output to reconstruct the
> image chain on other storage would be confused and copy only the first 2
> cluster. The results of this copy will be an image exposing the third
> cluster from the base image, corrupting the guest data.

This is where I disagree - if the NBD protocol exposed the notion of a
backing file, then reporting a local hole should indeed imply reading
from the backing file.  But since base NBD protocol does NOT support
backing images of any sort, you cannot make any assumptions about what
base:allocation says about holes, other than that the image presented
over NBD was not fully allocated in some manner at that location.  You
instead need to fix your tooling to query qemu:allocation-depth if you
are trying to reconstruct all state known by qemu.

> 
> I found that it can be fixed using BDRV_BLOCK_OFFSET_VALID when
> reporting the status of the extent. When we have a valid offset, we
> report based on BDRV_BLOCK_DATA. Otherwise we report based on
> BDRV_BLOCK_ALLOCATED.

That sounds hairy.  As an initial reaction, I'm not sure I like it.

> 
> With this fix we get:
> 
>     $ build/qemu-img map --output json top.qcow2
>     [{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": true, "offset": 0},
>     { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>     { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": true},

Earlier, this line was "data":false, which made sense - there was no
offset in either top.qcow2 nor in raw.base at which you could mmap to
read the actual zeroes that were implied by the unallocated zero
cluster.  Your change here is reporting "data":true to state that the
zeroes explicitly come from the "depth":0 layer, although it is a bit
misleading because we did not actually allocate clusters in top.qcow2
for reading the zeroes.  In reality, this really IS an instance of a
qcow2 unallocated cluster, where "data":false fits better for the
definitions in include/block/block.h.

>     { "start": 196608, "length": 65536, "depth": 1, "zero": true, "data": false, "offset": 196608}]
> 
>     $ build/qemu-nbd -r -t -f qcow2 top.qcow2 &
>     $ qemu-img map --output json nbd://localhost
>     [{ "start": 0, "length": 131072, "depth": 0, "zero": false, "data": true, "offset": 0},
>     { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": true, "offset": 131072},
>     { "start": 196608, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": 196608}]

Meanwhile, this output is indeed arguably more precise, although it
differs from the qcow2 output in that you provide an offset for
cluster 2.

> 
>     $ nbdinfo --map nbd://localhost
>              0      131072    0  allocated
>         131072       65536    2  zero
>         196608       65536    3  hole,zero
> 
> The issue was found by ovirt-imageio functional tests:
> https://github.com/oVirt/ovirt-imageio/blob/master/daemon/test/client_test.py
> 
> I did not update any of the existing tests, and I'm sure many tests are
> missing, and the documentation should change to describe the new
> behavior. Posting as is for early review.
> 
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> Resolves: https://bugzilla.redhat.com/1968693
> ---
>  nbd/server.c | 8 ++++++--
>  qemu-img.c   | 4 +++-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index b60ebc3ab6..adf37905d5 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2127,8 +2127,12 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
>              return ret;
>          }
>  
> -        flags = (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE) |
> -                (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
> +        flags = (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
> +
> +        if (ret & BDRV_BLOCK_OFFSET_VALID)
> +            flags |= (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE);
> +        else
> +            flags |= (ret & BDRV_BLOCK_ALLOCATED ? 0 : NBD_STATE_HOLE);

This will fall apart on compressed or encrypted images, where data is
allocated but offset_valid is false.

>  
>          if (nbd_extent_array_add(ea, num, flags) < 0) {
>              return 0;
> diff --git a/qemu-img.c b/qemu-img.c
> index a5993682aa..6808e12d87 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -3039,7 +3039,9 @@ static int get_block_status(BlockDriverState *bs, int64_t offset,
>      *e = (MapEntry) {
>          .start = offset,
>          .length = bytes,
> -        .data = !!(ret & BDRV_BLOCK_DATA),
> +        .data = !!(has_offset
> +            ? ret & BDRV_BLOCK_DATA
> +            : ret & BDRV_BLOCK_ALLOCATED),

I'm really not sure about this.  You are not only changing what
qemu-nbd advertises as a server, but also what qemu-img interprets as
a client.  Are you sure this will still work when you mix-and-match
old server + new client, or new server + old client?

>          .zero = !!(ret & BDRV_BLOCK_ZERO),
>          .offset = map,
>          .has_offset = has_offset,
> -- 
> 2.26.3
>

In short, I agree that the current situation is awkward, but I'm not
sure that this patch is right.  Rather, I'm wondering if we have a bug
in qemu:allocation-depth, and where once that is fixed, you should be
using that alongside base:allocation when deciding how to guess on how
to reconstruct a qcow2 backing chain using only information learned
over NBD.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


