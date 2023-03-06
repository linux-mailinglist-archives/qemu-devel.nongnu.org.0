Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B826AC173
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAzX-0002Kx-HE; Mon, 06 Mar 2023 08:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZAyg-0001kD-II
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:34:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZAyB-000848-0y
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZzA2oJR4hwybR2efxHkrIDaKfnZB23nDALK9SbTbm4=;
 b=CsWovWXmJJeaDGHxm7+qtte4LfVKkX6En88aK6nJvY1A1i1fCWc0lNdvqc1kA2d0O+sP9l
 3h9oNzCPOCmlEangOiExBY51PA871M0cHtGPcGDahbODeyU1y/1LGwoE5XRcU43V/yvVM3
 gcFLdhvwD3meThTaGIag4TrlrNo9F1g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-CA8jsyM8ON--hD5GPSHCRw-1; Mon, 06 Mar 2023 08:33:36 -0500
X-MC-Unique: CA8jsyM8ON--hD5GPSHCRw-1
Received: by mail-wm1-f70.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so3599502wmj.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZzA2oJR4hwybR2efxHkrIDaKfnZB23nDALK9SbTbm4=;
 b=RLWODpaxyLEpXFDtDjsG/WqAEhzzsuH9jUwGPlgqSrthxk9IRfxp9dYSeO69GhTyAI
 cWVvnRd1dQXKFZLm54vVE7K0WnWRsuV8hzh7nvGsxjjEPKhfKirifE8KabYd5nxlBTIt
 TgmMLM67Mgdou2JJ1jjeVz+smR833HpiXbVyq3ZwocZEWjwdtpJy1GaPV6qPuLzfU6FB
 wqXuXSLbyGbMyesWyb4HACcOSnhND6+w7zEVnC2wQ/2xsHJ9KKZCIFm5/4bwzD3Qpeiz
 kxPzk2CaH3SnkVqxi+4qmOwA9fEzgVydT/XROqcT+ASRBBS3HXL6nIzu3IAQUyfLyJ0R
 344g==
X-Gm-Message-State: AO0yUKVlFY+WKNqF0ULBdgieXo8GvaJgchfm8hZW5g+dhoEWn9lkZ/Hj
 8FjTUJ6ofG0RTiFPOxzrTS6kklmo0+nw8deTY+OEF2+QgS26hh8NOJiPunP3Lywt0wwC4I4KMMy
 iRelSuLnmVhRYeCE=
X-Received: by 2002:a05:600c:a03:b0:3e2:20c7:6544 with SMTP id
 z3-20020a05600c0a0300b003e220c76544mr9213691wmp.19.1678109615645; 
 Mon, 06 Mar 2023 05:33:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8Mr+9K7FD40pOGmwSFyYzCkclaA2WNQlkybJVo+LuiS1/o7tCzFTh29mEXx5BeX8CHfua4lg==
X-Received: by 2002:a05:600c:a03:b0:3e2:20c7:6544 with SMTP id
 z3-20020a05600c0a0300b003e220c76544mr9213681wmp.19.1678109615363; 
 Mon, 06 Mar 2023 05:33:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b003e20970175dsm15412802wms.32.2023.03.06.05.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:33:34 -0800 (PST)
Message-ID: <abdbf04b-c9a4-5f7c-e384-93cb8183f036@redhat.com>
Date: Mon, 6 Mar 2023 14:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 06/13] vfio/common: Consolidate skip/invalid section
 into helper
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-7-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-7-joao.m.martins@oracle.com>
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

On 3/4/23 02:43, Joao Martins wrote:
> The checks are replicated against region_add and region_del
> and will be soon added in another memory listener dedicated
> for dirty tracking.
> 
> Move these into a new helper for avoid duplication.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>   hw/vfio/common.c | 52 +++++++++++++++++++-----------------------------
>   1 file changed, 21 insertions(+), 31 deletions(-)

LGTM, it is a valid change even without adding migration support.

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 80f3a1c44a01..ed908e303dbb 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -935,23 +935,14 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>       return true;
>   }
>   
> -static void vfio_listener_region_add(MemoryListener *listener,
> -                                     MemoryRegionSection *section)
> +static bool vfio_listener_valid_section(MemoryRegionSection *section)
>   {
> -    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> -    hwaddr iova, end;
> -    Int128 llend, llsize;
> -    void *vaddr;
> -    int ret;
> -    VFIOHostDMAWindow *hostwin;
> -    Error *err = NULL;
> -
>       if (vfio_listener_skipped_section(section)) {
>           trace_vfio_listener_region_add_skip(
>                   section->offset_within_address_space,
>                   section->offset_within_address_space +
>                   int128_get64(int128_sub(section->size, int128_one())));
> -        return;
> +        return false;
>       }
>   
>       if (unlikely((section->offset_within_address_space &
> @@ -966,6 +957,24 @@ static void vfio_listener_region_add(MemoryListener *listener,
>                            section->offset_within_region,
>                            qemu_real_host_page_size());
>           }
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void vfio_listener_region_add(MemoryListener *listener,
> +                                     MemoryRegionSection *section)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    hwaddr iova, end;
> +    Int128 llend, llsize;
> +    void *vaddr;
> +    int ret;
> +    VFIOHostDMAWindow *hostwin;
> +    Error *err = NULL;
> +
> +    if (!vfio_listener_valid_section(section)) {
>           return;
>       }
>   
> @@ -1184,26 +1193,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>       int ret;
>       bool try_unmap = true;
>   
> -    if (vfio_listener_skipped_section(section)) {
> -        trace_vfio_listener_region_del_skip(
> -                section->offset_within_address_space,
> -                section->offset_within_address_space +
> -                int128_get64(int128_sub(section->size, int128_one())));
> -        return;
> -    }
> -
> -    if (unlikely((section->offset_within_address_space &
> -                  ~qemu_real_host_page_mask()) !=
> -                 (section->offset_within_region & ~qemu_real_host_page_mask()))) {
> -        if (!vfio_known_safe_misalignment(section)) {
> -            error_report("%s received unaligned region %s iova=0x%"PRIx64
> -                         " offset_within_region=0x%"PRIx64
> -                         " qemu_real_host_page_size=0x%"PRIxPTR,
> -                         __func__, memory_region_name(section->mr),
> -                         section->offset_within_address_space,
> -                         section->offset_within_region,
> -                         qemu_real_host_page_size());
> -        }
> +    if (!vfio_listener_valid_section(section)) {
>           return;
>       }
>   


