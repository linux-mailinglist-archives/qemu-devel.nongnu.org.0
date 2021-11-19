Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88E44578F6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:45:14 +0100 (CET)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCd4-0000xJ-9P
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:45:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbA-0006jQ-4k
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb4-0002WZ-Df
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zp3K315bqLGslvs9785lHsLapCBY9biz6uGWa/HxhUk=;
 b=WVAZ96pBoFTN/jtcMRdz0rpL/5BMS3m7NpU/254UTzwHYsawA2DB3LVY7dmFsYjBoW17bm
 lSAbjetmaaNvP4nU3SFJoy1Q4vT72KHOEvZaDNjl6aUne1mDVUyXDQolVF3zLrS+TTgcTo
 ozrUb1ZsimzxaKNdSyTpRFlBLxzieZE=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-RgsqwDycM6eku5OPNTZfVg-1; Fri, 19 Nov 2021 17:43:04 -0500
X-MC-Unique: RgsqwDycM6eku5OPNTZfVg-1
Received: by mail-oo1-f71.google.com with SMTP id
 q36-20020a4a88e7000000b002c2848c4755so7002713ooh.10
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zp3K315bqLGslvs9785lHsLapCBY9biz6uGWa/HxhUk=;
 b=D/tU27Py4o8tacAiCSxiDUZGxSjBvu8UsKTkNaFgV09PozDJQ3b2CsqSW051yHwRLi
 rcteuwTM0E0OQciR724inYpu/wrFlp0BZi6Lcj5EJX/zg863DDR4im6wMdHy3POsoGgP
 jjSjbJAnT0g2qt5pgNOAUdvVy/IyOtRHWI9l+ggm77n149h9/w0SbDJpqx8OQMJbN3Xp
 jLZ5JquISARnjdFjNtJloYioo0xRruL1IFVUKz9SkhIpZYOyR5EtIAtt15fyGGQouHdV
 CMSmFU6f1delP3mKtC8poDMDsjV9ett3t1h1HLfPQvn6RuNBVUGVgF/uLzIUn4yVKTOV
 G7Kw==
X-Gm-Message-State: AOAM533+aghWMSt63dq5yyKZ2h3s8V+sn/yvaMeO5IVC058QN0nJQvZd
 bTaQOJZZtA/5QV0Ms0wdYcOmmP3k4kryd/dJsXQW6tGI+eIbNWvrXCV7CupKnubE3fbqHUjTKlA
 LfG73WLXnotLZJFs=
X-Received: by 2002:a9d:8e9:: with SMTP id 96mr8043767otf.192.1637361783221;
 Fri, 19 Nov 2021 14:43:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMl0h+E/xi/hd3KXbKAlzu3UEkVmVg8r0au8HASs3OBm3jlP5+RDkcsuN77YFJP/bwdCIN/A==
X-Received: by 2002:a9d:8e9:: with SMTP id 96mr8043743otf.192.1637361782967;
 Fri, 19 Nov 2021 14:43:02 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:02 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:28 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 11/19] vfio-user: get region info
