Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D906AE454
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:18:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZ4V-0005F4-0w; Tue, 07 Mar 2023 10:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZZ4T-0005EX-0K
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:17:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZZ4R-0000Yt-7t
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678202262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLGfwkZwn0a6pm8XxswMb0TUwk+PR8d66gGklXbZ7us=;
 b=V+gvGOSQQkO+S+yL2wYbyZ1AvaRuPsW6RBoErbtYo3btHGBH+kvzW/tBP2Wn1SDOjG+UbX
 MnP5zYyxzSBuaRLt6hokrbiNKzaxg4faa80lsgEoFt0yn8D50RSVb+Suxg4sxCaJJ6eFv+
 ixLr5h2QtbU5qc3aFP26Z419NXNbKww=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-0Zb1pSjFPRO_Lol8PBomwg-1; Tue, 07 Mar 2023 10:17:23 -0500
X-MC-Unique: 0Zb1pSjFPRO_Lol8PBomwg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso4900969wmi.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678202220;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GLGfwkZwn0a6pm8XxswMb0TUwk+PR8d66gGklXbZ7us=;
 b=Wh0W70Buyh/IGnZVRuYlNBFgVdIU0HsFKoJWNvCEA6k9SvbyiLZFGNaqobQnuLg69i
 4eBliOU4/dxGsI6niB6UWcb+c+0EAe9I/NV9IHOGAQ3hicerMXc9MOoVjO5+7yFKOSwO
 PQ2I1C0JigrIfjnYFOFMAke2CK95cVH7CLZQGqSOMWxJIp8cQ4GNBC9GnfHcgZiGRdJb
 L2Rd5mH1GTt3kfuYm3396LNdjjsaMG8xhLbQoSFt8Hg5unCY9v5XcdJDym+dq5+FRciu
 2/Lje3ds5X6BeaIePlXKRqQB8rh0Ll6jGKs5bWgZ+l7f7GoklpleyYl+iIWUJjxm2e34
 i2Aw==
X-Gm-Message-State: AO0yUKWR4nKQJiLVeAnncOk5nbe506TGeTYnMq+HmdpQrQ+FyscyYFyn
 3YxIQvhAEzoXD3s3XRHUbiD6Wb0FkBNjbc7TC6555mRe+8Vkfz2lFgVHun8ssgaxdW27cAKKQCR
 yn5Bf1DKOj2p3Rbk=
X-Received: by 2002:a05:600c:444c:b0:3eb:39e2:915b with SMTP id
 v12-20020a05600c444c00b003eb39e2915bmr12900177wmn.31.1678202220292; 
 Tue, 07 Mar 2023 07:17:00 -0800 (PST)
X-Google-Smtp-Source: AK7set89Ev+lTHX1T7RkUgw09R71L19NcN5ann+8PfmLbJqL6B0FNtmVOEYuiH8k/y1k7ibf+Rfg/A==
X-Received: by 2002:a05:600c:444c:b0:3eb:39e2:915b with SMTP id
 v12-20020a05600c444c00b003eb39e2915bmr12900159wmn.31.1678202220021; 
 Tue, 07 Mar 2023 07:17:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 hg13-20020a05600c538d00b003d9aa76dc6asm16939357wmb.0.2023.03.07.07.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:16:59 -0800 (PST)
Message-ID: <0485a249-bca6-f753-8acb-86fb7a2997cd@redhat.com>
Date: Tue, 7 Mar 2023 16:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 12/15] vfio/common: Add device dirty page bitmap sync
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
 <20230307125450.62409-13-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230307125450.62409-13-joao.m.martins@oracle.com>
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

