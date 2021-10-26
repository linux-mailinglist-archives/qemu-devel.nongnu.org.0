Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE8F43AE5A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:49:34 +0200 (CEST)
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfI9G-00042r-14
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfI7d-0002nT-S4
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfI7b-00039Y-LZ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635238070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asSzzsBEv19JdaNErniL0a+UPMlY5JfF1RCZqxtm7v0=;
 b=ektXyIQz+brAcHgYuobk9oZ3e1bfF3pviSZStYQu3dVBACvD40jJQxvzSlshi54jHvVBCC
 t7MkTolU2ov68NlaPRzYspg+1tocY7bDipjTsxmls1qY9f8gEK5zNzWiB2y/Mz4De7UWxU
 dhyDERO6WpQawulFtMdv66dSTOvH2eo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-q9FMJ3nMMyankD-F8Y5ZxQ-1; Tue, 26 Oct 2021 04:47:49 -0400
X-MC-Unique: q9FMJ3nMMyankD-F8Y5ZxQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so3762741wrv.19
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 01:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=asSzzsBEv19JdaNErniL0a+UPMlY5JfF1RCZqxtm7v0=;
 b=unIcGK5Ds07t4WV0/70iwWsuQr5dFPVQrBX0Dlfm0Q6XwErQhgacFOXxODE520V67o
 AVswGSP73V8r+GC5wIefCXQ1Cb8qktXrq1Sp1KQWVKLDCxmUO/scZwLtqhcr5AW51cqe
 YiQDCJvWidpt1LLVASA7PgQ7HfobYY8ROlI5OdfOCVROwIz3Xx/mAGWkbfZdMsSBTFSp
 kASXxpQx/p3IG/BdqDhRcPckZjXgwtjZR4E6zYdHjofqdxfLXEpRf8Z2ozfZWoh9dejn
 JeBAJovGEVo4KA1F1cpDQ4gY00XSZp0PE7LrfGBv35t/ATFUw0h29/WkPuddXMhRRtgy
 gGeA==
X-Gm-Message-State: AOAM533jDVWUJyQbqFFkQck0qwkYQ92H8gi6mPO4aepwywA2EuT0CYBB
 d8it6GXkBSnJRwfVeUpefs+kNp5O/JnFKQu5gLbdycYCjLXK8WSqaBLoDiSF5jfF0veQDgQesxv
 lEaxF8hIic0d4J0Q=
X-Received: by 2002:a1c:1b50:: with SMTP id b77mr2425915wmb.23.1635238068391; 
 Tue, 26 Oct 2021 01:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjOh6E/awMMDbchcPwIlraqsEC3lx+Pd7HDI6Z83mc5EhC5mfjoFJFTH7aw9vKtjbhKNCwvg==
X-Received: by 2002:a1c:1b50:: with SMTP id b77mr2425885wmb.23.1635238068048; 
 Tue, 26 Oct 2021 01:47:48 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id i10sm364590wrf.8.2021.10.26.01.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 01:47:47 -0700 (PDT)
Message-ID: <7bb75761-7043-25cc-f05a-b24bcecb7012@redhat.com>
Date: Tue, 26 Oct 2021 10:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/4] qemu-img: implement compare --stat
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
 <20211021101236.1144824-2-vsementsov@virtuozzo.com>
 <f9559937-f077-f8d5-4a5a-2c583c2131f5@redhat.com>
 <e8d99b0a-f46d-1d9d-11a3-5c04de1c3904@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <e8d99b0a-f46d-1d9d-11a3-5c04de1c3904@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 nsoffer@redhat.com, nikita.lapshin@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.21 09:53, Vladimir Sementsov-Ogievskiy wrote:
