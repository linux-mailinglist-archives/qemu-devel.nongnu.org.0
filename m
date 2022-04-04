Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1304B4F1751
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 16:42:48 +0200 (CEST)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbNup-0002Y7-4X
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 10:42:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbNrV-0007If-Kg
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 10:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbNrS-0006kv-94
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 10:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649083156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdn/1VpHfhwu6NeA3EtrDr67PDz/RHZ98C5zVggrIzQ=;
 b=gHGzcgfFOLcpRj8FSbe3nl+DnRVv+klrSk64QFJbmHd0rBvg7tlPCFLtlbNktUGN1xcume
 oD9gjg9aDjAx7qvifmjCn1nS+c7GZZ/xPbaqSbkBcqL+oWv7C6gnRExlJtTnOCpqCvq44Z
 1mcxVHkS/lbiH1ZWgMkf9wlgh2k30/Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-ArD88_LNOkGUuBHdZnGbPQ-1; Mon, 04 Apr 2022 10:39:15 -0400
X-MC-Unique: ArD88_LNOkGUuBHdZnGbPQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 k16-20020a17090632d000b006ae1cdb0f07so4625821ejk.16
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 07:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rdn/1VpHfhwu6NeA3EtrDr67PDz/RHZ98C5zVggrIzQ=;
 b=y5J2BEDA+exXLcuUhkH0Fct94omFnzYrlSrTZTvHz7zq9LLKmcyZWs2M/EOlRY8tyT
 AMF+pp/J44dsJBYhhRw2wj/WejgA0j45wJ4GxDQvNzbZo/b9WZE4KzlTRSjJ/jf6ZcQp
 C9HY7cmV1NKnmcPUao+bQ9nt+2TsWNA0gTGQ70t8pMjWl9oZGHbUeT84jy8dY7I5m9RT
 KecDZTRXLyAY035yscvWVRuWvJEp7+fCYydl/jUpWjmkJO/cA3Lb3Agx+tj2uNXcCGtF
 pnn08Tl2mRxLnd/v62ofBfhoNxOQwU5+a0DYzQv4qf/yEAqcxcwsqBYFgKvHsW+edHMC
 MuDA==
X-Gm-Message-State: AOAM532dZIuGoPQq4ZYt1Xl5TiTovZSswIvo1WWteVzNu0awkMWS5HO/
 O4cXe976u1kxLcmMPawXpYatkYdKZWyNuXQtXPL+yV/a8AgkQr4QFkTuCm63njRBciwEvSVWFg2
 0ZeGOtqXghzNGDYU=
X-Received: by 2002:a17:907:97c8:b0:6db:6c57:64ee with SMTP id
 js8-20020a17090797c800b006db6c5764eemr397100ejc.320.1649083154574; 
 Mon, 04 Apr 2022 07:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0XUbwSzVBfCHmHuMmg+5EyWgiU0BT19lA5q4oJQR4bw2z9MTv/h9QUJnyS1l/luJ1W6vcbw==
X-Received: by 2002:a17:907:97c8:b0:6db:6c57:64ee with SMTP id
 js8-20020a17090797c800b006db6c5764eemr397068ejc.320.1649083154249; 
 Mon, 04 Apr 2022 07:39:14 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a056402278c00b004195a50759fsm5392663ede.84.2022.04.04.07.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 07:39:13 -0700 (PDT)
Message-ID: <0e88e142-0a96-d867-034a-59091aa16602@redhat.com>
Date: Mon, 4 Apr 2022 16:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/7] block/block-copy: block_copy(): add timeout_ns
 parameter
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-6-vsementsov@openvz.org>
 <929f2a0d-e3d7-afad-b95b-d7f8b29fe077@redhat.com>
 <aa2e58e0-412b-161b-4f66-52d65a5bfd2f@mail.ru>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <aa2e58e0-412b-161b-4f66-52d65a5bfd2f@mail.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, vsementsov@openvz.org, stefanha@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 18:08, Vladimir Sementsov-Ogievskiy wrote:
> 01.04.2022 16:16, Hanna Reitz wrote:
>> On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
>>> Add possibility to limit block_copy() call in time. To be used in the
>>> next commit.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>> ---
>>>   block/block-copy.c         | 26 +++++++++++++++++++-------
>>>   block/copy-before-write.c  |  2 +-
>>>   include/block/block-copy.h |  2 +-
>>>   3 files changed, 21 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index ec46775ea5..b47cb188dd 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>
>> [...]
>>
>>> @@ -894,12 +902,16 @@ int coroutine_fn block_copy(BlockCopyState *s, 
>>> int64_t start, int64_t bytes,
>>>           .max_workers = BLOCK_COPY_MAX_WORKERS,
>>>       };
>>> -    return block_copy_common(&call_state);
>>> -}
>>> +    ret = qemu_co_timeout(block_copy_async_co_entry, call_state, 
>>> timeout_ns,
>>> +                          g_free);
>>
>> A direct path for timeout_ns == 0 might still be nice to have.
>>
>>> +    if (ret < 0) {
>>> +        /* Timeout. call_state will be freed by running coroutine. */
>>
>> Maybe assert(ret == -ETIMEDOUT);?
>
> OK
>
>>
>>> +        return ret;
>>
>> If I’m right in understanding how qemu_co_timeout() works, 
>> block_copy_common() will continue to run here.  Shouldn’t we at least 
>> cancel it by setting call_state->cancelled to true?
>
> Agree
>
>>
>> (Besides this, I think that letting block_copy_common() running in 
>> the background should be OK.  I’m not sure what the implications are 
>> if we do cancel the call here, while on-cbw-error is 
>> break-guest-write, though.  Should be fine, I guess, because 
>> block_copy_common() will still correctly keep track of what it has 
>> successfully copied and what it hasn’t?)
>
> Hmm. I now think, that we should at least wait for such cancelled 
> background requests before block_copy_state_free in cbw_close(). But 
> in "[PATCH v5 00/45] Transactional block-graph modifying API" I want 
> to detach children from CBW filter before calling .close().. So, 
> possible solution is to wait for all cancelled requests on 
> .bdrv_co_drain_begin().
>
> Or alternatively, may be just increase bs->in_flight for CBW filter 
> for each background cancelled request? And decrease when it finish. 
> For this we should add a kind of callback to be called when timed-out 
> coroutine entry finish.

in_flight sounds good to me.  That would automatically work for 
draining, right?


