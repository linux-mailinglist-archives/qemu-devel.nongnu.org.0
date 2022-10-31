Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2EC61311D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 08:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opP1g-00065h-64; Mon, 31 Oct 2022 03:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opP1d-00065Z-UW
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:16:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opP1b-0007gb-Sz
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667200558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWyOzx8y/mNtv7v7rd5PuiXfENVBMJmE/RPvFJz4L2w=;
 b=EwklnjEIoniz/zsnZpybCIBnPTlW8AitjcQGKnzg/xlnQBnYz/0VscHHIxuBYyafOLkL2Z
 yQAfiDU2S/D2Uni5r9RFVFLU81rnN/K14UQtQXiFhUKKKqdHJH84LWm/WRt5qdiVybC6Us
 20FJFW5w+RDLmEREn+08ggxuLQ+RC+E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-3cLtWb5nNxaJvIsGLTLFNA-1; Mon, 31 Oct 2022 03:15:54 -0400
X-MC-Unique: 3cLtWb5nNxaJvIsGLTLFNA-1
Received: by mail-ej1-f70.google.com with SMTP id
 nb9-20020a1709071c8900b0078d858f15c1so5343420ejc.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 00:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWyOzx8y/mNtv7v7rd5PuiXfENVBMJmE/RPvFJz4L2w=;
 b=ptbiQjUq1HGSlMTrZEUe6XbWEfGSVJTqB2K5///QyFUA7Y92rEdoXvJClE/oKoHQGC
 QX3NujUZ3G/JBwc5elTQmRHUhaAka8GEma+Iblq3Cb4+UcjrExV6/3y28aeFVCw3qvp3
 VE2zJJbOnsj0NYYoKQXdiF280HvpcLxGYZA2jgcFfqfadWaSKBPBXESLr408MlxIBtqR
 3IckzKF55YBjH36Y42865VcXu6nDCcQzyZvDzCanizBF0ThimcbJBf5/idtl5yX5LaL/
 E/12BRm0CvjscncsDWtk1azb950wYHi3L8ytz+IIa/R2X/FBwfhatJ/Hed4LuQo6xV7Z
 jDQg==
X-Gm-Message-State: ACrzQf0hoFXmIP2IqfyzkRXk7h80JNovu7AKZ2jyINMKzToKvYe7MBrx
 sPUh+E+aDwoqCFXRjhjEFSzfrRhWeqgFXmMPT7EV/lv/zswAw+l0yjnQfss5BcV4pf5/7/uqrTW
 NmxyH4LWOHiKdBjLmyauXllKdkBETzZI=
X-Received: by 2002:a17:906:cc10:b0:7ad:d776:8b7a with SMTP id
 ml16-20020a170906cc1000b007add7768b7amr2226109ejb.508.1667200553235; 
 Mon, 31 Oct 2022 00:15:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6OtCucKPldeAZR+ifKaBZW9UZo8xp5wZNCLVCbmHSkICR1GdZr4RPjteHXwpFvv48d1bhH9+iQa+yyycgtaVo=
X-Received: by 2002:a17:906:cc10:b0:7ad:d776:8b7a with SMTP id
 ml16-20020a170906cc1000b007add7768b7amr2226079ejb.508.1667200552975; Mon, 31
 Oct 2022 00:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221031031020.1405111-1-lulu@redhat.com>
 <20221031031020.1405111-3-lulu@redhat.com>
 <20221031025743-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221031025743-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 31 Oct 2022 15:15:14 +0800
Message-ID: <CACLfguVJjqOwPfjsMCKFoaDOixmhxtvm+E_ENMpiqr7dHyr6RA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] vhost-vdpa: add support for vIOMMU
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

,


