Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997136338E3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPoq-0004LN-GN; Tue, 22 Nov 2022 04:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxPoo-0004Ky-Cc
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:43:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxPom-000293-FD
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669110231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0vvbGRJ2jJTAgv+rHdLndIgEe7ygLcB7IBmXdfzAQbU=;
 b=Hw3BlHu8YKVv3CSD3Yg70NU/alsb2w9bWKOe+EJZF4zWaxXhZd2r/FoyddKSHdgLtG73J9
 Jh2j/81fdc/lyI7LLdfazUVeoJlyE7y6yKlaBpg4Ax0qcWaIs9D34Z7fSn+f3Q57I0LXZT
 IiFzmzJU6nMZiT6UH09al+u9LWDw65I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-159-_3kl3uDRPou7eOuRvk_hvw-1; Tue, 22 Nov 2022 04:43:49 -0500
X-MC-Unique: _3kl3uDRPou7eOuRvk_hvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l32-20020a05600c1d2000b003cfefa531c9so593589wms.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0vvbGRJ2jJTAgv+rHdLndIgEe7ygLcB7IBmXdfzAQbU=;
 b=7Q7jlo42wzNQ+xIJ/pCjWg1htMW0Ox5Nl74w2fKOqop34hkIIGO/H/WsWhzzSSOE1i
 Ym6Cg9Qe3C3Ud59/2kORf9/kKr6UBDN2gIeEg6pokZ9E1WAjcagtean/xkrRDb47vG4v
 jFPreRKaYVI9D48vMSlhLM/K23UNdDRfrRbukYlLCnTga+f+HCJxeasKAc/ryvLuArF1
 cKyrQxeVkh7vpEy848e96LzNaHp/9e17bbFls9FFB5fO695RNR0+pzpvUv6oyWXnsmOp
 OepcHYGjbWtKOWvVpInW+VCpsUmNhXb9hd1OTZ0oJmb3fY3E+Zon+LknsLJNthxfiy86
 1Lzg==
X-Gm-Message-State: ANoB5pkLjYKsdRaIm1ksOL2ZeZ7jOhuPpB7XNMtZ2/tMS61RBom+YphE
 f8wKx25co3XA/+5g5jEyaP/6tUh5EOOeEotp8ctt9S2wYbFJ5NQ+qE/V7ZhYeZ3WklA5kcxpAif
 UjEPgLU6FJ0EgpKA=
X-Received: by 2002:a5d:6547:0:b0:241:e4cc:f044 with SMTP id
 z7-20020a5d6547000000b00241e4ccf044mr930932wrv.457.1669110228501; 
 Tue, 22 Nov 2022 01:43:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf41MEqMR93+3qihcOS0V8lMbMI4VQ3wbSOcesrAAqLWkRfbuZcVE9uiQreHMQFsn0D618TYmg==
X-Received: by 2002:a5d:6547:0:b0:241:e4cc:f044 with SMTP id
 z7-20020a5d6547000000b00241e4ccf044mr930918wrv.457.1669110228207; 
 Tue, 22 Nov 2022 01:43:48 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 e16-20020adffd10000000b00241b933f8cesm13602128wrr.74.2022.11.22.01.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:43:47 -0800 (PST)
Date: Tue, 22 Nov 2022 04:43:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Yalan Zhang <yalzhang@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Lei Yang <leiyang@redhat.com>
Subject: Re: [PATCH for 7.2?] vhost: fix vq dirt bitmap syncing when vIOMMU
 is enabled
Message-ID: <20221122035846-mutt-send-email-mst@kernel.org>
References: <20221122030111.4230-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122030111.4230-1-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Nov 22, 2022 at 11:01:11AM +0800, Jason Wang wrote:
> When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
> GPA. So we need to translate it to GPA before the syncing otherwise we
> may hit the following crash since IOVA could be out of the scope of
> the GPA log size. This could be noted when using virtio-IOMMU with
> vhost using 1G memory.

Noted how exactly? What does "using 1G memory" mean?

> Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
> Cc: qemu-stable@nongnu.org
> Reported-by: Yalan Zhang <yalzhang@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Lei Yang <leiyang@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/virtio/vhost.c | 65 ++++++++++++++++++++++++++++++++---------------
>  1 file changed, 45 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index d1c4c20b8c..26b319f34e 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -106,11 +106,30 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
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
>                                     hwaddr last)
>  {
> +    IOMMUTLBEntry iotlb;

why don't we move this inside the scope where it's used?

>      int i;
>      hwaddr start_addr;
>      hwaddr end_addr;
> @@ -132,13 +151,37 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
>      }
>      for (i = 0; i < dev->nvqs; ++i) {
>          struct vhost_virtqueue *vq = dev->vqs + i;
> +        hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
> +        hwaddr phys, s;

these two, too.

>  
>          if (!vq->used_phys && !vq->used_size) {
>              continue;
>          }
>  
> -        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
> -                              range_get_last(vq->used_phys, vq->used_size));
> +        if (vhost_dev_has_iommu(dev)) {
> +            while (used_size) {
> +                rcu_read_lock();
> +                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
> +                                                      used_phys,
> +                                                      true, MEMTXATTRS_UNSPECIFIED);
> +                rcu_read_unlock();
> +
> +                if (iotlb.target_as == NULL) {
> +                    return -EINVAL;

I am not sure how this can trigger. I don't like == NULL:
!iotlb.target_as is more succint. But a bigger question is how to
handle this. callers ignore the return value so maybe
log guest error? iommu seems misconfigured ...


> +                }
> +
> +                phys = iotlb.translated_addr;
> +                s = MIN(iotlb.addr_mask + 1, used_size);

Note, that iotlb.translated_addr here is an aligned address and
iotlb.addr_mask + 1 is size from there. 

So I think phys that you want is actually
	phys = iotlb.translated_addr + (used_phys & iotlb.addr_mask);



accordingly, the size would be from there until end of mask:
	s = MIN(iotlb.addr_mask + 1 - (used_phys & iotlb.addr_mask), used_size);


Also, it bothers me that the math here will give you 0 if addr_mask is
all ones. Then MIN will give 0 too and we loop forever.  I think this
can not trigger, but I'd rather we play it safe and add outside of MIN
after it's capped to a reasonable value. So we end up with:

	/* Distance from start of used ring until last byte of IOMMU page */
	s = iotlb.addr_mask - (used_phys & iotlb.addr_mask);
	/* size of used ring, or of the part of it until end of IOMMU page */
	s = MIN(s, used_size - 1) + 1;





> +
> +                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
> +                                      range_get_last(phys, used_size));

why are you syncing used_size here? Shouldn't it be s?



> +                used_size -= s;
> +                used_phys += s;
> +            }
> +        } else {
> +            vhost_dev_sync_region(dev, section, start_addr, end_addr, used_phys,
> +                                  range_get_last(used_phys, used_size));
> +        }
>      }
>      return 0;
>  }
> @@ -306,24 +349,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
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
> -- 
> 2.25.1


