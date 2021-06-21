Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF03AE62B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:39:45 +0200 (CEST)
Received: from localhost ([::1]:53256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGPA-0002vT-Qi
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGMz-0001Lq-G4
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGMx-0001Tn-2m
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624268246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLwUSQGIcI4ktVf8cQxfWM8OJ0F6DlbIF192RYzg6bo=;
 b=Ftd1LbmfBaXL+6jhusmrxo2i8KWOJ6YmDiV9jL1DaZ6og2yVhPznFn/ULooVBhW2rMmxhZ
 fZd6aAwwOqISFq0uvOV1XdLAbHEdJCeqY2yNRpmJ0z/yssbI5a1RxvHn1KySe/H6ZZ7vAX
 HTesa2KaTJCHTszt9umjTALRdMWPcXA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-ualicEJKMoCnE0SvOOhTWw-1; Mon, 21 Jun 2021 05:37:24 -0400
X-MC-Unique: ualicEJKMoCnE0SvOOhTWw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i19-20020a05640200d3b02903948b71f25cso5388606edu.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NLwUSQGIcI4ktVf8cQxfWM8OJ0F6DlbIF192RYzg6bo=;
 b=PaFGPa21OslOeI/YR+ikNYFqHFT6Vev6Sr+sQ1UI5k08Th+HVnf32LyPiLcfaM3GYJ
 WaOgoUDFVAmVSwrOASyLwcdP9Lgt9Nwl/9cTT4eeqgbSFX9SQAyIUmHvDlVKQWcIEPC1
 awt525kwLCyrMuv1hV79RtwunAZO8jyMWv6XWqVJY1GfLArz2GUcjxhoqTCF5vzy1XxO
 ZgACun9o25ku2h+TmAr++GNgmpIc8JmQE+0UFeUoH8SSyppg8t4yzoT2f7A70Ro3I3x/
 Tb9hwGcwW4Lntmoqmo/rizpvmYv8seU4lUsrX4DDk360elbGFnGIkqrg1KWy8X61Nhwu
 wSPg==
X-Gm-Message-State: AOAM5326wFZFYvcdViLukCV7LxgTvgzreSv5lOTd4IpDSL4cWja+Tv+Q
 OYLz29zsY57N8eX1J9YaAua/d87NKrsXRx7lRS4k5FN6HtbxiQTPeIq/uqXSyPW/ZeIW6TkGp4E
 tTyNKxlNq2zrHW0Um/Q1Whe5NBaEyLOEIiHOeKuQYL3S7AH3BFFn4oFkNl8u3RVZH
X-Received: by 2002:a17:906:3c56:: with SMTP id
 i22mr23952912ejg.369.1624268243501; 
 Mon, 21 Jun 2021 02:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR/rIfvr8MVj9uAN47fj9w3tEMOxFuxcOJNN4P64gVzGFGfbRDGZDDedLfAYCyO7vcAhNu4Q==
X-Received: by 2002:a17:906:3c56:: with SMTP id
 i22mr23952891ejg.369.1624268243204; 
 Mon, 21 Jun 2021 02:37:23 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 w17sm10355819edd.44.2021.06.21.02.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:37:22 -0700 (PDT)
Subject: Re: [PATCH 2/6] block: block-status cache for data regions
To: Eric Blake <eblake@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-3-mreitz@redhat.com>
 <20210618185105.ibhk4rwtsp7os7he@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f0d4eed8-a269-a0bd-51ed-0f9517225588@redhat.com>
Date: Mon, 21 Jun 2021 11:37:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618185105.ibhk4rwtsp7os7he@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.06.21 20:51, Eric Blake wrote:
> On Thu, Jun 17, 2021 at 05:52:43PM +0200, Max Reitz wrote:
>> To address this, we want to cache data regions.  Most of the time, when
>> bad performance is reported, it is in places where the image is iterated
>> over from start to end (qemu-img convert or the mirror job), so a simple
>> yet effective solution is to cache only the current data region.
> Here's hoping third time's the charm!

Indeed :)

>> (Note that only caching data regions but not zero regions means that
>> returning false information from the cache is not catastrophic: Treating
>> zeroes as data is fine.  While we try to invalidate the cache on zero
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
>>   include/block/block_int.h | 19 ++++++++++
>>   block.c                   |  2 +
>>   block/io.c                | 80 +++++++++++++++++++++++++++++++++++++--
>>   3 files changed, 98 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/block/block_int.h b/include/block/block_int.h
>> index a8f9598102..c09512556a 100644
>> --- a/include/block/block_int.h
>> +++ b/include/block/block_int.h
>> @@ -832,6 +832,23 @@ struct BdrvChild {
>>       QLIST_ENTRY(BdrvChild) next_parent;
>>   };
>>   
>> +/*
>> + * Allows bdrv_co_block_status() to cache one data region for a
>> + * protocol node.
>> + *
>> + * @lock: Lock for accessing this object's fields
>> + * @valid: Whether the cache is valid
>> + * @data_start: Offset where we know (or strongly assume) is data
>> + * @data_end: Offset where the data region ends (which is not necessarily
>> + *            the start of a zeroed region)
>> + */
>> +typedef struct BdrvBlockStatusCache {
>> +    CoMutex lock;
>> +    bool valid;
>> +    int64_t data_start;
>> +    int64_t data_end;
>> +} BdrvBlockStatusCache;
> Looks like the right bits of information, and I'm glad you documented
> the need to be prepared for protocols that report split data sections
> rather than consolidated.
>
>> +++ b/block/io.c
>> @@ -35,6 +35,7 @@
>>   #include "qapi/error.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/main-loop.h"
>> +#include "qemu/range.h"
>>   #include "sysemu/replay.h"
>>   
>>   /* Maximum bounce buffer for copy-on-read and write zeroes, in bytes */
>> @@ -1862,6 +1863,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>>       bool need_flush = false;
>>       int head = 0;
>>       int tail = 0;
>> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>>   
>>       int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
>>       int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
>> @@ -1878,6 +1880,16 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>>           return -ENOTSUP;
>>       }
>>   
>> +    /* Invalidate the cached block-status data range if this write overlaps */
>> +    qemu_co_mutex_lock(&bsc->lock);
> Are we going to be suffering from a lot of lock contention performance
> degradation?  Is there a way to take advantage of RCU access patterns
> for any more performance without sacrificing correctness?

The critical section is so short that I considered it fine.  I wanted to 
use RW locks, but then realized that every RW lock operation is 
internally locked by another mutex, so it wouldn’t gain anything.

I’m not sure whether RCU is worth it here.

We could try something very crude, namely to just not take a lock and 
make `valid` an atomic.  After all, it doesn’t really matter whether 
`data_start` and `data_end` are consistent values, and resetting `valid` 
to false is always safe.

The worst that could happen is that a concurrent block-status call tries 
to set up an overlapping data area, which we thus fail to recognize 
here.  But if such a thing were to happen, it could just as well happen 
before said concurrent call took any lock on `bsc`.

>> +    if (bsc->valid &&
>> +        ranges_overlap(offset, bytes, bsc->data_start,
>> +                       bsc->data_end - bsc->data_start))
>> +    {
>> +        bsc->valid = false;
>> +    }
> Do we want to invalidate the entire bsc, or can we be smart and leave
> the prefix intact (if offset > bsc->data_start, then set bsc->data_end
> to offset)?

Perhaps we could be smart, but I don’t think it really makes a 
difference in practice, so I think keeping it simple is better.

>> +    qemu_co_mutex_unlock(&bsc->lock);
> Worth using WITH_QEMU_LOCK_GUARD?

I knew I forgot something, right.  Will use!

Max


