Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E06131BA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:32:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQCM-0005ca-VD; Mon, 31 Oct 2022 04:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opQCJ-0005c8-EQ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:31:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opQCE-0005R9-QU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667205062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C58KpE83BQXCGAkNfxfz1bet404EnJNtFtXRZeyD+DI=;
 b=NrzynykyeXdsUgBuZmmCuFMYzTLfsRzd9POj9eIRyoH/lZYRaMhFr+9SwqQwD4wfEXAEyp
 zdLjBIFQqydWChhc+S0b9E0ehOMI+QfSTgFJnwxSdRTty/FoMlWKT4USVwYHE1mkAsjZtZ
 7ych8CAEQvK6zoHAmZFnJ9ISRQiN5c4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-42-CrdLD-FKPq2JOqOKJUKXcQ-1; Mon, 31 Oct 2022 04:30:59 -0400
X-MC-Unique: CrdLD-FKPq2JOqOKJUKXcQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y18-20020a056402359200b004635f8b1bfbso1235911edc.17
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C58KpE83BQXCGAkNfxfz1bet404EnJNtFtXRZeyD+DI=;
 b=Zohr47I+VjzjED8rKr952FQxJs03E14KulVwe2tiM7nTfprT8F1xgSkAfTf1XqxsDa
 UL12UjPAXOzei+6zijiGEWooOxPqmF5TOJjIhk+dD7bbDuGyft/bGepsbnwjuhzKyggx
 QYWkH7aR3JVKM7orH4YRzFYV3dcfxPr6+8uUQh30bfUksED//83oc78n/fSxGRlddkVT
 vbGiWpZTDOpDnP5fKy/8ZIiZ1V1CJb+MJJyGoDxERNr6aZlkAzMFD1kFnjqq4xGWN8jJ
 opqvjkq1gJy9MqmXb8KqM5sj1xHkhS5kuBZ2xo5iX6xHlnWCu5wMDq7rEtPmO7Jt+lj+
 lloQ==
X-Gm-Message-State: ACrzQf3qy1tKOpsqguSZs47yqbT+Pk97JXJmgjB9vGDX0mC8oBiv07zG
 SCjoF8k645VKPHGEko91BrSKixE2eg8ICdY1KyzvH7TZhIK3QrRMHccVi/QoAd4B1pHIm4ovqYU
 VLE0qIeufiHmxYFsDr7U9MiHOuW6ZXdM=
X-Received: by 2002:aa7:d858:0:b0:463:12ed:3f86 with SMTP id
 f24-20020aa7d858000000b0046312ed3f86mr9502410eds.281.1667205058250; 
 Mon, 31 Oct 2022 01:30:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM76y5yd1dAgVLlHUF9PorR1wRsTSH/ZLcmM3zyqaRSD2+3H03Lh+1Cu1A273/r4vcgn8QEGjTCfNKFgx0jOYiY=
X-Received: by 2002:aa7:d858:0:b0:463:12ed:3f86 with SMTP id
 f24-20020aa7d858000000b0046312ed3f86mr9502388eds.281.1667205057998; Mon, 31
 Oct 2022 01:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221031031020.1405111-1-lulu@redhat.com>
 <20221031031020.1405111-3-lulu@redhat.com>
 <20221031025743-mutt-send-email-mst@kernel.org>
 <CACLfguVJjqOwPfjsMCKFoaDOixmhxtvm+E_ENMpiqr7dHyr6RA@mail.gmail.com>
 <20221031031804-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221031031804-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 31 Oct 2022 16:30:20 +0800
