Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339866BAFC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:55:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHMBy-0003F5-Hc; Mon, 16 Jan 2023 04:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHMBs-0003Ep-Kk
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:54:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHMBp-0000pg-FQ
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673862844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4m9kViEOZEsW2qJpWX3e4guyn3S45xW2tNW4lbS0qVI=;
 b=Pdb/Djc4qpKDdsd/2Bs9nKFFEcdBa++NEdCTyk8alw97oL8u9cwUDKwDyyj5YXPuwkXVaL
 dmGbY2oCsNSVuFhyhcRxptnUZcQogqvBoKIj9Q6g7LPhaBKwLkA0c8XZdbWYrTJruYxl/m
 UtyB+QaXUytCRo7igvPTdlvvPjmjfxo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-3m-Znl8tPiWzTrrPfedIgg-1; Mon, 16 Jan 2023 04:54:02 -0500
X-MC-Unique: 3m-Znl8tPiWzTrrPfedIgg-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-4ce566db73eso225617777b3.11
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4m9kViEOZEsW2qJpWX3e4guyn3S45xW2tNW4lbS0qVI=;
 b=rFmPiWjlNBgLcAZjD/WAYNCdliYFQeJ0l5dy9ADPQKOyoUULEXYxlcne2DieexkrWY
 RXlMsgfdn9qPoibhPg7tWEE9NQbF/+xLz9JON394Ecv5Vgd80CI2PlFjgWMrwAEypm81
 4oiMqLDypu0HvVfZ/tbPAyrkU6iIVN7UdM792XHkc6LNJQR/rnoDKdlfRCSSa4sIl8kL
 ZYvf6snwt1mjEFKELwt9Hb2wT8qpDzOxiRplV3+PiHugw0gIK2c26taX6bkUXjOavbuA
 LNA/EUi8UUsuQhtY0DyNQixU2ugVXjQJ/gfCYZIfHmUZZEznx+12WgOPDT5r0zqyaN4F
 04Lw==
X-Gm-Message-State: AFqh2koEneP5XxEEVhhFpyxM+y6Vv0fh5r+7yBywF9vyLXqCkEVfNMOC
 xTPmJEI4i4B15zdgiLJ5kLj1RITYh7wVkYUyhOWM1zlEGmvgfum61tYgnIACvGSVJPXp0ToMFpI
 OTgUHzspOrDyJdBOhePKSQJiKC2mz+m4=
X-Received: by 2002:a25:81d0:0:b0:7d2:891e:ee59 with SMTP id
 n16-20020a2581d0000000b007d2891eee59mr1102586ybm.152.1673862842007; 
 Mon, 16 Jan 2023 01:54:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvO5tllTtIKwh2ma5HjQOi4ByUnsOcQmHtIRGGsvRuxtHEi/v6FhIAxG/P2c3wHMok7UzSlqDeSKcIMEoFUslI=
X-Received: by 2002:a25:81d0:0:b0:7d2:891e:ee59 with SMTP id
 n16-20020a2581d0000000b007d2891eee59mr1102584ybm.152.1673862841765; Mon, 16
 Jan 2023 01:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-5-eperezma@redhat.com>
 <CACGkMEvo4fS0AZ7_i3MnpLJwic7VEX3x7BaaB=w1t7y2Fri9EQ@mail.gmail.com>
 <CAJaqyWd3N3+78r_ZNNxZZMVJFpkqceYjOXtOrx6WSK62naN+jA@mail.gmail.com>
 <68d2c045-e260-140c-9525-2fc265ae9291@redhat.com>
In-Reply-To: <68d2c045-e260-140c-9525-2fc265ae9291@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 16 Jan 2023 10:53:25 +0100
Message-ID: <CAJaqyWeY30QETgksM2_zrc8xvOABSTAhwFUXRJRHumX0FFrqpw@mail.gmail.com>
Subject: Re: [RFC v2 04/13] vdpa: rewind at get_base, not set_base
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Jan 16, 2023 at 4:32 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/1/13 15:40, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Fri, Jan 13, 2023 at 5:10 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Fri, Jan 13, 2023 at 1:24 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> >>> At this moment it is only possible to migrate to a vdpa device runnin=
g
> >>> with x-svq=3Don. As a protective measure, the rewind of the inflight
> >>> descriptors was done at the destination. That way if the source sent =
a
> >>> virtqueue with inuse descriptors they are always discarded.
> >>>
> >>> Since this series allows to migrate also to passthrough devices with =
no
> >>> SVQ, the right thing to do is to rewind at the source so base of vrin=
gs
> >>> are correct.
> >>>
> >>> Support for inflight descriptors may be added in the future.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>   include/hw/virtio/vhost-backend.h |  4 +++
> >>>   hw/virtio/vhost-vdpa.c            | 46 +++++++++++++++++++---------=
---
> >>>   hw/virtio/vhost.c                 |  3 ++
> >>>   3 files changed, 36 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vh=
ost-backend.h
> >>> index c5ab49051e..ec3fbae58d 100644
> >>> --- a/include/hw/virtio/vhost-backend.h
> >>> +++ b/include/hw/virtio/vhost-backend.h
> >>> @@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost=
_dev *dev);
> >>>
> >>>   typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> >>>                                          int fd);
> >>> +
> >>> +typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
> >>> +
> >>>   typedef struct VhostOps {
> >>>       VhostBackendType backend_type;
> >>>       vhost_backend_init vhost_backend_init;
> >>> @@ -177,6 +180,7 @@ typedef struct VhostOps {
> >>>       vhost_get_device_id_op vhost_get_device_id;
> >>>       vhost_force_iommu_op vhost_force_iommu;
> >>>       vhost_set_config_call_op vhost_set_config_call;
> >>> +    vhost_reset_status_op vhost_reset_status;
> >>>   } VhostOps;
> >>>
> >>>   int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 542e003101..28a52ddc78 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -1132,14 +1132,23 @@ static int vhost_vdpa_dev_start(struct vhost_=
dev *dev, bool started)
> >>>       if (started) {
> >>>           memory_listener_register(&v->listener, &address_space_memor=
y);
> >>>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK=
);
> >>> -    } else {
> >>> -        vhost_vdpa_reset_device(dev);
> >>> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >>> -                                   VIRTIO_CONFIG_S_DRIVER);
> >>> -        memory_listener_unregister(&v->listener);
> >>> +    }
> >>>
> >>> -        return 0;
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +static void vhost_vdpa_reset_status(struct vhost_dev *dev)
> >>> +{
> >>> +    struct vhost_vdpa *v =3D dev->opaque;
> >>> +
> >>> +    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> >>> +        return;
> >>>       }
> >>> +
> >>> +    vhost_vdpa_reset_device(dev);
> >>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >>> +                                VIRTIO_CONFIG_S_DRIVER);
> >>> +    memory_listener_unregister(&v->listener);
> >>>   }
> >>>
> >>>   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t =
base,
> >>> @@ -1182,18 +1191,7 @@ static int vhost_vdpa_set_vring_base(struct vh=
ost_dev *dev,
> >>>                                          struct vhost_vring_state *ri=
ng)
> >>>   {
> >>>       struct vhost_vdpa *v =3D dev->opaque;
> >>> -    VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> >>>
> >>> -    /*
> >>> -     * vhost-vdpa devices does not support in-flight requests. Set a=
ll of them
> >>> -     * as available.
> >>> -     *
> >>> -     * TODO: This is ok for networking, but other kinds of devices m=
ight
> >>> -     * have problems with these retransmissions.
> >>> -     */
> >>> -    while (virtqueue_rewind(vq, 1)) {
> >>> -        continue;
> >>> -    }
> >>>       if (v->shadow_vqs_enabled) {
> >>>           /*
> >>>            * Device vring base was set at device start. SVQ base is h=
andled by
> >>> @@ -1212,6 +1210,19 @@ static int vhost_vdpa_get_vring_base(struct vh=
ost_dev *dev,
> >>>       int ret;
> >>>
> >>>       if (v->shadow_vqs_enabled) {
> >>> +        VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> >>> +
> >>> +        /*
> >>> +         * vhost-vdpa devices does not support in-flight requests. S=
et all of
> >>> +         * them as available.
> >>> +         *
> >>> +         * TODO: This is ok for networking, but other kinds of devic=
es might
> >>> +         * have problems with these retransmissions.
> >>> +         */
> >>> +        while (virtqueue_rewind(vq, 1)) {
> >>> +            continue;
> >>> +        }
> >>> +
> >>>           ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ri=
ng->index);
> >>>           return 0;
> >>>       }
> >>> @@ -1326,4 +1337,5 @@ const VhostOps vdpa_ops =3D {
> >>>           .vhost_vq_get_addr =3D vhost_vdpa_vq_get_addr,
> >>>           .vhost_force_iommu =3D vhost_vdpa_force_iommu,
> >>>           .vhost_set_config_call =3D vhost_vdpa_set_config_call,
> >>> +        .vhost_reset_status =3D vhost_vdpa_reset_status,
> >> Can we simply use the NetClient stop method here?
> >>
> > Ouch, I squashed two patches by mistake here.
> >
> > All the vhost_reset_status part should be independent of this patch,
> > and I was especially interested in its feedback. It had this message:
> >
> >      vdpa: move vhost reset after get vring base
> >
> >      The function vhost.c:vhost_dev_stop calls vhost operation
> >      vhost_dev_start(false). In the case of vdpa it totally reset and w=
ipes
> >      the device, making the fetching of the vring base (virtqueue state=
) totally
> >      useless.
> >
> >      The kernel backend does not use vhost_dev_start vhost op callback,=
 but
> >      vhost-user do. A patch to make vhost_user_dev_start more similar t=
o vdpa
> >      is desirable, but it can be added on top.
> >
> > I can resend the series splitting it again but conversation may
> > scatter between versions. Would you prefer me to send a new version?
>
>
> I think it can be done in next version (after we finalize the discussion
> for this version).
>
>
> >
> > Regarding the use of NetClient, it feels weird to call net specific
> > functions in VhostOps, doesn't it?
>
>
> Basically, I meant, the patch call vhost_reset_status() in
> vhost_dev_stop(). But we've already had vhost_dev_start ops where we
> implement per backend start/stop logic.
>
> I think it's better to do things in vhost_dev_start():
>
> For device that can do suspend, we can do suspend. For other we need to
> do reset as a workaround.
>

If the device implements _F_SUSPEND we can call suspend in
vhost_dev_start(false) and fetch the vq base after it. But we cannot
call vhost_dev_reset until we get the vq base. If we do it, we will
always get zero there.

If we don't reset the device at vhost_vdpa_dev_start(false) we need to
call a proper reset after getting the base, at least in vdpa. So to
create a new vhost_op should be the right thing to do, isn't it?

Hopefully with a better name than vhost_vdpa_reset_status, that's for sure =
:).

I'm not sure how vhost-user works with this or when it does reset the
indexes. My bet is that it never does at the device reinitialization
and it trusts VMM calls to vhost_user_set_base but I may be wrong.

Thanks!

> And if necessary, we can call nc client ops for net specific operations
> (if it has any).
>
> Thanks
>
>
> > At the moment vhost ops is
> > specialized in vhost-kernel, vhost-user and vhost-vdpa. If we want to
> > make it specific to the kind of device, that makes vhost-vdpa-net too.
> >
> > Thanks!
> >
> >
> >> Thanks
> >>
> >>>   };
> >>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >>> index eb8c4c378c..a266396576 100644
> >>> --- a/hw/virtio/vhost.c
> >>> +++ b/hw/virtio/vhost.c
> >>> @@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, Vir=
tIODevice *vdev, bool vrings)
> >>>                                hdev->vqs + i,
> >>>                                hdev->vq_index + i);
> >>>       }
> >>> +    if (hdev->vhost_ops->vhost_reset_status) {
> >>> +        hdev->vhost_ops->vhost_reset_status(hdev);
> >>> +    }
> >>>
> >>>       if (vhost_dev_has_iommu(hdev)) {
> >>>           if (hdev->vhost_ops->vhost_set_iotlb_callback) {
> >>> --
> >>> 2.31.1
> >>>
>


