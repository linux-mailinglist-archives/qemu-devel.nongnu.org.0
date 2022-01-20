Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2214955E6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:21:38 +0100 (CET)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAes8-0005oD-WB
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:21:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nAa2l-0002PE-6i
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:12:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nAa2g-0004Np-Qt
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642695123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzs6emcYnnFnXW0Ns3VtroDTWAzkVsz2jeIWqif/Hmc=;
 b=X92pMw4S9VOoGtX61NNjy2pKOtxUpZjTE2q1nyU+kVNuPRnojwz1ZzY8EpT0+OZLjVZmY1
 3Czt9mg2jopL/eamtO2VfbJIyIvpE9NNGGR9yGzFyRpTgpjez+xB2R2aTXc4SFigirvf0l
 +yNfeZqW78ppDCnRAYvZnn59PtUBL1Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-1qS1LrdmMGCl9pblBPREDQ-1; Thu, 20 Jan 2022 11:11:59 -0500
X-MC-Unique: 1qS1LrdmMGCl9pblBPREDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so4396731wml.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 08:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nzs6emcYnnFnXW0Ns3VtroDTWAzkVsz2jeIWqif/Hmc=;
 b=5Xv6xzEEL5s8Mn0i8uoVdV2/qzbVBoS3VZSWQ4WxRAJ8s7IZ9KXKA10ht7u/RCKCaq
 DtFSI6cPV/HB+tc5Z9NQk9W0iVVQLs9MofkfYYxqgg17NPaRWNVZGMfYIAps8jyQsCoe
 uP+x7yVtpnYttIkXs2hoeHtSeb1gFFG+ZGKBW3DNhJxbDR3kgz7k9cteV/B4iqUPu1I5
 48LGVm7D3EmEf2RNKvjTJCH5yb0GT+hXGM3jreYrheIazgO6JLhfO/mCmaAM4LJE/7hi
 f50D/fkr6pgfZFs5QEWzcUqfxEgVSS3rAhvF9p2kNzCPXQooGQGbEaE/D4cNNVFxWRk1
 FvPg==
X-Gm-Message-State: AOAM531lxi9P1tg0H8LSU+oWPBaPAQ4zmvrepMwsJhH+HCLfFfKBVYwG
 l1/gJkA59rHuE6KgUblZBnwh+dRWRPCrjp4dC7oAL+wseF+dcqFE8gWxi/VJIcnYAJkhNFQskOX
 caZeyxj1u9Yd84/w=
X-Received: by 2002:adf:c182:: with SMTP id x2mr35147711wre.646.1642695118091; 
 Thu, 20 Jan 2022 08:11:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOXo5IQPIAyFqL618VBn2xyejdWLeR/EAj1sl8+bDP+crxBQzmYUBeMpUk5+0Hti+81FUPVg==
X-Received: by 2002:adf:c182:: with SMTP id x2mr35147684wre.646.1642695117668; 
 Thu, 20 Jan 2022 08:11:57 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id p4sm3868763wrr.4.2022.01.20.08.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 08:11:57 -0800 (PST)
