Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8BD3AE735
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:34:50 +0200 (CEST)
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHGT-0007PO-82
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGo5-0007kj-1q
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGo1-0002H5-L9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FqDVKzOUtnyiBdPixauVoTOtDSiHz94/rrWgQktk8qU=;
 b=bE7bYu0fNYH3A12CYQFGJnO+3CRBAHj1MFnk10/b1xArL9NqTeYy30BLXN3ugffXmQnee1
 bkhciq6qqjKyO2KXqqkt0zdcWmmp5TOu6xie7Vn/TyYzDLfFe88yYjb7DMfDE3bR8pX9Xe
 HILaj/Vs2/7n2ZLbsUDgM2DzxGBohRI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-YnnyRFtcNDqql1ANf4eqDA-1; Mon, 21 Jun 2021 06:05:23 -0400
X-MC-Unique: YnnyRFtcNDqql1ANf4eqDA-1
Received: by mail-ed1-f72.google.com with SMTP id
 v12-20020aa7dbcc0000b029038fc8e57037so7524894edt.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 03:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FqDVKzOUtnyiBdPixauVoTOtDSiHz94/rrWgQktk8qU=;
 b=V9GTfPpOjmuMcHaa2So4T64VtocQBaHX1Wr09A+OjjuKCqeS3IF7W3uj8xf+V4gTLW
 4uVfeDfI21eKbCDUmKdfceiRPWUY3q66ZFPa0qAIcOjsGv9JN0gkYSTJDqJ/UiOWfRX6
 9zZ2XiIR4sVy8B1rHDPqv/PWVw/2MMojZxkIkutxokB9KjKL8A0DPS97A9J6N4Z6U75M
 vt16ZGDqublvrVO+zRo8AK5TcmRmHGzcue4Zrx3oZGQQDiKOM6DWJcYVwscTJPljU/fQ
 5i1VVGGuKOMJYH5M2uK5rTNLYsEWTBjGOa/Cjmx00ShUB4BWPgQfryocPV7F1Wli+Clw
 Va0Q==
X-Gm-Message-State: AOAM53186JZn45ksJds+kCGTcbK6gF4XlcDMoVRcULcyvE94yTZVZgVi
 /NlMGsjUTPxNtHtpqPY038PkpNqTkGiJ5dSLO1wSebD3zHrjzqKKivFX2o/xgqy0U9dCLlXRSJJ
 fzdu5NDvwfML8JFmmVi2wAwrZWNgXYwVJ3utrj5Q8nKCT7WWG95RJWHp8wHWutvrc
X-Received: by 2002:a17:906:b201:: with SMTP id
 p1mr18448577ejz.316.1624269921804; 
 Mon, 21 Jun 2021 03:05:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV6+CEGx4RXzDxQScjI9Yld6zfk8fgIPD7l6FYGoOpDQooHbAw5Fmr0L4oRBKPKjv0yF2kCg==
X-Received: by 2002:a17:906:b201:: with SMTP id
 p1mr18448549ejz.316.1624269921617; 
 Mon, 21 Jun 2021 03:05:21 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 hy18sm1528873ejc.111.2021.06.21.03.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 03:05:21 -0700 (PDT)
Subject: Re: [PATCH 2/6] block: block-status cache for data regions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-3-mreitz@redhat.com>
 <65bd55fc-00ab-e254-e6ab-ad1b283f8702@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d7e64ef8-939a-91f1-aaf6-2183aa4b997d@redhat.com>
