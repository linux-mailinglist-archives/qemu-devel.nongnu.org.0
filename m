Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF938B2AA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:10:49 +0200 (CEST)
Received: from localhost ([::1]:41598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkK0-0002c3-L5
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljkG4-00056X-Mr
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljkG2-0005xS-3V
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621523201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6tYEV2Mc2fc2q/huX6i80uJcf7jbq2xkGbavv6dGgA=;
 b=LT64tleUUdBcgGxIoxNqV+zXfAcQViBIooUnVSPJni6uPUcP6IvIbvqP6FNg/IE1I/PTPQ
 aoWPlJwdd7PJ/LPaqU6wsMGtvJ23QCrm8/c1N5zjRsJu0/47UHtTz+lqWADdP0L1t2JaCh
 DYAhaE17C8owYOUWMOzVsenv92OSiAE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Xtw23M0ePPKDPKejLXMBKw-1; Thu, 20 May 2021 11:06:37 -0400
X-MC-Unique: Xtw23M0ePPKDPKejLXMBKw-1
Received: by mail-wr1-f70.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so8760434wri.1
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c6tYEV2Mc2fc2q/huX6i80uJcf7jbq2xkGbavv6dGgA=;
 b=QAvMkt6AzpV44xJmDr+uP/Tk+70dM9M4wDE6dfGE25nb/cq3jr0kEI0o1+OkhRYcaW
 yaSXDGHs2HgboL7de0UMJBIla9FQk88b2OXAFtHEAcgeR575O1ye6HmADifNmipjfPn1
 cu638N6zlHIbPfOfcL7IW7UDmvmAYaFI0+MLJj0IDde0IpHXh6RueJlfwbTO3Wwi71qn
 qOcUZBSz7HZXw1NNQ3UsE5QUpY9qoXku1CdeDMf6hwiuKAvQNPwykpMEUkzFKp0WqTA0
 HeA6ESzFIlh9SmpA2EsP9hgLMoZE8cVLgCBM6Jwl0eYmVogDpWKa1TwKghUMDOevrM4V
 bDmA==
X-Gm-Message-State: AOAM532RfHTwaqcnSmzXTBo2PGBRHkAkTc6KQj18OEYbzekmETuvMA/0
 5GGdCo8AY7H2pWSWZJHnbZ3pqfHbzKTZMEZ/yn/q/2J1m/8yArCkMrqe8MPMSJNRtprTzjipdtG
 dbibZtXURPhXg0ogrKXYF2unHlMWvDQXuciToKiRSKsUlsySZUOVHMdcI7OiJUifL4l0=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr4832260wrd.407.1621523196337; 
 Thu, 20 May 2021 08:06:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4MXCx+jQppSCI9Q1YqZEas9v+hBAxLyvu0Q/95RbfKxN/euCWokNrL83zXNWthoHlWHFouA==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr4832198wrd.407.1621523195820; 
 Thu, 20 May 2021 08:06:35 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 t17sm3365695wrp.89.2021.05.20.08.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 08:06:35 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-2-eesposit@redhat.com>
 <f5069a9d-cd23-26cf-c1cb-6f4f5774e48d@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <a2964e8e-f452-8bd7-3bdb-0a8e963430a3@redhat.com>
Date: Thu, 20 May 2021 17:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f5069a9d-cd23-26cf-c1cb-6f4f5774e48d@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 20/05/2021 16:42, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Put the logic to determine the copy size in a separate function, so
>> that there is a simple state machine for the possible methods of
>> copying data from one BlockDriverState to the other.
> 
> Honestly, for me 4-state state-maching + function to determine copy-size 
> doesn't seem better than two simple variables copy_size and use_copy_range.
> 
> What's the benefit of it?

It helps having a single field (method) instead of two (use_copy_range, 
copy_size), especially if we need to take care of protecting it for 
concurrent access. See patch 7.
> 
>>
>> While at it, store the common computation of block_copy_max_transfer
>> into a new field of BlockCopyState, and make sure that we always
>> obey max_transfer; that's more efficient even for the
>> COPY_RANGE_READ_WRITE case.
> 
> hmm, maybe. It could be a separate patch.
> 
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   block/block-copy.c | 59 ++++++++++++++++++++++++++++++----------------
> 
> stats agree with me, that its' not a simplification.
> 
>>   1 file changed, 39 insertions(+), 20 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index 37c8e8504b..10ce51a244 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -28,6 +28,13 @@
>>   #define BLOCK_COPY_MAX_WORKERS 64
>>   #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
>> +typedef enum {
>> +    COPY_READ_WRITE_CLUSTER,
>> +    COPY_READ_WRITE,
>> +    COPY_RANGE_SMALL,
>> +    COPY_RANGE_FULL
>> +} BlockCopyMethod;
>> +
>>   static coroutine_fn int block_copy_task_entry(AioTask *task);
>>   typedef struct BlockCopyCallState {
>> @@ -85,8 +92,8 @@ typedef struct BlockCopyState {
>>       BdrvDirtyBitmap *copy_bitmap;
>>       int64_t in_flight_bytes;
>>       int64_t cluster_size;
>> -    bool use_copy_range;
>> -    int64_t copy_size;
>> +    BlockCopyMethod method;
>> +    int64_t max_transfer;
>>       uint64_t len;
>>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all 
>> block-copy calls */
>>       QLIST_HEAD(, BlockCopyCallState) calls;
>> @@ -148,6 +155,23 @@ static bool coroutine_fn 
>> block_copy_wait_one(BlockCopyState *s, int64_t offset,
>>       return true;
>>   }
>> +static inline int64_t block_copy_chunk_size(BlockCopyState *s)
> 
> "inline" word does nothing in static definitions in c files. Compiler 
> make a decision independently of it.

Typo
> 
>> +{
>> +    switch (s->method) {
>> +    case COPY_READ_WRITE_CLUSTER:
>> +        return s->cluster_size;
>> +    case COPY_READ_WRITE:
>> +    case COPY_RANGE_SMALL:
>> +        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER),
>> +                   s->max_transfer);
>> +    case COPY_RANGE_FULL:
>> +        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
>> +                   s->max_transfer);
>> +    default:
>> +        abort();
>> +    }
>> +}
>> +
>>   /*
>>    * Search for the first dirty area in offset/bytes range and create 
>> task at
>>    * the beginning of it.
>> @@ -157,8 +181,9 @@ static BlockCopyTask 
>> *block_copy_task_create(BlockCopyState *s,
>>                                                int64_t offset, int64_t 
>> bytes)
>>   {
>>       BlockCopyTask *task;
>> -    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, 
>> call_state->max_chunk);
>> +    int64_t max_chunk = block_copy_chunk_size(s);
>> +    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
>>       if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
>>                                              offset, offset + bytes,
>>                                              max_chunk, &offset, &bytes))
>> @@ -265,28 +290,27 @@ BlockCopyState *block_copy_state_new(BdrvChild 
>> *source, BdrvChild *target,
>>           .len = bdrv_dirty_bitmap_size(copy_bitmap),
>>           .write_flags = write_flags,
>>           .mem = shres_create(BLOCK_COPY_MAX_MEM),
>> +        .max_transfer = 
>> QEMU_ALIGN_DOWN(block_copy_max_transfer(source, target)
>> +                                        , cluster_size),
>>       };
>> -    if (block_copy_max_transfer(source, target) < cluster_size) {
>> +    if (s->max_transfer < cluster_size) {
>>           /*
>>            * copy_range does not respect max_transfer. We don't want 
>> to bother
>>            * with requests smaller than block-copy cluster size, so 
>> fallback to
>>            * buffered copying (read and write respect max_transfer on 
>> their
>>            * behalf).
>>            */
>> -        s->use_copy_range = false;
>> -        s->copy_size = cluster_size;
>> +        s->method = COPY_READ_WRITE_CLUSTER;
>>       } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
>>           /* Compression supports only cluster-size writes and no 
>> copy-range. */
>> -        s->use_copy_range = false;
>> -        s->copy_size = cluster_size;
>> +        s->method = COPY_READ_WRITE_CLUSTER;
>>       } else {
>>           /*
>>            * We enable copy-range, but keep small copy_size, until first
>>            * successful copy_range (look at block_copy_do_copy).
>>            */
>> -        s->use_copy_range = use_copy_range;
>> -        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
>> +        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
>>       }
>>       ratelimit_init(&s->rate_limit);
>> @@ -369,30 +393,25 @@ static int coroutine_fn 
>> block_copy_do_copy(BlockCopyState *s,
>>           return ret;
>>       }
>> -    if (s->use_copy_range) {
>> +    if (s->method >= COPY_RANGE_SMALL) {
> 
> I don't like such condition:
> 1. it forces me to go to enum definition to understand the logic
> 2. it's error prone: it's very possibly to forget to update it, when 
> updating the enum, and logic will be broken.
> 
> No, I don't like moving to state machine for this simple thing.
> 
>>           ret = bdrv_co_copy_range(s->source, offset, s->target, 
>> offset, nbytes,
>>                                    0, s->write_flags);
>>           if (ret < 0) {
>>               trace_block_copy_copy_range_fail(s, offset, ret);
>> -            s->use_copy_range = false;
>> -            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
>> +            s->method = COPY_READ_WRITE;
>>               /* Fallback to read+write with allocated buffer */
>>           } else {
>> -            if (s->use_copy_range) {
>> +            if (s->method == COPY_RANGE_SMALL) {
>>                   /*
>>                    * Successful copy-range. Now increase copy_size.  
>> copy_range
>>                    * does not respect max_transfer (it's a TODO), so 
>> we factor
>>                    * that in here.
>>                    *
>> -                 * Note: we double-check s->use_copy_range for the 
>> case when
>> +                 * Note: we double-check s->method for the case when
>>                    * parallel block-copy request unsets it during 
>> previous
>>                    * bdrv_co_copy_range call.
>>                    */
>> -                s->copy_size =
>> -                        MIN(MAX(s->cluster_size, 
>> BLOCK_COPY_MAX_COPY_RANGE),
>> -                            
>> QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
>> -                                                                    
>> s->target),
>> -                                            s->cluster_size));
>> +                s->method = COPY_RANGE_FULL;
>>               }
>>               goto out;
>>           }
>>
> 
> 


