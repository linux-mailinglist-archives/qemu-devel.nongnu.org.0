Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE364B409
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 12:20:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p53J6-0005HS-87; Tue, 13 Dec 2022 06:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p53Is-00054Z-1X
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p53Ip-0002eK-Vc
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670930306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFxwwY6LrCXU+eXhOMg9Na0GrlD891aHyZtmrS9/qXs=;
 b=aWgcan7nzV9hQfNWCQZnAFMA5a55rBlJ9/dTU3E11waiqzvAjn5FWvllmMtHtksyydj6Bd
 op6094Q46FZrt8OJXfnkzxWcqJbAmEGfe0AQYlxhNHrWc6TybbLZy74bWyL3VN+mF+2tvP
 Wqh9szzJYdyTvldzI+ty91RICOeUdx4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-BAFvq1tbNROhMCFmjIVz_w-1; Tue, 13 Dec 2022 06:18:25 -0500
X-MC-Unique: BAFvq1tbNROhMCFmjIVz_w-1
Received: by mail-ed1-f72.google.com with SMTP id
 g14-20020a056402090e00b0046790cd9082so7068495edz.21
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 03:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EFxwwY6LrCXU+eXhOMg9Na0GrlD891aHyZtmrS9/qXs=;
 b=ZUVAuaDDDoaSNjSl1wgLobCtIBlhu8TCyR3obU2XmnuSj56sgbcjzW7chpwgZnoVEK
 sKPUaMxeBfap+F2GaGzgQUbi+R1d9DealoRyaOIGLM0WxigFE7BUm/jo6P7JpYhRjq7O
 fSzt4wvOIa/JLuDL50qqi7+3LIgPELk5yROlh7lL+hSN6UjVVzznbch9exloK8EmU6F6
 us4HKlTiOAvVUMfEpu+EUGA2moC1ZdfaniBYxlpxlHdfMWS39MPLHWYxiHHJl5nZg2OA
 MHYLCxojZkdHCCJ4QbSFUN+PiINcEsNx9PgN2eyiywDsSmN3tkEyyhiqPwzvURCaA4CI
 2yfA==
X-Gm-Message-State: ANoB5pkjcLKJqSRe+DMnzNwqoRuy2+V4eWqoxzZk2hZKcy+oL6AWE+jb
 lFm0OPaXCRUfTk0VUGQPcPv19uGJDWv450SQHbFVD/X/xoFOlJfETNU0gJfHPb1cg4Zu4u/midF
 ab5EWcI1vZnj/r+x8OmLc8gn3EntYwAE=
X-Received: by 2002:a17:906:32d9:b0:7ae:31a0:5727 with SMTP id
 k25-20020a17090632d900b007ae31a05727mr67368374ejk.540.1670930304088; 
 Tue, 13 Dec 2022 03:18:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6uCusYcQooME+FH5Uizw4vMsuH/MifzCriQ/qvH2LUnyyU7JkveorjpFKhrEItgFH9JU4X5Rz6CJhjNrlrP4k=
X-Received: by 2002:a17:906:32d9:b0:7ae:31a0:5727 with SMTP id
 k25-20020a17090632d900b007ae31a05727mr67368369ejk.540.1670930303821; Tue, 13
 Dec 2022 03:18:23 -0800 (PST)
MIME-Version: 1.0
References: <20221209130805.3614970-1-lulu@redhat.com>
 <20221209130805.3614970-2-lulu@redhat.com>
 <273d0d56-a1a0-444d-ac35-7eee3c83e6fe@redhat.com>
