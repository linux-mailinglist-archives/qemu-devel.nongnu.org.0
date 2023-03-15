Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A5A6BA74A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 06:42:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcJss-0005nm-Dz; Wed, 15 Mar 2023 01:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pcJsp-0005nB-N1
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 01:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pcJsn-0002QK-0X
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 01:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678858862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxiNTIq2GxEs8H9GI6kv3s14JEweXFFySpWK18Webg8=;
 b=HhUCren2DdD75lUcSoeLPwDM8/eLaMyfuv+tJhrBLSLp/Gysk5B/WpU2SEXRBIWI1L2/0q
 d4KZamKKjbSGfO828voctvuVN+6ZJUE6TYj8szXW9P49TQ+/fQeR12S543HnJQXYvwosVo
 WNNmqQxCyhlAOB7GWreU+zQaHfcBLm0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-oZwpy5ZcOheHhJuzFYehSg-1; Wed, 15 Mar 2023 01:39:04 -0400
X-MC-Unique: oZwpy5ZcOheHhJuzFYehSg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i25-20020adfaad9000000b002cff37de14fso88329wrc.16
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 22:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678858743;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxiNTIq2GxEs8H9GI6kv3s14JEweXFFySpWK18Webg8=;
 b=ujMHbcFebeGamcgOWDCAxXz0W4i/Jv/FYASsG2w8W80m/nmv61zpwVh6018t/sqQfA
 pfXPGXds3Tt5SLGyODzCDubRrImMEFkHGu4QZZa3+CU1hCPkNKtwEvjTeb4IFmJNuHV/
 OKiUyT7wTHrTzZZg+eJZdflSF5Fn47avItdTxlv0HZPdKE41cPoHy1drCsdYvsfFIv4i
 BYIUviB+L8jks0Sr8mJFtikOpQmLTF6S+ZTJ6fZA5s2iv9QoFFPtVsW4i8PEewxWGpIW
 Bjipq1Eoa8C4VUiLX5rRV7M2utIBlhgbinvsuHywCE0c+k5jWqOpi7s8Gn/GYcoWH5dQ
 fFtw==
X-Gm-Message-State: AO0yUKXii8dCT2j0D8KqU1CDeZSru/+fG5iZbAmHGr+9erQbCa/6xVye
 8VL5jPMffYdCRZr61aGZHxmxkzYc/RQuCD8G9XRdICbPthwmjAseAna+ECmFc7gDeEHLrqkYk7r
 39DWJXyYZ8z48y7whunuMfhq74mqBYL0=
X-Received: by 2002:adf:ef08:0:b0:2cf:e711:1c50 with SMTP id
 e8-20020adfef08000000b002cfe7111c50mr240916wro.8.1678858743069; 
 Tue, 14 Mar 2023 22:39:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set99Mm5c3kH+4Sx+abShnsY4C28tc/Ne9MJO1a2tSpy3/d/hmEMKqbJxtinJ8Zjej4x16az7pqcyybv2RxYuMFo=
X-Received: by 2002:adf:ef08:0:b0:2cf:e711:1c50 with SMTP id
 e8-20020adfef08000000b002cfe7111c50mr240915wro.8.1678858742672; Tue, 14 Mar
 2023 22:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230208025722.2683024-1-lulu@redhat.com>
 <20230208025722.2683024-3-lulu@redhat.com>
 <7d12ff4f-3d33-e360-c76c-b0937b6be7c8@redhat.com>
In-Reply-To: <7d12ff4f-3d33-e360-c76c-b0937b6be7c8@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 15 Mar 2023 13:38:24 +0800
Message-ID: <CACLfguU15GSeSnsd1SyWtv3rEXbwanXwiu662qsSCpW4ZZLEOw@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] vhost-vdpa: add support for vIOMMU
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

