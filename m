Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA44429DF5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:48:49 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maBai-0004o4-A2
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maBX3-0002z4-LW
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:45:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maBX1-0004Rb-L7
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634021099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HR1XKozCw29jQuL/rqyZei7Amp/dSb2bpNmN3xpgKyU=;
 b=EqnafkzAu33pqetg+eb/GXtQPFMmQLlXJFS4Ae0GmYR9tw0rqaKDHVeBM91njK8Ah4wHcN
 SGBS1FFREb25tqKgj1/Ykkhsn0o7BSznCNlWo9zJOhzdP8cq13Z3FMmXo/EHWA0Hc5lP7f
 eAafivAxPg1G40X5jwWtn0vcK4EpJNc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-CGJMwlnoOB68XvF3-PRKyA-1; Tue, 12 Oct 2021 02:44:58 -0400
X-MC-Unique: CGJMwlnoOB68XvF3-PRKyA-1
Received: by mail-lf1-f71.google.com with SMTP id
 v2-20020ac25582000000b003fd1c161a31so14311481lfg.15
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 23:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HR1XKozCw29jQuL/rqyZei7Amp/dSb2bpNmN3xpgKyU=;
 b=Oq97LS1XM321madPhrT6J5KkXLKiUnxY48puEq4M8GXFCIBfBhCel6xxHiKyusoJ56
 IF2ovvE+rVqr88HWGYMzonNOMb7i+CcpP2YzGbyMzqvSON/IkuDT5L1PV4R6ujYTpJOk
 xFW+54hDHoQva8GvDRb97LHl6gGb8iwADuePkChhtzZSxukY5MS6iLG4VYe3pXLxvSEQ
 37e8s4TDfxfWQINpG4qpsVCSQxyrM+hQVyHyQplKSuv+Uc0WKnsvbVRZ0BUGmO4+lMUP
 rQp2ByrSLdFQXNPLwVDO/2Hgn2mWn1XNioioQHyVExWu3kwGMCEbj2qAYawXdlZJEzGH
 m2EA==
X-Gm-Message-State: AOAM532Yzox9tdCKoc5xf/1U+Oj9v63LmP9i0B6J1YGA20btvDTHb/Q1
 nhwrLi16gz/8Mia8D7G+kZkYk/2W8M15jJfWz182ZG66wKm6nGutJqHMdkxq+OM9zSVxU8yjU+7
 bL1a65q3rvcf+KOTPflTlXk6mQWIw5yM=
X-Received: by 2002:a05:6512:3d29:: with SMTP id
 d41mr19751384lfv.481.1634021096006; 
 Mon, 11 Oct 2021 23:44:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ/FJX4R2dIYJFbINR+OcvZxTgHN/AJHkS3NS/VxufNDWziJU24qENRUhK80pS/tUlqrf+955SUw8/gNEDsaw=
X-Received: by 2002:a05:6512:3d29:: with SMTP id
 d41mr19751350lfv.481.1634021095653; 
 Mon, 11 Oct 2021 23:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211005134843.439050-1-eperezma@redhat.com>
 <20211005134843.439050-4-eperezma@redhat.com>
 <CACGkMEsGAKroQysXsNnQHVVnCZcEBsL34-qnDry9JEMcefVRAw@mail.gmail.com>
 <CAJaqyWec_h5nHPuWxZHLzOTVde57ghOXVat7HNPMryccb91mXQ@mail.gmail.com>
