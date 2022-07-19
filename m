Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BCA579E38
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:59:05 +0200 (CEST)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmoa-0002mc-6R
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oDmju-0004qL-6O
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:54:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oDmjs-0000aQ-AX
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658235251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xHj/iIkA79NMvQUEXiKnm+KeLEbOaYl+CRFmTfWDWM=;
 b=AgcM1udr6rbtDK/NiGjsiaCccB89z0q4OCzZFlYjCzfgJEGqpxz6xrNYgPVdGYytOJ8hiC
 NcKIjQcR4Tgy+1hfkZ8QePa65+zGjmnSnr9PO6lIgHjP39cWyMTExzc50JnmeVUp5gy/hR
 t1mmeA1BY9/AY5DPWBhm2BnuKi2O0J0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-ZpRpnZYbO7yfSesmmaDFjw-1; Tue, 19 Jul 2022 08:54:10 -0400
X-MC-Unique: ZpRpnZYbO7yfSesmmaDFjw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hb41-20020a170907162900b0072f044ca263so1873495ejc.15
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7xHj/iIkA79NMvQUEXiKnm+KeLEbOaYl+CRFmTfWDWM=;
 b=Eme44NC1DE0NXmilOtsogpwMBrHvRzQCwGTY8KXTNsVK8JUwh9WqEoep8afvX6fbdd
 bK/61NcoLe3uKdayhwRpsD0PC5SPccQS/mpImy++X9oYalaj+FFJaaBaw6yBmYg/LbWe
 502VewKVBzZyp0OfkkjbP74yA3OqwWucaCZ5D7eOjwtE8X5HoqXxW+KpDMgU0zJ/IXHb
 vYON07ZpWZcVQ3IMMKUFXeqpKOMJAb25TRePN+gyM/Ph8FuhAiuQMx3PvSl7GU9YxB9p
 w3eQiZYeZra9h2oaoo5Vjhgl1AGPNV44y6L/6Nfd+T9zxaOfjcTDfdlQ2MkjpefetI0z
 pDZA==
X-Gm-Message-State: AJIora81RDYIqIoE7YDnrimSeATytOm4gHgYgSoQNQOT1QkJDBytdagB
 joTYSPIi+80Iw98ATF3yOJo8JQSLtIexVsceXyEXF36i91X6zOXdcZ8G9sohMVEuXu96wMzVcqc
 FWcZU8hm1OY4eG6/PKPqMx6DSJ6ok4fM=
X-Received: by 2002:a05:6402:11cb:b0:43a:b592:efbb with SMTP id
 j11-20020a05640211cb00b0043ab592efbbmr43473231edw.157.1658235248735; 
 Tue, 19 Jul 2022 05:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tPIJ9ngp5SLg2tbQB7ngZviq/C2rQ4YYAYj6ShSwU0PrV80QWHzhMi/Vyha5VESh+RhXUCRolNNC7uxAGZy+4=
X-Received: by 2002:a05:6402:11cb:b0:43a:b592:efbb with SMTP id
 j11-20020a05640211cb00b0043ab592efbbmr43473203edw.157.1658235248473; Tue, 19
 Jul 2022 05:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220711155243.866530-2-lulu@redhat.com>
 <48006fbf-b848-829c-fe0b-e2bc51f9563c@redhat.com>
In-Reply-To: <48006fbf-b848-829c-fe0b-e2bc51f9563c@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Tue, 19 Jul 2022 20:53:32 +0800
Message-ID: <CACLfguVnvEL3tjmK4-5b+HQjuh_1pv+HQxF9GZJpcS2N1xMcrA@mail.gmail.com>
Subject: Re: [PATCH v11 01/10] virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
To: Jason Wang <jasowang@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

