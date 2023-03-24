Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2AC6C804B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfcJ4-0003Nh-9i; Fri, 24 Mar 2023 03:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfcJ2-0003MH-5F
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 03:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfcIk-0005Gv-KH
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 03:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679644636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7u3UGaPnyI/oB3D+/GDuvooiVWBFOsVpzFnfx8wPPd8=;
 b=TNq/5kjwojEPJo9OP9yZfVcjZO7+OgdDSguMNV4YbTWWxoAVnF4zwo9QqLX3KvtmYV6Cva
 x8l9SaT12XYGaT51o451maIb7bKIdUPO6YmA5GXX47u4ITAv5XYSK9f5/aeiZIWWEjKvNB
 RMXR04BL2uDNLoDQ5UhYR7wavlopti4=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-xpBmzjYgMF2SIJhVQq_-FQ-1; Thu, 23 Mar 2023 23:45:28 -0400
X-MC-Unique: xpBmzjYgMF2SIJhVQq_-FQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-17e11dd9a3dso319445fac.10
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 20:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679629527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7u3UGaPnyI/oB3D+/GDuvooiVWBFOsVpzFnfx8wPPd8=;
 b=JVbedgK4tNd2F0W2AlPz5bkOZy+Xy9n5BxVUNiTvAVri4NaHO+ROYmnnELPBC+W07a
 445q82LltuI4PMPCmYq01P+FzLgfPB/SiWIO/wR7CW1Bjfv8WKIym35CucfpxKHqBOaG
 x/Kaw2FfhSsG3n8wtukY9dCDxUohLA9Yn1cYpOPXkEWC9DGjOKpJcPsm5nz02C3aYytm
 rtxCJnNBNikb7sjbnYH6rBhcE7xIYFNYWS6Z0yB5yzmTj1b0ZZaSceYW25KsJBQ/PiYW
 sFPpURVjO/kdaz/osGv4+vDL+pKTX3ONhy2TnHsHDlPiDyX4OOSx9uQmDugawRQBkSzc
 8jHw==
X-Gm-Message-State: AO0yUKUMDLT9zLrKhkNInQpee6HWRQVjpxg4yjCXDPwHpRe4AC7YBeXn
 zqHVeFYvXyHJ/qkaRxat0/VVSjVaoN0opUNHxhU2VqtpruZ7qkLOaSXo7V5XMOOVnrVnyKT0WyY
 i7xenWH47CAllF7M5P69rTFJvWMxzpnM=
X-Received: by 2002:a9d:480b:0:b0:69f:15f4:aa8 with SMTP id
 c11-20020a9d480b000000b0069f15f40aa8mr474017otf.0.1679629527328; 
 Thu, 23 Mar 2023 20:45:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set+0bDHs08Ou9D6YpUFLqEXcHJRvOnxSsRcnA0xaYzQd/OwC+GxlRimZQBKt/Qn1/T2u/XT9IMBWcztS/rx71No=
X-Received: by 2002:a9d:480b:0:b0:69f:15f4:aa8 with SMTP id
 c11-20020a9d480b000000b0069f15f40aa8mr473960otf.0.1679629522069; Thu, 23 Mar
 2023 20:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230321142327.749980-1-lulu@redhat.com>
 <20230321142327.749980-5-lulu@redhat.com>
 <CACGkMEts_2Ve+RXE495nGcu_yOsAVER0=8sYqdmQmkj113xLvw@mail.gmail.com>
 <CACLfguV460T6X-EBF6=mbxBsy+e+E+c+K3=medu48=yG+1be-A@mail.gmail.com>
 <CACGkMEs_cBVCxB33k2TNawA4aPJJO2vBR2UGZRcL9xEZ+ZEAzg@mail.gmail.com>
 <CACLfguX+X8uCJ_LcdK25hvoFE6mtFe7X=qDebqZ_JYiTpNURXA@mail.gmail.com>
In-Reply-To: <CACLfguX+X8uCJ_LcdK25hvoFE6mtFe7X=qDebqZ_JYiTpNURXA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Mar 2023 11:45:11 +0800
Message-ID: <CACGkMEtimJypffXaehJ1Qy61mz652Ny0hV+0M7CoAV6Nwk1q+w@mail.gmail.com>
Subject: Re: [PATCH v15 4/4] vhost-vdpa: Add support for vIOMMU.
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 24, 2023 at 11:00=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote:
>
> On Fri, Mar 24, 2023 at 10:49=E2=80=AFAM Jason Wang <jasowang@redhat.com>=
 wrote:
