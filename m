Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC3668F5A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:41:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGEgL-0005HI-Rf; Fri, 13 Jan 2023 02:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGEgD-0005Gx-PZ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:40:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGEgB-0007q2-4G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673595646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Yz7mlhi7MIp9qtkOB0dA6SRd4ZW4CaBJwTGLtqofKQ=;
 b=hagp2R57nBSpUVq9iU2WpKSEqea7Lskalz50JXIM7p2+qu2x6Tcak6MuJ9LHF6ibtXzIr+
 g3LHo1VrtsIU+Lh7ToKNXTRjsIwkrdK4G50hSAi2e5t943AkhyBqVgZoLI6CKJJcdMr3Tj
 HApJLBnZbi+Mm+9fkHJQvzLhtBtRR+Q=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558-_QI7nzw_PuaOU8aV4WAoXg-1; Fri, 13 Jan 2023 02:40:45 -0500
X-MC-Unique: _QI7nzw_PuaOU8aV4WAoXg-1
Received: by mail-yb1-f199.google.com with SMTP id
 y66-20020a25c845000000b00733b5049b6fso21813365ybf.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 23:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Yz7mlhi7MIp9qtkOB0dA6SRd4ZW4CaBJwTGLtqofKQ=;
 b=ZK6UbAHh0Ql2TQmN/ePtjUkF+0UXsRYPaqpU61UGHxQCgfaB/BY55s2m6ocyPfjlad
 Cn35ofckuGgjBVWYvIF5gPFXFMlgMlhgGisp1D4y7bMHpusb8mfMKlRsvsUG6rpFfz5R
 8D3+BEQ/ZwbxEioUjVFb9VZoleEWcVhyNFvqZpENQWLIWz4OMfK9k6qBPVg8vermL45Q
 JDWQ8ga1w/bJ3owMTOFVtuYdVBGJO2QqmfdW9uFJ8qnXXZas13DQukOPHgxlWnBCOYZN
 x0/qsnWctglwKzRqiIaiqAysVQOLqbhX+4wQgC41Q65KMZpYaKwL+sTbLP40zoIMfkyJ
 wJEw==
X-Gm-Message-State: AFqh2kpl+ggTfGbDZs3kCNk6PP13VrMWryfdVJXx1qL5knTlwQarmnY5
 Zy6dhbjaXpkESRb0oHdlnrFX52Nv47zSma/FgaxV2yTUkp/PiGcX5TX7F8FOjL1C6ggLv9bRZaH
 ki3F+CKuNTvJV5IN6BrUKvKz6tQrfOnY=
X-Received: by 2002:a05:690c:dc3:b0:4db:3ac0:78a3 with SMTP id
 db3-20020a05690c0dc300b004db3ac078a3mr581007ywb.266.1673595644591; 
 Thu, 12 Jan 2023 23:40:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtNwQfsHuaeek5iOtCGG66lMiAp9loxsgL72akKFJe4IyxYxhsfZYWCx9RM/jRbSHPgmzx5a3ViaTuFL0FLLg4=
X-Received: by 2002:a05:690c:dc3:b0:4db:3ac0:78a3 with SMTP id
 db3-20020a05690c0dc300b004db3ac078a3mr580985ywb.266.1673595644269; Thu, 12
 Jan 2023 23:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-5-eperezma@redhat.com>
 <CACGkMEvo4fS0AZ7_i3MnpLJwic7VEX3x7BaaB=w1t7y2Fri9EQ@mail.gmail.com>
In-Reply-To: <CACGkMEvo4fS0AZ7_i3MnpLJwic7VEX3x7BaaB=w1t7y2Fri9EQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 13 Jan 2023 08:40:08 +0100
Message-ID: <CAJaqyWd3N3+78r_ZNNxZZMVJFpkqceYjOXtOrx6WSK62naN+jA@mail.gmail.com>
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

On Fri, Jan 13, 2023 at 5:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jan 13, 2023 at 1:24 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > At this moment it is only possible to migrate to a vdpa device running
> > with x-svq=3Don. As a protective measure, the rewind of the inflight
> > descriptors was done at the destination. That way if the source sent a
> > virtqueue with inuse descriptors they are always discarded.
> >
> > Since this series allows to migrate also to passthrough devices with no
> > SVQ, the right thing to do is to rewind at the source so base of vrings
> > are correct.
> >
> > Support for inflight descriptors may be added in the future.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost-backend.h |  4 +++
> >  hw/virtio/vhost-vdpa.c            | 46 +++++++++++++++++++------------
> >  hw/virtio/vhost.c                 |  3 ++
> >  3 files changed, 36 insertions(+), 17 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhos=
t-backend.h
> > index c5ab49051e..ec3fbae58d 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
> > @@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_d=
ev *dev);
> >
> >  typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> >                                         int fd);
> > +
> > +typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
> > +
> >  typedef struct VhostOps {
> >      VhostBackendType backend_type;
> >      vhost_backend_init vhost_backend_init;
> > @@ -177,6 +180,7 @@ typedef struct VhostOps {
> >      vhost_get_device_id_op vhost_get_device_id;
> >      vhost_force_iommu_op vhost_force_iommu;
> >      vhost_set_config_call_op vhost_set_config_call;
> > +    vhost_reset_status_op vhost_reset_status;
> >  } VhostOps;
> >
> >  int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 542e003101..28a52ddc78 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1132,14 +1132,23 @@ static int vhost_vdpa_dev_start(struct vhost_de=
v *dev, bool started)
> >      if (started) {
> >          memory_listener_register(&v->listener, &address_space_memory);
> >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
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
> >      }
> > +
> > +    vhost_vdpa_reset_device(dev);
> > +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > +                                VIRTIO_CONFIG_S_DRIVER);
> > +    memory_listener_unregister(&v->listener);
> >  }
> >
> >  static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t bas=
e,
> > @@ -1182,18 +1191,7 @@ static int vhost_vdpa_set_vring_base(struct vhos=
t_dev *dev,
> >                                         struct vhost_vring_state *ring)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> > -    VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> >
> > -    /*
> > -     * vhost-vdpa devices does not support in-flight requests. Set all=
 of them
> > -     * as available.
> > -     *
> > -     * TODO: This is ok for networking, but other kinds of devices mig=
ht
> > -     * have problems with these retransmissions.
> > -     */
> > -    while (virtqueue_rewind(vq, 1)) {
> > -        continue;
> > -    }
> >      if (v->shadow_vqs_enabled) {
> >          /*
> >           * Device vring base was set at device start. SVQ base is hand=
led by
> > @@ -1212,6 +1210,19 @@ static int vhost_vdpa_get_vring_base(struct vhos=
t_dev *dev,
> >      int ret;
> >
> >      if (v->shadow_vqs_enabled) {
> > +        VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> > +
> > +        /*
> > +         * vhost-vdpa devices does not support in-flight requests. Set=
 all of
> > +         * them as available.
> > +         *
> > +         * TODO: This is ok for networking, but other kinds of devices=
 might
> > +         * have problems with these retransmissions.
> > +         */
> > +        while (virtqueue_rewind(vq, 1)) {
> > +            continue;
> > +        }
> > +
> >          ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring-=
>index);
> >          return 0;
> >      }
> > @@ -1326,4 +1337,5 @@ const VhostOps vdpa_ops =3D {
> >          .vhost_vq_get_addr =3D vhost_vdpa_vq_get_addr,
> >          .vhost_force_iommu =3D vhost_vdpa_force_iommu,
> >          .vhost_set_config_call =3D vhost_vdpa_set_config_call,
> > +        .vhost_reset_status =3D vhost_vdpa_reset_status,
>
> Can we simply use the NetClient stop method here?
>

Ouch, I squashed two patches by mistake here.

All the vhost_reset_status part should be independent of this patch,
and I was especially interested in its feedback. It had this message:

    vdpa: move vhost reset after get vring base

    The function vhost.c:vhost_dev_stop calls vhost operation
    vhost_dev_start(false). In the case of vdpa it totally reset and wipes
    the device, making the fetching of the vring base (virtqueue state) tot=
ally
    useless.

    The kernel backend does not use vhost_dev_start vhost op callback, but
    vhost-user do. A patch to make vhost_user_dev_start more similar to vdp=
a
    is desirable, but it can be added on top.

I can resend the series splitting it again but conversation may
scatter between versions. Would you prefer me to send a new version?

Regarding the use of NetClient, it feels weird to call net specific
functions in VhostOps, doesn't it? At the moment vhost ops is
specialized in vhost-kernel, vhost-user and vhost-vdpa. If we want to
make it specific to the kind of device, that makes vhost-vdpa-net too.

Thanks!


> Thanks
>
> >  };
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index eb8c4c378c..a266396576 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtI=
ODevice *vdev, bool vrings)
> >                               hdev->vqs + i,
> >                               hdev->vq_index + i);
> >      }
> > +    if (hdev->vhost_ops->vhost_reset_status) {
> > +        hdev->vhost_ops->vhost_reset_status(hdev);
> > +    }
> >
> >      if (vhost_dev_has_iommu(hdev)) {
> >          if (hdev->vhost_ops->vhost_set_iotlb_callback) {
> > --
> > 2.31.1
> >
>


