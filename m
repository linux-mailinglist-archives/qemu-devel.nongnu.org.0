Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E5D492BA9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:54:27 +0100 (CET)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rkY-0007g6-0S
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:54:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9rUL-0005Xa-N0
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:37:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9rUI-0005yy-U4
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Li55SGHFEUSdJTd1HgcR5Kh14iLT08Z015OISDF868=;
 b=Ud9H7hePy9lpJLSaIewFuGDiD/ThOEULZJuoJAirH4PDJMGiV/FNCeCWlKE8y0iy5pyWcy
 k/eIVwC2rvo8cbxxYYv0IU4/PrGyP3Z3C7YuXRg8Qp1AxQEcrhTHLzfETct6tCqXqgUdY1
 AS//Nkg7VgwfhvPRadq27zqcTviEx7k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-ThIc_q8hNU-F3eY8zyA74w-1; Tue, 18 Jan 2022 11:37:33 -0500
X-MC-Unique: ThIc_q8hNU-F3eY8zyA74w-1
Received: by mail-wm1-f71.google.com with SMTP id
 r131-20020a1c4489000000b0034d5c66d8f5so1452704wma.5
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 08:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2Li55SGHFEUSdJTd1HgcR5Kh14iLT08Z015OISDF868=;
 b=SNWOC/PafTzubnnC08QI63LZDy+A2xZIMrA49XyKheP6Tp9S83YmaToqpjLcWF0sI8
 NYDYUnaaYqgiIc2PxRgZ/GWg5p+Qs7mgF1GAnwM9UVxV9Niun2y2QRvKwrqoDByavnZG
 bBoID2/MhpN4G4icJ0uDOOM+spXgu4mBqPCZT+HS009Ymxugha7DChJgD0kIRaQcZzIr
 I163ybAmhgr4FiOkBn/Cn9+fuTjCe2XYTVtHME2O5o8yqlL0BWtwaDHYlf+39YtrEson
 gbCjqef7yDDtaqg7Mcvr8JZse085TjJOpB6KOgYs8Dpj+34aitnvDSpCR0HDn4w+s53d
 YCkg==
X-Gm-Message-State: AOAM532vB2+C2NrnukDMUKHO3LePWOfxnabYjBc9e650LzbHcza3RrQ/
 EdTMr7jroKWW/m7T4bieGQ7Ox1b/C+R8DtuMsZBCLR4NUebehYua/jN7PPUzPYuqnvsze6YIS3Q
 sIZagvpEhH9qWIyk=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr11035322wms.45.1642523848587; 
 Tue, 18 Jan 2022 08:37:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMKc9IyhfKnejjNBJrnru9zk2wSrY4rrmzu+J5P6uwYR7I3VMY7Gn9JZeai09VPCBIpgcrZg==
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr11035282wms.45.1642523848126; 
 Tue, 18 Jan 2022 08:37:28 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id k2sm5461441wrm.49.2022.01.18.08.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 08:37:27 -0800 (PST)
