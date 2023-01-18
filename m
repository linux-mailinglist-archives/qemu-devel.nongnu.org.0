Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12A67201C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 15:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI9kA-0005XI-6l; Wed, 18 Jan 2023 09:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pI9k3-0005Ub-Ta
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:48:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pI9k2-0004oK-Ct
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674053321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzKquxXyegFiXLBueaqYPwnw9R4Us/3AslWLiY+hkZo=;
 b=XGRyA3Uc899N34gKt4X+qxa82A7RddSCG+4nCj/Q1wypwsRIlBKOdrWl7ZbVkqGjELrTcy
 btZOos/6zRkphmLsI5I4EHsfB44M3jd9cal0eKBlfPCQ81JlaksM+QhlS162qOCZjAy0fD
 jeDdq86EVbAwdbrSIt7sMqoT4XvzAQc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-203-dBAhp529NCa0P5O3QHiA-w-1; Wed, 18 Jan 2023 09:48:38 -0500
X-MC-Unique: dBAhp529NCa0P5O3QHiA-w-1
Received: by mail-ej1-f71.google.com with SMTP id
 sc9-20020a1709078a0900b0086910fdf624so11674511ejc.13
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 06:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SzKquxXyegFiXLBueaqYPwnw9R4Us/3AslWLiY+hkZo=;
 b=kLHwqJXUfAlYxoyUWYTe5/69nFLxlyfWVzYygJ/HbuAIyEtJTZv5x7dUO7DbXtHXiR
 j54oNoNoiJUKD4tn0ATq8JwKm6OPbHfFt+qKTu6HLt4iEF72WTkQ+26d0EwxXQjnJ8JW
 LSLZ/6EvwCAsm7yv1t8yH//PrODIwYCOcvnqBcHv0c5rezPZhBuMSzXZpLwHJNfFjuOm
 /Z+HFh6kr5DGQI/1inZcFbRxoQjFKipzGVYpLkCWqtUSTxKV0Ocaba6QRWEm6QonpJ2n
 /OfdCP9OS398JXpidQHSwYaIU3o5u641HQ5JILMrxByYbAbmmm9D6iXIrAjEn6Qg9bjA
 mZDg==
X-Gm-Message-State: AFqh2koFCytf22Fl5ZjfaItzAh5TGzAo727c9OvN1jFsJMD2QwktKieI
 jVi/OeWlWqN0aVWTHjf8fQvWFqSQQ7zSTim3sfu5tzTZHNwdux70q+tzbWVinJvoPWntq9qR2Vv
 ETGf2R0nVNjvV+GA=
X-Received: by 2002:a05:6402:c84:b0:475:c640:ddd2 with SMTP id
 cm4-20020a0564020c8400b00475c640ddd2mr6965555edb.26.1674053315854; 
 Wed, 18 Jan 2023 06:48:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtBHZTnLbov2RZAvWMI3o+IVXvc9aXN7uEWcpWfxFWcb3YDEWxvYzZg+QBtS8OuO0UI5YpErg==
X-Received: by 2002:a05:6402:c84:b0:475:c640:ddd2 with SMTP id
 cm4-20020a0564020c8400b00475c640ddd2mr6965535edb.26.1674053315559; 
 Wed, 18 Jan 2023 06:48:35 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 r8-20020aa7c148000000b0046951b43e84sm14263494edp.55.2023.01.18.06.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 06:48:34 -0800 (PST)
Message-ID: <dd8b8623-7749-39ff-e63a-2dd3c30622b0@redhat.com>
Date: Wed, 18 Jan 2023 15:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 08/11] parallels: Move check of leaks to a separate
 function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
 <20230115155821.1534598-9-alexander.ivanov@virtuozzo.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230115155821.1534598-9-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15.01.23 16:58, Alexander Ivanov wrote:
> We will add more and more checks so we need a better code structure
> in parallels_co_check. Let each check performs in a separate loop
> in a separate helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> Reviewed-by: Denis V. Lunev <den@openvz.org>
> ---
>   block/parallels.c | 84 +++++++++++++++++++++++++++++------------------
>   1 file changed, 52 insertions(+), 32 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 3d06623355..5db099b1dd 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -475,14 +475,14 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       return 0;
>   }
>   
> -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> -                                           BdrvCheckResult *res,
> -                                           BdrvCheckMode fix)
> +static int parallels_check_leak(BlockDriverState *bs,
> +                                BdrvCheckResult *res,
> +                                BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t size, prev_off, high_off;
> -    int ret;
> +    int64_t size, off, high_off, count;
>       uint32_t i;
> +    int ret;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -490,41 +490,16 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           return size;
>       }
>   
> -    qemu_co_mutex_lock(&s->lock);
> -
> -    parallels_check_unclean(bs, res, fix);
> -
> -    ret = parallels_check_outside_image(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
> -
> -    res->bfi.total_clusters = s->bat_size;
> -    res->bfi.compressed_clusters = 0; /* compression is not supported */
> -
>       high_off = 0;
> -    prev_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
> -        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off == 0) {
> -            prev_off = 0;
> -            continue;
> -        }
> -
> -        res->bfi.allocated_clusters++;
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>           if (off > high_off) {
>               high_off = off;
>           }
> -
> -        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
> -            res->bfi.fragmented_clusters++;
> -        }
> -        prev_off = off;
>       }
>   
>       res->image_end_offset = high_off + s->cluster_size;

Continuing the question from patch 7, why do we have separate ways to 
calculate s->data_end and res->image_end_offset now?  Would it be 
possible to just set `res->image_end = s->data_end` and thus drop the 
`for` loop from this function?

Hanna


