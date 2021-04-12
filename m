Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7313C35BBD0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:11:55 +0200 (CEST)
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVrfm-0001e8-J5
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVreS-00016y-RU
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:10:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVreO-00008V-Bh
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618215027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=utzyJdCYx2EYpSNdYivoIq9dkl9W5BD7DLoNJU1krL8=;
 b=SqpJP/voeaHnMXo20+8DwBSCN69Ff3zaIBST0a+sGn0tVnvejgWC/atOPRCmASMkI4IcFO
 /u6/CQp8LVtBShcZDKsody5BdpXkmLk7F4MvdOzraeQQ0V5HJxrZMUPbucFA2cJQ+uMUIL
 /CSAcAtdWteb6cD9oPoMSMUI/kWo1bg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-NtWJKWinMRG26bI5ZdHEGw-1; Mon, 12 Apr 2021 04:10:26 -0400
X-MC-Unique: NtWJKWinMRG26bI5ZdHEGw-1
Received: by mail-pf1-f199.google.com with SMTP id i23so3781139pfd.16
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 01:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=utzyJdCYx2EYpSNdYivoIq9dkl9W5BD7DLoNJU1krL8=;
 b=ZT9nGatILCwbuyygOXEX/wrxexvltQ0GUb5k4JNBX1/jplwvoQG1hElX2rlHt70oLA
 w+uHnKEt2o1fLT8RNPENvnOfLoBBoV0/9N1UWiIDEhDMbD0la3WSIoRh5i9mEPcEMw1p
 XGV25zo81IWOPYFwsCwZbsca8tPySqLlhiqI/GtAILzVzVwcnytSwqmDvfqsjqdHuMW+
 rP6GGDJubu7jFvIVGsBlm9kQCgaMY9gRiS7ylgEH3v23JC4S6aFG35x86dUv3h8+Pww1
 cOKNcFNXp5iV7rtBWPVzztTOeVvk1QwW+zdEw7k9Mri+9YnlOa8mOThrVyhqeSiiQ8oT
 toRQ==
X-Gm-Message-State: AOAM533n/+GIHmedwu/59OVjIzxcp88irRcuPHYxQNAVs0RPTSn/qh8G
 fcHuMnPHockIYyL1eHzMCbic8318BbQLZcXhPS+Eb3Pbry3LUmtVvr34OIDDCM310cp9D76HC25
 RHGOPBbP7HDYuw59C+nCkq/Q9Po9XsGA=
X-Received: by 2002:a62:5bc1:0:b029:246:fc8a:6d9b with SMTP id
 p184-20020a625bc10000b0290246fc8a6d9bmr14065772pfb.42.1618215024731; 
 Mon, 12 Apr 2021 01:10:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQz1+/4SzUMogHTNMBRzhccVhP6QzPyyyljhaEysqUN0NCToraAcYOV1Iyeu1Wlt85H3Ck27+/LHIX3uqQfx0=
X-Received: by 2002:a62:5bc1:0:b029:246:fc8a:6d9b with SMTP id
 p184-20020a625bc10000b0290246fc8a6d9bmr14065746pfb.42.1618215024264; Mon, 12
 Apr 2021 01:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210408093824.14985-1-lulu@redhat.com>
 <20210408093824.14985-2-lulu@redhat.com>
 <60d05532-8528-a5ee-777c-7afac1fc5c00@redhat.com>
In-Reply-To: <60d05532-8528-a5ee-777c-7afac1fc5c00@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 12 Apr 2021 16:09:46 +0800
Message-ID: <CACLfguW_baXwc16p4fT==R7ByKX5oijT9a9eLKagwi2SUirqsA@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] virtio: introduce new type in interrupt process
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