> 25.10.2021 19:40, Hanna Reitz wrote:
>> On 21.10.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
>>> With new option qemu-img compare will not stop at first mismatch, but
>>> instead calculate statistics: how many clusters with different data,
>>> how many clusters with equal data, how many clusters were unallocated
>>> but become data and so on.
>>>
>>> We compare images chunk by chunk. Chunk size depends on what
>>> block_status returns for both images. It may return less than cluster
>>> (remember about qcow2 subclusters), it may return more than cluster (if
>>> several consecutive clusters share same status). Finally images may
>>> have different cluster sizes. This all leads to ambiguity in how to
>>> finally compare the data.
>>>
>>> What we can say for sure is that, when we compare two qcow2 images with
>>> same cluster size, we should compare clusters with data separately.
>>> Otherwise, if we for example compare 10 consecutive clusters of data
>>> where only one byte differs we'll report 10 different clusters.
>>> Expected result in this case is 1 different cluster and 9 equal ones.
>>>
>>> So, to serve this case and just to have some defined rule let's do the
>>> following:
>>>
>>> 1. Select some block-size for compare procedure. In this commit it must
>>>     be specified by user, next commit will add some automatic logic and
>>>     make --block-size optional.
>>>
>>> 2. Go chunk-by-chunk using block_status as we do now with only one
>>>     differency:
>>>     If block_status() returns DATA region that intersects block-size
>>>     aligned boundary, crop this region at this boundary.
>>>
>>> This way it's still possible to compare less than cluster and report
>>> subcluster-level accuracy, but we newer compare more than one cluster
>>> of data.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   docs/tools/qemu-img.rst |  18 +++-
>>>   qemu-img.c              | 206 
>>> +++++++++++++++++++++++++++++++++++++---
>>>   qemu-img-cmds.hx        |   4 +-
>>>   3 files changed, 212 insertions(+), 16 deletions(-)
>>
>> Looks good to me overall!  Just some technical comments below.
>>
>>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>>> index d58980aef8..21164253d4 100644
>>> --- a/docs/tools/qemu-img.rst
>>> +++ b/docs/tools/qemu-img.rst
>>> @@ -159,6 +159,18 @@ Parameters to compare subcommand:
>>>     Strict mode - fail on different image size or sector allocation
>>> +.. option:: --stat
>>> +
>>> +  Instead of exit on first mismatch compare the whole images and print
>>> +  statistics on amount of different pairs of clusters, based on their
>>> +  block-status and are they equal or not.
>>
>> I’d phrase this as:
>>
>> Instead of exiting on the first mismatch, compare the whole images 
>> and print statistics on how much they differ in terms of block status 
>> (i.e. are blocks allocated or not, do they contain data, are they 
>> marked as containing only zeroes) and block content (a block of data 
>> that contains only zero still has the same content as a marked-zero 
>> block).
>
> For me the rest starting from "and block content" sounds unclear, 
> seems doesn't add any information to previous (i.e. are blocks 
> allocated ...)

By “block content” I meant what you said by “equal or not”, i.e. what is 
returned when reading from the block.

Now that I think about it again, I believe we should go with your 
original “equal or not”, though, because that reflects what qemu-img 
--stat prints, like so perhaps:

Instead of exiting on the first mismatch, compare the whole images and 
print statistics on the amount of different pairs of blocks, based on 
their block status and whether they are equal or not.

I’d still like to add something like what I had in parentheses, though, 
because as a user, I’d find the “block status” and “equal or not” terms 
to be a bit handwave-y.  I don’t think “block status” is a common term 
in our documentation, so I wanted to add some examples; and I wanted to 
show by example that “equal” blocks don’t need to have the same block 
status.

[...]

>>> @@ -1304,6 +1306,107 @@ static int check_empty_sectors(BlockBackend 
>>> *blk, int64_t offset,
>>>       return 0;
>>>   }
>>> +#define IMG_CMP_STATUS_MASK (BDRV_BLOCK_DATA | BDRV_BLOCK_ZERO | \
>>> +                             BDRV_BLOCK_ALLOCATED)
>>> +#define IMG_CMP_STATUS_MAX (IMG_CMP_STATUS_MASK | BDRV_BLOCK_EOF)
>>> +
>>> +typedef struct ImgCmpStat {
>>> +    /* stat: [ret: 0 is equal, 1 is not][status1][status2] -> 
>>> n_bytes */
>>> +    uint64_t stat[2][IMG_CMP_STATUS_MAX + 1][IMG_CMP_STATUS_MAX + 1];
>>
>> `IMG_CMP_STATUS_MAX` isn’t packed tightly because it only has four 
>> bits set (0x33).  That in itself isn’t a problem, but it means that 
>> `IMG_CMP_STATUS_MAX + 1` is 52, and so this array’s size is 52 * 52 * 
>> 2 * sizeof(uint64_t) = 43264.  Again, that isn’t a problem in itself 
>> (although it is a bit sad that this could fit into 16 * 16 * 2 * 8 = 
>> 4 kB), but in `img_compare()` [1], you put this structure on the 
>> stack, and I believe it’s too big for that.
>
> Hmm. May be, it's better just use GHashTables and don't bother with 
> these sparse arrays

Or we could use our own bits here (ALLOCATED = (1 << 2), EOF = (1 << 3)) 
and have a small function that translates BDRV_BLOCK_* values into them.

In any case, I don’t mind the sparseness too much, it’s just that it 
shouldn’t go on the stack.

Hanna


