Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ECF6ADE87
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:18:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWG3-0007oR-KG; Tue, 07 Mar 2023 07:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZWG1-0007kL-AD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:17:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZWFz-0007Tt-1p
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678191446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVA78mCx/RA28hFM8bNEk4fTsUabUeELvgBy2p5AOrI=;
 b=Td7iLNElqSq8xFPvKITQYkLd3mbG57qRUSgcyqygB1liZuyY/mBEmbYStLr8qANlTxJgTQ
 RtQXXvEYs0AmZhwMRSAPpbzgZF2lz5QVhz/l6cKL9ky0I0mREw37oOrvLLgUafKIkWHYjK
 MwMM0qNZa4OFPJXaBNhDMNEckeiwJpA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-g8mGbzJNPjK3NCe0Q1hlZA-1; Tue, 07 Mar 2023 07:17:24 -0500
X-MC-Unique: g8mGbzJNPjK3NCe0Q1hlZA-1
Received: by mail-ed1-f72.google.com with SMTP id
 d35-20020a056402402300b004e37aed9832so9220687eda.18
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 04:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678191443;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVA78mCx/RA28hFM8bNEk4fTsUabUeELvgBy2p5AOrI=;
 b=PzyVWnvCce90V/v7YdkqYOtjmQVTJuv7C7tCbaEW5pUc2CRWpWnSv6oGmT2nlByjZo
 +K2R7+BwUX5C3dCEim6h/Ku5HW/faDOlxeKwd+P4pDTcHonK0bAU4sNXExQhWtPXlnmI
 Tav2g+kLlCvW85yeMbDVXLm+XAM7SrhrGI3JK58LXrOaZ2I51eICHsksrC4uv7wwiKCu
 8bUUgTxQCrb3Pe1c+OuUsiZNZOUl7o5AwJobkakG3gwqTr9rU6GJgC4p+WAag3ifndCX
 mAlQ2itWci0E7hnMPb7k+hBMM1OlaC27O1kPaUPBYGEdzyGmLI/mdDmDGYKiNfeEkuds
 Cawg==
X-Gm-Message-State: AO0yUKXPpd1j+onBRK4pr0frYtMS/OV/lh7hAD8Ft0fAeeJcM0Z3Mvza
 A4lboMphs3EVNYVKK+J+x74vbbJV0rS8VWIS1SREJNYkxI8HmQwDa8aZpOPGocrI42+jRVKXnin
 KJMosy3LUCVlh4MY=
X-Received: by 2002:a17:907:728e:b0:8b1:807e:d4d2 with SMTP id
 dt14-20020a170907728e00b008b1807ed4d2mr19846533ejc.34.1678191443391; 
 Tue, 07 Mar 2023 04:17:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8EIcCLBuCjcYZh3nzDUUzdPwGNmem4rQLj9BwtK6pS/wC93LdEoTnJyFZ0iB29N2ogyaugIg==
X-Received: by 2002:a17:907:728e:b0:8b1:807e:d4d2 with SMTP id
 dt14-20020a170907728e00b008b1807ed4d2mr19846504ejc.34.1678191443153; 
 Tue, 07 Mar 2023 04:17:23 -0800 (PST)
Received: from ?IPV6:2003:cf:d729:7d22:58d:9cdf:192f:c786?
 (p200300cfd7297d22058d9cdf192fc786.dip0.t-ipconnect.de.
 [2003:cf:d729:7d22:58d:9cdf:192f:c786])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a50c44a000000b004bf5981ef3dsm6587590edf.94.2023.03.07.04.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 04:17:22 -0800 (PST)
Message-ID: <fdc04f4c-b921-0d58-8b0a-8def13220847@redhat.com>
Date: Tue, 7 Mar 2023 13:17:21 +0100
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
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230203091854.2221397-8-alexander.ivanov@virtuozzo.com>
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

On 03.02.23 10:18, Alexander Ivanov wrote:
> We will add more and more checks so we need a better code structure in
> parallels_co_check. Let each check performs in a separate loop in a
> separate helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> Reviewed-by: Denis V. Lunev <den@openvz.org>
> ---
>   block/parallels.c | 81 ++++++++++++++++++++++++++++++-----------------
>   1 file changed, 52 insertions(+), 29 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 02fbaee1f2..f9acee1fa8 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -438,14 +438,13 @@ static void parallels_check_unclean(BlockDriverState *bs,
>       }
>   }
>   
> -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> -                                           BdrvCheckResult *res,
> -                                           BdrvCheckMode fix)
> +static int parallels_check_outside_image(BlockDriverState *bs,
> +                                         BdrvCheckResult *res,
> +                                         BdrvCheckMode fix)

I wonder, should we mark this function coroutine_fn?  And with the graph 
lock changes that happened in the meantime, probably also GRAPH_RDLOCK 
(because it’s calling bdrv_getlength()).

Hanna


