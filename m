Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1560C6ACDE9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:23:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGQU-0001qm-O9; Mon, 06 Mar 2023 14:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZGQE-0001ps-Mf
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZGQC-000461-AJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678130573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAQuPHBBQsIbfFsraNiDYf7xFYrgWLzIucRs/FebMbU=;
 b=TEEifCFiyvSP0UwDEY7uw3jpboTZ1wy+nf/jMrwsPxDBgad23XN1TWIPqh3e7qO5Mp8ZBH
 BSocyTQkgnjMChIGCF/hWCXqzSEMNf8rwftqK0KQTPvC9pzGeSTESeD+JK/v2dXkY9+JRp
 GTFUTun1UpksSsi7eBZ0j8Qjfv/J0HE=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-o7SSZ-OsO6u1mpBPsC_8Mw-1; Mon, 06 Mar 2023 14:22:52 -0500
X-MC-Unique: o7SSZ-OsO6u1mpBPsC_8Mw-1
Received: by mail-il1-f199.google.com with SMTP id
 d3-20020a056e02050300b00317999dcfb1so5873268ils.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 11:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678130572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAQuPHBBQsIbfFsraNiDYf7xFYrgWLzIucRs/FebMbU=;
 b=XUeOqeNcBBM35B33kq5u7fu17dvIGXm48ESilLngHXVhfxRj/DzOMkBnuNPE9pt5iH
 recwprCB074YL5geBh7sDGHiTxWJka++yBaiDpB9BEJ1Btzz9cSl/aokq7B6Z7gOlXAx
 v6oLNpOebDSfVo77Gu0y38tWa8TGcC8Iqe0pKNlxPjK6krDakaK2VbXN86Bz0f+ymO/e
 QvzpRdo4VuVv4tvV3lMAvRQbtVOLE627J7K4wv4zv2j0npx2MpFZPCniUd4C8kPSThJW
 B5gQ0n3XQaFG2nzorw49/T1xCg38alhOqTqKMr1m0aXvnbbzdesDLJkm/hjRoHVq88YH
 PBIw==
X-Gm-Message-State: AO0yUKXYBIdhuOk199rUYLpzHbwf6P046BskDsB61pvYtlS13WGcvFJZ
 5AoX2waFURFqmsW43EaWN2QXIV27I8MZYwSyIr7QafUAXJ8JH0fzz14qO6igTMwHzpgmdzu77yP
 56vtJ/8I48VSfrnk=
X-Received: by 2002:a92:7414:0:b0:315:2eec:4055 with SMTP id
 p20-20020a927414000000b003152eec4055mr7111224ilc.11.1678130571911; 
 Mon, 06 Mar 2023 11:22:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+u5Gkkw9G5gJQZRwQWl+Gg6jDLEKA2kDZU3YnG4bXdQ4DfHGZJexG9Z6BJgjeOBFwvBtGiiQ==
X-Received: by 2002:a92:7414:0:b0:315:2eec:4055 with SMTP id
 p20-20020a927414000000b003152eec4055mr7111213ilc.11.1678130571652; 
 Mon, 06 Mar 2023 11:22:51 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r16-20020a92d450000000b00316e39f1285sm3002910ilm.82.2023.03.06.11.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 11:22:51 -0800 (PST)
Date: Mon, 6 Mar 2023 12:22:49 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
Subject: Re: [PATCH v3 10/13] vfio/common: Add device dirty page bitmap sync
Message-ID: <20230306122249.5f9d9656.alex.williamson@redhat.com>
In-Reply-To: <20230304014343.33646-11-joao.m.martins@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-11-joao.m.martins@oracle.com>
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

On Sat,  4 Mar 2023 01:43:40 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> Add device dirty page bitmap sync functionality. This uses the device
> DMA logging uAPI to sync dirty page bitmap from the device.
> 
> Device dirty page bitmap sync is used only if all devices within a
> container support device dirty page tracking.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/vfio/common.c | 88 +++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 79 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index b0c7d03279ab..5b8456975e97 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -342,6 +342,9 @@ static int vfio_bitmap_alloc(VFIOBitmap *vbmap, hwaddr size)
>      return 0;
>  }
>  
> +static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
> +                                 uint64_t size, ram_addr_t ram_addr);
> +
>  bool vfio_mig_active(void)
>  {
>      VFIOGroup *group;
> @@ -565,10 +568,16 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          .iova = iova,
>          .size = size,
>      };
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
>      }
>  
>      while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
> @@ -594,10 +603,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          return -errno;
>      }
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
>      }
>  
>      return 0;
> @@ -1579,6 +1590,58 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>      }
>  }
>  
> +static int vfio_device_dma_logging_report(VFIODevice *vbasedev, hwaddr iova,
> +                                          hwaddr size, void *bitmap)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                        sizeof(struct vfio_device_feature_dma_logging_report),
> +                        sizeof(__aligned_u64))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> +    struct vfio_device_feature_dma_logging_report *report =
> +        (struct vfio_device_feature_dma_logging_report *)feature->data;
> +
> +    report->iova = iova;
> +    report->length = size;
> +    report->page_size = qemu_real_host_page_size();
> +    report->bitmap = (__aligned_u64)bitmap;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags =
> +        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT;

Nit, the series is inconsistent between initializing flags as above and
as:

    feature->flags = VFIO_DEVICE_FEATURE_GET;
    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT;

My personal preference would be more like:

    feature->flags = VFIO_DEVICE_FEATURE_GET |
                     VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT;

Thanks,
Alex

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
>  static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
>                                     hwaddr iova, hwaddr size)
>  {
> @@ -1619,10 +1682,12 @@ static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
>  static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>                                   uint64_t size, ram_addr_t ram_addr)
>  {
> +    bool all_device_dirty_tracking =
> +        vfio_devices_all_device_dirty_tracking(container);
>      VFIOBitmap vbmap;
>      int ret;
>  
> -    if (!container->dirty_pages_supported) {
> +    if (!container->dirty_pages_supported && !all_device_dirty_tracking) {
>          cpu_physical_memory_set_dirty_range(ram_addr, size,
>                                              tcg_enabled() ? DIRTY_CLIENTS_ALL :
>                                              DIRTY_CLIENTS_NOCODE);
> @@ -1634,7 +1699,12 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>          return -errno;
>      }
>  
> -    ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
> +    if (all_device_dirty_tracking) {
> +        ret = vfio_devices_query_dirty_bitmap(container, &vbmap, iova, size);
> +    } else {
> +        ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
> +    }
> +
>      if (ret) {
>          goto out;
>      }


