Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF9621911
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:07:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osR7B-0007xW-9d; Tue, 08 Nov 2022 11:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1osR78-0007xD-Rm
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:06:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1osR77-0000MP-37
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667923572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZdV5T/YlW/B23IbmvoGnTDtvp6slgpZ6AzuWMJIx7M=;
 b=NvNXL+lM/1Xi+HDjDMuy23e9i8KFs0a6NzXYqNwSGOw2hSCO8K5YSv/U/e8d137xrKACpS
 vK7NPV2ulGH8jzSLN3Y3ocXDxLkdBhCf50qcCAxvnB2l3bFqkxfjg/KdBNQJ0BUj+rizq5
 Hr66nwcSSo0BGpxXsDK1vQwr/1hlJHo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-4i5yt6PANtKRUVV8odRvdw-1; Tue, 08 Nov 2022 11:06:11 -0500
X-MC-Unique: 4i5yt6PANtKRUVV8odRvdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so952041wmb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 08:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yZdV5T/YlW/B23IbmvoGnTDtvp6slgpZ6AzuWMJIx7M=;
 b=U6Ga4HTtOOKbW4P19HzCXiqRaqjchfOHgk+zdNmcWeQT5wZ5ZtRoNdJaOCa2nALQAZ
 0TdTYA+MGMQ0BY3RN6JYtWptCw7Zz3OXMdzE2yqn8kSpvjSRWkb0XPDVlUmOP2dTXCQm
 PNPF3BcFnP6278qyHvNZY2ELBS/Il5zgGTvjnqa4Wt1uBCyINLIdgG8fj5DsGrBMaacs
 Zau9UNZtFlyuHgU1TDdN4wZOmjF23F39kEN/Urv2mxtG5lLk4HwxeEdpQKSM2poeJImd
 8NBusqzEidlamwtcDVC5B+H12d+LuJ6Sdh6NfAEFpvJU4F7w1Y043XNDctbvfI8ijHd3
 d/qA==
X-Gm-Message-State: ACrzQf3r9ZCZmPd1g64CRHwHqI5kTVl23X6804Ut3mnybkBTlJQctAiK
 GEnP3tTqbK/OJOsTb0s+ZYfYuVmT/KJVVYwsSR9f1T3AtrP1nJzM6SSz+t6jgs31NE8E4uwvdx2
 Utc1PaYUK3s7QyiY=
X-Received: by 2002:a5d:6887:0:b0:236:8ead:47ab with SMTP id
 h7-20020a5d6887000000b002368ead47abmr36992080wru.372.1667923569753; 
 Tue, 08 Nov 2022 08:06:09 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5s/qe4PJSCcPy/hfh8FbmrygOYhL62harP7KPdR8cSJypsum4o8qBL+YSBzvkuBYdVFxldWA==
X-Received: by 2002:a5d:6887:0:b0:236:8ead:47ab with SMTP id
 h7-20020a5d6887000000b002368ead47abmr36992034wru.372.1667923569324; 
 Tue, 08 Nov 2022 08:06:09 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 x15-20020adfdd8f000000b002365921c9aesm10899651wrl.77.2022.11.08.08.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 08:06:08 -0800 (PST)
Message-ID: <9eda82a1-4cf4-f65c-08c5-ceaaa1f52f91@redhat.com>
Date: Tue, 8 Nov 2022 17:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/9] block: call bdrv_co_drain_begin in a coroutine
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-2-eesposit@redhat.com>
 <1a4627a3-e5c3-5ee7-d953-5719e5a019d1@yandex-team.ru>
 <3c45c186-4913-6508-7a97-b11742afb41e@redhat.com>
 <119e4895-1ee9-ef31-6004-e25d05024210@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <119e4895-1ee9-ef31-6004-e25d05024210@yandex-team.ru>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 08/11/2022 um 16:52 schrieb Vladimir Sementsov-Ogievskiy:
> On 11/8/22 18:13, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 08/11/2022 um 15:33 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 11/4/22 12:56, Emanuele Giuseppe Esposito wrote:
>>>> It seems that bdrv_open_driver() forgot to create a coroutine
>>>> where to call bs->drv->bdrv_co_drain_begin(), a callback
>>>> marked as coroutine_fn.
>>>>
>>>> Because there is no active I/O at this point, the coroutine
>>>> should end right after entering, so the caller does not need
>>>> to poll until it is finished.
>>>
>>> Hmm. I see your point. But isn't it better to go the generic way and use
>>> a generated coroutine wrapper? Nothing guarantees that
>>> .bdrv_co_drain_begin() handlers will never do any yield point even on
>>> driver open...
>>>
>>> Look for example at bdrv_co_check(). It has a generated wrapper
>>> bdrv_check(), declared in include/block/block-io.h
>>>
>>> So you just need to declare the wrapper, and use it in
>>> bdrv_open_driver(), the code would be clearer too.
>>
>> I think (and this is a repetition from my previous email) it confuses
>> the code. It is clear, but then you don't know if we are in a coroutine
>> context or not.
> 
> Hmm. But same thing is true for all callers of coroutine wrappers.
> 
> I agree that "coroutine wrapper" is a workaround for the design problem.
> Really, the fact that in many places we don't know are we in coroutine
> or not is very uncomfortable.

And the only way to figure if it's a coroutine or not is by adding
assertions and pray that the iotests don't fail *and* cover all cases.

> 
> But still, I'm not sure that's it good to avoid this workaround in one
> place and continue to use it in all other places. I think following
> common design is better. Or rework it deeply by getting rid of the
> wrappers somehow.

Well, one step at the time :) it's already difficult to verify that such
replacement cover and is correct for all cases :)

> 
>>
>> I am very well aware of what you did with your script, and I am working
>> on extending your g_c_w class with g_c_w_simple, where we drop the
>> if(qemu_in_coroutine()) case and leave just the coroutine creation.
>> Therefore, coroutine functions we use only the _co_ function, otherwise
>> we use g_c_w_simple.
>> In this way code is clear as you point out, but there is no confusion.
> 
> Hmm sounds good, I missed it. Why not use g_c_w_simple here than?

Because I came up with it this morning.

Thank you,
Emanuele

> 
>>
>> Thank you,
>> Emanuele
>>>
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> ---
>>>>    block.c | 36 +++++++++++++++++++++++++++++++-----
>>>>    1 file changed, 31 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/block.c b/block.c
>>>> index 5311b21f8e..d2b2800039 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -1637,12 +1637,34 @@ out:
>>>>        g_free(gen_node_name);
>>>>    }
>>>>    +typedef struct DrainCo {
>>>> +    BlockDriverState *bs;
>>>> +    int ret;
>>>> +} DrainCo;
>>>> +
>>>> +static void coroutine_fn bdrv_co_drain_begin(void *opaque)
>>>> +{
>>>> +    int i;
>>>> +    DrainCo *co = opaque;
>>>> +    BlockDriverState *bs = co->bs;
>>>> +
>>>> +    for (i = 0; i < bs->quiesce_counter; i++) {
>>>> +        bs->drv->bdrv_co_drain_begin(bs);
>>>> +    }
>>>> +    co->ret = 0;
>>>> +}
>>>> +
>>>>    static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
>>>>                                const char *node_name, QDict *options,
>>>>                                int open_flags, Error **errp)
>>>>    {
>>>>        Error *local_err = NULL;
>>>> -    int i, ret;
>>>> +    int ret;
>>>> +    Coroutine *co;
>>>> +    DrainCo dco = {
>>>> +        .bs = bs,
>>>> +        .ret = NOT_DONE,
>>>> +    };
>>>>        GLOBAL_STATE_CODE();
>>>>          bdrv_assign_node_name(bs, node_name, &local_err);
>>>> @@ -1690,10 +1712,14 @@ static int bdrv_open_driver(BlockDriverState
>>>> *bs, BlockDriver *drv,
>>>>        assert(bdrv_min_mem_align(bs) != 0);
>>>>        assert(is_power_of_2(bs->bl.request_alignment));
>>>>    -    for (i = 0; i < bs->quiesce_counter; i++) {
>>>> -        if (drv->bdrv_co_drain_begin) {
>>>> -            drv->bdrv_co_drain_begin(bs);
>>>> -        }
>>>> +    if (drv->bdrv_co_drain_begin) {
>>>> +        co = qemu_coroutine_create(bdrv_co_drain_begin, &dco);
>>>> +        qemu_coroutine_enter(co);
>>>> +        /*
>>>> +         * There should be no reason for drv->bdrv_co_drain_begin to
>>>> wait at
>>>> +         * this point, because the device does not have any active
>>>> I/O.
>>>> +         */
>>>> +        assert(dco.ret != NOT_DONE);
>>>>        }
>>>>          return 0;
>>>
>>
> 


