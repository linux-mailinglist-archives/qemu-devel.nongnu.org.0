Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A869ED94
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 04:45:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUg2U-0007cw-PJ; Tue, 21 Feb 2023 22:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUg2S-0007ch-IL
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 22:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUg2Q-0001x4-C2
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 22:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677037405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYy9cshmMNr8BfPaOPWLByKunyms8d6bnFFqfMFZ4B8=;
 b=Sjtztd6ynN8kPSswysQ+QuA3ji68Z/xazB/kMFeu+xb9XsnhCGBLJIyo2XBguA0Yr+FhNt
 CWA+WHarLKn3LkSjaMry+zOK5xUfaKLoV6S4Qg2UyIH0EliAvvW3zDgjVMXDrmAUd4g+rW
 EHkdCVPiZWKHP20sm1Cd6bduK86pezE=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-UQkG0SOHMnmvCRErMPAKZA-1; Tue, 21 Feb 2023 22:43:23 -0500
X-MC-Unique: UQkG0SOHMnmvCRErMPAKZA-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1721fdd3383so1976775fac.13
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 19:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYy9cshmMNr8BfPaOPWLByKunyms8d6bnFFqfMFZ4B8=;
 b=4IhA9y6WCtLJ7omXzcfUfJBvYQbTDae/txfIj2BlDWt8nb0fs0hGy1IjVfQy5ZFy8V
 ibcMuvbIdRhngP7WBhGszawTBVpaRj9llxQQS4MmuNA6IYPRxXY6o6UUTkUMr1mXGMg/
 w3AfKhT3UJxNfhfLAkLo2ESZgvyGKbrp2N7wU0GNkJU/LVHK/VOVtb8oH7JpQoCOQQSm
 CNk+VsfrfTYxdYZBE0gHz06LLyeb9H2MjvVkQV3BZlsJg/WQUtNpEDHVHLVvLQVV27sK
 VN7DFfcofuO5RLuHY0m33XZaCTaGwvwnb8RQmcG3r5Tx5RCoNrJAXHnh6OtTjNmbQmJD
 vN3g==
X-Gm-Message-State: AO0yUKVfN/2d8rFXNB8kJ98bnUbsQ5adzRlc6zz6t36cyhzIe86vbOJF
 pIzE9nEVs7PE4zAAyXQW0QyDkU1MqyyU/KsnafDW6ezwlPBzb9UZ8JymIKJxgKl2H7fmS/+dDNN
 TJdrNuCqMVSqSi9FdpCk1eWzXbVyT2VI=
X-Received: by 2002:a05:6871:725:b0:16a:2c1a:e416 with SMTP id
 f37-20020a056871072500b0016a2c1ae416mr746353oap.35.1677037403034; 
 Tue, 21 Feb 2023 19:43:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9C8zghOv+GH1Gih+SpNi9utTa+DTMyMp55TkhEpeMx1+yj83hNjy2Hrvwb83uTeF/muFGuHkUN4v+XCbuXaGc=
X-Received: by 2002:a05:6871:725:b0:16a:2c1a:e416 with SMTP id
 f37-20020a056871072500b0016a2c1ae416mr746334oap.35.1677037402798; Tue, 21 Feb
 2023 19:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-5-eperezma@redhat.com>
 <f8487b52-964f-641c-4365-e38b44ea2627@redhat.com>
 <CAJaqyWdmApbyUdUCKXV2RvfRbSPQD=G18WVtdKXR3qTD5J5hqw@mail.gmail.com>
