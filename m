Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF364B82C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:15:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56zw-0001md-Ic; Tue, 13 Dec 2022 10:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p56zt-0001jv-8h
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p56zr-0003Je-3l
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670944505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEEQinfodvuurYQ5AUzlULz2RsIVixV0hmddDBloGDw=;
 b=GDxrDdLBR2WPUqsaP7i6iLZAF67OVNaKczDT71kj7B2l7TB2khxOfrKzE+I0g9gbDpHQ5w
 NDrJYMmCY3PU5sEtJqgAH2q/ifNcHgvX52IwrkFHSscdVk2hQyi3m8UWH1w7AewVAN9I3O
 96H8wMlop05+AE+7cgmPI1fwc7a//HU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-180-KrUY2mzAMEKmI-RUZsF3zg-1; Tue, 13 Dec 2022 10:15:04 -0500
X-MC-Unique: KrUY2mzAMEKmI-RUZsF3zg-1
Received: by mail-yb1-f198.google.com with SMTP id
 a4-20020a5b0004000000b006fdc6aaec4fso17235470ybp.20
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 07:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QEEQinfodvuurYQ5AUzlULz2RsIVixV0hmddDBloGDw=;
 b=k1KMcHDB+14VcjTZ3fkXn7eRTC1yFq7tehogcsP/n+gRC+arJ5Xcyb9/P1fo3QP3qQ
 GFmiGTwSpcn2rXx2Sbf6XLHGqGj6ir0+bgnX4JFpdRlca/KBnw8jNEgU7Sno84Vd4XYt
 BhZQZkEEVTenO14Z+0tAh6ljpeVqQMJgrWqzF0XUkO3eCMM07ruDlCDO0qRicnZycz5y
 hOUKCHkQI3B2T7uw+7e5K8r+tGe2dMl2TKpYeV7rBA3KaiN1RTEsLwT+1XhYozVilm7o
 gkgp84/Gee+MMN8l9ZtBPGvG3blfpcoipKvYmyfnrg7qEJWbV8FjwqSf9UQ0OcyPNYvi
 yTQw==
X-Gm-Message-State: ANoB5pnmhMGVKUak1tScmCuWJZZdnKwHrEEo5ZzBORJbh8m+EFL0VcHY
 pMao4kv7TQmsnt6+YVeHNJcZ1HiGKnckuMT865HrKtaxRw26AT4XZwsTU5kIb/ld5hbxAGYHmVP
 VULow5axYUBQIx2A=
X-Received: by 2002:a05:7500:4105:b0:eb:113e:e4ef with SMTP id
 bs5-20020a057500410500b000eb113ee4efmr2132443gab.30.1670944503184; 
 Tue, 13 Dec 2022 07:15:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf68AfrdlOl9uAAt3Neisclj+nTRU/XdJtlI16uJ2FsPn61wPjSwDV2TE/Pqvc7VLT3SmCm5FQ==
X-Received: by 2002:a05:7500:4105:b0:eb:113e:e4ef with SMTP id
 bs5-20020a057500410500b000eb113ee4efmr2132401gab.30.1670944502621; 
 Tue, 13 Dec 2022 07:15:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05620a0c4600b006fbaf9c1b70sm7971348qki.133.2022.12.13.07.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 07:15:02 -0800 (PST)