> >
> > On Thu, Mar 23, 2023 at 4:41=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrot=
e:
> > >
> > > On Thu, Mar 23, 2023 at 11:47=E2=80=AFAM Jason Wang <jasowang@redhat.=
com> wrote:
> > > >
> > > > On Tue, Mar 21, 2023 at 10:24=E2=80=AFPM Cindy Lu <lulu@redhat.com>=
 wrote:
> > > > >
> > > > > 1. The vIOMMU support will make vDPA can work in IOMMU mode. This
> > > > > will fix security issues while using the no-IOMMU mode.
> > > > > To support this feature we need to add new functions for IOMMU MR=
 adds and
> > > > > deletes.
> > > > >
> > > > > Also since the SVQ does not support vIOMMU yet, add the check for=
 IOMMU
> > > > > in vhost_vdpa_dev_start, if the SVQ and IOMMU enable at the same =
time
> > > > > the function will return fail.
> > > > >
> > > > > 2. Skip the iova_max check vhost_vdpa_listener_skipped_section().=
 While
> > > > > MR is IOMMU, move this check to vhost_vdpa_iommu_map_notify()
> > > > >
> > > > > Verified in vp_vdpa and vdpa_sim_net driver
> > > > >
> > > > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > > > ---
> > > > >  hw/virtio/trace-events         |   2 +-
> > > > >  hw/virtio/vhost-vdpa.c         | 159 +++++++++++++++++++++++++++=
+++---
> > > > >  include/hw/virtio/vhost-vdpa.h |  11 +++
> > > > >  3 files changed, 161 insertions(+), 11 deletions(-)
> > > > >
> > > > > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > > > > index 8f8d05cf9b..de4da2c65c 100644
> > > > > --- a/hw/virtio/trace-events
> > > > > +++ b/hw/virtio/trace-events
> > > > > @@ -33,7 +33,7 @@ vhost_user_create_notifier(int idx, void *n) "i=
dx:%d n:%p"
> > > > >  vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32=
_t asid, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_=
t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx6=
4" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> > > > >  vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint=
32_t asid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_=
type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %=
"PRIu8
> > > > >  vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_ty=
pe, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> > > > > -vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, u=
int8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> > > > > +vhost_vdpa_iotlb_batch_end_once(void *v, int fd, uint32_t msg_ty=
pe, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> > > > >  vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64=
_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"=
PRIx64" vaddr: %p read-only: %d"
> > > > >  vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64=
_t llend) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
> > > > >  vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status=
: 0x%"PRIx8
> > > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > > index 0c8c37e786..39720d12a6 100644
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
> > > > > @@ -60,13 +61,21 @@ static bool vhost_vdpa_listener_skipped_secti=
on(MemoryRegionSection *section,
> > > > >                       iova_min, section->offset_within_address_sp=
ace);
> > > > >          return true;
> > > > >      }
> > > > > +    /*
> > > > > +     * While using vIOMMU, sometimes the section will be larger =
than iova_max,
> > > > > +     * but the memory that actually maps is smaller, so move the=
 check to
> > > > > +     * function vhost_vdpa_iommu_map_notify(). That function wil=
l use the actual
> > > > > +     * size that maps to the kernel
> > > > > +     */
> > > > >
> > > > > -    llend =3D vhost_vdpa_section_end(section);
> > > > > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > > > > -        error_report("RAM section out of device range (max=3D0x%=
" PRIx64
> > > > > -                     ", end addr=3D0x%" PRIx64 ")",
> > > > > -                     iova_max, int128_get64(llend));
> > > > > -        return true;
> > > > > +    if (!memory_region_is_iommu(section->mr)) {
> > > > > +        llend =3D vhost_vdpa_section_end(section);
> > > > > +        if (int128_gt(llend, int128_make64(iova_max))) {
> > > > > +            error_report("RAM section out of device range (max=
=3D0x%" PRIx64
> > > > > +                         ", end addr=3D0x%" PRIx64 ")",
> > > > > +                         iova_max, int128_get64(llend));
> > > > > +            return true;
> > > > > +        }
> > > > >      }
> > > > >
> > > > >      return false;
> > > > > @@ -158,9 +167,8 @@ static void vhost_vdpa_iotlb_batch_begin_once=
(struct vhost_vdpa *v)
> > > > >      v->iotlb_batch_begin_sent =3D true;
> > > > >  }
> > > > >
> > > > > -static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > > > > +static void vhost_vdpa_iotlb_batch_end_once(struct vhost_vdpa *v=
)
> > > > >  {
> > > > > -    struct vhost_vdpa *v =3D container_of(listener, struct vhost=
_vdpa, listener);
> > > > >      struct vhost_dev *dev =3D v->dev;
> > > > >      struct vhost_msg_v2 msg =3D {};
> > > > >      int fd =3D v->device_fd;
> > > > > @@ -176,7 +184,7 @@ static void vhost_vdpa_listener_commit(Memory=
Listener *listener)
> > > > >      msg.type =3D v->msg_type;
> > > > >      msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> > > > >
> > > > > -    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.=
type);
> > > > > +    trace_vhost_vdpa_iotlb_batch_end_once(v, fd, msg.type, msg.i=
otlb.type);
> > > >
> > > > I suggest to keep the commit trace. The commit and batch are differ=
ent
> > > > things. If you want to trace the batch begin/end you should do it i=
n
> > > > vhost_vdpa_iotlb_batch_begin_once() etc.
> > > >
> > > sure will fix this
> > > > >      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> > > > >          error_report("failed to write, fd=3D%d, errno=3D%d (%s)"=
,
> > > > >                       fd, errno, strerror(errno));
> > > > > @@ -185,6 +193,124 @@ static void vhost_vdpa_listener_commit(Memo=
ryListener *listener)
> > > > >      v->iotlb_batch_begin_sent =3D false;
> > > > >  }
> > > > >
> > > > > +static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > > > > +{
> > > > > +    struct vhost_vdpa *v =3D container_of(listener, struct vhost=
_vdpa, listener);
> > > > > +    vhost_vdpa_iotlb_batch_end_once(v);
> > > > > +}
> > > > > +
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
> > > > > +    Int128 llend;
> > > > > +
> > > > > +    if (iotlb->target_as !=3D &address_space_memory) {
> > > > > +        error_report("Wrong target AS \"%s\", only system memory=
 is allowed",
> > > > > +                     iotlb->target_as->name ? iotlb->target_as->=
name : "none");
> > > > > +        return;
> > > > > +    }
> > > > > +    RCU_READ_LOCK_GUARD();
> > > > > +    /* check if RAM section out of device range */
> > > > > +    llend =3D int128_add(int128_makes64(iotlb->addr_mask), int12=
8_makes64(iova));
> > > > > +    if (int128_gt(llend, int128_make64(v->iova_range.last))) {
> > > > > +        error_report("RAM section out of device range (max=3D0x%=
" PRIx64
> > > > > +                     ", end addr=3D0x%" PRIx64 ")",
> > > > > +                     v->iova_range.last, int128_get64(llend));
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    if ((iotlb->perm & IOMMU_RW) !=3D IOMMU_NONE) {
> > > > > +        bool read_only;
> > > > > +
> > > > > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_onl=
y, NULL)) {
> > > > > +            return;
> > > > > +        }
> > > > > +        vhost_vdpa_iotlb_batch_begin_once(v);
> > > >
> > > > I think at most 2 ioctls for this, is this still worth to batch the=
m?
> > > >
> > > > Other looks good.
> > > >
> > > > Thanks
> > > >
> > >  the kernel vdpa doesn't support  no-batch mode, if we remove the bat=
ch here
> > > the system will fail to map
> > > qemu-system-x86_64: failed to write, fd=3D12, errno=3D14 (Bad address=
)
> > > qemu-system-x86_64: vhost_vdpa_dma_unmap(0x7f811a950190, 0x0,
> > > 0x80000000) =3D -5 (Bad address)
> > >
> > > I'm not sure maybe this is a bug in the kernel?
> >
> > I'm not sure I understand this, but do you mean you meet this if you
> > remove the batch_begin_once() and vhost_vdpa_iotlb_batch_end_once()?
> >
> > Thanks
> >
> yes=EF=BC=8C the system will fail to map if we remove these functions, Do=
es
> this work as expect?

