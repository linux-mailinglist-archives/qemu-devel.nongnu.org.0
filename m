Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AE53B2DDC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:29:28 +0200 (CEST)
Received: from localhost ([::1]:44828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNXz-0003pH-1R
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwNH1-00034a-59
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwNGx-0005Yc-Uy
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624533110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYjfQaJy0qxIpjnZqM620Cnz12tnDafuImhfrNj0s7k=;
 b=CwR9EiM206I/MdxyH3mGi3blErJlvArNZHYNx48jJgfrN27/pPtfjKGySTRw3jxn2c90R8
 hniY9XpY7lVQYYcFaKsXDoi6QlXYNliii2OvWgUvZY0VzNbGwhUb+Vb4yOIfkkvSXiV6ZS
 CBA9ZQnU9OdBp5Ar4HHSiwoqkEGzzgk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-lYmSFf1qPRW1hdqFIMv7jg-1; Thu, 24 Jun 2021 07:11:48 -0400
X-MC-Unique: lYmSFf1qPRW1hdqFIMv7jg-1
Received: by mail-ed1-f72.google.com with SMTP id
 g13-20020a056402090db02903935a4cb74fso3163870edz.1
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 04:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lYjfQaJy0qxIpjnZqM620Cnz12tnDafuImhfrNj0s7k=;
 b=TFoNvfNWxnU8VYhZjcnA5S8/vqeh4N4i9vHcqYVGM5rgzhivPbqMIp4sjvJuisVOeP
 VY+m2Bw9ipCKHhL0W40bcDYdEaastZIqt6ylrtqglISqyzL0g7Hd3yVXRIoXjw/kFkj2
 dtWVRQ68kRoHWufp1r02rp7GUPyjcFJsoy7i3j5ja5khzzWqW3tuXuFdLw8kwm0JLBI6
 BmZ/ZCD+qNJ1eBCy5sS8Vvu/f8uAOQ0zwAr9/znz869frMNJrV05ipnYQrUFbBJ0EUVL
 dNwnVhdVVCZXekcbU99WdQFQdDm/bkwy8gUrXcsSDi8LJAPPUkCNowtf2ox8SWjfdgod
 S53Q==
X-Gm-Message-State: AOAM533E00xvZiBjksIi9asxKT0qdQtX8+Dn3csfw7IaAa9y9wUxZAYW
 CNIWCzzGtLYLl3wcbYBmHIdPSdsxcPronJKH1UPUI+MXMmZYtH661E4FE7T9tDGUWRBtIn511An
 sdkB0K5PteABMV8Y=
X-Received: by 2002:a05:6402:1a38:: with SMTP id
 be24mr6409380edb.243.1624533107139; 
 Thu, 24 Jun 2021 04:11:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi1PuQraX7E49b6lmn3bL/USf8bI5IntMUkIFsDgMsnq2g+xQQLaEYrmMMZQjm0xfnBF5rKw==
X-Received: by 2002:a05:6402:1a38:: with SMTP id
 be24mr6409339edb.243.1624533106798; 
 Thu, 24 Jun 2021 04:11:46 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 du7sm1639273edb.1.2021.06.24.04.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 04:11:46 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] block: block-status cache for data regions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210623150143.188184-1-mreitz@redhat.com>
 <20210623150143.188184-3-mreitz@redhat.com>
 <6796cd47-6a05-69e3-fa75-1fb25d7a6931@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a933812a-1015-d3d1-051c-e5f430fedcc6@redhat.com>
Date: Thu, 24 Jun 2021 13:11:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6796cd47-6a05-69e3-fa75-1fb25d7a6931@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 12:05, Vladimir Sementsov-Ogievskiy wrote:
> 23.06.2021 18:01, Max Reitz wrote:
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
>
> I'm new to RCU, so my review can't be reliable..

Yeah, well, same here. :)

