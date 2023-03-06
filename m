Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8336A6ACC77
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:26:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFWs-0002X0-8L; Mon, 06 Mar 2023 13:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZFWq-0002Wm-47
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:25:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZFWo-0008QB-1M
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678127141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGTm4LmNEm46OGVE7HcP6go5gS6O5KNg8Uew0dUf5LQ=;
 b=U91qB5wxrYaaRBLGALOFH6dcPnuF8qsvSnT/JrFK5slkCh4d0OPqmXWMpSTnA14nhKRKwD
 mV5QKeV3h3EuJeTlmFO/J/binIAUl2NzL1np/FCBfeLLy6rQi5AFK+f9bUV5Jigs+3uAWP
 eC+IFpfAgJInZJG779JKtkUXsTzHdTY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-7LD_8F2vNpCHSAcTEdg56A-1; Mon, 06 Mar 2023 13:25:39 -0500
X-MC-Unique: 7LD_8F2vNpCHSAcTEdg56A-1
Received: by mail-qt1-f199.google.com with SMTP id
 g11-20020ac8774b000000b003bfa92f56cbso5630388qtu.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678127139;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iGTm4LmNEm46OGVE7HcP6go5gS6O5KNg8Uew0dUf5LQ=;
 b=X6hCHXcpcdKa564Zf8WsrvWWVU+u/qONBH1HKhm6ctAAALrD/PDZ4SMSWZ21FbEx1W
 x+MeYaZoChV6xc+31eZTjtr26s6o/FkcPU2f52UG1XR8eolYeB5GE7ldHcGXKN+pyWkm
 Do2b+5NStpcUlkJ2RGP+FZcyN0y2ZEkv2Eru/5t2raE4MDaY/iOop97ijbKESSY7zqoX
 dXA7kHOmQEBJ8JyT6sKD1Sbv600FwQBeup11gUK4TE8QeQe9U3UMnvgla4AClQeGzExT
 EaPuWxki3q811AkFub20+gEY4Q8M97TaWJBkn5VbGTMZCyJSIQFmjdMjlgYBYayRsaE3
 DeBQ==
X-Gm-Message-State: AO0yUKUTtnKT0dxxDoU4RXQUdt2b1XVpUz1AE5HsApVKGyIqW6V2zZWi
 aOTVb8MTlO9XJuiBMpOY07TNI/On4aG61KMjvth+1Ee9kWiDrxqP33iNBkP0OPV/zYVIcnKkuMx
 1zSPvNLhbj5DXT/M=
X-Received: by 2002:a05:622a:1a01:b0:3bd:1a8a:8015 with SMTP id
 f1-20020a05622a1a0100b003bd1a8a8015mr17839657qtb.16.1678127139218; 
 Mon, 06 Mar 2023 10:25:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/4GFip77TlTlDU1FPr45kkjga44LMKLKuv00ExqGgAZ7s1RqM+eJS8feXy4lv0VVdWl7tCEQ==
X-Received: by 2002:a05:622a:1a01:b0:3bd:1a8a:8015 with SMTP id
 f1-20020a05622a1a0100b003bd1a8a8015mr17839626qtb.16.1678127138959; 
 Mon, 06 Mar 2023 10:25:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 d25-20020ac84e39000000b003995f6513b9sm7831062qtw.95.2023.03.06.10.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:25:38 -0800 (PST)
Message-ID: <9954a11e-a63f-01d2-e6a4-65df42e578e6@redhat.com>
Date: Mon, 6 Mar 2023 19:25:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 08/13] vfio/common: Add device dirty page tracking
 start/stop
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-9-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-9-joao.m.martins@oracle.com>
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
> Add device dirty page tracking start/stop functionality. This uses the
> device DMA logging uAPI to start and stop dirty page tracking by device.
> 
> Device dirty page tracking is used only if all devices within a
> container support device dirty page tracking.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

