Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19BF5BF6C1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 08:53:49 +0200 (CEST)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oatcC-0000hC-Ma
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 02:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oat9p-0003F3-8U
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 02:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oat9l-0002kL-HS
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 02:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663741464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ssAvmwcCm7aW4PriFdmULqVbWtY8pZO0Jzz/hHMIXhg=;
 b=QHyse4OIVYFmFpLHij9RpnE9gcPqrVq0Yw93rpMY2so9Lk4u1PxiU2fXOwGKJ3XE3yR14Y
 7nQ/kBABz4bmT7hrJ5AfaWsm15cp7lUvh08GN3JdCCw5UjYBzGHqYpTyoxDyF2OaXgCq3K
 J9Sl4EeZ0uEBymWSOZra8uUeHoQedmc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-27EbVNctNTOAB475QzmbCw-1; Wed, 21 Sep 2022 02:24:21 -0400
X-MC-Unique: 27EbVNctNTOAB475QzmbCw-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr12-20020a1709073f8c00b0077e8371f847so2606293ejc.20
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 23:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=ssAvmwcCm7aW4PriFdmULqVbWtY8pZO0Jzz/hHMIXhg=;
 b=bVdpgh4qnP0wd/lWXuAK2aBoZF0ir/XrLSmhHY1VL8JwIxyETw4/cu0LGgNcUQlKkX
 MR1xeE39n1SifRvM9JFFBQlhme+UOrSooxslMAga7uLtCcHY2SyYLt1D2gCM+v+BsCF7
 b5hYz34wg2kSueg9uazQ685dN43RvCR6yiI1j3NtnRuXqtK4iMJAX23TFRyY1NzxxcJd
 m+ZXPWVlzThdaLtAEdOuyFCVcQ2MXchdNAbMlrRkyedEzBW4E1ag74/D8G/K3hmqNeFU
 1p0vsv13yAE9rweijQDIxaEbB9DCQ62TapiiUPN4u7ELbFOAaHGIyLN+P2DxvQfLl+4K
 1acQ==
X-Gm-Message-State: ACrzQf1bF6FW+qp1qCT0iSAY6AazGmjm+jPFgdgHT6ZJv2DfUUqIHd15
 bWFsvMZoUnuLyk1d4EYBPwcqiq3EjGIYpdLuEoonWiAU0C+7FC/6kik9s5kg9VFm1QQWyQ5sM0i
 BffHO2LpS9Y8NTSE=
X-Received: by 2002:a05:6402:350a:b0:44e:9da7:2afb with SMTP id
 b10-20020a056402350a00b0044e9da72afbmr24029424edd.290.1663741459894; 
 Tue, 20 Sep 2022 23:24:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Ao/TFBiekgjwMXYbmr/xU4Za1PNWE/4X5zluf5I9XKGNEjknRD+jOA8wA/wk5sKoO+orQ/w==
X-Received: by 2002:a05:6402:350a:b0:44e:9da7:2afb with SMTP id
 b10-20020a056402350a00b0044e9da72afbmr24029403edd.290.1663741459584; 
 Tue, 20 Sep 2022 23:24:19 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 n15-20020a170906700f00b0078167cb4536sm833767ejj.118.2022.09.20.23.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 23:24:18 -0700 (PDT)
Date: Wed, 21 Sep 2022 02:24:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: liuhaiwei <liuhaiwei9699@126.com>, qemu-devel <qemu-devel@nongnu.org>,
 liuhaiwei <liuhaiwei@inspur.com>
Subject: Re: [PATCH] virtio-net: set the max of queue size to 4096
Message-ID: <20220921022309-mutt-send-email-mst@kernel.org>
References: <20220920011007.1972418-1-liuhaiwei9699@126.com>
 <CACGkMEuWDZzyBWOuAUVgxkUjBytStWC4U9RD0yWw49RS6RG6HA@mail.gmail.com>
 <CACGkMEuR9-311m3W4F9RSpnEuhGONQFoS5Ns6JErO56R7OU=dA@mail.gmail.com>
 <20220920080533-mutt-send-email-mst@kernel.org>
 <CACGkMEs+ExUGQMmqqx1_OTskDNeh4mULN_tFSvuLKb0nEdWASA@mail.gmail.com>
 <20220920235236-mutt-send-email-mst@kernel.org>
 <CACGkMEvduPNTbsSHMg3qZnKdQD7SyhVG7eZZambekixGmOrqyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEvduPNTbsSHMg3qZnKdQD7SyhVG7eZZambekixGmOrqyg@mail.gmail.com>
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