On Mon, Mar 6, 2023 at 11:36=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
>
> =E5=9C=A8 2023/2/8 10:57, Cindy Lu =E5=86=99=E9=81=93:
> > 1.Add support for vIOMMU.
> > Add the new function to deal with iommu MR.
> > - during iommu_region_add register a specific IOMMU notifier,
> >    and store all notifiers in a list.
> > - during iommu_region_del, compare and delete the IOMMU notifier from t=
he list
> > - since the SVQ not support iommu yet, add the check for IOMMU
> >    in vhost_vdpa_dev_start, if the SVQ and IOMMU enable at the same tim=
e
> >    function will return fail.
> >
> > 2.Skip the check in vhost_vdpa_listener_skipped_section() while
> > MR is IOMMU, Move this check to  vhost_vdpa_iommu_map_notify()
>
>
> This need some tweak as well, it's better not repeat what is done in the
> code but why do you need this change. More could be found at:
>
> https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges
>
sure, will change this
>
> >
> > Verified in vp_vdpa and vdpa_sim_net driver
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c         | 173 ++++++++++++++++++++++++++++++--=
-
> >   include/hw/virtio/vhost-vdpa.h |  11 +++
> >   2 files changed, 173 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 542e003101..46f676ab71 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -26,6 +26,7 @@
> >   #include "cpu.h"
> >   #include "trace.h"
> >   #include "qapi/error.h"
> > +#include "hw/virtio/virtio-access.h"
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
> > +     * here. Will add the check-in vhost_vdpa_iommu_map_notify,
> > +     *There is the real size that maps to the kernel
>
>
> Please tweak the comment, it has issues of whitespace, capitalization,
> punctuation marks.
>
sure will change this
>
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
>
>
> Note related to this patch but should we exclude non ram region here as
> well?
>
Sure, will add this check

