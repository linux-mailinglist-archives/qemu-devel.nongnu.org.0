Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14993BDC08
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:15:16 +0200 (CEST)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ofE-0002rl-0e
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0oUb-0008Gb-7X
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0oUX-0000Nt-VE
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625591052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ItiAr7SFr3X4PTj3MFLfhbxymdadmrBvuSFW8Mivg0k=;
 b=MMizabE7LyVbAfO1k9TIb29Sx+/pT1lYmxjFyS6NLo1A/0pAV3LpUVUqmYr7iy434OoBgS
 bBdsgq9GiTJEjW3sTeh7qKWMSKSi0AOmbTqihUzJtqSaxTmriLZIPu9lUhw9HfTbbq/TyV
 UHuKaDn6EQYRb67uKLH8kca2iDA9rZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-GMiBMPUqNl20lHlHoFReAA-1; Tue, 06 Jul 2021 13:04:10 -0400
X-MC-Unique: GMiBMPUqNl20lHlHoFReAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFA9318414A7;
 Tue,  6 Jul 2021 17:04:09 +0000 (UTC)
Received: from redhat.com (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F4BA60583;
 Tue,  6 Jul 2021 17:04:08 +0000 (UTC)
Date: Tue, 6 Jul 2021 19:04:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 2/6] block: block-status cache for data regions
Message-ID: <YOSNB2PHpkA4Je0S@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
 <20210623150143.188184-3-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210623150143.188184-3-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.06.2021 um 17:01 hat Max Reitz geschrieben:
> As we have attempted before
> (https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06451.html,
> "file-posix: Cache lseek result for data regions";
> https://lists.nongnu.org/archive/html/qemu-block/2021-02/msg00934.html,
> "file-posix: Cache next hole"), this patch seeks to reduce the number of
> SEEK_DATA/HOLE operations the file-posix driver has to perform.  The
> main difference is that this time it is implemented as part of the
> general block layer code.
> 
> The problem we face is that on some filesystems or in some
> circumstances, SEEK_DATA/HOLE is unreasonably slow.  Given the
> implementation is outside of qemu, there is little we can do about its
> performance.
> 
> We have already introduced the want_zero parameter to
> bdrv_co_block_status() to reduce the number of SEEK_DATA/HOLE calls
> unless we really want zero information; but sometimes we do want that
> information, because for files that consist largely of zero areas,
> special-casing those areas can give large performance boosts.  So the
> real problem is with files that consist largely of data, so that
> inquiring the block status does not gain us much performance, but where
> such an inquiry itself takes a lot of time.
> 
> To address this, we want to cache data regions.  Most of the time, when
> bad performance is reported, it is in places where the image is iterated
> over from start to end (qemu-img convert or the mirror job), so a simple
> yet effective solution is to cache only the current data region.
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

Since you indicated that you'll respin the patch, I'll add my minor
comments:

> @@ -2442,9 +2445,58 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
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
> +        if (QLIST_EMPTY(&bs->children)) {
> +            if (bdrv_bsc_is_data(bs, aligned_offset, pnum)) {
> +                ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
> +                local_file = bs;
> +                local_map = aligned_offset;
> +
> +                from_cache = true;
> +            }
> +        }
> +
> +        if (!from_cache) {

Is having a separate variable from_cache really useful? This looks like
it could just be:

    if (QLIST_EMPTY() && bdrv_bsc_is_data()) {
        // The code above
    } else {
        // The code below
    }

> +            ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
> +                                                aligned_bytes, pnum, &local_map,
> +                                                &local_file);
> +
> +            /*
> +             * Note that checking QLIST_EMPTY(&bs->children) is also done when
> +             * the cache is queried above.  Technically, we do not need to check
> +             * it here; the worst that can happen is that we fill the cache for
> +             * non-protocol nodes, and then it is never used.  However, filling
> +             * the cache requires an RCU update, so double check here to avoid
> +             * such an update if possible.
> +             */
> +            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID) &&
> +                QLIST_EMPTY(&bs->children))
> +            {

Would it be worth asserting that local_map == aligned_offset, because
otherwise with a buggy protocol driver, the result from the cache could
be different from the first call without us noticing?

> +                bdrv_bsc_fill(bs, aligned_offset, *pnum);
> +            }
> +        }
>      } else {
>          /* Default code for filters */

Kevin


