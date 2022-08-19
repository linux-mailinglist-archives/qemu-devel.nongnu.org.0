Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F52599443
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 06:52:35 +0200 (CEST)
Received: from localhost ([::1]:45798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOtzm-00030L-1m
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 00:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOtxS-0000ei-C1
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 00:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOtxO-0003KP-9v
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 00:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660884604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5cHRRlUBLivsGMttIpoIJRnCPKSsHSOJ620liM3xeU=;
 b=iJXEVOHMkZEIli9NZ01IaMbpm87c4U69mYN1C7y3wbkXqSlgJQzhNKOiRd3uooH0dRlfpE
 8Y0yJQpxJMIENtQ/AxyrINZZP/7pEPRDor6CxmDxaPD0h6eHn6R0coNfFeWc4UBtSh41dF
 QXZ2wkn6k+Lq70IO/b3oeBvnY/OZDOI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-cdcGHe7-Pr21qZXwpllLQA-1; Fri, 19 Aug 2022 00:50:01 -0400
X-MC-Unique: cdcGHe7-Pr21qZXwpllLQA-1
Received: by mail-lf1-f69.google.com with SMTP id
 v16-20020a056512049000b0048d0d86c689so1123803lfq.15
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 21:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=q5cHRRlUBLivsGMttIpoIJRnCPKSsHSOJ620liM3xeU=;
 b=IP3iEv4dNTLuMKEY0ZXURBLAlzSm11IeLWOpCLHr+EQlDLaCgNGOeuTPumRj+oTUff
 senxTAknYunk85+DNyrxlzFi2phbZ2MObabvrsyo8h9rFUpkHQ7RFQmHA1zlVcAkl/5R
 iRn4cbghYyV/nEXPt2b5i5LYHwFo9DMg4WoFHKnh1XyRKrPSXApbGxoUX+7RchFE454O
 tOs8nTw9qNG48IlwQ0XitS3UrMj/DsfAcKkS16TCAwJ1ZhIvj2oAVMaBKgvVBQaV90ML
 l4FAIVd0CdbfjwGi08gYHtplEdyTuNT46faf7ClM58k1AQag4HIX8cqrjqoog83IgtwM
 oPWw==
X-Gm-Message-State: ACgBeo3XXjcbWepnIsDCNCS6VL5mqtFpyH70En5URpTZXOFHvzBf+JBo
 jM7MpP3dPOMXsdVLN8g425LeTSoZL9uwqPWkaNQRBCICuFcftvARujm40OMlO3nzUCse0joSv0P
 XgeguROVydl32ksZtZdMCkm8EabehxE4=
X-Received: by 2002:a2e:b5cc:0:b0:261:816f:8ed7 with SMTP id
 g12-20020a2eb5cc000000b00261816f8ed7mr1722501ljn.323.1660884600040; 
 Thu, 18 Aug 2022 21:50:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5oT9Bb5KvCt5330p1pgyVLRvzpqT5o5wATWmRxAUfu9XL+JbyunXabvIYRx8wP23yvB194t+unEB6+C0j44QY=
X-Received: by 2002:a2e:b5cc:0:b0:261:816f:8ed7 with SMTP id
 g12-20020a2eb5cc000000b00261816f8ed7mr1722483ljn.323.1660884599727; Thu, 18
 Aug 2022 21:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220805163909.872646-1-eperezma@redhat.com>
 <20220805163909.872646-5-eperezma@redhat.com>
 <CACGkMEsxjBzsc1eonoR07027DsG3huGZUUodJZnK84PRyNQbAg@mail.gmail.com>
 <CAJaqyWddD=SENCUniHanPnGUjid3kFJ_8b2okR+2jU1amecjng@mail.gmail.com>
In-Reply-To: <CAJaqyWddD=SENCUniHanPnGUjid3kFJ_8b2okR+2jU1amecjng@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 19 Aug 2022 12:49:48 +0800
Message-ID: <CACGkMEvx+9SfLUZhrqrJ-GO+kHF68dm4vPXgo+oV_+14LQrXTw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] vdpa: Add asid parameter to
 vhost_vdpa_dma_map/unmap
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 kvm <kvm@vger.kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 10, 2022 at 1:04 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Aug 9, 2022 at 9:21 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Sat, Aug 6, 2022 at 12:39 AM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> > >
> > > So the caller can choose which ASID is destined.
> > >
> > > No need to update the batch functions as they will always be called f=
rom
> > > memory listener updates at the moment. Memory listener updates will
> > > always update ASID 0, as it's the passthrough ASID.
> > >
> > > All vhost devices's ASID are 0 at this moment.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > > v4: Add comment specifying behavior if device does not support _F_ASI=
D
> > >
> > > v3: Deleted unneeded space
> > > ---
> > >  include/hw/virtio/vhost-vdpa.h |  8 +++++---
> > >  hw/virtio/vhost-vdpa.c         | 25 +++++++++++++++----------
> > >  net/vhost-vdpa.c               |  6 +++---
> > >  hw/virtio/trace-events         |  4 ++--
> > >  4 files changed, 25 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> > > index 1111d85643..6560bb9d78 100644
> > > --- a/include/hw/virtio/vhost-vdpa.h
> > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > @@ -29,6 +29,7 @@ typedef struct vhost_vdpa {
> > >      int index;
> > >      uint32_t msg_type;
> > >      bool iotlb_batch_begin_sent;
> > > +    uint32_t address_space_id;
> > >      MemoryListener listener;
> > >      struct vhost_vdpa_iova_range iova_range;
> > >      uint64_t acked_features;
> > > @@ -42,8 +43,9 @@ typedef struct vhost_vdpa {
> > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > >  } VhostVDPA;
> > >
> > > -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr siz=
e,
> > > -                       void *vaddr, bool readonly);
> > > -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr s=
ize);
> > > +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr i=
ova,
> > > +                       hwaddr size, void *vaddr, bool readonly);
> > > +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr=
 iova,