>> ---
>>   include/block/block_int.h | 47 ++++++++++++++++++++++
>>   block.c                   | 84 +++++++++++++++++++++++++++++++++++++++
>>   block/io.c                | 61 ++++++++++++++++++++++++++--
>>   3 files changed, 189 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/block/block_int.h b/include/block/block_int.h
>> index a8f9598102..fcb599dd1c 100644
>> --- a/include/block/block_int.h
>> +++ b/include/block/block_int.h
>> @@ -832,6 +832,22 @@ struct BdrvChild {
>>       QLIST_ENTRY(BdrvChild) next_parent;
>>   };
>>   +/*
>> + * Allows bdrv_co_block_status() to cache one data region for a
>> + * protocol node.
>> + *
>> + * @valid: Whether the cache is valid (should be accessed with atomic
>> + *         functions so this can be reset by RCU readers)
>> + * @data_start: Offset where we know (or strongly assume) is data
>> + * @data_end: Offset where the data region ends (which is not 
>> necessarily
>> + *            the start of a zeroed region)
>> + */
>> +typedef struct BdrvBlockStatusCache {
>> +    bool valid;
>> +    int64_t data_start;
>> +    int64_t data_end;
>> +} BdrvBlockStatusCache;
>> +
>>   struct BlockDriverState {
>>       /* Protected by big QEMU lock or read-only after opening. No 
>> special
>>        * locking needed during I/O...
>> @@ -997,6 +1013,11 @@ struct BlockDriverState {
>>         /* BdrvChild links to this node may never be frozen */
>>       bool never_freeze;
>> +
>> +    /* Lock for block-status cache RCU writers */
>> +    CoMutex bsc_modify_lock;
>> +    /* Always non-NULL, but must only be dereferenced under an RCU 
>> read guard */
>> +    BdrvBlockStatusCache *block_status_cache;>   };
>>     struct BlockBackendRootState {
>> @@ -1422,4 +1443,30 @@ static inline BlockDriverState 
>> *bdrv_primary_bs(BlockDriverState *bs)
>>    */
>>   void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
>>   +/**
>> + * Check whether the given offset is in the cached block-status data
>> + * region.
>> + *
>> + * If it is, and @pnum is not NULL, *pnum is set to
>> + * `bsc.data_end - offset`, i.e. how many bytes, starting from
>> + * @offset, are data (according to the cache).
>> + * Otherwise, *pnum is not touched.
>> + */
>> +bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t 
>> *pnum);
>> +
>> +/**
>> + * If [offset, offset + bytes) overlaps with the currently cached
>> + * block-status region, invalidate the cache.
>> + *
>> + * (To be used by I/O paths that cause data regions to be zero or
>> + * holes.)
>> + */
>> +void bdrv_bsc_invalidate_range(BlockDriverState *bs,
>> +                               int64_t offset, int64_t bytes);
>> +
>> +/**
>> + * Mark the range [offset, offset + bytes) as a data region.
>> + */
>> +void bdrv_bsc_fill(BlockDriverState *bs, int64_t offset, int64_t 
>> bytes);
>> +
>>   #endif /* BLOCK_INT_H */
>> diff --git a/block.c b/block.c
>> index 3f456892d0..9ab9459f7a 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -49,6 +49,8 @@
>>   #include "qemu/timer.h"
>>   #include "qemu/cutils.h"
>>   #include "qemu/id.h"
>> +#include "qemu/range.h"
>> +#include "qemu/rcu.h"
>>   #include "block/coroutines.h"
>>     #ifdef CONFIG_BSD
>> @@ -398,6 +400,9 @@ BlockDriverState *bdrv_new(void)
>>         qemu_co_queue_init(&bs->flush_queue);
>>   +    qemu_co_mutex_init(&bs->bsc_modify_lock);
>> +    bs->block_status_cache = g_new0(BdrvBlockStatusCache, 1);
>> +
>>       for (i = 0; i < bdrv_drain_all_count; i++) {
>>           bdrv_drained_begin(bs);
>>       }
>> @@ -4635,6 +4640,8 @@ static void bdrv_close(BlockDriverState *bs)
>>       bs->explicit_options = NULL;
>>       qobject_unref(bs->full_open_options);
>>       bs->full_open_options = NULL;
>> +    g_free(bs->block_status_cache);
>> +    bs->block_status_cache = NULL;
>>         bdrv_release_named_dirty_bitmaps(bs);
>>       assert(QLIST_EMPTY(&bs->dirty_bitmaps));
>> @@ -7590,3 +7597,80 @@ BlockDriverState 
>> *bdrv_backing_chain_next(BlockDriverState *bs)
>>   {
>>       return bdrv_skip_filters(bdrv_cow_bs(bdrv_skip_filters(bs)));
>>   }
>> +
>> +/**
>> + * Check whether [offset, offset + bytes) overlaps with the cached
>> + * block-status data region.
>> + *
>> + * If so, and @pnum is not NULL, set *pnum to `bsc.data_end - offset`,
>> + * which is what bdrv_bsc_is_data()'s interface needs.
>> + * Otherwise, *pnum is not touched.
>> + */
>> +static bool bdrv_bsc_range_overlaps_locked(BlockDriverState *bs,
>> +                                           int64_t offset, int64_t 
>> bytes,
>> +                                           int64_t *pnum)
>> +{
>> +    BdrvBlockStatusCache *bsc = bs->block_status_cache;
>
> Shouldn't use qatomic_rcu_read() ?

Oh, right, probably so.

>
>> +    bool overlaps;
>> +
>> +    overlaps =
>> +        qatomic_read(&bsc->valid) &&
>
> Hmm. Why you need atomic access? I thought that after getting rcu 
> pointer, we are safe to read the fields.
>
> Ah, I see, you want to also set it in rcu-reader code..
>
> Isn't it better just to do normal rcu-write and set pointer to NULL, 
> when cache becomes invalid? I think keeping heap-allocated structure 
> with valid=false inside doesn't make much sense.

It does, because this way I don’t need an expensive RCU write.

>> +        ranges_overlap(offset, bytes, bsc->data_start,
>> +                       bsc->data_end - bsc->data_start);
>> +
>> +    if (overlaps && pnum) {
>> +        *pnum = bsc->data_end - offset;
>> +    }
>> +
>> +    return overlaps;
>> +}
>> +
>> +/**
>> + * See block_int.h for this function's documentation.
>> + */
>> +bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t 
>> *pnum)
>> +{
>> +    bool overlaps;
>> +
>> +    WITH_RCU_READ_LOCK_GUARD() {
>> +        overlaps = bdrv_bsc_range_overlaps_locked(bs, offset, 1, pnum);
>> +    }
>> +
>> +    return overlaps;
>> +}
>
> this may be written simpler I think:
>
> RCU_READ_LOCK_GUARD();
> return bdrv_bsc_range_overlaps_locked(..);

