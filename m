Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6145471D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:23:09 +0100 (CET)
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnKu4-00053l-2r
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:23:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mnKhP-0006h4-0H
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:10:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mnKhL-00011e-Do
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637154598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5H5U4aeBdM0ThmKF+7YUJZHRn+3ulZZCx9CK4vYBjOU=;
 b=eju/gKbjtjal1Yx/2YhEo/0mHGz+EX9OIdXECbQv8fLf+Ioly4XzUTX7zapCOlmJfwguTn
 walMlp+4oiEp6VU16qLD//o4HktBJCWyf37OnkDEouHswFhwxaJscNEtbqHYUNYjzENgIs
 7pbagJ7eoUr9FOhgao+lBRoHlQY+v4c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-0zwXyIthNnyC-3ac_UqDyQ-1; Wed, 17 Nov 2021 08:09:55 -0500
X-MC-Unique: 0zwXyIthNnyC-3ac_UqDyQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 v22-20020a50a456000000b003e7cbfe3dfeso2068379edb.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 05:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5H5U4aeBdM0ThmKF+7YUJZHRn+3ulZZCx9CK4vYBjOU=;
 b=Pf4G4eZICCDROxEqZPjp27DNcc9vVTadr0ldePq2aUbBC5fsaIptJpFJpXknYqoOKa
 9kNJhS59daWp/OUwA4qe3SijJI3AuOEaqdZgDCeSHhYj5OxllYzDF+T/6XAo+/Bdp55l
 IY7448OwBm3s34iaFAnkQmdeGFxsIIzoUrZREYHW6iZw370Mn4kj2YS5r8Bzax0D7VzU
 cCHAFXzdL9RW2ExbOBlilYhtKxg6jWWGZInpBJx9gmRXninXOjzzNwAlcdEOD2SrEHBQ
 Yezu+nZdj+cb8TNW7f+8+n16pKmYsmRW3nvEF028kJMMF3dAuFegGLZqN7caMri9FVf5
 2PCQ==
X-Gm-Message-State: AOAM530iLEW/KiCykJvP9o1IB6bnfwvRCmq5/OpEDFNDvVTDewaWoIau
 Q3xXen4cs739FqTlI89ctks3du11EU15rlcQcgBexTopK2jtm2vTD9LEsCvOMCNQwx//ALoojtl
 nbUGr61rEj5IP+Kg=
X-Received: by 2002:a17:907:1b16:: with SMTP id
 mp22mr21745869ejc.487.1637154594228; 
 Wed, 17 Nov 2021 05:09:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmRbx8ZGALZIH5fPF+gESAzFZfPuA/3PtJbAlZbsQ1qlS5Q5HPskQhjvn6RqHmT9NtYWpaiA==
X-Received: by 2002:a17:907:1b16:: with SMTP id
 mp22mr21745781ejc.487.1637154593761; 
 Wed, 17 Nov 2021 05:09:53 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id c7sm10121939ejd.91.2021.11.17.05.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 05:09:52 -0800 (PST)
Message-ID: <e3788cbf-0fb2-c47c-6da5-bc7830f26e03@redhat.com>
Date: Wed, 17 Nov 2021 14:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 20/25] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-21-eesposit@redhat.com>
 <83cf9336-e37d-bf48-961c-8103b5c7bc62@redhat.com>
 <197a79f6-c9c2-d73b-7e38-e88ccc2e0a57@redhat.com>
 <01dabd9f-9443-2482-431d-51055f99885d@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <01dabd9f-9443-2482-431d-51055f99885d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/11/2021 13:51, Hanna Reitz wrote:
> On 17.11.21 12:33, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 15/11/2021 13:48, Hanna Reitz wrote:
>>> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>> ---
>>>>   block.c | 17 +++++++++++++++++
>>>>   1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/block.c b/block.c
>>>> index 94bff5c757..40c4729b8d 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>
>>> [...]
>>>
>>>> @@ -2148,6 +2152,7 @@ static void bdrv_child_perm(BlockDriverState 
>>>> *bs, BlockDriverState *child_bs,
>>>>                               uint64_t *nperm, uint64_t *nshared)
>>>>   {
>>>>       assert(bs->drv && bs->drv->bdrv_child_perm);
>>>> +    assert(qemu_in_main_thread());
>>>>       bs->drv->bdrv_child_perm(bs, c, role, reopen_queue,
>>>>                                parent_perm, parent_shared,
>>>>                                nperm, nshared);
>>>
>>> (Should’ve noticed earlier, but only did now...)
>>>
>>> First, this function is indirectly called by bdrv_refresh_perms(). I 
>>> understand that all perm-related functions are classified as GS.
>>>
>>> However, bdrv_co_invalidate_cache() invokes bdrv_refresh_perms. Being 
>>> declared in block/coroutine.h, it’s an I/O function, so it mustn’t 
>>> call such a GS function. BlockDriver.bdrv_co_invalidate_cache(), 
>>> bdrv_invalidate_cache(), and blk_invalidate_cache() are also 
>>> classified as I/O functions. Perhaps all of these functions should be 
>>> classified as GS functions?  I believe their callers and their 
>>> purpose would allow for this.
>>
>> I think that the *_invalidate_cache functions are I/O.
>> First of all, test-block-iothread.c calls bdrv_invalidate_cache in 
>> test_sync_op_invalidate_cache, which is purposefully called in an 
>> iothread. So that hints that we want it as I/O.
> 
> Hm, OK, but bdrv_co_invalidate_cache() calls bdrv_refresh_perms(), which 
> is a GS function, so that shouldn’t work, right?

Ok let's take a step back for one moment: can you tell me why the perm 
functions should be GS?

On one side I see they are also used by I/O, as we can see above. On the 
other side, I kinda see that permission should only be modified under 
BQL. But I don't have any valid point to sustain that.
So I wonder if you have any specific and more valid reason to put them 
as GS.

Maybe clarifying this will help finding a clean solution to this problem.

> 
>> (Small mistake I just noticed: blk_invalidate_cache has the BQL 
>> assertion even though it is rightly put in block-backend-io.h
>>
>>>
>>> Second, it’s called by bdrv_child_refresh_perms(), which is called by 
>>> block_crypto_amend_options_generic_luks().  This function is called 
>>> by block_crypto_co_amend_luks(), which is a BlockDriver.bdrv_co_amend 
>>> implementation, which is classified as an I/O function.
>>>
>>> Honestly, I don’t know how to fix that mess.  The best would be if we 
>>> could make the perm functions thread-safe and classify them as I/O, 
>>> but it seems to me like that’s impossible (I sure hope I’m wrong). On 
>>> the other hand, .bdrv_co_amend very much strikes me like a GS 
>>> function, but it isn’t.  I’m afraid it must work on nodes that are 
>>> not in the main context, and it launches a job, so AFAIU we 
>>> absolutely cannot run it under the BQL.
>>>
>>> It almost seems to me like we’d need a thread-safe variant of the 
>>> perm functions that’s allowed to fail when it cannot guarantee thread 
>>> safety or something.  Or perhaps I’m wrong and the perm functions can 
>>> actually be classified as thread-safe and I/O, that’d be great…
>>
>> I think that since we are currently only splitting and not taking care 
>> of the actual I/O thread safety, we can move the _perm functions in 
>> I/O, and add a nice TODO to double check their thread safety.
> 
> :/
> 
> I would really, really like to avoid that unless it’s clear that we can 
> make them thread-safe, or that there’s a way to take the BQL in I/O 
> functions to call GS functions.  But the latter still wouldn’t make the 
> perm functions I/O functions.  At most, I’d sort them under common 
> functions.
> 
>> I mean, if they are not thread-safe after the split it means they are 
>> not thread safe also right now.
> 
> Yes, sorry I wasn’t clear, I think there’s a pre-existing problem that 
> your series only unveils.  I don’t know whether it has implications in 
> practice yet.
> 
> Hanna
> 


