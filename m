Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9589E63432D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:03:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXbQ-0005v1-T8; Tue, 22 Nov 2022 13:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oxXbC-0005s1-QM
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:02:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oxXb9-0005q3-Dd
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669140138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HpNO73Rr6y+EseKd+GU8wBL9eJpH6QBMPcRzkoUDPrY=;
 b=JWTdNYkp9crPR3Bizo2IsaE2a0vo2NDCarUzPQCyuR/4+QXfi3Qm+RVRhf3nRDjxMHHMrW
 920zvZvDhAx/W4zZFaG32E/akHcNTZdT+9xWddtZeohSgH22J2E/nR2DAWFl6UJ3+/aFt5
 HO9WNNVOe8prmI948LsCJP1jkoP8leI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-WuObSKFeOJatRjhE_0y-8Q-1; Tue, 22 Nov 2022 13:02:17 -0500
X-MC-Unique: WuObSKFeOJatRjhE_0y-8Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so19647407qkl.9
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HpNO73Rr6y+EseKd+GU8wBL9eJpH6QBMPcRzkoUDPrY=;
 b=Ai7Qw3f95O6oJ5ZRKN6Co4oNxmCwzdOkznQDxsWLeGw+lDCuj8J2eXlGJRC7QXCDYX
 NgC9nxqWfiFNKWuZsVE/wa06I1xWk3HcB+o09cduATwHY1aTJamfncSd/zBXumIEdoSr
 bO4zrMqhgCo01z803DOfk6M5qFIf/goLoXeCrizbjdVk/BWqXkM7/AN9gzVcaJnpCuWE
 FcWbrm3kJKKuDBFkO1hGEMJiGQ2Mu7bd/Ju/axp7pccmaSRNkRPCXB97zXlZN+FCv3ZH
 RaJ424Ohm24U4IOE5nXNuUymEkRPsm/ijdcOf0fOjtjlXevnKiaeGJZxPKViy59qxevD
 rFFw==
X-Gm-Message-State: ANoB5plJ18n2x1WA1vM5NPiP26DNNEmo7BBhexJfXp7+XLuJ177nYXqy
 iD8yWBf9VGHJ0nrjoMjb3ZfRGvorTpRgCKnAl/7KLSqj30dRc7kkRBFt27hQdyenBVxziz6TfwP
 0RWefaykmcsw9nfO2hxkVy2UwaoNnTho=
X-Received: by 2002:ac8:7285:0:b0:3a5:9dc:d83f with SMTP id
 v5-20020ac87285000000b003a509dcd83fmr22883843qto.28.1669140135385; 
 Tue, 22 Nov 2022 10:02:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6s6Awf2+0k5PvOkkIgLnlyuCY2dPEGa+qSSjGLENn6W2DstTvr7UwpTLIe2MA9gqRf2IAoKXvZkQVLS3DUBxM=
X-Received: by 2002:ac8:7285:0:b0:3a5:9dc:d83f with SMTP id
 v5-20020ac87285000000b003a509dcd83fmr22883781qto.28.1669140134484; Tue, 22
 Nov 2022 10:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20221121101101.29400-1-sgarzare@redhat.com>
 <CACGkMEtZ9C0uhnDZ7iPJSHvPcbwGCLrzj742zzc9xAVWD7EMVA@mail.gmail.com>
In-Reply-To: <CACGkMEtZ9C0uhnDZ7iPJSHvPcbwGCLrzj742zzc9xAVWD7EMVA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 22 Nov 2022 19:01:38 +0100
Message-ID: <CAJaqyWfAA7p9MB4DZ-qtshr28HG3o4uXcxyg+BPC6C+eeojnbA@mail.gmail.com>
Subject: Re: [PATCH] vhost: mask VIRTIO_F_RING_RESET for vhost and vhost-user
 devices
To: Jason Wang <jasowang@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, 
 virtio-fs@redhat.com, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Fam Zheng <fam@euphon.net>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, kangjie.xu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Nov 22, 2022 at 4:13 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Mon, Nov 21, 2022 at 6:11 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > Commit 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
