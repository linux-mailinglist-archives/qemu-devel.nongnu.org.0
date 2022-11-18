Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35AB62F796
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 15:34:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow2Qj-0003GO-8K; Fri, 18 Nov 2022 09:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ow2QW-0003BT-3f
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:33:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ow2QU-0003Ct-2O
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668781982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qOABQDqv1OyVxZqqxTvM4fD7C94NtD8a041hcblLQos=;
 b=ZAih+KLA8D7EpVumdoHEPLwn0bpbl10ueDT7s5z7HD3ym2do1Dk+Bb6TnIJQQFt6mh/cMg
 Ctuce5BrVEfHi9+6Mw2WYuq/wdsmr7lgjYXE61ck0pJRYgzoPZiLbyE6rqorgmNtNs2bn9
 fFXESALuMl2DdWXVZ998Anp5232oKm8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-52QgFiDUMlOmAkL_EwU3iA-1; Fri, 18 Nov 2022 09:33:01 -0500
X-MC-Unique: 52QgFiDUMlOmAkL_EwU3iA-1
Received: by mail-wr1-f70.google.com with SMTP id
 w23-20020adf8bd7000000b002358f733307so1652840wra.17
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 06:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qOABQDqv1OyVxZqqxTvM4fD7C94NtD8a041hcblLQos=;
 b=kVoVyYOl6gbgXeuPTYgEseJ+WeMf9TxmlYH6bzPZbitzLBW05CzS8eVXeuuDVRT8v9
 F0QZCnpX1z8Z7zJWEwEJ31/6l634PhCXo/vC89nq6eptKKk8YILpmHzcOTVf7bP8VYVN
 s44EjTJ7IkzhvL1yscjY7L7QYCf3OMm8JVBi2QJjrPn8X5po3VKTru9LpqLo3p2xb4vB
 WyqpQ9p9Za9ufzQ4aYCu0wGFF7nDZmSB4IGvX1XyLYdLD2HemS7bUGEKLoZIxaCrWFV9
 yNvZ6sNPhHRh3LWfW0cNW+R5wFNykuEX/hMeJEiGUaLtvfmfw6bSqGwevSkMw3jX7TR8
 AfxA==
X-Gm-Message-State: ANoB5pnkLy2oelve1aL2HMvVjZaNOmyu/g7sO/12TrQTtdbhujvRcpjZ
 mxeXdvXKJ14zoqEt9MAYBnUp7MQU+y7d2Xll2uOsEdwMF6Mu3rKNyewLOPIwCahBdeU1heP5K/+
 0Kvlgkp0GNp1I70E=
X-Received: by 2002:adf:f206:0:b0:236:698d:9c44 with SMTP id
 p6-20020adff206000000b00236698d9c44mr4462002wro.571.1668781980158; 
 Fri, 18 Nov 2022 06:33:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Hm6aPgFFCcVql8+W1GdM+tYh5lVdlSLXuoUJFRMl5SGz/pN5nRIhQRbGPAlmOCZpkP2lwBQ==
X-Received: by 2002:adf:f206:0:b0:236:698d:9c44 with SMTP id
 p6-20020adff206000000b00236698d9c44mr4461984wro.571.1668781979905; 
 Fri, 18 Nov 2022 06:32:59 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 j13-20020a5d604d000000b00236695ff94fsm3710091wrt.34.2022.11.18.06.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 06:32:59 -0800 (PST)
Date: Fri, 18 Nov 2022 15:32:56 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v4 30/83] virtio: core: vq reset feature negotation support
Message-ID: <CAGxU2F4S4FFa+HoXbz5bxbi_+DJeaZUMTE89_508n68sNP-EUw@mail.gmail.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-31-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-31-mst@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
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

Hi,
starting from this commit 69e1c14aa2 ("virtio: core: vq reset feature 
negotation support"), vhost-user-vsock and vhost-vsock fails while 
setting the device features, because VIRTIO_F_RING_RESET is not masked.

I'm not sure vsock is the only one affected.

We could fix in two ways:

1) Masking VIRTIO_F_RING_RESET when we call vhost_get_features:

diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 29b9ab4f72..e671cc695f 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -21,6 +21,7 @@
 
 const int feature_bits[] = {
     VIRTIO_VSOCK_F_SEQPACKET,
+    VIRTIO_F_RING_RESET,
     VHOST_INVALID_FEATURE_BIT
 };


2) Or using directly the features of the device. That way we also handle 
other features that we may have already had to mask but never did.

diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 29b9ab4f72..41a665082c 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -33,7 +33,7 @@ uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
         virtio_add_feature(&features, VIRTIO_VSOCK_F_SEQPACKET);
     }

-    features = vhost_get_features(&vvc->vhost_dev, feature_bits, features);
+    features &= vvc->vhost_dev.features;

     if (vvc->seqpacket == ON_OFF_AUTO_ON &&
         !virtio_has_feature(features, VIRTIO_VSOCK_F_SEQPACKET)) {


I may be missing the real reason for calling vhost_get_features(), 
though.

@Michael what do you recommend we do?

Thanks,
Stefano

On Tue, Nov 8, 2022 at 12:06 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>
> A a new command line parameter "queue_reset" is added.
>
> Meanwhile, the vq reset feature is disabled for pre-7.2 machines.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Message-Id: <20221017092558.111082-5-xuanzhuo@linux.alibaba.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/hw/virtio/virtio.h | 4 +++-
>  hw/core/machine.c          | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b00b3fcf31..1423dba379 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -313,7 +313,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
>      DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
>                        VIRTIO_F_IOMMU_PLATFORM, false), \
>      DEFINE_PROP_BIT64("packed", _state, _field, \
> -                      VIRTIO_F_RING_PACKED, false)
> +                      VIRTIO_F_RING_PACKED, false), \
> +    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
> +                      VIRTIO_F_RING_RESET, true)
>
>  hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
>  bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index aa520e74a8..907fa78ff0 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -40,7 +40,9 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "qom/object_interfaces.h"
>
> -GlobalProperty hw_compat_7_1[] = {};
> +GlobalProperty hw_compat_7_1[] = {
> +    { "virtio-device", "queue_reset", "false" },
> +};
>  const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>
>  GlobalProperty hw_compat_7_0[] = {
> --
> MST
>
>