Date: Mon, 21 Jun 2021 12:05:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <65bd55fc-00ab-e254-e6ab-ad1b283f8702@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.06.21 12:20, Vladimir Sementsov-Ogievskiy wrote:
> 17.06.2021 18:52, Max Reitz wrote:
>> As we have attempted before
>> (https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06451.html,
>> "file-posix: Cache lseek result for data regions";
>> https://lists.nongnu.org/archive/html/qemu-block/2021-02/msg00934.html,
>> "file-posix: Cache next hole"), this patch seeks to reduce the number of
>> SEEK_DATA/HOLE operations the file-posix driver has to perform. The
>> main difference is that this time it is implemented as part of the
>> general block layer code.
>>
>> The problem we face is that on some filesystems or in some
>> circumstances, SEEK_DATA/HOLE is unreasonably slow.  Given the
>> implementation is outside of qemu, there is little we can do about its
>> performance.
>>
>> We have already introduced the want_zero parameter to
>> bdrv_co_block_status() to reduce the number of SEEK_DATA/HOLE calls
>> unless we really want zero information; but sometimes we do want that
>> information, because for files that consist largely of zero areas,
>> special-casing those areas can give large performance boosts. So the
>> real problem is with files that consist largely of data, so that
>> inquiring the block status does not gain us much performance, but where
>> such an inquiry itself takes a lot of time.
>>
>> To address this, we want to cache data regions.  Most of the time, when
>> bad performance is reported, it is in places where the image is iterated
>> over from start to end (qemu-img convert or the mirror job), so a simple
>> yet effective solution is to cache only the current data region.
>>
>> (Note that only caching data regions but not zero regions means that
>> returning false information from the cache is not catastrophic: Treating
>> zeroes as data is fine.  While we try to invalidate the cache on zero
>> writes and discards, such incongruences may still occur when there are
>> other processes writing to the image.)
>>
>> We only use the cache for nodes without children (i.e. protocol nodes),
>> because that is where the problem is: Drivers that rely on block-status
>> implementations outside of qemu (e.g. SEEK_DATA/HOLE).
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/307
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   include/block/block_int.h | 19 ++++++++++
>>   block.c                   |  2 +
>>   block/io.c                | 80 +++++++++++++++++++++++++++++++++++++--
>>   3 files changed, 98 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/block/block_int.h b/include/block/block_int.h
>> index a8f9598102..c09512556a 100644
>> --- a/include/block/block_int.h
>> +++ b/include/block/block_int.h
>> @@ -832,6 +832,23 @@ struct BdrvChild {
>>       QLIST_ENTRY(BdrvChild) next_parent;
>>   };
>>   +/*
>> + * Allows bdrv_co_block_status() to cache one data region for a
>> + * protocol node.
>> + *
>> + * @lock: Lock for accessing this object's fields
>> + * @valid: Whether the cache is valid
>> + * @data_start: Offset where we know (or strongly assume) is data
>> + * @data_end: Offset where the data region ends (which is not 
>> necessarily
>> + *            the start of a zeroed region)
>> + */
>> +typedef struct BdrvBlockStatusCache {
>> +    CoMutex lock;
>> +    bool valid;
>> +    int64_t data_start;
>> +    int64_t data_end;
>> +} BdrvBlockStatusCache;
>> +
>>   struct BlockDriverState {
>>       /* Protected by big QEMU lock or read-only after opening. No 
>> special
>>        * locking needed during I/O...
>> @@ -997,6 +1014,8 @@ struct BlockDriverState {
>>         /* BdrvChild links to this node may never be frozen */
>>       bool never_freeze;
>> +
>> +    BdrvBlockStatusCache block_status_cache;
>>   };
>>     struct BlockBackendRootState {
>> diff --git a/block.c b/block.c
>> index 3f456892d0..bad64d5c4f 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -398,6 +398,8 @@ BlockDriverState *bdrv_new(void)
>>         qemu_co_queue_init(&bs->flush_queue);
>>   +    qemu_co_mutex_init(&bs->block_status_cache.lock);
>> +
>>       for (i = 0; i < bdrv_drain_all_count; i++) {
>>           bdrv_drained_begin(bs);
>>       }
>> diff --git a/block/io.c b/block/io.c
>> index 323854d063..320638cc48 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -35,6 +35,7 @@
>>   #include "qapi/error.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/main-loop.h"
>> +#include "qemu/range.h"
>>   #include "sysemu/replay.h"
>>     /* Maximum bounce buffer for copy-on-read and write zeroes, in 
>> bytes */
>> @@ -1862,6 +1863,7 @@ static int coroutine_fn 
>> bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>>       bool need_flush = false;
>>       int head = 0;
>>       int tail = 0;
>> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>>         int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, 
>> INT_MAX);
>>       int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
>> @@ -1878,6 +1880,16 @@ static int coroutine_fn 
>> bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>>           return -ENOTSUP;
>>       }
>>   +    /* Invalidate the cached block-status data range if this write 
>> overlaps */
>> +    qemu_co_mutex_lock(&bsc->lock);
>> +    if (bsc->valid &&
>> +        ranges_overlap(offset, bytes, bsc->data_start,
>> +                       bsc->data_end - bsc->data_start))
>> +    {
>> +        bsc->valid = false;
>> +    }
>> +    qemu_co_mutex_unlock(&bsc->lock);
>
> I think this fragment used twice worth small function, like
>
> block_status_cache_discard_region().
>
> That would be clean and avoids duplication..

Sure, sounds good.

