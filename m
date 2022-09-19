Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7B5BC9A6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 12:43:15 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaEF8-0001b6-4t
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 06:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaDwQ-0006N3-JQ
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:23:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaDwN-00057m-Sj
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663583030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G/l4wggjntNZ+O0wBOWLVW+8SmL4aSfMKz6iT3lY8fo=;
 b=i3dw1UiTet7NcSEBEVRc8tHDHoVLfG/GXWV+QZRy5gGgnFd/zXJBDfJcP5ASjZKzGUcCP1
 V4vuuKHhSUfVRDF1HN6xWgogvfp+4Wstuxu6gTh3WRMSqOlKV8I2vyhLidyo395o/ILCmE
 BNj/bE3OP7DFC67WWoM0Hunbpuvv0Eo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-M3HMb-uzPIu8k1PLw6t0jQ-1; Mon, 19 Sep 2022 06:23:48 -0400
X-MC-Unique: M3HMb-uzPIu8k1PLw6t0jQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso1413756wra.1
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 03:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=G/l4wggjntNZ+O0wBOWLVW+8SmL4aSfMKz6iT3lY8fo=;
 b=I8bBWtILMz1B06vZpEZ8VQY/E0V2JBAiDxd3uLkwgiO7tHhHsW4nOMTnC4fslBNL7y
 7fL0voQU2d8mHpBekOYWy4RN8BEn7tS9T9x3WV5R4dvCEEo4/CU4RnqpZJUMODenhEoh
 QmK/VloZy6PzlFgEq+r4XaQee1abNuKGj+pFBMwfgmzFZxvC2XrDvRsrPyn3L9WhQ7d5
 QA5Sjg8i6FwTQzMgpwdPbD3Vl9rLowfqxSpJueKv3E4Fmg14MypF+EdUiLOnLcnE8OgG
 0LEs0UKO0dU5OBBwHoc3wEWjsjObQYqND6C9idq6EDV0DOlMVg+QASVEJoNQW1NQhNBt
 nohw==
X-Gm-Message-State: ACrzQf1HLz0bc6z0n4EnYsCX8sRSy9S5T+pS5G09M6NMw7Nq0THeGep4
 5ru0oHHxbOX24KIT3wlwc06NJj/f5RGdtAmd8FXnYC5bgWQfL6LIdZkX5il3lev/YRKvh4Tkk6f
 iQG7TVjX5H6o5oqw=
X-Received: by 2002:adf:d1ea:0:b0:22a:9cd2:3557 with SMTP id
 g10-20020adfd1ea000000b0022a9cd23557mr10763928wrd.675.1663583027445; 
 Mon, 19 Sep 2022 03:23:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7zxSUfM788h1c2t0rAxIO2Q0/ZZOjI538tDiMWlSsAxbH/5LmMkQaqFx0VaO/M3VeGhKgnYw==
X-Received: by 2002:adf:d1ea:0:b0:22a:9cd2:3557 with SMTP id
 g10-20020adfd1ea000000b0022a9cd23557mr10763916wrd.675.1663583027260; 
 Mon, 19 Sep 2022 03:23:47 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003b47581979bsm14432878wmq.33.2022.09.19.03.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 03:23:46 -0700 (PDT)
Date: Mon, 19 Sep 2022 06:23:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: liuhaiwei <liuhaiwei9699@126.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com
Subject: Re: [PATCH 3/3] virtio-net: set the max of queue size to 4096
Message-ID: <20220919062312-mutt-send-email-mst@kernel.org>
References: <20220919093915.33003-1-liuhaiwei9699@126.com>
 <20220919093915.33003-3-liuhaiwei9699@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919093915.33003-3-liuhaiwei9699@126.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

same comments as other patches. besides ...

On Mon, Sep 19, 2022 at 05:39:15AM -0400, liuhaiwei wrote:
> Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
> ---
>  hw/net/virtio-net.c | 8 ++++----
>  hw/virtio/virtio.c  | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

coding style violations all over the place

> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index d63ef24e6a..df16995146 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3479,23 +3479,23 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>       * help from us (using virtio 1 and up).
>       */
>      if (n->net_conf.rx_queue_size < VIRTIO_NET_RX_QUEUE_MIN_SIZE ||
> -        n->net_conf.rx_queue_size > VIRTQUEUE_MAX_SIZE ||
> +        n->net_conf.rx_queue_size > VIRTIO_NET_VQ_MAX_SIZE ||
>          !is_power_of_2(n->net_conf.rx_queue_size)) {
>          error_setg(errp, "Invalid rx_queue_size (= %" PRIu16 "), "
>                     "must be a power of 2 between %d and %d.",
>                     n->net_conf.rx_queue_size, VIRTIO_NET_RX_QUEUE_MIN_SIZE,
> -                   VIRTQUEUE_MAX_SIZE);
> +                   VIRTIO_NET_VQ_MAX_SIZE);
>          virtio_cleanup(vdev);
>          return;
>      }
>  
>      if (n->net_conf.tx_queue_size < VIRTIO_NET_TX_QUEUE_MIN_SIZE ||
> -        n->net_conf.tx_queue_size > VIRTQUEUE_MAX_SIZE ||
> +        n->net_conf.tx_queue_size > VIRTIO_NET_VQ_MAX_SIZE ||
>          !is_power_of_2(n->net_conf.tx_queue_size)) {
>          error_setg(errp, "Invalid tx_queue_size (= %" PRIu16 "), "
>                     "must be a power of 2 between %d and %d",
>                     n->net_conf.tx_queue_size, VIRTIO_NET_TX_QUEUE_MIN_SIZE,
> -                   VIRTQUEUE_MAX_SIZE);
> +                   VIRTIO_NET_VQ_MAX_SIZE );
>          virtio_cleanup(vdev);
>          return;
>      }
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index d93c20d747..2f0c99e357 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2427,7 +2427,7 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
>              break;
>      }
>  
> -    if (i == VIRTIO_QUEUE_MAX || queue_size > VIRTQUEUE_MAX_SIZE)
> +    if (i == VIRTIO_QUEUE_MAX )
>          abort();
>  
>      vdev->vq[i].vring.num = queue_size;
> -- 
> 2.27.0


