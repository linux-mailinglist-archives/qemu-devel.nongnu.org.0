Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E55BD979
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 03:40:45 +0200 (CEST)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaSFf-0008Ai-Sj
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 21:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oaSEF-0006oA-8C
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 21:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oaSEB-0006pR-9n
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 21:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663637949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5lW2F7Bjj6ZffKe/rzGsRbfHo1jjsMIcjxYCONDfba0=;
 b=gAelmq0S4N6ERQgLOaXri8puKRM05W1sXJtNyVlUqH6ShFoYtTJ5kV8CeZIGsukIBYnyt5
 TU9d8E4XVcroTJYOYZxs2zjz7oBRAggChweZyyNDV1rE9DXYo3EbSkxyaxVQhAKgMk58+f
 O3/8jL0FYxBoH9cGtIAzB9YhIN1fTx4=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-fgYzXfuXO3GFrYOECLQf7w-1; Mon, 19 Sep 2022 21:39:00 -0400
X-MC-Unique: fgYzXfuXO3GFrYOECLQf7w-1
Received: by mail-vs1-f70.google.com with SMTP id
 190-20020a6704c7000000b00398aea3092dso293343vse.22
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 18:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5lW2F7Bjj6ZffKe/rzGsRbfHo1jjsMIcjxYCONDfba0=;
 b=LsUTKKHZzZ3rMFQx17/pv0H5diGkJsQJl/WkduHUFbPXJs484Yb5KZn98H4wpY3UP9
 qVw+Jls/AY6cTNOqkgU9zXgZ4WPiakVzKzkf9TRlga9755DOR96r8Y7axJRowswivyDe
 rX4YzlddweGAUdrk4IWX4XVxQoJQpwiIyfAOh31G4gSOOM2Chz8UxhmPNQGNb6N1TubX
 i9uFb7hU9pN5bln2X7T9L0DQPS95Ng+pv4reZWn5m/awh7TFR4dDSkZaY5J217zehyh+
 0A/zlTW9LkMTpHpebIYb0yNL622rFp4x6rBSr6o5Hq7uGtcBF5W1CBflxrDAc41zgoQR
 iM5w==
X-Gm-Message-State: ACrzQf3RRvYMyaQvFLplqEeI2bPAWQrJA4N5aCNG07+thDE218h0zyJm
 /WicmmP5FLrqEbv530YBump2LHJfYmqfxZAAepu2Jt4NuEObvANNcU7ICmQUlo+XX+Z5ehYCPH6
 DC2ETrlcNctdSdwEyGL3+f8zG4TQ7PhA=
X-Received: by 2002:a05:6102:1341:b0:398:889e:7f28 with SMTP id
 j1-20020a056102134100b00398889e7f28mr7888221vsl.21.1663637939695; 
 Mon, 19 Sep 2022 18:38:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rSrMxei8NZkP2KS2YsknGaKBFBqXYDLdw8hArMTSSHvEgDzeps6oNqLkIpytHgmv5xH3RGNBitx+VD8BxpxE=
X-Received: by 2002:a05:6102:1341:b0:398:889e:7f28 with SMTP id
 j1-20020a056102134100b00398889e7f28mr7888219vsl.21.1663637939473; Mon, 19 Sep
 2022 18:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220920011007.1972418-1-liuhaiwei9699@126.com>
In-Reply-To: <20220920011007.1972418-1-liuhaiwei9699@126.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 20 Sep 2022 09:38:48 +0800
Message-ID: <CACGkMEuWDZzyBWOuAUVgxkUjBytStWC4U9RD0yWw49RS6RG6HA@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: set the max of queue size to 4096
To: liuhaiwei <liuhaiwei9699@126.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>, 
 liuhaiwei <liuhaiwei@inspur.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Sep 20, 2022 at 9:10 AM liuhaiwei <liuhaiwei9699@126.com> wrote:
>
> From: liuhaiwei <liuhaiwei@inspur.com>
>
> the limit of maximum of rx_queue_size and tx_queue to 1024 is so small as to affect our network performance when using the  virtio-net and vhost ,
> we cannot set the maximum size beyond 1k.
> why not enlarge the maximum size (such as 4096) when using the vhost backend?

As Michael mentioned, there's a limitation in the kernel UIO_MAXIOV.
We need to find way to overcome that limit first.

Thanks

>
> Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
> Signed-off-by: liuhaiwei <liuhaiwei@inspur.com>
> ---
>  hw/net/virtio-net.c        | 47 +++++++++++++++++++++++++++-----------
>  hw/virtio/virtio.c         |  8 +++++--
>  include/hw/virtio/virtio.h |  1 +
>  3 files changed, 41 insertions(+), 15 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index dd0d056fde..4b56484855 100644
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
> @@ -594,6 +593,28 @@ static int peer_has_ufo(VirtIONet *n)
>      return n->has_ufo;
>  }
>
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
>  static void virtio_net_set_mrg_rx_bufs(VirtIONet *n, int mergeable_rx_bufs,
>                                         int version_1, int hash_report)
>  {
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
> @@ -3450,30 +3471,30 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>
>      virtio_net_set_config_size(n, n->host_features);
>      virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
> -
> +    virtio_net_set_default_queue_size(n);
>      /*
>       * We set a lower limit on RX queue size to what it always was.
>       * Guests that want a smaller ring can always resize it without
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
> +                   VIRTIO_NET_VQ_MAX_SIZE );
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
> +                   VIRTIO_NET_VQ_MAX_SIZE);
>          virtio_cleanup(vdev);
>          return;
>      }
> @@ -3751,9 +3772,9 @@ static Property virtio_net_properties[] = {
>      DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
>      DEFINE_PROP_STRING("tx", VirtIONet, net_conf.tx),
>      DEFINE_PROP_UINT16("rx_queue_size", VirtIONet, net_conf.rx_queue_size,
> -                       VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE),
> +                       0),
>      DEFINE_PROP_UINT16("tx_queue_size", VirtIONet, net_conf.tx_queue_size,
> -                       VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE),
> +                       0),
>      DEFINE_PROP_UINT16("host_mtu", VirtIONet, net_conf.mtu, 0),
>      DEFINE_PROP_BOOL("x-mtu-bypass-backend", VirtIONet, mtu_bypass_backend,
>                       true),
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5d607aeaa0..ad9dfa20e7 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2286,11 +2286,15 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
>
>  void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
>  {
> +    int vq_max_size = VIRTQUEUE_MAX_SIZE;
> +    if (!strcmp(vdev->name, "virtio-net")) {
> +        vq_max_size = VIRTIO_NET_VQ_MAX_SIZE;
> +    }
>      /* Don't allow guest to flip queue between existent and
>       * nonexistent states, or to set it to an invalid size.
>       */
>      if (!!num != !!vdev->vq[n].vring.num ||
> -        num > VIRTQUEUE_MAX_SIZE ||
> +        num > vq_max_size ||
>          num < 0) {
>          return;
>      }
> @@ -2423,7 +2427,7 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
>              break;
>      }
>
> -    if (i == VIRTIO_QUEUE_MAX || queue_size > VIRTQUEUE_MAX_SIZE)
> +    if (i == VIRTIO_QUEUE_MAX )
>          abort();
>
>      vdev->vq[i].vring.num = queue_size;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index db1c0ddf6b..1f4d2eb5d7 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -50,6 +50,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *features,
>  typedef struct VirtQueue VirtQueue;
>
>  #define VIRTQUEUE_MAX_SIZE 1024
> +#define VIRTIO_NET_VQ_MAX_SIZE (4096)
>
>  typedef struct VirtQueueElement
>  {
> --
> 2.27.0
>