On Fri, Apr 9, 2021 at 2:57 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/4/8 =E4=B8=8B=E5=8D=885:38, Cindy Lu =E5=86=99=E9=81=93:
> > To support config interrupt we need to add
> > a new type of interrupt process. So we introduce
> > the vector type
> > enum virtio_vector_type {
> > =E8=81=BD =E8=81=BD =E8=81=BD =E8=81=BD VIRTIO_VQ_VECTOR,
> > =E8=81=BD =E8=81=BD =E8=81=BD =E8=81=BD VIRTIO_CONFIG_VECTOR,
> > =E8=81=BD =E8=81=BD =E8=81=BD =E8=81=BD VIRTIO_VECTOR_UNKNOWN,
> > =E8=81=BD =E8=81=BD };
> > =E8=81=BD =E8=81=BD
>
>
> I see some tranditiaonl chinese characters here.
>
> Plaese correctly congirue your locale.
>
sure will fix this
> So consider we use int for queue_index, can we simply use -1 as a hint
> for the config interrupt then there's no need for this extra enum?
>
that's a good idea, I will rewrite this part
>
> > Now the bus which support configure interrupt is
> > virtio-mmio and vritio-pci. For other drivers, the function will
> > only check if the interrupt type is the VIRTIO_CONFIG_VQ. If not
> > the function will fail.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/display/vhost-user-gpu.c    | 14 +++++---
> >   hw/net/virtio-net.c            | 15 +++++---
> >   hw/s390x/virtio-ccw.c          |  6 ++--
> >   hw/virtio/vhost-user-fs.c      | 12 ++++---
> >   hw/virtio/vhost-vsock-common.c | 12 ++++---
> >   hw/virtio/virtio-crypto.c      | 13 ++++---
> >   hw/virtio/virtio-mmio.c        |  2 +-
> >   hw/virtio/virtio-pci.c         | 66 ++++++++++++++++++++-------------=
-
> >   include/hw/virtio/virtio.h     |  9 +++--
> >   9 files changed, 95 insertions(+), 54 deletions(-)
> >
> > diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> > index 51f1747c4a..959ad115b6 100644
> > --- a/hw/display/vhost-user-gpu.c
> > +++ b/hw/display/vhost-user-gpu.c
> > @@ -487,18 +487,24 @@ vhost_user_gpu_set_status(VirtIODevice *vdev, uin=
t8_t val)
> >   }
> >
> >   static bool
> > -vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
> > +vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx,
> > +                                            int type)
> >   {
> >       VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
> > -
> > +    if (type !=3D VIRTIO_VQ_VECTOR) {
> > +        return false;
> > +    }
> >       return vhost_virtqueue_pending(&g->vhost->dev, idx);
> >   }
> >
> >   static void
> > -vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool m=
ask)
> > +vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool m=
ask,
> > +                                        int type)
> >   {
> >       VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
> > -
> > +    if (type !=3D VIRTIO_VQ_VECTOR) {
> > +        return;
> > +    }
> >       vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
> >   }
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 9179013ac4..00d95e6615 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3055,22 +3055,27 @@ static NetClientInfo net_virtio_info =3D {
> >       .announce =3D virtio_net_announce,
> >   };
> >
> > -static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int =
idx)
> > +static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int =
idx,
> > +                                int type)
> >   {
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> >       NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >       assert(n->vhost_started);
> > -    return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
> > +    if (type =3D=3D VIRTIO_VQ_VECTOR) {
> > +        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), id=
x);
> > +    }
> > +    return false;
> >   }
> >
> >   static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int id=
x,
> > -                                           bool mask)
> > +                                           bool mask, int type)
> >   {
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> >       NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >       assert(n->vhost_started);
> > -    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> > -                             vdev, idx, mask);
> > +    if (type =3D=3D VIRTIO_VQ_VECTOR) {
> > +        vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, m=
ask);
> > +     }
> >   }
> >
> >   static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_fe=
atures)
> > diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> > index 4582e94ae7..234f749548 100644
> > --- a/hw/s390x/virtio-ccw.c
> > +++ b/hw/s390x/virtio-ccw.c
> > @@ -1003,16 +1003,16 @@ static int virtio_ccw_set_guest_notifier(Virtio=
CcwDevice *dev, int n,
> >            * need to manually trigger any guest masking callbacks here.
> >            */
> >           if (k->guest_notifier_mask && vdev->use_guest_notifier_mask) =
{
> > -            k->guest_notifier_mask(vdev, n, false);
> > +            k->guest_notifier_mask(vdev, n, false, VIRTIO_VQ_VECTOR);
> >           }
> >           /* get lost events and re-inject */
> >           if (k->guest_notifier_pending &&
> > -            k->guest_notifier_pending(vdev, n)) {
> > +            k->guest_notifier_pending(vdev, n, VIRTIO_VQ_VECTOR)) {
> >               event_notifier_set(notifier);
> >           }
> >       } else {
> >           if (k->guest_notifier_mask && vdev->use_guest_notifier_mask) =
{
> > -            k->guest_notifier_mask(vdev, n, true);
> > +            k->guest_notifier_mask(vdev, n, true, VIRTIO_VQ_VECTOR);
> >           }
> >           if (with_irqfd) {
> >               virtio_ccw_remove_irqfd(dev, n);
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index 1bc5d03a00..22358767f1 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -143,17 +143,21 @@ static void vuf_handle_output(VirtIODevice *vdev,=
 VirtQueue *vq)
> >   }
> >
> >   static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
> > -                                            bool mask)
> > +                                            bool mask, int type)
> >   {
> >       VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > -
> > +    if (type !=3D VIRTIO_VQ_VECTOR) {
> > +        return;
> > +    }
> >       vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
> >   }
> >
> > -static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
> > +static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx, in=
t type)
> >   {
> >       VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > -
> > +    if (type !=3D VIRTIO_VQ_VECTOR) {
> > +        return false;
> > +     }
> >       return vhost_virtqueue_pending(&fs->vhost_dev, idx);
> >   }
> >
> > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-com=
mon.c
> > index 5b2ebf3496..92c133c54c 100644
> > --- a/hw/virtio/vhost-vsock-common.c
> > +++ b/hw/virtio/vhost-vsock-common.c
> > @@ -97,18 +97,22 @@ static void vhost_vsock_common_handle_output(VirtIO=
Device *vdev, VirtQueue *vq)
> >   }
> >
> >   static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev=
, int idx,
> > -                                            bool mask)
> > +                                            bool mask, int type)
> >   {
> >       VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> > -
> > +    if (type !=3D VIRTIO_VQ_VECTOR) {
> > +        return;
> > +    }
> >       vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
> >   }
> >
> >   static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *v=
dev,
> > -                                               int idx)
> > +                                               int idx, int type)
> >   {
> >       VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> > -
> > +    if (type !=3D VIRTIO_VQ_VECTOR) {
> > +        return false;
> > +    }
> >       return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
> >   }
> >
> > diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> > index 54f9bbb789..ab7958465c 100644
> > --- a/hw/virtio/virtio-crypto.c
> > +++ b/hw/virtio/virtio-crypto.c
> > @@ -941,23 +941,28 @@ static void virtio_crypto_set_status(VirtIODevice=
 *vdev, uint8_t status)