In-Reply-To: <CAJaqyWdmApbyUdUCKXV2RvfRbSPQD=G18WVtdKXR3qTD5J5hqw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 22 Feb 2023 11:43:11 +0800
Message-ID: <CACGkMEtSDfyYPpbWcOydDr329936nmUyKQdPFbvfxQPZMj6HJQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] vdpa: move vhost reset after get vring base
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Feb 21, 2023 at 3:08 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Feb 21, 2023 at 6:36 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2023/2/8 17:42, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > The function vhost.c:vhost_dev_stop calls vhost operation
> > > vhost_dev_start(false). In the case of vdpa it totally reset and wipe=
s
> > > the device, making the fetching of the vring base (virtqueue state) t=
otally
> > > useless.
> > >
> > > The kernel backend does not use vhost_dev_start vhost op callback, bu=
t
> > > vhost-user do. A patch to make vhost_user_dev_start more similar to v=
dpa
> > > is desirable, but it can be added on top.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   include/hw/virtio/vhost-backend.h |  4 ++++
> > >   hw/virtio/vhost-vdpa.c            | 22 ++++++++++++++++------
> > >   hw/virtio/vhost.c                 |  3 +++
> > >   3 files changed, 23 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vh=
ost-backend.h
> > > index c5ab49051e..ec3fbae58d 100644
> > > --- a/include/hw/virtio/vhost-backend.h
> > > +++ b/include/hw/virtio/vhost-backend.h
> > > @@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost=
_dev *dev);
> > >
> > >   typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> > >                                          int fd);
> > > +
> > > +typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
> > > +
> > >   typedef struct VhostOps {
> > >       VhostBackendType backend_type;
> > >       vhost_backend_init vhost_backend_init;
> > > @@ -177,6 +180,7 @@ typedef struct VhostOps {
> > >       vhost_get_device_id_op vhost_get_device_id;
> > >       vhost_force_iommu_op vhost_force_iommu;
> > >       vhost_set_config_call_op vhost_set_config_call;
> > > +    vhost_reset_status_op vhost_reset_status;
> > >   } VhostOps;
> > >
> > >   int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index cbbe92ffe8..26e38a6aab 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -1152,14 +1152,23 @@ static int vhost_vdpa_dev_start(struct vhost_=
dev *dev, bool started)
> > >       if (started) {
> > >           memory_listener_register(&v->listener, &address_space_memor=
y);
> > >           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK=
);
> > > -    } else {
> > > -        vhost_vdpa_reset_device(dev);
> > > -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > > -                                   VIRTIO_CONFIG_S_DRIVER);
> > > -        memory_listener_unregister(&v->listener);
> > > +    }
> > >
> > > -        return 0;
> > > +    return 0;
> > > +}
> > > +
> > > +static void vhost_vdpa_reset_status(struct vhost_dev *dev)
> > > +{
> > > +    struct vhost_vdpa *v =3D dev->opaque;
> > > +
> > > +    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> > > +        return;
> > >       }
> > > +
> > > +    vhost_vdpa_reset_device(dev);
> > > +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > > +                                VIRTIO_CONFIG_S_DRIVER);
> > > +    memory_listener_unregister(&v->listener);
> > >   }
> > >
> > >   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t =
base,
> > > @@ -1346,4 +1355,5 @@ const VhostOps vdpa_ops =3D {
> > >           .vhost_vq_get_addr =3D vhost_vdpa_vq_get_addr,
> > >           .vhost_force_iommu =3D vhost_vdpa_force_iommu,
> > >           .vhost_set_config_call =3D vhost_vdpa_set_config_call,
> > > +        .vhost_reset_status =3D vhost_vdpa_reset_status,
> > >   };
> > > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > > index eb8c4c378c..a266396576 100644
> > > --- a/hw/virtio/vhost.c
> > > +++ b/hw/virtio/vhost.c
> > > @@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, Vir=
tIODevice *vdev, bool vrings)
> > >                                hdev->vqs + i,
> > >                                hdev->vq_index + i);
> > >       }
> > > +    if (hdev->vhost_ops->vhost_reset_status) {
> > > +        hdev->vhost_ops->vhost_reset_status(hdev);
> > > +    }
> >
> >
> > This looks racy, if we don't suspend/reset the device, device can move
> > last_avail_idx even after get_vring_base()?
> >
> > Instead of doing things like this, should we fallback to
> > virtio_queue_restore_last_avail_idx() in this case?
> >
>
> Right, we can track if the device is suspended / SVQ and then return
> an error in vring_get_base if it is not. Would that work?

When we don't support suspend, yes.

Thanks

>
> Thanks!
>
> > Thanks
> >
> >
> > >
> > >       if (vhost_dev_has_iommu(hdev)) {
> > >           if (hdev->vhost_ops->vhost_set_iotlb_callback) {
> >
>
>