> > enabled VIRTIO_F_RING_RESET by default for all virtio devices.
> >
> > This feature is not currently emulated by QEMU, so for vhost and
> > vhost-user devices we need to make sure it is supported by the offloaded
> > device emulation (in-kernel or in another process).
> > To do this we need to add VIRTIO_F_RING_RESET to the features bitmap
> > passed to vhost_get_features(). This way it will be masked if the device
> > does not support it.
> >
> > This issue was initially discovered with vhost-vsock and vhost-user-vsock,
> > and then also tested with vhost-user-rng which confirmed the same issue.
> > They fail when sending features through VHOST_SET_FEATURES ioctl or
> > VHOST_USER_SET_FEATURES message, since VIRTIO_F_RING_RESET is negotiated
> > by the guest (Linux >= v6.0), but not supported by the device.
> >
> > Fixes: 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1318
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
> > ---
> >
> > To prevent this problem in the future, perhaps we should provide a function
> > (e.g. vhost_device_get_features) where we go to mask all non-device-specific
> > features (e.g VIRTIO_F_*, VIRTIO_RING_F_*) that are not emulated by QEMU but
> > we expect them to be emulated by the vhost or vhost-user devices.
>
> Adding Eugenio, this might not be true if we want to use shadow
> virtqueue for emulating some features?
>

I think we should be able to introduce that in the (hypothetical)
vhost_device_get_features if SVQ starts emulating a ring feature,
isn't it? I think a first version not aware of SVQ is fine anyway, and
to introduce it later should be easy.

Thanks!

