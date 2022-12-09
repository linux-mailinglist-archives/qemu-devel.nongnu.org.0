Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1AC648657
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:12:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3fyA-0007ar-Ex; Fri, 09 Dec 2022 11:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p3fxs-0007aT-M4
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:11:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p3fxo-0000pB-5U
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670602261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asYjZEbyyFLfc5JvXWmIx/dJnRwiZ0aX5i4Oh1KGHXY=;
 b=jBjC9AigQ25Jqi9TJ5YnevvQM4CjOxY8JBzlsdaJIn1KMsle+5b90Rz1XJL0fbzTrFbgGt
 DkIHxjuio83gMC9ovtbGn7PxVsnnN95UZuSlHdwoeTvJwSbnpYW0jYuT4LCgQjGx4QMn77
 PJdJivO4iOqQhxfTgvcC84gv9vNnHmw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-PGX18GuAMEGAyXO4HXy0UQ-1; Fri, 09 Dec 2022 11:10:59 -0500
X-MC-Unique: PGX18GuAMEGAyXO4HXy0UQ-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-39afd53dcdbso54818487b3.8
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=asYjZEbyyFLfc5JvXWmIx/dJnRwiZ0aX5i4Oh1KGHXY=;
 b=1J9SGDmTEAzbrbLrKIygFE9BQMQGRkbOFgkMecyfq06tVlXpTom+5QMDni9GDdYKgl
 59xHol1RA7gdATfkM4FMoRuUkpfeXNoPm8eDjh77h8FDUx1cVu53jBcAy74Uc7g+WP0V
 x9Eero+SYo2rFa0nbdqAmJ/BSglE+ODe3/sx7sM2y31ov8xWDMbKfHUGLmYGfsWvJbdo
 +jp+cAn2G2bsYLuWpJWRNCaTpiDv4Z1qxbvn1nUYNjo4PEOVDJdxNWU9YvdUaMmO7bCs
 mRHyQ2+YX3+5BYpNgHiJicvfRvPckdB0KKM+TsY/FLCpKtWlplD3dTaGlQQ2h+IemBAl
 Ihzw==
X-Gm-Message-State: ANoB5pliDeKMkalg6gmZ85+wqtfePN9kTabKlkJrmw2l8d0aQlXhAcP8
 Xt3i6b/38XXzOw75jvX0emnsuEFQfjc7x8RRv9MWn27ntvQbLKkgKBC1HBWHADsYy2/QQz8+V7o
 IrDS3VE9IdvJ3tio=
X-Received: by 2002:a05:7500:461b:b0:ea:d516:d57a with SMTP id
 ge27-20020a057500461b00b000ead516d57amr557931gab.14.1670602258338; 
 Fri, 09 Dec 2022 08:10:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7D7c+rVic0GrbkUue875CtePkC7vrQd1TOWnV2BY3DE6hnxaCBv4LC+/YTpBT8cmazIZTRIw==
X-Received: by 2002:a05:7500:461b:b0:ea:d516:d57a with SMTP id
 ge27-20020a057500461b00b000ead516d57amr557898gab.14.1670602257781; 
 Fri, 09 Dec 2022 08:10:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a05620a269900b006cec8001bf4sm143043qkp.26.2022.12.09.08.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 08:10:57 -0800 (PST)
Message-ID: <f3cda64b-ed4b-5e4d-5a0d-82c3b3861d41@redhat.com>
Date: Fri, 9 Dec 2022 17:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 03/24] vfio-user: add container IO ops vector
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <d357c8c243ef839cc8e41fc1ae5c8db2d98fc2cc.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <d357c8c243ef839cc8e41fc1ae5c8db2d98fc2cc.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hello John,

On 11/9/22 00:13, John Johnson wrote:
> Used for communication with VFIO driver
> (prep work for vfio-user, which will communicate over a socket)
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> ---
>   hw/vfio/common.c              | 126 ++++++++++++++++++++++++++++--------------
>   include/hw/vfio/vfio-common.h |  33 +++++++++++
>   2 files changed, 117 insertions(+), 42 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562..83d69b9 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -432,12 +432,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>           goto unmap_exit;
>       }
>   
> -    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
> +    ret = CONT_DMA_UNMAP(container, unmap, bitmap);

