Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E7863236C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:28:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6p9-0008PO-JS; Mon, 21 Nov 2022 08:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox6p0-0008OX-G7
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox6ow-0004Ww-0C
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669037204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9acl5kKm6Yatx4wsQMFkUNsPZAlRc8SmjvRkuZJwxU=;
 b=RurMDx85N39thiQroQuNFQbP8x7NL5XFIb+a8DdpIRQv+C5PZr07t3cXV18yutCq4iQNj/
 hCC1sicYGAPUP+f6TaPVeWgz5LE5YlFbNBJxK6zgrBiKk4NND3uoqDqxOudJ+Og9LccLNx
 xeXPv5Jx6Tp8gplS16i1Cv65Db6ytMY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-83-38RL_TxiNGiPFGLcj2pawA-1; Mon, 21 Nov 2022 08:26:43 -0500
X-MC-Unique: 38RL_TxiNGiPFGLcj2pawA-1
Received: by mail-wr1-f70.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so3258461wra.23
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 05:26:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9acl5kKm6Yatx4wsQMFkUNsPZAlRc8SmjvRkuZJwxU=;
 b=lMgLoCDxhaCQq7aIbbnLzcUz/0Y+ol9GWxV9wyuC6TWbSL21+yX0Z6soHhHvI5noZM
 aHJi5qrcKyvhTsug/ijLC4bgBaRlzIaYE27JvLEJKQDF5SaiCxfSvW54punAgLDwnmd3
 D8oZQSIVLmEG9NTnuhRO8/YC6lg1foeZhvdPTFJKRVue9woTOOh6LFX4tjUOd1cRvkG1
 dh4I3OC0GzBVBbKbnD0DEYYVmgUxFprlpIxgdHxG0IOnPJ43m3HhavRWRl2rNxvoK+Ai
 kcemU74vcgekwihk4zRt29gcByHwUJXyiOTQZvkHknDup/b8gx4wSJuXuodJibO4uvqp
 8jjQ==
X-Gm-Message-State: ANoB5pkxGMrVBsV15nxDWNB4Be1BYBt/zwI+FcQ/z6II2jTOWbTIaBIw
 r5CBjYV/VK4mjcaRpCdRSgiGASTSc2AgaQhBE+D5h8ShSfXiD/5pPO3wMl9GgKKWciHKK25pHJ5
 HGeJvSw9iWMsw0hw=
X-Received: by 2002:a05:600c:220d:b0:3cf:633f:c570 with SMTP id
 z13-20020a05600c220d00b003cf633fc570mr3796614wml.110.1669037202018; 
 Mon, 21 Nov 2022 05:26:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7TANNRo8fDQDV9TnpmK1jhhAxqajbbgEQEZH90q3TO5uSQHAnLPlppDXhMbkDgeJQFgFKwJw==
X-Received: by 2002:a05:600c:220d:b0:3cf:633f:c570 with SMTP id
 z13-20020a05600c220d00b003cf633fc570mr3796597wml.110.1669037201793; 
 Mon, 21 Nov 2022 05:26:41 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 b8-20020adff908000000b0022ca921dc67sm11092249wrr.88.2022.11.21.05.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 05:26:40 -0800 (PST)
Message-ID: <ea83c161-d4ec-d18f-e9ca-d076df7ccb8e@redhat.com>
Date: Mon, 21 Nov 2022 14:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 01/11] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-2-eesposit@redhat.com> <Y3fXgfKe5H7j22aj@redhat.com>
 <c1c9e6b2-78a5-bd0c-6c95-a3123b89ce91@redhat.com>
 <c30c7321-a2b6-5094-16d0-2aee5a327c80@redhat.com>
 <Y3tmIjH2u48H5iRW@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y3tmIjH2u48H5iRW@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 21/11/2022 um 12:50 schrieb Kevin Wolf:
> Am 21.11.2022 um 09:51 hat Emanuele Giuseppe Esposito geschrieben:
>>
>>
>> Am 21/11/2022 um 09:32 schrieb Emanuele Giuseppe Esposito:
>>>
>>>
>>> Am 18/11/2022 um 20:05 schrieb Kevin Wolf:
>>>> Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
>>>>> These functions end up calling bdrv_common_block_status_above(), a
>>>>> generated_co_wrapper function.
>>>>> In addition, they also happen to be always called in coroutine context,
>>>>> meaning all callers are coroutine_fn.
>>>>> This means that the g_c_w function will enter the qemu_in_coroutine()
>>>>> case and eventually suspend (or in other words call qemu_coroutine_yield()).
>>>>> Therefore we need to mark such functions coroutine_fn too.
>>>>>
>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>
>>>> Ideally, we'd convert them to new wrappers bdrv_co_is_allocated() and
>>>> bdrv_co_block_status_above() instead of having to argue that they always
>>>> take the coroutine path in g_c_w.
>>>
>>> Ok so basically I should introduce bdrv_co_is_allocated, because so far
>>> in this and next series I never thought about creating it.
>>> Since these functions will be eventually split anyways, I agree let's
>>> start doing this now.
>>
>> Actually bdrv_is_allocated would be a g_c_w functions in itself, that
>> calls another g_c_w and it is probably called by functions that are or
>> will be g_c_w.
> 
> I'm not sure if I understand. bdrv_is_allocated() is essentially a g_c_w
> function today, just indirectly. But we have callers that know that they
> are running in a coroutine (which is why you're adding coroutine_fn to
> them), so they shouldn't call a g_c_w function, but directly the
> coroutine version of the function.
> 
> The only reason why you can't currently do that is that
> bdrv_is_allocated() exists as a wrapper around the g_c_w function
> bdrv_common_block_status_above(), but the same wrapper doesn't exist for
> the pure coroutine version bdrv_co_common_block_status_above().
> 
> All I'm suggesting is introducing a bdrv_co_is_allocated() that is a
> wrapper directly around bdrv_co_common_block_status_above(), so that
> the functions you're marking as coroutine_fn can use it instead of
> calling g_c_w. This should be about 10 lines of code.
> 
> I'm not implying that you should convert any other callers in this
> patch, or that you should touch bdrv_is_allocated() at all.
> 
>> Is this actually the scope of this series? I think switching this
>> specific function and its callers or similar will require a lot of
>> efforts, and if I do it here it won't cover all the cases for sure.
>>
>> Wouldn't it be better to do these kind of things in a different serie
>> using Paolo's vrc tool?
> 
> I'm not sure what the scope of this series is, because you already do
> introduce new wrappers in other patches of the series. I assumed it's
> just to improve the situation a little, with no claim of being
> exhaustive.
> 
> Finding and fully converting all callers might indeed be a job for
> something like vrc, but here I'm only looking at local consistency in
> functions where you're adding coroutine_fn.
> 

Oh ok now I see what you mean. I was thinking (and did in "[PATCH 04/15]
block: convert bdrv_refresh_total_sectors in generated_co_wrapper") to
instead convert all callers in g_c_w, and that ended up being a big pain.

I'll also correct the patch I mentioned above.

Thank you,
Emanuele


