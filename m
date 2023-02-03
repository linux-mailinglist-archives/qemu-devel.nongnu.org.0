Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4668468A60B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 23:22:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO4Qp-0000Cr-MU; Fri, 03 Feb 2023 17:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pO4Qm-0000Bl-Ol
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pO4Qk-0004AS-NK
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675462873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/gbh6zsXUK7c+uT9x6Svvjj4CW4IAFjm6yCgyp3oJ0=;
 b=PoMV5za7ot5zCKY2zkTErFK1JhjknthxoXqUx/MT9ojV0ecQMmzFHQtzEw3xgLuH3Yz5oz
 cORqZ1jUdJ1jzGht1Tmrymf6p0NWVdDLj+QlTUUtpX+1nDKr0u9eqVme6XG/Dm1kfNUThQ
 dahBPDseWLM5a+Y6gmGh5LkKFJjws4c=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-5QxvsijzPoeTLbvRixj1PA-1; Fri, 03 Feb 2023 17:21:11 -0500
X-MC-Unique: 5QxvsijzPoeTLbvRixj1PA-1
Received: by mail-io1-f70.google.com with SMTP id
 k4-20020a6b7e44000000b0071e11cafea7so3785431ioq.15
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 14:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/gbh6zsXUK7c+uT9x6Svvjj4CW4IAFjm6yCgyp3oJ0=;
 b=MpJ6KPcobeF3BnLPjRfNr3dit82YXBiXE1BHShXittnOwRGC1Hyb1IJxKf3TsBx3UN
 A4+aoNIwOmwdffnosgI0qwDMSKlDq1vjyDr9SC2jSsMgP50iX+irFhuJ1udRdO6VMukB
 BHDHnuAtlHpyy/YM3dpfI1mErAEhzUuMbR6mroyLLw9FSYVG0/31MOB4T1zP3HRXYFrZ
 agYdGRJSlZFd1S8cQg6lEVozYcOSfGnKVftysuPobsnCUJFs3ZN//ufldfRETYP8FfI8
 6IDgh4kj/QJFeMXiJFQUl64oWDHtnGnSsFt5Uh9d7b4bJQTUV50jvrzQGDrBwZ6p576h
 Zx+Q==
X-Gm-Message-State: AO0yUKVsTwNPH4O0Q/Ka1mjzRcsl9xc+AlcX24Uw/7HTZbIyEfc168Pz
 AUvkE2RL9n3bdBzr1tKy+HJutRykYPor04O/DdxLFxAB4S6X6t+1vPcGEg41KWRyWGdZ9vR588a
 DXhX8eTYPmNbjMCQ=
X-Received: by 2002:a05:6e02:1528:b0:311:7e6:f59 with SMTP id
 i8-20020a056e02152800b0031107e60f59mr9407192ilu.1.1675462870780; 
 Fri, 03 Feb 2023 14:21:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/hacToO3QnzyiFZN1u1AEeVLXWbs7LBY5z33iCQWtHntt3QV6/qAvKYi5/PbYQWvf31IfuPg==
X-Received: by 2002:a05:6e02:1528:b0:311:7e6:f59 with SMTP id
 i8-20020a056e02152800b0031107e60f59mr9407178ilu.1.1675462870471; 
 Fri, 03 Feb 2023 14:21:10 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 bp9-20020a056638440900b00363d6918540sm1177127jab.171.2023.02.03.14.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 14:21:10 -0800 (PST)
Date: Fri, 3 Feb 2023 15:21:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org, clg@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 03/23] vfio-user: add container IO ops vector
Message-ID: <20230203152109.60a8cd33.alex.williamson@redhat.com>
In-Reply-To: <3648002c52cef9b4473f97d18cb7e2cd62fc3fd5.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <3648002c52cef9b4473f97d18cb7e2cd62fc3fd5.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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

On Wed,  1 Feb 2023 21:55:39 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Used for communication with VFIO driver
> (prep work for vfio-user, which will communicate over a socket)
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> ---
>  include/hw/vfio/vfio-common.h |  24 ++++++++
>  hw/vfio/common.c              | 128 ++++++++++++++++++++++++++++--------------
>  2 files changed, 110 insertions(+), 42 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index e573f5a..953bc0f 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
>  } VFIOAddressSpace;
>  
>  struct VFIOGroup;
> +typedef struct VFIOContainerIO VFIOContainerIO;
>  
>  typedef struct VFIOContainer {
>      VFIOAddressSpace *space;
> @@ -83,6 +84,7 @@ typedef struct VFIOContainer {
>      MemoryListener prereg_listener;
>      unsigned iommu_type;
>      Error *error;
> +    VFIOContainerIO *io;
>      bool initialized;
>      bool dirty_pages_supported;
>      uint64_t dirty_pgsizes;
> @@ -154,6 +156,28 @@ struct VFIODeviceOps {
>      int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
>  };
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
> +struct VFIOContainerIO {
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
> +#endif /* CONFIG_LINUX */
> +
>  typedef struct VFIOGroup {
>      int fd;
>      int groupid;
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562..9310a7f 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -58,6 +58,8 @@ static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
>  static int vfio_kvm_device_fd = -1;
>  #endif
>  
> +static VFIOContainerIO vfio_cont_io_ioctl;
> +
>  /*
>   * Common VFIO interrupt disable
>   */
> @@ -432,12 +434,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>          goto unmap_exit;
>      }
>  
> -    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
> +    ret = container->io->dma_unmap(container, unmap, bitmap);

The bitmap arg doesn't make a lot of sense here, its use doesn't come
around until vfio_user_dma_unmap() is added, but even then, it's
readily available at &unmap->data with validity determined by
unmap->flags.  The eventual sanity test in vfio_user_dma_unmap() really
only seems to prove the arg is unnecessary.  Thanks,

Alex


