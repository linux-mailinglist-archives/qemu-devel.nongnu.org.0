Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB26978DB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 10:22:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSDz4-0005wl-VD; Wed, 15 Feb 2023 04:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pSDz2-0005wM-5h
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:21:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pSDz0-000340-Io
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676452905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doaPGydhn1CXMn9d2QrRpNJAWVxq8coBL3XDjOVGtVg=;
 b=K3R7R/rVxuS4NmLya25K2/LyEHH8YTY4syrWh4ZVeIPqPeMlCOvlRLlEBmE+ciXrXUitH8
 hhZZQPfoCZ8VYWFkIPLiNSgAa9UqqpJ2LlABPnWBINfwrq3QiS0QnARz1tP0BKK/CLzXl0
 4sZvHkL056lGI4JovVXzNEv08qWJwDI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-Y902rK7xMDmCmOP1VuthfQ-1; Wed, 15 Feb 2023 04:21:44 -0500
X-MC-Unique: Y902rK7xMDmCmOP1VuthfQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 w2-20020a0cc702000000b0055c8ef137ddso10240010qvi.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 01:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=doaPGydhn1CXMn9d2QrRpNJAWVxq8coBL3XDjOVGtVg=;
 b=FHQhQqPdTN31kULFmlVEIkb3P84Wz3FW5hjkXt+uKfc12Nq8u+kL9Qh2MkPT9I4oe4
 +hh7JANQ/Lof6MCAY646rBvCPZeR9rlvRvfnclcSmYx895mWG8lSa4IdKKpblgDSzGx4
 03D8oKn19+N/H3pYOTzFJmj9kCB3SZR5qcksFYViMilnNPALyPJYYLgFubk0rUi1mgQ1
 JqztKXeLDwmr7/ED1oE9fgTW7uTN7XmZ9t9ieZxzNaCi4ZSTos+JhZCoi0fWtO5k+v1Y
 KVBWZZurwbqxazj3nyE6mGXx08DCOVmORrZkz1tFwZVElUiuCiHmDQhNpWEjlK7EZLqy
 KyIQ==
X-Gm-Message-State: AO0yUKWG8EBtNP/adFe3jYA2ZyuN+pFoljPM5cOFmXfaVkPiS3DWpYEK
 Pckf/qaVAqtuCjpSuLCK6ps6nt4kZBE808DVdjSmNzH1wn4KpgjkvP3s7q0fgm2fqpZFjUO8BZv
 0uSWt3sDJD1Qb/r4=
X-Received: by 2002:ac8:5f13:0:b0:3b8:55d4:224c with SMTP id
 x19-20020ac85f13000000b003b855d4224cmr2143643qta.66.1676452904231; 
 Wed, 15 Feb 2023 01:21:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/cN3wFUsCDtbQLMlDDhQhw3k3bY37N809ot4sE56OaqhBWgsaNah10jme0fKSbITIGw/P/Fg==
X-Received: by 2002:ac8:5f13:0:b0:3b8:55d4:224c with SMTP id
 x19-20020ac85f13000000b003b855d4224cmr2143626qta.66.1676452904032; 
 Wed, 15 Feb 2023 01:21:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 p6-20020ac84086000000b003b9a573aec6sm12756065qtl.70.2023.02.15.01.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 01:21:43 -0800 (PST)
Message-ID: <539e22d4-5ee1-27a8-c74e-b6f057617b43@redhat.com>
Date: Wed, 15 Feb 2023 10:21:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/18] vfio/common: Fix wrong %m usages
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-4-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230126184948.10478-4-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/26/23 19:49, Avihai Horon wrote:
> There are several places where the %m conversion is used if one of
> vfio_dma_map(), vfio_dma_unmap() or vfio_get_dirty_bitmap() fail.
> 
> The %m usage in these places is wrong since %m relies on errno value while
> the above functions don't report errors via errno.
> 
> Fix it by using strerror() with the returned value instead.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/common.c | 29 ++++++++++++++++-------------
>   1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index d892609cf1..643418f6f1 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -656,17 +656,17 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>                              read_only);
>           if (ret) {
>               error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> -                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
> +                         "0x%"HWADDR_PRIx", %p) = %d (%s)",
>                            container, iova,
> -                         iotlb->addr_mask + 1, vaddr, ret);
> +                         iotlb->addr_mask + 1, vaddr, ret, strerror(-ret));
>           }
>       } else {
>           ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
>           if (ret) {
>               error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> -                         "0x%"HWADDR_PRIx") = %d (%m)",
> +                         "0x%"HWADDR_PRIx") = %d (%s)",
>                            container, iova,
> -                         iotlb->addr_mask + 1, ret);
> +                         iotlb->addr_mask + 1, ret, strerror(-ret));
>           }
>       }
>   out:
> @@ -1048,8 +1048,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
>                          vaddr, section->readonly);
>       if (ret) {
>           error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> -                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
> -                   container, iova, int128_get64(llsize), vaddr, ret);
> +                   "0x%"HWADDR_PRIx", %p) = %d (%s)",
> +                   container, iova, int128_get64(llsize), vaddr, ret,
> +                   strerror(-ret));
>           if (memory_region_is_ram_device(section->mr)) {
>               /* Allow unexpected mappings not to be fatal for RAM devices */
>               error_report_err(err);
> @@ -1181,16 +1182,18 @@ static void vfio_listener_region_del(MemoryListener *listener,
>               ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
>               if (ret) {
>                   error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> -                             "0x%"HWADDR_PRIx") = %d (%m)",
> -                             container, iova, int128_get64(llsize), ret);
> +                             "0x%"HWADDR_PRIx") = %d (%s)",
> +                             container, iova, int128_get64(llsize), ret,
> +                             strerror(-ret));
>               }
>               iova += int128_get64(llsize);
>           }
>           ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
>           if (ret) {
>               error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> -                         "0x%"HWADDR_PRIx") = %d (%m)",
> -                         container, iova, int128_get64(llsize), ret);
> +                         "0x%"HWADDR_PRIx") = %d (%s)",
> +                         container, iova, int128_get64(llsize), ret,
> +                         strerror(-ret));
>           }
>       }
>   
> @@ -1337,9 +1340,9 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>                                       translated_addr);
>           if (ret) {
>               error_report("vfio_iommu_map_dirty_notify(%p, 0x%"HWADDR_PRIx", "
> -                         "0x%"HWADDR_PRIx") = %d (%m)",
> -                         container, iova,
> -                         iotlb->addr_mask + 1, ret);
> +                         "0x%"HWADDR_PRIx") = %d (%s)",
> +                         container, iova, iotlb->addr_mask + 1, ret,
> +                         strerror(-ret));
>           }
>       }
>       rcu_read_unlock();