I am not sure these macros are very useful, compared to :

     container->ops->dma_unmap(container, unmap, bitmap);

>       if (!ret) {
>           cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
>                   iotlb->translated_addr, pages);
>       } else {
> -        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
> +        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %s", strerror(-ret));
>       }
>   
>       g_free(bitmap->data);
> @@ -465,30 +465,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
>           return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>       }
>   
> -    while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
> -        /*
> -         * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
> -         * v4.15) where an overflow in its wrap-around check prevents us from
> -         * unmapping the last page of the address space.  Test for the error
> -         * condition and re-try the unmap excluding the last page.  The
> -         * expectation is that we've never mapped the last page anyway and this
> -         * unmap request comes via vIOMMU support which also makes it unlikely
> -         * that this page is used.  This bug was introduced well after type1 v2
> -         * support was introduced, so we shouldn't need to test for v1.  A fix
> -         * is queued for kernel v5.0 so this workaround can be removed once
> -         * affected kernels are sufficiently deprecated.
> -         */
> -        if (errno == EINVAL && unmap.size && !(unmap.iova + unmap.size) &&
> -            container->iommu_type == VFIO_TYPE1v2_IOMMU) {
> -            trace_vfio_dma_unmap_overflow_workaround();
> -            unmap.size -= 1ULL << ctz64(container->pgsizes);
> -            continue;
> -        }
> -        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
> -        return -errno;
> -    }
> -
> -    return 0;
> +    return CONT_DMA_UNMAP(container, &unmap, NULL);
>   }
>   
>   static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
> @@ -501,24 +478,18 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>           .iova = iova,
>           .size = size,
>       };
> +    int ret;
>   
>       if (!readonly) {
>           map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>       }
>   
> -    /*
> -     * Try the mapping, if it fails with EBUSY, unmap the region and try
> -     * again.  This shouldn't be necessary, but we sometimes see it in
> -     * the VGA ROM space.
> -     */
> -    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0 ||
> -        (errno == EBUSY && vfio_dma_unmap(container, iova, size, NULL) == 0 &&
> -         ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0)) {
> -        return 0;
> -    }
> +    ret = CONT_DMA_MAP(container, &map);
>   
> -    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
> -    return -errno;
> +    if (ret < 0) {
> +        error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
> +    }
> +    return ret;
>   }
>   
>   static void vfio_host_win_add(VFIOContainer *container,
> @@ -1263,10 +1234,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>           dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
>       }
>   
> -    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
> +    ret = CONT_DIRTY_BITMAP(container, &dirty, NULL);
>       if (ret) {
>           error_report("Failed to set dirty tracking flag 0x%x errno: %d",
> -                     dirty.flags, errno);
> +                     dirty.flags, -ret);
>       }
>   }
>   
> @@ -1316,11 +1287,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           goto err_out;
>       }
>   
> -    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
> +    ret = CONT_DIRTY_BITMAP(container, dbitmap, range);
>       if (ret) {
>           error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
>                   " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
> -                (uint64_t)range->size, errno);
> +                (uint64_t)range->size, -ret);
>           goto err_out;
>       }
>   
> @@ -2090,6 +2061,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>       container->error = NULL;
>       container->dirty_pages_supported = false;
>       container->dma_max_mappings = 0;
> +    container->io_ops = &vfio_cont_io_ioctl;
>       QLIST_INIT(&container->giommu_list);
>       QLIST_INIT(&container->hostwin_list);
>       QLIST_INIT(&container->vrdl_list);
> @@ -2626,3 +2598,73 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
>       }
>       return vfio_eeh_container_op(container, op);
>   }
> +
> +/*
> + * Traditional ioctl() based io_ops
> + */
> +
> +static int vfio_io_dma_map(VFIOContainer *container,
> +                           struct vfio_iommu_type1_dma_map *map)
> +{
> +
> +    /*
> +     * Try the mapping, if it fails with EBUSY, unmap the region and try
> +     * again.  This shouldn't be necessary, but we sometimes see it in
> +     * the VGA ROM space.
> +     */
> +    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, map) == 0 ||
> +        (errno == EBUSY &&
> +         vfio_dma_unmap(container, map->iova, map->size, NULL) == 0 &&
> +         ioctl(container->fd, VFIO_IOMMU_MAP_DMA, map) == 0)) {
> +        return 0;
> +    }
> +    return -errno;
> +}
> +
> +static int vfio_io_dma_unmap(VFIOContainer *container,
> +                             struct vfio_iommu_type1_dma_unmap *unmap,
> +                             struct vfio_bitmap *bitmap)
> +{
> +
> +    while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap)) {
> +        /*
> +         * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
> +         * v4.15) where an overflow in its wrap-around check prevents us from
> +         * unmapping the last page of the address space.  Test for the error
> +         * condition and re-try the unmap excluding the last page.  The
> +         * expectation is that we've never mapped the last page anyway and this
> +         * unmap request comes via vIOMMU support which also makes it unlikely
> +         * that this page is used.  This bug was introduced well after type1 v2
> +         * support was introduced, so we shouldn't need to test for v1.  A fix
> +         * is queued for kernel v5.0 so this workaround can be removed once
> +         * affected kernels are sufficiently deprecated.
> +         */
> +        if (errno == EINVAL && unmap->size && !(unmap->iova + unmap->size) &&
> +            container->iommu_type == VFIO_TYPE1v2_IOMMU) {
> +            trace_vfio_dma_unmap_overflow_workaround();
> +            unmap->size -= 1ULL << ctz64(container->pgsizes);
> +            continue;
> +        }
> +        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
> +        return -errno;
> +    }
> +
> +    return 0;
> +}
> +
> +static int vfio_io_dirty_bitmap(VFIOContainer *container,
> +                                struct vfio_iommu_type1_dirty_bitmap *bitmap,
> +                                struct vfio_iommu_type1_dirty_bitmap_get *range)
> +{
> +    int ret;
> +
> +    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, bitmap);
> +
> +    return ret < 0 ? -errno : ret;
> +}
> +
> +VFIOContIO vfio_cont_io_ioctl = {
> +    .dma_map = vfio_io_dma_map,
> +    .dma_unmap = vfio_io_dma_unmap,
> +    .dirty_bitmap = vfio_io_dirty_bitmap,
> +};
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index e573f5a..6fd40f1 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
>   } VFIOAddressSpace;
>   
>   struct VFIOGroup;
> +typedef struct VFIOContIO VFIOContIO;
>   
>   typedef struct VFIOContainer {
>       VFIOAddressSpace *space;
> @@ -83,6 +84,7 @@ typedef struct VFIOContainer {
>       MemoryListener prereg_listener;
>       unsigned iommu_type;
>       Error *error;
> +    VFIOContIO *io_ops;

ops should be enough.

>       bool initialized;
>       bool dirty_pages_supported;
>       uint64_t dirty_pgsizes;
> @@ -154,6 +156,37 @@ struct VFIODeviceOps {
>       int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
>   };
>   
> +#ifdef CONFIG_LINUX
> +
> +/*
> + * The next 2 ops vectors are how Devices and Containers
> + * communicate with the server.  The default option is
> + * through ioctl() to the kernel VFIO driver, but vfio-user
> + * can use a socket to a remote process.
> + */
> +
> +struct VFIOContIO {

VFIOContainerOps seems more adequate with the current VFIO terminology
in QEMU.

Thanks,

C.

> +    int (*dma_map)(VFIOContainer *container,
> +                   struct vfio_iommu_type1_dma_map *map);
> +    int (*dma_unmap)(VFIOContainer *container,
> +                     struct vfio_iommu_type1_dma_unmap *unmap,
> +                     struct vfio_bitmap *bitmap);
> +    int (*dirty_bitmap)(VFIOContainer *container,
> +                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
> +                        struct vfio_iommu_type1_dirty_bitmap_get *range);
> +};
> +
> +#define CONT_DMA_MAP(cont, map) \
> +    ((cont)->io_ops->dma_map((cont), (map)))
> +#define CONT_DMA_UNMAP(cont, unmap, bitmap) \
> +    ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap)))
> +#define CONT_DIRTY_BITMAP(cont, bitmap, range) \
> +    ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
> +
> +extern VFIOContIO vfio_cont_io_ioctl;
> +
> +#endif /* CONFIG_LINUX */
> +
>   typedef struct VFIOGroup {
>       int fd;
>       int groupid;


