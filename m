Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39026AE086
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXN1-0004Nx-Fj; Tue, 07 Mar 2023 08:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZXMp-0004NV-Kc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZXMo-0003Z1-3q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678195713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/x1qB2Asjig7RLoc+Gg+4udfah8bJywdHM9zPp/ILI=;
 b=ApsggybEXA1xRr22I8KJt7b/JGW6NmQppWW9Ad7no/e1Ox+C1dsLmu6JguqUGCLqJf7p9t
 DsU1y7eC0qDo8smyk5ta01THFWncsig9GhdGKiRUZbs8rYX10TsRqRK53xkVIBJMICO4z5
 LqkfXPVT1kSYueqJ5W3RhCYNLCKe0K0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-G3XTBfMdPPqbBhGALua5Qw-1; Tue, 07 Mar 2023 08:28:32 -0500
X-MC-Unique: G3XTBfMdPPqbBhGALua5Qw-1
Received: by mail-qv1-f69.google.com with SMTP id
 px25-20020a056214051900b0056f0794632bso7404159qvb.18
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678195711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s/x1qB2Asjig7RLoc+Gg+4udfah8bJywdHM9zPp/ILI=;
 b=kX0TROTE0tXfWhr8RDn16FhIsyiaQEi3Z2FQPW3rBfl0I0MiT0d3HzLK7zGXGW/JAs
 M6VVrHBXnBulXAGGOR+N4IJe6VpQ0ETBJYO8Pcm37Btf3EXHmTKrEHcwvXiXLF0Pb1SU
 yhs/cwOLDKAelPhnLAcF6MHeREvqpJRULDHW71YERJ7bupXv65S17sacrIoQsTcj6K0a
 +0aj5iXyAU8j5XHdcy76LV2uMnSUwQPrhiUvs4BTQ+B0Efwa/uUYKd8kXhbL+7Cyw3u6
 dvLBkvUgOWJJC8fhKpmmaDg9JHW/fabUtSh8X2zunMYBk+jGSCOVKVjNOzsZ9ZIh8T9c
 WWwQ==
X-Gm-Message-State: AO0yUKUiaj7iQ/1Xrlvtm9X0VSAn948BRm0maN1gpZtgCal+x/pRjbhY
 WbGGlSmz340NTuvUvTPT+Phm4ah6k6yWyRVPCzM6HXHfUq9Qi6ClqeMGUQxq6964Vn3DIlJaT80
 Ua0fG9K2Y9VSynCI=
X-Received: by 2002:a05:6214:e67:b0:56e:9da4:82ff with SMTP id
 jz7-20020a0562140e6700b0056e9da482ffmr23632239qvb.50.1678195711493; 
 Tue, 07 Mar 2023 05:28:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9/1rl1Qwfbnpd3IFshm3kmTwCDyGyDtk+OEitj1uFJG8PGkn1f4x+LV/DgqyWil87tRJpsRQ==
X-Received: by 2002:a05:6214:e67:b0:56e:9da4:82ff with SMTP id
 jz7-20020a0562140e6700b0056e9da482ffmr23632212qvb.50.1678195711234; 
 Tue, 07 Mar 2023 05:28:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a05620a44d600b0074270440092sm9548868qkp.51.2023.03.07.05.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:28:30 -0800 (PST)
Message-ID: <9fcce9af-6f78-7bbb-a795-37bc447c06b1@redhat.com>
Date: Tue, 7 Mar 2023 14:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 08/15] vfio/common: Add helper to consolidate iova/end
 calculation
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
 <20230307125450.62409-9-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230307125450.62409-9-joao.m.martins@oracle.com>
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

On 3/7/23 13:54, Joao Martins wrote:
> In preparation to be used in device dirty tracking, move the code that
> calculate a iova/end range from the container/section.  This avoids
> duplication on the common checks across listener callbacks.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



> ---
>   hw/vfio/common.c | 41 +++++++++++++++++++++++++++--------------
>   1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index d38b7c1969b9..63831eab78a1 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -962,6 +962,31 @@ static bool vfio_listener_valid_section(MemoryRegionSection *section,
>       return true;
>   }
>   
> +static bool vfio_get_section_iova_range(VFIOContainer *container,
> +                                        MemoryRegionSection *section,
> +                                        hwaddr *out_iova, hwaddr *out_end,
> +                                        Int128 *out_llend)
> +{
> +    Int128 llend;
> +    hwaddr iova;
> +
> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
> +
> +    if (int128_ge(int128_make64(iova), llend)) {
> +        return false;
> +    }
> +
> +    *out_iova = iova;
> +    *out_end = int128_get64(int128_sub(llend, int128_one()));
> +    if (out_llend) {
> +        *out_llend = llend;
> +    }
> +    return true;
> +}
> +
>   static void vfio_listener_region_add(MemoryListener *listener,
>                                        MemoryRegionSection *section)
>   {
> @@ -977,12 +1002,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>           return;
>       }
>   
> -    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> -    llend = int128_make64(section->offset_within_address_space);
> -    llend = int128_add(llend, section->size);
> -    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
> -
> -    if (int128_ge(int128_make64(iova), llend)) {
> +    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
>           if (memory_region_is_ram_device(section->mr)) {
>               trace_vfio_listener_region_add_no_dma_map(
>                   memory_region_name(section->mr),
> @@ -992,7 +1012,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
>           }
>           return;
>       }
> -    end = int128_get64(int128_sub(llend, int128_one()));
>   
>       if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
>           hwaddr pgsize = 0;
> @@ -1219,15 +1238,9 @@ static void vfio_listener_region_del(MemoryListener *listener,
>            */
>       }
>   
> -    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> -    llend = int128_make64(section->offset_within_address_space);
> -    llend = int128_add(llend, section->size);
> -    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
> -
> -    if (int128_ge(int128_make64(iova), llend)) {
> +    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
>           return;
>       }
> -    end = int128_get64(int128_sub(llend, int128_one()));
>   
>       llsize = int128_sub(llend, int128_make64(iova));
>   


