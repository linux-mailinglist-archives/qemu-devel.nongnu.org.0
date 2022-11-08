Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF596217C9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:14:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQII-0001H9-U8; Tue, 08 Nov 2022 10:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1osQI4-0001Gq-FU
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1osQHj-0005K4-ON
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667920384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vXZs6d4gygdXqJPZLnDyIXoulAeszPKMlnOXYgJg3o=;
 b=dArxQyEsiMQwWKL7FthycXEdhPjwIxmuhMxU2rec0HwXWdrdMZsD0fhBb1luNuoeHiKD4d
 FJG0YI4Kz/VLQSoRw7UosLA5wbre/bPK+QUK98dqRAHU9Fya9wU/1qp05D3hhB/4CcqsOP
 R3atJqMzyPfPsVpq1bF36XDcRLw00Fg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-BMkHL5yINuucya4tioVcPA-1; Tue, 08 Nov 2022 10:13:03 -0500
X-MC-Unique: BMkHL5yINuucya4tioVcPA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c10-20020a7bc84a000000b003cf81c2d3efso3960012wml.7
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 07:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3vXZs6d4gygdXqJPZLnDyIXoulAeszPKMlnOXYgJg3o=;
 b=fJEkt99BPIOR9kwHqHvCe+c7NFopsPULwMeNoDdZE9QG3D4BmfaFos4RALHleai53f
 wT8TA7SlTCORwkYvIZUfmfLsJCr98uBA44p9nB4UGzfvMYAsosUswf0R5Q3tvpdzjhfn
 ijelbiZq8ywckCY9pekNuaFRZhoJXKU+rbzFi0+BfDfL1aBaXQPEL5BW0tIk9N3aOkX1
 wFNM1k3O9mDJ9Gl7R8TXSBSCy1QCZuT0uFnmT0OWi6C+ZqYxU+te3MJicXjPnQTI9ktX
 NzERIq40R3Z7JLT7ScNf1tZtQEZZmckK5zpGwd8qwquZMMdTyjcotLCfVUNTL3Jh1kAN
 pJUA==
X-Gm-Message-State: ACrzQf3XZddmdYtMk+jfuNlDXsurv+fFE71BXj/LEc2SXqD3n5bGDtLp
 dYIbRId1abd3LC0vCJK2YAOHXXDya/fcwtk4ATWIhZyPkR8Q6aarA72w/8LUYpY3gkTERVQC8Fg
 JfZYyFYa5eVHnd3c=
X-Received: by 2002:a5d:4004:0:b0:236:cc0a:7c64 with SMTP id
 n4-20020a5d4004000000b00236cc0a7c64mr29440306wrp.149.1667920382440; 
 Tue, 08 Nov 2022 07:13:02 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6gXb83qyxNrt5UaXQ+eiCtAHeLhoYN7DsZVdXavF2XM9PiO015XPHeru2nGpWEHGRAX4vg/w==
X-Received: by 2002:a5d:4004:0:b0:236:cc0a:7c64 with SMTP id
 n4-20020a5d4004000000b00236cc0a7c64mr29440280wrp.149.1667920382206; 
 Tue, 08 Nov 2022 07:13:02 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00236cb3fec8fsm12608901wrq.9.2022.11.08.07.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 07:13:01 -0800 (PST)
Message-ID: <3c45c186-4913-6508-7a97-b11742afb41e@redhat.com>
Date: Tue, 8 Nov 2022 16:13:00 +0100
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
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <1a4627a3-e5c3-5ee7-d953-5719e5a019d1@yandex-team.ru>
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



Am 08/11/2022 um 15:33 schrieb Vladimir Sementsov-Ogievskiy:
> On 11/4/22 12:56, Emanuele Giuseppe Esposito wrote:
>> It seems that bdrv_open_driver() forgot to create a coroutine
>> where to call bs->drv->bdrv_co_drain_begin(), a callback
>> marked as coroutine_fn.
>>
>> Because there is no active I/O at this point, the coroutine
>> should end right after entering, so the caller does not need
>> to poll until it is finished.
> 
> Hmm. I see your point. But isn't it better to go the generic way and use
> a generated coroutine wrapper? Nothing guarantees that
> .bdrv_co_drain_begin() handlers will never do any yield point even on
> driver open...
> 
> Look for example at bdrv_co_check(). It has a generated wrapper
> bdrv_check(), declared in include/block/block-io.h
> 
> So you just need to declare the wrapper, and use it in
> bdrv_open_driver(), the code would be clearer too.

I think (and this is a repetition from my previous email) it confuses
the code. It is clear, but then you don't know if we are in a coroutine
context or not.

I am very well aware of what you did with your script, and I am working
on extending your g_c_w class with g_c_w_simple, where we drop the
if(qemu_in_coroutine()) case and leave just the coroutine creation.
Therefore, coroutine functions we use only the _co_ function, otherwise
we use g_c_w_simple.
In this way code is clear as you point out, but there is no confusion.

Thank you,
Emanuele
> 
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   block.c | 36 +++++++++++++++++++++++++++++++-----
>>   1 file changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 5311b21f8e..d2b2800039 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -1637,12 +1637,34 @@ out:
>>       g_free(gen_node_name);
>>   }
>>   +typedef struct DrainCo {
>> +    BlockDriverState *bs;
>> +    int ret;
>> +} DrainCo;
>> +
>> +static void coroutine_fn bdrv_co_drain_begin(void *opaque)
>> +{
>> +    int i;
>> +    DrainCo *co = opaque;
>> +    BlockDriverState *bs = co->bs;
>> +
>> +    for (i = 0; i < bs->quiesce_counter; i++) {
>> +        bs->drv->bdrv_co_drain_begin(bs);
>> +    }
>> +    co->ret = 0;
>> +}
>> +
>>   static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
>>                               const char *node_name, QDict *options,
>>                               int open_flags, Error **errp)
>>   {
>>       Error *local_err = NULL;
>> -    int i, ret;
>> +    int ret;
>> +    Coroutine *co;
>> +    DrainCo dco = {
>> +        .bs = bs,
>> +        .ret = NOT_DONE,
>> +    };
>>       GLOBAL_STATE_CODE();
>>         bdrv_assign_node_name(bs, node_name, &local_err);
>> @@ -1690,10 +1712,14 @@ static int bdrv_open_driver(BlockDriverState
>> *bs, BlockDriver *drv,
>>       assert(bdrv_min_mem_align(bs) != 0);
>>       assert(is_power_of_2(bs->bl.request_alignment));
>>   -    for (i = 0; i < bs->quiesce_counter; i++) {
>> -        if (drv->bdrv_co_drain_begin) {
>> -            drv->bdrv_co_drain_begin(bs);
>> -        }
>> +    if (drv->bdrv_co_drain_begin) {
>> +        co = qemu_coroutine_create(bdrv_co_drain_begin, &dco);
>> +        qemu_coroutine_enter(co);
>> +        /*
>> +         * There should be no reason for drv->bdrv_co_drain_begin to
>> wait at
>> +         * this point, because the device does not have any active I/O.
>> +         */
>> +        assert(dco.ret != NOT_DONE);
>>       }
>>         return 0;
> 