Hm, I’ll see whether it grows on me.  I kind of like the explicit scope, 
even if it’s longer.

>> +
>> +/**
>> + * See block_int.h for this function's documentation.
>> + */
>> +void bdrv_bsc_invalidate_range(BlockDriverState *bs,
>> +                               int64_t offset, int64_t bytes)
>> +{
>> +    WITH_RCU_READ_LOCK_GUARD() {
>> +        if (bdrv_bsc_range_overlaps_locked(bs, offset, bytes, NULL)) {
>> + qatomic_set(&bs->block_status_cache->valid, false);
>> +        }
>> +    }
>> +}
>
> Same here, why not use RCU_READ_LOCK_GUARD() ?
>
>> +
>> +/**
>> + * See block_int.h for this function's documentation.
>> + */
>> +void bdrv_bsc_fill(BlockDriverState *bs, int64_t offset, int64_t bytes)
>> +{
>> +    BdrvBlockStatusCache *new_bsc = g_new(BdrvBlockStatusCache, 1);
>> +    BdrvBlockStatusCache *old_bsc;
>> +
>> +    *new_bsc = (BdrvBlockStatusCache) {
>> +        .valid = true,
>> +        .data_start = offset,
>> +        .data_end = offset + bytes,
>> +    };
>> +
>> +    WITH_QEMU_LOCK_GUARD(&bs->bsc_modify_lock) {
>> +        old_bsc = bs->block_status_cache;
>> +        qatomic_rcu_set(&bs->block_status_cache, new_bsc);
>> +        synchronize_rcu();
>
> Interesting, that until this, synchronize_rcu() is used only in 
> tests.. (I tried to search examples of rcu writing in the code)

Well, as far as I understood the docs, synchronize_rcu() is a thing that 
can be used, besides call_rcu().  I didn’t want to use call_rcu(), 
because it requires adding an rcu_head struct to the protected object...

Now that I look closer at the docs, it says "it is better" to release 
all locks before synchronize_rcu(), including the BQL. Perhaps I should 
give call_rcu() a try after all.

Max

>
>
>> +    }
>> +
>> +    g_free(old_bsc);
>> +}
>> diff --git a/block/io.c b/block/io.c
>> index 323854d063..85fa449bf9 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -1878,6 +1878,9 @@ static int coroutine_fn 
>> bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>>           return -ENOTSUP;
>>       }
>>   +    /* Invalidate the cached block-status data range if this write 
>> overlaps */
>> +    bdrv_bsc_invalidate_range(bs, offset, bytes);
>> +
>>       assert(alignment % bs->bl.request_alignment == 0);
>>       head = offset % alignment;
>>       tail = (offset + bytes) % alignment;
>> @@ -2442,9 +2445,58 @@ static int coroutine_fn 
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
>> +            if (bdrv_bsc_is_data(bs, aligned_offset, pnum)) {
>> +                ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
>> +                local_file = bs;
>> +                local_map = aligned_offset;
>> +
>> +                from_cache = true;
>> +            }
>> +        }
>> +
>> +        if (!from_cache) {
>> +            ret = bs->drv->bdrv_co_block_status(bs, want_zero, 
>> aligned_offset,
>> +                                                aligned_bytes, pnum, 
>> &local_map,
>> + &local_file);
>> +
>> +            /*
>> +             * Note that checking QLIST_EMPTY(&bs->children) is also 
>> done when
>> +             * the cache is queried above.  Technically, we do not 
>> need to check
>> +             * it here; the worst that can happen is that we fill 
>> the cache for
>> +             * non-protocol nodes, and then it is never used. 
>> However, filling
>> +             * the cache requires an RCU update, so double check 
>> here to avoid
>> +             * such an update if possible.
>> +             */
>> +            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID) &&
>> +                QLIST_EMPTY(&bs->children))
>> +            {
>> +                bdrv_bsc_fill(bs, aligned_offset, *pnum);
>> +            }
>> +        }
>>       } else {
>>           /* Default code for filters */
>>   @@ -2997,6 +3049,9 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild 
>> *child, int64_t offset,
>>           return 0;
>>       }
>>   +    /* Invalidate the cached block-status data range if this 
>> discard overlaps */
>> +    bdrv_bsc_invalidate_range(bs, offset, bytes);
>> +
>>       /* Discard is advisory, but some devices track and coalesce
>>        * unaligned requests, so we must pass everything down rather than
>>        * round here.  Still, most devices will just silently ignore
>>
>
>


