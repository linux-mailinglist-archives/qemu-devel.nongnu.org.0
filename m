Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4756D9DFB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 18:53:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkSqQ-0002RQ-Sm; Thu, 06 Apr 2023 12:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pkSqP-0002R4-5f
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pkSqN-0006bU-GQ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680799934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/8Gy8vugtzhDf1g7TmxW23KPzh9J0qRUt1pQOuCxgw=;
 b=K0ZftfyLllMwjA0TUmUNzve6ykYVjMyKbtOtXPRDEzbUPMqBtur/1ty4ncrCDGZOW8NmIi
 blfrKO2gvtYyRoBUwcYU0cMw3sT1C6IZCkDFEm1iAFseK5cjVKyJCfCWzhZOCHg/eCRZrl
 D394ItNNd8+5/FjIF3ZaDVztdwe5L9A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-daV00rlMMb--M3Bv7xDscQ-1; Thu, 06 Apr 2023 12:51:53 -0400
X-MC-Unique: daV00rlMMb--M3Bv7xDscQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z20-20020a05600c0a1400b003edcff41678so1953817wmp.0
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 09:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680799905;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z/8Gy8vugtzhDf1g7TmxW23KPzh9J0qRUt1pQOuCxgw=;
 b=cbkl3R1LBPoreq/Y7y6YTQONBGs+K0z8X3qR18zYaZDV/XeO+1bKrGZF/pqcqNO8vb
 wpj1IrASy2YcbFZxiK9jfXVhI1NZpiyTSjR4+xTUtfGkhPtuBHl6xAE53tix1XmzihYb
 8qQEAhCO57k3smaMY1s5QUAMob7d86G1+WTE/SCyQ+dzI4BpsUrGVsU77xQX3i+HIgFE
 4SbtCGGzaR3IvaWyTZQVzQnYDBc1t7P1h4k1+yXnFgI0GvqMA09qnfh0AHH7aK04tjdH
 lNb4QjVg338Umlia5tGXxYw0pHDjiuM15FGKsps6Kmoe5fEbXAyCCgMFMilhbAgaBngL
 UUSg==
X-Gm-Message-State: AAQBX9c5wWDJP+iFrrsQyv02T9eKH4DSmGIYPjjp0kYYIWBJVE0eb8m2
 SRi8m+mw3xUeHU3GJhmVP8opxiFrZhXfjOwf+BwmA0yo1whXs9J5zReBJ+OuN3OeZalxoSSWE8o
 Q955aFK1HGlLosog=
X-Received: by 2002:a05:600c:3b93:b0:3ed:2346:44bd with SMTP id
 n19-20020a05600c3b9300b003ed234644bdmr4755337wms.19.1680799905440; 
 Thu, 06 Apr 2023 09:51:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350aMEFKbW0JpqaHnPtrGrMNxA5UqKuMM2FFqnZTMivkziMhWGm9zLz+yNPrIHWMjBAFc+OhCIQ==
X-Received: by 2002:a05:600c:3b93:b0:3ed:2346:44bd with SMTP id
 n19-20020a05600c3b9300b003ed234644bdmr4755320wms.19.1680799905020; 
 Thu, 06 Apr 2023 09:51:45 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 c8-20020adfed88000000b002e45f6ffe63sm2234147wro.26.2023.04.06.09.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 09:51:44 -0700 (PDT)
Message-ID: <fb428514-964f-93b6-065e-6399abd5ac24@redhat.com>
Date: Thu, 6 Apr 2023 18:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] block: Split padded I/O vectors exceeding IOV_MAX
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230317175019.10857-1-hreitz@redhat.com>
 <20230317175019.10857-3-hreitz@redhat.com>
 <794be57d-9bbb-4de4-00ef-32df10cc3eaa@yandex-team.ru>
 <751be7a2-f32a-569d-c464-c7821560edea@redhat.com>
 <9bf47acd-9c41-b838-c6a9-fea2c586d385@yandex-team.ru>
 <251b1d36-7fe0-498d-f257-b1a0d256779f@redhat.com>
 <163e2982-e055-2f42-8540-b6688dadd3b6@yandex-team.ru>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <163e2982-e055-2f42-8540-b6688dadd3b6@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.224, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05.04.23 11:59, Vladimir Sementsov-Ogievskiy wrote:
