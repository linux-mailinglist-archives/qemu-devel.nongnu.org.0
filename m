Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93D63C3FF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 16:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p02mc-0003Zo-LL; Tue, 29 Nov 2022 10:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p02mb-0003ZK-91
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:44:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p02mY-0003mF-LE
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669736665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZmlmfTevd+dIdtiIM+D7fW8ABNPW/7eUlPFdWpLLH0Q=;
 b=SPnK0T36/jy7xzCSYcXtTAsHGO2IJ2NlzqjVOD0C63jiIRAd6GgUF8eG/oYXmZ1EfLtlbh
 96yM45qI2+UWo3ZW0gHp6+GNseXxDomcIrT3Q8m8kfaaxEYyvafq+5zYYQjHzTkyzsasXS
 ALQvGXIKvl5T/DAvdjttaLh9QkuAWq0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-SjQkVJhyOoCd3DsOuPRLQA-1; Tue, 29 Nov 2022 10:44:23 -0500
X-MC-Unique: SjQkVJhyOoCd3DsOuPRLQA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c1-20020a7bc001000000b003cfe40fca79so4888303wmb.6
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 07:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmlmfTevd+dIdtiIM+D7fW8ABNPW/7eUlPFdWpLLH0Q=;
 b=yVEbbCuShHvwI3Rwgqu5IPWL0DGe7lCbzmPh4NNCMRlUPiaQM+0/PR213aJtqmvkzw
 NxlibB9vYacwfKKnsTxMlzQmxlbJ7eZldkMY33lpSsYCwFiyzUqi9kfMGhBULkffmWLa
 AjXz96Dvl0Vf58UP+6G+d04U7iek1PPuEb35vbh8VRc4V5lVF7OVkWb7e8SsF1aTu8l+
 +QtWH9V+psYYCvla2AGOO9i6pLNw09OVUu6VujbD40RhGX3JBcnSP18HGraAIiJmtmJT
 KeO4D1+FJgE4PqNCXQE806y72Sjg+bxGJyJ6huCvboUyCa/dWW+EGcxcvkdAZPPXTMxt
 zywQ==
X-Gm-Message-State: ANoB5pl0rkgz4i8twxuOuHWsq+FHWVy5YgysROJpT9pyFuSYfGjps6ry
 /O1iQImSDRM+nguqv98WlPRPWUJSvEvyLlOBUnnj+Qjfmk7I8eHoc7jD2aJuybqZbcoMa3stROq
 AmMwoum64P3siO+g=
X-Received: by 2002:a05:6000:a01:b0:241:e856:e441 with SMTP id
 co1-20020a0560000a0100b00241e856e441mr20809743wrb.493.1669736662291; 
 Tue, 29 Nov 2022 07:44:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7jOPIj9wxw/SuH67/BT1RUBxR1om1u9h4mYNxia81fkh2fvRqrm3FxhALehKolHPUx3BEmmA==
X-Received: by 2002:a05:6000:a01:b0:241:e856:e441 with SMTP id
 co1-20020a0560000a0100b00241e856e441mr20809725wrb.493.1669736661998; 
 Tue, 29 Nov 2022 07:44:21 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 h9-20020adffd49000000b002383fc96509sm13961716wrs.47.2022.11.29.07.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 07:44:20 -0800 (PST)
Date: Tue, 29 Nov 2022 10:44:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Lei Yang <leiyang@redhat.com>,
 Yalan Zhang <yalzhang@redhat.com>
Subject: Re: [PATCH for 7.2? V2] vhost: fix vq dirty bitmap syncing when
 vIOMMU is enabled
Message-ID: <20221129104311-mutt-send-email-mst@kernel.org>
References: <20221129040232.10116-1-jasowang@redhat.com>
 <ea906777-1be5-70d7-5eb1-3f50169ac7a5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea906777-1be5-70d7-5eb1-3f50169ac7a5@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Nov 29, 2022 at 10:52:29AM +0100, Eric Auger wrote:
