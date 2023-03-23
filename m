Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3DE6C621C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 09:41:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGVU-0000Nf-Gy; Thu, 23 Mar 2023 04:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pfGVS-0000NT-Bs
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:41:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pfGVQ-000143-5P
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679560866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGTfJ419JzUq0rtr2i/UzmY2F95xhHz7+IbbPHYzgr4=;
 b=K7q7yUEqi1NWv41kSpAOIfd+VpiHbHMUIlTkvZHmED+3lnOF0oVHJmKo9DB9VbwP7is3Di
 FPWnSjjZ25e/GtETwJq+c0W3m7Ma2SS5+sDDC6qXa2ubzQc3N0yXXlKnv4nfMrjVkY9zUj
 tfbR71j5WtxgrVDzS7Y9F+ufUX5+FSk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-lq1ew1AYMJWLzKyQGl4MEw-1; Thu, 23 Mar 2023 04:41:04 -0400
X-MC-Unique: lq1ew1AYMJWLzKyQGl4MEw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p10-20020a05600c358a00b003edf7d484d4so600073wmq.0
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 01:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679560863;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGTfJ419JzUq0rtr2i/UzmY2F95xhHz7+IbbPHYzgr4=;
 b=ziAgTK77D13fE7HA9ALYMLbHJshypwYxCH6n5BfOlfFPF0spKvdmY/uut64BCRQqK0
 9yG6ZWpy386LvJTRArvMUdcTUXTUZ0cC3fsKQoxENN9gF4RPbhK6VF0shwqRE80lr8Vc
 nlQQ8dQ6jjS2j4s7YtRhfZsyuOJAmrmXZGLhqAybpJt8Mby5BUWTjpiP/SpHWsxf7J2v
 Prhlq2RAXbB/Bdi2J8s/8dYWUGshfUWMDfbrz54Ifb+6gq5pYJI8nzgC8NRirUZueEYY
 jjYQI7h5crMoyVfMiCvs+kwfhK/LWJq4Ffg1a9df6PVPJx5pBhIxC5kbGFpf50pFcbN9
 li4Q==
X-Gm-Message-State: AAQBX9c1X85QuMXdsMnrO/Y3S89nlYSDPRkAap5bDXajNcDGRmEvuh6r
 ZYRK+lVyQEshW+SRrWXV54xChe1YP1i63BppgX6cbEhnSLUgjH5CDhazruvssrq8SootiugyTtk
 jc88zyRr6QPYuZPz61gQ30iqYxQug8kFE+6VWDObGL3Rm
X-Received: by 2002:a5d:60d1:0:b0:2ca:ec13:e7a0 with SMTP id
 x17-20020a5d60d1000000b002caec13e7a0mr550313wrt.8.1679560862954; 
 Thu, 23 Mar 2023 01:41:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZhFKZXgsaLjRRIritElISLeULO1uIF+NBh8BsAe4/CMzVzifZ269wjoc9TEGyela2KiDGfXzboSkb+51UxTgE=
X-Received: by 2002:a5d:60d1:0:b0:2ca:ec13:e7a0 with SMTP id
 x17-20020a5d60d1000000b002caec13e7a0mr550308wrt.8.1679560862620; Thu, 23 Mar
 2023 01:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230321142327.749980-1-lulu@redhat.com>
 <20230321142327.749980-5-lulu@redhat.com>
 <CACGkMEts_2Ve+RXE495nGcu_yOsAVER0=8sYqdmQmkj113xLvw@mail.gmail.com>
In-Reply-To: <CACGkMEts_2Ve+RXE495nGcu_yOsAVER0=8sYqdmQmkj113xLvw@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 23 Mar 2023 16:40:19 +0800
Message-ID: <CACLfguV460T6X-EBF6=mbxBsy+e+E+c+K3=medu48=yG+1be-A@mail.gmail.com>
Subject: Re: [PATCH v15 4/4] vhost-vdpa: Add support for vIOMMU.
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

