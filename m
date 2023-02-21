Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DA69DAEF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMlE-0008L6-Qw; Tue, 21 Feb 2023 02:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUMl4-0008Kw-VU
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:08:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUMl3-0002Ai-8Z
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676963289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t30HXC7zLQ4Upip/sKUMspe0Fr41fYFDBU87RET5x/0=;
 b=aZMEYWJ4nWZpUgTY3fCOIPnsW/9stgvMkrLp3RzIOB4WIXP/87qBfs2LlqqQJyDIE1RKwS
 M0MmQj03umMoatnHQ0MZeiuYKxh/nhsAZ4HR2AIxF93B1oxe24j3s59JLrwqatyDPcAaRW
 H9un2n9e0kv7t8qyzIOefRHvxccaSCM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-60-ls-ComU7NNqYGY-_dH7oGQ-1; Tue, 21 Feb 2023 02:08:08 -0500
X-MC-Unique: ls-ComU7NNqYGY-_dH7oGQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 d185-20020a25e6c2000000b008fa1d22bd55so4197878ybh.21
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t30HXC7zLQ4Upip/sKUMspe0Fr41fYFDBU87RET5x/0=;
 b=JFnJ+JDKj2GTFth605h87uPPRIsRTIkDXpHtjsbcEyFjP6DMMDOx4ou3mWg4H4hSso
 Qe01p8QX66s4xMxSyTe3JSYkXRbH6xE9kHPtnx8VTwGOftxndp6clBhbHGY97ERQ6XdP
 Isd9QmEwnynVN+DUcQo+k9DC18yE1H2TqUZPWYL0xVAmdgk1RCI9UPE2oxJTG9CFokFl
 aO73HWqXC8AAzTn2OFkwI/x7qpPxRs1ek/xje/WGU7c1qxCmEOjLz5uIqU8+KZduPrQy
 zSeMfYhUSfcnZ3y6JSXKEVJWdQTCUTvg3K4gbnjNrSn58PK9+ZhjRcNqzcvL5RUh64cW
 ULtw==
X-Gm-Message-State: AO0yUKWGJtFviBy3AHK8OQ2SjGC0CIpGFNOEC+SOjbYBzd0+qpj1X8L5
 kEQ38Ver0KBn/yavpsv4LpnbMWF0ijO1ixGYbwAzx3IsIZwbo+3Oh4kVeqSXVl7x1b0JGEd/989
 EVkgKtoKUnmyOfdWYAsvd+LIon/17W2M=
X-Received: by 2002:a05:6902:510:b0:96b:6f45:3b37 with SMTP id
 x16-20020a056902051000b0096b6f453b37mr759235ybs.292.1676963287981; 
 Mon, 20 Feb 2023 23:08:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/TFpvGl5zExId9tLAdgNyYTSNm5DMm3pjzeeYfr1huLzEErMKSuqiU7/qQFzZUtC0RS93Gx98hS67PSmLLstg=
X-Received: by 2002:a05:6902:510:b0:96b:6f45:3b37 with SMTP id
 x16-20020a056902051000b0096b6f453b37mr759220ybs.292.1676963287767; Mon, 20
 Feb 2023 23:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-5-eperezma@redhat.com>
 <f8487b52-964f-641c-4365-e38b44ea2627@redhat.com>
In-Reply-To: <f8487b52-964f-641c-4365-e38b44ea2627@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 21 Feb 2023 08:07:31 +0100
Message-ID: <CAJaqyWdmApbyUdUCKXV2RvfRbSPQD=G18WVtdKXR3qTD5J5hqw@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] vdpa: move vhost reset after get vring base
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
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

On Tue, Feb 21, 2023 at 6:36 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/8 17:42, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > The function vhost.c:vhost_dev_stop calls vhost operation
> > vhost_dev_start(false). In the case of vdpa it totally reset and wipes
> > the device, making the fetching of the vring base (virtqueue state) tot=
ally
> > useless.
> >
> > The kernel backend does not use vhost_dev_start vhost op callback, but
> > vhost-user do. A patch to make vhost_user_dev_start more similar to vdp=
a
> > is desirable, but it can be added on top.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/vhost-backend.h |  4 ++++
> >   hw/virtio/vhost-vdpa.c            | 22 ++++++++++++++++------
> >   hw/virtio/vhost.c                 |  3 +++
> >   3 files changed, 23 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhos=
t-backend.h
> > index c5ab49051e..ec3fbae58d 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
> > @@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_d=
ev *dev);
> >
> >   typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> >                                          int fd);
> > +
> > +typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
> > +
> >   typedef struct VhostOps {
> >       VhostBackendType backend_type;
> >       vhost_backend_init vhost_backend_init;
> > @@ -177,6 +180,7 @@ typedef struct VhostOps {
> >       vhost_get_device_id_op vhost_get_device_id;
> >       vhost_force_iommu_op vhost_force_iommu;
> >       vhost_set_config_call_op vhost_set_config_call;
> > +    vhost_reset_status_op vhost_reset_status;
> >   } VhostOps;
> >
> >   int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index cbbe92ffe8..26e38a6aab 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1152,14 +1152,23 @@ static int vhost_vdpa_dev_start(struct vhost_de=
v *dev, bool started)
> >       if (started) {
> >           memory_listener_register(&v->listener, &address_space_memory)=
;
> >           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > -    } else {
> > -        vhost_vdpa_reset_device(dev);
> > -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > -                                   VIRTIO_CONFIG_S_DRIVER);
> > -        memory_listener_unregister(&v->listener);
> > +    }
> >
> > -        return 0;
> > +    return 0;
> > +}
> > +
> > +static void vhost_vdpa_reset_status(struct vhost_dev *dev)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +
> > +    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> > +        return;
> >       }
> > +
> > +    vhost_vdpa_reset_device(dev);
> > +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > +                                VIRTIO_CONFIG_S_DRIVER);
> > +    memory_listener_unregister(&v->listener);
> >   }
> >
> >   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t ba=
se,
> > @@ -1346,4 +1355,5 @@ const VhostOps vdpa_ops =3D {
> >           .vhost_vq_get_addr =3D vhost_vdpa_vq_get_addr,
> >           .vhost_force_iommu =3D vhost_vdpa_force_iommu,
> >           .vhost_set_config_call =3D vhost_vdpa_set_config_call,
> > +        .vhost_reset_status =3D vhost_vdpa_reset_status,
> >   };
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index eb8c4c378c..a266396576 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtI=
ODevice *vdev, bool vrings)
> >                                hdev->vqs + i,
> >                                hdev->vq_index + i);
> >       }
> > +    if (hdev->vhost_ops->vhost_reset_status) {
> > +        hdev->vhost_ops->vhost_reset_status(hdev);
> > +    }
>
>
> This looks racy, if we don't suspend/reset the device, device can move
> last_avail_idx even after get_vring_base()?
>
> Instead of doing things like this, should we fallback to
> virtio_queue_restore_last_avail_idx() in this case?
>

Right, we can track if the device is suspended / SVQ and then return
an error in vring_get_base if it is not. Would that work?

Thanks!

> Thanks
>
>
> >
> >       if (vhost_dev_has_iommu(hdev)) {
> >           if (hdev->vhost_ops->vhost_set_iotlb_callback) {
>