Message-ID: <84ca9222-faee-de23-d8e7-06c39c938e9e@redhat.com>
Date: Tue, 18 Jan 2022 17:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 09/19] block: introduce FleecingState class
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-10-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-10-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
> FleecingState represents state shared between copy-before-write filter
> and upcoming fleecing block driver.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/fleecing.h  | 135 ++++++++++++++++++++++++++++++++++
>   block/fleecing.c  | 182 ++++++++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS       |   2 +
>   block/meson.build |   1 +
>   4 files changed, 320 insertions(+)
>   create mode 100644 block/fleecing.h
>   create mode 100644 block/fleecing.c
>
> diff --git a/block/fleecing.h b/block/fleecing.h
> new file mode 100644
> index 0000000000..fb7b2f86c4
> --- /dev/null
> +++ b/block/fleecing.h
> @@ -0,0 +1,135 @@
> +/*
> + * FleecingState
> + *
> + * The common state of image fleecing, shared between copy-before-write filter
> + * and fleecing block driver.

 From this documentation, it’s unclear to me who owns the FleecingState 
object.  I would have assumed it’s the fleecing node, and if it is, I 
wonder why we even have this external interface instead of considering 
FleecingState a helper object for the fleecing block driver (or rather 
the block driver’s opaque state, which it basically is, as far as I can 
see from peeking into the next patch), and putting both into a single 
file with no external interface except for 
fleecing_mark_done_and_wait_readers().

> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
> + *
> + * Author:
> + *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + *
> + *
> + * Fleecing scheme looks as follows:
> + *
> + * [guest blk]                   [nbd export]
> + *    |                              |
> + *    |root                          |
> + *    v                              v
> + * [copy-before-write]--target-->[fleecing drv]
> + *    |                          /   |
> + *    |file                     /    |file
> + *    v                        /     v
> + * [active disk]<--source-----/  [temp disk]
> + *
> + * Note that "active disk" is also called just "source" and "temp disk" is also
> + * called "target".
> + *
> + * What happens here:
> + *
> + * copy-before-write filter performs copy-before-write operations: on guest
> + * write we should copy old data to target child before rewriting. Note that we
> + * write this data through fleecing driver: it saves a possibility to implement
> + * a kind of cache in fleecing driver in future.

I don’t understand why this explanation is the first one given (and the 
only one given explicitly as a reason) for why we want a fleecing block 
driver.

(1) If we implement caching later, I have a feeling that we’ll want new 
options for this.  So a management layer that wants caching will need to 
be updated at that point anyway (to specify these new options), so I 
don’t understand how adding a fleecing block driver now would make it 
easier later on to introduce caching.

(1b) It’s actually entirely possible that we will not want to use the 
fleecing driver for caching, because we decide that caching is much more 
useful as its own dedicated block driver.

(2) There are much better arguments below.  This FleecingState you 
introduce here makes it clear why we need a fleecing block driver; it 
helps with synchronization, and it provides the “I’m done with this bit, 
I don’t care about it anymore” discard interface.

> + *
> + * Fleecing user is nbd export: it can read from fleecing node, which guarantees
> + * a snapshot-view for fleecing user. Fleecing user may also do discard
> + * operations.
> + *
> + * FleecingState is responsible for most of the fleecing logic:
> + *
> + * 1. Fleecing read. Handle reads of fleecing user: we should decide where from
> + * to read, from source node or from copy-before-write target node. In former
> + * case we need to synchronize with guest writes. See fleecing_read_lock() and
> + * fleecing_read_unlock() functionality.
> + *
> + * 2. Guest write synchronization (part of [1] actually). See
> + * fleecing_mark_done_and_wait_readers()
> + *
> + * 3. Fleecing discard. Used by fleecing user when corresponding area is already
> + * copied. Fleecing user may discard the area which is not needed anymore, that
> + * should result in:
> + *   - discarding data to free disk space
> + *   - clear bits in copy-bitmap of block-copy, to avoid extra copy-before-write
> + *     operations
> + *   - clear bits in access-bitmap of FleecingState, to avoid further wrong
> + *     access
> + *
> + * Still, FleecingState doesn't own any block children, so all real io
> + * operations (reads, writes and discards) are done by copy-before-write filter
> + * and fleecing block driver.

I find this a bit confusing, because for me, it raised the question of 
“why would it own block childen?”, which led to me wanting to know even 
more where the place of FleecingState is.  This sentence makes it really 
sound as if FleecingState is its own independent object floating around 
somewhere, not owned by anything, and that feels very wrong.

(If FleecingState were owned by the fleecing driver, i.e. if it 
basically were just the fleecing driver’s opaque data itself, then the 
question of what the FleecingState is, and whether it could own block 
children wouldn’t even come up.)

> + */
> +
> +#ifndef FLEECING_H
> +#define FLEECING_H
> +
> +#include "block/block_int.h"
> +#include "block/block-copy.h"
> +#include "block/reqlist.h"
> +
> +typedef struct FleecingState FleecingState;
> +
> +/*
> + * Create FleecingState.
> + *
> + * @bcs: link to block-copy owned by copy-before-write filter.

s/block-copy/block-copy state/

> + *
> + * @fleecing_node: should be fleecing block driver node. Used to create some

I think the “should be” should be dropped.  This must be a fleecing 
block driver, right?

(But then again, I really don’t understand why the FleecingState is 
separate from BDRVFleecingState in the first place.)

> + * bitmaps in it.
> + */
> +FleecingState *fleecing_new(BlockCopyState *bcs,
> +                            BlockDriverState *fleecing_node,
> +                            Error **errp);
> +
> +/* Free the state. Doesn't free block-copy state (@bcs) */
> +void fleecing_free(FleecingState *s);
> +
> +/*
> + * Convenient function for thous who want to do fleecing read.

s/thous/those/

I kind of miss a quick summary here of what this function is for, i.e. to
(1) find out where to read the data from, and
(2) if it’s to be read from the source, to block the affected area from 
writes until the read is done.

But I don’t know how to phrase that concisely, so I’m also OK with not 
having such a summary.

> + *
> + * If requested region starts in "done" area, i.e. data is already copied to
> + * copy-before-write target node, req is set to NULL, pnum is set to available
> + * bytes to read from target. User is free to read @pnum bytes from target.
> + * Still, user is responsible for concurrent discards on target.
> + *
> + * If requests region starts in "not done" area, i.e. we have to read from

s/requests/requested/

> + * source node directly, than @pnum bytes of source node are frozen and

s/than/then/

> + * guaranteed not be rewritten until user calls cbw_snapshot_read_unlock().

s/guaranteed not be rewritten/guaranteed not to be rewritten/

(or perhaps also s/rewritten/modified/, but it’s probably just me to 
whom “rewritten” sounds a bit like “the same data is written again”)

> + *
> + * Returns 0 on success and -EACCES when try to read non-dirty area of
> + * access_bitmap.
> + */