Message-ID: <20211119154228.3f33d8da.alex.williamson@redhat.com>
In-Reply-To: <32606ff56a2dd3f0d9ceaa91feb6a3c3fa6b98d5.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <32606ff56a2dd3f0d9ceaa91feb6a3c3fa6b98d5.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Nov 2021 16:46:39 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/user-protocol.h       | 14 ++++++++++++
>  include/hw/vfio/vfio-common.h |  4 +++-
>  hw/vfio/common.c              | 30 +++++++++++++++++++++++++-
>  hw/vfio/user.c                | 50 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 96 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index 13e44eb..104bf4f 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -95,4 +95,18 @@ typedef struct {
>      uint32_t cap_offset;
>  } VFIOUserDeviceInfo;
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
>  #endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 224dbf8..e2d7ee1 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -56,6 +56,7 @@ typedef struct VFIORegion {
>      uint32_t nr_mmaps;
>      VFIOMmap *mmaps;
>      uint8_t nr; /* cache the region number for debug */
> +    int remfd; /* fd if exported from remote process */
>  } VFIORegion;
>  
>  typedef struct VFIOMigration {
> @@ -150,8 +151,9 @@ typedef struct VFIODevice {
>      VFIOMigration *migration;
>      Error *migration_blocker;
>      OnOffAuto pre_copy_dirty_page_tracking;
> -    struct vfio_region_info **regions;
>      VFIOProxy *proxy;
> +    struct vfio_region_info **regions;
> +    int *regfds;
>  } VFIODevice;
>  
>  struct VFIODeviceOps {
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 41fdd78..47ec28f 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -40,6 +40,7 @@
>  #include "trace.h"
>  #include "qapi/error.h"
>  #include "migration/migration.h"
> +#include "hw/vfio/user.h"
>  
>  VFIOGroupList vfio_group_list =
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -1491,6 +1492,16 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
>      return true;
>  }
>  
> +static int vfio_get_region_info_remfd(VFIODevice *vbasedev, int index)
> +{
> +    struct vfio_region_info *info;
> +
> +    if (vbasedev->regions == NULL || vbasedev->regions[index] == NULL) {
> +        vfio_get_region_info(vbasedev, index, &info);
> +    }
> +    return vbasedev->regfds != NULL ? vbasedev->regfds[index] : -1;
> +}

This patch is really obscure due to the region info fd being added many
patches ago and only now being used.

Do we really want a parallel array to regions for storing these fds?

Why do we call an array of these fds "regfds" but a single one "remfd"?

Ugh, why do we have both the regfds array and a remfd per VFIORegion?

TBH, I'm still not sure why we're caching region infos at all, this
seems to be gratuitously bloated.

> +
>  static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
>                                            struct vfio_region_info *info)
>  {
> @@ -1544,6 +1555,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
>      region->size = info->size;
>      region->fd_offset = info->offset;
>      region->nr = index;
> +    region->remfd = vfio_get_region_info_remfd(vbasedev, index);

Why didn't we just get an fd back from vfio_get_region_info() that we
could use here?

>  
>      if (region->size) {
>          region->mem = g_new0(MemoryRegion, 1);
> @@ -1587,6 +1599,7 @@ int vfio_region_mmap(VFIORegion *region)
>  {
>      int i, prot = 0;
>      char *name;
> +    int fd;
>  
>      if (!region->mem) {
>          return 0;
> @@ -1595,9 +1608,11 @@ int vfio_region_mmap(VFIORegion *region)
>      prot |= region->flags & VFIO_REGION_INFO_FLAG_READ ? PROT_READ : 0;
>      prot |= region->flags & VFIO_REGION_INFO_FLAG_WRITE ? PROT_WRITE : 0;
>  
> +    fd = region->remfd != -1 ? region->remfd : region->vbasedev->fd;

Gack, why can't VFIORegion.fd be either the remote process fd or the
vbasedevfd to avoid all these switches?  Thanks,

Alex

> +
>      for (i = 0; i < region->nr_mmaps; i++) {
>          region->mmaps[i].mmap = mmap(NULL, region->mmaps[i].size, prot,
> -                                     MAP_SHARED, region->vbasedev->fd,
> +                                     MAP_SHARED, fd,
>                                       region->fd_offset +
>                                       region->mmaps[i].offset);
>          if (region->mmaps[i].mmap == MAP_FAILED) {
> @@ -2379,10 +2394,17 @@ void vfio_put_base_device(VFIODevice *vbasedev)
>          int i;
>  
>          for (i = 0; i < vbasedev->num_regions; i++) {
> +            if (vbasedev->regfds != NULL && vbasedev->regfds[i] != -1) {
> +                close(vbasedev->regfds[i]);
> +            }
>              g_free(vbasedev->regions[i]);
>          }
>          g_free(vbasedev->regions);
>          vbasedev->regions = NULL;
> +        if (vbasedev->regfds != NULL) {
> +            g_free(vbasedev->regfds);
> +            vbasedev->regfds = NULL;
> +        }
>      }
>  
>      if (!vbasedev->group) {
> @@ -2405,6 +2427,9 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
>      if (vbasedev->regions == NULL) {
>          vbasedev->regions = g_new0(struct vfio_region_info *,
>                                     vbasedev->num_regions);
> +        if (vbasedev->proxy != NULL) {
> +            vbasedev->regfds = g_new0(int, vbasedev->num_regions);
> +        }
>      }
>      /* check cache */
>      if (vbasedev->regions[index] != NULL) {
> @@ -2441,6 +2466,9 @@ retry:
>      /* fill cache */
>      vbasedev->regions[index] = g_malloc0(argsz);
>      memcpy(vbasedev->regions[index], *info, argsz);
> +    if (vbasedev->regfds != NULL) {
> +        vbasedev->regfds[index] = fd;
> +    }
>  
>      return 0;
>  }
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index ed2a4d7..b40c4ed 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -923,6 +923,40 @@ static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
>      return 0;
>  }
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
>  /*
>   * Socket-based io_ops
> @@ -941,7 +975,23 @@ static int vfio_user_io_get_info(VFIODevice *vbasedev,
>      return VDEV_VALID_INFO(vbasedev, info);
>  }
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
> +    return VDEV_VALID_REGION_INFO(vbasedev, info, fd);
> +}
> +
>  VFIODevIO vfio_dev_io_sock = {
>      .get_info = vfio_user_io_get_info,
> +    .get_region_info = vfio_user_io_get_region_info,
>  };
>  