On Thu, Mar 23, 2023 at 11:47=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
>
> On Tue, Mar 21, 2023 at 10:24=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote=
:
> >
> > 1. The vIOMMU support will make vDPA can work in IOMMU mode. This
> > will fix security issues while using the no-IOMMU mode.
> > To support this feature we need to add new functions for IOMMU MR adds =
and
> > deletes.
> >
> > Also since the SVQ does not support vIOMMU yet, add the check for IOMMU
> > in vhost_vdpa_dev_start, if the SVQ and IOMMU enable at the same time
> > the function will return fail.
> >
> > 2. Skip the iova_max check vhost_vdpa_listener_skipped_section(). While
> > MR is IOMMU, move this check to vhost_vdpa_iommu_map_notify()
> >
> > Verified in vp_vdpa and vdpa_sim_net driver
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  hw/virtio/trace-events         |   2 +-
> >  hw/virtio/vhost-vdpa.c         | 159 ++++++++++++++++++++++++++++++---
> >  include/hw/virtio/vhost-vdpa.h |  11 +++
> >  3 files changed, 161 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 8f8d05cf9b..de4da2c65c 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -33,7 +33,7 @@ vhost_user_create_notifier(int idx, void *n) "idx:%d =
n:%p"
> >  vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t asi=
d, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type=
) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" siz=
e: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> >  vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t a=
sid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: =
%"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> >  vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, ui=
nt8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> > -vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t=
 type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> > +vhost_vdpa_iotlb_batch_end_once(void *v, int fd, uint32_t msg_type, ui=
nt8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> >  vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t lle=
nd, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64=
" vaddr: %p read-only: %d"
> >  vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t lle=
nd) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
> >  vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"=
PRIx8
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 0c8c37e786..39720d12a6 100644
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
> > @@ -60,13 +61,21 @@ static bool vhost_vdpa_listener_skipped_section(Mem=
oryRegionSection *section,
> >                       iova_min, section->offset_within_address_space);
> >          return true;
> >      }
> > +    /*
> > +     * While using vIOMMU, sometimes the section will be larger than i=
ova_max,
> > +     * but the memory that actually maps is smaller, so move the check=
 to
> > +     * function vhost_vdpa_iommu_map_notify(). That function will use =
the actual
> > +     * size that maps to the kernel
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
> >      }
> >
> >      return false;
> > @@ -158,9 +167,8 @@ static void vhost_vdpa_iotlb_batch_begin_once(struc=
t vhost_vdpa *v)
> >      v->iotlb_batch_begin_sent =3D true;
> >  }
> >
> > -static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > +static void vhost_vdpa_iotlb_batch_end_once(struct vhost_vdpa *v)
> >  {
> > -    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> >      struct vhost_dev *dev =3D v->dev;
> >      struct vhost_msg_v2 msg =3D {};
> >      int fd =3D v->device_fd;
> > @@ -176,7 +184,7 @@ static void vhost_vdpa_listener_commit(MemoryListen=
er *listener)
> >      msg.type =3D v->msg_type;
> >      msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> >
> > -    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
> > +    trace_vhost_vdpa_iotlb_batch_end_once(v, fd, msg.type, msg.iotlb.t=
ype);
>
> I suggest to keep the commit trace. The commit and batch are different
> things. If you want to trace the batch begin/end you should do it in
> vhost_vdpa_iotlb_batch_begin_once() etc.
>
sure will fix this
> >      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> >                       fd, errno, strerror(errno));
> > @@ -185,6 +193,124 @@ static void vhost_vdpa_listener_commit(MemoryList=
ener *listener)
> >      v->iotlb_batch_begin_sent =3D false;
> >  }
> >
> > +static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > +{
> > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> > +    vhost_vdpa_iotlb_batch_end_once(v);
> > +}
> > +
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
> > +    if ((iotlb->perm & IOMMU_RW) !=3D IOMMU_NONE) {
> > +        bool read_only;
> > +
> > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NUL=
L)) {
> > +            return;
> > +        }
> > +        vhost_vdpa_iotlb_batch_begin_once(v);
>
> I think at most 2 ioctls for this, is this still worth to batch them?
>
> Other looks good.
>
> Thanks
>
 the kernel vdpa doesn't support  no-batch mode, if we remove the batch her=
e
the system will fail to map
qemu-system-x86_64: failed to write, fd=3D12, errno=3D14 (Bad address)
qemu-system-x86_64: vhost_vdpa_dma_unmap(0x7f811a950190, 0x0,
0x80000000) =3D -5 (Bad address)

I'm not sure maybe this is a bug in the kernel?
Thanks
Cindy

> > +        ret =3D vhost_vdpa_dma_map(v, VHOST_VDPA_GUEST_PA_ASID, iova,
> > +                                 iotlb->addr_mask + 1, vaddr, read_onl=
y);
> > +        if (ret) {
> > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
> > +                         "0x%" HWADDR_PRIx ", %p) =3D %d (%m)",
> > +                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
> > +        }
> > +    } else {
> > +        vhost_vdpa_iotlb_batch_begin_once(v);
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
> > +    vhost_vdpa_iotlb_batch_end_once(v);
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
> >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> >                                             MemoryRegionSection *sectio=
n)
> >  {
> > @@ -199,6 +325,10 @@ static void vhost_vdpa_listener_region_add(MemoryL=
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
> > @@ -278,6 +408,9 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >                                              v->iova_range.last)) {
> >          return;
> >      }
> > +    if (memory_region_is_iommu(section->mr)) {
> > +        vhost_vdpa_iommu_region_del(listener, section);
> > +    }
> >
> >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_=
MASK) !=3D
> >                   (section->offset_within_region & ~TARGET_PAGE_MASK)))=
 {
> > @@ -1182,7 +1315,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev=
 *dev, bool started)
> >      }
> >
> >      if (started) {
> > -        memory_listener_register(&v->listener, &address_space_memory);
> > +        if (vhost_dev_has_iommu(dev) && (v->shadow_vqs_enabled)) {
> > +            error_report("SVQ can not work while IOMMU enable, please =
disable"
> > +                         "IOMMU and try again");
> > +            return -1;
> > +        }
> > +        memory_listener_register(&v->listener, dev->vdev->dma_as);
> > +
> >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >      }
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index c278a2a8de..e64bfc7f98 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -52,6 +52,8 @@ typedef struct vhost_vdpa {
> >      struct vhost_dev *dev;
> >      Error *migration_blocker;
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > +    IOMMUNotifier n;
> >  } VhostVDPA;
> >
> >  int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *io=
va_range);
> > @@ -61,4 +63,13 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_=
t asid, hwaddr iova,
> >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr i=
ova,
> >                           hwaddr size);
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
> >  #endif
> > --
> > 2.34.3
> >
>


