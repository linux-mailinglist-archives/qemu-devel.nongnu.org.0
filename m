Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F978625AE2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otTgZ-0005Ye-Oo; Fri, 11 Nov 2022 08:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1otTgW-0005Y7-Gm
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1otTgT-0007vc-O5
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668171780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U16c22Z5JaPUXqBFLGbZwNEx4tRnTtMaK8nQtOh029w=;
 b=abpy+pZd6xedFVdWMttPmFlWZYkL73d/Wr7JxzV+dN1hgvoccB1GnHL59BwmbVpBlKuG2t
 SdLBXIGAbQ24Q+mqC6KHynhjQ2G+syMJ2tuYSZLRH+9b3STJ1lop+eOik8KupdIMeMlfkD
 qVzaGXaJ0kp/+16o5a6MoaVgRdsHPU0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-5wLw5cR0MxCLzIzGbBis5Q-1; Fri, 11 Nov 2022 08:02:49 -0500
X-MC-Unique: 5wLw5cR0MxCLzIzGbBis5Q-1
Received: by mail-pl1-f197.google.com with SMTP id
 q6-20020a170902dac600b001873ef77938so3533866plx.18
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 05:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U16c22Z5JaPUXqBFLGbZwNEx4tRnTtMaK8nQtOh029w=;
 b=ARrnPMhEh0OiZQciOYQxyNbS7Y1+/AfO3dCqg3WpUfMTF6G65Zq4Uuz4ziyekQpVCl
 rcsVepVr1RkJ3vWNAXeqTl3184TJrNpR0buXQguKGKvmYgmFiJZHHdHCiwbYXdJL8kEn
 XzdMzGcdGCrvDtoKSCqr3UXSuzSsL9kF6YdLk2rRurQlrfqmcoey7+/A0MVHNN0mGFwY
 OpXSuFeOU50wEE9NhqNHSxQ4NqNO842of7IhHjQbS3iL8e9SAr3EN4P0T48slW83M7Ab
 Rlfr9WiezXKbt/45Ihdt8RTLJXF4nB1iqaGLPnaA5Xq7GHpp/KI2iPFZCLOKj851FBqo
 8VMw==
X-Gm-Message-State: ANoB5pm0KzOZJxz/2H0CrWdeTEllUyrqI2lZPzMCZZgm8mvSF/ZCZ2RK
 haWBgdcrO+KBFpQ1Ox76PKKIDj6uEjreMhrrAWR2NFK7NxmcgpH4FvGW0qPNsb+a3crP8DJMTrk
 czeHJI/z+WddhWG6fe4N6qD52SJUdesQ=
X-Received: by 2002:a05:6a00:14ce:b0:561:9a81:ef11 with SMTP id
 w14-20020a056a0014ce00b005619a81ef11mr2455680pfu.86.1668171766070; 
 Fri, 11 Nov 2022 05:02:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6/zQducFZY7f+6Hn5hZiMujEEvOr7vc6h7crQnzFMyms2hL6TPnEF7gQat5jX3w/L7qxeqH7tFAb84ap37oqc=
X-Received: by 2002:a05:6a00:14ce:b0:561:9a81:ef11 with SMTP id
 w14-20020a056a0014ce00b005619a81ef11mr2455628pfu.86.1668171765581; Fri, 11
 Nov 2022 05:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-8-eperezma@redhat.com>
 <CACGkMEvzw283JE9Uo6kqKuAJ4CWpWyHciHe8DazLEP5Xzw91wg@mail.gmail.com>
 <CAJaqyWcbYLzdEcPMMjDNWsGV4bkb8NTJnNHj5Wp+v4WbM+LHeQ@mail.gmail.com>
 <fa24552a-4d82-4da9-bf15-10d75893afa3@redhat.com>
In-Reply-To: <fa24552a-4d82-4da9-bf15-10d75893afa3@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 11 Nov 2022 14:02:09 +0100
Message-ID: <CAJaqyWc3zjYxFHe6ucZNOKq0e_b_cNajh5CHzHNBnnRiwbNEHg@mail.gmail.com>
Subject: Re: [PATCH v6 07/10] vdpa: Add asid parameter to
 vhost_vdpa_dma_map/unmap
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Nov 11, 2022 at 8:41 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/11/10 21:22, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Thu, Nov 10, 2022 at 6:51 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> >>> So the caller can choose which ASID is destined.
> >>>
> >>> No need to update the batch functions as they will always be called f=
rom
> >>> memory listener updates at the moment. Memory listener updates will
> >>> always update ASID 0, as it's the passthrough ASID.
> >>>
> >>> All vhost devices's ASID are 0 at this moment.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>> v5:
> >>> * Solve conflict, now vhost_vdpa_svq_unmap_ring returns void
> >>> * Change comment on zero initialization.
> >>>
> >>> v4: Add comment specifying behavior if device does not support _F_ASI=
D
> >>>
> >>> v3: Deleted unneeded space
> >>> ---
> >>>   include/hw/virtio/vhost-vdpa.h |  8 +++++---
> >>>   hw/virtio/vhost-vdpa.c         | 29 +++++++++++++++++++----------
> >>>   net/vhost-vdpa.c               |  6 +++---
> >>>   hw/virtio/trace-events         |  4 ++--
> >>>   4 files changed, 29 insertions(+), 18 deletions(-)
> >>>
> >>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> >>> index 1111d85643..6560bb9d78 100644
> >>> --- a/include/hw/virtio/vhost-vdpa.h
> >>> +++ b/include/hw/virtio/vhost-vdpa.h
> >>> @@ -29,6 +29,7 @@ typedef struct vhost_vdpa {
> >>>       int index;
> >>>       uint32_t msg_type;
> >>>       bool iotlb_batch_begin_sent;
> >>> +    uint32_t address_space_id;
> >> So the trick is let device specific code to zero this during allocatio=
n?
> >>
> > Yes, but I don't see how that is a trick :). All other parameters also
> > trust it to be 0 at allocation.
> >
> >>>       MemoryListener listener;
> >>>       struct vhost_vdpa_iova_range iova_range;
> >>>       uint64_t acked_features;
> >>> @@ -42,8 +43,9 @@ typedef struct vhost_vdpa {
> >>>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >>>   } VhostVDPA;
> >>>
> >>> -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr siz=
e,
> >>> -                       void *vaddr, bool readonly);
> >>> -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr s=
ize);
> >>> +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr i=
ova,
> >>> +                       hwaddr size, void *vaddr, bool readonly);
> >>> +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr=
 iova,
> >>> +                         hwaddr size);
> >>>
> >>>   #endif
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 23efb8f49d..8fd32ba32b 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -72,22 +72,24 @@ static bool vhost_vdpa_listener_skipped_section(M=
emoryRegionSection *section,
> >>>       return false;
> >>>   }
> >>>
> >>> -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr siz=
e,
> >>> -                       void *vaddr, bool readonly)
> >>> +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr i=
ova,
> >>> +                       hwaddr size, void *vaddr, bool readonly)
> >>>   {
> >>>       struct vhost_msg_v2 msg =3D {};
> >>>       int fd =3D v->device_fd;
> >>>       int ret =3D 0;
> >>>
> >>>       msg.type =3D v->msg_type;
> >>> +    msg.asid =3D asid; /* 0 if vdpa device does not support asid */
> >> The comment here is confusing. If this is a requirement, we need eithe=
r
> >>
> >> 1) doc this
> >>
> >> or
> >>
> >> 2) perform necessary checks in the function itself.
> >>
> > I only documented it in vhost_vdpa_dma_unmap and now I realize it.
> > Would it work to just copy that comment here?
>
>
> Probably, and let's move the comment above the function definition.
>
>
> >
> >>>       msg.iotlb.iova =3D iova;
> >>>       msg.iotlb.size =3D size;
> >>>       msg.iotlb.uaddr =3D (uint64_t)(uintptr_t)vaddr;
> >>>       msg.iotlb.perm =3D readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW=
;
> >>>       msg.iotlb.type =3D VHOST_IOTLB_UPDATE;
> >>>
> >>> -   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iot=
lb.size,
> >>> -                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iot=
lb.type);
> >>> +    trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.asid, msg.iotlb.io=
va,
> >>> +                             msg.iotlb.size, msg.iotlb.uaddr, msg.io=
tlb.perm,
> >>> +                             msg.iotlb.type);
> >>>
> >>>       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >>>           error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> >>> @@ -98,18 +100,24 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwa=
ddr iova, hwaddr size,
> >>>       return ret;
> >>>   }
> >>>
> >>> -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr s=
ize)
> >>> +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr=
 iova,
> >>> +                         hwaddr size)
> >>>   {
> >>>       struct vhost_msg_v2 msg =3D {};
> >>>       int fd =3D v->device_fd;
> >>>       int ret =3D 0;
> >>>
> >>>       msg.type =3D v->msg_type;
> >>> +    /*
> >>> +     * The caller must set asid =3D 0 if the device does not support=
 asid.
> >>> +     * This is not an ABI break since it is set to 0 by the initiali=
zer anyway.
> >>> +     */
> >>> +    msg.asid =3D asid;
> >>>       msg.iotlb.iova =3D iova;
> >>>       msg.iotlb.size =3D size;
> >>>       msg.iotlb.type =3D VHOST_IOTLB_INVALIDATE;
> >>>
> >>> -    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
> >>> +    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.=
iova,
> >>>                                  msg.iotlb.size, msg.iotlb.type);
> >>>
> >>>       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >>> @@ -229,7 +237,7 @@ static void vhost_vdpa_listener_region_add(Memory=
Listener *listener,
> >>>       }
> >>>
> >>>       vhost_vdpa_iotlb_batch_begin_once(v);
> >>> -    ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> >>> +    ret =3D vhost_vdpa_dma_map(v, 0, iova, int128_get64(llsize),
> >> Can we use v->address_space_id here? Then we don't need to modify this
> >> line when we support multiple asids logic in the future.
> >>
> > The registered memory listener is the one of the last vhost_vdpa, the
> > one that handles the last queue.
> >
> > If all data virtqueues are not shadowed but CVQ is,
> > v->address_space_id is 1 with the current code.
>
>
> Ok, right. So let's add a comment here. It would be even better to
> define the macro for data vq asid in this patch.
>

I agree that it must be changed to a macro.

However, currently the _ASID macros belong to net/ . Maybe to declare
VHOST_VDPA_GPA_ASID in include/hw/virtio/vhost-vdpa.h and just let
VHOST_VDPA_NET_CVQ_ASID in net/vhost-vdpa.c?

Thanks!

>
> Thanks
>
>
> >   But the listener is
> > actually mapping the ASID 0, not 1.
> >
> > Another alternative is to register it to the last data virtqueue, not
> > the last queue of vhost_vdpa. But it is hard to express it in a
> > generic way at virtio/vhost-vdpa.c . To have a boolean indicating the
> > vhost_vdpa we want to register its memory listener?
> >
> > It seems easier to me to simply assign 0 at GPA translations. If SVQ
> > is enabled for all queues, then 0 is GPA to qemu's VA + SVQ stuff. If
> > it is not, 0 is always GPA to qemu's VA.
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>>                                vaddr, section->readonly);
> >>>       if (ret) {
> >>>           error_report("vhost vdpa map fail!");
> >>> @@ -303,7 +311,7 @@ static void vhost_vdpa_listener_region_del(Memory=
Listener *listener,
> >>>           vhost_iova_tree_remove(v->iova_tree, *result);
> >>>       }
> >>>       vhost_vdpa_iotlb_batch_begin_once(v);
> >>> -    ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> >>> +    ret =3D vhost_vdpa_dma_unmap(v, 0, iova, int128_get64(llsize));
> >>>       if (ret) {
> >>>           error_report("vhost_vdpa dma unmap error!");
> >>>       }
> >>> @@ -884,7 +892,7 @@ static void vhost_vdpa_svq_unmap_ring(struct vhos=
t_vdpa *v, hwaddr addr)
> >>>       }
> >>>
> >>>       size =3D ROUND_UP(result->size, qemu_real_host_page_size());
> >>> -    r =3D vhost_vdpa_dma_unmap(v, result->iova, size);
> >>> +    r =3D vhost_vdpa_dma_unmap(v, v->address_space_id, result->iova,=
 size);
> >>>       if (unlikely(r < 0)) {
> >>>           error_report("Unable to unmap SVQ vring: %s (%d)", g_strerr=
or(-r), -r);
> >>>           return;
> >>> @@ -924,7 +932,8 @@ static bool vhost_vdpa_svq_map_ring(struct vhost_=
vdpa *v, DMAMap *needle,
> >>>           return false;
> >>>       }
> >>>
> >>> -    r =3D vhost_vdpa_dma_map(v, needle->iova, needle->size + 1,
> >>> +    r =3D vhost_vdpa_dma_map(v, v->address_space_id, needle->iova,
> >>> +                           needle->size + 1,
> >>>                              (void *)(uintptr_t)needle->translated_ad=
dr,
> >>>                              needle->perm =3D=3D IOMMU_RO);
> >>>       if (unlikely(r !=3D 0)) {
> >>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>> index fb35b17ab4..ca1acc0410 100644
> >>> --- a/net/vhost-vdpa.c
> >>> +++ b/net/vhost-vdpa.c
> >>> @@ -258,7 +258,7 @@ static void vhost_vdpa_cvq_unmap_buf(struct vhost=
_vdpa *v, void *addr)
> >>>           return;
> >>>       }
> >>>
> >>> -    r =3D vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> >>> +    r =3D vhost_vdpa_dma_unmap(v, v->address_space_id, map->iova, ma=
p->size + 1);
> >>>       if (unlikely(r !=3D 0)) {
> >>>           error_report("Device cannot unmap: %s(%d)", g_strerror(r), =
r);
> >>>       }
> >>> @@ -298,8 +298,8 @@ static int vhost_vdpa_cvq_map_buf(struct vhost_vd=
pa *v, void *buf, size_t size,
> >>>           return r;
> >>>       }
> >>>
> >>> -    r =3D vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_pag=
e_len(), buf,
> >>> -                           !write);
> >>> +    r =3D vhost_vdpa_dma_map(v, v->address_space_id, map.iova,
> >>> +                           vhost_vdpa_net_cvq_cmd_page_len(), buf, !=
write);
> >>>       if (unlikely(r < 0)) {
> >>>           goto dma_map_err;
> >>>       }
> >>> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> >>> index 820dadc26c..0ad9390307 100644
> >>> --- a/hw/virtio/trace-events
> >>> +++ b/hw/virtio/trace-events
> >>> @@ -30,8 +30,8 @@ vhost_user_write(uint32_t req, uint32_t flags) "req=
:%d flags:0x%"PRIx32""
> >>>   vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
> >>>
> >>>   # vhost-vdpa.c
> >>> -vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t i=
ova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd=
: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRI=
x64" perm: 0x%"PRIx8" type: %"PRIu8
> >>> -vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t=
 iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iov=
a: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> >>> +vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t a=
sid, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t ty=
pe) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" s=
ize: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> >>> +vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t=
 asid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type=
: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRI=
u8
> >>>   vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type,=
 uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> >>>   vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint=
8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> >>>   vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t =
llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRI=
x64" vaddr: %p read-only: %d"
> >>> --
> >>> 2.31.1
> >>>
>