> > > +                         hwaddr size);
> > >
> > >  #endif
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 34922ec20d..3eb67b27b7 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -72,22 +72,24 @@ static bool vhost_vdpa_listener_skipped_section(M=
emoryRegionSection *section,
> > >      return false;
> > >  }
> > >
> > > -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr siz=
e,
> > > -                       void *vaddr, bool readonly)
> > > +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr i=
ova,
> > > +                       hwaddr size, void *vaddr, bool readonly)
> > >  {
> > >      struct vhost_msg_v2 msg =3D {};
> > >      int fd =3D v->device_fd;
> > >      int ret =3D 0;
> > >
> > >      msg.type =3D v->msg_type;
> > > +    msg.asid =3D asid; /* 0 if vdpa device does not support asid */
> >
> > So this comment is still kind of confusing.
> >
> > Does it mean the caller can guarantee that asid is 0 when ASID is not
> > supported?
>
> That's right.
>
> > Even if this is true, does it silently depend on the
> > behaviour that the asid field is extended from the reserved field of
> > the ABI?
> >
>
> I don't get this part.
>
> Regarding the ABI, the reserved bytes will be there either the device
> support asid or not, since the actual iotlb message is after the
> reserved field. And they were already zeroed by msg =3D {} on top of the
> function. So if the caller always sets asid =3D 0, there is no change on
> this part.
>
> > (I still wonder if it's better to avoid using msg.asid if the kernel
> > doesn't support that).
> >
>
> We can add a conditional on v->dev->backend_features & _F_ASID.
>
> But that is not the only case where ASID will not be used: If the vq
> group does not match with the supported configuration (like if CVQ is
> not in the independent group). This case is already handled by setting
> all vhost_vdpa of the virtio device to asid =3D 0, so adding that extra
> check seems redundant to me.

I see.

>
> I'm not against adding it though: It can prevent bugs. Since it would
> be a bug of qemu, maybe it's better to add an assertion?

I'd suggest adding a comment here.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > >      msg.iotlb.iova =3D iova;
> > >      msg.iotlb.size =3D size;
> > >      msg.iotlb.uaddr =3D (uint64_t)(uintptr_t)vaddr;
> > >      msg.iotlb.perm =3D readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
> > >      msg.iotlb.type =3D VHOST_IOTLB_UPDATE;
> > >
> > > -   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iot=
lb.size,
> > > -                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iot=
lb.type);
> > > +    trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.asid, msg.iotlb.io=
va,
> > > +                             msg.iotlb.size, msg.iotlb.uaddr, msg.io=
tlb.perm,
> > > +                             msg.iotlb.type);
> > >
> > >      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> > >          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> > > @@ -98,18 +100,20 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwa=
ddr iova, hwaddr size,
> > >      return ret;
> > >  }
> > >
> > > -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr s=
ize)
> > > +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr=
 iova,
