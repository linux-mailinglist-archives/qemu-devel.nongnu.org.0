Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B1A3AE675
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:48:08 +0200 (CEST)
Received: from localhost ([::1]:59830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGXH-0007o6-7L
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGWJ-00070w-Hw
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGWH-0007LL-Rb
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624268825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pC2MoE/cWx1dUORFdzyoR1hKfv1y2mby70FwuMuTEfQ=;
 b=FDAuBmXes5ruXKBM51LqpiLctAjq6aDbYS+lVVI5n2UQgZ0icdluJnawWyEC80SD/gMdMG
 Bj7J+AaR4uMMZwXwWv0CtLtsX3aeGK7WNG0dCrh9MYuGWBaJS8O9Qh5txlFXGWEgzT4Gd4
 bZKDIPCfwxWGM2xay6FK2harBpN3QCA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-2YYZl7P1MqSfjJNvdz3muQ-1; Mon, 21 Jun 2021 05:47:03 -0400
X-MC-Unique: 2YYZl7P1MqSfjJNvdz3muQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 t11-20020a056402524bb029038ffacf1cafso7477837edd.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pC2MoE/cWx1dUORFdzyoR1hKfv1y2mby70FwuMuTEfQ=;
 b=tTMfT7zomrGIE1sJjujDsSt/bUwRRBaeMJ3KQ3d+w/FFc/SmxGP4R+ZEoeWSqJBamc
 e+OVAAuJVHEQxHZJjb2wdYyTj3M8exIEBzPzABu2NWsPZFjdkzImUTOwvmmOOXBeTOV0
 xYBzheCpsUoU3seNCOHKE2Ww/vzHG+/l62LvQsh3i5b5tnw5blhgzq9P34DBwGJhZptH
 8+FZEJPIWozsUazYuNhT4fOfVhckAcwDguhCflF5D8GggpVMT9P7LcIFnDo+TtPvZ0Bs
 yIs3yLkoIH+Gs+xnZ8yZ6JGI/5sJ5O8UByX9yGiTxqIWNebUQPq+pWpMRzXXop0wB3OE
 cG0w==
X-Gm-Message-State: AOAM532WNNv4AgUwBY9EAPeJ1Ul+NAO5Od9w9/bl5U96wBS3Ubj1yizz
 JlBcJTHezQLKzQ58enWV374TIGLneGE9+lt0li0++1wD+IOEyYGrPGCRyCGz9wKC6LZYx6ZdZ0I
 dxa18mp6Bc7b3X2VcSalrp5FdULM1/Oy0C1b40M2nDGONcYutvkkAD6HsW0hfgEkW
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr15283943edf.193.1624268821916; 
 Mon, 21 Jun 2021 02:47:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvAHMqLOQ7q6DQUg5qkR90kQrnpMmjr9rJSEdbn7LNSP6mfMfAolnaPjRF8Z/6rWgbTuX4OA==
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr15283922edf.193.1624268821687; 
 Mon, 21 Jun 2021 02:47:01 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 n13sm10308473edx.30.2021.06.21.02.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:47:01 -0700 (PDT)
Subject: Re: [PATCH 4/6] block/gluster: Do not force-cap *pnum
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-5-mreitz@redhat.com>
 <2142d5af-6ea0-8161-b183-23b502e2ca05@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <38ef2faa-9107-14da-878f-63bc23f47c25@redhat.com>
Date: Mon, 21 Jun 2021 11:47:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2142d5af-6ea0-8161-b183-23b502e2ca05@virtuozzo.com>
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

On 19.06.21 12:36, Vladimir Sementsov-Ogievskiy wrote:
> 17.06.2021 18:52, Max Reitz wrote:
>> bdrv_co_block_status() does it for us, we do not need to do it here.
>>
>> The advantage of not capping *pnum is that bdrv_co_block_status() can
>> cache larger data regions than requested by its caller.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
>
>> ---
>>   block/gluster.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/block/gluster.c b/block/gluster.c
>> index e8ee14c8e9..8ef7bb18d5 100644
>> --- a/block/gluster.c
>> +++ b/block/gluster.c
>> @@ -1461,7 +1461,8 @@ exit:
>>    * the specified offset) that are known to be in the same
>>    * allocated/unallocated state.
>>    *
>> - * 'bytes' is the max value 'pnum' should be set to.
>> + * 'bytes' is a soft cap for 'pnum'.  If the information is free, 
>> 'pnum' may
>> + * well exceed it.
>>    *
>>    * (Based on raw_co_block_status() from file-posix.c.)
>>    */
>> @@ -1500,12 +1501,12 @@ static int coroutine_fn 
>> qemu_gluster_co_block_status(BlockDriverState *bs,
>>       } else if (data == offset) {
>>           /* On a data extent, compute bytes to the end of the extent,
>>            * possibly including a partial sector at EOF. */
>> -        *pnum = MIN(bytes, hole - offset);
>> +        *pnum = hole - offset;
>>           ret = BDRV_BLOCK_DATA;
>
> Interesting, isn't it a bug that we don't ROUND_UP *pnum to 
> request_alignment here like it is done in file-posix ?

Guess I forgot gluster in 9c3db310ff0 O:)

I don’t think I’ll be able to reproduce it for gluster, but I suppose 
just doing the same thing for gluster should be fine...

Max


