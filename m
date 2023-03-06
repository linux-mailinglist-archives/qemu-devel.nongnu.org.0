Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231946AC0CA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:25:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAqM-0005yc-9V; Mon, 06 Mar 2023 08:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZApr-0005XO-CV
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:25:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZApo-0006B6-PL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a4a6eURQ5PeQrDCWOervI529c/ciaa++VninGn7CW5k=;
 b=EDEtCecFkMMtVfXvUodDVRxc4F5gxtuuhbBf6Q5CkNP34tTNaY/X+xDMYSXszXSPrEQc/4
 EW19t6toUX6fqUcjMiOD59HXEqYGPegsXQumtRq+OxcO97bf/bhU25ojWdTZZHxOctZh6d
 Yv7JTG3jqpyvDbNOv2ToHUlfl64L9us=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-31NcK3inOGmCfZ8DOWTI6Q-1; Mon, 06 Mar 2023 08:24:58 -0500
X-MC-Unique: 31NcK3inOGmCfZ8DOWTI6Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso6743063wms.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109097;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a4a6eURQ5PeQrDCWOervI529c/ciaa++VninGn7CW5k=;
 b=oQ6IplaUg5jkS9tNawx6+XPkxjmKuugC5CHOWe2aJ5BH/JCs8nftksHYVxIHfV6a0k
 rxbCRsGOUv4OalXAikvxw/ACX6i1vtY8Dl25vhjfTEZFkOB7nHutJiPBfAQbRSs/rkY2
 5WJXjeA5GDJMPYdsRvR67BurCwx01QRFTS5uuIZxNmZ9ru1CLyO8DbT/RA9tux58BjkD
 dr6IZLMxL+VysHFerRW+af0h4U24Al806ossaYrCMSmy6UAWYMI0GLVBwXcqAcD78wzo
 L9dafxp6byK81dwukOb/errMTx1bvzCYYS0ScrlrWqJzP+au7A8VcIn6Dqb4Kc9ZHfAl
 bPPA==
X-Gm-Message-State: AO0yUKV7aeEFKtHFmp4qXTRK4ITHaVQff2xKlgoSRiKacqhn+ZISB+iO
 xqFo6B675bZ2tWFcmieIwV6ejvIC+BSnRzUhQgms160VgDYgOU45jO9Ig2XNUfLQ6qXFS+CA32V
 EkMTd0y1WT7UhX0Y=
X-Received: by 2002:adf:e6d2:0:b0:2c9:4d95:716f with SMTP id
 y18-20020adfe6d2000000b002c94d95716fmr7068549wrm.24.1678109097503; 
 Mon, 06 Mar 2023 05:24:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+NV0rfwEIqKWwOD92ZMy036US86LDf3qKYhPFRHaN32LSlSfN5Fj5+JqFb+VCbAOonNF2CsA==
X-Received: by 2002:adf:e6d2:0:b0:2c9:4d95:716f with SMTP id
 y18-20020adfe6d2000000b002c94d95716fmr7068536wrm.24.1678109097242; 
 Mon, 06 Mar 2023 05:24:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a056000009000b002be099f78c0sm9931329wrx.69.2023.03.06.05.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:24:56 -0800 (PST)
Message-ID: <11358301-5187-9c71-a7f2-c1b6e5f451b7@redhat.com>
Date: Mon, 6 Mar 2023 14:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 05/13] vfio/common: Add helper to validate iova/end
 against hostwin
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-6-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-6-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
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

On 3/4/23 02:43, Joao Martins wrote:
> In preparation to be used in device dirty tracking, move the code that
> finds the container host DMA window against a iova range.  This avoids
> duplication on the common checks across listener callbacks.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/common.c | 38 ++++++++++++++++++++------------------
>   1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 151e7f40b73d..80f3a1c44a01 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -903,6 +903,22 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
>       g_free(vrdl);
>   }
>   
> +static VFIOHostDMAWindow *vfio_find_hostwin(VFIOContainer *container,
> +                                            hwaddr iova, hwaddr end)
> +{
> +    VFIOHostDMAWindow *hostwin;
> +    bool hostwin_found = false;
> +
> +    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
> +        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
> +            hostwin_found = true;
> +            break;
> +        }
> +    }
> +
> +    return hostwin_found ? hostwin : NULL;
> +}
> +
>   static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>   {
>       MemoryRegion *mr = section->mr;
> @@ -928,7 +944,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
>       void *vaddr;
>       int ret;
>       VFIOHostDMAWindow *hostwin;
> -    bool hostwin_found;
>       Error *err = NULL;
>   
>       if (vfio_listener_skipped_section(section)) {
> @@ -1029,15 +1044,8 @@ static void vfio_listener_region_add(MemoryListener *listener,
>   #endif
>       }
>   
> -    hostwin_found = false;
> -    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
> -        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
> -            hostwin_found = true;
> -            break;
> -        }
> -    }
> -
> -    if (!hostwin_found) {
> +    hostwin = vfio_find_hostwin(container, iova, end);
> +    if (!hostwin) {
>           error_setg(&err, "Container %p can't map guest IOVA region"
>                      " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
>           goto fail;
> @@ -1239,15 +1247,9 @@ static void vfio_listener_region_del(MemoryListener *listener,
>       if (memory_region_is_ram_device(section->mr)) {
>           hwaddr pgmask;
>           VFIOHostDMAWindow *hostwin;
> -        bool hostwin_found = false;
>   
> -        QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
> -            if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
> -                hostwin_found = true;
> -                break;
> -            }
> -        }
> -        assert(hostwin_found); /* or region_add() would have failed */
> +        hostwin = vfio_find_hostwin(container, iova, end);
> +        assert(hostwin); /* or region_add() would have failed */
>   
>           pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
>           try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));