Message-ID: <0d1d0cc9-61f1-3d0d-690f-75c61ddeab8d@redhat.com>
Date: Tue, 13 Dec 2022 16:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 11/24] vfio-user: get region info
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <b5ae7ec3fe3fb88166fe80e8bf0cbba9e85088e0.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <b5ae7ec3fe3fb88166fe80e8bf0cbba9e85088e0.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/9/22 00:13, John Johnson wrote:
> Add per-region FD to support mmap() of remote device regions
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   hw/vfio/common.c              | 32 ++++++++++++++++++++---
>   hw/vfio/user-protocol.h       | 14 ++++++++++
>   hw/vfio/user.c                | 59 +++++++++++++++++++++++++++++++++++++++++++
>   include/hw/vfio/vfio-common.h |  8 +++---
>   4 files changed, 107 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index c589bd9..87400b3 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -41,6 +41,7 @@
>   #include "qapi/error.h"
>   #include "migration/migration.h"
>   #include "sysemu/tpm.h"
> +#include "hw/vfio/user.h"
>   
>   VFIOGroupList vfio_group_list =
>       QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -1586,6 +1587,11 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
>       region->size = info->size;
>       region->fd_offset = info->offset;
>       region->nr = index;
> +    if (vbasedev->regfds != NULL) {
> +        region->fd = vbasedev->regfds[index];
> +    } else {
> +        region->fd = vbasedev->fd;
> +    }
>   
>       if (region->size) {
>           region->mem = g_new0(MemoryRegion, 1);
> @@ -1637,7 +1643,7 @@ int vfio_region_mmap(VFIORegion *region)
>   
>       for (i = 0; i < region->nr_mmaps; i++) {
>           region->mmaps[i].mmap = mmap(NULL, region->mmaps[i].size, prot,
> -                                     MAP_SHARED, region->vbasedev->fd,
> +                                     MAP_SHARED, region->fd,
>                                        region->fd_offset +
>                                        region->mmaps[i].offset);
>           if (region->mmaps[i].mmap == MAP_FAILED) {
> @@ -2442,10 +2448,17 @@ void vfio_put_base_device(VFIODevice *vbasedev)
>           int i;
>   
>           for (i = 0; i < vbasedev->num_regions; i++) {
> +            if (vbasedev->regfds != NULL && vbasedev->regfds[i] != -1) {
> +                close(vbasedev->regfds[i]);
> +            }
>               g_free(vbasedev->regions[i]);
>           }
>           g_free(vbasedev->regions);
>           vbasedev->regions = NULL;
> +        if (vbasedev->regfds != NULL) {
> +            g_free(vbasedev->regfds);
> +            vbasedev->regfds = NULL;
> +        }
>       }
>   
>       if (!vbasedev->group) {
> @@ -2461,12 +2474,16 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
>                            struct vfio_region_info **info)
>   {
>       size_t argsz = sizeof(struct vfio_region_info);
> +    int fd = -1;
>       int ret;
>   
>       /* create region cache */
>       if (vbasedev->regions == NULL) {
>           vbasedev->regions = g_new0(struct vfio_region_info *,
>                                      vbasedev->num_regions);
> +        if (vbasedev->proxy != NULL) {

This looks like a shortcut. Could we introduce at least an inline helper
returning the need to allocate an fd per region ? It could use the same
kind of heuristic but it would be hidden under a helper.

> +            vbasedev->regfds = g_new0(int, vbasedev->num_regions);
> +        }
>       }
>       /* check cache */
>       if (vbasedev->regions[index] != NULL) {
> @@ -2480,7 +2497,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
>   retry:
>       (*info)->argsz = argsz;
>   
> -    ret = VDEV_GET_REGION_INFO(vbasedev, *info);
> +    ret = VDEV_GET_REGION_INFO(vbasedev, *info, &fd);
>       if (ret != 0) {
>           g_free(*info);
>           *info = NULL;
> @@ -2490,12 +2507,19 @@ retry:
>       if ((*info)->argsz > argsz) {
>           argsz = (*info)->argsz;
>           *info = g_realloc(*info, argsz);
> +        if (fd != -1) {
> +            close(fd);
> +            fd = -1;
> +        }
>   
>           goto retry;
>       }
>   
>       /* fill cache */
>       vbasedev->regions[index] = *info;
> +    if (vbasedev->regfds != NULL) {
> +        vbasedev->regfds[index] = fd;
> +    }
>   
>       return 0;
>   }
> @@ -2655,10 +2679,12 @@ static int vfio_io_get_info(VFIODevice *vbasedev, struct vfio_device_info *info)
>   }
>   
>   static int vfio_io_get_region_info(VFIODevice *vbasedev,
> -                                   struct vfio_region_info *info)
> +                                   struct vfio_region_info *info,
> +                                   int *fd)
>   {
>       int ret;
>   
> +    *fd = -1;
>       ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
>   
>       return ret < 0 ? -errno : ret;
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index 43912a5..a1b64fe 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -126,4 +126,18 @@ typedef struct {
>       uint32_t cap_offset;
>   } VFIOUserDeviceInfo;
>   
> +/*
> + * VFIO_USER_DEVICE_GET_REGION_INFO
> + * imported from struct_vfio_region_info
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint32_t index;
> +    uint32_t cap_offset;
> +    uint64_t size;
> +    uint64_t offset;
> +} VFIOUserRegionInfo;
> +
>   #endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 7873534..69b0fed 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -1101,6 +1101,40 @@ static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
>       return 0;
>   }
>   
> +static int vfio_user_get_region_info(VFIOProxy *proxy,
> +                                     struct vfio_region_info *info,
> +                                     VFIOUserFDs *fds)
> +{
> +    g_autofree VFIOUserRegionInfo *msgp = NULL;
> +    uint32_t size;
> +
> +    /* data returned can be larger than vfio_region_info */
> +    if (info->argsz < sizeof(*info)) {
> +        error_printf("vfio_user_get_region_info argsz too small\n");

It would be nice to report the errors at the upper layer and remove all
the error_printf(). Since it seems too difficult in this case, may be
return -E2BIG.

Thanks,

C.

> +        return -EINVAL;
> +    }
> +    if (fds != NULL && fds->send_fds != 0) {
> +        error_printf("vfio_user_get_region_info can't send FDs\n");
> +        return -EINVAL;
> +    }
> +
> +    size = info->argsz + sizeof(VFIOUserHdr);
> +    msgp = g_malloc0(size);
> +
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_GET_REGION_INFO,
> +                          sizeof(*msgp), 0);
> +    msgp->argsz = info->argsz;
> +    msgp->index = info->index;
> +
> +    vfio_user_send_wait(proxy, &msgp->hdr, fds, size, false);
> +    if (msgp->hdr.flags & VFIO_USER_ERROR) {
> +        return -msgp->hdr.error_reply;
> +    }
> +
> +    memcpy(info, &msgp->argsz, info->argsz);
> +    return 0;
> +}
> +
>   
>   /*
>    * Socket-based io_ops
> @@ -1126,7 +1160,32 @@ static int vfio_user_io_get_info(VFIODevice *vbasedev,
>       return 0;
>   }
>   
> +static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
> +                                        struct vfio_region_info *info,
> +                                        int *fd)
> +{
> +    int ret;
> +    VFIOUserFDs fds = { 0, 1, fd};
> +
> +    ret = vfio_user_get_region_info(vbasedev->proxy, info, &fds);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    if (info->index > vbasedev->num_regions) {
> +        return -EINVAL;
> +    }
> +    /* cap_offset in valid area */
> +    if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) &&
> +        (info->cap_offset < sizeof(*info) || info->cap_offset > info->argsz)) {
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
>   VFIODevIO vfio_dev_io_sock = {
>       .get_info = vfio_user_io_get_info,
> +    .get_region_info = vfio_user_io_get_region_info,
>   };
>   
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index fb7d865..3406e6a 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -56,6 +56,7 @@ typedef struct VFIORegion {
>       uint32_t nr_mmaps;
>       VFIOMmap *mmaps;
>       uint8_t nr; /* cache the region number for debug */
> +    int fd; /* fd to mmap() region */
>   } VFIORegion;
>   
>   typedef struct VFIOMigration {
> @@ -150,6 +151,7 @@ typedef struct VFIODevice {
>       OnOffAuto pre_copy_dirty_page_tracking;
>       VFIOProxy *proxy;
>       struct vfio_region_info **regions;
> +    int *regfds;
>   } VFIODevice;
>   
>   struct VFIODeviceOps {
> @@ -172,7 +174,7 @@ struct VFIODeviceOps {
>   struct VFIODevIO {
>       int (*get_info)(VFIODevice *vdev, struct vfio_device_info *info);
>       int (*get_region_info)(VFIODevice *vdev,
> -                           struct vfio_region_info *info);
> +                           struct vfio_region_info *info, int *fd);
>       int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
>       int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
>       int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
> @@ -183,8 +185,8 @@ struct VFIODevIO {
>   
>   #define VDEV_GET_INFO(vdev, info) \
>       ((vdev)->io_ops->get_info((vdev), (info)))
> -#define VDEV_GET_REGION_INFO(vdev, info) \
> -    ((vdev)->io_ops->get_region_info((vdev), (info)))
> +#define VDEV_GET_REGION_INFO(vdev, info, fd) \
> +    ((vdev)->io_ops->get_region_info((vdev), (info), (fd)))
>   #define VDEV_GET_IRQ_INFO(vdev, irq) \
>       ((vdev)->io_ops->get_irq_info((vdev), (irq)))
>   #define VDEV_SET_IRQS(vdev, irqs) \


