Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7C63EB83
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:47:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fES-0006GO-Vc; Thu, 01 Dec 2022 03:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0fEQ-0006FA-FH
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:47:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0fEO-0007f3-Kg
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669884463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QqAz6xmlUHyOuM9ymI75bcAa3zlnJbxi2h1FoHgqxjo=;
 b=NqnUTQgddsb7ae3eiwZ2J4MEQkboMxUFEH33hmc9/nxp7wx9RImYYxrKIGzGj4zZcf/J3d
 Bjnht+rwxiiKNlPkCNxj02XnL1meHSgqEMiZq+IEyztEd61IMECD4VIdRgPwv9sVmMjYnp
 T2NezEEl0PhRCD9UoKyhA+F628fntpw=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-OJt6kthWMaeud5H0iSpdmA-1; Thu, 01 Dec 2022 03:47:42 -0500
X-MC-Unique: OJt6kthWMaeud5H0iSpdmA-1
Received: by mail-oi1-f199.google.com with SMTP id
 bf10-20020a056808190a00b0035a0a5ab8b6so793236oib.11
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QqAz6xmlUHyOuM9ymI75bcAa3zlnJbxi2h1FoHgqxjo=;
 b=rtCbxF/8xRc0hxedAhRSk0r8Icg5XCoNJ/XWx5kuw0S0tBPT3vdF8uidnT8rMnLtFj
 yT/eKM8mQSW5qpfaknIlD8Pzl0jSpCZbvqpPzlMXG4bhaBX+UBeQ9/WQoYAcl2/tf6Tg
 mPWpgEZkPA3zIAoBUkTuhc9qbMTtA6+LXq26FG7fh6Ed0aqecCV+TbPkjnZA/4gz6mFD
 fYkOl3r5eRvMW/hjVAJg3dA8W22FoWy5kBfshB/VeOIjckuIzaG3nS/4ydGP5SI3u0rR
 tO9eHkTMP+D5qKyDAcOQZ5WxWBUVMIDWDrU71+OKk5pmCGZyceoUV0ENqs6zOKS8AT8r
 lPcg==
X-Gm-Message-State: ANoB5pkGvZAxR1Y1j4G1j9Re5Y97iCaVp9d2FQ/K9/c2qpu4o4jREPdN
 P7WRbDs7uqbr3pH+919fTQRs0TmLSHhNIWAKfRj16xN9eEGzYHQaY/UTCMpQS9rODy3+w3bDpSL
 NwmFpc9CRUfwRaFFmTNM83btJ872hSKg=
X-Received: by 2002:a05:6808:2093:b0:35b:ded0:4164 with SMTP id
 s19-20020a056808209300b0035bded04164mr1326370oiw.280.1669884461614; 
 Thu, 01 Dec 2022 00:47:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6iDpS+RWWOgbM2GRt+0bBMU2/jue7La358WIglGG0qF/VFHS89WUIN9y+cG2OLmXIqe+9XyHRd8K+1Pj+yriY=
X-Received: by 2002:a05:6808:2093:b0:35b:ded0:4164 with SMTP id
 s19-20020a056808209300b0035bded04164mr1326357oiw.280.1669884461335; Thu, 01
 Dec 2022 00:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20221129040232.10116-1-jasowang@redhat.com>
 <ea906777-1be5-70d7-5eb1-3f50169ac7a5@redhat.com>
 <20221129104311-mutt-send-email-mst@kernel.org>
 <3b971908-e3dc-b684-6374-4f440676e0c4@redhat.com>
In-Reply-To: <3b971908-e3dc-b684-6374-4f440676e0c4@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Dec 2022 16:47:30 +0800
Message-ID: <CACGkMEuHUujWDsRhUfGXGxn5qdvti8WPDkMQD1Y-TzmTBhNGeA@mail.gmail.com>
Subject: Re: [PATCH for 7.2? V2] vhost: fix vq dirty bitmap syncing when
 vIOMMU is enabled
To: eric.auger@redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, 
 Lei Yang <leiyang@redhat.com>, Yalan Zhang <yalzhang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 30, 2022 at 12:08 AM Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Michael,
