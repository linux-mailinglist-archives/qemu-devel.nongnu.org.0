Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096963BD5B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 10:54:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozxII-0002se-5I; Tue, 29 Nov 2022 04:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ozxI7-0002sH-GR
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 04:52:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ozxI5-0007Ij-7P
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 04:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669715556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aDmRnA1IIo33llxP1LspWJylf0XptZAcLAIiaDs0nY=;
 b=RkFRvujdIJRnbpVV5zoyf2IERA0N09NDfiLuKZJwcBjMozvKVK+cftVSFfVJbCvLsZ8rQw
 QHDRLV2uRCZuXnMVW9dcvihYEQd9w2w5O7hGgoAgsXS6gZvmWE5NICyiI15P8mToyjGsCM
 byovLDjN9mHI97u+rGbelCmsOA9ifJU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-Y32gUe8oMWO-Z5CRMzRIdg-1; Tue, 29 Nov 2022 04:52:32 -0500
X-MC-Unique: Y32gUe8oMWO-Z5CRMzRIdg-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so7555849wmb.7
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 01:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1aDmRnA1IIo33llxP1LspWJylf0XptZAcLAIiaDs0nY=;
 b=tsD2CHnRKOc+83PGqvryqARzFf4M9lxTmOAqVKcy9ZMtgJS4fYqIuH83tab//SJlew
 NyZw/qsuEFB38FrwxLonamPQuaqWrNR/y9y1slScjMB8yDxn/7aiZOHGqYo/TDUfIQ9/
 vvZxFwxlFYfUcBHfLjqC8GgRx+WEZbUrxw4dXKNM0RR2bTARDfkexOqzsHng4nFDDFaI
 4csKT87obT3vys8qyaAe4KLyTW9CjwnyoAiQ50i6d4NvU3dcJZucKPyty1v/e61CxmJg
 tk0o0y/4etl9yqhQ+MAYn5Wi5Qd69r3Tyhsws9p6zZMXBYJjAer7iUHVG8WtH9bwz1Ws
 +21A==
X-Gm-Message-State: ANoB5pkFS4ieunO4qJfmYrkOBnlt5a4kn0a8SSFrvsFv2DllDjQJZMmz
 AD/tc9jRC1myq2ruw2cklGEXdstYS2WxZqW289TTTz20yFFd7OwYm/a0VxFTYEL1MjCCqgWw6T5
 fAjGBPijoE02RISo=
X-Received: by 2002:a05:600c:4894:b0:3b4:91f1:da83 with SMTP id
 j20-20020a05600c489400b003b491f1da83mr30016778wmp.127.1669715551547; 
 Tue, 29 Nov 2022 01:52:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf47d5E6mFWIY1hi6Eep+tqM4KbmtiAbF/dKC/yCY3cz1h9OyFwMesGwWNH4edfLxI6cU/hVBQ==
X-Received: by 2002:a05:600c:4894:b0:3b4:91f1:da83 with SMTP id
 j20-20020a05600c489400b003b491f1da83mr30016750wmp.127.1669715551218; 
 Tue, 29 Nov 2022 01:52:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c2cc900b003cf9bf5208esm437819wmc.19.2022.11.29.01.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 01:52:30 -0800 (PST)
Message-ID: <ea906777-1be5-70d7-5eb1-3f50169ac7a5@redhat.com>
Date: Tue, 29 Nov 2022 10:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2? V2] vhost: fix vq dirty bitmap syncing when
 vIOMMU is enabled
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Lei Yang <leiyang@redhat.com>, Yalan Zhang <yalzhang@redhat.com>
References: <20221129040232.10116-1-jasowang@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221129040232.10116-1-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jason,