>> +
>>       assert(alignment % bs->bl.request_alignment == 0);
>>       head = offset % alignment;
>>       tail = (offset + bytes) % alignment;
>> @@ -2394,6 +2406,7 @@ static int coroutine_fn 
>> bdrv_co_block_status(BlockDriverState *bs,
>>       int64_t aligned_offset, aligned_bytes;
>>       uint32_t align;
>>       bool has_filtered_child;
>> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>>         assert(pnum);
>>       *pnum = 0;
>> @@ -2442,9 +2455,59 @@ static int coroutine_fn 
>> bdrv_co_block_status(BlockDriverState *bs,
>>       aligned_bytes = ROUND_UP(offset + bytes, align) - aligned_offset;
>>         if (bs->drv->bdrv_co_block_status) {
>> -        ret = bs->drv->bdrv_co_block_status(bs, want_zero, 
>> aligned_offset,
>> -                                            aligned_bytes, pnum, 
>> &local_map,
>> -                                            &local_file);
>> +        bool from_cache = false;
>> +
>> +        /*
>> +         * Use the block-status cache only for protocol nodes: Format
>> +         * drivers are generally quick to inquire the status, but 
>> protocol
>> +         * drivers often need to get information from outside of 
>> qemu, so
>> +         * we do not have control over the actual implementation.  
>> There
>> +         * have been cases where inquiring the status took an 
>> unreasonably
>> +         * long time, and we can do nothing in qemu to fix it.
>> +         * This is especially problematic for images with large data 
>> areas,
>> +         * because finding the few holes in them and giving them 
>> special
>> +         * treatment does not gain much performance. Therefore, we 
>> try to
>> +         * cache the last-identified data region.
>> +         *
>> +         * Second, limiting ourselves to protocol nodes allows us to 
>> assume
>> +         * the block status for data regions to be DATA | 
>> OFFSET_VALID, and
>> +         * that the host offset is the same as the guest offset.
>> +         *
>> +         * Note that it is possible that external writers zero parts of
>> +         * the cached regions without the cache being invalidated, 
>> and so
>> +         * we may report zeroes as data.  This is not catastrophic,
>> +         * however, because reporting zeroes as data is fine.
>> +         */
>> +        if (QLIST_EMPTY(&bs->children)) {
>> +            qemu_co_mutex_lock(&bsc->lock);
>> +            if (bsc->valid &&
>> +                aligned_offset >= bsc->data_start &&
>> +                aligned_offset < bsc->data_end)
>> +            {
>> +                ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
>> +                local_file = bs;
>> +                local_map = aligned_offset;
>> +
>> +                *pnum = bsc->data_end - aligned_offset;
>> +
>> +                from_cache = true;
>> +            }
>> +            qemu_co_mutex_unlock(&bsc->lock);
>> +        }
>> +
>> +        if (!from_cache) {
>> +            ret = bs->drv->bdrv_co_block_status(bs, want_zero, 
>> aligned_offset,
>> +                                                aligned_bytes, pnum, 
>> &local_map,
>> + &local_file);
>> +
>> +            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID)) {
>
> You do cache the data for any driver that returns DATA | OFFSET_VALID. 
> But it's unused for format drivers (which may return OFFSET_VALID of 
> course).
>
> I think, here should be
>
> if ((ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID)) && 
> QLIST_EMPTY(&bs->children)) {

Actually, I originally had it like this but then was afraid that a 
reviewer would ask me why I check the children list twice, once here and 
once when reading from the cache. :)

So I thought I should check it only once, and the better place to do so 
was where the cache is actually used.

I don’t think it makes much of a difference in practice (setting the 
cache doesn’t really matter if it isn’t used), but perhaps it might make 
the checks in write-zero/discard a bit quicker, because they can return 
early with `valid == false`.

>> + qemu_co_mutex_lock(&bsc->lock);
>> +                bsc->data_start = aligned_offset;
>> +                bsc->data_end = aligned_offset + *pnum;
>> +                bsc->valid = true;
>> +                qemu_co_mutex_unlock(&bsc->lock);
>> +            }
>> +        }
>
>
> Hmm, also, new additions may worth a separate small functions too, so 
> that new object gets a clean API:
>
> bsc_discard()
> bsc_get()
> bsc_set()
>
> or something like this. I don't insist.

Sounds good, will do.

>>       } else {
>>           /* Default code for filters */
>>   @@ -2974,6 +3037,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild 
>> *child, int64_t offset,
>>       int max_pdiscard, ret;
>>       int head, tail, align;
>>       BlockDriverState *bs = child->bs;
>> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>>         if (!bs || !bs->drv || !bdrv_is_inserted(bs)) {
>>           return -ENOMEDIUM;
>> @@ -2997,6 +3061,16 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild 
>> *child, int64_t offset,
>>           return 0;
>>       }
>>   +    /* Invalidate the cached block-status data range if this 
>> discard overlaps */
>> +    qemu_co_mutex_lock(&bsc->lock);
>> +    if (bsc->valid &&
>> +        ranges_overlap(offset, bytes, bsc->data_start,
>> +                       bsc->data_end - bsc->data_start))
>> +    {
>> +        bsc->valid = false;
>> +    }
>> +    qemu_co_mutex_unlock(&bsc->lock);
>> +
>>       /* Discard is advisory, but some devices track and coalesce
>>        * unaligned requests, so we must pass everything down rather than
>>        * round here.  Still, most devices will just silently ignore
>>
>
> Overall, seems good to me.

Great :)

Max


