Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9744630FAD
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 18:21:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owRVU-0002JZ-BM; Sat, 19 Nov 2022 12:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1owRVS-0002Iy-M7
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 12:19:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1owRVQ-0002HW-Ah
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 12:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668878388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XYPBmXDrwe6BZb8BBHpx0vaXUtceNKduIDb/1CGpTt0=;
 b=FRp/YqcWSPICNF3VekqC9AG2Ex4ZTbm15L71CcQQxBhIIYcwQoVvs5VyHzbEA9gc4KkiPy
 TNsTIWYPIEaarIBFaDrqR2+KgfzMWj++Ek0vIvIgRcmqRUdR0Ym+zpsTu5C/2jiDXNIxUB
 XdyXsK6I1U1JpBcueO/zS44rtDoxxTw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-QhRHlXHpOxWzvcgXfaSd6w-1; Sat, 19 Nov 2022 12:19:46 -0500
X-MC-Unique: QhRHlXHpOxWzvcgXfaSd6w-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so4016087wmb.7
 for <qemu-devel@nongnu.org>; Sat, 19 Nov 2022 09:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYPBmXDrwe6BZb8BBHpx0vaXUtceNKduIDb/1CGpTt0=;
 b=zn29oNtWmktuqwHPWExr/hHApsmRIOCi7RwFH63UwthGDHQ/hAo7L8VUH7MaDuxo9v
 PaCCLRZ0dr/eA7MfPbFmqHsZYGbKD/YbPezuowQCQPXyX4evQUhKZRPX86Mhm8q8KtJK
 Lv2iYwxrIzZywsFJ225RheViPPtU07G9cR/iPvdM9tl2xQ0EZamlgK/BTAPqqWyXE6Vt
 zYFLUzFXDTHA04lnxTEZ6Fb1Y3PFjcOLscGlhopTYHsVbv3q246dhSQmyiiCYsVZdb6A
 /4fAtRloqR9yZKfvSJY4sOgQ2r/4UyWpw+0SwWwmVJnpOGd4gxmVqPy14ibOU+OVAiWs
 ea/w==
X-Gm-Message-State: ANoB5pn69fqwq779bKm7Tycuu7lf2pAQqWiZTii8+H4dl+4BqKibSsUE
 K6RIjMbvlSHsQqpuVxJSFDrZSqkT7ruPblQ3VLVzLCMXUq6Ye1UGTEiLGADllYRHW4ypcRvufzI
 uMLt9PuWsuTT8QTI=
X-Received: by 2002:a1c:6a04:0:b0:3cf:77cc:5f65 with SMTP id
 f4-20020a1c6a04000000b003cf77cc5f65mr1680463wmc.25.1668878384551; 
 Sat, 19 Nov 2022 09:19:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4D3+ctMHbT9VeDZe8uLOQa3GCpOLn51fkKsXhg20r2JoVo4MheCwEBOSk6/reiCQHc7UpVKQ==
X-Received: by 2002:a1c:6a04:0:b0:3cf:77cc:5f65 with SMTP id
 f4-20020a1c6a04000000b003cf77cc5f65mr1680451wmc.25.1668878384221; 
 Sat, 19 Nov 2022 09:19:44 -0800 (PST)
Received: from redhat.com ([147.235.209.1]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b003cf6a55d8e8sm9200443wmq.7.2022.11.19.09.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 09:19:43 -0800 (PST)
Date: Sat, 19 Nov 2022 12:19:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v4 30/83] virtio: core: vq reset feature negotation support
Message-ID: <20221119121900-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-31-mst@redhat.com>
 <CAGxU2F4S4FFa+HoXbz5bxbi_+DJeaZUMTE89_508n68sNP-EUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F4S4FFa+HoXbz5bxbi_+DJeaZUMTE89_508n68sNP-EUw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Nov 18, 2022 at 03:32:56PM +0100, Stefano Garzarella wrote:
> Hi,
> starting from this commit 69e1c14aa2 ("virtio: core: vq reset feature 
> negotation support"), vhost-user-vsock and vhost-vsock fails while 
> setting the device features, because VIRTIO_F_RING_RESET is not masked.
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

Let's do this, we need to be conservative.


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


