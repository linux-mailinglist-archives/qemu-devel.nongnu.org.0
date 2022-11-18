Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0514962F7E8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 15:41:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow2XD-0005bD-BD; Fri, 18 Nov 2022 09:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ow2XA-0005aP-MT
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:40:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ow2X8-0004EL-QU
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668782397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eBFmiXLccGKK6nVTSrTsrQAh0Y8D0oy5ax5VC5owNLQ=;
 b=QMYYhE8TbABrGBdi9PGUyYWT8O8k8073Zab4BREVQ3rYc3Ri8qB5ntXm9LRnKIanNMphv0
 pHtRR9KbwYO1Nf7Qs6Q8XJhGMVqtBnOcQJo4/G/7cTJkAPEJPVRgn2xUiXlM137x23RwNm
 YIwawMCGNohSoyNncn0mRRIVeoE9eqo=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-zSZuuzHuM-WtfKEfv08lfQ-1; Fri, 18 Nov 2022 09:39:52 -0500
X-MC-Unique: zSZuuzHuM-WtfKEfv08lfQ-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-3985077640fso3740807b3.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 06:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eBFmiXLccGKK6nVTSrTsrQAh0Y8D0oy5ax5VC5owNLQ=;
 b=5YbCIWFrsmo24+aacDvNZVp0lLj7m6KwbgZBy49J8b9mnQ0pilE2zIpgGRLraZEtWl
 HNAqAH1+PkXgK5HSZYw2onRmm79GKfX8mjtyIzIbYhlskBlVfUy1drnQASe+0QUp3kWW
 aUfqSI9Lbx8OlIHHHNUrSAFGWOYTBp58JVhSG7xKGzvjHpJnKb3O158euWMdcd8KRElj
 f4YeltkT31nC0EiNNUew0VcuB+NTimiCDa7i46F3vPAf42Y/k8oRbUIsSgcXJSiAUlEv
 aEvSgLh2Eewapuydljd5+p8YCFZ+m+T7OV4XBLuG18KVx2ZOsX888BSv/qczVxKDv9wV
 /ayQ==
X-Gm-Message-State: ANoB5pnRpY0v78geTM7tUs3/nF8QskEBiIgM3LiLH7paXtebDwrea23c
 LLQX0ePBpTBvLAjr/1EBVxTQsTnYf8Q47VqSieuEZqq2wh8GjWkf6/hGY9CDLzKw4uQlAWMvYA4
 H/+E7q/uQEvh+BQRhDY+MgV4noajjniY=
X-Received: by 2002:a0d:d606:0:b0:37f:477c:ea6f with SMTP id
 y6-20020a0dd606000000b0037f477cea6fmr6671688ywd.94.1668782392239; 
 Fri, 18 Nov 2022 06:39:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6omBEBICqEPEyqztynnY0zJmUbUsggD6Iu3K4U2IlFToahZkuM7VifbKQqI+is0LT0NPktFj50KgP7yDKK1Rc=
X-Received: by 2002:a0d:d606:0:b0:37f:477c:ea6f with SMTP id
 y6-20020a0dd606000000b0037f477cea6fmr6671660ywd.94.1668782391981; Fri, 18 Nov
 2022 06:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-31-mst@redhat.com>
 <CAGxU2F4S4FFa+HoXbz5bxbi_+DJeaZUMTE89_508n68sNP-EUw@mail.gmail.com>
In-Reply-To: <CAGxU2F4S4FFa+HoXbz5bxbi_+DJeaZUMTE89_508n68sNP-EUw@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 18 Nov 2022 15:39:40 +0100
Message-ID: <CAGxU2F5XyHEE7NqSp8crXjecuJSR4_auVyzeNW3PSTNZga1OpQ@mail.gmail.com>
Subject: Re: [PULL v4 30/83] virtio: core: vq reset feature negotation support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Jason Wang <jasowang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Fri, Nov 18, 2022 at 3:32 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Hi,
> starting from this commit 69e1c14aa2 ("virtio: core: vq reset feature
> negotation support"), vhost-user-vsock and vhost-vsock fails while
> setting the device features, because VIRTIO_F_RING_RESET is not masked.

vhost-vsock issue also reported here:
https://gitlab.com/qemu-project/qemu/-/issues/1318

>
> I'm not sure vsock is the only one affected.
>
> We could fix in two ways:
>
> 1) Masking VIRTIO_F_RING_RESET when we call vhost_get_features:
>
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index 29b9ab4f72..e671cc695f 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -21,6 +21,7 @@
>
>  const int feature_bits[] = {
>      VIRTIO_VSOCK_F_SEQPACKET,
> +    VIRTIO_F_RING_RESET,
>      VHOST_INVALID_FEATURE_BIT
>  };
>
>
> 2) Or using directly the features of the device. That way we also handle
> other features that we may have already had to mask but never did.
>
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index 29b9ab4f72..41a665082c 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -33,7 +33,7 @@ uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
>          virtio_add_feature(&features, VIRTIO_VSOCK_F_SEQPACKET);
>      }
>
> -    features = vhost_get_features(&vvc->vhost_dev, feature_bits, features);
> +    features &= vvc->vhost_dev.features;
>
>      if (vvc->seqpacket == ON_OFF_AUTO_ON &&
>          !virtio_has_feature(features, VIRTIO_VSOCK_F_SEQPACKET)) {
>
>
> I may be missing the real reason for calling vhost_get_features(),
> though.
>
> @Michael what do you recommend we do?
>
> Thanks,
> Stefano
>
> On Tue, Nov 8, 2022 at 12:06 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> >
> > A a new command line parameter "queue_reset" is added.
> >
> > Meanwhile, the vq reset feature is disabled for pre-7.2 machines.
> >
> > Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > Message-Id: <20221017092558.111082-5-xuanzhuo@linux.alibaba.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  include/hw/virtio/virtio.h | 4 +++-
> >  hw/core/machine.c          | 4 +++-
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index b00b3fcf31..1423dba379 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -313,7 +313,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
> >      DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
> >                        VIRTIO_F_IOMMU_PLATFORM, false), \
> >      DEFINE_PROP_BIT64("packed", _state, _field, \
> > -                      VIRTIO_F_RING_PACKED, false)
> > +                      VIRTIO_F_RING_PACKED, false), \
> > +    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
> > +                      VIRTIO_F_RING_RESET, true)
> >
> >  hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
> >  bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index aa520e74a8..907fa78ff0 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -40,7 +40,9 @@
> >  #include "hw/virtio/virtio-pci.h"
> >  #include "qom/object_interfaces.h"
> >
> > -GlobalProperty hw_compat_7_1[] = {};
> > +GlobalProperty hw_compat_7_1[] = {
> > +    { "virtio-device", "queue_reset", "false" },
> > +};
> >  const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
> >
> >  GlobalProperty hw_compat_7_0[] = {
> > --
> > MST
> >
> >


