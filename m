Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B3609AAD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:39:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompur-0001oj-7O; Mon, 24 Oct 2022 01:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1ompuW-0001kr-78
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1ompuT-0003RV-Nv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666588919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2rvryRJhkmRNSYEfbvfEryOJ7jnK9v66XAS8zUKZ0Q=;
 b=OTYcIyOjLBJnzAUcPbmTVIS0GfTB2awQJNXcXe/oRSCYbpaUO9Ty8PAkMHzdqjBYed/DRk
 PZ1k68m/rQF4GqZPcMxheC1c8sTZkk+s85V91OLoh8LDNoK7U2NtybV40hWaEexViuqw6t
 myHeQOYEKJcTuzm9gexOWQhjAB1zj0E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-Ty_hJGUdOmO8crCKAbdHwg-1; Mon, 24 Oct 2022 01:21:56 -0400
X-MC-Unique: Ty_hJGUdOmO8crCKAbdHwg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z15-20020a05640240cf00b00461b253c220so2189585edb.3
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H2rvryRJhkmRNSYEfbvfEryOJ7jnK9v66XAS8zUKZ0Q=;
 b=ADOkF/Pwr34CbI0TlEOhj+cBcUiLOqN6vQgya1rU9gfsvZEi6d1bIxBeTSNI6zB9FH
 fQK4cOKRDWc5IUdoB3aOqZGv15PWO/rWL1i22rfr92Og9Y1HLU8WAS9qY9ecsqDRobTT
 2n7JrVbaglMdgXgmNfpALDZM1EqyyqaIm6RVYC45mfqOmwWCavstiryIDELn3csQEHLg
 RHhKPO4stHm5hzg3P9EFB+DLJXVJqS+32aU6Q0PnzN9CWDSIdjgbP9wx0gs/RB5Ekd1n
 mJ/+TgAfHnVv5/FHDpNFCBHxNOCuknXseBxw0VVc1Hm9GqbFX6uPkb+6tPDIkdO5t9IH
 Uu7g==
X-Gm-Message-State: ACrzQf1HsZ9pY2e6Imm8SxzjRUQ32Cram+WtyUvKI6ZSxnybUAVv+KZ2
 V7NQW6Q3Q4Hs+rtd1+X4eYgdnTHLFggy8sC6Geu66Xy7xinR8j+OMA17voe48sLCMF3D5RkvsoX
 tMwQhqblt3j/tRjDtYJbF5Pcmooaafkc=
X-Received: by 2002:a17:907:2cf0:b0:7aa:21b1:9b4f with SMTP id
 hz16-20020a1709072cf000b007aa21b19b4fmr556617ejc.752.1666588915541; 
 Sun, 23 Oct 2022 22:21:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6u1GHKKrK5enl2Ah4e8nErgqCdmuphDvHucku6VHBa9Qbt85AmIlF2oOEyPPmhPGcSMKA5u5GLHlOA14bYqMs=
X-Received: by 2002:a17:907:2cf0:b0:7aa:21b1:9b4f with SMTP id
 hz16-20020a1709072cf000b007aa21b19b4fmr556603ejc.752.1666588915269; Sun, 23
 Oct 2022 22:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221019063925.581928-1-lulu@redhat.com>
 <CACGkMEsmrcraoE4h9RjFrart4R5m+2ACvVTiLuDKaYtGdGOevQ@mail.gmail.com>
 <CACLfguUET+811tYPNZ9xqp7Ubx4t2gUOBERkiwcV45Cn6T10Mg@mail.gmail.com>
 <CACGkMEvLcH-YDmw7YCWnBfCWFjzwAhZ4y2DKEvm=v=JDpUPoCg@mail.gmail.com>
In-Reply-To: <CACGkMEvLcH-YDmw7YCWnBfCWFjzwAhZ4y2DKEvm=v=JDpUPoCg@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 24 Oct 2022 13:21:18 +0800
Message-ID: <CACLfguVMiWq2Um9CakVVRcE0Dc_4-=Fj9+RGq4GGmy4ftRJ5fw@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa: add support for vIOMMU
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, eperezma@redhat.com, qemu-devel@nongnu.org, 
 stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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

