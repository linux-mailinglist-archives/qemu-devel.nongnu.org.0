Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF968C8C9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 22:30:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP933-0003Cu-Ni; Mon, 06 Feb 2023 16:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pP931-0003Cm-LE
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:29:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pP92z-0000bi-Ps
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675718948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w8So+rFs9xxovf6k8oRvH+8iEZXMGOaKi/142xsMhdQ=;
 b=WUttNgFR9CdIL60wxNacFydaEcrrZFm/GcbZJQIfJ9Hn16BgfHz5ZmikgWuPwcN4dHya2K
 GCX2Af1Ie4ly67TCA8ft9ax4ohwqtfV3txGs7oj847Lwsjx9x7Ib9+RWLawzwcBR3dz5hm
 ooYE1f2BT8RTzbUCvovKlq3PYxIj/uI=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-0WHJiHRPO0imOGKWGwoRIA-1; Mon, 06 Feb 2023 16:29:06 -0500
X-MC-Unique: 0WHJiHRPO0imOGKWGwoRIA-1
Received: by mail-il1-f198.google.com with SMTP id
 i14-20020a056e020d8e00b003034b93bd07so9030275ilj.14
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 13:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w8So+rFs9xxovf6k8oRvH+8iEZXMGOaKi/142xsMhdQ=;
 b=phKf5oO3NQN7rbLikwLL1HWGiyoAglGOmvJiFj9r3576qfhv29+O1omwXpn+KnG+iW
 ab8FfGo4pEqKbSMoPwL7RjdNmTvXrgVmZEDkXk3hmfvZGuzOf4/vc7w0TVV84/hLbrOJ
 ysu8q1IEXg82UZVCbQpXtUM2nOWIKMc8wbZ1uMKpNCXrNSiQ9hodiBz++OLjat/bZc5L
 9CbwAQiuHYWCybChptFiQrF5A1edgehg9ELNdcxIcHzfKcjyovl5UeIuGxfnQ49MTBns
 u4FR19xE+OaUtAAwWMzn7iOcEFZBJtVtUT5svFUEkCaAyzENvkagCM1PymtTPEKfZikC
 fKEg==
X-Gm-Message-State: AO0yUKUs8bfbXfrZ38vLFJL1u+IM7J/G/TvXtwB8xDqe5V+tmkSLpG/x
 F3QyRSk2+fv7eISXXfc4G96lhccp/vWi1BGtNhhMxI24XTy4I7GDLRCpVDojUsuqZKi3EfZqANx
 x9He0XjYmX2GGSv8=
X-Received: by 2002:a05:6e02:1c27:b0:311:ad48:ff1d with SMTP id
 m7-20020a056e021c2700b00311ad48ff1dmr11776383ilh.5.1675718946067; 
 Mon, 06 Feb 2023 13:29:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/wIL6xtIRuiLisUi2sf34i9aVezdCgC6tSzbBJvf+EyUF4eea9miezTTTY+dZ0Rv5M3bUb5Q==
X-Received: by 2002:a05:6e02:1c27:b0:311:ad48:ff1d with SMTP id
 m7-20020a056e021c2700b00311ad48ff1dmr11776371ilh.5.1675718945757; 
 Mon, 06 Feb 2023 13:29:05 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 bo20-20020a056638439400b003af7ff68d6fsm3760980jab.53.2023.02.06.13.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 13:29:05 -0800 (PST)
Date: Mon, 6 Feb 2023 14:29:04 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org, clg@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 18/23] vfio-user: add dma_unmap_all
Message-ID: <20230206142904.073989dd.alex.williamson@redhat.com>
In-Reply-To: <20fc8b4bb94583ef41d289db3831a9d07a0eae02.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <20fc8b4bb94583ef41d289db3831a9d07a0eae02.1675228037.git.john.g.johnson@oracle.com>
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

On Wed,  1 Feb 2023 21:55:54 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/vfio/vfio-common.h |  1 +
>  hw/vfio/common.c              | 45 ++++++++++++++++++++++++++++++++++---------
>  hw/vfio/user.c                | 24 +++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 9 deletions(-)

This is inventing a need for a kernel vs user callback op rather than
probing support for VFIO_UNMAP_ALL and using VFIO_DMA_UNMAP_FLAG_VADDR
consistently.  The flags arg of the dma_unmap_all() op is unused and
the kernel implementation introduces hard coded magic values.  The
vfio-user dirty_bitmap addition here is rather random.  Please include
some sort of description in the commit log for all patches.  Thanks,

Alex

> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index ee6ad8f..abef9b4 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -193,6 +193,7 @@ struct VFIOContainerIO {
>      int (*dma_unmap)(VFIOContainer *container,
>                       struct vfio_iommu_type1_dma_unmap *unmap,
>                       struct vfio_bitmap *bitmap);
> +    int (*dma_unmap_all)(VFIOContainer *container, uint32_t flags);
>      int (*dirty_bitmap)(VFIOContainer *container,
>                          struct vfio_iommu_type1_dirty_bitmap *bitmap,
>                          struct vfio_iommu_type1_dirty_bitmap_get *range);
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index f04fd20..8b55fbb 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -508,6 +508,14 @@ static int vfio_dma_unmap(VFIOContainer *container,
>      return container->io->dma_unmap(container, &unmap, NULL);
>  }
>  
> +/*
> + * DMA - Mapping and unmapping for the "type1" IOMMU interface used on x86
> + */
> +static int vfio_dma_unmap_all(VFIOContainer *container)
> +{
> +    return container->io->dma_unmap_all(container, VFIO_DMA_UNMAP_FLAG_ALL);
> +}
> +
>  static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
>                          ram_addr_t size, void *vaddr, bool readonly)
>  {
> @@ -1256,17 +1264,10 @@ static void vfio_listener_region_del(MemoryListener *listener,
>  
>      if (try_unmap) {
>          if (int128_eq(llsize, int128_2_64())) {
> -            /* The unmap ioctl doesn't accept a full 64-bit span. */
> -            llsize = int128_rshift(llsize, 1);
> +            ret = vfio_dma_unmap_all(container);
> +        } else {
>              ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
> -            if (ret) {
> -                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> -                             "0x%"HWADDR_PRIx") = %d (%m)",
> -                             container, iova, int128_get64(llsize), ret);
> -            }
> -            iova += int128_get64(llsize);
>          }
> -        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
>          if (ret) {
>              error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
>                           "0x%"HWADDR_PRIx") = %d (%m)",
> @@ -2867,6 +2868,31 @@ static int vfio_io_dma_unmap(VFIOContainer *container,
>      return 0;
>  }
>  
> +static int vfio_io_dma_unmap_all(VFIOContainer *container, uint32_t flags)
> +{
> +    struct vfio_iommu_type1_dma_unmap unmap = {
> +        .argsz = sizeof(unmap),
> +        .flags = 0,
> +        .size = 0x8000000000000000,
> +    };
> +    int ret;
> +
> +    /* The unmap ioctl doesn't accept a full 64-bit span. */
> +    unmap.iova = 0;
> +    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap);
> +    if (ret) {
> +        return -errno;
> +    }
> +
> +    unmap.iova += unmap.size;
> +    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap);
> +    if (ret) {
> +        return -errno;
> +    }
> +
> +    return 0;
> +}
> +
>  static int vfio_io_dirty_bitmap(VFIOContainer *container,
>                                  struct vfio_iommu_type1_dirty_bitmap *bitmap,
>                                  struct vfio_iommu_type1_dirty_bitmap_get *range)
> @@ -2886,6 +2912,7 @@ static void vfio_io_wait_commit(VFIOContainer *container)
>  static VFIOContainerIO vfio_cont_io_ioctl = {
>      .dma_map = vfio_io_dma_map,
>      .dma_unmap = vfio_io_dma_unmap,
> +    .dma_unmap_all = vfio_io_dma_unmap_all,
>      .dirty_bitmap = vfio_io_dirty_bitmap,
>      .wait_commit = vfio_io_wait_commit,
>  };
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 6dee775..fe6e476 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -1825,6 +1825,28 @@ static int vfio_user_io_dma_unmap(VFIOContainer *container,
>                                 container->async_ops);
>  }
>  
> +static int vfio_user_io_dma_unmap_all(VFIOContainer *container, uint32_t flags)
> +{
> +    struct vfio_iommu_type1_dma_unmap unmap = {
> +        .argsz = sizeof(unmap),
> +        .flags = flags | VFIO_DMA_UNMAP_FLAG_ALL,
> +        .iova = 0,
> +        .size = 0,
> +    };
> +
> +    return vfio_user_dma_unmap(container->proxy, &unmap, NULL,
> +                               container->async_ops);
> +}
> +
> +static int vfio_user_io_dirty_bitmap(VFIOContainer *container,
> +                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
> +                        struct vfio_iommu_type1_dirty_bitmap_get *range)
> +{
> +
> +    /* vfio-user doesn't support migration */
> +    return -EINVAL;
> +}
> +
>  static void vfio_user_io_wait_commit(VFIOContainer *container)
>  {
>      vfio_user_wait_reqs(container->proxy);
> @@ -1833,5 +1855,7 @@ static void vfio_user_io_wait_commit(VFIOContainer *container)
>  VFIOContainerIO vfio_cont_io_sock = {
>      .dma_map = vfio_user_io_dma_map,
>      .dma_unmap = vfio_user_io_dma_unmap,
> +    .dma_unmap_all = vfio_user_io_dma_unmap_all,
> +    .dirty_bitmap = vfio_user_io_dirty_bitmap,
>      .wait_commit = vfio_user_io_wait_commit,
>  };