On Tue, Jul 19, 2022 at 4:58 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/11 23:52, Cindy Lu =E5=86=99=E9=81=93:
> > To support configure interrupt for vhost-vdpa
> > Introduce VIRTIO_CONFIG_IRQ_IDX -1 as configure interrupt's queue index=
,
> > Then we can reuse the functions guest_notifier_mask and guest_notifier_=
pending.
> > Add the check of queue index in these drivers, if the driver does not s=
upport
> > configure interrupt, the function will just return
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
>
>
> A typo in the subject should be "VIRTIO_CONFIG_IRQ_IDX".
>
sure ,will fix this
>
> > ---
> >   hw/display/vhost-user-gpu.c    |  6 ++++++
> >   hw/net/virtio-net.c            | 10 ++++++++--
> >   hw/virtio/vhost-user-fs.c      |  6 ++++++
> >   hw/virtio/vhost-vsock-common.c |  6 ++++++
> >   hw/virtio/virtio-crypto.c      |  6 ++++++
> >   include/hw/virtio/virtio.h     |  3 +++
> >   6 files changed, 35 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> > index 09818231bd..d4a440e815 100644
> > --- a/hw/display/vhost-user-gpu.c
> > +++ b/hw/display/vhost-user-gpu.c
> > @@ -485,6 +485,9 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice =
*vdev, int idx)
> >   {
> >       VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
> >
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return false;
> > +    }
>
>
> I think we should either
>
> 1) explain why this check is needed
>
> or
>
> 2) defer this change to the patch that can actually hit this check
>
I will add the explanation for this , there may be cause some
unexpected behavior
Thanks
cindy
> Thanks
>
>
> >       return vhost_virtqueue_pending(&g->vhost->dev, idx);
> >   }
> >
> > @@ -493,6 +496,9 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vd=
ev, int idx, bool mask)
> >   {
> >       VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
> >
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return;
> > +    }
> >       vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
> >   }
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 1067e72b39..72ea4819f7 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3172,6 +3172,9 @@ static bool virtio_net_guest_notifier_pending(Vir=
tIODevice *vdev, int idx)
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> >       NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >       assert(n->vhost_started);
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return false;
> > +    }
> >       return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
> >   }
> >
> > @@ -3181,8 +3184,11 @@ static void virtio_net_guest_notifier_mask(VirtI=
ODevice *vdev, int idx,
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> >       NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >       assert(n->vhost_started);
> > -    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> > -                             vdev, idx, mask);
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return;
> > +    }
> > +
> > +    vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask)=
;
> >   }
> >
> >   static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_fe=
atures)
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index c595957983..9b0349922e 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -161,6 +161,9 @@ static void vuf_guest_notifier_mask(VirtIODevice *v=
dev, int idx,
> >   {
> >       VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> >
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return;
> > +    }
> >       vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
> >   }
> >
> > @@ -168,6 +171,9 @@ static bool vuf_guest_notifier_pending(VirtIODevice=
 *vdev, int idx)
> >   {
> >       VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> >
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return false;
> > +    }
> >       return vhost_virtqueue_pending(&fs->vhost_dev, idx);
> >   }
> >
> > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-com=
mon.c
> > index ed706681ac..b1f0d46209 100644
> > --- a/hw/virtio/vhost-vsock-common.c
> > +++ b/hw/virtio/vhost-vsock-common.c
> > @@ -125,6 +125,9 @@ static void vhost_vsock_common_guest_notifier_mask(=
VirtIODevice *vdev, int idx,
> >   {
> >       VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> >
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return;
> > +    }
> >       vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
> >   }
> >
> > @@ -133,6 +136,9 @@ static bool vhost_vsock_common_guest_notifier_pendi=
ng(VirtIODevice *vdev,
> >   {
> >       VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> >
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return false;
> > +    }
> >       return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
> >   }
> >
> > diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> > index dcd80b904d..7085643d5f 100644
> > --- a/hw/virtio/virtio-crypto.c
> > +++ b/hw/virtio/virtio-crypto.c
> > @@ -948,6 +948,9 @@ static void virtio_crypto_guest_notifier_mask(VirtI=
ODevice *vdev, int idx,
> >
> >       assert(vcrypto->vhost_started);
> >
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return;
> > +    }
> >       cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
> >   }
> >
> > @@ -958,6 +961,9 @@ static bool virtio_crypto_guest_notifier_pending(Vi=
rtIODevice *vdev, int idx)
> >
> >       assert(vcrypto->vhost_started);
> >
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return false;
> > +    }
> >       return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
> >   }
> >
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index b31c4507f5..4512205503 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -67,6 +67,9 @@ typedef struct VirtQueueElement
> >
> >   #define VIRTIO_NO_VECTOR 0xffff
> >
> > +/* special index value used internally for config irqs */
> > +#define VIRTIO_CONFIG_IRQ_IDX -1
> > +
> >   #define TYPE_VIRTIO_DEVICE "virtio-device"
> >   OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
> >
>


