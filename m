Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0023489FA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 08:19:08 +0100 (CET)
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPKGp-0003EU-Mo
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 03:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lPKFk-0002ZB-Jz
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 03:18:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lPKFi-00087E-Fw
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 03:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616656677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9v/TXJFPhU4Kwsb1sk7TVm9ssShYQCgvsFks8WNZeo0=;
 b=bcrOfnGbVMXj7wpVh2YaUYOLIz+ryRK89ttHCfe8KgmYQNoBWn7mqOzsHXo/pxPGYn68gr
 +xdYmiWEGDzidDjPKv2T9v1I4fW6GEsHMr7eMJQ+3HqREote+iAgW0BBrmMCq1G5EzJLu2
 zcQygSHnclq2fd3IX5HriGwO5Asd90w=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-R-WEBwsNPSm4rG5nm4tdxQ-1; Thu, 25 Mar 2021 03:17:55 -0400
X-MC-Unique: R-WEBwsNPSm4rG5nm4tdxQ-1
Received: by mail-pf1-f197.google.com with SMTP id w129so2700720pfc.21
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 00:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9v/TXJFPhU4Kwsb1sk7TVm9ssShYQCgvsFks8WNZeo0=;
 b=Nvd6zrDOGIWq+0XHCND+RM1PC/s+RzzPCtUDlx3baRfdpGsBZrKFV3S9P+ZfcoCsfq
 Vef+pxA8MmgTZd3vK/Ei4CzhEoQSOaDZ/FCHnfKMAxnJF+nLI9oHFQPnqRCVZNBSQh+p
 1TVGOzAeMm4CeQF0f7ds787VLxtyVSPnj79K+xdLbYAVZ24Y48MRF1ZbPYJpnGDfzJ5M
 JPlVWSwxOxvouaeL+nMM2XJpHBYDlrYkukC+wmeK2TxC3edNAtUn413LprGXQ8pHoz43
 z4hBF02BDTGgHBYULhdosLjq+HQgOWORu+25UeAQIuv0+hipxzBtjTszPQ3tKogvLrJb
 ph6g==
X-Gm-Message-State: AOAM5309Avdtxu4uX4BB28BzMS3mjyRFFS+Yq0g6HMiq9yDgUHxnurUd
 yxfrbkVxYG8qkyrit/zRmowHAnLzcPG/GexMBWUQsVXW+DMiP3dGgCw4w3CREzgmnMUC2tLjFM7
 CyrQNA6mEu9DbLXIpHCzddMgL2l67xRg=
X-Received: by 2002:a17:902:7b8b:b029:e6:f006:d71a with SMTP id
 w11-20020a1709027b8bb02900e6f006d71amr8130146pll.19.1616656674833; 
 Thu, 25 Mar 2021 00:17:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrR3ir3+ndjFelqmkvpnIRlmDAssV5ZkTjbvq3OGOuWAbgtZlLaKOxnyeKXTWBtlb2os/tXHUR8KUFGCPAJCk=
X-Received: by 2002:a17:902:7b8b:b029:e6:f006:d71a with SMTP id
 w11-20020a1709027b8bb02900e6f006d71amr8130123pll.19.1616656674563; Thu, 25
 Mar 2021 00:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210323015641.10820-1-lulu@redhat.com>
 <20210323015641.10820-3-lulu@redhat.com>
 <7acc16cc-aef8-34d1-250b-97ebf2cbdd8a@redhat.com>
