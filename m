Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACB669FEA3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 23:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUxnB-0008I1-LS; Wed, 22 Feb 2023 17:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUxnA-0008Hs-5y
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:40:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUxn7-0004Yi-PN
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677105648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+N1fHGSnsfWCkB8ralmM+SfWOGisqeRO2zK7waDbQ8=;
 b=SUTbdVmEvvo/7OQHQHXMZsxvc43S2/3xJu9akAR1vfq2mKZpQR70fn7SDOBR8W3ldhe1AM
 lX3t9SEHVyvbjNyTE1pKfn4KfCeh7zn/MGEfT1VyiLZrvj7pAdKJ/kXd0COU3Zc5KXTed5
 T1OsBQVwzX6pQ2M2pm1yCgqLAl7OvAQ=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-4Hn1JtXmN-u1EVkVvt1oWw-1; Wed, 22 Feb 2023 17:40:46 -0500
X-MC-Unique: 4Hn1JtXmN-u1EVkVvt1oWw-1
Received: by mail-io1-f72.google.com with SMTP id
 a21-20020a5d9595000000b0074c9dc19e16so611177ioo.15
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 14:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+N1fHGSnsfWCkB8ralmM+SfWOGisqeRO2zK7waDbQ8=;
 b=zQ6mJe2ToCNvo/q/0RE0WV8BaeR8iYo3ITajSNEVPKsxIir3eiyUqHng/6RyGCxwe7
 rjKIPS/WRVWHfJkAy4ROnc1H1JeECrYyeLnxJ6KYsxQTLDYwX0i30kxcNVzrcEdFNbNJ
 Cu7a4K6UE0NbuhVE0TqfByawiicSKLSaNG62AYLiDvyy6Y3PUHygVrAuyYoa3hIILMuE
 mM01OxtwH6Hsoou59K/AVxKS+9qSd8ow3/3EuznNYSTmbiv8lXzDjj8Ht5Y5dhbIhPHQ
 FjQiBKFOHm6+1xw2ry6KGv3b38YZypBoFqTheRia1nX8w0/MNfXDcC/h3Fk8KKa8AtAa
 /Okw==
X-Gm-Message-State: AO0yUKWiA1+6P7UTezy20HtuJjuDo7rq2w50SNuZTFxz2Zq+7+7xu4bC
 S7oisOhBiE4bUQQLUvyHeJKJ3zTY5Ui2MgZKRBsoNU6Vqadde75/KjOrhW5pVBpsdZM5BQYaZe4
 YlR3ozE4/7bjUHDs=
X-Received: by 2002:a92:cda4:0:b0:313:fddb:6e6f with SMTP id
 g4-20020a92cda4000000b00313fddb6e6fmr7601958ild.9.1677105645602; 
 Wed, 22 Feb 2023 14:40:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+xXNdXg/CVTuLLkNikylVJljjBENPU0XsdzQzB/zat8ZVfYxLibBRR6hSFrhNU8iXd5S74kw==
X-Received: by 2002:a92:cda4:0:b0:313:fddb:6e6f with SMTP id
 g4-20020a92cda4000000b00313fddb6e6fmr7601933ild.9.1677105645307; 
 Wed, 22 Feb 2023 14:40:45 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 l15-20020a02cd8f000000b0035678e2e175sm2526127jap.50.2023.02.22.14.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 14:40:44 -0800 (PST)
Date: Wed, 22 Feb 2023 15:40:43 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Jason Wang" <jasowang@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "David Hildenbrand"
 <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 11/20] vfio/common: Add device dirty page tracking
 start/stop
