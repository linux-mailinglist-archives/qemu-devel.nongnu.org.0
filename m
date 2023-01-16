Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813F666C3C8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:26:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRMC-0008Q6-H9; Mon, 16 Jan 2023 10:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pHRMB-0008Po-75
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pHRM8-0007Il-60
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673882703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBYj+fyhSBgcoZ33K7E68kMarx3sOyxevhVmR+/S3TM=;
 b=iCW1fTv+4a3qLt4XFVtr/VWnytxV+YRo+CAdnJ8Sh7NvoqncPFy7dCGM3wjKa3v6ShGPdZ
 HOCc8SSg5kdS4/Kvmy4OsU9uxRck+bTFD9v8/fx/E8IJkXfqE3aBXHoyxHNFIMQptZNML2
 k1HhsLChN9oaby6NbIAFid50GeDvvR4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-186-VAo2Yz3bPuOUq1YnY0G8Ew-1; Mon, 16 Jan 2023 10:25:02 -0500
X-MC-Unique: VAo2Yz3bPuOUq1YnY0G8Ew-1
Received: by mail-qt1-f200.google.com with SMTP id
 n26-20020ac8675a000000b003a97d74d134so12934098qtp.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 07:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fBYj+fyhSBgcoZ33K7E68kMarx3sOyxevhVmR+/S3TM=;
 b=Ay3/W1m6E22SvrS3b42F/VZgVwctpu8Vlv+cPki6WuKf+DSGe7uV5Mgi4q1eCFsMvN
 fu0UeoVRwqXRDXPZuByDcpJh6uMnqNyj82JG4sb0gMbz8IT089GhYKONaROOln9WkUCi
 oIzDczWIvn8nNDofkiZZ7J4cQFhv1gX4qKuvQS8mBSy5Ga4DxA95d/xdFDQoigeDeOig
 gbLt5Mh5dLXIt1zWek//XK/IzUSDGHROv3MtkMshzvK8WZZbBw52yvLCC5E2JNacXAHr
 8JBJ7P1DxEHaqIOz7MBfVqjFdXN6fvL1fhoq1qORGLayushcf/IMrmFrWPkSp38esjGd
 eWvg==
X-Gm-Message-State: AFqh2kpD9ZCvvTTBn4xI3t5ezD5yCeDUex3UxqrPvew8emA3KpOJQl5v
 GPv3IBBiHKZ6R8Kmh5Zsp46oW+JxMe6ys/ZBiVeKVstpKjHAtD7+Ua+Jd7sBwDimw+scUYp8X3f
 apT9biOZs8fGTSvw=
X-Received: by 2002:a05:622a:5a0e:b0:3ad:17ca:c3f with SMTP id
 fy14-20020a05622a5a0e00b003ad17ca0c3fmr41105178qtb.35.1673882701870; 
 Mon, 16 Jan 2023 07:25:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv2mcEaWY9SOkS7SpX0v33TE18j+C7Agpt4Cz7/0ZuMRT1EzP921nHFIQ7RtMfFGS1cfePtag==
X-Received: by 2002:a05:622a:5a0e:b0:3ad:17ca:c3f with SMTP id
 fy14-20020a05622a5a0e00b003ad17ca0c3fmr41105149qtb.35.1673882701594; 
 Mon, 16 Jan 2023 07:25:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 x14-20020ac86b4e000000b003a816011d51sm14658838qts.38.2023.01.16.07.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 07:25:01 -0800 (PST)
Message-ID: <141cec0b-70a5-cd52-17a5-4db5248781c3@redhat.com>
Date: Mon, 16 Jan 2023 16:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 04/13] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
 <20230116141135.12021-5-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230116141135.12021-5-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/16/23 15:11, Avihai Horon wrote:
> Currently, if IOMMU of a VFIO container doesn't support dirty page
> tracking, migration is blocked. This is because a DMA-able VFIO device
> can dirty RAM pages without updating QEMU about it, thus breaking the
> migration.
> 
> However, this doesn't mean that migration can't be done at all.
> In such case, allow migration and let QEMU VFIO code mark all pages
> dirty.
> 
> This guarantees that all pages that might have gotten dirty are reported
> back, and thus guarantees a valid migration even without VFIO IOMMU
> dirty tracking support.
> 
> The motivation for this patch is the introduction of iommufd [1].
> iommufd can directly implement the /dev/vfio/vfio container IOCTLs by
> mapping them into its internal ops, allowing the usage of these IOCTLs
> over iommufd. However, VFIO IOMMU dirty tracking is not supported by
> this VFIO compatibility API.
> 
> This patch will allow migration by hosts that use the VFIO compatibility
> API and prevent migration regressions caused by the lack of VFIO IOMMU
> dirty tracking support.
> 
> [1]
> https://lore.kernel.org/kvm/0-v6-a196d26f289e+11787-iommufd_jgg@nvidia.com/
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/common.c    | 20 ++++++++++++++++++--
>   hw/vfio/migration.c |  3 +--
>   2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 130e5d1dc7..f6dd571549 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -488,6 +488,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
>           return -errno;
>       }
>   
> +    if (iotlb && vfio_devices_all_running_and_saving(container)) {
> +        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
> +                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
> +                                            DIRTY_CLIENTS_NOCODE);
> +    }
> +
>       return 0;
>   }
>   
> @@ -1201,6 +1207,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>           .argsz = sizeof(dirty),
>       };
>   
> +    if (!container->dirty_pages_supported) {
> +        return;
> +    }
> +
>       if (start) {
>           dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
>       } else {
> @@ -1236,6 +1246,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>       uint64_t pages;
>       int ret;
>   
> +    if (!container->dirty_pages_supported) {
> +        cpu_physical_memory_set_dirty_range(ram_addr, size,
> +                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
> +                                            DIRTY_CLIENTS_NOCODE);
> +        return 0;
> +    }
> +
>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>   
>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
> @@ -1409,8 +1426,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>   
> -    if (vfio_listener_skipped_section(section) ||
> -        !container->dirty_pages_supported) {
> +    if (vfio_listener_skipped_section(section)) {
>           return;
>       }
>   
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 09fe7c1de2..552c2313b2 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -860,11 +860,10 @@ int64_t vfio_mig_bytes_transferred(void)
>   
>   int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>   {
> -    VFIOContainer *container = vbasedev->group->container;
>       struct vfio_region_info *info = NULL;
>       int ret = -ENOTSUP;
>   
> -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> +    if (!vbasedev->enable_migration) {
>           goto add_blocker;
>       }
>   


