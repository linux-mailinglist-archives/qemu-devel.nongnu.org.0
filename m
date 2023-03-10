Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0986B3D5C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:12:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paaei-0003FE-RV; Fri, 10 Mar 2023 06:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1paaeg-0003Es-A0
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:11:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1paaee-0005pF-QS
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678446680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BaqJblt1vjZ/RRfbVW2uwGDS8YqABNUaD5+hPkhLBpk=;
 b=MDlUkUmZTWKt3R4cZoSoLJgLnINGzpUCsaOijxr0IkTRXzPEGQKXAFCR7kp9Dp4Z1PIdqo
 GuCHTCvgy2a0HYqNVnMtfS5soBn2BqbGsj/5lRkLMj7pfqtWm69dk4enzHpf3Q88+xdTeJ
 /FPeucjvF8Th7CAus97oRaZ70WyYPHU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-KuNZUf35M_utuRxLrEOnhg-1; Fri, 10 Mar 2023 06:11:18 -0500
X-MC-Unique: KuNZUf35M_utuRxLrEOnhg-1
Received: by mail-wm1-f71.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so1677263wmk.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 03:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678446677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BaqJblt1vjZ/RRfbVW2uwGDS8YqABNUaD5+hPkhLBpk=;
 b=ZHsTQXKrPIkb5Eq28Mxp3u3Swfi35y4S29pYnzrYcpwV5EevveR/qslT3nhZGPYmbV
 Spfi9JNm3x52k+aZn19KvC+nP0n51AY8bXW/mp/koj3qtxLmGAfim+0VQvazLeM1AscO
 87VJUYKffCI8IHmUzvUiuG9J9hyl58qK1su0gkeBsCu0vYaL2SpVr+Z32oC+Fb/RguMx
 6GjA1XLr6q5w2hf06+uxmOATnd7GY0xpPTZDJy0hm6XdJ0hQyGlzcyA+veGpIoG6/HGZ
 p3QnB7evsisBmsY9bMqUf7CsIFUm8ZFy01FNVcH7pOSPvlVrjqmMsogNBKXGQOUCfdvQ
 OFCw==
X-Gm-Message-State: AO0yUKVjtluE5F5YOBSplrUskwmihI2d8fnCCoXe+Y+iuzAHghIJ4Lev
 V5eI054N1/lp2xTfp9a05Uy0B/EjhiYY23kJ121oKonSAlDbdJNgd++u6vfc00mBNbWge00ocd7
 udcKmD0oETxTCRLU=
X-Received: by 2002:a05:600c:5487:b0:3dc:555c:dd30 with SMTP id
 iv7-20020a05600c548700b003dc555cdd30mr2494601wmb.27.1678446677144; 
 Fri, 10 Mar 2023 03:11:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8SUP2/H17dYw0XSno10Bq8vR2gNT3+HHSOxCjtpJ5IMzYad4/2QnCspGgeW0f9fcrmPPXZ/w==
X-Received: by 2002:a05:600c:5487:b0:3dc:555c:dd30 with SMTP id
 iv7-20020a05600c548700b003dc555cdd30mr2494580wmb.27.1678446676823; 
 Fri, 10 Mar 2023 03:11:16 -0800 (PST)
Received: from ?IPV6:2003:cf:d729:7d22:58d:9cdf:192f:c786?
 (p200300cfd7297d22058d9cdf192fc786.dip0.t-ipconnect.de.
 [2003:cf:d729:7d22:58d:9cdf:192f:c786])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003eb395a8280sm2972567wms.37.2023.03.10.03.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 03:11:16 -0800 (PST)
Message-ID: <ca3b6018-638c-3618-58a7-de98360f9089@redhat.com>
Date: Fri, 10 Mar 2023 12:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 07/12] parallels: Move check of cluster outside image
 to a separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
 <20230203091854.2221397-8-alexander.ivanov@virtuozzo.com>
 <fdc04f4c-b921-0d58-8b0a-8def13220847@redhat.com>
 <13f924cc-a47d-e117-4993-d223937744a5@virtuozzo.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <13f924cc-a47d-e117-4993-d223937744a5@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 10.03.23 12:08, Alexander Ivanov wrote:
>
>
> On 3/7/23 13:17, Hanna Czenczek wrote:
>> On 03.02.23 10:18, Alexander Ivanov wrote:
>>> We will add more and more checks so we need a better code structure in
>>> parallels_co_check. Let each check performs in a separate loop in a
>>> separate helper.
>>>
>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>> Reviewed-by: Denis V. Lunev <den@openvz.org>
>>> ---
>>>   block/parallels.c | 81 
>>> ++++++++++++++++++++++++++++++-----------------
>>>   1 file changed, 52 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/block/parallels.c b/block/parallels.c
>>> index 02fbaee1f2..f9acee1fa8 100644
>>> --- a/block/parallels.c
>>> +++ b/block/parallels.c
>>> @@ -438,14 +438,13 @@ static void 
>>> parallels_check_unclean(BlockDriverState *bs,
>>>       }
>>>   }
>>>   -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>>> -                                           BdrvCheckResult *res,
>>> -                                           BdrvCheckMode fix)
>>> +static int parallels_check_outside_image(BlockDriverState *bs,
>>> +                                         BdrvCheckResult *res,
>>> +                                         BdrvCheckMode fix)
>>
>> I wonder, should we mark this function coroutine_fn?  And with the 
>> graph lock changes that happened in the meantime, probably also 
>> GRAPH_RDLOCK (because it’s calling bdrv_getlength()).
>>
>> Hanna
>>
> Thank you for your review.
>
> It seems, parallels_collect_statistics(), parallels_check_unclean() 
> and parallels_set_bat_entry() also should be marked as coroutine_fn, 
> shouldn't they?

There should be no harm in doing so.  I wasn’t mentioning it just 
because those functions don’t call other coroutine functions themselves, 
so I think it doesn’t really matter.

Hanna


