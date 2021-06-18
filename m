Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2403AD262
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 20:52:39 +0200 (CEST)
Received: from localhost ([::1]:54606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luJba-0005Fq-1w
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 14:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luJaY-0004Gh-UC
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 14:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luJaV-0003HD-QE
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 14:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624042290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DM7SMeKT3omer1Pyh8s6Qqiqz4zcMNnscpa7VlHFzGA=;
 b=SsaP5PkMNiIYSM2nGuDMPt1jUYqgoX33Ed7aoTFjbk3rgjS4nLdkVN7+gtTyFM5T87KQGU
 8cvKafq07rz9RjxbCDvJtzWuWqgeK3iU+NJfUz3Ib3u0b4weoYXP+h4VsFVWMwuf2BsQxn
 duY5NdKWoGZl2aOWiFgTab1Olnfmq58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-WfV6Lj8FMwecYjCCytCigQ-1; Fri, 18 Jun 2021 14:51:09 -0400
X-MC-Unique: WfV6Lj8FMwecYjCCytCigQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55D2B1054F92;
 Fri, 18 Jun 2021 18:51:08 +0000 (UTC)
Received: from redhat.com (ovpn-112-75.phx2.redhat.com [10.3.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFD165DD68;
 Fri, 18 Jun 2021 18:51:07 +0000 (UTC)
Date: Fri, 18 Jun 2021 13:51:05 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 2/6] block: block-status cache for data regions
Message-ID: <20210618185105.ibhk4rwtsp7os7he@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-3-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210617155247.442150-3-mreitz@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 05:52:43PM +0200, Max Reitz wrote:
> 
> To address this, we want to cache data regions.  Most of the time, when
> bad performance is reported, it is in places where the image is iterated
> over from start to end (qemu-img convert or the mirror job), so a simple
> yet effective solution is to cache only the current data region.

Here's hoping third time's the charm!

> 
> (Note that only caching data regions but not zero regions means that
> returning false information from the cache is not catastrophic: Treating
> zeroes as data is fine.  While we try to invalidate the cache on zero
> writes and discards, such incongruences may still occur when there are
> other processes writing to the image.)
> 
> We only use the cache for nodes without children (i.e. protocol nodes),
> because that is where the problem is: Drivers that rely on block-status
> implementations outside of qemu (e.g. SEEK_DATA/HOLE).
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/307
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  include/block/block_int.h | 19 ++++++++++
>  block.c                   |  2 +
>  block/io.c                | 80 +++++++++++++++++++++++++++++++++++++--
>  3 files changed, 98 insertions(+), 3 deletions(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index a8f9598102..c09512556a 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -832,6 +832,23 @@ struct BdrvChild {
>      QLIST_ENTRY(BdrvChild) next_parent;
>  };
>  
> +/*
> + * Allows bdrv_co_block_status() to cache one data region for a
> + * protocol node.
> + *
> + * @lock: Lock for accessing this object's fields
> + * @valid: Whether the cache is valid
> + * @data_start: Offset where we know (or strongly assume) is data
> + * @data_end: Offset where the data region ends (which is not necessarily
> + *            the start of a zeroed region)
> + */
> +typedef struct BdrvBlockStatusCache {
> +    CoMutex lock;
> +    bool valid;
> +    int64_t data_start;
> +    int64_t data_end;
> +} BdrvBlockStatusCache;

Looks like the right bits of information, and I'm glad you documented
the need to be prepared for protocols that report split data sections
rather than consolidated.

> +++ b/block/io.c
> @@ -35,6 +35,7 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/range.h"
>  #include "sysemu/replay.h"
>  
>  /* Maximum bounce buffer for copy-on-read and write zeroes, in bytes */
> @@ -1862,6 +1863,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>      bool need_flush = false;
>      int head = 0;
>      int tail = 0;
> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>  
>      int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
>      int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
> @@ -1878,6 +1880,16 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>          return -ENOTSUP;
>      }
>  
> +    /* Invalidate the cached block-status data range if this write overlaps */
> +    qemu_co_mutex_lock(&bsc->lock);

Are we going to be suffering from a lot of lock contention performance
degradation?  Is there a way to take advantage of RCU access patterns
for any more performance without sacrificing correctness?

> +    if (bsc->valid &&
> +        ranges_overlap(offset, bytes, bsc->data_start,
> +                       bsc->data_end - bsc->data_start))
> +    {
> +        bsc->valid = false;
> +    }

Do we want to invalidate the entire bsc, or can we be smart and leave
the prefix intact (if offset > bsc->data_start, then set bsc->data_end
to offset)?

> +    qemu_co_mutex_unlock(&bsc->lock);

Worth using WITH_QEMU_LOCK_GUARD?

> +
>      assert(alignment % bs->bl.request_alignment == 0);
>      head = offset % alignment;
>      tail = (offset + bytes) % alignment;
> @@ -2394,6 +2406,7 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
>      int64_t aligned_offset, aligned_bytes;
>      uint32_t align;
>      bool has_filtered_child;
> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>  
>      assert(pnum);
>      *pnum = 0;
> @@ -2442,9 +2455,59 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
>      aligned_bytes = ROUND_UP(offset + bytes, align) - aligned_offset;
>  
>      if (bs->drv->bdrv_co_block_status) {
> -        ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
> -                                            aligned_bytes, pnum, &local_map,
> -                                            &local_file);
> +        bool from_cache = false;
> +
> +        /*
> +         * Use the block-status cache only for protocol nodes: Format
> +         * drivers are generally quick to inquire the status, but protocol
> +         * drivers often need to get information from outside of qemu, so
> +         * we do not have control over the actual implementation.  There
> +         * have been cases where inquiring the status took an unreasonably
> +         * long time, and we can do nothing in qemu to fix it.
> +         * This is especially problematic for images with large data areas,
> +         * because finding the few holes in them and giving them special
> +         * treatment does not gain much performance.  Therefore, we try to
> +         * cache the last-identified data region.
> +         *
> +         * Second, limiting ourselves to protocol nodes allows us to assume
> +         * the block status for data regions to be DATA | OFFSET_VALID, and
> +         * that the host offset is the same as the guest offset.
> +         *
> +         * Note that it is possible that external writers zero parts of
> +         * the cached regions without the cache being invalidated, and so
> +         * we may report zeroes as data.  This is not catastrophic,
> +         * however, because reporting zeroes as data is fine.
> +         */

Useful comment.

> +        if (QLIST_EMPTY(&bs->children)) {
> +            qemu_co_mutex_lock(&bsc->lock);
> +            if (bsc->valid &&
> +                aligned_offset >= bsc->data_start &&
> +                aligned_offset < bsc->data_end)
> +            {
> +                ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
> +                local_file = bs;
> +                local_map = aligned_offset;
> +
> +                *pnum = bsc->data_end - aligned_offset;
> +
> +                from_cache = true;
> +            }
> +            qemu_co_mutex_unlock(&bsc->lock);
> +        }
> +
> +        if (!from_cache) {
> +            ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
> +                                                aligned_bytes, pnum, &local_map,
> +                                                &local_file);
> +
> +            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID)) {
> +                qemu_co_mutex_lock(&bsc->lock);
> +                bsc->data_start = aligned_offset;
> +                bsc->data_end = aligned_offset + *pnum;
> +                bsc->valid = true;
> +                qemu_co_mutex_unlock(&bsc->lock);
> +            }
> +        }

Looks correct.

>      } else {
>          /* Default code for filters */
>  
> @@ -2974,6 +3037,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
>      int max_pdiscard, ret;
>      int head, tail, align;
>      BlockDriverState *bs = child->bs;
> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>  
>      if (!bs || !bs->drv || !bdrv_is_inserted(bs)) {
>          return -ENOMEDIUM;
> @@ -2997,6 +3061,16 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
>          return 0;
>      }
>  
> +    /* Invalidate the cached block-status data range if this discard overlaps */
> +    qemu_co_mutex_lock(&bsc->lock);
> +    if (bsc->valid &&
> +        ranges_overlap(offset, bytes, bsc->data_start,
> +                       bsc->data_end - bsc->data_start))
> +    {
> +        bsc->valid = false;
> +    }

Same question as above about possibly shortening the cached range
in-place rather than discarding it altogether.

> +    qemu_co_mutex_unlock(&bsc->lock);
> +
>      /* Discard is advisory, but some devices track and coalesce
>       * unaligned requests, so we must pass everything down rather than
>       * round here.  Still, most devices will just silently ignore
> -- 
> 2.31.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