The device attribute 'dirty_pages_supported' is only set in patch 12,
when all checks are done. That was a bit confusing when I started
looking. It should be fine anyhow.

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/common.c              | 166 +++++++++++++++++++++++++++++++++-
>   hw/vfio/trace-events          |   1 +
>   include/hw/vfio/vfio-common.h |   2 +
>   3 files changed, 166 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index d84e5fd86bb4..aa0df0604704 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -453,6 +453,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>       return true;
>   }
>   
> +static bool vfio_devices_all_device_dirty_tracking(VFIOContainer *container)
> +{
> +    VFIOGroup *group;
> +    VFIODevice *vbasedev;
> +
> +    QLIST_FOREACH(group, &container->group_list, container_next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            if (!vbasedev->dirty_pages_supported) {
> +                return false;
> +            }
> +        }
> +    }
> +
> +    return true;
> +}
> +
>   /*
>    * Check if all VFIO devices are running and migration is active, which is
>    * essentially equivalent to the migration being in pre-copy phase.
> @@ -1395,15 +1411,152 @@ static void vfio_dirty_tracking_init(VFIOContainer *container)
>       qemu_mutex_destroy(&container->tracking_mutex);
>   }
>   
> +static int vfio_devices_dma_logging_set(VFIOContainer *container,
> +                                        struct vfio_device_feature *feature)
> +{
> +    bool status = (feature->flags & VFIO_DEVICE_FEATURE_MASK) ==
> +                  VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
> +    VFIODevice *vbasedev;
> +    VFIOGroup *group;
> +    int ret = 0;
> +
> +    QLIST_FOREACH(group, &container->group_list, container_next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            if (vbasedev->dirty_tracking == status) {
> +                continue;
> +            }
> +
> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
> +            if (ret) {
> +                ret = -errno;
> +                error_report("%s: Failed to set DMA logging %s, err %d (%s)",
> +                             vbasedev->name, status ? "start" : "stop", ret,
> +                             strerror(errno));
> +                goto out;
> +            }
> +            vbasedev->dirty_tracking = status;
> +        }
> +    }
> +
> +out:
> +    return ret;
> +}
> +
> +static int vfio_devices_dma_logging_stop(VFIOContainer *container)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
> +
> +    return vfio_devices_dma_logging_set(container, feature);
> +}
> +
> +static struct vfio_device_feature *
> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
> +{
> +    struct vfio_device_feature *feature;
> +    size_t feature_size;
> +    struct vfio_device_feature_dma_logging_control *control;
> +    struct vfio_device_feature_dma_logging_range *ranges;
> +    VFIODirtyTrackingRange *tracking = &container->tracking_range;
> +
> +    feature_size = sizeof(struct vfio_device_feature) +
> +                   sizeof(struct vfio_device_feature_dma_logging_control);
> +    feature = g_try_malloc0(feature_size);
> +    if (!feature) {
> +        errno = ENOMEM;
> +        return NULL;
> +    }
> +    feature->argsz = feature_size;
> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
> +
> +    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
> +    control->page_size = qemu_real_host_page_size();
> +
> +    /*
> +     * DMA logging uAPI guarantees to support at least a number of ranges that
> +     * fits into a single host kernel base page.
> +     */
> +    control->num_ranges = !!tracking->max32 + !!tracking->max64;
> +    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
> +                        control->num_ranges);
> +    if (!ranges) {
> +        g_free(feature);
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    control->ranges = (__aligned_u64)ranges;
> +    if (tracking->max32) {
> +        ranges->iova = tracking->min32;
> +        ranges->length = (tracking->max32 - tracking->min32) + 1;
> +        ranges++;
> +    }
> +    if (tracking->max64) {
> +        ranges->iova = tracking->min64;
> +        ranges->length = (tracking->max64 - tracking->min64) + 1;
> +    }
> +
> +    trace_vfio_device_dirty_tracking_start(control->num_ranges,
> +                                           tracking->min32, tracking->max32,
> +                                           tracking->min64, tracking->max64);
> +
> +    return feature;
> +}
> +
> +static void vfio_device_feature_dma_logging_start_destroy(
> +    struct vfio_device_feature *feature)
> +{
> +    struct vfio_device_feature_dma_logging_control *control =
> +        (struct vfio_device_feature_dma_logging_control *)feature->data;
> +    struct vfio_device_feature_dma_logging_range *ranges =
> +        (struct vfio_device_feature_dma_logging_range *)control->ranges;
> +
> +    g_free(ranges);
> +    g_free(feature);
> +}
> +
> +static int vfio_devices_dma_logging_start(VFIOContainer *container)
> +{
> +    struct vfio_device_feature *feature;
> +    int ret = 0;
> +
> +    vfio_dirty_tracking_init(container);
> +    feature = vfio_device_feature_dma_logging_start_create(container);
> +    if (!feature) {
> +        return -errno;
> +    }
> +
> +    ret = vfio_devices_dma_logging_set(container, feature);
> +    if (ret) {
> +        vfio_devices_dma_logging_stop(container);
> +    }
> +
> +    vfio_device_feature_dma_logging_start_destroy(feature);
> +
> +    return ret;
> +}
> +
>   static void vfio_listener_log_global_start(MemoryListener *listener)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>       int ret;
>   
> -    vfio_dirty_tracking_init(container);
> +    if (vfio_devices_all_device_dirty_tracking(container)) {
> +        ret = vfio_devices_dma_logging_start(container);
> +    } else {
> +        ret = vfio_set_dirty_page_tracking(container, true);
> +    }
>   
> -    ret = vfio_set_dirty_page_tracking(container, true);
>       if (ret) {
> +        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
> +                     ret, strerror(-ret));
>           vfio_set_migration_error(ret);
>       }
>   }
> @@ -1413,8 +1566,15 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>       int ret;
>   
> -    ret = vfio_set_dirty_page_tracking(container, false);
> +    if (vfio_devices_all_device_dirty_tracking(container)) {
> +        ret = vfio_devices_dma_logging_stop(container);
> +    } else {
> +        ret = vfio_set_dirty_page_tracking(container, false);
> +    }
> +
>       if (ret) {
> +        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
> +                     ret, strerror(-ret));
>           vfio_set_migration_error(ret);
>       }
>   }
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index d97a6de17921..7a7e0cfe5b23 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -105,6 +105,7 @@ vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t si
>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
> +vfio_device_dirty_tracking_start(int nr_ranges, uint64_t min32, uint64_t max32, uint64_t min64, uint64_t max64) "nr_ranges %d 32:[0x%"PRIx64" - 0x%"PRIx64"], 64:[0x%"PRIx64" - 0x%"PRIx64"]"
>   vfio_disconnect_container(int fd) "close container->fd=%d"
>   vfio_put_group(int fd) "close group->fd=%d"
>   vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 96791add2719..1cbbccd91e11 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -154,6 +154,8 @@ typedef struct VFIODevice {
>       VFIOMigration *migration;
>       Error *migration_blocker;
>       OnOffAuto pre_copy_dirty_page_tracking;
> +    bool dirty_pages_supported;
> +    bool dirty_tracking;
>   } VFIODevice;
>   
>   struct VFIODeviceOps {


