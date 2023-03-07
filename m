Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDC6ADE86
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:18:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWG4-0007sf-IE; Tue, 07 Mar 2023 07:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZWG2-0007nP-5j
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:17:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZWG0-0007UN-N2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678191448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAnFlp8iJA+TKCg07qDsweI4me1VfMQF0Y/2TDHNW1U=;
 b=OPRttRxokU5/Zu5Zz1cWdZUWWPaYv7xtmp33ovSJuo+pIExr+WzrEfWM+2m+V9dUrMNo+Y
 kkHmFetn6kuZn4Dc3z8++9YrmSt30EDC/AjpVWTZM5IHXStGD5GM6Ocp5DVO5lDGCwhy8M
 9eAdZPSsmx53ARo+BbqS3xS3rxcpmGg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-muxDcZ0RMtGrj7t3GFSAeQ-1; Tue, 07 Mar 2023 07:17:27 -0500
X-MC-Unique: muxDcZ0RMtGrj7t3GFSAeQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so18342581edc.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 04:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678191446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAnFlp8iJA+TKCg07qDsweI4me1VfMQF0Y/2TDHNW1U=;
 b=AxY2p21FUOiS0VVH0YgtoIOwgCa2Df2vbGfKprgpXs4qN//eeutxxfkwX3e7v+CbMe
 SjqybHsXt5gKlRXgx+SzX1TUjQV28nUCrYKXCak4UfU8R0Z3X5SYcVl6S7NUkDHgcOE2
 TX9XX7zSWbFvkjCwGkVx8SY9/YmrLj3CuWbLgLtZGBqF//Iq9kmxDFm+EVpJpFtfF2/p
 tEuG5Xz87VZddCAgq47cj3IpAGdwDNXL3On8v59WXkgaKhu9I+IEhRtvMajbiLeRilau
 VxcH03gInSfTcjKdwlfcfy9D/U4Ef7Sfrq0aZ/VuBX+Pim8mu11OIp25ML49AmFWErmZ
 511A==
X-Gm-Message-State: AO0yUKUW/W8/4fU28sQTSIatL50u4/TWEsJcu5gVkYPw7varBFsvDvwQ
 zhx6AYyy/Zo+bXp7OzlaIYZ0s16Ikw8MViz9mXPqP3nfRgi8MYlKE7Iyd3j6/p4HQ+evFhXYYlt
 4vifcDMqU71ezFM0=
X-Received: by 2002:a17:907:320a:b0:87a:ee05:f7b with SMTP id
 xg10-20020a170907320a00b0087aee050f7bmr17371978ejb.24.1678191445917; 
 Tue, 07 Mar 2023 04:17:25 -0800 (PST)
X-Google-Smtp-Source: AK7set//KsZGyKfFiKIT4uK1WYETU7xZvD8b5jhV/SejOhWKUylgrpeadC7+4ODYPuznJH3ll3nCTQ==
X-Received: by 2002:a17:907:320a:b0:87a:ee05:f7b with SMTP id
 xg10-20020a170907320a00b0087aee050f7bmr17371962ejb.24.1678191445689; 
 Tue, 07 Mar 2023 04:17:25 -0800 (PST)
Received: from ?IPV6:2003:cf:d729:7d22:58d:9cdf:192f:c786?
 (p200300cfd7297d22058d9cdf192fc786.dip0.t-ipconnect.de.
 [2003:cf:d729:7d22:58d:9cdf:192f:c786])
 by smtp.gmail.com with ESMTPSA id
 va12-20020a17090711cc00b008b11ba87bf4sm5970066ejb.209.2023.03.07.04.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 04:17:25 -0800 (PST)
Message-ID: <e5703b09-2138-3ab7-d750-c1d6d8a940c0@redhat.com>
Date: Tue, 7 Mar 2023 13:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 09/12] parallels: Move check of leaks to a separate
 function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
 <20230203091854.2221397-10-alexander.ivanov@virtuozzo.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230203091854.2221397-10-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 03.02.23 10:18, Alexander Ivanov wrote:
> We will add more and more checks so we need a better code structure
> in parallels_co_check. Let each check performs in a separate loop
> in a separate helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 80 ++++++++++++++++++++++++++++-------------------
>   1 file changed, 48 insertions(+), 32 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 994528d93c..c7d37c4580 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -480,21 +480,57 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       return 0;
>   }
>   
> +static int parallels_check_leak(BlockDriverState *bs,
> +                                BdrvCheckResult *res,
> +                                BdrvCheckMode fix)

Like parallels_check_outside_image(), I think ideally this should be 
marked as `coroutine_fn GRAPH_RDLOCK` because of the block layer 
functions it calls.

Hanna


