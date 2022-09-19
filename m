Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60B45BC99B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 12:34:50 +0200 (CEST)
Received: from localhost ([::1]:47392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaE6z-0005dd-9i
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 06:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaDvc-00066j-RQ
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaDva-00050b-Ov
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663582981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V5LTTc5ROMJoCjU3Cc7gbZ4Fk7gEWq7OHs6KSyL2jkQ=;
 b=CcisO2UAnQMm/Vy5Efhe9lbBsxZcOiW7kFBdQv1IQZMg74y8hkc4DHLQ2/l2hNnqNmJGMQ
 b5k/bTWgpQG8fphUtnU4LMwNq/gO6m7ZI+YjxgxjpgTDa19R5WJ06Z1p1nRXKt0z5S49j7
 WhYQvGXPvr/d3Km3WwjtC1G/TjgddOw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-x4CQ7uVPN4e2nyMlqXmHZA-1; Mon, 19 Sep 2022 06:22:59 -0400
X-MC-Unique: x4CQ7uVPN4e2nyMlqXmHZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 185-20020a1c02c2000000b003b4be28d7e3so3837517wmc.0
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 03:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=V5LTTc5ROMJoCjU3Cc7gbZ4Fk7gEWq7OHs6KSyL2jkQ=;
 b=FcZdcmSpJycTnyMkGsEnrUdeSOCyDwEklmvT0uG6fcZr2H4WX1Er3yfh2cx9f/YYRL
 brTiKu3d99gtPT5TF01rJsw2HH17lyxQHi5dKuYuda61p/JX0nHn/Em7o4tfh4myvvOE
 mo/QxGKxmom9RzXBcL3Kwmw9nIiwy1/7uGLUy/GZPrkA3EslPqGES4h7s3EZqfwBM9ub
 EaPuHDEQbDK/lYfpTlolzpke4SYSwptWqgQ+5Gi7bLO3ViWiScWtNIvHXVJJBlkMsPgw
 qANuHP38Ls8KH9tb8uNDhMCpKPgSvdbowPlqC7B7uXNFtHXegqGl1nQD367FEos0InJR
 0nbQ==
X-Gm-Message-State: ACrzQf27ZBHtFo9ppkBsJRGbrjCf63gwtGD92btQWe2jvMneFe13oXzN
 QHq/rEpYZohlNuXc2BjH9c/8Omfm8GbGKEAnYiRSNzlArznYG5N/w88OVhty8qFBq6QRlb2X/XE
 VfHqPzii8mDvKvG8=
X-Received: by 2002:a05:600c:3d05:b0:3b4:9a42:10d0 with SMTP id
 bh5-20020a05600c3d0500b003b49a4210d0mr12050963wmb.135.1663582978657; 
 Mon, 19 Sep 2022 03:22:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5xnWs76d2RzYQSy1mp6aueE8tYRdiDooZ0fGzz0HYFVCJA9R52x17YuADov0DkWRba95m1UQ==
X-Received: by 2002:a05:600c:3d05:b0:3b4:9a42:10d0 with SMTP id
 bh5-20020a05600c3d0500b003b49a4210d0mr12050952wmb.135.1663582978406; 
 Mon, 19 Sep 2022 03:22:58 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm13693203wmq.13.2022.09.19.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 03:22:57 -0700 (PDT)
Date: Mon, 19 Sep 2022 06:22:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: liuhaiwei <liuhaiwei9699@126.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com
Subject: Re: [PATCH 2/3] virtio-net: update the default and max of
 rx/tx_queue_size
Message-ID: <20220919062211-mutt-send-email-mst@kernel.org>
References: <20220919093915.33003-1-liuhaiwei9699@126.com>
 <20220919093915.33003-2-liuhaiwei9699@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919093915.33003-2-liuhaiwei9699@126.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Sep 19, 2022 at 05:39:14AM -0400, liuhaiwei wrote:
> Set the max of tx_queue_size to 4096 even if the backends
> are not vhost-user.
> 
> Set the default of rx/tx_queue_size to 2048 if the backends
> are vhost-user, otherwise to 4096.
> 
> Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>


Pls include motivation for the change.
A change like this will also need compat knobs to avoid breaking
old machine types.

> ---
>  hw/net/virtio-net.c | 40 ++++++++++++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index dd0d056fde..d63ef24e6a 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -52,12 +52,11 @@
>  #define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
>  
>  /* previously fixed value */
> -#define VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE 256
> -#define VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE 256
> +#define VIRTIO_NET_VHOST_USER_DEFAULT_SIZE 2048
>  
>  /* for now, only allow larger queue_pairs; with virtio-1, guest can downsize */
> -#define VIRTIO_NET_RX_QUEUE_MIN_SIZE VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE
> -#define VIRTIO_NET_TX_QUEUE_MIN_SIZE VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE
> +#define VIRTIO_NET_RX_QUEUE_MIN_SIZE 256
> +#define VIRTIO_NET_TX_QUEUE_MIN_SIZE 256
>  
>  #define VIRTIO_NET_IP4_ADDR_SIZE   8        /* ipv4 saddr + daddr */
>  
> @@ -593,6 +592,28 @@ static int peer_has_ufo(VirtIONet *n)
>  
>      return n->has_ufo;
>  }
> +static void virtio_net_set_default_queue_size(VirtIONet *n)
> +{
> +    NetClientState *peer = n->nic_conf.peers.ncs[0];
> +
> +    /* Default value is 0 if not set */
> +    if (n->net_conf.rx_queue_size == 0) {
> +        if (peer && peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +            n->net_conf.rx_queue_size = VIRTIO_NET_VHOST_USER_DEFAULT_SIZE;
> +        } else {
> +            n->net_conf.rx_queue_size = VIRTIO_NET_VQ_MAX_SIZE;
> +        }
> +    }
> +
> +    if (n->net_conf.tx_queue_size == 0) {
> +        if (peer && peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +            n->net_conf.tx_queue_size = VIRTIO_NET_VHOST_USER_DEFAULT_SIZE;
> +        } else {
> +            n->net_conf.tx_queue_size = VIRTIO_NET_VQ_MAX_SIZE;
> +        }
> +    }
> +}
> +
>  
>  static void virtio_net_set_mrg_rx_bufs(VirtIONet *n, int mergeable_rx_bufs,
>                                         int version_1, int hash_report)
> @@ -633,7 +654,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
>       * size.
>       */
>      if (!peer) {
> -        return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> +        return VIRTIO_NET_VQ_MAX_SIZE;
>      }
>  
>      switch(peer->info->type) {
> @@ -641,7 +662,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
>      case NET_CLIENT_DRIVER_VHOST_VDPA:
>          return VIRTQUEUE_MAX_SIZE;
>      default:
> -        return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> +        return VIRTIO_NET_VQ_MAX_SIZE;
>      };
>  }
>  
> @@ -3450,6 +3471,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>  
>      virtio_net_set_config_size(n, n->host_features);
>      virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
> +    virtio_net_set_default_queue_size(n);
>  
>      /*
>       * We set a lower limit on RX queue size to what it always was.
> @@ -3750,10 +3772,8 @@ static Property virtio_net_properties[] = {
>                         TX_TIMER_INTERVAL),
>      DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
>      DEFINE_PROP_STRING("tx", VirtIONet, net_conf.tx),
> -    DEFINE_PROP_UINT16("rx_queue_size", VirtIONet, net_conf.rx_queue_size,
> -                       VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE),
> -    DEFINE_PROP_UINT16("tx_queue_size", VirtIONet, net_conf.tx_queue_size,
> -                       VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE),
> +    DEFINE_PROP_UINT16("rx_queue_size", VirtIONet, net_conf.rx_queue_size, 0),
> +    DEFINE_PROP_UINT16("tx_queue_size", VirtIONet, net_conf.tx_queue_size, 0),
>      DEFINE_PROP_UINT16("host_mtu", VirtIONet, net_conf.mtu, 0),
>      DEFINE_PROP_BOOL("x-mtu-bypass-backend", VirtIONet, mtu_bypass_backend,
>                       true),
> -- 
> 2.27.0