> >   }
> >
> >   static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int=
 idx,
> > -                                           bool mask)
> > +                                           bool mask, int type)
> >   {
> >       VirtIOCrypto *vcrypto =3D VIRTIO_CRYPTO(vdev);
> >       int queue =3D virtio_crypto_vq2q(idx);
> >
> >       assert(vcrypto->vhost_started);
> > -
> > +    if (type !=3D VIRTIO_VQ_VECTOR) {
> > +        return;
> > +    }
> >       cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
> >   }
> >
> > -static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, i=
nt idx)
> > +static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, i=
nt idx,
> > +                                           int type)
> >   {
> >       VirtIOCrypto *vcrypto =3D VIRTIO_CRYPTO(vdev);
> >       int queue =3D virtio_crypto_vq2q(idx);
> >
> >       assert(vcrypto->vhost_started);
> > -
> > +    if (type !=3D VIRTIO_VQ_VECTOR) {
> > +        return false;
> > +    }
> >       return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
> >   }
> >
> > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> > index e1b5c3b81e..1aa1aaeca4 100644
> > --- a/hw/virtio/virtio-mmio.c
> > +++ b/hw/virtio/virtio-mmio.c
> > @@ -627,7 +627,7 @@ static int virtio_mmio_set_guest_notifier(DeviceSta=
te *d, int n, bool assign,
> >       }
> >
> >       if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
> > -        vdc->guest_notifier_mask(vdev, n, !assign);
> > +        vdc->guest_notifier_mask(vdev, n, !assign, VIRTIO_VQ_VECTOR);
> >       }
> >
> >       return 0;
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 36524a5728..481f6e7505 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -691,23 +691,17 @@ static void kvm_virtio_pci_vq_vector_release(Virt=
IOPCIProxy *proxy,
> >   }
> >
> >   static int kvm_virtio_pci_irqfd_use(VirtIOPCIProxy *proxy,
> > -                                 unsigned int queue_no,
> > +                                 EventNotifier *n,
> >                                    unsigned int vector)
>
>
> All the changes of switching to use EventNotifier should be done as a
> separate patch.
>
> Thanks
>
sure will fix this
>
> >   {
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> > -    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > -    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > -    EventNotifier *n =3D virtio_queue_get_guest_notifier(vq);
> >       return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irq=
fd->virq);
> >   }
> >
> >   static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
> > -                                      unsigned int queue_no,
> > +                                      EventNotifier *n ,
> >                                         unsigned int vector)
> >   {
> > -    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > -    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > -    EventNotifier *n =3D virtio_queue_get_guest_notifier(vq);
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> >       int ret;
> >
> > @@ -722,7 +716,8 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy=
 *proxy, int nvqs)
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> >       unsigned int vector;
> >       int ret, queue_no;
> > -
> > +    VirtQueue *vq;
> > +    EventNotifier *n;
> >       for (queue_no =3D 0; queue_no < nvqs; queue_no++) {
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> >               break;
> > @@ -739,7 +734,9 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy=
 *proxy, int nvqs)
