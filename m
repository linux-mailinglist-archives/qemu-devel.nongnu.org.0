Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5B3EDF61
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:39:53 +0200 (CEST)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFkKm-00053b-ON
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mFkJT-00039P-Bt
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mFkJR-0001R4-Oz
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629149909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9cxh/WffuFalqtXOiJMJC7N+Y7qq0H+HLJqr3xK8fAM=;
 b=Hb44Lsl9TovJ7DmEu5owUuR4yvDsfo+M+k8lNZ8c1gVwL0HYgJl/s/9IFYUhVBWyKPQj5S
 MWXxgrUMvBidWZm8kG02dDKmA8syPUbGAMM+4XAqJRZ8uT7gzcgHWLF16Lb2eK1tJBY6v2
 XQlDRf+MksLHFvWHX6E/3DDuFgLUYW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-72bXWEZPOeWB3dEH-B4ZIw-1; Mon, 16 Aug 2021 17:38:26 -0400
X-MC-Unique: 72bXWEZPOeWB3dEH-B4ZIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EDA687122E;
 Mon, 16 Aug 2021 21:38:25 +0000 (UTC)
Received: from redhat.com (ovpn-113-125.phx2.redhat.com [10.3.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E42283A47;
 Mon, 16 Aug 2021 21:38:24 +0000 (UTC)
Date: Mon, 16 Aug 2021 16:38:23 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 2/6] block: block-status cache for data regions
Message-ID: <20210816213823.uocknsk4zgulrk3v@redhat.com>
References: <20210812084148.14458-1-hreitz@redhat.com>
 <20210812084148.14458-3-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210812084148.14458-3-hreitz@redhat.com>
User-Agent: NeoMutt/20210205-719-68949a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 10:41:44AM +0200, Hanna Reitz wrote:
> As we have attempted before
> (https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06451.html,
> "file-posix: Cache lseek result for data regions";
> https://lists.nongnu.org/archive/html/qemu-block/2021-02/msg00934.html,
> "file-posix: Cache next hole"), this patch seeks to reduce the number of
> SEEK_DATA/HOLE operations the file-posix driver has to perform.  The
> main difference is that this time it is implemented as part of the
> general block layer code.
> 

> We only use the cache for nodes without children (i.e. protocol nodes),
> because that is where the problem is: Drivers that rely on block-status
> implementations outside of qemu (e.g. SEEK_DATA/HOLE).
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/307
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---

> +++ b/block.c

> +/**
> + * Check whether [offset, offset + bytes) overlaps with the cached
> + * block-status data region.
> + *
> + * If so, and @pnum is not NULL, set *pnum to `bsc.data_end - offset`,
> + * which is what bdrv_bsc_is_data()'s interface needs.
> + * Otherwise, *pnum is not touched.

Why duplicate this comment,...

> + */
> +static bool bdrv_bsc_range_overlaps_locked(BlockDriverState *bs,
> +                                           int64_t offset, int64_t bytes,
> +                                           int64_t *pnum)
> +{
> +    BdrvBlockStatusCache *bsc = qatomic_rcu_read(&bs->block_status_cache);
> +    bool overlaps;
> +
> +    overlaps =
> +        qatomic_read(&bsc->valid) &&
> +        ranges_overlap(offset, bytes, bsc->data_start,
> +                       bsc->data_end - bsc->data_start);
> +
> +    if (overlaps && pnum) {
> +        *pnum = bsc->data_end - offset;
> +    }
> +
> +    return overlaps;
> +}
> +
> +/**
> + * See block_int.h for this function's documentation.
> + */
> +bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t *pnum)
> +{
> +    RCU_READ_LOCK_GUARD();
> +
> +    return bdrv_bsc_range_overlaps_locked(bs, offset, 1, pnum);
> +}
> +
> +/**
> + * See block_int.h for this function's documentation.

...but not these?

But that's minor.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


