Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376D67613F
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 00:08:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJ0T0-0000Kt-3p; Fri, 20 Jan 2023 18:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pJ0Sy-0000Ke-Mk
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 18:06:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pJ0Sw-0006yP-TV
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 18:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674255989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yu49udkrSK6AusfU1vxi2+g77Y09IQG0tIdlrVyE6k=;
 b=KAck5OTmT5bTGitcvvkwp18SHqMwE1D3WI7HYVh2wGCNxgPRkAByjXe3skvTVRQNOHR1QN
 siMAFswiEkmCgpNyINgoBbwcEsFcqjKwsOi9cjgmHVCUewGvN8vHJjThI45xNOKVx5Rl6R
 6lRWI18pSPieWhlX4z33bCByZtO1MI0=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-qMNLmgd5Mjegyof8ebAkUw-1; Fri, 20 Jan 2023 18:06:28 -0500
X-MC-Unique: qMNLmgd5Mjegyof8ebAkUw-1
Received: by mail-io1-f72.google.com with SMTP id
 b21-20020a5d8d95000000b006fa39fbb94eso3729850ioj.17
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 15:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7yu49udkrSK6AusfU1vxi2+g77Y09IQG0tIdlrVyE6k=;
 b=oUveMOFU5MIzXrheVVsFc/Pzu7BNopItKwIrsRDNgCtxe3KTPdQo6iWXufbncB6Y5w
 D2r5yVEfZxH6GQAOQIEgc6jhU37f+aI4TSTTnsHEZhvw4/fwPOoN7jtdqQKrjv/Swa3V
 BBewrRJJPrJkYbniirpEEu74bV+DcteEUjLaLelrGVg0J28sYyUx+2mP0W4mQdegZJD5
 9zAmuWiV9aEaCBGFqh3N3NNfXR7JRBsgL01w20UNaaF8QIhI1KDUGWrs/vIBMKwZyyhv
 D7x/UTzJJy89AIaT5T44X0CSQl/jj8TH/K5EGctAjQqZjykWakHqQZsZY0k48ipbtZRC
 FGAg==
X-Gm-Message-State: AFqh2ko6ivGcI/BSHz73JA7NIcPkHzrgzU0K8WuRAd7VUU5CKRnhY8z1
 MuFyHD3Hrj4b7x4wUzFbmqBZ0ApvIfmHGa29nuGJhKnffzSU9DgHPc4LRf8z9wEOze6bcpnUC6u
 3Xm/thVT8aLQcmJY=
X-Received: by 2002:a5e:8b46:0:b0:6e3:203a:715c with SMTP id
 z6-20020a5e8b46000000b006e3203a715cmr10983033iom.11.1674255987642; 
 Fri, 20 Jan 2023 15:06:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtWxSx+WZVVlaxNUVVYYL99t8Ia/GtRaQXJyZroa2+aDUkzjLP3Cl92bODJWzil4I4Ngx1iwA==
X-Received: by 2002:a5e:8b46:0:b0:6e3:203a:715c with SMTP id
 z6-20020a5e8b46000000b006e3203a715cmr10983002iom.11.1674255987332; 
 Fri, 20 Jan 2023 15:06:27 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p11-20020a056638216b00b003a28e28bf82sm6081808jak.20.2023.01.20.15.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 15:06:26 -0800 (PST)
Date: Fri, 20 Jan 2023 16:06:24 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v8 04/13] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
Message-ID: <20230120160624.2cf0762f.alex.williamson@redhat.com>
In-Reply-To: <20230116141135.12021-5-avihaih@nvidia.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
 <20230116141135.12021-5-avihaih@nvidia.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 16 Jan 2023 16:11:26 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

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
> ---
>  hw/vfio/common.c    | 20 ++++++++++++++++++--
>  hw/vfio/migration.c |  3 +--
>  2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 130e5d1dc7..f6dd571549 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -488,6 +488,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          return -errno;
>      }
>  
> +    if (iotlb && vfio_devices_all_running_and_saving(container)) {
> +        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
> +                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
> +                                            DIRTY_CLIENTS_NOCODE);

I take it this is an attempt to decipher the mask arg based on its use
in cpu_physical_memory_set_dirty_lebitmap().  I'm attempting to do the
same.  It seems like it must logically be the case that
global_dirty_tracking is set to pass the running-and-saving test, but I
can't connect the pieces.  Is this your understanding as well and the
reason we don't also need to optionally exclude DIRTY_MEMORY_MIGRATION?
Thanks,

Alex

> +    }
> +
>      return 0;
>  }
>  
> @@ -1201,6 +1207,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>          .argsz = sizeof(dirty),
>      };
>  
> +    if (!container->dirty_pages_supported) {
> +        return;
> +    }
> +
>      if (start) {
>          dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
>      } else {
> @@ -1236,6 +1246,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>      uint64_t pages;
>      int ret;
>  
> +    if (!container->dirty_pages_supported) {
> +        cpu_physical_memory_set_dirty_range(ram_addr, size,
> +                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
> +                                            DIRTY_CLIENTS_NOCODE);
> +        return 0;
> +    }
> +
>      dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>  
>      dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
> @@ -1409,8 +1426,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>  
> -    if (vfio_listener_skipped_section(section) ||
> -        !container->dirty_pages_supported) {
> +    if (vfio_listener_skipped_section(section)) {
>          return;
>      }
>  
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 09fe7c1de2..552c2313b2 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -860,11 +860,10 @@ int64_t vfio_mig_bytes_transferred(void)
>  
>  int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>  {
> -    VFIOContainer *container = vbasedev->group->container;
>      struct vfio_region_info *info = NULL;
>      int ret = -ENOTSUP;
>  
> -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> +    if (!vbasedev->enable_migration) {
>          goto add_blocker;
>      }
>  