Message-ID: <db264b8a-2c27-eb7c-0c2b-d1fbfe473aa3@redhat.com>
Date: Thu, 20 Jan 2022 17:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 10/19] block: introduce fleecing block driver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-11-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-11-vsementsov@virtuozzo.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
> Introduce a new driver, that works in pair with copy-before-write to
> improve fleecing.
>
> Without fleecing driver, old fleecing scheme looks as follows:
>
> [guest]
>    |
>    |root
>    v
> [copy-before-write] -----> [temp.qcow2] <--- [nbd export]
>    |                 target  |
>    |file                     |backing
>    v                         |
> [active disk] <-------------+
>
> With fleecing driver, new scheme is:
>
> [guest]
>    |
>    |root
>    v
> [copy-before-write] -----> [fleecing] <--- [nbd export]
>    |                 target  |    |
>    |file                     |    |file
>    v                         |    v
> [active disk]<--source------+  [temp.img]
>
> Benefits of new scheme:
>
> 1. Access control: if remote client try to read data that not covered
>     by original dirty bitmap used on copy-before-write open, client gets
>     -EACCES.
>
> 2. Discard support: if remote client do DISCARD, this additionally to
>     discarding data in temp.img informs block-copy process to not copy
>     these clusters. Next read from discarded area will return -EACCES.
>     This is significant thing: when fleecing user reads data that was
>     not yet copied to temp.img, we can avoid copying it on further guest
>     write.
>
> 3. Synchronisation between client reads and block-copy write is more
>     efficient: it doesn't block intersecting block-copy write during
>     client read.
>
> 4. We don't rely on backing feature: active disk should not be backing
>     of temp image, so we avoid some permission-related difficulties and
>     temp image now is not required to support backing, it may be simple
>     raw image.
>
> Note that now nobody calls fleecing_drv_activate(), so new driver is
> actually unusable. It's a work for the following patch: support
> fleecing block driver in copy-before-write filter driver.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json |  37 +++++-
>   block/fleecing.h     |  16 +++
>   block/fleecing-drv.c | 261 +++++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS          |   1 +
>   block/meson.build    |   1 +
>   5 files changed, 315 insertions(+), 1 deletion(-)
>   create mode 100644 block/fleecing-drv.c
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6904daeacf..b47351dbac 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2917,13 +2917,14 @@
>   # @blkreplay: Since 4.2
>   # @compress: Since 5.0
>   # @copy-before-write: Since 6.2
> +# @fleecing: Since 7.0
>   #
>   # Since: 2.9
>   ##
>   { 'enum': 'BlockdevDriver',
>     'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
>               'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
> -            'file', 'ftp', 'ftps', 'gluster',
> +            'file', 'fleecing', 'ftp', 'ftps', 'gluster',
>               {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>               {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>               'http', 'https', 'iscsi',
> @@ -4181,6 +4182,39 @@
>     'base': 'BlockdevOptionsGenericFormat',
>     'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
>   
> +##
> +# @BlockdevOptionsFleecing:
> +#
> +# Driver that works in pair with copy-before-write filter to make a fleecing
> +# scheme like this:
> +#
> +#    [guest]
> +#      |
> +#      |root
> +#      v
> +#    [copy-before-write] -----> [fleecing] <--- [nbd export]
> +#      |                 target  |    |
> +#      |file                     |    |file
> +#      v                         |    v
> +#    [active disk]<--source------+  [temp.img]

When generating docs, my sphinx doesn’t like this very much.  I don’t 
know exactly what of it, but it complains with:

docs/../qapi/block-core.json:4190:Line block ends without a blank line.

(Line 4190 is the “@BlockdevOptionsFleecing:” line, but there is no 
warning if I remove this ASCII art.)

> +#
> +# The scheme works like this: on write, fleecing driver saves data to its
> +# ``file`` child and remember that this data is in ``file`` child. On read
> +# fleecing reads from ``file`` child if data is already stored to it and
> +# otherwise it reads from ``source`` child.

I.e. it’s basically a COW format with the allocation bitmap stored as a 
block dirty bitmap.

> +# In the same time, before each guest write, ``copy-before-write`` copies
> +# corresponding old data  from ``active disk`` to ``fleecing`` node.
> +# This way, ``fleecing`` node looks like a kind of snapshot for extenal
> +# reader like NBD export.

So this description sounds like the driver is just a COW driver with an 
in-memory allocation bitmap.  But it’s actually specifically tuned for 
fleecing, because it interacts with the CBW node to prevent conflicts, 
and discard requests result in the respective areas become unreadable.

I find that important to mention, because if we don’t, then I’m 
wondering why this isn’t a generic “in-memory-cow” driver, and what 
makes it so useful for fleecing over any other COW driver.

(In fact, I’m asking myself all the time whether we can’t pull this 
driver apart into more generic nodes, like one in-memory-cow driver, and 
another driver managing the discard feature, and so on.  Could be done 
e.g. like this:


                 Guest -> copy-before-write --file--> fleecing-lock 
--file--> disk image
^        |                  ^
|      target               |
+-- cbw-child --+        |               backing
|           v                  |
NBD -> fleecing-discard --file--> in-memory-cow -----------+
                                         |
         file
           |
           v
       temp.img

I.e. fleecing-discard would handle discards (telling its cbw-child to 
drop those areas from the copy-bitmap, and forwarding discards to the 
in-memory-cow node), the in-memory-cow node would just be a generic 
implementation of COW (could be replaced by any other COW-implementing 
node, like qcow2), and the fleecing-lock driver would prevent areas that 
are still being read from from being written to concurrently.

Problem is, of course, that’s very complicated, I haven’t thought this 
through, and it’s extremely questionable whether we really need this 
modularity.  Most likely not.

I still feel compelled to think about such modularization, because the 
relationship between the CBW and the fleecing driver as laid out in this 
series doesn’t feel quite right to me.  They feel bolted together in a 
way that doesn’t fit in with the general design of the block layer where 
every node is basically self-contained.  I understand CBW and fleecing 
will need some communication, but I don’t (yet) like how in the next 
patch, the CBW driver looks for the fleecing driver and directly 
communicates with it through the FleecingState instead of going through 
the block layer, as we’d normally do when communicating between block nodes.

That’s why I’m trying to pick apart the functionality of the fleecing 
block driver into self-contained “atomic” nodes that perform its 
different functionalities, so that perhaps I can eventually put it back 
together and find out whether we can do better than 
`is_fleecing_drv(unfiltered_target)`.)

> +#
> +# @source: node name of source node of fleecing scheme
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'BlockdevOptionsFleecing',
> +  'base': 'BlockdevOptionsGenericFormat',
> +  'data': { 'source': 'str' } }
> +
>   ##
>   # @BlockdevOptions:
>   #
> @@ -4237,6 +4271,7 @@
>         'copy-on-read':'BlockdevOptionsCor',
>         'dmg':        'BlockdevOptionsGenericFormat',
>         'file':       'BlockdevOptionsFile',
> +      'fleecing':   'BlockdevOptionsFleecing',
>         'ftp':        'BlockdevOptionsCurlFtp',
>         'ftps':       'BlockdevOptionsCurlFtps',
>         'gluster':    'BlockdevOptionsGluster',
> diff --git a/block/fleecing.h b/block/fleecing.h
> index fb7b2f86c4..75ad2f8b19 100644
> --- a/block/fleecing.h
> +++ b/block/fleecing.h
> @@ -80,6 +80,9 @@
>   #include "block/block-copy.h"
>   #include "block/reqlist.h"
>   
> +
> +/* fleecing.c */
> +
>   typedef struct FleecingState FleecingState;
>   
>   /*
> @@ -132,4 +135,17 @@ void fleecing_discard(FleecingState *f, int64_t offset, int64_t bytes);
>   void fleecing_mark_done_and_wait_readers(FleecingState *f, int64_t offset,
>                                            int64_t bytes);
>   
> +
> +/* fleecing-drv.c */
> +
> +/* Returns true if @bs->drv is fleecing block driver */
> +bool is_fleecing_drv(BlockDriverState *bs);
> +
> +/*
> + * Normally FleecingState is created by copy-before-write filter. Then
> + * copy-before-write filter calls fleecing_drv_activate() to share FleecingState
> + * with fleecing block driver.
> + */
> +void fleecing_drv_activate(BlockDriverState *bs, FleecingState *fleecing);
> +
>   #endif /* FLEECING_H */
> diff --git a/block/fleecing-drv.c b/block/fleecing-drv.c
> new file mode 100644
> index 0000000000..202208bb03
> --- /dev/null
> +++ b/block/fleecing-drv.c
> @@ -0,0 +1,261 @@
> +/*
> + * fleecing block driver
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
> +#include "block/copy-before-write.h"
> +#include "block/fleecing.h"
> +
> +typedef struct BDRVFleecingState {
> +    FleecingState *fleecing;
> +    BdrvChild *source;
> +} BDRVFleecingState;
> +
> +static coroutine_fn int fleecing_co_preadv_part(
> +        BlockDriverState *bs, int64_t offset, int64_t bytes,
> +        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
> +{
> +    BDRVFleecingState *s = bs->opaque;
> +    const BlockReq *req;
> +    int ret;
> +
> +    if (!s->fleecing) {
> +        /* fleecing_drv_activate() was not called */
> +        return -EINVAL;

I'd rather treat a missing connection with a CBW driver as if we had an 
empty copy/access bitmap, and so return -EACCES in these places.

> +    }
> +
> +    /* TODO: upgrade to async loop using AioTask */
> +    while (bytes) {
> +        int64_t cur_bytes;
> +
> +        ret = fleecing_read_lock(s->fleecing, offset, bytes, &req, &cur_bytes);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +
> +        if (req) {
> +            ret = bdrv_co_preadv_part(s->source, offset, cur_bytes,
> +                                      qiov, qiov_offset, flags);
> +            fleecing_read_unlock(s->fleecing, req);
> +        } else {
> +            ret = bdrv_co_preadv_part(bs->file, offset, cur_bytes,
> +                                      qiov, qiov_offset, flags);
> +        }
> +        if (ret < 0) {
> +            return ret;
> +        }
> +
> +        bytes -= cur_bytes;
> +        offset += cur_bytes;
> +        qiov_offset += cur_bytes;
> +    }
> +
> +    return 0;
> +}
> +
> +static int coroutine_fn fleecing_co_block_status(BlockDriverState *bs,
> +                                                 bool want_zero, int64_t offset,
> +                                                 int64_t bytes, int64_t *pnum,
> +                                                 int64_t *map,
> +                                                 BlockDriverState **file)
> +{
> +    BDRVFleecingState *s = bs->opaque;
> +    const BlockReq *req = NULL;
> +    int ret;
> +    int64_t cur_bytes;
> +
> +    if (!s->fleecing) {
> +        /* fleecing_drv_activate() was not called */
> +        return -EINVAL;
> +    }
> +
> +    ret = fleecing_read_lock(s->fleecing, offset, bytes, &req, &cur_bytes);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    *pnum = cur_bytes;
> +    *map = offset;
> +
> +    if (req) {
> +        *file = s->source->bs;
> +        fleecing_read_unlock(s->fleecing, req);
> +    } else {
> +        *file = bs->file->bs;
> +    }
> +
> +    return ret;

Is ret == 0 the right return value here?

> +}
> +
> +static int coroutine_fn fleecing_co_pdiscard(BlockDriverState *bs,
> +                                             int64_t offset, int64_t bytes)
> +{
> +    BDRVFleecingState *s = bs->opaque;
> +    if (!s->fleecing) {
> +        /* fleecing_drv_activate() was not called */
> +        return -EINVAL;
> +    }
> +
> +    fleecing_discard(s->fleecing, offset, bytes);
> +
> +    bdrv_co_pdiscard(bs->file, offset, bytes);
> +
> +    /*
> +     * Ignore bdrv_co_pdiscard() result: fleecing_discard() succeeded, that
> +     * means that next read from this area will fail with -EACCES. More correct
> +     * to report success now.
> +     */

I don’t know.  I’m asking myself why the caller in turn would care about 
the discard result (usually one doesn’t really care whether discarding 
succeeded or not), and I feel like if they care, they’d like to know 
that discard the data from storage did fail.

> +    return 0;
> +}
> +
> +static int coroutine_fn fleecing_co_pwrite_zeroes(BlockDriverState *bs,
> +        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
> +{
> +    BDRVFleecingState *s = bs->opaque;
> +    if (!s->fleecing) {
> +        /* fleecing_drv_activate() was not called */
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * TODO: implement cache, to have a chance to fleecing user to read and
> +     * discard this data before actual writing to temporary image.
> +     */

Is there a good reason why a cache shouldn’t be implemented as a 
separate block driver?

> +    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
> +}
> +
> +static coroutine_fn int fleecing_co_pwritev(BlockDriverState *bs,
> +                                            int64_t offset,
> +                                            int64_t bytes,
> +                                            QEMUIOVector *qiov,
> +                                            BdrvRequestFlags flags)
> +{
> +    BDRVFleecingState *s = bs->opaque;
> +    if (!s->fleecing) {
> +        /* fleecing_drv_activate() was not called */
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * TODO: implement cache, to have a chance to fleecing user to read and
> +     * discard this data before actual writing to temporary image.
> +     */
> +    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
> +}
> +
> +
> +static void fleecing_refresh_filename(BlockDriverState *bs)
> +{
> +    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
> +            bs->file->bs->filename);
> +}
> +
> +static int fleecing_open(BlockDriverState *bs, QDict *options, int flags,
> +                         Error **errp)
> +{
> +    BDRVFleecingState *s = bs->opaque;
> +
> +    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
> +                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
> +                               false, errp);
> +    if (!bs->file) {
> +        return -EINVAL;
> +    }
> +
> +    s->source = bdrv_open_child(NULL, options, "source", bs, &child_of_bds,
> +                               BDRV_CHILD_DATA, false, errp);
> +    if (!s->source) {
> +        return -EINVAL;
> +    }
> +
> +    bs->total_sectors = bs->file->bs->total_sectors;
> +
> +    return 0;
> +}
> +
> +static void fleecing_child_perm(BlockDriverState *bs, BdrvChild *c,
> +                                BdrvChildRole role,
> +                                BlockReopenQueue *reopen_queue,
> +                                uint64_t perm, uint64_t shared,
> +                                uint64_t *nperm, uint64_t *nshared)
> +{
> +    bdrv_default_perms(bs, c, role, reopen_queue, perm, shared, nperm, nshared);
> +
> +    if (role & BDRV_CHILD_PRIMARY) {
> +        *nshared &= BLK_PERM_CONSISTENT_READ;
> +    } else {
> +        *nperm &= BLK_PERM_CONSISTENT_READ;
> +
> +        /*
> +         * copy-before-write filter is responsible for source child and need
> +         * write access to it.
> +         */
> +        *nshared |= BLK_PERM_WRITE;
> +    }
> +}
> +
> +BlockDriver bdrv_fleecing_drv = {
> +    .format_name = "fleecing",
> +    .instance_size = sizeof(BDRVFleecingState),
> +
> +    .bdrv_open                  = fleecing_open,
> +
> +    .bdrv_co_preadv_part        = fleecing_co_preadv_part,
> +    .bdrv_co_pwritev            = fleecing_co_pwritev,
> +    .bdrv_co_pwrite_zeroes      = fleecing_co_pwrite_zeroes,
> +    .bdrv_co_pdiscard           = fleecing_co_pdiscard,
> +    .bdrv_co_block_status       = fleecing_co_block_status,
> +
> +    .bdrv_refresh_filename      = fleecing_refresh_filename,
> +
> +    .bdrv_child_perm            = fleecing_child_perm,
> +};
> +
> +bool is_fleecing_drv(BlockDriverState *bs)
> +{
> +    return bs && bs->drv == &bdrv_fleecing_drv;
> +}

Besides the question whether the FleecingState should be part of CBW or 
the fleecing driver, I don’t like this very much.  As stated above, 
normally we go through the block layer to communicate between nodes, and 
this function for example prevents the possibility of having filters 
between CBW and the fleecing node.

Normally, I would expect a new BlockDriver method that the CBW driver 
would call to communicate with the fleecing driver.  Isn’t 
fleecing_mark_done_and_wait_readers() the only part where the CBW driver 
ever needs to tell the fleecing driver something?

Hm, actually, I wonder why we need fleecing_mark_done_and_wait_readers() 
to be called from CBW – can we not have the fleecing driver call this in 
its write implementations?  (It’s my understanding that the fleecing 
node is to be used read-only from the NBD export, besides discards.)

> +
> +void fleecing_drv_activate(BlockDriverState *bs, FleecingState *fleecing)
> +{
> +    BDRVFleecingState *s = bs->opaque;
> +
> +    assert(is_fleecing_drv(bs));
> +
> +    s->fleecing = fleecing;
> +}
> +
> +static void fleecing_init(void)
> +{
> +    bdrv_register(&bdrv_fleecing_drv);
> +}
> +
> +block_init(fleecing_init);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 78ea04e292..42dc979052 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2425,6 +2425,7 @@ F: block/copy-before-write.h
>   F: block/copy-before-write.c
>   F: block/fleecing.h
>   F: block/fleecing.c
> +F: block/fleecing-drv.c
>   F: include/block/aio_task.h
>   F: block/aio_task.c
>   F: util/qemu-co-shared-resource.c
> diff --git a/block/meson.build b/block/meson.build
> index d30da90a01..b493580fbe 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -19,6 +19,7 @@ block_ss.add(files(
>     'dirty-bitmap.c',
>     'filter-compress.c',
>     'fleecing.c',
> +  'fleecing-drv.c',
>     'io.c',
>     'mirror.c',
>     'nbd.c',