Message-ID: <CACLfguVXPA8_oaszbUEs=RDDn-NrZZRUhAWoUCRQFS3JDViW5w@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] vhost-vdpa: add support for vIOMMU
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 at 15:20, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 31, 2022 at 03:15:14PM +0800, Cindy Lu wrote:
> > ,
> >
> >
> > On Mon, 31 Oct 2022 at 15:04, Michael S. Tsirkin <mst@redhat.com> wrote=
:
> > >
> > > On Mon, Oct 31, 2022 at 11:10:20AM +0800, Cindy Lu wrote:
> > > > Add support for vIOMMU. add the new function to deal with iommu MR.
> > > > - during iommu_region_add register a specific IOMMU notifier,
> > > >  and store all notifiers in a list.
> > > > - during iommu_region_del, compare and delete the IOMMU notifier fr=
om the list
> > > >
> > > > Verified in vp_vdpa and vdpa_sim_net driver
> > > >
> > > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > > ---
> > > >  hw/virtio/vhost-vdpa.c         | 123 +++++++++++++++++++++++++++++=
+---
> > > >  include/hw/virtio/vhost-vdpa.h |  10 +++
> > > >  2 files changed, 122 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > index 3ff9ce3501..dcfaaccfa9 100644
> > > > --- a/hw/virtio/vhost-vdpa.c
> > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > @@ -26,6 +26,7 @@
> > > >  #include "cpu.h"
> > > >  #include "trace.h"
> > > >  #include "qapi/error.h"
> > > > +#include "hw/virtio/virtio-access.h"
> > > >
> > > >  /*
> > > >   * Return one past the end of the end of section. Be careful with =
uint64_t
> > > > @@ -44,7 +45,6 @@ static bool vhost_vdpa_listener_skipped_section(M=
emoryRegionSection *section,
> > > >                                                  uint64_t iova_min,
> > > >                                                  uint64_t iova_max)
> > > >  {
> > > > -    Int128 llend;
> > > >
> > > >      if ((!memory_region_is_ram(section->mr) &&
> > > >           !memory_region_is_iommu(section->mr)) ||
> > > > @@ -61,14 +61,6 @@ static bool vhost_vdpa_listener_skipped_section(=
MemoryRegionSection *section,
> > > >          return true;
> > > >      }
> > > >
> > > > -    llend =3D vhost_vdpa_section_end(section);
> > > > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > > > -        error_report("RAM section out of device range (max=3D0x%" =
PRIx64
> > > > -                     ", end addr=3D0x%" PRIx64 ")",
> > > > -                     iova_max, int128_get64(llend));
> > > > -        return true;
> > > > -    }
> > > > -
> > > >      return false;
> > > >  }
> > > >
> > >
> > > I couldn't figure out we are completely removing this.
> > > So this function is now checking iova_min but not iova_max?
> > > Seems asymmetrical.
> > >
> > this is because this is an asset for int128_get64=EF=BC=8CSo I just not=
 jump
> > this part of the check,
> > static inline uint64_t int128_get64(Int128 a)
> > {
> >     uint64_t r =3D a;
> >     assert(r =3D=3D a);
> >     return r;
> > }
>
>
> ?
>
> Could not parse this. You mean assert? And removing functionality
> because you don't like an error message does not make sense.
> So find another way to print it?
>
sorry for my mistake here
for this part, I remove this because it will report error in iommu mr added
Also there is no such check in vfio,
seems the llend is always small than iov_max in iommu domain,
not sure we can remove it first and I will add more comments later ?
Thanks
cindy
>
> >
> > >
> > > > @@ -173,6 +165,106 @@ static void vhost_vdpa_listener_commit(Memory=
Listener *listener)
> > > >      v->iotlb_batch_begin_sent =3D false;
> > > >  }
> > > >
> > > > +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLB=
Entry *iotlb)
> > > > +{
> > > > +    struct vdpa_iommu *iommu =3D container_of(n, struct vdpa_iommu=
, n);
> > > > +
> > > > +    hwaddr iova =3D iotlb->iova + iommu->iommu_offset;
> > > > +    struct vhost_vdpa *v =3D iommu->dev;
> > > > +    void *vaddr;
> > > > +    int ret;
> > > > +
> > > > +    if (iotlb->target_as !=3D &address_space_memory) {
> > > > +        error_report("Wrong target AS \"%s\", only system memory i=
s allowed",
> > > > +                     iotlb->target_as->name ? iotlb->target_as->na=
me : "none");
> > > > +        return;
> > > > +    }
> > > > +    RCU_READ_LOCK_GUARD();
> > > > +    vhost_vdpa_iotlb_batch_begin_once(v);
> > > > +
> > > > +    if ((iotlb->perm & IOMMU_RW) !=3D IOMMU_NONE) {
> > > > +        bool read_only;
> > > > +
> > > > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only,=
 NULL)) {
> > > > +            return;
> > > > +        }
> > > > +        ret =3D
> > > > +            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vadd=
r, read_only);
> > > > +        if (ret) {
> > > > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx =
", "
> > > > +                         "0x%" HWADDR_PRIx ", %p) =3D %d (%m)",
> > > > +                         v, iova, iotlb->addr_mask + 1, vaddr, ret=
);
> > > > +        }
> > > > +    } else {
> > > > +        ret =3D vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask + 1=
);
> > > > +        if (ret) {
> > > > +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRI=
x ", "
> > > > +                         "0x%" HWADDR_PRIx ") =3D %d (%m)",
> > > > +                         v, iova, iotlb->addr_mask + 1, ret);
> > > > +        }
> > > > +    }
> > > > +}
> > > > +
> > > > +static void vhost_vdpa_iommu_region_add(MemoryListener *listener,
> > > > +                                        MemoryRegionSection *secti=
on)
> > > > +{
> > > > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost_v=
dpa, listener);
> > > > +
> > > > +    struct vdpa_iommu *iommu;
> > > > +    Int128 end;
> > > > +    int iommu_idx;
> > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > +    int ret;
> > > > +
> > > > +    iommu_mr =3D IOMMU_MEMORY_REGION(section->mr);
> > > > +
> > > > +    iommu =3D g_malloc0(sizeof(*iommu));
> > > > +    end =3D  int128_add(int128_make64(section->offset_within_regio=
n),
> > > > +            section->size);
> > > > +    end =3D int128_sub(end, int128_one());
> > > > +    iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
> > > > +            MEMTXATTRS_UNSPECIFIED);
> > > > +
> > > > +    iommu->iommu_mr =3D iommu_mr;
> > > > +
> > > > +    iommu_notifier_init(
> > > > +        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_IOT=
LB_EVENTS,
> > > > +        section->offset_within_region, int128_get64(end), iommu_id=
x);
> > > > +    iommu->iommu_offset =3D
> > > > +        section->offset_within_address_space - section->offset_wit=
hin_region;
> > > > +    iommu->dev =3D v;
> > > > +
> > > > +    ret =3D memory_region_register_iommu_notifier(section->mr, &io=
mmu->n, NULL);
> > > > +    if (ret) {
> > > > +        g_free(iommu);
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
> > > > +    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
> > > > +
> > > > +    return;
> > > > +}
> > > > +
> > > > +static void vhost_vdpa_iommu_region_del(MemoryListener *listener,
> > > > +                                        MemoryRegionSection *secti=
on)
> > > > +{
> > > > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost_v=
dpa, listener);
> > > > +
> > > > +    struct vdpa_iommu *iommu;
> > > > +
> > > > +    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
> > > > +    {
> > > > +        if (MEMORY_REGION(iommu->iommu_mr) =3D=3D section->mr &&
> > > > +            iommu->n.start =3D=3D section->offset_within_region) {
> > > > +            memory_region_unregister_iommu_notifier(section->mr, &=
iommu->n);
> > > > +            QLIST_REMOVE(iommu, iommu_next);
> > > > +            g_free(iommu);
> > > > +            break;
> > > > +        }
> > > > +    }
> > > > +}
> > > > +
> > > >  static void vhost_vdpa_listener_region_add(MemoryListener *listene=
r,
> > > >                                             MemoryRegionSection *se=
ction)
> > > >  {
> > > > @@ -186,6 +278,10 @@ static void vhost_vdpa_listener_region_add(Mem=
oryListener *listener,
> > > >                                              v->iova_range.last)) {
> > > >          return;
> > > >      }
> > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > +        vhost_vdpa_iommu_region_add(listener, section);
> > > > +        return;
> > > > +    }
> > > >
> > > >      if (unlikely((section->offset_within_address_space & ~TARGET_P=
AGE_MASK) !=3D
> > > >                   (section->offset_within_region & ~TARGET_PAGE_MAS=
K))) {
> > > > @@ -260,6 +356,10 @@ static void vhost_vdpa_listener_region_del(Mem=
oryListener *listener,
> > > >                                              v->iova_range.last)) {
> > > >          return;
> > > >      }
> > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > +        vhost_vdpa_iommu_region_del(listener, section);
> > > > +        return;
> > > > +    }
> > > >
> > > >      if (unlikely((section->offset_within_address_space & ~TARGET_P=
AGE_MASK) !=3D
> > > >                   (section->offset_within_region & ~TARGET_PAGE_MAS=
K))) {
> > > > @@ -312,6 +412,7 @@ static const MemoryListener vhost_vdpa_memory_l=
istener =3D {
> > > >      .region_del =3D vhost_vdpa_listener_region_del,
> > > >  };
> > > >
> > > > +
> > > >  static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long in=
t request,
> > > >                               void *arg)
> > > >  {
> > >
> > >
> > > This change is not necessary.
> > >
> > will fix this
> > > > @@ -587,7 +688,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev =
*dev)
> > > >      v =3D dev->opaque;
> > > >      trace_vhost_vdpa_cleanup(dev, v);
> > > >      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > > > -    memory_listener_unregister(&v->listener);
> > > >      vhost_vdpa_svq_cleanup(dev);
> > > >
> > > >      dev->opaque =3D NULL;
> > > > @@ -1127,7 +1227,8 @@ static int vhost_vdpa_dev_start(struct vhost_=
dev *dev, bool started)
> > > >      }
> > > >
> > > >      if (started) {
> > > > -        memory_listener_register(&v->listener, &address_space_memo=
ry);
> > > > +        memory_listener_register(&v->listener, dev->vdev->dma_as);
> > > > +
> > > >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_O=
K);
> > > >      } else {
> > > >          vhost_vdpa_reset_device(dev);
> > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vho=
st-vdpa.h
> > > > index d10a89303e..64a46e37cb 100644
> > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > @@ -41,8 +41,18 @@ typedef struct vhost_vdpa {
> > > >      void *shadow_vq_ops_opaque;
> > > >      struct vhost_dev *dev;
> > > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > > > +    IOMMUNotifier n;
> > > >  } VhostVDPA;
> > > >
> > > > +struct vdpa_iommu {
> > > > +    struct vhost_vdpa *dev;
> > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > +    hwaddr iommu_offset;
> > > > +    IOMMUNotifier n;
> > > > +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> > > > +};
> > > > +
> > >
> > > You need to add a typedef as per coding style.
> > >
> > will fix this
> > Thanks
> > Cindy
> > > >  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr s=
ize,
> > > >                         void *vaddr, bool readonly);
> > > >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr=
 size);
> > > > --
> > > > 2.34.3
> > >
>