I think not, please trace to see if the map here is in the middle of a
batch. If not it should be a bug.

Thanks

> Maybe we need to fix this in the kernel?
> Thanks
> Cindy
> > > Thanks
> > > Cindy
> > >
> > > > > +        ret =3D vhost_vdpa_dma_map(v, VHOST_VDPA_GUEST_PA_ASID, =
iova,
> > > > > +                                 iotlb->addr_mask + 1, vaddr, re=
ad_only);
> > > > > +        if (ret) {
> > > > > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRI=
x ", "
> > > > > +                         "0x%" HWADDR_PRIx ", %p) =3D %d (%m)",
> > > > > +                         v, iova, iotlb->addr_mask + 1, vaddr, r=
et);
> > > > > +        }
> > > > > +    } else {
> > > > > +        vhost_vdpa_iotlb_batch_begin_once(v);
> > > > > +        ret =3D vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID=
, iova,
> > > > > +                                   iotlb->addr_mask + 1);
> > > > > +        if (ret) {
> > > > > +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_P=
RIx ", "
> > > > > +                         "0x%" HWADDR_PRIx ") =3D %d (%m)",
> > > > > +                         v, iova, iotlb->addr_mask + 1, ret);
> > > > > +        }
> > > > > +    }
> > > > > +    vhost_vdpa_iotlb_batch_end_once(v);
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
> > > > > +    end =3D int128_add(int128_make64(section->offset_within_regi=
on),
> > > > > +                     section->size);
> > > > > +    end =3D int128_sub(end, int128_one());
> > > > > +    iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
> > > > > +                                                   MEMTXATTRS_UN=
SPECIFIED);
> > > > > +    iommu->iommu_mr =3D iommu_mr;
> > > > > +    iommu_notifier_init(&iommu->n, vhost_vdpa_iommu_map_notify,
> > > > > +                        IOMMU_NOTIFIER_IOTLB_EVENTS,
> > > > > +                        section->offset_within_region,
> > > > > +                        int128_get64(end),
> > > > > +                        iommu_idx);
> > > > > +    iommu->iommu_offset =3D section->offset_within_address_space=
 -