> > > +                         hwaddr size)
> > >  {
> > >      struct vhost_msg_v2 msg =3D {};
> > >      int fd =3D v->device_fd;
> > >      int ret =3D 0;
> > >
> > >      msg.type =3D v->msg_type;
> > > +    msg.asid =3D asid; /* 0 if vdpa device does not support asid */
> > >      msg.iotlb.iova =3D iova;
> > >      msg.iotlb.size =3D size;
> > >      msg.iotlb.type =3D VHOST_IOTLB_INVALIDATE;
> > >
> > > -    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
> > > +    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.=
iova,
> > >                                 msg.iotlb.size, msg.iotlb.type);
> > >
> > >      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> > > @@ -229,7 +233,7 @@ static void vhost_vdpa_listener_region_add(Memory=
Listener *listener,
> > >      }
> > >
> > >      vhost_vdpa_iotlb_batch_begin_once(v);
> > > -    ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> > > +    ret =3D vhost_vdpa_dma_map(v, 0, iova, int128_get64(llsize),
> > >                               vaddr, section->readonly);
> > >      if (ret) {
> > >          error_report("vhost vdpa map fail!");
> > > @@ -303,7 +307,7 @@ static void vhost_vdpa_listener_region_del(Memory=
Listener *listener,
> > >          vhost_iova_tree_remove(v->iova_tree, result);
> > >      }
> > >      vhost_vdpa_iotlb_batch_begin_once(v);
> > > -    ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> > > +    ret =3D vhost_vdpa_dma_unmap(v, 0, iova, int128_get64(llsize));
> > >      if (ret) {
> > >          error_report("vhost_vdpa dma unmap error!");
> > >      }
> > > @@ -894,7 +898,7 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhos=
t_vdpa *v,
> > >      }
> > >
> > >      size =3D ROUND_UP(result->size, qemu_real_host_page_size());
> > > -    r =3D vhost_vdpa_dma_unmap(v, result->iova, size);
> > > +    r =3D vhost_vdpa_dma_unmap(v, v->address_space_id, result->iova,=
 size);
> > >      return r =3D=3D 0;
> > >  }
> > >
> > > @@ -936,7 +940,8 @@ static bool vhost_vdpa_svq_map_ring(struct vhost_=
vdpa *v, DMAMap *needle,
> > >          return false;
> > >      }
> > >
> > > -    r =3D vhost_vdpa_dma_map(v, needle->iova, needle->size + 1,
> > > +    r =3D vhost_vdpa_dma_map(v, v->address_space_id, needle->iova,
> > > +                           needle->size + 1,
> > >                             (void *)(uintptr_t)needle->translated_add=
r,
> > >                             needle->perm =3D=3D IOMMU_RO);
> > >      if (unlikely(r !=3D 0)) {
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 7c0d600aea..9b932442f0 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -239,7 +239,7 @@ static void vhost_vdpa_cvq_unmap_buf(struct vhost=
_vdpa *v, void *addr)
> > >          return;
> > >      }
> > >
> > > -    r =3D vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> > > +    r =3D vhost_vdpa_dma_unmap(v, v->address_space_id, map->iova, ma=
p->size + 1);
> > >      if (unlikely(r !=3D 0)) {
> > >          error_report("Device cannot unmap: %s(%d)", g_strerror(r), r=
);
> > >      }
> > > @@ -279,8 +279,8 @@ static int vhost_vdpa_cvq_map_buf(struct vhost_vd=
pa *v, void *buf, size_t size,
> > >          return r;
> > >      }
> > >
> > > -    r =3D vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_pag=
e_len(), buf,
> > > -                           !write);
> > > +    r =3D vhost_vdpa_dma_map(v, v->address_space_id, map.iova,
> > > +                           vhost_vdpa_net_cvq_cmd_page_len(), buf, !=
write);
> > >      if (unlikely(r < 0)) {
> > >          goto dma_map_err;
> > >      }
> > > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > > index 20af2e7ebd..36e5ae75f6 100644
> > > --- a/hw/virtio/trace-events
> > > +++ b/hw/virtio/trace-events
> > > @@ -26,8 +26,8 @@ vhost_user_write(uint32_t req, uint32_t flags) "req=
:%d flags:0x%"PRIx32""
> > >  vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
> > >
> > >  # vhost-vdpa.c
> > > -vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t i=
ova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd=
: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRI=
x64" perm: 0x%"PRIx8" type: %"PRIu8
> > > -vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t=
 iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iov=
a: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> > > +vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t a=
sid, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t ty=
pe) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" s=
ize: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> > > +vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t=
 asid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type=
: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRI=
u8
> > >  vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, =
uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> > >  vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8=
_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> > >  vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t l=
lend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx=
64" vaddr: %p read-only: %d"
> > > --
> > > 2.31.1
> > >
> >
>