On 3/7/23 13:54, Joao Martins wrote:
> Add device dirty page bitmap sync functionality. This uses the device
> DMA logging uAPI to sync dirty page bitmap from the device.
> 
> Device dirty page bitmap sync is used only if all devices within a
> container support device dirty page tracking.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/common.c | 88 +++++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 79 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 1f97a8a3db18..2639b393a781 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -339,6 +339,9 @@ static int vfio_bitmap_alloc(VFIOBitmap *vbmap, hwaddr size)
>       return 0;
>   }
>   
> +static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
> +                                 uint64_t size, ram_addr_t ram_addr);
> +
>   bool vfio_mig_active(void)
>   {
>       VFIOGroup *group;
> @@ -562,10 +565,16 @@ static int vfio_dma_unmap(VFIOContainer *container,
>           .iova = iova,
>           .size = size,
>       };
> +    bool need_dirty_sync = false;
> +    int ret;
> +
> +    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
> +        if (!vfio_devices_all_device_dirty_tracking(container) &&
> +            container->dirty_pages_supported) {
> +            return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
> +        }
>   
> -    if (iotlb && container->dirty_pages_supported &&
> -        vfio_devices_all_running_and_mig_active(container)) {
> -        return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
> +        need_dirty_sync = true;
>       }
>   
>       while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
> @@ -591,10 +600,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
>           return -errno;
>       }
>   
> -    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
> -        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
> -                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
> -                                            DIRTY_CLIENTS_NOCODE);
> +    if (need_dirty_sync) {
> +        ret = vfio_get_dirty_bitmap(container, iova, size,
> +                                    iotlb->translated_addr);
> +        if (ret) {
> +            return ret;
> +        }
>       }
>   
>       return 0;
> @@ -1595,6 +1606,58 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>       }
>   }
>   
> +static int vfio_device_dma_logging_report(VFIODevice *vbasedev, hwaddr iova,
> +                                          hwaddr size, void *bitmap)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                        sizeof(struct vfio_device_feature_dma_logging_report),
> +                        sizeof(__u64))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> +    struct vfio_device_feature_dma_logging_report *report =
> +        (struct vfio_device_feature_dma_logging_report *)feature->data;
> +
> +    report->iova = iova;
> +    report->length = size;
> +    report->page_size = qemu_real_host_page_size();
> +    report->bitmap = (__u64)(uintptr_t)bitmap;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags = VFIO_DEVICE_FEATURE_GET |
> +                     VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT;
> +
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        return -errno;
> +    }
> +
> +    return 0;
> +}
> +
> +static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
> +                                           VFIOBitmap *vbmap, hwaddr iova,
> +                                           hwaddr size)
> +{
> +    VFIODevice *vbasedev;
> +    VFIOGroup *group;
> +    int ret;
> +
> +    QLIST_FOREACH(group, &container->group_list, container_next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            ret = vfio_device_dma_logging_report(vbasedev, iova, size,
> +                                                 vbmap->bitmap);
> +            if (ret) {
> +                error_report("%s: Failed to get DMA logging report, iova: "
> +                             "0x%" HWADDR_PRIx ", size: 0x%" HWADDR_PRIx
> +                             ", err: %d (%s)",
> +                             vbasedev->name, iova, size, ret, strerror(-ret));
> +
> +                return ret;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>   static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
>                                      hwaddr iova, hwaddr size)
>   {
> @@ -1635,10 +1698,12 @@ static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
>   static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>                                    uint64_t size, ram_addr_t ram_addr)
>   {
> +    bool all_device_dirty_tracking =
> +        vfio_devices_all_device_dirty_tracking(container);
>       VFIOBitmap vbmap;
>       int ret;
>   
> -    if (!container->dirty_pages_supported) {
> +    if (!container->dirty_pages_supported && !all_device_dirty_tracking) {
>           cpu_physical_memory_set_dirty_range(ram_addr, size,
>                                               tcg_enabled() ? DIRTY_CLIENTS_ALL :
>                                               DIRTY_CLIENTS_NOCODE);
> @@ -1650,7 +1715,12 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           return ret;
>       }
>   
> -    ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
> +    if (all_device_dirty_tracking) {
> +        ret = vfio_devices_query_dirty_bitmap(container, &vbmap, iova, size);
> +    } else {
> +        ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
> +    }
> +
>       if (ret) {
>           goto out;
>       }