Message-ID: <20230222154043.35644d31.alex.williamson@redhat.com>
In-Reply-To: <20230222174915.5647-12-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-12-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 22 Feb 2023 19:49:06 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Add device dirty page tracking start/stop functionality. This uses the
> device DMA logging uAPI to start and stop dirty page tracking by device.
> 
> Device dirty page tracking is used only if all devices within a
> container support device dirty page tracking.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  include/hw/vfio/vfio-common.h |   2 +
>  hw/vfio/common.c              | 211 +++++++++++++++++++++++++++++++++-
>  2 files changed, 211 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 6f36876ce0..1f21e1fa43 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -149,6 +149,8 @@ typedef struct VFIODevice {
>      VFIOMigration *migration;
>      Error *migration_blocker;
>      OnOffAuto pre_copy_dirty_page_tracking;
> +    bool dirty_pages_supported;
> +    bool dirty_tracking;
>  } VFIODevice;
>  
>  struct VFIODeviceOps {
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6041da6c7e..740153e7d7 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -473,6 +473,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>      return true;
>  }
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
>  /*
>   * Check if all VFIO devices are running and migration is active, which is
>   * essentially equivalent to the migration being in pre-copy phase.
> @@ -1404,13 +1420,192 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>      return ret;
>  }
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
> +static gboolean vfio_device_dma_logging_range_add(DMAMap *map, gpointer data)
> +{
> +    struct vfio_device_feature_dma_logging_range **out = data;
> +    struct vfio_device_feature_dma_logging_range *range = *out;
> +
> +    range->iova = map->iova;
> +    /* IOVATree is inclusive, DMA logging uAPI isn't, so add 1 to length */
> +    range->length = map->size + 1;
> +
> +    *out = ++range;
> +
> +    return false;
> +}
> +
> +static gboolean vfio_iova_tree_get_first(DMAMap *map, gpointer data)
> +{
> +    DMAMap *first = data;
> +
> +    first->iova = map->iova;
> +    first->size = map->size;
> +
> +    return true;
> +}
> +
> +static gboolean vfio_iova_tree_get_last(DMAMap *map, gpointer data)
> +{
> +    DMAMap *last = data;
> +
> +    last->iova = map->iova;
> +    last->size = map->size;
> +
> +    return false;
> +}
> +
> +static struct vfio_device_feature *
> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
> +{
> +    struct vfio_device_feature *feature;
> +    size_t feature_size;
> +    struct vfio_device_feature_dma_logging_control *control;
> +    struct vfio_device_feature_dma_logging_range *ranges;
> +    unsigned int max_ranges;
> +    unsigned int cur_ranges;
> +
> +    feature_size = sizeof(struct vfio_device_feature) +
> +                   sizeof(struct vfio_device_feature_dma_logging_control);
> +    feature = g_malloc0(feature_size);
> +    feature->argsz = feature_size;
> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
> +
> +    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
> +    control->page_size = qemu_real_host_page_size();
> +
> +    QEMU_LOCK_GUARD(&container->mappings_mutex);
> +
> +    /*
> +     * DMA logging uAPI guarantees to support at least num_ranges that fits into
> +     * a single host kernel page. To be on the safe side, use this as a limit
> +     * from which to merge to a single range.
> +     */
> +    max_ranges = qemu_real_host_page_size() / sizeof(*ranges);
> +    cur_ranges = iova_tree_nnodes(container->mappings);
> +    control->num_ranges = (cur_ranges <= max_ranges) ? cur_ranges : 1;

This makes me suspicious that we're implementing to the characteristics
of a specific device rather than strictly to the vfio migration API.
Are we just trying to avoid the error handling to support the try and
fall back to a single range behavior?  If we want to make a
simplification, then document it as such.  The "[t]o be on the safe
side" phrasing above could later be interpreted as avoiding an issue
and might discourage a more complete implementation.  Thanks,

Alex

> +    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
> +                        control->num_ranges);
> +    if (!ranges) {
> +        g_free(feature);
> +        errno = ENOMEM;
> +
> +        return NULL;
> +    }
> +
> +    control->ranges = (uint64_t)ranges;
> +    if (cur_ranges <= max_ranges) {
> +        iova_tree_foreach(container->mappings,
> +                          vfio_device_dma_logging_range_add, &ranges);
> +    } else {
> +        DMAMap first, last;
> +
> +        iova_tree_foreach(container->mappings, vfio_iova_tree_get_first,
> +                          &first);
> +        iova_tree_foreach(container->mappings, vfio_iova_tree_get_last, &last);
> +        ranges->iova = first.iova;
> +        /* IOVATree is inclusive, DMA logging uAPI isn't, so add 1 to length */
> +        ranges->length = (last.iova - first.iova) + last.size + 1;
> +    }
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
> +    int ret;
> +
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
>  static void vfio_listener_log_global_start(MemoryListener *listener)
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>      int ret;
>  
> -    ret = vfio_set_dirty_page_tracking(container, true);
> +    if (vfio_devices_all_device_dirty_tracking(container)) {
> +        if (vfio_have_giommu(container)) {
> +            /* Device dirty page tracking currently doesn't support vIOMMU */
> +            return;
> +        }
> +
> +        ret = vfio_devices_dma_logging_start(container);
> +    } else {
> +        ret = vfio_set_dirty_page_tracking(container, true);
> +    }
> +
>      if (ret) {
> +        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
> +                     ret, strerror(-ret));
>          vfio_set_migration_error(ret);
>      }
>  }
> @@ -1420,8 +1615,20 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>      int ret;
>  
> -    ret = vfio_set_dirty_page_tracking(container, false);
> +    if (vfio_devices_all_device_dirty_tracking(container)) {
> +        if (vfio_have_giommu(container)) {
> +            /* Device dirty page tracking currently doesn't support vIOMMU */
> +            return;
> +        }
> +
> +        ret = vfio_devices_dma_logging_stop(container);
> +    } else {
> +        ret = vfio_set_dirty_page_tracking(container, false);
> +    }
> +
>      if (ret) {
> +        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
> +                     ret, strerror(-ret));
>          vfio_set_migration_error(ret);
>      }
>  }


