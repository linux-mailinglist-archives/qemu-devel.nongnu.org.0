Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923896C4779
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:22:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pevbA-0001AD-5H; Wed, 22 Mar 2023 06:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pevb7-00019x-Sq
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pevb5-0005eb-Us
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679480494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E6WVSuuFL/EVOtfmxrL8dErcJW0td/eMe66omgsK1XQ=;
 b=Ugs4Y2eTZEntmTHqI+e4FPu/cgFdsXmgoh1j8c/u322xgP1f6hGff9wl7N17BcRtCV4ckv
 N6h3cUfTB26J4HTpTiu14erjHeHd4js7a1OAtbetRvvr5+baEEXIkJEcTgGlxRIa5xtZi6
 6ygu3AHUuKRij+RfZLzht3Jx6K9amGQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-ay716OzvPEa-IaHm2oIhcg-1; Wed, 22 Mar 2023 06:21:33 -0400
X-MC-Unique: ay716OzvPEa-IaHm2oIhcg-1
Received: by mail-qt1-f199.google.com with SMTP id
 w13-20020ac857cd000000b003e37d3e6de2so4016950qta.16
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 03:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679480493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E6WVSuuFL/EVOtfmxrL8dErcJW0td/eMe66omgsK1XQ=;
 b=xpUc/SN1MHM5GahEbQYvWZ9jG7wueysRXq0Z760XYjOGqv4CwYaMtLIH7YVf3aGZxX
 ugYbNoSufd5kURUrwk5kFiKuRBVR+vqEy8QvW42gNYuqUwYNdwqFwzZOa2FhVVjv+55z
 tns8/ATwC8VBFioHxfUGpD3i9+JdrfiyM3+cygBgeBsU/98WpCstOlQiuUB76WtK8p0v
 eIDp11yvoSofC9HIAwg2dPjmaPLQvIFoApRmiUdmqApIqR78OA6uhSRZuDptgaI7ngmb
 /XE1GEUqdt5ka6ij6jGm1SRItWdy9xyx5uqau6V4+ZDjO+RMH2OWr3WeBNE4mdm7UUDk
 PU4g==
X-Gm-Message-State: AO0yUKWWwvF/o+jCE4wSLAKxs2fYd4kgn67q5F6UVS/+3zLMbQXyG++r
 luyIClLl6VL7MDKt6fUEor5C+OHnw/p/wHcGdRis4ZTaT2cOMHPNL7YX4A9CrVeeIXprqqn1Kx3
 X4cuVfeqaU6VKV6I=
X-Received: by 2002:ac8:7f05:0:b0:3d6:a0aa:3dc8 with SMTP id
 f5-20020ac87f05000000b003d6a0aa3dc8mr2700859qtk.9.1679480492858; 
 Wed, 22 Mar 2023 03:21:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set9GVpTiVOiKFrl6ChlXbA8g81k5VwACZqHvfVxoFsA8lyORD4IyDEFDC1ndbrU57ydr4kgHJg==
X-Received: by 2002:ac8:7f05:0:b0:3d6:a0aa:3dc8 with SMTP id
 f5-20020ac87f05000000b003d6a0aa3dc8mr2700842qtk.9.1679480492572; 
 Wed, 22 Mar 2023 03:21:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 e12-20020ac845cc000000b003c033b23a9asm3847235qto.12.2023.03.22.03.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 03:21:32 -0700 (PDT)
Message-ID: <82fdde26-8ef4-0956-de9f-d6e232076490@redhat.com>
Date: Wed, 22 Mar 2023 11:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 v2 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-2-clg@kaod.org>
 <14e4785e-6d3c-0891-1d59-3be4cbd700cd@redhat.com>
 <24d45c41-2f62-76a2-4294-fcfa346c9683@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <24d45c41-2f62-76a2-4294-fcfa346c9683@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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

On 3/22/23 09:47, Philippe Mathieu-Daudé wrote:
> On 22/3/23 08:11, Thomas Huth wrote:
>> On 21/03/2023 17.16, Cédric Le Goater wrote:
>>> From: Cédric Le Goater <clg@redhat.com>
>>>
>>> GCC13 reports an error :
>>>
>>> ../util/async.c: In function ‘aio_bh_poll’:
>>> include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
>>>    303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
>>>        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
>>> ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
>>>    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>>>        |     ^~~~~~~~~~~~~~~~~~~~
>>> ../util/async.c:161:17: note: ‘slice’ declared here
>>>    161 |     BHListSlice slice;
>>>        |                 ^~~~~
>>> ../util/async.c:161:17: note: ‘ctx’ declared here
>>>
>>> But the local variable 'slice' is removed from the global context list
>>> in following loop of the same routine. Add a pragma to silent GCC.
>>>
>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>   util/async.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/util/async.c b/util/async.c
>>> index 21016a1ac7..de9b431236 100644
>>> --- a/util/async.c
>>> +++ b/util/async.c
>>> @@ -164,7 +164,20 @@ int aio_bh_poll(AioContext *ctx)
>>>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
>>>       QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
>>> +
>>> +    /*
>>> +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
>>> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
>>> +     * list is emptied before this function returns.
>>> +     */
>>> +#if !defined(__clang__)
>>> +#pragma GCC diagnostic push
>>> +#pragma GCC diagnostic ignored "-Wdangling-pointer="
>>
>> That warning parameter looks like a new one in GCC 13 ?
>> ... so you have to check whether it's available before disabling
>> it, otherwise this will fail with older versions of GCC. I just
>> gave it a try with my GCC 8.5 and got this:
>>
>> ../../devel/qemu/util/async.c: In function ‘aio_bh_poll’:
>> ../../devel/qemu/util/async.c:175:32: error: unknown option after ‘#pragma GCC diagnostic’ kind [-Werror=pragmas]
>>   #pragma GCC diagnostic ignored "-Wdangling-pointer="
>>                                  ^~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
> 
> Just curious, does this work? (I don't have a GCC 8.5 handy)
> 
>    #pragma GCC diagnostic push
>    #pragma GCC diagnostic ignored "-Wpragmas"
>    #pragma GCC diagnostic ignored "-Wdangling-pointer="

Yep. That works too.


I like Thomas's proposal too. It only lacks a comment on the compile issue.
Let's see what others have to say about it.

Thanks,

C.