In-Reply-To: <7acc16cc-aef8-34d1-250b-97ebf2cbdd8a@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 25 Mar 2021 15:17:18 +0800
Message-ID: <CACLfguUZt1vND2aB63e8dJJA5WRj-2-X4JemAFirmBep6dnPdQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] vhost-vdpa: add callback function for configure
 interrupt
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 24, 2021 at 2:35 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/23 =E4=B8=8A=E5=8D=889:56, Cindy Lu =E5=86=99=E9=81=93:
> > Add call back function for configure interrupt.
> > Set the notifier's fd to the kernel driver when vdpa start.
> > also set -1 while vdpa stop. then the kernel will release
> > the related resource
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/trace-events            |  2 ++
> >   hw/virtio/vhost-vdpa.c            | 40 +++++++++++++++++++++++++++++-=
-
> >   include/hw/virtio/vhost-backend.h |  4 ++++
> >   3 files changed, 44 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 2060a144a2..6710835b46 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int ind=
ex, int fd) "dev: %p index:
> >   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p featur=
es: 0x%"PRIx64
> >   vhost_vdpa_set_owner(void *dev) "dev: %p"
> >   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, =
uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_use=
r_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> > +vhost_vdpa_set_config_call(void *dev, int *fd)"dev: %p fd: %p"
> > +
> >
> >   # virtio.c
> >   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsig=
ned out_num) "elem %p size %zd in_num %u out_num %u"
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 01d2101d09..bde32eefe7 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -467,20 +467,47 @@ static int vhost_vdpa_get_config(struct vhost_dev=
 *dev, uint8_t *config,
> >       }
> >       return ret;
> >    }
> > -
> > +static void vhost_vdpa_config_notify_start(struct vhost_dev *dev,
> > +                                struct VirtIODevice *vdev, bool start)
> > +{
> > +    int fd =3D 0;
> > +    int r =3D 0;
> > +    if (!(dev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
> > +        return;
> > +    }
> > +    if (start) {
> > +        fd =3D event_notifier_get_fd(&vdev->config_notifier);
> > +        r =3D dev->vhost_ops->vhost_set_config_call(dev, &fd);
> > +     /*set the fd call back to vdpa driver*/
> > +        if (!r) {
> > +            vdev->use_config_notifier =3D VIRTIO_CONFIG_WORK;
> > +            event_notifier_set(&vdev->config_notifier);
>
>
> Is this a workaround for the vdpa device without config interrupt? I
> wonder how much we could gain from this.
>
this is a bit identify if the config notifier working now, this bit to chec=
k in
virtio bus  for different behavior , I will change this bit 's name to
make it more clearly

>
> > +            info_report("vhost_vdpa_config_notify start!");
>
>
> This is a debug code I guess.
>
sure I will remove this
>
> > +      }
> > +    } else {
> > +        fd =3D -1;
> > +        vdev->use_config_notifier =3D VIRTIO_CONFIG_STOP;
>
>
> Looks like a duplicated state with vhost_dev->started?
>
>
> > +        r =3D dev->vhost_ops->vhost_set_config_call(dev, &fd);
> > +    }
> > +    return;
> > +}
> >   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> >       trace_vhost_vdpa_dev_start(dev, started);
> > +    VirtIODevice *vdev =3D dev->vdev;
> > +
> >       if (started) {
> >           uint8_t status =3D 0;
> >           memory_listener_register(&v->listener, &address_space_memory)=
;
> >           vhost_vdpa_set_vring_ready(dev);
> >           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >           vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> > -
> > +        /*set the configure interrupt call back*/
> > +        vhost_vdpa_config_notify_start(dev, vdev, true);
> >           return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
> >       } else {
> > +        vhost_vdpa_config_notify_start(dev, vdev, false);
> >           vhost_vdpa_reset_device(dev);
> >           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                      VIRTIO_CONFIG_S_DRIVER);
> > @@ -546,6 +573,14 @@ static int vhost_vdpa_set_vring_call(struct vhost_=
dev *dev,
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> >   }
> >
> > +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> > +                                       int *fd)
> > +{
> > +    trace_vhost_vdpa_set_config_call(dev, fd);
> > +
> > +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
> > +}
> > +
> >   static int vhost_vdpa_get_features(struct vhost_dev *dev,
> >                                        uint64_t *features)
> >   {
> > @@ -611,4 +646,5 @@ const VhostOps vdpa_ops =3D {
> >           .vhost_get_device_id =3D vhost_vdpa_get_device_id,
> >           .vhost_vq_get_addr =3D vhost_vdpa_vq_get_addr,
> >           .vhost_force_iommu =3D vhost_vdpa_force_iommu,
> > +        .vhost_set_config_call =3D vhost_vdpa_set_config_call,
> >   };
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhos=
t-backend.h
> > index 8a6f8e2a7a..1a2fee8994 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
>
>
> A separated patch please.
>
> Thanks
>
sure will split this
>
> > @@ -125,6 +125,9 @@ typedef int (*vhost_get_device_id_op)(struct vhost_=
dev *dev, uint32_t *dev_id);
> >
> >   typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
> >
> > +typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> > +                                       int *fd);
> > +
> >   typedef struct VhostOps {
> >       VhostBackendType backend_type;
> >       vhost_backend_init vhost_backend_init;
> > @@ -170,6 +173,7 @@ typedef struct VhostOps {
> >       vhost_vq_get_addr_op  vhost_vq_get_addr;
> >       vhost_get_device_id_op vhost_get_device_id;
> >       vhost_force_iommu_op vhost_force_iommu;
> > +    vhost_set_config_call_op vhost_set_config_call;
> >   } VhostOps;
> >
> >   extern const VhostOps user_ops;
>
>