> On 04.04.23 20:32, Hanna Czenczek wrote:
>> On 04.04.23 10:10, Vladimir Sementsov-Ogievskiy wrote:
>>> On 03.04.23 16:33, Hanna Czenczek wrote:
>>>> (Sorry for the rather late reply... Thanks for the review!)
>>>>
>>>> On 20.03.23 11:31, Vladimir Sementsov-Ogievskiy wrote:
>>>>> On 17.03.23 20:50, Hanna Czenczek wrote:
>>>>
>>>> [...]
>>>>
>>>>>> diff --git a/block/io.c b/block/io.c
>>>>>> index 8974d46941..1e9cdba17a 100644
>>>>>> --- a/block/io.c
>>>>>> +++ b/block/io.c
>>>>>
>>>>> [..]
>>>>>
>>>>>> +    pad->write = write;
>>>>>> +
>>>>>>       return true;
>>>>>>   }
>>>>>>   @@ -1545,6 +1561,18 @@ zero_mem:
>>>>>>     static void bdrv_padding_destroy(BdrvRequestPadding *pad)
>>>>>
>>>>> Maybe, rename to _finalize, to stress that it's not only freeing 
>>>>> memory.
>>>>
>>>> Sounds good!
>>>>
>>>> [...]
>>>>
>>>>>> @@ -1552,6 +1580,101 @@ static void 
>>>>>> bdrv_padding_destroy(BdrvRequestPadding *pad)
>>>>>>       memset(pad, 0, sizeof(*pad));
>>>>>>   }
>>>>>>   +/*
>>>>>> + * Create pad->local_qiov by wrapping @iov in the padding head 
>>>>>> and tail, while
>>>>>> + * ensuring that the resulting vector will not exceed IOV_MAX 
>>>>>> elements.
>>>>>> + *
>>>>>> + * To ensure this, when necessary, the first couple of elements 
>>>>>> (up to three)
>>>>>
>>>>> maybe, "first two-three elements"
>>>>
>>>> Sure (here and...
>>>>
>>>> [...]
>>>>
>>>>>> +    /*
>>>>>> +     * If padded_niov > IOV_MAX, we cannot just concatenate 
>>>>>> everything.
>>>>>> +     * Instead, merge the first couple of elements of @iov to 
>>>>>> reduce the number
>>>>>
>>>>> maybe, "first two-three elements"
>>>>
>>>> ...here).
>>>>
>>>>>
>>>>>> +     * of vector elements as necessary.
>>>>>> +     */
>>>>>> +    if (padded_niov > IOV_MAX) {
>>>>>>
>>>>>
>>>>> [..]
>>>>>
>>>>>> @@ -1653,8 +1786,8 @@ int coroutine_fn 
>>>>>> bdrv_co_preadv_part(BdrvChild *child,
>>>>>>           flags |= BDRV_REQ_COPY_ON_READ;
>>>>>>       }
>>>>>>   -    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, 
>>>>>> &bytes, &pad,
>>>>>> -                           NULL, &flags);
>>>>>> +    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, 
>>>>>> &bytes, false,
>>>>>> +                           &pad, NULL, &flags);
>>>>>>       if (ret < 0) {
>>>>>>           goto fail;
>>>>>>       }
>>>>>
>>>>> a bit later:
>>>>>
>>>>> tracked_request_end(&req);
>>>>> bdrv_padding_destroy(&pad);
>>>>>
>>>>>
>>>>> Now, the request is formally finished inside 
>>>>> bdrv_padding_destroy().. Not sure, does it really violate 
>>>>> something, but seems safer to swap these two calls. 
>>>>
>>>> I’d rather not, for two reasons: First, tracked requests are (as 
>>>> far as I understand) only there to implement request serialization, 
>>>> and so only care about metadata (offset, length, and type), which 
>>>> is not changed by changes to the I/O vector.
>>>>
>>>> Second, even if the state of the I/O vector were relevant to 
>>>> tracked requests, I think it would actually be the other way 
>>>> around, i.e. the tracked request must be ended before the padding 
>>>> is finalized/destroyed.  The tracked request is about the actual 
>>>> request we submit to `child` (which is why tracked_request_begin() 
>>>> is called after bdrv_pad_request()), and that request is done using 
>>>> the modified I/O vector.  So if the tracked request had any 
>>>> connection to the request’s I/O vector (which it doesn’t), it would 
>>>> be to this modified one, so we mustn’t invalidate it via 
>>>> bdrv_padding_finalize() while the tracked request lives.
>>>>
>>>> Or, said differently: I generally try to clean up things in the 
>>>> inverse way they were set up, and because bdrv_pad_requests() comes 
>>>> before tracked_request_begin(), I think tracked_request_end() 
>>>> should come before bdrv_padding_finalize().
>>>
>>> Note, that it's wise-versa in bdrv_co_pwritev_part().
>>
>> Well, and it’s this way here.  We agree that for clean-up, the order 
>> doesn’t functionally matter, so either way is actually fine.
>>
>>> For me it's just simpler to think that the whole request, including 
>>> filling user-given qiov with data on read part is inside 
>>> tracked_request_begin() / tracked_request_end().
>>
>> It isn’t, though, because padding must be done before the tracked 
>> request is created.  The tracked request uses the request’s actual 
>> offset and length, after padding, so bdrv_pad_request() must always 
>> be done before (i.e., outside) tracked_request_begin().
>>
>>> And moving the last manipulation with qiov out of it breaks this 
>>> simple thought.
>>> Guest should not care of it, as it doesn't know about request 
>>> tracking.. But what about internal code? Some code may depend on 
>>> some requests be finished after bdrv_drained_begin() call, but now 
>>> they may be not fully finished, and some data may be not copied back 
>>> to original qiov.
>
> You didn't answered here. Do you think that's wrong assumption for the 
> user of drained sections?

Tracked requests are about request (write) serialization, they have 
nothing to do with draining.  Draining is about waiting until the 
in_flight counter is 0, i.e. waiting for bdrv_dec_in_flight(), which is 
separate from tracked_request_end() and always comes after 
bdrv_padding_finalize().

Hanna