On Wed, Sep 21, 2022 at 02:15:41PM +0800, Jason Wang wrote:
> On Wed, Sep 21, 2022 at 11:57 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Sep 21, 2022 at 10:59:50AM +0800, Jason Wang wrote:
> > > On Tue, Sep 20, 2022 at 8:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Sep 20, 2022 at 10:03:23AM +0800, Jason Wang wrote:
> > > > > On Tue, Sep 20, 2022 at 9:38 AM Jason Wang <jasowang@redhat.com> wrote:
> > > > > >
> > > > > > On Tue, Sep 20, 2022 at 9:10 AM liuhaiwei <liuhaiwei9699@126.com> wrote:
> > > > > > >
> > > > > > > From: liuhaiwei <liuhaiwei@inspur.com>
> > > > > > >
> > > > > > > the limit of maximum of rx_queue_size and tx_queue to 1024 is so small as to affect our network performance when using the  virtio-net and vhost ,
> > > > > > > we cannot set the maximum size beyond 1k.
> > > > > > > why not enlarge the maximum size (such as 4096) when using the vhost backend?
> > > > > >
> > > > > > As Michael mentioned, there's a limitation in the kernel UIO_MAXIOV.
> > > > > > We need to find way to overcome that limit first.
> > > > >
> > > > > Btw, this probably means the skb needs to be built by vhost-net
> > > > > itself, instead of tuntap.
> > > > >
> > > > > Thanks
> > > >
> > > > That might help vhost-net but it won't help virtio-net.
> > > >
> > > > IMO the right fix is to add a separate limit on s/g size
> > > > to the spec. Block and scsi already have it, seems
> > > > reasonable to add it for others too.
> > >
> > > I wonder if it would be simpler to tie the limit to the virtqueue size.
> >
> > Simpler but wrong I think. As another example for RX we do not need s/g
> > at all with mergeable.
> 
> But this is not forbidden by the spec if I was not wrong.

Yes, it is forbidden for device not to support S/G on any queues.
There's no way to express such a device limitation in the spec.