>
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
> > @@ -185,6 +193,118 @@ static void vhost_vdpa_listener_commit(MemoryList=
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
>
>
> Can you meet this condition? If yes, should we crop instead of fail here?
>
Based on my test, we didn't meet this condition. so just put an error
report here.

>
> > +    }
> > +
> > +    vhost_vdpa_iotlb_batch_begin_once(v);
>
>
> Where do we send the VHOST_IOTLB_BATCH_END message, or do we even need
> any batching here?
>
the VHOST_IOTLB_BATCH_END message was send by
vhost_vdpa_listener_commit, because we only use
one vhost_vdpa_memory_listener and no-iommu mode will also need to use
this listener, So we still need to add the batch begin here, based on
my testing after the notify function was called,  the listener_commit
function was also called .so it works well in this situation
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
> > +        ret =3D vhost_vdpa_dma_map(v, VHOST_VDPA_GUEST_PA_ASID, iova,
> > +                                 iotlb->addr_mask + 1, vaddr, read_onl=
y);
> > +        if (ret) {
> > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
> > +                         "0x%" HWADDR_PRIx ", %p) =3D %d (%m)",
> > +                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
> > +        }
> > +    } else {
> > +        ret =3D vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova=
,
> > +                                   iotlb->addr_mask + 1);
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
> > +                     section->size);
> > +    end =3D int128_sub(end, int128_one());
> > +    iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
> > +                                                   MEMTXATTRS_UNSPECIF=
IED);
> > +    iommu->iommu_mr =3D iommu_mr;
> > +    iommu_notifier_init(&iommu->n, vhost_vdpa_iommu_map_notify,
> > +                        IOMMU_NOTIFIER_IOTLB_EVENTS,
> > +                        section->offset_within_region,
> > +                        int128_get64(end),
> > +                        iommu_idx);
> > +    iommu->iommu_offset =3D section->offset_within_address_space -
> > +                          section->offset_within_region;
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
> > @@ -199,6 +319,10 @@ static void vhost_vdpa_listener_region_add(MemoryL=
istener *listener,
> >                                               v->iova_range.last)) {
> >           return;
> >       }
> > +    if (memory_region_is_iommu(section->mr)) {
> > +        vhost_vdpa_iommu_region_add(listener, section);
> > +        return;
> > +    }
> >
> >       if (unlikely((section->offset_within_address_space & ~TARGET_PAGE=
_MASK) !=3D
> >                    (section->offset_within_region & ~TARGET_PAGE_MASK))=
) {
> > @@ -278,6 +402,9 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >                                               v->iova_range.last)) {
> >           return;
> >       }
> > +    if (memory_region_is_iommu(section->mr)) {
> > +        vhost_vdpa_iommu_region_del(listener, section);
> > +    }
> >
> >       if (unlikely((section->offset_within_address_space & ~TARGET_PAGE=
_MASK) !=3D
> >                    (section->offset_within_region & ~TARGET_PAGE_MASK))=
) {
> > @@ -288,7 +415,8 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >       iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_space);
> >       llend =3D vhost_vdpa_section_end(section);
> >
> > -    trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend))=
;
> > +    trace_vhost_vdpa_listener_region_del(v, iova,
> > +        int128_get64(int128_sub(llend, int128_one())));
>
>
> Seems like an independent fix?
>
sure, will move this to another patch
>
> >
> >       if (int128_ge(int128_make64(iova), llend)) {
> >           return;
> > @@ -315,10 +443,28 @@ static void vhost_vdpa_listener_region_del(Memory=
Listener *listener,
> >           vhost_iova_tree_remove(v->iova_tree, *result);
> >       }
> >       vhost_vdpa_iotlb_batch_begin_once(v);
> > +    /*
> > +     * The unmap ioctl doesn't accept a full 64-bit. need to check it
> > +     */
> > +    if (int128_eq(llsize, int128_2_64())) {
> > +        llsize =3D int128_rshift(llsize, 1);
> > +        ret =3D vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova=
,
> > +                                   int128_get64(llsize));
> > +
> > +        if (ret) {
> > +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ",=
 "
> > +                         "0x%" HWADDR_PRIx ") =3D %d (%m)",
> > +                         v, iova, int128_get64(llsize), ret);
> > +        }
> > +        iova +=3D int128_get64(llsize);
> > +    }
> >       ret =3D vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
> >                                  int128_get64(llsize));
> > +
> >       if (ret) {
> > -        error_report("vhost_vdpa dma unmap error!");
> > +        error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
> > +                     "0x%" HWADDR_PRIx ") =3D %d (%m)",
> > +                     v, iova, int128_get64(llsize), ret);
> >       }
>
>
> Let's use a separate patch to fix this full 64-bit issue.
>
sure will do
>
> >
> >       memory_region_unref(section->mr);
> > @@ -578,7 +724,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev=
)
> >       v =3D dev->opaque;
> >       trace_vhost_vdpa_cleanup(dev, v);
> >       vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > -    memory_listener_unregister(&v->listener);
>
>
> Any reason for not unregistering listener here?
>
sure, will fix this
> Thanks
>
>
> >       vhost_vdpa_svq_cleanup(dev);
> >
> >       dev->opaque =3D NULL;
> > @@ -1130,7 +1275,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev=
 *dev, bool started)
> >       }
> >
> >       if (started) {
> > -        memory_listener_register(&v->listener, &address_space_memory);
> > +        if (vhost_dev_has_iommu(dev) && (v->shadow_vqs_enabled)) {
> > +            error_report("the SVQ can not wortk in with IOMMU enable, =
please "
> > +                         "disable IOMMU and try again");
> > +            return -1;
> > +        }
> > +        memory_listener_register(&v->listener, dev->vdev->dma_as);
> > +
> >           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >       } else {
> >           vhost_vdpa_reset_device(dev);
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 7997f09a8d..54cede86dc 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -49,6 +49,8 @@ typedef struct vhost_vdpa {
> >       void *shadow_vq_ops_opaque;
> >       struct vhost_dev *dev;
> >       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > +    IOMMUNotifier n;
> >   } VhostVDPA;
> >
> >   int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *i=
ova_range);
> > @@ -58,4 +60,13 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_=
t asid, hwaddr iova,
> >   int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr =
iova,
> >                            hwaddr size);
> >
> > +typedef struct vdpa_iommu {
> > +    struct vhost_vdpa *dev;
> > +    IOMMUMemoryRegion *iommu_mr;
> > +    hwaddr iommu_offset;
> > +    IOMMUNotifier n;
> > +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> > +} VDPAIOMMUState;
> > +
> > +
> >   #endif
>