> Thanks
>
> > Then we can call it in all .get_features callbacks just before return the
> > features.
> >
> > What do you think?
> >
> > But maybe better to do that for the next release, I will send an RFC.
> >
> > Thanks,
> > Stefano
> > ---
> >  hw/block/vhost-user-blk.c      |  1 +
> >  hw/net/vhost_net.c             |  1 +
> >  hw/scsi/vhost-scsi.c           |  1 +
> >  hw/scsi/vhost-user-scsi.c      |  1 +
> >  hw/virtio/vhost-user-fs.c      |  1 +
> >  hw/virtio/vhost-user-gpio.c    |  1 +
> >  hw/virtio/vhost-user-i2c.c     |  1 +
> >  hw/virtio/vhost-user-rng.c     | 11 +++++++++--
> >  hw/virtio/vhost-vsock-common.c |  1 +
> >  net/vhost-vdpa.c               |  1 +
> >  10 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > index 16ad400889..0d5190accf 100644
> > --- a/hw/block/vhost-user-blk.c
> > +++ b/hw/block/vhost-user-blk.c
> > @@ -52,6 +52,7 @@ static const int user_feature_bits[] = {
> >      VIRTIO_F_NOTIFY_ON_EMPTY,
> >      VIRTIO_F_RING_PACKED,
> >      VIRTIO_F_IOMMU_PLATFORM,
> > +    VIRTIO_F_RING_RESET,
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index feda448878..26e4930676 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -75,6 +75,7 @@ static const int user_feature_bits[] = {
> >      VIRTIO_NET_F_MTU,
> >      VIRTIO_F_IOMMU_PLATFORM,
> >      VIRTIO_F_RING_PACKED,
> > +    VIRTIO_F_RING_RESET,
> >      VIRTIO_NET_F_RSS,
> >      VIRTIO_NET_F_HASH_REPORT,
> >
> > diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
> > index bdf337a7a2..6a0fd0dfb1 100644
> > --- a/hw/scsi/vhost-scsi.c
> > +++ b/hw/scsi/vhost-scsi.c
> > @@ -38,6 +38,7 @@ static const int kernel_feature_bits[] = {
> >      VIRTIO_RING_F_INDIRECT_DESC,
> >      VIRTIO_RING_F_EVENT_IDX,
> >      VIRTIO_SCSI_F_HOTPLUG,
> > +    VIRTIO_F_RING_RESET,
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> > index bc37317d55..b7a71a802c 100644
> > --- a/hw/scsi/vhost-user-scsi.c
> > +++ b/hw/scsi/vhost-user-scsi.c
> > @@ -36,6 +36,7 @@ static const int user_feature_bits[] = {
> >      VIRTIO_RING_F_INDIRECT_DESC,
> >      VIRTIO_RING_F_EVENT_IDX,
> >      VIRTIO_SCSI_F_HOTPLUG,
> > +    VIRTIO_F_RING_RESET,
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index 1c40f42045..dc4014cdef 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -32,6 +32,7 @@ static const int user_feature_bits[] = {
> >      VIRTIO_F_NOTIFY_ON_EMPTY,
> >      VIRTIO_F_RING_PACKED,
> >      VIRTIO_F_IOMMU_PLATFORM,
> > +    VIRTIO_F_RING_RESET,
> >
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> > diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> > index 677d1c7730..5851cb3bc9 100644
> > --- a/hw/virtio/vhost-user-gpio.c
> > +++ b/hw/virtio/vhost-user-gpio.c
> > @@ -24,6 +24,7 @@ static const int feature_bits[] = {
> >      VIRTIO_RING_F_INDIRECT_DESC,
> >      VIRTIO_RING_F_EVENT_IDX,
> >      VIRTIO_GPIO_F_IRQ,
> > +    VIRTIO_F_RING_RESET,
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> > index 864eba695e..1c9f3d20dc 100644
> > --- a/hw/virtio/vhost-user-i2c.c
> > +++ b/hw/virtio/vhost-user-i2c.c
> > @@ -16,6 +16,7 @@
> >
> >  static const int feature_bits[] = {
> >      VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
> > +    VIRTIO_F_RING_RESET,
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> > index 8b47287875..f9084cde58 100644
> > --- a/hw/virtio/vhost-user-rng.c
> > +++ b/hw/virtio/vhost-user-rng.c
> > @@ -16,6 +16,11 @@
> >  #include "qemu/error-report.h"
> >  #include "standard-headers/linux/virtio_ids.h"
> >
> > +static const int feature_bits[] = {
> > +    VIRTIO_F_RING_RESET,
> > +    VHOST_INVALID_FEATURE_BIT
> > +};
> > +
> >  static void vu_rng_start(VirtIODevice *vdev)
> >  {
> >      VHostUserRNG *rng = VHOST_USER_RNG(vdev);
> > @@ -106,8 +111,10 @@ static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
> >  static uint64_t vu_rng_get_features(VirtIODevice *vdev,
> >                                      uint64_t requested_features, Error **errp)
> >  {
> > -    /* No feature bits used yet */
> > -    return requested_features;
> > +    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
> > +
> > +    return vhost_get_features(&rng->vhost_dev, feature_bits,
> > +                              requested_features);
> >  }
> >
> >  static void vu_rng_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> > index 29b9ab4f72..a67a275de2 100644
> > --- a/hw/virtio/vhost-vsock-common.c
> > +++ b/hw/virtio/vhost-vsock-common.c
> > @@ -21,6 +21,7 @@
> >
> >  const int feature_bits[] = {
> >      VIRTIO_VSOCK_F_SEQPACKET,
> > +    VIRTIO_F_RING_RESET,
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 6811089231..2b4b85d8f8 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -69,6 +69,7 @@ const int vdpa_feature_bits[] = {
> >      VIRTIO_NET_F_CTRL_VQ,
> >      VIRTIO_F_IOMMU_PLATFORM,
> >      VIRTIO_F_RING_PACKED,
> > +    VIRTIO_F_RING_RESET,
> >      VIRTIO_NET_F_RSS,
> >      VIRTIO_NET_F_HASH_REPORT,
> >      VIRTIO_NET_F_GUEST_ANNOUNCE,
> > --
> > 2.38.1
> >
>