On Mon, 31 Oct 2022 at 15:04, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 31, 2022 at 11:10:20AM +0800, Cindy Lu wrote:
> > Add support for vIOMMU. add the new function to deal with iommu MR.
> > - during iommu_region_add register a specific IOMMU notifier,
> >  and store all notifiers in a list.
> > - during iommu_region_del, compare and delete the IOMMU notifier from t=
he list
> >
> > Verified in vp_vdpa and vdpa_sim_net driver
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c         | 123 ++++++++++++++++++++++++++++++---
> >  include/hw/virtio/vhost-vdpa.h |  10 +++
> >  2 files changed, 122 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 3ff9ce3501..dcfaaccfa9 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -26,6 +26,7 @@
> >  #include "cpu.h"
> >  #include "trace.h"
> >  #include "qapi/error.h"
> > +#include "hw/virtio/virtio-access.h"
> >
> >  /*
> >   * Return one past the end of the end of section. Be careful with uint=
64_t
> > @@ -44,7 +45,6 @@ static bool vhost_vdpa_listener_skipped_section(Memor=
yRegionSection *section,
> >                                                  uint64_t iova_min,
> >                                                  uint64_t iova_max)
> >  {
> > -    Int128 llend;
> >
> >      if ((!memory_region_is_ram(section->mr) &&
> >           !memory_region_is_iommu(section->mr)) ||
> > @@ -61,14 +61,6 @@ static bool vhost_vdpa_listener_skipped_section(Memo=
ryRegionSection *section,
> >          return true;
> >      }
> >
> > -    llend =3D vhost_vdpa_section_end(section);
> > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > -        error_report("RAM section out of device range (max=3D0x%" PRIx=
64
> > -                     ", end addr=3D0x%" PRIx64 ")",
> > -                     iova_max, int128_get64(llend));
> > -        return true;
> > -    }
> > -
> >      return false;
> >  }
> >
>
> I couldn't figure out we are completely removing this.
> So this function is now checking iova_min but not iova_max?
> Seems asymmetrical.
>
this is because this is an asset for int128_get64=EF=BC=8CSo I just not jum=
p
this part of the check,
static inline uint64_t int128_get64(Int128 a)
{
    uint64_t r =3D a;
    assert(r =3D=3D a);
    return r;
}


>
> > @@ -173,6 +165,106 @@ static void vhost_vdpa_listener_commit(MemoryList=
ener *listener)
> >      v->iotlb_batch_begin_sent =3D false;
> >  }
> >
> > +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntr=
y *iotlb)
> > +{
> > +    struct vdpa_iommu *iommu =3D container_of(n, struct vdpa_iommu, n)=
;
> > +
> > +    hwaddr iova =3D iotlb->iova + iommu->iommu_offset;
> > +    struct vhost_vdpa *v =3D iommu->dev;
> > +    void *vaddr;
> > +    int ret;
> > +
> > +    if (iotlb->target_as !=3D &address_space_memory) {
> > +        error_report("Wrong target AS \"%s\", only system memory is al=
lowed",
> > +                     iotlb->target_as->name ? iotlb->target_as->name :=
 "none");
> > +        return;
> > +    }
> > +    RCU_READ_LOCK_GUARD();
> > +    vhost_vdpa_iotlb_batch_begin_once(v);
> > +
> > +    if ((iotlb->perm & IOMMU_RW) !=3D IOMMU_NONE) {
> > +        bool read_only;
> > +
> > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NUL=
L)) {
> > +            return;
> > +        }
> > +        ret =3D
> > +            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr, r=
ead_only);
> > +        if (ret) {
> > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
> > +                         "0x%" HWADDR_PRIx ", %p) =3D %d (%m)",
> > +                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
> > +        }
> > +    } else {
> > +        ret =3D vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask + 1);
> > +        if (ret) {
> > +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ",=
 "
> > +                         "0x%" HWADDR_PRIx ") =3D %d (%m)",
> > +                         v, iova, iotlb->addr_mask + 1, ret);
> > +        }
> > +    }
> > +}
> > +
> > +static void vhost_vdpa_iommu_region_add(MemoryListener *listener,
> > +                                        MemoryRegionSection *section)
> > +{
> > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> > +
> > +    struct vdpa_iommu *iommu;
> > +    Int128 end;
> > +    int iommu_idx;
> > +    IOMMUMemoryRegion *iommu_mr;
> > +    int ret;
> > +
> > +    iommu_mr =3D IOMMU_MEMORY_REGION(section->mr);
> > +
> > +    iommu =3D g_malloc0(sizeof(*iommu));
> > +    end =3D  int128_add(int128_make64(section->offset_within_region),
> > +            section->size);
> > +    end =3D int128_sub(end, int128_one());
> > +    iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
> > +            MEMTXATTRS_UNSPECIFIED);
> > +
> > +    iommu->iommu_mr =3D iommu_mr;
> > +
> > +    iommu_notifier_init(
> > +        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_IOTLB_E=
VENTS,
> > +        section->offset_within_region, int128_get64(end), iommu_idx);
> > +    iommu->iommu_offset =3D
> > +        section->offset_within_address_space - section->offset_within_=
region;
> > +    iommu->dev =3D v;
> > +
> > +    ret =3D memory_region_register_iommu_notifier(section->mr, &iommu-=
>n, NULL);
> > +    if (ret) {
> > +        g_free(iommu);
> > +        return;
> > +    }
> > +
> > +    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
> > +    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
> > +
> > +    return;
> > +}
> > +
> > +static void vhost_vdpa_iommu_region_del(MemoryListener *listener,
> > +                                        MemoryRegionSection *section)
> > +{
> > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> > +
> > +    struct vdpa_iommu *iommu;
> > +
> > +    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
> > +    {
> > +        if (MEMORY_REGION(iommu->iommu_mr) =3D=3D section->mr &&
> > +            iommu->n.start =3D=3D section->offset_within_region) {
> > +            memory_region_unregister_iommu_notifier(section->mr, &iomm=
u->n);
> > +            QLIST_REMOVE(iommu, iommu_next);
> > +            g_free(iommu);
> > +            break;
> > +        }
> > +    }
> > +}
> > +
> >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> >                                             MemoryRegionSection *sectio=
n)
> >  {
> > @@ -186,6 +278,10 @@ static void vhost_vdpa_listener_region_add(MemoryL=
istener *listener,
> >                                              v->iova_range.last)) {
> >          return;
> >      }
> > +    if (memory_region_is_iommu(section->mr)) {
> > +        vhost_vdpa_iommu_region_add(listener, section);
> > +        return;
> > +    }
> >
> >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_=
MASK) !=3D
> >                   (section->offset_within_region & ~TARGET_PAGE_MASK)))=
 {
> > @@ -260,6 +356,10 @@ static void vhost_vdpa_listener_region_del(MemoryL=
istener *listener,
> >                                              v->iova_range.last)) {
> >          return;
> >      }
> > +    if (memory_region_is_iommu(section->mr)) {
> > +        vhost_vdpa_iommu_region_del(listener, section);
> > +        return;
> > +    }
> >
> >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_=
MASK) !=3D
> >                   (section->offset_within_region & ~TARGET_PAGE_MASK)))=
 {
> > @@ -312,6 +412,7 @@ static const MemoryListener vhost_vdpa_memory_liste=
ner =3D {
> >      .region_del =3D vhost_vdpa_listener_region_del,
> >  };
> >
> > +
> >  static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int re=
quest,
> >                               void *arg)
> >  {
>
>
> This change is not necessary.
>
will fix this
> > @@ -587,7 +688,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev=
)
> >      v =3D dev->opaque;
> >      trace_vhost_vdpa_cleanup(dev, v);
> >      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > -    memory_listener_unregister(&v->listener);
> >      vhost_vdpa_svq_cleanup(dev);
> >
> >      dev->opaque =3D NULL;
> > @@ -1127,7 +1227,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
> >      }
> >
> >      if (started) {
> > -        memory_listener_register(&v->listener, &address_space_memory);
> > +        memory_listener_register(&v->listener, dev->vdev->dma_as);
> > +
> >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >      } else {
> >          vhost_vdpa_reset_device(dev);
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index d10a89303e..64a46e37cb 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -41,8 +41,18 @@ typedef struct vhost_vdpa {
> >      void *shadow_vq_ops_opaque;
> >      struct vhost_dev *dev;
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > +    IOMMUNotifier n;
> >  } VhostVDPA;
> >
> > +struct vdpa_iommu {
> > +    struct vhost_vdpa *dev;
> > +    IOMMUMemoryRegion *iommu_mr;
> > +    hwaddr iommu_offset;
> > +    IOMMUNotifier n;
> > +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> > +};
> > +
>
> You need to add a typedef as per coding style.
>
will fix this
Thanks
Cindy
> >  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> >                         void *vaddr, bool readonly);
> >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr siz=
e);
> > --
> > 2.34.3
>


