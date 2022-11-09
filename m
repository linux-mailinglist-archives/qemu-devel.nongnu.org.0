Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F1622B7D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osk7n-0002XO-D8; Wed, 09 Nov 2022 07:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1osk7k-0002VW-P6
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:24:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1osk7i-0008Tk-T1
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667996646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVQ1eIEvSIZrwDWpr5MUC0KOACUmxYv5g13MYNaqCms=;
 b=SbcuQ7s6Rtyl/4Z7kU5gIrsM8nxOiwzMHYMptZ6/QM8E6Y6yVJOb4Q8jOayt/B9J+QKRwE
 l48z4d32E7IgAnZycYIRRNqmM1fhwlHtsYj72FOwgp60KgmGoblKBP4ZZX3LQo/1oMl0t2
 7vyKkqzCVsgjqAJ0in5jNqRWJR7inCw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-L2u0BOIzP-eTuP4RWnY_-Q-1; Wed, 09 Nov 2022 07:24:05 -0500
X-MC-Unique: L2u0BOIzP-eTuP4RWnY_-Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 v12-20020ac8578c000000b003a50eb13e29so12310226qta.3
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 04:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pVQ1eIEvSIZrwDWpr5MUC0KOACUmxYv5g13MYNaqCms=;
 b=4YWqTXqRhWPel5YXFdxuawkMkK7zWsNx9tFNng+4j9KYx+o+V+logRWi3Z40o/IW34
 on67+hvQqkg12zqSmWtg1Pz5koOoJRVOXtS/j6I4FduUwhg3Zr3+kZfEkIMjTE0IfcWc
 AbTnT/SKAnFVCV78Uj5mavJI33Ade6Tmm3EotQUNQ/U3yspX0BNve84+ZEd4kk1iwlEv
 k4O18OTF2CQq+Ke+NG2VnRKuQAlC4xmI5jU7ZLMCpPZrJaRUODPl/oox0+Aq5D6doxXk
 8B/WtAQwNNAcEjYkLRIpxnMXCghWIOG4vqasKZNunH1k1JKovdQb4ZysHYiJydY43QDE
 mUQg==
X-Gm-Message-State: ACrzQf1bwFmOJ79wfaVYiwkVBY7AztbUTHwC1zEtu7y/od3rsv9QTc3w
 IYJ3GgbafEYurzcQY2oB7000BfPyDir8EeKx84faMGHdD9+oQEaXZxQSVHQgNnHmWOtepP1qokj
 gPMc5S+q1pawFSwg=
X-Received: by 2002:ac8:46d0:0:b0:3a5:700a:7161 with SMTP id
 h16-20020ac846d0000000b003a5700a7161mr19450907qto.278.1667996644526; 
 Wed, 09 Nov 2022 04:24:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5T+lR7DPToVfJungzBzVUtiJqsV+M9DP75LQr29QV0EWaVNX3E7LQ81oOh+LwhJQwDl0r6Zw==
X-Received: by 2002:ac8:46d0:0:b0:3a5:700a:7161 with SMTP id
 h16-20020ac846d0000000b003a5700a7161mr19450885qto.278.1667996644221; 
 Wed, 09 Nov 2022 04:24:04 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a05620a0b5700b006bb78d095c5sm10989719qkg.79.2022.11.09.04.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 04:24:03 -0800 (PST)
Message-ID: <460d096e-c642-166c-a4fd-77f953bfe33a@redhat.com>
Date: Wed, 9 Nov 2022 13:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-3-eesposit@redhat.com>
 <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
 <88f02d19-84d8-d1a7-4250-416fd32f1435@redhat.com>
 <711f6d68-888e-bca0-972e-a05503a039c5@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <711f6d68-888e-bca0-972e-a05503a039c5@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 08/11/2022 um 17:19 schrieb Vladimir Sementsov-Ogievskiy:
> [add Stefan]
> 
> 
> On 11/8/22 18:09, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 08/11/2022 um 15:48 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 11/4/22 12:56, Emanuele Giuseppe Esposito wrote:
>>>> These functions end up calling bdrv_common_block_status_above(), a
>>>> generated_co_wrapper function.
>>>
>>> generated_co_wrapper is not a coroutine_fn. Сonversely it's a function
>>> that do a class coroutine wrapping - start a coroutine and do POLL to
>>> wait for the coroutine to finish.
>>>
>>>> In addition, they also happen to be always called in coroutine context,
>>>> meaning all callers are coroutine_fn.
>>>
>>> That's also not a reason for marking them coroutine_fn. "coroutine_fn"
>>> means that the function can be called only from coroutine context.
>>>
>>>> This means that the g_c_w function will enter the qemu_in_coroutine()
>>>> case and eventually suspend (or in other words call
>>>> qemu_coroutine_yield()).
>>>> Therefore we need to mark such functions coroutine_fn too.
>>>
>>> I don't think so. Moreover, this breaks the concept, as your new
>>> coroutine_fn functions will call generated_co_wrapper functions which
>>> are not marked coroutine_fn and never was.
>>
>> Theoretically not, 
> 
> Agree, I was wrong in this point
> 
>> because marking it coroutine_fn we know that we are
>> going in the if(qemu_in_coroutine()) branch of the g_c_w, so we could
>> directly replace it with the actual function. Because it's a pain to do
>> it with hand, and at some point I/someone should use Alberto static
>> analyzer to get rid of that, I decided to leave g_c_w there.
>>
>> As I understand it, it seems that you and Paolo have a different
>> understanding on what coroutine_fn means and where it should be used.
> 
> Looks so...
> 
> But we have a documentation in coroutine.h, let's check:
> 
>  * Mark a function that executes in coroutine context
>  *
>  * Functions that execute in coroutine context cannot be called directly
> from
>  * normal functions.  In the future it would be nice to enable compiler or
>  * static checker support for catching such errors.  This annotation
> might make
>  * it possible and in the meantime it serves as documentation.
> 
> Not very clear, but still it say:
> 
>  coroutine_fn = "function that executes in coroutine context"
>  "functions that execute in coroutine context"  =  "cannot be called
> directly from normal functions"
> 
> So, IMHO that corresponds to my point of view: we shouldn't mark by
> coroutine_fn functions that can be called from both coroutine context
> and not.

