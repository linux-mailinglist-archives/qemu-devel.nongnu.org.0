Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9284547A5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:41:46 +0100 (CET)
Received: from localhost ([::1]:53524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLC4-0007rN-PK
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:41:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnL4q-0003VI-7D
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:34:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnL4m-0005Gj-KD
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637156051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SsM/hUTQBEMAeWgA/n0UsQpvbJRnCXgUgli399Px+l0=;
 b=NMyWNW4NuZ5GkZwliJEfUjbmtL73jc6gcrdWP7K6x6ZFwOqQqrSZsWVoaETGaUx7TZqHbR
 3q7+o8xFpwEr/Pp4VqIIO2Lbxhc2n4QT6rvmqubF5vRBQuGAQdJpMyPyJ8pJy/jJR1hDGW
 kZMu7x9OIganDzL0oZ3RPVzfjdkBIyk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-6HTrEBZVPXCx4ZFcLNa_-Q-1; Wed, 17 Nov 2021 08:34:08 -0500
X-MC-Unique: 6HTrEBZVPXCx4ZFcLNa_-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso2831312wml.9
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 05:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SsM/hUTQBEMAeWgA/n0UsQpvbJRnCXgUgli399Px+l0=;
 b=6PRQ5oFm5ZIHXcpVUCNtcBx2yeZdJBRUITd8bedGif43VKUACPPg1VKdAR0Gl55QvI
 ksveavdVWtK3OdJIuR6I3dG5sarB+aadAf8A2eYTtc5aXuoksSiqTTLnsjIFOXzCjNTp
 +nHzXpKG/ump6+6cbYd0RQ1RLJGSZFvZ9VYJzsmwGoO/tv32ctdGR7mRBClQnyTbAXwk
 Y/9FxoqX1KCzXmlf7S10S7MDol2KuWRNwKqveMYT9WGJnZwtOpSS01JUtqz/K4wSfQX5
 nMCB0YOTa8ZxANu5Vxo6azZp4jEU2qB0ipvLJfL1bkHwAdbaCjm5HJNaIZj9fi5QgE8U
 iW/w==
X-Gm-Message-State: AOAM5328b4st3FX453v2adqXfCFFbn6a4D/TP+/1I/jNZ/Fh+rNa1GEx
 e6y4mNdkzs3Eculq9d/scWaSr1uxfPf+XPMT7B06PGOTiTAAUOyQK8AtM2UeY/JuAsLn17DxSgp
 Or5yr3Y9yeVJdj9g=
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr19565980wrs.437.1637156046914; 
 Wed, 17 Nov 2021 05:34:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyeubGtFtix7QNjx3SbVWIq+unm+psLL0yOm6Tatj5a8tpwmb+DpHJFofDXxjzBn6ADP9XwA==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr19565929wrs.437.1637156046671; 
 Wed, 17 Nov 2021 05:34:06 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id l5sm5565702wml.20.2021.11.17.05.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 05:34:06 -0800 (PST)
Message-ID: <3cf77bf4-3080-1b24-7ee7-7f4b1ccb5dfe@redhat.com>
Date: Wed, 17 Nov 2021 14:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 20/25] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-21-eesposit@redhat.com>
 <83cf9336-e37d-bf48-961c-8103b5c7bc62@redhat.com>
 <197a79f6-c9c2-d73b-7e38-e88ccc2e0a57@redhat.com>
 <01dabd9f-9443-2482-431d-51055f99885d@redhat.com>
 <e3788cbf-0fb2-c47c-6da5-bc7830f26e03@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <e3788cbf-0fb2-c47c-6da5-bc7830f26e03@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 17.11.21 14:09, Emanuele Giuseppe Esposito wrote:
>
>
> On 17/11/2021 13:51, Hanna Reitz wrote:
>> On 17.11.21 12:33, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> On 15/11/2021 13:48, Hanna Reitz wrote:
>>>> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>>> ---
>>>>>   block.c | 17 +++++++++++++++++
>>>>>   1 file changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/block.c b/block.c
>>>>> index 94bff5c757..40c4729b8d 100644
>>>>> --- a/block.c
>>>>> +++ b/block.c
>>>>
>>>> [...]
>>>>
>>>>> @@ -2148,6 +2152,7 @@ static void bdrv_child_perm(BlockDriverState 
>>>>> *bs, BlockDriverState *child_bs,
>>>>>                               uint64_t *nperm, uint64_t *nshared)
>>>>>   {
>>>>>       assert(bs->drv && bs->drv->bdrv_child_perm);
>>>>> +    assert(qemu_in_main_thread());
>>>>>       bs->drv->bdrv_child_perm(bs, c, role, reopen_queue,
>>>>>                                parent_perm, parent_shared,
>>>>>                                nperm, nshared);
>>>>
>>>> (Should’ve noticed earlier, but only did now...)
>>>>
>>>> First, this function is indirectly called by bdrv_refresh_perms(). 
>>>> I understand that all perm-related functions are classified as GS.
>>>>
>>>> However, bdrv_co_invalidate_cache() invokes bdrv_refresh_perms. 
>>>> Being declared in block/coroutine.h, it’s an I/O function, so it 
>>>> mustn’t call such a GS function. 
>>>> BlockDriver.bdrv_co_invalidate_cache(), bdrv_invalidate_cache(), 
>>>> and blk_invalidate_cache() are also classified as I/O functions. 
>>>> Perhaps all of these functions should be classified as GS 
>>>> functions?  I believe their callers and their purpose would allow 
>>>> for this.
>>>
>>> I think that the *_invalidate_cache functions are I/O.
>>> First of all, test-block-iothread.c calls bdrv_invalidate_cache in 
>>> test_sync_op_invalidate_cache, which is purposefully called in an 
>>> iothread. So that hints that we want it as I/O.
>>
>> Hm, OK, but bdrv_co_invalidate_cache() calls bdrv_refresh_perms(), 
>> which is a GS function, so that shouldn’t work, right?
>
> Ok let's take a step back for one moment: can you tell me why the perm 
> functions should be GS?
>
> On one side I see they are also used by I/O, as we can see above. On 
> the other side, I kinda see that permission should only be modified 
> under BQL. But I don't have any valid point to sustain that.
> So I wonder if you have any specific and more valid reason to put them 
> as GS.

First I believe permissions to be part of the block graph state, and so 
global state.  But, well, that could be declared just a hunch.

Second permissions have transaction mechanisms – you try to update them 
on every node, if one fails, all are aborted, else all are committed.  
So this is by no means an atomic operation but quite drawn out.

The problem with this is that I/O operations rely on permissions, e.g. 
you’ll get assertion failures when trying to write but don’t have the 
WRITE permission.  So it definitely doesn’t seem like something to me 
that can be thread-safe in the sense of cooperating nicely with other 
I/O threads.

Perhaps it’d be fine to do permission updates while the relevant 
subgraph is drained (i.e. blocking all other I/O threads), but I kind of 
feel like the same could be said for all (other) GS operations.  Like, 
you could probably do all kinds of graph changes while all involved 
subgraphs are drained.

Hanna