On Mon, 24 Oct 2022 at 09:51, Jason Wang <jasowang@redhat.com> wrote:
>
> On Sun, Oct 23, 2022 at 10:46 PM Cindy Lu <lulu@redhat.com> wrote:
> >
> > On Thu, 20 Oct 2022 at 10:15, Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Wed, Oct 19, 2022 at 2:39 PM Cindy Lu <lulu@redhat.com> wrote:
> > > >
> > > > Add support for vIOMMU. Register a memory listener to dma_as in
> > > > dev_start
> > > > - during region_add register a specific IOMMU notifier, and store a=
ll notifiers in a list.
> > > > - during region_del, compare and delete the IOMMU notifier from the=
 list
> > > >
> > > > Verified in vp_vdpa and vdpa_sim_net driver
> > > >
> > > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > > ---
> > > >  hw/virtio/vhost-vdpa.c         | 218 +++++++++++++++++++++++++++++=
+++-
> > > >  include/hw/virtio/vhost-vdpa.h |  11 ++
> > > >  2 files changed, 226 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > index 3ff9ce3501..8f36423c28 100644
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
> > > > @@ -146,9 +147,8 @@ static void vhost_vdpa_iotlb_batch_begin_once(s=
truct vhost_vdpa *v)
> > > >      v->iotlb_batch_begin_sent =3D true;
> > > >  }
> > > >
> > > > -static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > > > +static void vhost_vdpa_iotlb_batch_end(struct vhost_vdpa *v)
> > > >  {
> > > > -    struct vhost_vdpa *v =3D container_of(listener, struct vhost_v=
dpa, listener);
> > > >      struct vhost_dev *dev =3D v->dev;
> > > >      struct vhost_msg_v2 msg =3D {};
> > > >      int fd =3D v->device_fd;
> > > > @@ -172,6 +172,18 @@ static void vhost_vdpa_listener_commit(MemoryL=
istener *listener)
> > > >
> > > >      v->iotlb_batch_begin_sent =3D false;
> > > >  }
> > > > +static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > > > +{
> > > > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost_v=
dpa, listener);
> > > > +    return vhost_vdpa_iotlb_batch_end(v);
> > > > +}
> > > > +
> > > > +static void vhost_vdpa_listener_iommu_commit(MemoryListener *liste=
ner)
> > > > +{
> > > > +    struct vhost_vdpa *v =3D
> > > > +        container_of(listener, struct vhost_vdpa, iommu_listener);
> > > > +    return vhost_vdpa_iotlb_batch_end(v);
> > > > +}
> > > >
> > > >  static void vhost_vdpa_listener_region_add(MemoryListener *listene=
r,
> > > >                                             MemoryRegionSection *se=
ction)
> > > > @@ -186,6 +198,9 @@ static void vhost_vdpa_listener_region_add(Memo=
ryListener *listener,
> > > >                                              v->iova_range.last)) {
> > > >          return;
> > > >      }
> > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > +        return;
> > > > +    }
> > > >
> > > >      if (unlikely((section->offset_within_address_space & ~TARGET_P=
AGE_MASK) !=3D
> > > >                   (section->offset_within_region & ~TARGET_PAGE_MAS=
K))) {
> > > > @@ -260,6 +275,9 @@ static void vhost_vdpa_listener_region_del(Memo=
ryListener *listener,
> > > >                                              v->iova_range.last)) {
> > > >          return;
> > > >      }
> > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > +        return;
> > > > +    }
> > > >
> > > >      if (unlikely((section->offset_within_address_space & ~TARGET_P=
AGE_MASK) !=3D
> > > >                   (section->offset_within_region & ~TARGET_PAGE_MAS=
K))) {
> > > > @@ -312,6 +330,180 @@ static const MemoryListener vhost_vdpa_memory=
_listener =3D {
> > > >      .region_del =3D vhost_vdpa_listener_region_del,
> > > >  };
> > > >
> > > > +/* Called with rcu_read_lock held.  */
> > > > +static bool vhost_vdpa_get_xlat_addr(IOMMUTLBEntry *iotlb, void **=
vaddr,
> > > > +                                     ram_addr_t *ram_addr, bool *r=
ead_only)
> > >
> > > So this looks exact the same as what VFIO did, try to unify them?
> > >
> > for this function, I have tried but seems the vfio does not complied
> > in some arch by default
> > such as m68k-softmmu, if we want to use this function, maybe we need
> > to enable the VFIO in
> > that arch, not sure if this is worth=EF=BC=9F
> > Thanks
> > cindy
>
> The function is nothing vfio specific, so let's move it somewhere e.g mem=
ory.c?
>
> Thanks
>
sure, I will try this
Thanks
Cindy
> >
> > > > +{
> > > > +    MemoryRegion *mr;
> > > > +    hwaddr xlat;
> > > > +    hwaddr len =3D iotlb->addr_mask + 1;
> > > > +    bool writable =3D iotlb->perm & IOMMU_WO;
> > > > +
> > > > +    /*
> > > > +     * The IOMMU TLB entry we have just covers translation through
> > > > +     * this IOMMU to its immediate target.  We need to translate
> > > > +     * it the rest of the way through to memory.
> > > > +     */
> > > > +    mr =3D address_space_translate(&address_space_memory, iotlb->t=
ranslated_addr,
> > > > +                                 &xlat, &len, writable, MEMTXATTRS=
_UNSPECIFIED);
> > > > +    if (!memory_region_is_ram(mr)) {
> > > > +        error_report("iommu map to non memory area %" HWADDR_PRIx =
"", xlat);
> > > > +        return false;
> > > > +    } else if (memory_region_has_ram_discard_manager(mr)) {
> > > > +        RamDiscardManager *rdm =3D memory_region_get_ram_discard_m=
anager(mr);
> > > > +        MemoryRegionSection tmp =3D {
> > > > +            .mr =3D mr,
> > > > +            .offset_within_region =3D xlat,
> > > > +            .size =3D int128_make64(len),
> > > > +        };
> > > > +
> > > > +        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > > > +            error_report("iommu map to discarded memory (e.g., unp=
lugged via"
> > > > +                         " virtio-mem): %" HWADDR_PRIx "",
> > > > +                         iotlb->translated_addr);
> > > > +            return false;
> > > > +        }
> > > > +    }
> > > > +    /*
> > > > +     * Translation truncates length to the IOMMU page size,
> > > > +     * check that it did not truncate too much.
> > > > +     */
> > > > +    if (len & iotlb->addr_mask) {
> > > > +        error_report("iommu has granularity incompatible with targ=
et AS");
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    if (vaddr) {
> > > > +        *vaddr =3D memory_region_get_ram_ptr(mr) + xlat;
> > > > +    }
> > > > +
> > > > +    if (ram_addr) {
> > > > +        *ram_addr =3D memory_region_get_ram_addr(mr) + xlat;
> > > > +    }
> > > > +
> > > > +    if (read_only) {
> > > > +        *read_only =3D !writable || mr->readonly;
> > > > +    }
> > > > +
> > > > +    return true;
> > > > +}
> > > > +
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
> > > > +        if (!vhost_vdpa_get_xlat_addr(iotlb, &vaddr, NULL, &read_o=
nly)) {
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
> > > > +    struct vhost_vdpa *v =3D
> > > > +        container_of(listener, struct vhost_vdpa, iommu_listener);
> > > > +
> > > > +    struct vdpa_iommu *iommu;
> > > > +    Int128 end;
> > > > +    int iommu_idx;
> > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > +    int ret;
> > > > +
> > > > +    if (!memory_region_is_iommu(section->mr)) {
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    iommu_mr =3D IOMMU_MEMORY_REGION(section->mr);
> > > > +
> > > > +    iommu =3D g_malloc0(sizeof(*iommu));
> > > > +    end =3D
> > > > +        int128_add(int128_make64(section->offset_within_region), s=
ection->size);
> > >
> > > I'd suggest to tweak the line breaking here and below, e.g you can
> > > keep int128_add and other stuffs as long as it does not exceeds 70 or
> > > 80 characters at the line where "end =3D" sits.
> > >
> > sure will change this
> > > > +    end =3D int128_sub(end, int128_one());
> > > > +    iommu_idx =3D
> > > > +        memory_region_iommu_attrs_to_index(iommu_mr, MEMTXATTRS_UN=
SPECIFIED);
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
> > > > +    struct vhost_vdpa *v =3D
> > > > +        container_of(listener, struct vhost_vdpa, iommu_listener);
> > > > +
> > > > +    struct vdpa_iommu *iommu;
> > > > +
> > > > +    if (!memory_region_is_iommu(section->mr)) {
> > > > +        return;
> > > > +    }
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
> > > > +static const MemoryListener vhost_vdpa_iommu_listener =3D {
> > > > +    .name =3D "vhost-vdpa-iommu",
> > > > +    .region_add =3D vhost_vdpa_iommu_region_add,
> > > > +    .region_del =3D vhost_vdpa_iommu_region_del,
> > > > +    .commit =3D vhost_vdpa_listener_iommu_commit,
> > >
> > > Unless there's a special requirement. I'd suggest to reuse the
> > > existing listener (since you've already had if (iommu_region()) check
> > > there).
> > >
> > > Thanks
> > >
> > sure Thanks Jason , will provide a new version soon
> > Thanks
> > Cindy
> > > > +};
> > > > +
> > > >  static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long in=
t request,
> > > >                               void *arg)
> > > >  {
> > > > @@ -433,6 +625,18 @@ static int vhost_vdpa_init_svq(struct vhost_de=
v *hdev, struct vhost_vdpa *v,
> > > >      return 0;
> > > >  }
> > > >
> > > > +static bool vdpa_dev_has_iommu(struct vhost_dev *dev)
> > > > +{
> > > > +    VirtIODevice *vdev =3D dev->vdev;
> > > > +
> > > > +    if (vdev) {
> > > > +        return virtio_bus_device_iommu_enabled(vdev) &&
> > > > +               virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFO=
RM);
> > > > +    } else {
> > > > +        return false;
> > > > +    }
> > > > +}
> > > > +
> > > >  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Er=
ror **errp)
> > > >  {
> > > >      struct vhost_vdpa *v;
> > > > @@ -454,6 +658,7 @@ static int vhost_vdpa_init(struct vhost_dev *de=
v, void *opaque, Error **errp)
> > > >      v->dev =3D dev;
> > > >      dev->opaque =3D  opaque ;
> > > >      v->listener =3D vhost_vdpa_memory_listener;
> > > > +    v->iommu_listener =3D vhost_vdpa_iommu_listener;
> > > >      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > > >      ret =3D vhost_vdpa_init_svq(dev, v, errp);
> > > >      if (ret) {
> > > > @@ -587,7 +792,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev =
*dev)
> > > >      v =3D dev->opaque;
> > > >      trace_vhost_vdpa_cleanup(dev, v);
> > > >      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > > > -    memory_listener_unregister(&v->listener);
> > > >      vhost_vdpa_svq_cleanup(dev);
> > > >
> > > >      dev->opaque =3D NULL;
> > > > @@ -1128,11 +1332,19 @@ static int vhost_vdpa_dev_start(struct vhos=
t_dev *dev, bool started)
> > > >
> > > >      if (started) {
> > > >          memory_listener_register(&v->listener, &address_space_memo=
ry);
> > > > +        if (vdpa_dev_has_iommu(dev)) {
> > > > +            memory_listener_register(&v->iommu_listener, dev->vdev=
->dma_as);
> > > > +        }
> > > > +
> > > >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_O=
K);
> > > >      } else {
> > > >          vhost_vdpa_reset_device(dev);
> > > >          vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > > >                                     VIRTIO_CONFIG_S_DRIVER);
> > > > +
> > > > +        if (vdpa_dev_has_iommu(dev)) {
> > > > +            memory_listener_unregister(&v->iommu_listener);
> > > > +        }
> > > >          memory_listener_unregister(&v->listener);
> > > >
> > > >          return 0;
> > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vho=
st-vdpa.h
> > > > index d10a89303e..22cbce7934 100644
> > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > @@ -30,6 +30,7 @@ typedef struct vhost_vdpa {
> > > >      uint32_t msg_type;
> > > >      bool iotlb_batch_begin_sent;
> > > >      MemoryListener listener;
> > > > +    MemoryListener iommu_listener;
> > > >      struct vhost_vdpa_iova_range iova_range;
> > > >      uint64_t acked_features;
> > > >      bool shadow_vqs_enabled;
> > > > @@ -41,8 +42,18 @@ typedef struct vhost_vdpa {
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
> > > >  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr s=
ize,
> > > >                         void *vaddr, bool readonly);
> > > >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr=
 size);
> > > > --
> > > > 2.34.3
> > > >
> > >
> >
>


