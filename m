Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A68631A05
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 08:09:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox0uL-0000US-As; Mon, 21 Nov 2022 02:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ox0uI-0000UJ-RW
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:07:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ox0uF-0004f0-W2
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669014469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sDvUWg5UcrKAStoLU7XwdzE6s7JWGGtp9LBaDbps3f0=;
 b=gfmVHAykz67CezZUZMbhkP9BPKrW6n3LxXd5cAMMoWdVvyscdeHEHKZnvw1ywtMInqTgTi
 kQ+pqLN3/rhucF3e991weVHKTvlpBTwlCrd3V4p+Z4/U9+5CbbwGVxDkIjJSoAjCqnBFol
 DNqevF7pN58nI3HmVZ21RD9MjzTmYp0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-hwtUPyH7M9qBSz4kQoXNOg-1; Mon, 21 Nov 2022 02:07:47 -0500
X-MC-Unique: hwtUPyH7M9qBSz4kQoXNOg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so8809989wme.7
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 23:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDvUWg5UcrKAStoLU7XwdzE6s7JWGGtp9LBaDbps3f0=;
 b=zVNIxfFLj7tpldJxN1KVhOLGCDXYTnuBeYIwFlEaE66tzWHjdoaygQfpx4FkQle+aA
 xHrRCWjxfaSjd+zC9afZgjcFC2HvPYoh1jNBNZSth3ixNp3/DLeJuVyAdL5rSCVIeUOF
 r3i3zYTqAyRM7QntBGbsHp5uYsUZ9gjlwCcD2prRNKOkpe8ToFgxE3208X+FtgDtbxQO
 Y0sebkS89Kl+MpF683h55ufm/AkzvVhTr/K+QGyZoalIWG6Q4HyEB5c2VOfiAsh0myrA
 0W1LuxZl8chIRpht8wtckFVYehEKipJoBSm1wI9/snKwBvmFlFuXuuodCnfJtetCUYPA
 WtnQ==
X-Gm-Message-State: ANoB5pkNa2sHlfKJh26meoBA0Zm/hfSWjo1VwLwXRXhH/fLfcPXbmB0W
 letVRoZI3tUwfYcw0yKO33myqQrsTrdp63GTxymOrRHglYwtsYgX+XfQW9hB5EJO7DCsx0CVnre
 sIor0KD4alXO3lFU=
X-Received: by 2002:a05:600c:1d92:b0:3cf:78fc:eda2 with SMTP id
 p18-20020a05600c1d9200b003cf78fceda2mr15404278wms.47.1669014466540; 
 Sun, 20 Nov 2022 23:07:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7GfJAJ2DEB/XByaHTqqS2qv5jqflnUv9l7Bv8um6jD3NuiUIhmSMmPY0Qufp9nl0HmUmFYEQ==
X-Received: by 2002:a05:600c:1d92:b0:3cf:78fc:eda2 with SMTP id
 p18-20020a05600c1d9200b003cf78fceda2mr15404263wms.47.1669014466297; 
 Sun, 20 Nov 2022 23:07:46 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c4ed100b003c701c12a17sm19355972wmq.12.2022.11.20.23.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 23:07:45 -0800 (PST)
Date: Mon, 21 Nov 2022 02:07:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v4 30/83] virtio: core: vq reset feature negotation support
Message-ID: <20221121020729-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-31-mst@redhat.com>
 <CAGxU2F4S4FFa+HoXbz5bxbi_+DJeaZUMTE89_508n68sNP-EUw@mail.gmail.com>
 <20221119121900-mutt-send-email-mst@kernel.org>
 <CACGkMEsg=CM8Cjdf+mTKBY2+NLeH5oz7v7dchWPZkVpXeD9NoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEsg=CM8Cjdf+mTKBY2+NLeH5oz7v7dchWPZkVpXeD9NoA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Nov 21, 2022 at 02:17:02PM +0800, Jason Wang wrote:
> On Sun, Nov 20, 2022 at 1:19 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Nov 18, 2022 at 03:32:56PM +0100, Stefano Garzarella wrote:
> > > Hi,
> > > starting from this commit 69e1c14aa2 ("virtio: core: vq reset feature
> > > negotation support"), vhost-user-vsock and vhost-vsock fails while
> > > setting the device features, because VIRTIO_F_RING_RESET is not masked.
> > >
> > > I'm not sure vsock is the only one affected.
> > >
> > > We could fix in two ways:
> > >
> > > 1) Masking VIRTIO_F_RING_RESET when we call vhost_get_features:
> > >
> > > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> > > index 29b9ab4f72..e671cc695f 100644
> > > --- a/hw/virtio/vhost-vsock-common.c
> > > +++ b/hw/virtio/vhost-vsock-common.c
> > > @@ -21,6 +21,7 @@
> > >
> > >  const int feature_bits[] = {
> > >      VIRTIO_VSOCK_F_SEQPACKET,
> > > +    VIRTIO_F_RING_RESET,
> > >      VHOST_INVALID_FEATURE_BIT
> > >  };
> > >
> >
> > Let's do this, we need to be conservative.
> 
> Ack.
> 
> Thanks


Patch pls? Stefano?

> >
> >
> > > 2) Or using directly the features of the device. That way we also handle
> > > other features that we may have already had to mask but never did.
> > >
> > > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> > > index 29b9ab4f72..41a665082c 100644
> > > --- a/hw/virtio/vhost-vsock-common.c
> > > +++ b/hw/virtio/vhost-vsock-common.c
> > > @@ -33,7 +33,7 @@ uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
> > >          virtio_add_feature(&features, VIRTIO_VSOCK_F_SEQPACKET);
> > >      }
> > >
> > > -    features = vhost_get_features(&vvc->vhost_dev, feature_bits, features);
> > > +    features &= vvc->vhost_dev.features;
> > >
> > >      if (vvc->seqpacket == ON_OFF_AUTO_ON &&
> > >          !virtio_has_feature(features, VIRTIO_VSOCK_F_SEQPACKET)) {
> > >
> > >
> > > I may be missing the real reason for calling vhost_get_features(),
> > > though.
> > >
> > > @Michael what do you recommend we do?
> > >
> > > Thanks,
> > > Stefano
> > >
> > > On Tue, Nov 8, 2022 at 12:06 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > > >
> > > > A a new command line parameter "queue_reset" is added.
> > > >
> > > > Meanwhile, the vq reset feature is disabled for pre-7.2 machines.
> > > >
> > > > Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > Message-Id: <20221017092558.111082-5-xuanzhuo@linux.alibaba.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  include/hw/virtio/virtio.h | 4 +++-
> > > >  hw/core/machine.c          | 4 +++-
> > > >  2 files changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > > index b00b3fcf31..1423dba379 100644
> > > > --- a/include/hw/virtio/virtio.h
> > > > +++ b/include/hw/virtio/virtio.h
> > > > @@ -313,7 +313,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
> > > >      DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
> > > >                        VIRTIO_F_IOMMU_PLATFORM, false), \
> > > >      DEFINE_PROP_BIT64("packed", _state, _field, \
> > > > -                      VIRTIO_F_RING_PACKED, false)
> > > > +                      VIRTIO_F_RING_PACKED, false), \
> > > > +    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
> > > > +                      VIRTIO_F_RING_RESET, true)
> > > >
> > > >  hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
> > > >  bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
> > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > index aa520e74a8..907fa78ff0 100644
> > > > --- a/hw/core/machine.c
> > > > +++ b/hw/core/machine.c
> > > > @@ -40,7 +40,9 @@
> > > >  #include "hw/virtio/virtio-pci.h"
> > > >  #include "qom/object_interfaces.h"
> > > >
> > > > -GlobalProperty hw_compat_7_1[] = {};
> > > > +GlobalProperty hw_compat_7_1[] = {
> > > > +    { "virtio-device", "queue_reset", "false" },
> > > > +};
> > > >  const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
> > > >
> > > >  GlobalProperty hw_compat_7_0[] = {
> > > > --
> > > > MST
> > > >
> > > >
> >


