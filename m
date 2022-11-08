Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1376218DA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQvO-0002gO-4e; Tue, 08 Nov 2022 10:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osQui-0002fG-8m; Tue, 08 Nov 2022 10:53:24 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osQuf-0004px-Nb; Tue, 08 Nov 2022 10:53:23 -0500
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 9325060936;
 Tue,  8 Nov 2022 18:52:58 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 CpyULtU3ow-qvNes3Ud; Tue, 08 Nov 2022 18:52:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667922777; bh=UXGTrQhjQZU1VqUEu+pXPcSKmLJhea/KO4ekCZrTrxE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=TCNi19DU6hSoL9tu+8R1MLxUzavG8H71BmR0DnBb6idzoyR1YqdPHeFU7YTLN1Z1a
 0Yxah3RcDAPtJaP6GpdnpZ+UB6gFsxvHIt0rcAj4oljFYNR5SzTtE5cqO47P8HJ5Vq
 ma84JgV3YsXcPKI71BXyH+6ft9STs5vCGHVUgjJg=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <119e4895-1ee9-ef31-6004-e25d05024210@yandex-team.ru>
Date: Tue, 8 Nov 2022 18:52:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/9] block: call bdrv_co_drain_begin in a coroutine
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-2-eesposit@redhat.com>
 <1a4627a3-e5c3-5ee7-d953-5719e5a019d1@yandex-team.ru>
 <3c45c186-4913-6508-7a97-b11742afb41e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <3c45c186-4913-6508-7a97-b11742afb41e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/8/22 18:13, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 08/11/2022 um 15:33 schrieb Vladimir Sementsov-Ogievskiy:
>> On 11/4/22 12:56, Emanuele Giuseppe Esposito wrote:
>>> It seems that bdrv_open_driver() forgot to create a coroutine
>>> where to call bs->drv->bdrv_co_drain_begin(), a callback
>>> marked as coroutine_fn.
>>>
>>> Because there is no active I/O at this point, the coroutine
>>> should end right after entering, so the caller does not need
>>> to poll until it is finished.
>>
>> Hmm. I see your point. But isn't it better to go the generic way and use
>> a generated coroutine wrapper? Nothing guarantees that
>> .bdrv_co_drain_begin() handlers will never do any yield point even on
>> driver open...
>>
>> Look for example at bdrv_co_check(). It has a generated wrapper
>> bdrv_check(), declared in include/block/block-io.h
>>
>> So you just need to declare the wrapper, and use it in
>> bdrv_open_driver(), the code would be clearer too.
> 
> I think (and this is a repetition from my previous email) it confuses
> the code. It is clear, but then you don't know if we are in a coroutine
> context or not.

Hmm. But same thing is true for all callers of coroutine wrappers.

I agree that "coroutine wrapper" is a workaround for the design problem. Really, the fact that in many places we don't know are we in coroutine or not is very uncomfortable.

But still, I'm not sure that's it good to avoid this workaround in one place and continue to use it in all other places. I think following common design is better. Or rework it deeply by getting rid of the wrappers somehow.

> 
> I am very well aware of what you did with your script, and I am working
> on extending your g_c_w class with g_c_w_simple, where we drop the
> if(qemu_in_coroutine()) case and leave just the coroutine creation.
> Therefore, coroutine functions we use only the _co_ function, otherwise
> we use g_c_w_simple.
> In this way code is clear as you point out, but there is no confusion.

Hmm sounds good, I missed it. Why not use g_c_w_simple here than?

> 
> Thank you,
> Emanuele
>>
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>    block.c | 36 +++++++++++++++++++++++++++++++-----
>>>    1 file changed, 31 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/block.c b/block.c
>>> index 5311b21f8e..d2b2800039 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -1637,12 +1637,34 @@ out:
>>>        g_free(gen_node_name);
>>>    }
>>>    +typedef struct DrainCo {
>>> +    BlockDriverState *bs;
>>> +    int ret;
>>> +} DrainCo;
>>> +
>>> +static void coroutine_fn bdrv_co_drain_begin(void *opaque)
>>> +{
>>> +    int i;
>>> +    DrainCo *co = opaque;
>>> +    BlockDriverState *bs = co->bs;
>>> +
>>> +    for (i = 0; i < bs->quiesce_counter; i++) {
>>> +        bs->drv->bdrv_co_drain_begin(bs);
>>> +    }
>>> +    co->ret = 0;
>>> +}
>>> +
>>>    static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
>>>                                const char *node_name, QDict *options,
>>>                                int open_flags, Error **errp)
>>>    {
>>>        Error *local_err = NULL;
>>> -    int i, ret;
>>> +    int ret;
>>> +    Coroutine *co;
>>> +    DrainCo dco = {
>>> +        .bs = bs,
>>> +        .ret = NOT_DONE,
>>> +    };
>>>        GLOBAL_STATE_CODE();
>>>          bdrv_assign_node_name(bs, node_name, &local_err);
>>> @@ -1690,10 +1712,14 @@ static int bdrv_open_driver(BlockDriverState
>>> *bs, BlockDriver *drv,
>>>        assert(bdrv_min_mem_align(bs) != 0);
>>>        assert(is_power_of_2(bs->bl.request_alignment));
>>>    -    for (i = 0; i < bs->quiesce_counter; i++) {
>>> -        if (drv->bdrv_co_drain_begin) {
>>> -            drv->bdrv_co_drain_begin(bs);
>>> -        }
>>> +    if (drv->bdrv_co_drain_begin) {
>>> +        co = qemu_coroutine_create(bdrv_co_drain_begin, &dco);
>>> +        qemu_coroutine_enter(co);
>>> +        /*
>>> +         * There should be no reason for drv->bdrv_co_drain_begin to
>>> wait at
>>> +         * this point, because the device does not have any active I/O.
>>> +         */
>>> +        assert(dco.ret != NOT_DONE);
>>>        }
>>>          return 0;
>>
> 

-- 
Best regards,
Vladimir