> > At the same time deep queues are needed
> > to avoid underruns.
> >
> >
> >
> > > Having individual limits seems to complicate the migration compatibility anyhow.
> > >
> > > Thanks
> >
> > I don't see how it's materially different from queue size.
> 
> Yes.
> 
> > We need interfaces for that, that we lack now, userspace is
> > expected to guess a subset available on both ends.
> >
> 
> Ok.
> 
> Thanks
> 
> > > >
> > > >
> > > >
> > > > > >
> > > > > > Thanks
> > > > > >
> > > > > > >
> > > > > > > Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
> > > > > > > Signed-off-by: liuhaiwei <liuhaiwei@inspur.com>
> > > > > > > ---
> > > > > > >  hw/net/virtio-net.c        | 47 +++++++++++++++++++++++++++-----------
> > > > > > >  hw/virtio/virtio.c         |  8 +++++--
> > > > > > >  include/hw/virtio/virtio.h |  1 +
> > > > > > >  3 files changed, 41 insertions(+), 15 deletions(-)
> > > > > > >
> > > > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > > > index dd0d056fde..4b56484855 100644
> > > > > > > --- a/hw/net/virtio-net.c
> > > > > > > +++ b/hw/net/virtio-net.c
> > > > > > > @@ -52,12 +52,11 @@
> > > > > > >  #define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> > > > > > >
> > > > > > >  /* previously fixed value */
> > > > > > > -#define VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE 256
> > > > > > > -#define VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE 256
> > > > > > > +#define VIRTIO_NET_VHOST_USER_DEFAULT_SIZE 2048
> > > > > > >
> > > > > > >  /* for now, only allow larger queue_pairs; with virtio-1, guest can downsize */
> > > > > > > -#define VIRTIO_NET_RX_QUEUE_MIN_SIZE VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE
> > > > > > > -#define VIRTIO_NET_TX_QUEUE_MIN_SIZE VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE
> > > > > > > +#define VIRTIO_NET_RX_QUEUE_MIN_SIZE 256
> > > > > > > +#define VIRTIO_NET_TX_QUEUE_MIN_SIZE 256
> > > > > > >
> > > > > > >  #define VIRTIO_NET_IP4_ADDR_SIZE   8        /* ipv4 saddr + daddr */
> > > > > > >
> > > > > > > @@ -594,6 +593,28 @@ static int peer_has_ufo(VirtIONet *n)
> > > > > > >      return n->has_ufo;
> > > > > > >  }
> > > > > > >
> > > > > > > +static void virtio_net_set_default_queue_size(VirtIONet *n)
> > > > > > > +{
> > > > > > > +    NetClientState *peer = n->nic_conf.peers.ncs[0];
> > > > > > > +
> > > > > > > +    /* Default value is 0 if not set */
> > > > > > > +    if (n->net_conf.rx_queue_size == 0) {
> > > > > > > +        if (peer && peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> > > > > > > +            n->net_conf.rx_queue_size = VIRTIO_NET_VHOST_USER_DEFAULT_SIZE;
> > > > > > > +        } else {
> > > > > > > +            n->net_conf.rx_queue_size = VIRTIO_NET_VQ_MAX_SIZE;
> > > > > > > +        }
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    if (n->net_conf.tx_queue_size == 0) {
> > > > > > > +        if (peer && peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> > > > > > > +            n->net_conf.tx_queue_size = VIRTIO_NET_VHOST_USER_DEFAULT_SIZE;
> > > > > > > +        } else {
> > > > > > > +            n->net_conf.tx_queue_size = VIRTIO_NET_VQ_MAX_SIZE;
> > > > > > > +        }
> > > > > > > +    }
> > > > > > > +}
> > > > > > > +
> > > > > > >  static void virtio_net_set_mrg_rx_bufs(VirtIONet *n, int mergeable_rx_bufs,
> > > > > > >                                         int version_1, int hash_report)
> > > > > > >  {
> > > > > > > @@ -633,7 +654,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
> > > > > > >       * size.
> > > > > > >       */
> > > > > > >      if (!peer) {
> > > > > > > -        return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> > > > > > > +        return VIRTIO_NET_VQ_MAX_SIZE;
> > > > > > >      }
> > > > > > >
> > > > > > >      switch(peer->info->type) {
> > > > > > > @@ -641,7 +662,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
> > > > > > >      case NET_CLIENT_DRIVER_VHOST_VDPA:
> > > > > > >          return VIRTQUEUE_MAX_SIZE;
> > > > > > >      default:
> > > > > > > -        return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> > > > > > > +        return VIRTIO_NET_VQ_MAX_SIZE;
> > > > > > >      };
> > > > > > >  }
> > > > > > >
> > > > > > > @@ -3450,30 +3471,30 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > > > > > >
> > > > > > >      virtio_net_set_config_size(n, n->host_features);
> > > > > > >      virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
> > > > > > > -
> > > > > > > +    virtio_net_set_default_queue_size(n);
> > > > > > >      /*
> > > > > > >       * We set a lower limit on RX queue size to what it always was.
> > > > > > >       * Guests that want a smaller ring can always resize it without
> > > > > > >       * help from us (using virtio 1 and up).
> > > > > > >       */
> > > > > > >      if (n->net_conf.rx_queue_size < VIRTIO_NET_RX_QUEUE_MIN_SIZE ||
> > > > > > > -        n->net_conf.rx_queue_size > VIRTQUEUE_MAX_SIZE ||
> > > > > > > +        n->net_conf.rx_queue_size > VIRTIO_NET_VQ_MAX_SIZE ||
> > > > > > >          !is_power_of_2(n->net_conf.rx_queue_size)) {
> > > > > > >          error_setg(errp, "Invalid rx_queue_size (= %" PRIu16 "), "
> > > > > > >                     "must be a power of 2 between %d and %d.",
> > > > > > >                     n->net_conf.rx_queue_size, VIRTIO_NET_RX_QUEUE_MIN_SIZE,
> > > > > > > -                   VIRTQUEUE_MAX_SIZE);
> > > > > > > +                   VIRTIO_NET_VQ_MAX_SIZE );
> > > > > > >          virtio_cleanup(vdev);
> > > > > > >          return;
> > > > > > >      }
> > > > > > >
> > > > > > >      if (n->net_conf.tx_queue_size < VIRTIO_NET_TX_QUEUE_MIN_SIZE ||
> > > > > > > -        n->net_conf.tx_queue_size > VIRTQUEUE_MAX_SIZE ||
> > > > > > > +        n->net_conf.tx_queue_size > VIRTIO_NET_VQ_MAX_SIZE ||
> > > > > > >          !is_power_of_2(n->net_conf.tx_queue_size)) {
> > > > > > >          error_setg(errp, "Invalid tx_queue_size (= %" PRIu16 "), "
> > > > > > >                     "must be a power of 2 between %d and %d",
> > > > > > >                     n->net_conf.tx_queue_size, VIRTIO_NET_TX_QUEUE_MIN_SIZE,
> > > > > > > -                   VIRTQUEUE_MAX_SIZE);
> > > > > > > +                   VIRTIO_NET_VQ_MAX_SIZE);
> > > > > > >          virtio_cleanup(vdev);
> > > > > > >          return;
> > > > > > >      }
> > > > > > > @@ -3751,9 +3772,9 @@ static Property virtio_net_properties[] = {
> > > > > > >      DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
> > > > > > >      DEFINE_PROP_STRING("tx", VirtIONet, net_conf.tx),
> > > > > > >      DEFINE_PROP_UINT16("rx_queue_size", VirtIONet, net_conf.rx_queue_size,
> > > > > > > -                       VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE),
> > > > > > > +                       0),
> > > > > > >      DEFINE_PROP_UINT16("tx_queue_size", VirtIONet, net_conf.tx_queue_size,
> > > > > > > -                       VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE),
> > > > > > > +                       0),
> > > > > > >      DEFINE_PROP_UINT16("host_mtu", VirtIONet, net_conf.mtu, 0),
> > > > > > >      DEFINE_PROP_BOOL("x-mtu-bypass-backend", VirtIONet, mtu_bypass_backend,
> > > > > > >                       true),
> > > > > > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > > > > > index 5d607aeaa0..ad9dfa20e7 100644
> > > > > > > --- a/hw/virtio/virtio.c
> > > > > > > +++ b/hw/virtio/virtio.c
> > > > > > > @@ -2286,11 +2286,15 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
> > > > > > >
> > > > > > >  void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
> > > > > > >  {
> > > > > > > +    int vq_max_size = VIRTQUEUE_MAX_SIZE;
> > > > > > > +    if (!strcmp(vdev->name, "virtio-net")) {
> > > > > > > +        vq_max_size = VIRTIO_NET_VQ_MAX_SIZE;
> > > > > > > +    }
> > > > > > >      /* Don't allow guest to flip queue between existent and
> > > > > > >       * nonexistent states, or to set it to an invalid size.
> > > > > > >       */
> > > > > > >      if (!!num != !!vdev->vq[n].vring.num ||
> > > > > > > -        num > VIRTQUEUE_MAX_SIZE ||
> > > > > > > +        num > vq_max_size ||
> > > > > > >          num < 0) {
> > > > > > >          return;
> > > > > > >      }
> > > > > > > @@ -2423,7 +2427,7 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
> > > > > > >              break;
> > > > > > >      }
> > > > > > >
> > > > > > > -    if (i == VIRTIO_QUEUE_MAX || queue_size > VIRTQUEUE_MAX_SIZE)
> > > > > > > +    if (i == VIRTIO_QUEUE_MAX )
> > > > > > >          abort();
> > > > > > >
> > > > > > >      vdev->vq[i].vring.num = queue_size;
> > > > > > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > > > > > index db1c0ddf6b..1f4d2eb5d7 100644
> > > > > > > --- a/include/hw/virtio/virtio.h
> > > > > > > +++ b/include/hw/virtio/virtio.h
> > > > > > > @@ -50,6 +50,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *features,
> > > > > > >  typedef struct VirtQueue VirtQueue;
> > > > > > >
> > > > > > >  #define VIRTQUEUE_MAX_SIZE 1024
> > > > > > > +#define VIRTIO_NET_VQ_MAX_SIZE (4096)
> > > > > > >
> > > > > > >  typedef struct VirtQueueElement
> > > > > > >  {
> > > > > > > --
> > > > > > > 2.27.0
> > > > > > >
> > > >
> >


