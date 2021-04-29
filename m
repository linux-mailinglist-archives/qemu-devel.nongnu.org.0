Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16636E386
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 05:10:12 +0200 (CEST)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbx47-0008HM-VY
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 23:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbx2q-0007Uq-4O
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:08:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbx2o-0001eu-DD
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619665729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfwjVducmO+oPRAY4R/YnjhAEjR+98z+tQPFsUp+D5k=;
 b=EHwP6NVtEz7S4uEPuM2fAn8200VVgxXYdnyH0PkOWaXrkTQ2olsOCrilnPXk5qTeIsLzuL
 rPUhPrybhpL/ztocM1tAngj0LIG3rI6BFAV7WfpvHzTZsQ4UCJbq//oVMKDqjMvoxP2wVE
 qNP4wtQ0JcqqJXYvROr7L2xQlCarOHI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-sXe3pOQGOcCziPanDbfegQ-1; Wed, 28 Apr 2021 23:08:48 -0400
X-MC-Unique: sXe3pOQGOcCziPanDbfegQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 i8-20020a6548480000b02901fb8ebd5714so22417525pgs.12
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 20:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AfwjVducmO+oPRAY4R/YnjhAEjR+98z+tQPFsUp+D5k=;
 b=kMQ9ZDSEL7UZJUY5R7mUWzqKlCdJqjcA1rLPgop/EW3eS7kfk/gHk0wTFV1x4CeLJO
 4c0qOAUOr5Hms0jYZq6iDaRrSSuT0blhZOhGtKIXso3teJVybgOufP0J0UvWczqxN54q
 hwPm+Qj9tr1v2yl9KVmfKzOXVVyafEEmFT9r0+UQD+uyra3lWdkcrW+pqMu5s5koYpMz
 wlKLIC4steO9OBH/cvgR3GHTrWwQWi6KIvrBLgdKu69+sixvCtcmJYpAb33+SiNX5khF
 a9b5mzmdOUVS4c7gBunI2nxu2cfQ9TR7egcROmgiNDmoc1IfX0HlEPIb3lla6DUbfeKI
 k3pQ==
X-Gm-Message-State: AOAM532uPtOOSt6vwWLvjmqxfwExwkjj9iVVwxsdO9rvKacNHi13Caxl
 LvB0083gNkn3wdrUNgvV3OuylrdaOPnq2Wxky+nImxKHLz2ULNbHWQQaYhh5QQpe1LuWY87Ytv7
 Iy9IOcA1NwD0Iy+uwHks69qoeLU5gJkI=
X-Received: by 2002:a62:2a14:0:b029:263:20c5:6d8c with SMTP id
 q20-20020a622a140000b029026320c56d8cmr31652421pfq.23.1619665726898; 
 Wed, 28 Apr 2021 20:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhkjYzV5WsDsrNZDA2DSJv6Ci1dIwNt4tCCe9S5ADnl9TKwk4ReiT3AQ1Q9m3eMcBvA9xshmsKAPnwlo3WkCg=
X-Received: by 2002:a62:2a14:0:b029:263:20c5:6d8c with SMTP id
 q20-20020a622a140000b029026320c56d8cmr31652404pfq.23.1619665726586; Wed, 28
 Apr 2021 20:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210427033951.29805-1-lulu@redhat.com>
 <20210427033951.29805-2-lulu@redhat.com>
 <1d1c7244-ac00-94c0-8f53-90b1b93c41a0@redhat.com>
