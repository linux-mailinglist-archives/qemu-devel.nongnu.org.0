Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2825BCC91
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:07:45 +0200 (CEST)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGUy-0005yr-24
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaGPd-00007z-Sz
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaGPW-00038M-1Y
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663592519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WqkwXv1dE7pq/uu4YhxJpFjvjFo747/LE/EL8RMztug=;
 b=QyWhv6kRi7JhDG8qgSRj1msOjhPuqQXacYNmMB+Ql1515yPEZEXq0KMdYg2mpPrw0s0603
 jucIcMSKsfA2on9PQgH+7ZB00L6MJDikFVnLFneNSdTIOggPTuYrAOCt8nkSukmIxDWPhG
 TwRfVVCJ/CFSl6pAQfvS0g36TBdGffM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-4QgZdGz-PKWKpcDp82jKOA-1; Mon, 19 Sep 2022 09:01:50 -0400
X-MC-Unique: 4QgZdGz-PKWKpcDp82jKOA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v190-20020a1cacc7000000b003b4ab30188fso4639058wme.2
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 06:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=WqkwXv1dE7pq/uu4YhxJpFjvjFo747/LE/EL8RMztug=;
 b=U5uD39v3TmVLiByaCK2Tm3O+B0ZZ4vb+HECQSWS1SeUTFvZl9wIJFUSPGAznhQu59p
 XH3NtJ3LufoXmfORbnMnkIZJjFPNtNzaEXJLfFImHkz5A3QMPsdPuwSz+GJvUKjBcx47
 f1g2RQNRBhoaYpazowkvss93KbebsAaHOPNkP7xsd5aS/L17Mp1bMSVc3AKb179Njhua
 Frk1kVESijBs/kpPKWW3IoASOVqHbbqIaZRLmlEY33Hj6mh3u38OsVXxRhDF5B4HLpaV
 yW17r8Sgw9wSlhdOyBEhp+CQ0TnY0FroQ6kKXwWTsRnIinzXmyK8AbYMLDeoZo9f+KK/
 4dqA==
X-Gm-Message-State: ACrzQf1px1yz4jo4HlNwacHr9v6IhcalVX21CXb3iUeYbWrriKyJq00C
 QjU/W5DG4pgauh1eR75aCE2F6OkqDihmCxPstIbYIPtxjSbrPijUV9isg8egByCJyoj1VsahkMG
 Pf3+wGuovWohUHHg=
X-Received: by 2002:a05:600c:1d94:b0:3b4:7b91:7056 with SMTP id
 p20-20020a05600c1d9400b003b47b917056mr11965032wms.18.1663592505832; 
 Mon, 19 Sep 2022 06:01:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gGPaafLX3yxo4v+Dble+7U9lYPd1YiZa8/rDFIMiwLO+1xiHfuCCVWIVkSuJS7D77zjmM5A==
X-Received: by 2002:a05:600c:1d94:b0:3b4:7b91:7056 with SMTP id
 p20-20020a05600c1d9400b003b47b917056mr11965006wms.18.1663592505424; 
 Mon, 19 Sep 2022 06:01:45 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7405:1600:9bc2:3f5f:ab9b:cbf4])
 by smtp.gmail.com with ESMTPSA id
 bg19-20020a05600c3c9300b003a5c999cd1asm7617712wmb.14.2022.09.19.06.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 06:01:44 -0700 (PDT)
Date: Mon, 19 Sep 2022 09:01:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: liuhaiwei <liuhaiwei9699@126.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com
Subject: Re: [PATCH] virtio-net: set the max of queue size to 4096 according
 to the virtio specs, The maximum Queue Size value is 32768  :
 https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-240006
Message-ID: <20220919085751-mutt-send-email-mst@kernel.org>
References: <20220919122822.1928748-1-liuhaiwei9699@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919122822.1928748-1-liuhaiwei9699@126.com>
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

subject is unreasonably long.
limit it to 50 characters. esp links do not belong there.

Looks like this is a repost, ignoring most comments
on the previous version.

This kind of thing is ok as a conversation starter but then
pls add RFC in the subject.


On Mon, Sep 19, 2022 at 08:28:22AM -0400, liuhaiwei wrote:
> the limit of maximum of rx_queue_size and tx_queue to 1024 is so small as to affect our network performance when using the  virtio-net and vhost ,
> we cannot set the maximum size beyond 1k.


don't use such long lines in the commit log.  The line length for the
body text of a commit message should be constrained to 80 characters. 

> why not enlarge the maximum size (such as 4096) when using the vhost backend?

because we might then theoretically get a single s/g exceeding 1k,
and that does not fit in an iovec.

> 
> Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
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

() not needed

>  typedef struct VirtQueueElement
>  {
> -- 
> 2.27.0