>
> On 11/29/22 16:44, Michael S. Tsirkin wrote:
> > On Tue, Nov 29, 2022 at 10:52:29AM +0100, Eric Auger wrote:
> >> Hi Jason,
> >>
> >> On 11/29/22 05:02, Jason Wang wrote:
> >>> When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
> >>> GPA. So we need to translate it to GPA before the syncing otherwise we
> >>> may hit the following crash since IOVA could be out of the scope of
> >>> the GPA log size. This could be noted when using virtio-IOMMU with
> >>> vhost using 1G memory.
> >>>
> >>> Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
> >>> Cc: qemu-stable@nongnu.org
> >>> Tested-by: Lei Yang <leiyang@redhat.com>
> >>> Reported-by: Yalan Zhang <yalzhang@redhat.com>
> >>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >>> ---
> >>> Changes since V1:
> >>> - Fix the address calculation when used ring is not page aligned
> >>> - Fix the length for each round of dirty bitmap syncing
> >>> - Use LOG_GUEST_ERROR to log wrong used adddress
> >>> - Various other tweaks
> >>> ---
> >>>  hw/virtio/vhost.c | 76 ++++++++++++++++++++++++++++++++++-------------
> >>>  1 file changed, 56 insertions(+), 20 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >>> index d1c4c20b8c..0cd5f25fcb 100644
> >>> --- a/hw/virtio/vhost.c
> >>> +++ b/hw/virtio/vhost.c
> >>> @@ -20,6 +20,7 @@
> >>>  #include "qemu/range.h"
> >>>  #include "qemu/error-report.h"
> >>>  #include "qemu/memfd.h"
> >>> +#include "qemu/log.h"
> >>>  #include "standard-headers/linux/vhost_types.h"
> >>>  #include "hw/virtio/virtio-bus.h"
> >>>  #include "hw/virtio/virtio-access.h"
> >>> @@ -106,6 +107,24 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
> >>>      }
> >>>  }
> >>>
> >>> +static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> >>> +{
> >>> +    VirtIODevice *vdev = dev->vdev;
> >>> +
> >>> +    /*
> >>> +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> >>> +     * incremental memory mapping API via IOTLB API. For platform that
> >>> +     * does not have IOMMU, there's no need to enable this feature
> >>> +     * which may cause unnecessary IOTLB miss/update transactions.
> >>> +     */
> >>> +    if (vdev) {
> >>> +        return virtio_bus_device_iommu_enabled(vdev) &&
> >>> +            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >>> +    } else {
> >>> +        return false;
> >>> +    }
> >>> +}
> >>> +
> >>>  static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> >>>                                     MemoryRegionSection *section,
> >>>                                     hwaddr first,
> >>> @@ -137,8 +156,43 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> >>>              continue;
> >>>          }
> >>>
> >>> -        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
> >>> -                              range_get_last(vq->used_phys, vq->used_size));
> >>> +        if (vhost_dev_has_iommu(dev)) {
> >>> +            IOMMUTLBEntry iotlb;
> >>> +            hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
> >>> +            hwaddr phys, s;
> >>> +
> >>> +            while (used_size) {
> >>> +                rcu_read_lock();
> >>> +                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
> >>> +                                                      used_phys,
> >>> +                                                      true, MEMTXATTRS_UNSPECIFIED);
> >>> +                rcu_read_unlock();
> >>> +
> >>> +                if (!iotlb.target_as) {
> >>> +                    qemu_log_mask(LOG_GUEST_ERROR, "translation "
> >>> +                                  "failure for used_phys %"PRIx64"\n", used_phys);
> >> looks weird to see translation of "used_phys" whereas it is an iova. At
> >> least I would reword the msg

Let me tweak this in the next version.

> >>> +                    return -EINVAL;
> >>> +                }
> >>> +
> >>> +                phys = iotlb.translated_addr + (used_phys & iotlb.addr_mask);
> >> you may use a local variable storing this offset =
> >>
> >> used_phys & iotlb.addr_mask

Ok.

> >>
> >>> +
> >>> +                /* Distance from start of used ring until last byte of
> >>> +                   IOMMU page */
> >> you can avoid checkpatch warnings here
> >>> +                s = iotlb.addr_mask - (used_phys & iotlb.addr_mask);
> >>> +                /* Size of used ring, or of the part of it until end
> >>> +                   of IOMMU page */
> >> and here

Will fix.

> >>
> >> I would suggest to rewrite this into
> >> s =iotlb.addr_mask - (used_phys & iotlb.addr_mask) + 1
> >> s = MIN(s, used_size);
> > This does not work - if iotlb.addr_mask - (used_phys & iotlb.addr_mask)
> > is all-ones then + 1 gives you 0 and MIN gives you 0.
> > Theoretical but worth being safe here IMHO.
> Ah OK, I should have read your previous discussion more thoroughly ...
> Maybe just add a short comment then to justify the gym below and avoid
> tempting sbdy else to rewrite it in a more common but wrong way.

That's fine.

Thanks

>
> Thanks
>
> Eric
> >
> >
> >>> +                s = MIN(s, used_size - 1) + 1;
> >>> +
> >>> +                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
> >>> +                                      range_get_last(phys, s));
> >>> +                used_size -= s;
> >>> +                used_phys += s;
> >>> +            }
> >>> +        } else {
> >>> +            vhost_dev_sync_region(dev, section, start_addr,
> >>> +                                  end_addr, vq->used_phys,
> >>> +                                  range_get_last(vq->used_phys, vq->used_size));
> >>> +        }
> >>>      }
> >>>      return 0;
> >>>  }
> >>> @@ -306,24 +360,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
> >>>      dev->log_size = size;
> >>>  }
> >>>
> >>> -static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> >>> -{
> >>> -    VirtIODevice *vdev = dev->vdev;
> >>> -
> >>> -    /*
> >>> -     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> >>> -     * incremental memory mapping API via IOTLB API. For platform that
> >>> -     * does not have IOMMU, there's no need to enable this feature
> >>> -     * which may cause unnecessary IOTLB miss/update transactions.
> >>> -     */
> >>> -    if (vdev) {
> >>> -        return virtio_bus_device_iommu_enabled(vdev) &&
> >>> -            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >>> -    } else {
> >>> -        return false;
> >>> -    }
> >>> -}
> >>> -
> >>>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> >>>                                hwaddr *plen, bool is_write)
> >>>  {
> >> Besides,
> >>
> >> Tested-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> Eric
>


