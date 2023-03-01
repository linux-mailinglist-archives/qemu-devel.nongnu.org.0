Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB786A7415
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXRsO-0005Kh-IQ; Wed, 01 Mar 2023 14:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXRsM-0005Fi-22
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXRsK-00077a-EM
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677697947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6MkEqkAgqwRtWCD+5x4mIlvYPCyA4uMO16D3D12Odk=;
 b=cvFY8Jrmm9JftWJzKwpElFTa3IY0xDxWXH5EdFkOkk/469Y7QHRvIo4modfq7XMQlnV/rG
 ZtWNz7PXzHOtyHUqiSackLRDA+n6IFKHx0LU7yYmlTXMYxHTRiVkA90d3bdfSAmrMu7Gmx
 CH5t8VhfP6LpGGl5prceMzcKP36sS3o=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-VSinlX-KPj61wCCfvGOq5g-1; Wed, 01 Mar 2023 14:12:26 -0500
X-MC-Unique: VSinlX-KPj61wCCfvGOq5g-1
Received: by mail-yb1-f199.google.com with SMTP id
 204-20020a2514d5000000b00a3637aea9e1so1359127ybu.17
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 11:12:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677697945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q6MkEqkAgqwRtWCD+5x4mIlvYPCyA4uMO16D3D12Odk=;
 b=ZNmDi3IEgD2UAeB8Oix8svanXa2LfXzuLPueDYPoUD79//4juWdjhGp7g7D1/b37Mx
 KFhwk7zEPK5uLJiz+USMNcMZ0gUGKcF6i+CtiSvh348NMl45NsKb5BawT1DMmVZtA6zv
 a/+d6bK3Ddy5WxXvyLyTr6bgx/g5s+1oD5eOmyi7ojj5PG0NpvSV2LS9EzXYgTEd5Vgn
 QznYuG7AS/tg27RRTo/rsWkVNxH3r93735bhh/uDiDh40urEdHHqBIArD3DKnBKMFNoX
 GihvqRNUkUt1lRZ1ww45ekb9FkozqS5bLn+jwS6mwZzgZQohKkUxM8WJiNOzBByY55Wx
 kOlg==
X-Gm-Message-State: AO0yUKWo4hGqwV50ggD4Q59s9oCiQc3nzfmU0DDEL+lE081tat6ULOQ+
 FlFWm2SyZ75W19NsimN7ABWsQeeLaX/dCl7K5pCfIpVIYfZtU4wn9uW5pi4PndRuDBjhhA3gZvA
 /bVbZUTg/XNynRDqrkvHUbtrcgPPnLAI=
X-Received: by 2002:a5b:611:0:b0:a48:6236:1be4 with SMTP id
 d17-20020a5b0611000000b00a4862361be4mr3636364ybq.2.1677697945366; 
 Wed, 01 Mar 2023 11:12:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+fHWANW1Pi2W30PNIvpvj6+C5zbEjuflsY8Gz/S49KXV+W2u3yEUV0eyR28pTprPqQKebBCBjl7ZnK8lUGoTc=
X-Received: by 2002:a5b:611:0:b0:a48:6236:1be4 with SMTP id
 d17-20020a5b0611000000b00a4862361be4mr3636344ybq.2.1677697945099; Wed, 01 Mar
 2023 11:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-6-eperezma@redhat.com>
 <163ea0b7-1814-3ab6-2f8a-ee594914f6bc@redhat.com>
In-Reply-To: <163ea0b7-1814-3ab6-2f8a-ee594914f6bc@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 1 Mar 2023 20:11:49 +0100
Message-ID: <CAJaqyWdi=D-X__8=tBiw2ODmUhj=v7RM7BxFnKyHROGPYVkNBw@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] vdpa: move vhost reset after get vring base
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>, 
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
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

On Mon, Feb 27, 2023 at 8:22 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > The function vhost.c:vhost_dev_stop calls vhost operation
> > vhost_dev_start(false). In the case of vdpa it totally reset and wipes
> > the device, making the fetching of the vring base (virtqueue state) tot=
ally
> > useless.
>
>
> As discussed before, should we do something reverse: in
> vhost_vdpa_dev_started() since what proposed in the patch doesn't solve
> the issue (index could be moved after the get_vring_base())
>
> 1) if _F_SUSPEND is negotiated, suspend instead of reset
>
> 2) if _F_SUSPEND is not negotiated, reset and fail
> vhost_get_vring_base() to allow graceful fallback?
>

Right. I think option 2 is the right one, as it introduces the changes
more gradually.

Thanks!

> Thanks
>
>
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
> > index 4fac144169..8cc9c98db9 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1134,14 +1134,23 @@ static int vhost_vdpa_dev_start(struct vhost_de=
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
> > +                               VIRTIO_CONFIG_S_DRIVER);
> > +    memory_listener_unregister(&v->listener);
> >   }
> >
> >   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t ba=
se,
> > @@ -1328,4 +1337,5 @@ const VhostOps vdpa_ops =3D {
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
> >
> >       if (vhost_dev_has_iommu(hdev)) {
> >           if (hdev->vhost_ops->vhost_set_iotlb_callback) {
>