In-Reply-To: <1d1c7244-ac00-94c0-8f53-90b1b93c41a0@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 29 Apr 2021 11:08:10 +0800
Message-ID: <CACLfguU1Vg0YOYK9hzcbUp0pvJ+E7dhZBSbxKDUzERYLjevdDA@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] hw: Add check for queue number
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Apr 27, 2021 at 1:39 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/4/27 =E4=B8=8A=E5=8D=8811:39, Cindy Lu =E5=86=99=E9=81=93:
> > In order to support configure interrupt. we will use queue number -1
> > as configure interrupt
> > since all these device are not support the configure interrupt
> > So we will add an check here, if the idx is -1, the function
> > will return;
>
>
> The title is confusing since the change is specific for the guest notifie=
rs.
>
> A better one would be "virtio: guest notifier support for config interrup=
t"
>
sure, will fix this
>
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/display/vhost-user-gpu.c    |  8 ++++++--
> >   hw/net/virtio-net.c            | 10 +++++++---
> >   hw/virtio/vhost-user-fs.c      | 11 +++++++----
> >   hw/virtio/vhost-vsock-common.c |  8 ++++++--
> >   hw/virtio/virtio-crypto.c      |  8 ++++++--
> >   5 files changed, 32 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> > index 51f1747c4a..d8e26cedf1 100644
> > --- a/hw/display/vhost-user-gpu.c
> > +++ b/hw/display/vhost-user-gpu.c
> > @@ -490,7 +490,9 @@ static bool
> >   vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
> >   {
> >       VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
> > -
> > +    if (idx =3D=3D -1) {
>
>
> Let's introduce a macro for this instead of the magic number.
>
> Thanks
>
>
sure will fix this
> > +        return false;
> > +    }
> >       return vhost_virtqueue_pending(&g->vhost->dev, idx);
> >   }
> >
> > @@ -498,7 +500,9 @@ static void
> >   vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool =
mask)
> >   {
> >       VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
> > -
> > +    if (idx =3D=3D -1) {
> > +        return;
> > +    }
> >       vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
> >   }
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 9179013ac4..78ccaa228c 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3060,7 +3060,10 @@ static bool virtio_net_guest_notifier_pending(Vi=
rtIODevice *vdev, int idx)
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> >       NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >       assert(n->vhost_started);
> > -    return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
> > +    if (idx !=3D -1) {
> > +        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), id=
x);
> > +    }
> > +    return false;
> >   }
> >
> >   static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int id=
x,
> > @@ -3069,8 +3072,9 @@ static void virtio_net_guest_notifier_mask(VirtIO=
Device *vdev, int idx,
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> >       NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >       assert(n->vhost_started);
> > -    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> > -                             vdev, idx, mask);
> > +    if (idx !=3D -1) {
> > +        vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, m=
ask);
> > +     }
> >   }
> >
> >   static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_fe=
atures)
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index 1bc5d03a00..37424c2193 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -142,18 +142,21 @@ static void vuf_handle_output(VirtIODevice *vdev,=
 VirtQueue *vq)
> >        */
> >   }
> >
> > -static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
> > -                                            bool mask)
> > +static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx, bool =
mask)
> >   {
> >       VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > -
> > +    if (idx =3D=3D -1) {
> > +        return;
> > +    }
> >       vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
> >   }
> >
> >   static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
> >   {
> >       VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > -
> > +    if (idx =3D=3D -1) {
> > +        return false;
> > +    }
> >       return vhost_virtqueue_pending(&fs->vhost_dev, idx);
> >   }
> >
> > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-com=
mon.c
> > index 5b2ebf3496..0adf823d37 100644
> > --- a/hw/virtio/vhost-vsock-common.c
> > +++ b/hw/virtio/vhost-vsock-common.c
> > @@ -100,7 +100,9 @@ static void vhost_vsock_common_guest_notifier_mask(=
VirtIODevice *vdev, int idx,
> >                                               bool mask)
> >   {
> >       VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> > -
> > +    if (idx =3D=3D -1) {
> > +        return;
> > +    }
> >       vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
> >   }
> >
> > @@ -108,7 +110,9 @@ static bool vhost_vsock_common_guest_notifier_pendi=
ng(VirtIODevice *vdev,
> >                                                  int idx)
> >   {
> >       VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> > -
> > +    if (idx =3D=3D -1) {
> > +        return false;
> > +    }
> >       return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
> >   }
> >
> > diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> > index 54f9bbb789..c47f4ffb24 100644
> > --- a/hw/virtio/virtio-crypto.c
> > +++ b/hw/virtio/virtio-crypto.c
> > @@ -947,7 +947,9 @@ static void virtio_crypto_guest_notifier_mask(VirtI=
ODevice *vdev, int idx,
> >       int queue =3D virtio_crypto_vq2q(idx);
> >
> >       assert(vcrypto->vhost_started);
> > -
> > +    if (idx =3D=3D -1) {
> > +        return;
> > +    }
> >       cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
> >   }
> >
> > @@ -957,7 +959,9 @@ static bool virtio_crypto_guest_notifier_pending(Vi=
rtIODevice *vdev, int idx)
> >       int queue =3D virtio_crypto_vq2q(idx);
> >
> >       assert(vcrypto->vhost_started);
> > -
> > +    if (idx =3D=3D -1) {
> > +        return false;
> > +    }
> >       return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
> >   }
> >
>


