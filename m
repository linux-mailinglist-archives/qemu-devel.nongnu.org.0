Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39266613775
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:10:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opULq-0006QQ-OB; Mon, 31 Oct 2022 08:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opULj-00064r-Tb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opULg-0004c5-G6
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeulkgmcvCFM2bj3m+QubnBEE5BgKVZivAP+ZwKI4I0=;
 b=EVDj6p/aWyb6wrcFVcFpJKfE8EwrFCzARJo7tkvLG3c+6NYUOSwdu8Dhji5FvMBmvgwTYY
 ImssRRukawxV6u8RxN6gc5dRNJmsZ4reqVsS+1ORJDfNcTZcLHxg5HgpXXHpq3raNrHxqm
 48hGLb9mnBrOx20DAFB3U56H1UhRils=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-8yQssiL8Nv6xHnWXcPMA1A-1; Mon, 31 Oct 2022 08:57:02 -0400
X-MC-Unique: 8yQssiL8Nv6xHnWXcPMA1A-1
Received: by mail-ed1-f71.google.com with SMTP id
 m7-20020a056402430700b0045daff6ee5dso7706802edc.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeulkgmcvCFM2bj3m+QubnBEE5BgKVZivAP+ZwKI4I0=;
 b=lh5svv3lhifVNOg036I3pJ/oAD1Ujv+Bnu7ns4I5vYpRANBGEWwyqATiJ6tDL22UFq
 spjVicSooKOoZ3Lz3M9W+uG+WNMXYAyd2E+qZ6aC4bM+6YICy1hvznHxcrURyfSLJvtz
 PGNuv2JLqwGg8bx5Qqk1c3EUv5EVk95PvJ6KoZClTZScmgh/Q93iL5/yIFA9vW3CcBz+
 F5uN0vYhYHL3GGe9F6n5W9xHTBzAF1yYepxu7dg6hHtRADQvlfVj828uFGTxrowQNpMS
 UMOmFpQVyCW2gzTHQsBm7c5hMeFJx+1Wt+l1W8KSzYcER1/ZBrfb+kGsMcnWHmHPJLcU
 RClQ==
X-Gm-Message-State: ACrzQf0oDOvuIWaELK4JTo/TavYgAfVZo18Ei1ai9sydfkwT0Jf5bAMd
 Yjavw2qac0aJBA4Yt2Paxbz0n7mp43BGJvqkcR15FmJdh+11+eCpvv7D0WBqnZGbmyONg6Gvprh
 21Uc/iALvg+D75YDrWJTZ+HgMgEIh7zo=
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr13377340ejc.724.1667221021392; 
 Mon, 31 Oct 2022 05:57:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pfts6yf7BwR2Vkr+hxbRjpot6xChPI5Shl0wpuYrj2NBgmM+WlYc4/gX1WHzRdAxJ58hnJPPqJXfvaDv81ac=
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr13377310ejc.724.1667221021135; Mon, 31
 Oct 2022 05:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221031031020.1405111-1-lulu@redhat.com>
 <20221031031020.1405111-3-lulu@redhat.com>
 <20221031025743-mutt-send-email-mst@kernel.org>
 <CACLfguVJjqOwPfjsMCKFoaDOixmhxtvm+E_ENMpiqr7dHyr6RA@mail.gmail.com>
 <20221031031804-mutt-send-email-mst@kernel.org>
 <CACLfguVXPA8_oaszbUEs=RDDn-NrZZRUhAWoUCRQFS3JDViW5w@mail.gmail.com>