> > > > > +                          section->offset_within_region;
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
> > > > > @@ -199,6 +325,10 @@ static void vhost_vdpa_listener_region_add(M=
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
> > > > > @@ -278,6 +408,9 @@ static void vhost_vdpa_listener_region_del(Me=
moryListener *listener,
> > > > >                                              v->iova_range.last))=
 {
> > > > >          return;
> > > > >      }
> > > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > > +        vhost_vdpa_iommu_region_del(listener, section);
> > > > > +    }
> > > > >
> > > > >      if (unlikely((section->offset_within_address_space & ~TARGET=
_PAGE_MASK) !=3D
> > > > >                   (section->offset_within_region & ~TARGET_PAGE_M=
ASK))) {
> > > > > @@ -1182,7 +1315,13 @@ static int vhost_vdpa_dev_start(struct vho=
st_dev *dev, bool started)
> > > > >      }
> > > > >
> > > > >      if (started) {
> > > > > -        memory_listener_register(&v->listener, &address_space_me=
mory);
> > > > > +        if (vhost_dev_has_iommu(dev) && (v->shadow_vqs_enabled))=
 {
> > > > > +            error_report("SVQ can not work while IOMMU enable, p=
lease disable"
> > > > > +                         "IOMMU and try again");
> > > > > +            return -1;
> > > > > +        }
> > > > > +        memory_listener_register(&v->listener, dev->vdev->dma_as=
);
> > > > > +
> > > > >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER=
_OK);
> > > > >      }
> > > > >
> > > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/v=
host-vdpa.h
> > > > > index c278a2a8de..e64bfc7f98 100644
> > > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > > @@ -52,6 +52,8 @@ typedef struct vhost_vdpa {
> > > > >      struct vhost_dev *dev;
> > > > >      Error *migration_blocker;
> > > > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > > > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > > > > +    IOMMUNotifier n;
> > > > >  } VhostVDPA;
> > > > >
> > > > >  int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_ran=
ge *iova_range);
> > > > > @@ -61,4 +63,13 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, u=
int32_t asid, hwaddr iova,
> > > > >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hw=
addr iova,
> > > > >                           hwaddr size);
> > > > >
> > > > > +typedef struct vdpa_iommu {
> > > > > +    struct vhost_vdpa *dev;
> > > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > > +    hwaddr iommu_offset;
> > > > > +    IOMMUNotifier n;
> > > > > +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> > > > > +} VDPAIOMMUState;
> > > > > +
> > > > > +
> > > > >  #endif
> > > > > --
> > > > > 2.34.3
> > > > >
> > > >
> > >
> >
>