Yes and the point is that these functions are not called by
non-coroutine context.

> 
> If we want to change the concept, we should start with rewriting this
> documentation.
> 
>> Honestly I don't understand your point, as you said
>>
>>> "coroutine_fn"
>>> means that the function can be called only from coroutine context.
>>
>> which is the case for these functions. So could you please clarify?
>>
>> What I do know is that it's extremely confusing to understand if a
>> function that is *not* marked as coroutine_fn is actually being called
>> also from coroutines or not.
>>
>> Which complicates A LOT whatever change or operation I want to perform
>> on the BlockDriver callbacks or any other function in the block layer,
>> because in the current approach for the AioContext lock removal (which
>> you are not aware of, I understand) we need to distinguish between
>> functions running in coroutine context and not, and throwing g_c_w
>> functions everywhere makes my work much harder that it already is.
> 
> OK, I understand the problem.
> 
> Hmm. Formally marking by "coroutine_fn" a function that theoretically
> can be called from any context doesn't break things. We just say that
> since that moment we don't allow to call this function from
> non-coroutine context.
> 
> OK, I tend to agree that you are on the right way, sorry for my skepticism)
> 
> PS: you recently introduced a lot of IO_CODE() / GLOBAL_STATE_CODE()
> marks, which (will be/already) turned into assertions.
> 
> This is a lot better than our "coroutine_fn" sign, which actually do no
> check (and can't do). Don't you plan to swap a "coroutine_fn" noop
> marker with more meaningful IN_COROUTINE(); (or something like this,
> which just do assert(qemu_in_coroutine())) at start of the function? It
> would be a lot safer.

CCing also Alberto and Paolo

So basically I think what we need is something that scans the whole
block layer code and puts the right coroutine_fn annotations (or
assertions, if you want) in the right places.

The rule should be (anyone please correct me if I am wrong):
- if a function is only called by coroutine_fn functions, then it's a
coroutine_fn. Theoretically all these functions should eventually end up
calling qemu_coroutine_yield or similar.

- if it's called only from non-coroutine, then leave it as it is.
Probably asserting is a good idea.

- if it's used by both, then it's a case-by-case decision: I think for
simple functions, we can use a special annotation and document that they
should always consider that they could run in both cases.
If it's a big function like the g_c_w, call only the _co_ version in
coroutine_fn, and create a coroutine or call the non-coroutine
counterpart if we are not in coroutine context.
Which is also what I am trying to do with g_c_w_simple.

However, it would be nice to assign this to someone and do this
automatically, not doing it by hand. I am not sure if Alberto static
analyzer is currently capable of doing that.

What do you all think?

Thank you,
Emanuele

> 
> 
>>
>> Thank you,
>> Emanuele
>>
>>>
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> ---
>>>>    block/block-copy.c | 15 +++++++++------
>>>>    1 file changed, 9 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>>> index bb947afdda..f33ab1d0b6 100644
>>>> --- a/block/block-copy.c
>>>> +++ b/block/block-copy.c
>>>> @@ -577,8 +577,9 @@ static coroutine_fn int
>>>> block_copy_task_entry(AioTask *task)
>>>>        return ret;
>>>>    }
>>>>    -static int block_copy_block_status(BlockCopyState *s, int64_t
>>>> offset,
>>>> -                                   int64_t bytes, int64_t *pnum)
>>>> +static coroutine_fn int block_copy_block_status(BlockCopyState *s,
>>>> +                                                int64_t offset,
>>>> +                                                int64_t bytes,
>>>> int64_t *pnum)
>>>>    {
>>>>        int64_t num;
>>>>        BlockDriverState *base;
>>>> @@ -613,8 +614,9 @@ static int block_copy_block_status(BlockCopyState
>>>> *s, int64_t offset,
>>>>     * Check if the cluster starting at offset is allocated or not.
>>>>     * return via pnum the number of contiguous clusters sharing this
>>>> allocation.
>>>>     */
>>>> -static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t
>>>> offset,
>>>> -                                           int64_t *pnum)
>>>> +static int coroutine_fn
>>>> block_copy_is_cluster_allocated(BlockCopyState *s,
>>>> +                                                        int64_t
>>>> offset,
>>>> +                                                        int64_t *pnum)
>>>>    {
>>>>        BlockDriverState *bs = s->source->bs;
>>>>        int64_t count, total_count = 0;
>>>> @@ -669,8 +671,9 @@ void block_copy_reset(BlockCopyState *s, int64_t
>>>> offset, int64_t bytes)
>>>>     * @return 0 when the cluster at @offset was unallocated,
>>>>     *         1 otherwise, and -ret on error.
>>>>     */
>>>> -int64_t block_copy_reset_unallocated(BlockCopyState *s,
>>>> -                                     int64_t offset, int64_t *count)
>>>> +int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
>>>> +                                                  int64_t offset,
>>>> +                                                  int64_t *count)
>>>>    {
>>>>        int ret;
>>>>        int64_t clusters, bytes;
>>>
>>
> 