This description doesn’t sufficiently describe the @req parameter. It 
only says that `*req == NULL` will be returned if the data is to be read 
from the target node, but other than that it doesn’t say whether *req is 
a pure “out” or “inout” parameter.  It doesn’t say whether the caller 
has to pre-fill it (and fleecing_read_lock() will set it to NULL if the 
caller should read from the target), or whether fleecing_read_lock() 
will always set it (depending on whether to read from the source 
(non-NULL) or the target (NULL)).

Since it’s the latter (fleecing_read_lock() will allocate a BlockReq and 
return it), we also need to explain what we expect the user to do with 
this, namely absolutely nothing except pass it again to 
fleecing_read_unlock().

> +int fleecing_read_lock(FleecingState *f, int64_t offset,
> +                       int64_t bytes, const BlockReq **req, int64_t *pnum);
> +/* Called as closing pair for fleecing_read_lock() */

It isn’t quite clear from this summary whether this function should also 
be called if fleecing_read_lock() returned success, but *req == NULL.  
It shouldn’t, but given this description, I’d do it.

> +void fleecing_read_unlock(FleecingState *f, const BlockReq *req);
> +
> +/*
> + * Called when fleecing user doesn't need the region anymore (for example the
> + * region is successfully read and backed up somewhere).
> + * This prevents extra copy-before-write operations in this area in future.
> + * Next fleecing read from this area will fail with -EACCES.
> + */
> +void fleecing_discard(FleecingState *f, int64_t offset, int64_t bytes);
> +
> +/*
> + * Called by copy-before-write filter after successful copy-before-write
> + * operation to synchronize with parallel fleecing reads.
> + */
> +void fleecing_mark_done_and_wait_readers(FleecingState *f, int64_t offset,
> +                                         int64_t bytes);
> +
> +#endif /* FLEECING_H */
> diff --git a/block/fleecing.c b/block/fleecing.c
> new file mode 100644
> index 0000000000..f75d11b892
> --- /dev/null
> +++ b/block/fleecing.c
> @@ -0,0 +1,182 @@
> +/*
> + * FleecingState
> + *
> + * The common state of image fleecing, shared between copy-before-write filter
> + * and fleecing block driver.
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
> + *
> + * Author:
> + *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "sysemu/block-backend.h"
> +#include "qemu/cutils.h"
> +#include "qapi/error.h"
> +#include "block/block_int.h"
> +#include "block/coroutines.h"
> +#include "block/qdict.h"
> +#include "block/block-copy.h"
> +#include "block/reqlist.h"
> +
> +#include "block/fleecing.h"
> +
> +/*
> + * @bcs: link to block-copy state owned by copy-before-write filter which
> + * performs copy-before-write operations in context of fleecing scheme.
> + * FleecingState doesn't own the block-copy state and don't free it on cleanup.

s/don't/doesn't/

> + *
> + * @lock: protects access to @access_bitmap, @done_bitmap and @frozen_read_reqs
> + *
> + * @access_bitmap: represents areas allowed for reading by fleecing user.
> + * Reading from non-dirty areas leads to -EACCES. Discard operation among other

Since this is not really abort dirty or not, I’d prefer “clear 
(non-dirty)” instead of just “non-dirty”.

> + * things clears corresponding bits in this bitmaps.

It isn’t quite clear whether (A) the discard operation does various 
things, and one of them is to reset the corresponding area in the 
access_bitmap; or (B) the discard operation is only one of various ways 
to reset areas in the access_bitmap.  (It’s (A), and so I’d just say 
“fleecing_discard() clears areas in this bitmap.”)

> + *
> + * @done_bitmap: represents areas that was successfully copied by

s/that was/that were/

> + * copy-before-write operations. So, for dirty areas fleecing user should read
> + * from target node and for clear areas - from source node.

I’d prefer “from target node, and for clear areas from source node”.

> + *
> + * @frozen_read_reqs: current read requests for fleecing user in source node.

Hmm, perhaps “ongoing” would be clearer than “current”?

> + * corresponding areas must not be rewritten by guest.

Not necessarily just the guest, so something like “Writing to these 
areas must wait until the respective requests are settled.” would be 
more general.

> + */
> +typedef struct FleecingState {
> +    BlockCopyState *bcs;
> +
> +    CoMutex lock;
> +
> +    BdrvDirtyBitmap *access_bitmap;
> +    BdrvDirtyBitmap *done_bitmap;
> +
> +    BlockReqList frozen_read_reqs;
> +} FleecingState;
> +
> +FleecingState *fleecing_new(BlockCopyState *bcs,
> +                            BlockDriverState *fleecing_node,
> +                            Error **errp)
> +{
> +    BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(bcs),
> +                    *done_bitmap, *access_bitmap;

I don’t really understand why you didn’t just start a new declaration 
here, putting “BdrvDirtyBitmap” at the beginning of the line again.

> +    int64_t cluster_size = block_copy_cluster_size(bcs);
> +    FleecingState *s;
> +
> +    /* done_bitmap starts empty */
> +    done_bitmap = bdrv_create_dirty_bitmap(fleecing_node, cluster_size, NULL,
> +                                           errp);
> +    if (!done_bitmap) {
> +        return NULL;
> +    }
> +    bdrv_disable_dirty_bitmap(done_bitmap);
> +
> +    /* access_bitmap starts equal to bcs_bitmap */
> +    access_bitmap = bdrv_create_dirty_bitmap(fleecing_node, cluster_size, NULL,
> +                                             errp);
> +    if (!access_bitmap) {
> +        return NULL;
> +    }
> +    bdrv_disable_dirty_bitmap(access_bitmap);
> +    if (!bdrv_dirty_bitmap_merge_internal(access_bitmap, bcs_bitmap,
> +                                          NULL, true))
> +    {
> +        return NULL;
> +    }

This function lacks a proper on-error clean-up path to free the dirty 
bitmaps.

> +
> +    s = g_new(FleecingState, 1);
> +    *s = (FleecingState) {
> +        .bcs = bcs,
> +        .done_bitmap = done_bitmap,
> +        .access_bitmap = access_bitmap,
> +    };
> +    qemu_co_mutex_init(&s->lock);
> +    QLIST_INIT(&s->frozen_read_reqs);
> +
> +    return s;
> +}
> +
> +void fleecing_free(FleecingState *s)
> +{
> +    if (!s) {
> +        return;
> +    }
> +
> +    bdrv_release_dirty_bitmap(s->access_bitmap);
> +    bdrv_release_dirty_bitmap(s->done_bitmap);
> +    g_free(s);
> +}
> +
> +static BlockReq *add_read_req(FleecingState *s, uint64_t offset, uint64_t bytes)
> +{
> +    BlockReq *req = g_new(BlockReq, 1);
> +
> +    reqlist_init_req(&s->frozen_read_reqs, req, offset, bytes);
> +
> +    return req;
> +}
> +
> +static void drop_read_req(BlockReq *req)
> +{
> +    reqlist_remove_req(req);
> +    g_free(req);
> +}
> +
> +int fleecing_read_lock(FleecingState *s, int64_t offset,
> +                       int64_t bytes, const BlockReq **req,
> +                       int64_t *pnum)
> +{
> +    bool done;
> +
> +    QEMU_LOCK_GUARD(&s->lock);
> +
> +    if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
> +        return -EACCES;
> +    }
> +
> +    bdrv_dirty_bitmap_status(s->done_bitmap, offset, bytes, &done, pnum);
> +    if (!done) {
> +        *req = add_read_req(s, offset, *pnum);
> +    }
> +
> +    return 0;
> +}
> +
> +void fleecing_read_unlock(FleecingState *s, const BlockReq *req)
> +{
> +    QEMU_LOCK_GUARD(&s->lock);
> +
> +    drop_read_req((BlockReq *)req);

In my opinion, any cast removing a `const` must be accompanied by an 
explanatory comment.

As I understand it, this function takes a `const BlockReq *` pointer so 
because `fleecing_read_lock()` returns a `const BlockReq *` object, 
because we don’t want the user to modify that request, but still want 
them to be able to easily pass the object they’ve received to 
`fleecing_read_unlock()`, right?

The problem is of course that we need a mutable BlockReq object here, 
because QLIST_REMOVE() will modify it.  Taking a `const BlockReq *` is 
just not correct.

Perhaps instead of returning a `const BlockReq *` pointer to the caller, 
we should just return a `void *` opaque pointer that they are to pass to 
this function again, that should ensure they don’t touch it just the 
same, and we wouldn’t need this cast here.

> +}
> +
> +void fleecing_discard(FleecingState *s, int64_t offset, int64_t bytes)
> +{
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        bdrv_reset_dirty_bitmap(s->access_bitmap, offset, bytes);
> +    }
> +
> +    block_copy_reset(s->bcs, offset, bytes);
> +}
> +
> +void fleecing_mark_done_and_wait_readers(FleecingState *s, int64_t offset,
> +                                         int64_t bytes)
> +{
> +    assert(QEMU_IS_ALIGNED(offset, block_copy_cluster_size(s->bcs)));
> +    assert(QEMU_IS_ALIGNED(bytes, block_copy_cluster_size(s->bcs)));
> +
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        bdrv_set_dirty_bitmap(s->done_bitmap, offset, bytes);
> +        reqlist_wait_all(&s->frozen_read_reqs, offset, bytes, &s->lock);
> +    }
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7f24ee4b92..78ea04e292 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2423,6 +2423,8 @@ F: block/reqlist.c
>   F: include/block/reqlist.h
>   F: block/copy-before-write.h
>   F: block/copy-before-write.c
> +F: block/fleecing.h
> +F: block/fleecing.c
>   F: include/block/aio_task.h
>   F: block/aio_task.c
>   F: util/qemu-co-shared-resource.c
> diff --git a/block/meson.build b/block/meson.build
> index 5065cf33ba..d30da90a01 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -18,6 +18,7 @@ block_ss.add(files(
>     'crypto.c',
>     'dirty-bitmap.c',
>     'filter-compress.c',
> +  'fleecing.c',
>     'io.c',
>     'mirror.c',
>     'nbd.c',