> Hi Jason,
> 
> On 11/29/22 05:02, Jason Wang wrote:
> > When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
> > GPA. So we need to translate it to GPA before the syncing otherwise we
> > may hit the following crash since IOVA could be out of the scope of
> > the GPA log size. This could be noted when using virtio-IOMMU with
> > vhost using 1G memory.
> >
> > Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
> > Cc: qemu-stable@nongnu.org
> > Tested-by: Lei Yang <leiyang@redhat.com>
> > Reported-by: Yalan Zhang <yalzhang@redhat.com>
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> > Changes since V1:
> > - Fix the address calculation when used ring is not page aligned
> > - Fix the length for each round of dirty bitmap syncing
> > - Use LOG_GUEST_ERROR to log wrong used adddress
> > - Various other tweaks
> > ---
> >  hw/virtio/vhost.c | 76 ++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 56 insertions(+), 20 deletions(-)
> >
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index d1c4c20b8c..0cd5f25fcb 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -20,6 +20,7 @@
> >  #include "qemu/range.h"
> >  #include "qemu/error-report.h"
> >  #include "qemu/memfd.h"
> > +#include "qemu/log.h"
> >  #include "standard-headers/linux/vhost_types.h"
> >  #include "hw/virtio/virtio-bus.h"
> >  #include "hw/virtio/virtio-access.h"
> > @@ -106,6 +107,24 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
> >      }
> >  }
> >  
> > +static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> > +{
> > +    VirtIODevice *vdev = dev->vdev;
> > +
> > +    /*
> > +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> > +     * incremental memory mapping API via IOTLB API. For platform that
> > +     * does not have IOMMU, there's no need to enable this feature
> > +     * which may cause unnecessary IOTLB miss/update transactions.
> > +     */
> > +    if (vdev) {
> > +        return virtio_bus_device_iommu_enabled(vdev) &&
> > +            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > +    } else {
> > +        return false;
> > +    }
> > +}
> > +
> >  static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> >                                     MemoryRegionSection *section,
> >                                     hwaddr first,
> > @@ -137,8 +156,43 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> >              continue;
> >          }
> >  
> > -        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
> > -                              range_get_last(vq->used_phys, vq->used_size));
> > +        if (vhost_dev_has_iommu(dev)) {
> > +            IOMMUTLBEntry iotlb;
> > +            hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
> > +            hwaddr phys, s;
> > +
> > +            while (used_size) {
> > +                rcu_read_lock();
> > +                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
> > +                                                      used_phys,
> > +                                                      true, MEMTXATTRS_UNSPECIFIED);
> > +                rcu_read_unlock();
> > +
> > +                if (!iotlb.target_as) {
> > +                    qemu_log_mask(LOG_GUEST_ERROR, "translation "
> > +                                  "failure for used_phys %"PRIx64"\n", used_phys);
> looks weird to see translation of "used_phys" whereas it is an iova. At
> least I would reword the msg
> > +                    return -EINVAL;
> > +                }
> > +
> > +                phys = iotlb.translated_addr + (used_phys & iotlb.addr_mask);
> you may use a local variable storing this offset =
> 
> used_phys & iotlb.addr_mask
> 
> > +
> > +                /* Distance from start of used ring until last byte of
> > +                   IOMMU page */
> you can avoid checkpatch warnings here
> > +                s = iotlb.addr_mask - (used_phys & iotlb.addr_mask);
> > +                /* Size of used ring, or of the part of it until end
> > +                   of IOMMU page */
> and here
> 
> I would suggest to rewrite this into
> s =iotlb.addr_mask - (used_phys & iotlb.addr_mask) + 1
> s = MIN(s, used_size);

This does not work - if iotlb.addr_mask - (used_phys & iotlb.addr_mask)
is all-ones then + 1 gives you 0 and MIN gives you 0.
Theoretical but worth being safe here IMHO.


> > +                s = MIN(s, used_size - 1) + 1;
> > +
> > +                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
> > +                                      range_get_last(phys, s));
> > +                used_size -= s;
> > +                used_phys += s;
> > +            }
> > +        } else {
> > +            vhost_dev_sync_region(dev, section, start_addr,
> > +                                  end_addr, vq->used_phys,
> > +                                  range_get_last(vq->used_phys, vq->used_size));
> > +        }
> >      }
> >      return 0;
> >  }
> > @@ -306,24 +360,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
> >      dev->log_size = size;
> >  }
> >  
> > -static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> > -{
> > -    VirtIODevice *vdev = dev->vdev;
> > -
> > -    /*
> > -     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> > -     * incremental memory mapping API via IOTLB API. For platform that
> > -     * does not have IOMMU, there's no need to enable this feature
> > -     * which may cause unnecessary IOTLB miss/update transactions.
> > -     */
> > -    if (vdev) {
> > -        return virtio_bus_device_iommu_enabled(vdev) &&
> > -            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > -    } else {
> > -        return false;
> > -    }
> > -}
> > -
> >  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> >                                hwaddr *plen, bool is_write)
> >  {
> Besides,
> 
> Tested-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric


