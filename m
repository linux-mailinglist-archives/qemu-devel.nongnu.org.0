Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E835BBAD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:08:02 +0200 (CEST)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVrc1-0007yb-33
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVraN-0007ON-5D
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVraJ-0006O6-S8
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618214773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n+FfuPDRBV9x9b8iYcxm3Dz/H4V6um7IkjLdWitl3iY=;
 b=CRoBYUl3lt5r+JdZ+5ndbbl8S935tAJ6apt2OBPtZ7sxZ7ySRUaeojCUq2/5EqTGCHZcex
 GQ/b44kqrFesKaB1ZIOTaMT6bJDJtAqmZYpNgpeCpy2knwpFenczCxw1sSMW2kLIWqgZjq
 Y5HPUP2Il/QKj+OP2gC+DWoOCAVShHM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-QdUIMLWPO_ieuPVIUB8iRw-1; Mon, 12 Apr 2021 04:06:12 -0400
X-MC-Unique: QdUIMLWPO_ieuPVIUB8iRw-1
Received: by mail-pg1-f200.google.com with SMTP id o9so5784940pgm.15
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 01:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n+FfuPDRBV9x9b8iYcxm3Dz/H4V6um7IkjLdWitl3iY=;
 b=qWoLYQ/5E83YraqLBfZ5imX+Ua/tRuUU3CiW0kLxDc4TxeybJhcCILu28nLgONczY/
 mYxmuehsSFjdc+ZXjygISIsM4TU2GlE6hmdO/gsuIkDn6jiqqUyv/oRkTw6taQRPb9rW
 Ao24IBCv4R0QBanSLtNOQAaGQT5/SiTPz9at4TIyAGsuWv3mFlezD1c4RmfN3L1qAMOZ
 YrM519Zwpt4zkrVFYCaiNxtdaCjFyQyGEZObWDNyH3AHMGM4uu+C5xxxpeRYmQflDRrB
 K+z6Z/iHywPSE3ln5oe9CSId2L+9Nf7SmxngjrX29PQupC8KRDQO8OAbmgjBgwBu/dUE
 Kp4w==
X-Gm-Message-State: AOAM532e7wewAwG0adFsp1Oxnmf3xzlekoMY0GLCWYdMVB26iFhCNWw4
 veEA86YLkqccfxGMFFb75GB+azqhgDBnwCP+d1/CwgggaAwq/3h8rdSowJQokMZDVZ2p2pWvWx2
 fe/RRLvJgR9zEEYpl72wO5oVWR0gHTmc=
X-Received: by 2002:a17:902:b60d:b029:e6:7a9:7f4 with SMTP id
 b13-20020a170902b60db02900e607a907f4mr25288774pls.3.1618214771141; 
 Mon, 12 Apr 2021 01:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPrCx59MXn2Ku9/5i0jmH/l0FIUWxJonQgQUz1rL1CGgZvwSQh00LNlQM01AktYH3B9evCbegd7NXkuYLiVTk=
X-Received: by 2002:a17:902:b60d:b029:e6:7a9:7f4 with SMTP id
 b13-20020a170902b60db02900e607a907f4mr25288749pls.3.1618214770764; Mon, 12
 Apr 2021 01:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210408093824.14985-1-lulu@redhat.com>
 <20210408093824.14985-4-lulu@redhat.com>
 <db1a8ee2-c9ca-785e-fec3-772bd1cef5e1@redhat.com>
In-Reply-To: <db1a8ee2-c9ca-785e-fec3-772bd1cef5e1@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 12 Apr 2021 16:05:32 +0800
Message-ID: <CACLfguUvQkRPe24KCzc7iugeP6-z01hva=qTHmLQXCG6NgvWLQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] virtio:add support in configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 9, 2021 at 3:21 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/4/8 =E4=B8=8B=E5=8D=885:38, Cindy Lu =E5=86=99=E9=81=93:
> > Add configure notifier support in virtio and related driver
> > When peer is vhost vdpa, setup the configure interrupt function
> > vhost_net_start and release the resource when vhost_net_stop
>
>
> Actually, this is the vhost support for config interrupt.
>
>
sure will fix this
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/net/vhost_net.c         |  9 +++++++++
> >   hw/net/virtio-net.c        |  6 ++++++
> >   hw/virtio/vhost.c          | 38 +++++++++++++++++++++++++++++++++++++=
-
> >   hw/virtio/virtio.c         | 25 +++++++++++++++++++++++++
> >   include/hw/virtio/vhost.h  |  3 +++
> >   include/hw/virtio/virtio.h |  5 +++++
> >   include/net/vhost_net.h    |  3 +++
> >   7 files changed, 88 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 24d555e764..12e30dc25e 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -426,6 +426,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, =
VirtIODevice *dev,
> >       vhost_virtqueue_mask(&net->dev, dev, idx, mask);
> >   }
> >
> > +bool vhost_net_config_pending(VHostNetState *net, int idx)
> > +{
> > +    return vhost_config_pending(&net->dev, idx);
> > +}
> > +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
> > +                              bool mask)
> > +{
> > +    vhost_config_mask(&net->dev, dev,  mask);
> > +}
> >   VHostNetState *get_vhost_net(NetClientState *nc)
> >   {
> >       VHostNetState *vhost_net =3D 0;
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 00d95e6615..e30a7d9835 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3064,6 +3064,9 @@ static bool virtio_net_guest_notifier_pending(Vir=
tIODevice *vdev, int idx,
> >       if (type =3D=3D VIRTIO_VQ_VECTOR) {
> >           return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), i=
dx);
> >       }
> > +    if (type =3D=3D VIRTIO_CONFIG_VECTOR) {
> > +        return vhost_net_config_pending(get_vhost_net(nc->peer), idx);
> > +    }
> >       return false;
> >   }
> >
> > @@ -3076,6 +3079,9 @@ static void virtio_net_guest_notifier_mask(VirtIO=
Device *vdev, int idx,
> >       if (type =3D=3D VIRTIO_VQ_VECTOR) {
> >           vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, =
mask);
> >        }
> > +    if (type =3D=3D VIRTIO_CONFIG_VECTOR) {
> > +        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
> > +     }
> >   }
> >
> >   static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_fe=
atures)
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 614ccc2bcb..b5e915d5cf 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -1313,6 +1313,10 @@ int vhost_dev_init(struct vhost_dev *hdev, void =
*opaque,
> >               goto fail;
> >           }
> >       }
> > +    r =3D event_notifier_init(&hdev->masked_config_notifier, 0);
> > +    if (r < 0) {
> > +        return r;
> > +    }
> >
> >       if (busyloop_timeout) {
> >           for (i =3D 0; i < hdev->nvqs; ++i) {
> > @@ -1405,6 +1409,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
> >       for (i =3D 0; i < hdev->nvqs; ++i) {
> >           vhost_virtqueue_cleanup(hdev->vqs + i);
> >       }
> > +    event_notifier_cleanup(&hdev->masked_config_notifier);
> >       if (hdev->mem) {
> >           /* those are only safe after successful init */
> >           memory_listener_unregister(&hdev->memory_listener);
> > @@ -1498,6 +1503,10 @@ bool vhost_virtqueue_pending(struct vhost_dev *h=
dev, int n)
> >       return event_notifier_test_and_clear(&vq->masked_notifier);
> >   }
> >
> > +bool vhost_config_pending(struct vhost_dev *hdev, int n)
> > +{
> > +    return event_notifier_test_and_clear(&hdev->masked_config_notifier=
);
> > +}
> >   /* Mask/unmask events from this vq. */
> >   void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev,=
 int n,
> >                            bool mask)
> > @@ -1522,6 +1531,28 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev=
, VirtIODevice *vdev, int n,
> >           VHOST_OPS_DEBUG("vhost_set_vring_call failed");
> >       }
> >   }
> > +void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev,
> > +                         bool mask)
> > +{
> > +   int fd;
> > +   int r;
> > +   EventNotifier *masked_config_notifier =3D &hdev->masked_config_noti=
fier;
> > +   EventNotifier *config_notifier =3D &vdev->config_notifier;
> > +   if (vdev->use_config_notifier !=3D true) {
> > +        return;
> > +    }
> > +    assert(hdev->vhost_ops);
> > +    if (mask) {
> > +        assert(vdev->use_guest_notifier_mask);
> > +        fd =3D event_notifier_get_fd(masked_config_notifier);
> > +    } else {
> > +        fd =3D event_notifier_get_fd(config_notifier);
> > +    }
> > +   r =3D hdev->vhost_ops->vhost_set_config_call(hdev, &fd);
> > +   if (r < 0) {
> > +        error_report("vhost_set_config_call failed");
> > +    }
> > +}
> >
> >   uint64_t vhost_get_features(struct vhost_dev *hdev, const int *featur=
e_bits,
> >                               uint64_t features)
> > @@ -1732,7 +1763,12 @@ int vhost_dev_start(struct vhost_dev *hdev, Virt=
IODevice *vdev)
> >               goto fail_vq;
> >           }
> >       }
> > -
> > +    if (vdev->use_config_notifier =3D=3D true) {
> > +        event_notifier_test_and_clear(&hdev->masked_config_notifier);
> > +        if (!vdev->use_guest_notifier_mask) {
> > +            vhost_config_mask(hdev, vdev,  false);
> > +        }
> > +    }
> >       if (hdev->log_enabled) {
> >           uint64_t log_base;
> >
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index ceb58fda6c..774ac3893b 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -3278,6 +3278,7 @@ void virtio_init(VirtIODevice *vdev, const char *=
name,
> >               virtio_vmstate_change, vdev);
> >       vdev->device_endian =3D virtio_default_endian();
> >       vdev->use_guest_notifier_mask =3D true;
> > +    vdev->use_config_notifier =3D false;
>
>
> It's still unclear to me why we need use_config_notifier. What happens
> if we don't have that?
>
> Thanks
I just want to reduce the impact of code changes. only the driver
support  config interrupt will
run the process of handle configure interrupt,
but it should also work well if the driver does not support config
interrupt  with an interrupt  never trigger.
Sure. I will remove this bit and try again

>
>
> >   }
> >
> >   /*
> > @@ -3502,6 +3503,16 @@ static void virtio_queue_guest_notifier_read(Eve=
ntNotifier *n)
> >       }
> >   }
> >
> > +static void virtio_config_read(EventNotifier *n)
> > +{
> > +    VirtIODevice *vdev =3D container_of(n, VirtIODevice, config_notifi=
er);
> > +    if (vdev->use_config_notifier =3D=3D false) {
> > +        return;
> > +    }
> > +    if (event_notifier_test_and_clear(n)) {
> > +        virtio_notify_config(vdev);
> > +    }
> > +}
> >   void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool a=
ssign,
> >                                                   bool with_irqfd)
> >   {
> > @@ -3517,6 +3528,16 @@ void virtio_queue_set_guest_notifier_fd_handler(=
VirtQueue *vq, bool assign,
> >           virtio_queue_guest_notifier_read(&vq->guest_notifier);
> >       }
> >   }
> > +void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool as=
sign,
> > +                                                bool with_irqfd)
> > +{
> > +    if (assign && !with_irqfd) {
> > +        event_notifier_set_handler(&vdev->config_notifier,
> > +                                   virtio_config_read);
> > +    } else {
> > +       event_notifier_set_handler(&vdev->config_notifier, NULL);
> > +    }
> > +}
> >
> >   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
> >   {
> > @@ -3591,6 +3612,10 @@ EventNotifier *virtio_queue_get_host_notifier(Vi=
rtQueue *vq)
> >       return &vq->host_notifier;
> >   }
> >
> > +EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev)
> > +{
> > +    return &vdev->config_notifier;
> > +}
> >   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabl=
ed)
> >   {
> >       vq->host_notifier_enabled =3D enabled;
> > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > index 4a8bc75415..22efa7008e 100644
> > --- a/include/hw/virtio/vhost.h
> > +++ b/include/hw/virtio/vhost.h
> > @@ -91,6 +91,7 @@ struct vhost_dev {
> >       QLIST_HEAD(, vhost_iommu) iommu_list;
> >       IOMMUNotifier n;
> >       const VhostDevConfigOps *config_ops;
> > +    EventNotifier masked_config_notifier;
> >   };
> >
> >   struct vhost_net {
> > @@ -108,6 +109,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIOD=
evice *vdev);
> >   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> >   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *=
vdev);
> >   void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice=
 *vdev);
> > +bool vhost_config_pending(struct vhost_dev *hdev, int n);
> > +void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev,  bo=
ol mask);
> >
> >   /* Test and clear masked event pending status.
> >    * Should be called after unmask to avoid losing events.
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index 5a1940fe70..fd17dbb097 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -113,6 +113,8 @@ struct VirtIODevice
> >       bool use_guest_notifier_mask;
> >       AddressSpace *dma_as;
> >       QLIST_HEAD(, VirtQueue) *vector_queues;
> > +    EventNotifier config_notifier;
> > +    bool use_config_notifier;
> >   };
> >
> >   struct VirtioDeviceClass {
> > @@ -315,11 +317,14 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
> >   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
> >   void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool a=
ssign,
> >                                                   bool with_irqfd);
> > +void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool as=
sign,
> > +                                                bool with_irqfd);
> >   int virtio_device_start_ioeventfd(VirtIODevice *vdev);
> >   int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
> >   void virtio_device_release_ioeventfd(VirtIODevice *vdev);
> >   bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
> >   EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
> > +EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev);
> >   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabl=
ed);
> >   void virtio_queue_host_notifier_read(EventNotifier *n);
> >   void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioCon=
text *ctx,
> > diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> > index 172b0051d8..0d38c97c94 100644
> > --- a/include/net/vhost_net.h
> > +++ b/include/net/vhost_net.h
> > @@ -36,6 +36,9 @@ int vhost_net_set_config(struct vhost_net *net, const=
 uint8_t *data,
> >   bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
> >   void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
> >                                 int idx, bool mask);
> > +bool vhost_net_config_pending(VHostNetState *net, int n);
> > +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
> > +                              bool mask);
> >   int vhost_net_notify_migration_done(VHostNetState *net, char* mac_add=
r);
> >   VHostNetState *get_vhost_net(NetClientState *nc);
> >
>