In-Reply-To: <273d0d56-a1a0-444d-ac35-7eee3c83e6fe@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 13 Dec 2022 12:17:46 +0100
Message-ID: <CAJaqyWds1rKsZDRCWC_fQ-7KEdHF1yaQx7UkP2cKO5K7T8trjw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] vhost-vdpa: add support for vIOMMU
To: Jason Wang <jasowang@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Dec 13, 2022 at 9:17 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/12/9 21:08, Cindy Lu =E5=86=99=E9=81=93:
> > 1.Skip the check in vhost_vdpa_listener_skipped_section() while
> > MR is IOMMU, Move this check to  vhost_vdpa_iommu_map_notify()
> > 2.Add support for vIOMMU.
>
>
> So I think the changlog needs some tweak, we need to explain why you
> need to do the above.
>
>
> > Add the new function to deal with iommu MR.
> > - during iommu_region_add register a specific IOMMU notifier,
> >   and store all notifiers in a list.
> > - during iommu_region_del, compare and delete the IOMMU notifier from t=
he list
>
>
> And try to describe how you implement it by avoid duplicating what the
> code did as below.
>
> E.g you can say you implement this through the IOMMU MAP notifier etc.
>
>
> >
> > Verified in vp_vdpa and vdpa_sim_net driver
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c         | 162 ++++++++++++++++++++++++++++++--=
-
> >   include/hw/virtio/vhost-vdpa.h |  10 ++
> >   2 files changed, 161 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 7468e44b87..2b3920c2a1 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -26,6 +26,7 @@
> >   #include "cpu.h"
> >   #include "trace.h"
> >   #include "qapi/error.h"
> > +#include "hw/virtio/virtio-access.h"
>
>
> Any reason you need to use virtio accessors here?
>
>
> >
> >   /*
> >    * Return one past the end of the end of section. Be careful with uin=
t64_t
> > @@ -60,15 +61,22 @@ static bool vhost_vdpa_listener_skipped_section(Mem=
oryRegionSection *section,
> >                        iova_min, section->offset_within_address_space);
> >           return true;
> >       }
> > +    /*
> > +     * While using vIOMMU, Sometimes the section will be larger than i=
ova_max
> > +     * but the memory that  actually mapping is smaller, So skip the c=
heck
> > +     * here. Will add the check in vhost_vdpa_iommu_map_notify,
> > +     *There is the real size that maps to the kernel
> > +     */
> >
> > -    llend =3D vhost_vdpa_section_end(section);
> > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > -        error_report("RAM section out of device range (max=3D0x%" PRIx=
64
> > -                     ", end addr=3D0x%" PRIx64 ")",
> > -                     iova_max, int128_get64(llend));
> > -        return true;
> > +    if (!memory_region_is_iommu(section->mr)) {
> > +        llend =3D vhost_vdpa_section_end(section);
> > +        if (int128_gt(llend, int128_make64(iova_max))) {
> > +            error_report("RAM section out of device range (max=3D0x%" =
PRIx64
> > +                         ", end addr=3D0x%" PRIx64 ")",
> > +                         iova_max, int128_get64(llend));
> > +            return true;
> > +        }
> >       }
> > -
> >       return false;
> >   }
> >
> > @@ -173,6 +181,115 @@ static void vhost_vdpa_listener_commit(MemoryList=
ener *listener)
> >       v->iotlb_batch_begin_sent =3D false;
> >   }
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
> > +    Int128 llend;
> > +
> > +    if (iotlb->target_as !=3D &address_space_memory) {
> > +        error_report("Wrong target AS \"%s\", only system memory is al=
lowed",
> > +                     iotlb->target_as->name ? iotlb->target_as->name :=
 "none");
> > +        return;
> > +    }
> > +    RCU_READ_LOCK_GUARD();
> > +    /* check if RAM section out of device range */
> > +    llend =3D int128_add(int128_makes64(iotlb->addr_mask), int128_make=
s64(iova));
> > +    if (int128_gt(llend, int128_make64(v->iova_range.last))) {
> > +        error_report("RAM section out of device range (max=3D0x%" PRIx=
64
> > +                     ", end addr=3D0x%" PRIx64 ")",
> > +                     v->iova_range.last, int128_get64(llend));
> > +        return;
> > +    }
> > +
> > +    vhost_vdpa_iotlb_batch_begin_once(v);'
>
>
> Any reason we need to consider batching here? (or batching can be done
> via notifier?)
>
>
> > +
> > +    if ((iotlb->perm & IOMMU_RW) !=3D IOMMU_NONE) {
> > +        bool read_only;
> > +
> > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NUL=
L)) {
> > +            return;
> > +        }
> > +
> > +        ret =3D vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vadd=
r,
> > +            read_only);
>
>
> Let's add some tracepoints for those as what is done in the
> region_add()/del().
>
>
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
> > +    end =3D int128_add(int128_make64(section->offset_within_region),
> > +        section->size);
>
>
> Though checkpatch.pl doesn't complain, the indentation looks odd, e.g
> the 's' should be indent to below "i" of "int128" etc.
>
> You can tweak you editor to adopt Qemu coding style.
>
>
> > +    end =3D int128_sub(end, int128_one());
> > +    iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
> > +        MEMTXATTRS_UNSPECIFIED);
> > +    iommu->iommu_mr =3D iommu_mr;
> > +    iommu_notifier_init(&iommu->n, vhost_vdpa_iommu_map_notify,
> > +        IOMMU_NOTIFIER_IOTLB_EVENTS,
> > +        section->offset_within_region, int128_get64(end), iommu_idx);
> > +    iommu->iommu_offset =3D section->offset_within_address_space -
> > +        section->offset_within_region;
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
> >   static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> >                                              MemoryRegionSection *secti=
on)
> >   {
> > @@ -187,6 +304,10 @@ static void vhost_vdpa_listener_region_add(MemoryL=
istener *listener,
> >                                               v->iova_range.last)) {
> >           return;
> >       }
> > +    if (memory_region_is_iommu(section->mr)) {
> > +        vhost_vdpa_iommu_region_add(listener, section);
>
>
> Adding Eugenio.
>
> I think it need to populate iova_tree otherwise the vIOMMU may break
> shadow virtqueue (and we need to do it for region_del as well).
>

Populate the iova_tree could be the easiest and more convenient way.

Thinking out loud, does iommu offer a way to iterate through its iova
tree? This way SVQ would avoid the duplication of the entries and the
need of maintain it.

SVQ would still need some entries in its own tree (SVQ vrings etc) anyhow.

Thanks!

> E.g you can test your code with shadow virtqueue via x-svq=3Don.
>
> Thanks
>
>