In-Reply-To: <CACLfguVXPA8_oaszbUEs=RDDn-NrZZRUhAWoUCRQFS3JDViW5w@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 31 Oct 2022 20:56:22 +0800
Message-ID: <CACLfguWf01q8+GmNBzs7XUUhZ6n3uAuwVp8FfjzyCyokPEzLXg@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] vhost-vdpa: add support for vIOMMU
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 at 16:30, Cindy Lu <lulu@redhat.com> wrote:
>
> On Mon, 31 Oct 2022 at 15:20, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Oct 31, 2022 at 03:15:14PM +0800, Cindy Lu wrote:
> > > ,
> > >
> > >
> > > On Mon, 31 Oct 2022 at 15:04, Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > > >
> > > > On Mon, Oct 31, 2022 at 11:10:20AM +0800, Cindy Lu wrote:
> > > > > Add support for vIOMMU. add the new function to deal with iommu M=
R.
> > > > > - during iommu_region_add register a specific IOMMU notifier,
> > > > >  and store all notifiers in a list.
> > > > > - during iommu_region_del, compare and delete the IOMMU notifier =
from the list
> > > > >
> > > > > Verified in vp_vdpa and vdpa_sim_net driver
> > > > >
> > > > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > > > ---
> > > > >  hw/virtio/vhost-vdpa.c         | 123 +++++++++++++++++++++++++++=
+++---
> > > > >  include/hw/virtio/vhost-vdpa.h |  10 +++
> > > > >  2 files changed, 122 insertions(+), 11 deletions(-)
> > > > >
> > > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > > index 3ff9ce3501..dcfaaccfa9 100644
> > > > > --- a/hw/virtio/vhost-vdpa.c
> > > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > > @@ -26,6 +26,7 @@
> > > > >  #include "cpu.h"
> > > > >  #include "trace.h"
> > > > >  #include "qapi/error.h"
> > > > > +#include "hw/virtio/virtio-access.h"
> > > > >
> > > > >  /*
> > > > >   * Return one past the end of the end of section. Be careful wit=
h uint64_t
> > > > > @@ -44,7 +45,6 @@ static bool vhost_vdpa_listener_skipped_section=
(MemoryRegionSection *section,
> > > > >                                                  uint64_t iova_mi=
n,
> > > > >                                                  uint64_t iova_ma=
x)
> > > > >  {
> > > > > -    Int128 llend;
> > > > >
> > > > >      if ((!memory_region_is_ram(section->mr) &&
> > > > >           !memory_region_is_iommu(section->mr)) ||
> > > > > @@ -61,14 +61,6 @@ static bool vhost_vdpa_listener_skipped_sectio=
n(MemoryRegionSection *section,
> > > > >          return true;
> > > > >      }
> > > > >
> > > > > -    llend =3D vhost_vdpa_section_end(section);
> > > > > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > > > > -        error_report("RAM section out of device range (max=3D0x%=
" PRIx64
> > > > > -                     ", end addr=3D0x%" PRIx64 ")",
> > > > > -                     iova_max, int128_get64(llend));
> > > > > -        return true;
> > > > > -    }
> > > > > -
> > > > >      return false;
> > > > >  }
> > > > >
> > > >
> > > > I couldn't figure out we are completely removing this.
> > > > So this function is now checking iova_min but not iova_max?
> > > > Seems asymmetrical.
> > > >
> > > this is because this is an asset for int128_get64=EF=BC=8CSo I just n=
ot jump
> > > this part of the check,
> > > static inline uint64_t int128_get64(Int128 a)
> > > {
> > >     uint64_t r =3D a;
> > >     assert(r =3D=3D a);
> > >     return r;
> > > }
> >
> >
> > ?
> >
> > Could not parse this. You mean assert? And removing functionality
> > because you don't like an error message does not make sense.
> > So find another way to print it?
> >
> sorry for my mistake here
> for this part, I remove this because it will report error in iommu mr add=
ed
> Also there is no such check in vfio,
> seems the llend is always small than iov_max in iommu domain,
> not sure we can remove it first and I will add more comments later ?
> Thanks
> cindy
sorry here I mean llend is larger than  iov_max here, so the iommu mr
can not pass the
check, not sure if we can remove this check first?
Thanks
Cindy
> >
> > >
> > > >
> > > > > @@ -173,6 +165,106 @@ static void vhost_vdpa_listener_commit(Memo=
ryListener *listener)
> > > > >      v->iotlb_batch_begin_sent =3D false;
> > > > >  }
> > > > >
> > > > > +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUT=
LBEntry *iotlb)
> > > > > +{
> > > > > +    struct vdpa_iommu *iommu =3D container_of(n, struct vdpa_iom=
mu, n);
> > > > > +
> > > > > +    hwaddr iova =3D iotlb->iova + iommu->iommu_offset;
> > > > > +    struct vhost_vdpa *v =3D iommu->dev;
> > > > > +    void *vaddr;
> > > > > +    int ret;
> > > > > +
> > > > > +    if (iotlb->target_as !=3D &address_space_memory) {
> > > > > +        error_report("Wrong target AS \"%s\", only system memory=
 is allowed",
> > > > > +                     iotlb->target_as->name ? iotlb->target_as->=
name : "none");
> > > > > +        return;
> > > > > +    }
> > > > > +    RCU_READ_LOCK_GUARD();
> > > > > +    vhost_vdpa_iotlb_batch_begin_once(v);
> > > > > +
> > > > > +    if ((iotlb->perm & IOMMU_RW) !=3D IOMMU_NONE) {
> > > > > +        bool read_only;
> > > > > +
> > > > > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_onl=
y, NULL)) {
> > > > > +            return;
> > > > > +        }
> > > > > +        ret =3D
> > > > > +            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, va=
ddr, read_only);
> > > > > +        if (ret) {
> > > > > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRI=
x ", "
> > > > > +                         "0x%" HWADDR_PRIx ", %p) =3D %d (%m)",
> > > > > +                         v, iova, iotlb->addr_mask + 1, vaddr, r=
et);
> > > > > +        }
> > > > > +    } else {
> > > > > +        ret =3D vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask +=
 1);
> > > > > +        if (ret) {
> > > > > +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_P=
RIx ", "
> > > > > +                         "0x%" HWADDR_PRIx ") =3D %d (%m)",
> > > > > +                         v, iova, iotlb->addr_mask + 1, ret);
> > > > > +        }
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void vhost_vdpa_iommu_region_add(MemoryListener *listener=
,
> > > > > +                                        MemoryRegionSection *sec=
tion)
> > > > > +{
> > > > > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost=
_vdpa, listener);
> > > > > +
> > > > > +    struct vdpa_iommu *iommu;
> > > > > +    Int128 end;
> > > > > +    int iommu_idx;
> > > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > > +    int ret;
> > > > > +
> > > > > +    iommu_mr =3D IOMMU_MEMORY_REGION(section->mr);
> > > > > +
> > > > > +    iommu =3D g_malloc0(sizeof(*iommu));
> > > > > +    end =3D  int128_add(int128_make64(section->offset_within_reg=
ion),
> > > > > +            section->size);
> > > > > +    end =3D int128_sub(end, int128_one());
> > > > > +    iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
> > > > > +            MEMTXATTRS_UNSPECIFIED);
> > > > > +
> > > > > +    iommu->iommu_mr =3D iommu_mr;
> > > > > +
> > > > > +    iommu_notifier_init(
> > > > > +        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_I=
OTLB_EVENTS,
> > > > > +        section->offset_within_region, int128_get64(end), iommu_=
idx);
> > > > > +    iommu->iommu_offset =3D
> > > > > +        section->offset_within_address_space - section->offset_w=
ithin_region;
> > > > > +    iommu->dev =3D v;
> > > > > +
> > > > > +    ret =3D memory_region_register_iommu_notifier(section->mr, &=
iommu->n, NULL);
> > > > > +    if (ret) {
> > > > > +        g_free(iommu);
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
> > > > > +    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
> > > > > +
> > > > > +    return;
> > > > > +}
> > > > > +
> > > > > +static void vhost_vdpa_iommu_region_del(MemoryListener *listener=
,
> > > > > +                                        MemoryRegionSection *sec=
tion)
> > > > > +{
> > > > > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost=
_vdpa, listener);
> > > > > +
> > > > > +    struct vdpa_iommu *iommu;
> > > > > +
> > > > > +    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
> > > > > +    {
> > > > > +        if (MEMORY_REGION(iommu->iommu_mr) =3D=3D section->mr &&
> > > > > +            iommu->n.start =3D=3D section->offset_within_region)=
 {
> > > > > +            memory_region_unregister_iommu_notifier(section->mr,=
 &iommu->n);
> > > > > +            QLIST_REMOVE(iommu, iommu_next);
> > > > > +            g_free(iommu);
> > > > > +            break;
> > > > > +        }
> > > > > +    }
> > > > > +}
> > > > > +
> > > > >  static void vhost_vdpa_listener_region_add(MemoryListener *liste=
ner,
> > > > >                                             MemoryRegionSection *=
section)
> > > > >  {
> > > > > @@ -186,6 +278,10 @@ static void vhost_vdpa_listener_region_add(M=
emoryListener *listener,
> > > > >                                              v->iova_range.last))=
 {
> > > > >          return;
> > > > >      }
> > > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > > +        vhost_vdpa_iommu_region_add(listener, section);
> > > > > +        return;
> > > > > +    }
> > > > >
> > > > >      if (unlikely((section->offset_within_address_space & ~TARGET=
_PAGE_MASK) !=3D
> > > > >                   (section->offset_within_region & ~TARGET_PAGE_M=
ASK))) {
> > > > > @@ -260,6 +356,10 @@ static void vhost_vdpa_listener_region_del(M=
emoryListener *listener,
> > > > >                                              v->iova_range.last))=
 {
> > > > >          return;
> > > > >      }
> > > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > > +        vhost_vdpa_iommu_region_del(listener, section);
> > > > > +        return;
> > > > > +    }
> > > > >
> > > > >      if (unlikely((section->offset_within_address_space & ~TARGET=
_PAGE_MASK) !=3D
> > > > >                   (section->offset_within_region & ~TARGET_PAGE_M=
ASK))) {
> > > > > @@ -312,6 +412,7 @@ static const MemoryListener vhost_vdpa_memory=
_listener =3D {
> > > > >      .region_del =3D vhost_vdpa_listener_region_del,
> > > > >  };
> > > > >
> > > > > +
> > > > >  static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long =
int request,
> > > > >                               void *arg)
> > > > >  {
> > > >
> > > >
> > > > This change is not necessary.
> > > >
> > > will fix this
> > > > > @@ -587,7 +688,6 @@ static int vhost_vdpa_cleanup(struct vhost_de=
v *dev)
> > > > >      v =3D dev->opaque;
> > > > >      trace_vhost_vdpa_cleanup(dev, v);
> > > > >      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > > > > -    memory_listener_unregister(&v->listener);
> > > > >      vhost_vdpa_svq_cleanup(dev);
> > > > >
> > > > >      dev->opaque =3D NULL;
> > > > > @@ -1127,7 +1227,8 @@ static int vhost_vdpa_dev_start(struct vhos=
t_dev *dev, bool started)
> > > > >      }
> > > > >
> > > > >      if (started) {
> > > > > -        memory_listener_register(&v->listener, &address_space_me=
mory);
> > > > > +        memory_listener_register(&v->listener, dev->vdev->dma_as=
);
> > > > > +
> > > > >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER=
_OK);
> > > > >      } else {
> > > > >          vhost_vdpa_reset_device(dev);
> > > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/v=
host-vdpa.h
> > > > > index d10a89303e..64a46e37cb 100644
> > > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > > @@ -41,8 +41,18 @@ typedef struct vhost_vdpa {
> > > > >      void *shadow_vq_ops_opaque;
> > > > >      struct vhost_dev *dev;
> > > > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > > > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > > > > +    IOMMUNotifier n;
> > > > >  } VhostVDPA;
> > > > >
> > > > > +struct vdpa_iommu {
> > > > > +    struct vhost_vdpa *dev;
> > > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > > +    hwaddr iommu_offset;
> > > > > +    IOMMUNotifier n;
> > > > > +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> > > > > +};
> > > > > +
> > > >
> > > > You need to add a typedef as per coding style.
> > > >
> > > will fix this
> > > Thanks
> > > Cindy
> > > > >  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr=
 size,
> > > > >                         void *vaddr, bool readonly);
> > > > >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwad=
dr size);
> > > > > --
> > > > > 2.34.3
> > > >
> >