On 11/29/22 05:02, Jason Wang wrote:
> When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
> GPA. So we need to translate it to GPA before the syncing otherwise we
> may hit the following crash since IOVA could be out of the scope of
> the GPA log size. This could be noted when using virtio-IOMMU with
> vhost using 1G memory.
>
> Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
> Cc: qemu-stable@nongnu.org
> Tested-by: Lei Yang <leiyang@redhat.com>
> Reported-by: Yalan Zhang <yalzhang@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes since V1:
> - Fix the address calculation when used ring is not page aligned
> - Fix the length for each round of dirty bitmap syncing
> - Use LOG_GUEST_ERROR to log wrong used adddress
> - Various other tweaks
> ---
>  hw/virtio/vhost.c | 76 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 56 insertions(+), 20 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index d1c4c20b8c..0cd5f25fcb 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -20,6 +20,7 @@
>  #include "qemu/range.h"
>  #include "qemu/error-report.h"
>  #include "qemu/memfd.h"
> +#include "qemu/log.h"
>  #include "standard-headers/linux/vhost_types.h"
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio-access.h"
> @@ -106,6 +107,24 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
>      }
>  }
>  
> +static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> +{
> +    VirtIODevice *vdev = dev->vdev;
> +
> +    /*
> +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> +     * incremental memory mapping API via IOTLB API. For platform that
> +     * does not have IOMMU, there's no need to enable this feature
> +     * which may cause unnecessary IOTLB miss/update transactions.
> +     */
> +    if (vdev) {
> +        return virtio_bus_device_iommu_enabled(vdev) &&
> +            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +    } else {
> +        return false;
> +    }
> +}
> +
>  static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
>                                     MemoryRegionSection *section,
>                                     hwaddr first,
> @@ -137,8 +156,43 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
>              continue;
>          }
>  
> -        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
> -                              range_get_last(vq->used_phys, vq->used_size));
> +        if (vhost_dev_has_iommu(dev)) {
> +            IOMMUTLBEntry iotlb;
> +            hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
> +            hwaddr phys, s;
> +
> +            while (used_size) {
> +                rcu_read_lock();
> +                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
> +                                                      used_phys,
> +                                                      true, MEMTXATTRS_UNSPECIFIED);
> +                rcu_read_unlock();
> +
> +                if (!iotlb.target_as) {
> +                    qemu_log_mask(LOG_GUEST_ERROR, "translation "
> +                                  "failure for used_phys %"PRIx64"\n", used_phys);
looks weird to see translation of "used_phys" whereas it is an iova. At
least I would reword the msg
> +                    return -EINVAL;
> +                }
> +
> +                phys = iotlb.translated_addr + (used_phys & iotlb.addr_mask);
you may use a local variable storing this offset =

used_phys & iotlb.addr_mask

> +
> +                /* Distance from start of used ring until last byte of
> +                   IOMMU page */
you can avoid checkpatch warnings here
> +                s = iotlb.addr_mask - (used_phys & iotlb.addr_mask);
> +                /* Size of used ring, or of the part of it until end
> +                   of IOMMU page */
and here

I would suggest to rewrite this into
s =iotlb.addr_mask - (used_phys & iotlb.addr_mask) + 1
s = MIN(s, used_size);
> +                s = MIN(s, used_size - 1) + 1;
> +
> +                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
> +                                      range_get_last(phys, s));
> +                used_size -= s;
> +                used_phys += s;
> +            }
> +        } else {
> +            vhost_dev_sync_region(dev, section, start_addr,
> +                                  end_addr, vq->used_phys,
> +                                  range_get_last(vq->used_phys, vq->used_size));
> +        }
>      }
>      return 0;
>  }
> @@ -306,24 +360,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
>      dev->log_size = size;
>  }
>  
> -static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> -{
> -    VirtIODevice *vdev = dev->vdev;
> -
> -    /*
> -     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> -     * incremental memory mapping API via IOTLB API. For platform that
> -     * does not have IOMMU, there's no need to enable this feature
> -     * which may cause unnecessary IOTLB miss/update transactions.
> -     */
> -    if (vdev) {
> -        return virtio_bus_device_iommu_enabled(vdev) &&
> -            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> -    } else {
> -        return false;
> -    }
> -}
> -
>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
>                                hwaddr *plen, bool is_write)
>  {
Besides,

Tested-by: Eric Auger <eric.auger@redhat.com>

Eric