> >            * Otherwise, delay until unmasked in the frontend.
> >            */
> >           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) =
{
> > -            ret =3D kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> > +            vq =3D virtio_get_queue(vdev, queue_no);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            ret =3D kvm_virtio_pci_irqfd_use(proxy, n, vector);
> >               if (ret < 0) {
> >                   kvm_virtio_pci_vq_vector_release(proxy, vector);
> >                   goto undo;
> > @@ -755,7 +752,9 @@ undo:
> >               continue;
> >           }
> >           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) =
{
> > -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> > +            vq =3D virtio_get_queue(vdev, queue_no);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> >           }
> >           kvm_virtio_pci_vq_vector_release(proxy, vector);
> >       }
> > @@ -769,7 +768,8 @@ static void kvm_virtio_pci_vector_release(VirtIOPCI=
Proxy *proxy, int nvqs)
> >       unsigned int vector;
> >       int queue_no;
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > -
> > +    VirtQueue *vq;
> > +    EventNotifier *n;
> >       for (queue_no =3D 0; queue_no < nvqs; queue_no++) {
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> >               break;
> > @@ -782,7 +782,9 @@ static void kvm_virtio_pci_vector_release(VirtIOPCI=
Proxy *proxy, int nvqs)
> >            * Otherwise, it was cleaned when masked in the frontend.
> >            */
> >           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) =
{
> > -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> > +            vq =3D virtio_get_queue(vdev, queue_no);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> >           }
> >           kvm_virtio_pci_vq_vector_release(proxy, vector);
> >       }
> > @@ -791,12 +793,12 @@ static void kvm_virtio_pci_vector_release(VirtIOP=
CIProxy *proxy, int nvqs)
> >   static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
> >                                          unsigned int queue_no,
> >                                          unsigned int vector,
> > -                                       MSIMessage msg)
> > +                                       MSIMessage msg,
> > +                                       int type,
> > +                                        EventNotifier *n)
> >   {
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > -    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > -    EventNotifier *n =3D virtio_queue_get_guest_notifier(vq);
> >       VirtIOIRQFD *irqfd;
> >       int ret =3D 0;
> >
> > @@ -816,21 +818,23 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIP=
roxy *proxy,
> >        * Otherwise, set it up now.
> >        */
> >       if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> > -        k->guest_notifier_mask(vdev, queue_no, false);
> > +        k->guest_notifier_mask(vdev, queue_no, false, type);
> >           /* Test after unmasking to avoid losing events. */
> >           if (k->guest_notifier_pending &&
> > -            k->guest_notifier_pending(vdev, queue_no)) {
> > +            k->guest_notifier_pending(vdev, queue_no, type)) {
> >               event_notifier_set(n);
> >           }
> >       } else {
> > -        ret =3D kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> > +        ret =3D kvm_virtio_pci_irqfd_use(proxy, n, vector);
> >       }
> >       return ret;
> >   }
> >
> >   static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
> >                                                unsigned int queue_no,
> > -                                             unsigned int vector)
> > +                                             unsigned int vector,
> > +                                             int type,
> > +                                             EventNotifier *n)
> >   {
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > @@ -839,9 +843,9 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProx=
y *proxy,
> >        * Otherwise, clean it up now.
> >        */
> >       if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> > -        k->guest_notifier_mask(vdev, queue_no, true);
> > +        k->guest_notifier_mask(vdev, queue_no, true, type);
> >       } else {
> > -        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> > +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
> >       }
> >   }
> >
> > @@ -851,6 +855,7 @@ static int virtio_pci_vector_unmask(PCIDevice *dev,=
 unsigned vector,
> >       VirtIOPCIProxy *proxy =3D container_of(dev, VirtIOPCIProxy, pci_d=
ev);
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       VirtQueue *vq =3D virtio_vector_first_queue(vdev, vector);
> > +    EventNotifier *n;
> >       int ret, index, unmasked =3D 0;
> >
> >       while (vq) {
> > @@ -859,7 +864,9 @@ static int virtio_pci_vector_unmask(PCIDevice *dev,=
 unsigned vector,
> >               break;
> >           }
> >           if (index < proxy->nvqs_with_notifiers) {
> > -            ret =3D virtio_pci_vq_vector_unmask(proxy, index, vector, =
msg);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            ret =3D virtio_pci_vq_vector_unmask(proxy, index, vector, =
msg,
> > +                        VIRTIO_VQ_VECTOR, n);
> >               if (ret < 0) {
> >                   goto undo;
> >               }
> > @@ -875,7 +882,9 @@ undo:
> >       while (vq && unmasked >=3D 0) {
> >           index =3D virtio_get_queue_index(vq);
> >           if (index < proxy->nvqs_with_notifiers) {
> > -            virtio_pci_vq_vector_mask(proxy, index, vector);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            virtio_pci_vq_vector_mask(proxy, index, vector,
> > +                 VIRTIO_VQ_VECTOR, n);
> >               --unmasked;
> >           }
> >           vq =3D virtio_vector_next_queue(vq);
> > @@ -888,15 +897,18 @@ static void virtio_pci_vector_mask(PCIDevice *dev=
, unsigned vector)
> >       VirtIOPCIProxy *proxy =3D container_of(dev, VirtIOPCIProxy, pci_d=
ev);
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       VirtQueue *vq =3D virtio_vector_first_queue(vdev, vector);
> > +    EventNotifier *n;
> >       int index;
> >
> >       while (vq) {
> >           index =3D virtio_get_queue_index(vq);
> > +         n =3D virtio_queue_get_guest_notifier(vq);
> >           if (!virtio_queue_get_num(vdev, index)) {
> >               break;
> >           }
> >           if (index < proxy->nvqs_with_notifiers) {
> > -            virtio_pci_vq_vector_mask(proxy, index, vector);
> > +            virtio_pci_vq_vector_mask(proxy, index, vector,
> > +                VIRTIO_VQ_VECTOR, n);
> >           }
> >           vq =3D virtio_vector_next_queue(vq);
> >       }
> > @@ -926,7 +938,7 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
> >           vq =3D virtio_get_queue(vdev, queue_no);
> >           notifier =3D virtio_queue_get_guest_notifier(vq);
> >           if (k->guest_notifier_pending) {
> > -            if (k->guest_notifier_pending(vdev, queue_no)) {
> > +            if (k->guest_notifier_pending(vdev, queue_no, VIRTIO_VQ_VE=
CTOR)) {
> >                   msix_set_pending(dev, vector);
> >               }
> >           } else if (event_notifier_test_and_clear(notifier)) {
> > @@ -958,7 +970,7 @@ static int virtio_pci_set_guest_notifier(DeviceStat=
e *d, int n, bool assign,
> >       if (!msix_enabled(&proxy->pci_dev) &&
> >           vdev->use_guest_notifier_mask &&
> >           vdc->guest_notifier_mask) {
> > -        vdc->guest_notifier_mask(vdev, n, !assign);
> > +        vdc->guest_notifier_mask(vdev, n, !assign, VIRTIO_VQ_VECTOR);
> >       }
> >
> >       return 0;
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index b7ece7a6a8..5a1940fe70 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -67,6 +67,11 @@ typedef struct VirtQueueElement
> >
> >   #define VIRTIO_NO_VECTOR 0xffff
> >
> > +enum virtio_vector_type {
> > +    VIRTIO_VQ_VECTOR,
> > +    VIRTIO_CONFIG_VECTOR,
> > +    VIRTIO_VECTOR_UNKNOWN,
> > +};
> >   #define TYPE_VIRTIO_DEVICE "virtio-device"
> >   OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
> >
> > @@ -138,13 +143,13 @@ struct VirtioDeviceClass {
> >        * If backend does not support masking,
> >        * must check in frontend instead.
> >        */
> > -    bool (*guest_notifier_pending)(VirtIODevice *vdev, int n);
> > +    bool (*guest_notifier_pending)(VirtIODevice *vdev, int n, int type=
);
> >       /* Mask/unmask events from this vq. Any events reported
> >        * while masked will become pending.
> >        * If backend does not support masking,
> >        * must mask in frontend instead.
> >        */
> > -    void (*guest_notifier_mask)(VirtIODevice *vdev, int n, bool mask);
> > +    void (*guest_notifier_mask)(VirtIODevice *vdev, int n, bool mask, =
int type);
> >       int (*start_ioeventfd)(VirtIODevice *vdev);
> >       void (*stop_ioeventfd)(VirtIODevice *vdev);
> >       /* Saving and loading of a device; trying to deprecate save/load
>