In-Reply-To: <CAJaqyWec_h5nHPuWxZHLzOTVde57ghOXVat7HNPMryccb91mXQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Oct 2021 14:44:44 +0800
Message-ID: <CACGkMEv9Vt6KwnFDobFwR1_3z=PJCbW16NbJ0_iNUOGgzStJLg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] vdpa: Check for iova range at mappings changes
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 2:28 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Oct 12, 2021 at 5:50 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Oct 5, 2021 at 9:49 PM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> > >
> > > Check vdpa device range before updating memory regions so we don't ad=
d
> > > any outside of it, and report the invalid change if any.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  include/hw/virtio/vhost-vdpa.h |  2 +
> > >  hw/virtio/vhost-vdpa.c         | 68 ++++++++++++++++++++++++++------=
--
> > >  hw/virtio/trace-events         |  1 +
> > >  3 files changed, 55 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> > > index a8963da2d9..c288cf7ecb 100644
> > > --- a/include/hw/virtio/vhost-vdpa.h
> > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > @@ -13,6 +13,7 @@
> > >  #define HW_VIRTIO_VHOST_VDPA_H
> > >
> > >  #include "hw/virtio/virtio.h"
> > > +#include "standard-headers/linux/vhost_types.h"
> > >
> > >  typedef struct VhostVDPAHostNotifier {
> > >      MemoryRegion mr;
> > > @@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
> > >      uint32_t msg_type;
> > >      bool iotlb_batch_begin_sent;
> > >      MemoryListener listener;
> > > +    struct vhost_vdpa_iova_range iova_range;
> > >      struct vhost_dev *dev;
> > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > >  } VhostVDPA;
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index be7c63b4ba..6654287050 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -37,20 +37,34 @@ static Int128 vhost_vdpa_section_end(const Memory=
RegionSection *section)
> > >      return llend;
> > >  }
> > >
> > > -static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection =
*section)
> > > -{
> > > -    return (!memory_region_is_ram(section->mr) &&
> > > -            !memory_region_is_iommu(section->mr)) ||
> > > -            memory_region_is_protected(section->mr) ||
> > > -           /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > > -            memory_region_is_ram_device(section->mr) ||
> > > -           /*
> > > -            * Sizing an enabled 64-bit BAR can cause spurious mappin=
gs to
> > > -            * addresses in the upper part of the 64-bit address spac=
e.  These
> > > -            * are never accessed by the CPU and beyond the address w=
idth of
> > > -            * some IOMMU hardware.  TODO: VDPA should tell us the IO=
MMU width.
> > > -            */
> > > -           section->offset_within_address_space & (1ULL << 63);
> > > +static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection =
*section,
> > > +                                                uint64_t iova_min,
> > > +                                                uint64_t iova_max)
> > > +{
> > > +    Int128 llend;
> > > +
> > > +    if ((!memory_region_is_ram(section->mr) &&
> > > +         !memory_region_is_iommu(section->mr)) ||
> > > +        memory_region_is_protected(section->mr) ||
> > > +        /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > > +        memory_region_is_ram_device(section->mr)) {
> > > +        return true;
> > > +    }
> > > +
> > > +    if (section->offset_within_address_space < iova_min) {
> > > +        error_report("RAM section out of device range (min=3D%lu, ad=
dr=3D%lu)",
> > > +                     iova_min, section->offset_within_address_space)=
;
> > > +        return true;
> > > +    }
> > > +
> > > +    llend =3D vhost_vdpa_section_end(section);
> > > +    if (int128_gt(llend, int128_make64(iova_max))) {
> > > +        error_report("RAM section out of device range (max=3D%lu, en=
d addr=3D%lu)",
> > > +                     iova_max, int128_get64(llend));
> > > +        return true;
> > > +    }
> > > +
> > > +    return false;
> > >  }
> > >
> > >  static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwa=
ddr size,
> > > @@ -162,7 +176,8 @@ static void vhost_vdpa_listener_region_add(Memory=
Listener *listener,
> > >      void *vaddr;
> > >      int ret;
> > >
> > > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.f=
irst,
> > > +                                            v->iova_range.last)) {
> > >          return;
> > >      }
> > >
> > > @@ -220,7 +235,8 @@ static void vhost_vdpa_listener_region_del(Memory=
Listener *listener,
> > >      Int128 llend, llsize;
> > >      int ret;
> > >
> > > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.f=
irst,
> > > +                                            v->iova_range.last)) {
> > >          return;
> > >      }
> > >
> > > @@ -288,9 +304,24 @@ static void vhost_vdpa_add_status(struct vhost_d=
ev *dev, uint8_t status)
> > >      vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
> > >  }
> > >
> > > +static int vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > > +{
> > > +    int ret;
> > > +
> > > +    ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE, &v->i=
ova_range);
> > > +    if (ret !=3D 0) {
> > > +        return ret;
> > > +    }
> >
> > I think we need a fallback for the kernel that does not support
> > VHOST_VDPA_GET_IOVA_RANGE?
> >
>
> I'm fine with giving a default, but only "old" kernels will not have
> the syscall. Future kernels will return success and [0, ULLONG_MAX]
> range, won't it?

Yes, but we need to make sure the qemu won't break on the kernel
without GET_IOVA_RANGE.

>
> Taking that into account, what is the good default value? Before this
> commit the valid range was [0, 2^63). Although that seems too wide for
> every iommu, I would go with that one. The kernel considers fine [0,
> ULLONG_MAX] in case the device and iommu domain does not support
> them...

I think it's good enough to use the value before the patch.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > > +
> > > +    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> > > +                                    v->iova_range.last);
> > > +    return ret;
> > > +}
> > > +
> > >  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Erro=
r **errp)
> > >  {
> > >      struct vhost_vdpa *v;
> > > +    int r;
> > >      assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VD=
PA);
> > >      trace_vhost_vdpa_init(dev, opaque);
> > >
> > > @@ -300,6 +331,11 @@ static int vhost_vdpa_init(struct vhost_dev *dev=
, void *opaque, Error **errp)
> > >      v->listener =3D vhost_vdpa_memory_listener;
> > >      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > >
> > > +    r =3D vhost_vdpa_get_iova_range(v);
> > > +    if (unlikely(!r)) {
> > > +        return r;
> > > +    }
> > > +
> > >      vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > >                                 VIRTIO_CONFIG_S_DRIVER);
> > >
> > > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > > index 8ed19e9d0c..650e521e35 100644
> > > --- a/hw/virtio/trace-events
> > > +++ b/hw/virtio/trace-events
> > > @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int i=
ndex, int fd) "dev: %p index:
> > >  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p featu=
res: 0x%"PRIx64
> > >  vhost_vdpa_set_owner(void *dev) "dev: %p"
> > >  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr,=
 uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_us=
er_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx6=
4
> > > +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) =
"dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
> > >
> > >  # virtio.c
> > >  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsi=
gned out_num) "elem %p size %zd in_num %u out_num %u"
> > > --
> > > 2.27.0
> > >
> >
>


