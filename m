Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60EE401601
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 07:51:39 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN7Xe-0004Ld-5D
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 01:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mN7Vm-0002gy-P6
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 01:49:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mN7Vh-0006uz-21
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 01:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630907375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZwilJKPFom4Vuj9J2r9l7O0HQmDfpQXuOUprzLeaUMk=;
 b=ZcMZoUih3HANFhf6A5RY+5qpiyWVO4SrO2ILvCQ8VRr0iBrOcB2DSMCXUUVGaTXt6NaNC7
 fqUs2mEdfUnU9P9L9HjOJDVrOKvPMTN484KbAC29zhIycyq0K3E9eBio5Fa96R1ZI4ncgy
 ZGLQH8lHFf956TArPCT/PKfF5nhLSt0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-gaampi-IPkuF28EuXzvVig-1; Mon, 06 Sep 2021 01:49:31 -0400
X-MC-Unique: gaampi-IPkuF28EuXzvVig-1
Received: by mail-wm1-f70.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso2802730wma.4
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 22:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZwilJKPFom4Vuj9J2r9l7O0HQmDfpQXuOUprzLeaUMk=;
 b=fkdNYDT7EsMPVQuc2tJUBp09QuwS96/ZWVmDNCxhsRf1uy0ITkyxT6f7fA/4tebRuL
 oBCT376JYKRXgOY2HIGKdqNo7TLWmIFMWia6/XjgV7jEEQ/R+MZkE7DkwKgmGun7cGad
 0JLKk55OHQGTYSNr7FVP7uDFH8SxIQFkUVfqyT+gJA0D4o3dS2srxePdKw7pDQy8Wer/
 QdKJDINPGJCb/nomZKAA0CJ0ui0HaThCTnDgCMllDs/b/IxF9xJEaY4HS/T5Fj26fyRl
 oVzX0fFK6hIkDw6mxEmGNkXDEYMu4S+JqWR96ssW8p0FwiiOujBz+ZikEl6a8W43XDq1
 AB9Q==
X-Gm-Message-State: AOAM530zvXMAaP9icvHSJxNFAUiXGa2sa4+w6ejWBs+50dt8DYjgfh+q
 yZ0Qjc8TAAzKAOjD9fYhXq7PPcCQ4CoKhogZLp1neXQC4CMtElPfPz9ulwipU862tdsrN9tvJBe
 6BwHST7iumAVPKX4=
X-Received: by 2002:adf:b743:: with SMTP id n3mr11118924wre.243.1630907370248; 
 Sun, 05 Sep 2021 22:49:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVTVp9/ck1Ih0kyDu+UM/R9bwSsKxCUFByCjqY8NmeoGKUa+G2afAqN+/eyjWYMgvnx9SyDQ==
X-Received: by 2002:adf:b743:: with SMTP id n3mr11118896wre.243.1630907369757; 
 Sun, 05 Sep 2021 22:49:29 -0700 (PDT)
Received: from redhat.com ([2.55.131.183])
 by smtp.gmail.com with ESMTPSA id l26sm6215445wmi.13.2021.09.05.22.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 22:49:28 -0700 (PDT)
Date: Mon, 6 Sep 2021 01:49:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 18/21] virito-net: use "qps" instead of "queues" when
 possible
Message-ID: <20210906014829-mutt-send-email-mst@kernel.org>
References: <20210903091031.47303-1-jasowang@redhat.com>
 <20210903091031.47303-19-jasowang@redhat.com>
 <20210904164144-mutt-send-email-mst@kernel.org>
 <CACGkMEsT1YNBJt-8c4sm1==1XWfmw_ay4-FYC5+xsAQeKiS-Tg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsT1YNBJt-8c4sm1==1XWfmw_ay4-FYC5+xsAQeKiS-Tg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Cindy Lu <lulu@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>, eperezma <eperezma@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 11:42:41AM +0800, Jason Wang wrote:
> On Sun, Sep 5, 2021 at 4:42 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Sep 03, 2021 at 05:10:28PM +0800, Jason Wang wrote:
> > > Most of the time, "queues" really means queue pairs. So this patch
> > > switch to use "qps" to avoid confusion.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> >
> > This is far from a standard terminology, except for the people
> > like me, who's mind is permanently warped by close contact with infiniband
> > hardware. Please eschew abbreviation, just say queue_pairs.
> 
> Ok, I will do that in the next version.
> 
> Thanks


Also, s/virito/virtio/
Happens to me too, often enough that I have an abbreviation set up in
vimrc.

> >
> > > ---
> > >  hw/net/vhost_net.c             |   6 +-
> > >  hw/net/virtio-net.c            | 150 ++++++++++++++++-----------------
> > >  include/hw/virtio/virtio-net.h |   4 +-
> > >  3 files changed, 80 insertions(+), 80 deletions(-)
> > >
> > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > index 7e0b60b4d9..b40fdfa625 100644
> > > --- a/hw/net/vhost_net.c
> > > +++ b/hw/net/vhost_net.c
> > > @@ -337,7 +337,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> > >          if (i < data_qps) {
> > >              peer = qemu_get_peer(ncs, i);
> > >          } else { /* Control Virtqueue */
> > > -            peer = qemu_get_peer(ncs, n->max_queues);
> > > +            peer = qemu_get_peer(ncs, n->max_qps);
> > >          }
> > >
> > >          net = get_vhost_net(peer);
> > > @@ -362,7 +362,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> > >          if (i < data_qps) {
> > >              peer = qemu_get_peer(ncs, i);
> > >          } else {
> > > -            peer = qemu_get_peer(ncs, n->max_queues);
> > > +            peer = qemu_get_peer(ncs, n->max_qps);
> > >          }
> > >          r = vhost_net_start_one(get_vhost_net(peer), dev);
> > >
> > > @@ -412,7 +412,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> > >          if (i < data_qps) {
> > >              peer = qemu_get_peer(ncs, i);
> > >          } else {
> > > -            peer = qemu_get_peer(ncs, n->max_queues);
> > > +            peer = qemu_get_peer(ncs, n->max_qps);
> > >          }
> > >          vhost_net_stop_one(get_vhost_net(peer), dev);
> > >      }
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index 8fccbaa44c..0a5d9862ec 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -54,7 +54,7 @@
> > >  #define VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE 256
> > >  #define VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE 256
> > >
> > > -/* for now, only allow larger queues; with virtio-1, guest can downsize */
> > > +/* for now, only allow larger qps; with virtio-1, guest can downsize */
> > >  #define VIRTIO_NET_RX_QUEUE_MIN_SIZE VIRTIO_NET_RX_QUEUE_DEFAULT_SIZE
> > >  #define VIRTIO_NET_TX_QUEUE_MIN_SIZE VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE
> > >
> > > @@ -131,7 +131,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> > >      int ret = 0;
> > >      memset(&netcfg, 0 , sizeof(struct virtio_net_config));
> > >      virtio_stw_p(vdev, &netcfg.status, n->status);
> > > -    virtio_stw_p(vdev, &netcfg.max_virtqueue_pairs, n->max_queues);
> > > +    virtio_stw_p(vdev, &netcfg.max_virtqueue_pairs, n->max_qps);
> > >      virtio_stw_p(vdev, &netcfg.mtu, n->net_conf.mtu);
> > >      memcpy(netcfg.mac, n->mac, ETH_ALEN);
> > >      virtio_stl_p(vdev, &netcfg.speed, n->net_conf.speed);
> > > @@ -243,7 +243,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
> > >  {
> > >      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> > >      NetClientState *nc = qemu_get_queue(n->nic);
> > > -    int queues = n->multiqueue ? n->max_queues : 1;
> > > +    int qps = n->multiqueue ? n->max_qps : 1;
> > >
> > >      if (!get_vhost_net(nc->peer)) {
> > >          return;
> > > @@ -266,7 +266,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
> > >          /* Any packets outstanding? Purge them to avoid touching rings
> > >           * when vhost is running.
> > >           */
> > > -        for (i = 0;  i < queues; i++) {
> > > +        for (i = 0;  i < qps; i++) {
> > >              NetClientState *qnc = qemu_get_subqueue(n->nic, i);
> > >
> > >              /* Purge both directions: TX and RX. */
> > > @@ -285,14 +285,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
> > >          }
> > >
> > >          n->vhost_started = 1;
> > > -        r = vhost_net_start(vdev, n->nic->ncs, queues, 0);
> > > +        r = vhost_net_start(vdev, n->nic->ncs, qps, 0);
> > >          if (r < 0) {
> > >              error_report("unable to start vhost net: %d: "
> > >                           "falling back on userspace virtio", -r);
> > >              n->vhost_started = 0;
> > >          }
> > >      } else {
> > > -        vhost_net_stop(vdev, n->nic->ncs, queues, 0);
> > > +        vhost_net_stop(vdev, n->nic->ncs, qps, 0);
> > >          n->vhost_started = 0;
> > >      }
> > >  }
> > > @@ -309,11 +309,11 @@ static int virtio_net_set_vnet_endian_one(VirtIODevice *vdev,
> > >  }
> > >
> > >  static bool virtio_net_set_vnet_endian(VirtIODevice *vdev, NetClientState *ncs,
> > > -                                       int queues, bool enable)
> > > +                                       int qps, bool enable)
> > >  {
> > >      int i;
> > >
> > > -    for (i = 0; i < queues; i++) {
> > > +    for (i = 0; i < qps; i++) {
> > >          if (virtio_net_set_vnet_endian_one(vdev, ncs[i].peer, enable) < 0 &&
> > >              enable) {
> > >              while (--i >= 0) {
> > > @@ -330,7 +330,7 @@ static bool virtio_net_set_vnet_endian(VirtIODevice *vdev, NetClientState *ncs,
> > >  static void virtio_net_vnet_endian_status(VirtIONet *n, uint8_t status)
> > >  {
> > >      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> > > -    int queues = n->multiqueue ? n->max_queues : 1;
> > > +    int qps = n->multiqueue ? n->max_qps : 1;
> > >
> > >      if (virtio_net_started(n, status)) {
> > >          /* Before using the device, we tell the network backend about the
> > > @@ -339,14 +339,14 @@ static void virtio_net_vnet_endian_status(VirtIONet *n, uint8_t status)
> > >           * virtio-net code.
> > >           */
> > >          n->needs_vnet_hdr_swap = virtio_net_set_vnet_endian(vdev, n->nic->ncs,
> > > -                                                            queues, true);
> > > +                                                            qps, true);
> > >      } else if (virtio_net_started(n, vdev->status)) {
> > >          /* After using the device, we need to reset the network backend to
> > >           * the default (guest native endianness), otherwise the guest may
> > >           * lose network connectivity if it is rebooted into a different
> > >           * endianness.
> > >           */
> > > -        virtio_net_set_vnet_endian(vdev, n->nic->ncs, queues, false);
> > > +        virtio_net_set_vnet_endian(vdev, n->nic->ncs, qps, false);
> > >      }
> > >  }
> > >
> > > @@ -368,12 +368,12 @@ static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t status)
> > >      virtio_net_vnet_endian_status(n, status);
> > >      virtio_net_vhost_status(n, status);
> > >
> > > -    for (i = 0; i < n->max_queues; i++) {
> > > +    for (i = 0; i < n->max_qps; i++) {
> > >          NetClientState *ncs = qemu_get_subqueue(n->nic, i);
> > >          bool queue_started;
> > >          q = &n->vqs[i];
> > >
> > > -        if ((!n->multiqueue && i != 0) || i >= n->curr_queues) {
> > > +        if ((!n->multiqueue && i != 0) || i >= n->curr_qps) {
> > >              queue_status = 0;
> > >          } else {
> > >              queue_status = status;
> > > @@ -540,7 +540,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
> > >      n->nouni = 0;
> > >      n->nobcast = 0;
> > >      /* multiqueue is disabled by default */
> > > -    n->curr_queues = 1;
> > > +    n->curr_qps = 1;
> > >      timer_del(n->announce_timer.tm);
> > >      n->announce_timer.round = 0;
> > >      n->status &= ~VIRTIO_NET_S_ANNOUNCE;
> > > @@ -556,7 +556,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
> > >      memset(n->vlans, 0, MAX_VLAN >> 3);
> > >
> > >      /* Flush any async TX */
> > > -    for (i = 0;  i < n->max_queues; i++) {
> > > +    for (i = 0;  i < n->max_qps; i++) {
> > >          NetClientState *nc = qemu_get_subqueue(n->nic, i);
> > >
> > >          if (nc->peer) {
> > > @@ -610,7 +610,7 @@ static void virtio_net_set_mrg_rx_bufs(VirtIONet *n, int mergeable_rx_bufs,
> > >              sizeof(struct virtio_net_hdr);
> > >      }
> > >
> > > -    for (i = 0; i < n->max_queues; i++) {
> > > +    for (i = 0; i < n->max_qps; i++) {
> > >          nc = qemu_get_subqueue(n->nic, i);
> > >
> > >          if (peer_has_vnet_hdr(n) &&
> > > @@ -655,7 +655,7 @@ static int peer_attach(VirtIONet *n, int index)
> > >          return 0;
> > >      }
> > >
> > > -    if (n->max_queues == 1) {
> > > +    if (n->max_qps == 1) {
> > >          return 0;
> > >      }
> > >
> > > @@ -681,7 +681,7 @@ static int peer_detach(VirtIONet *n, int index)
> > >      return tap_disable(nc->peer);
> > >  }
> > >
> > > -static void virtio_net_set_queues(VirtIONet *n)
> > > +static void virtio_net_set_qps(VirtIONet *n)
> > >  {
> > >      int i;
> > >      int r;
> > > @@ -690,8 +690,8 @@ static void virtio_net_set_queues(VirtIONet *n)
> > >          return;
> > >      }
> > >
> > > -    for (i = 0; i < n->max_queues; i++) {
> > > -        if (i < n->curr_queues) {
> > > +    for (i = 0; i < n->max_qps; i++) {
> > > +        if (i < n->curr_qps) {
> > >              r = peer_attach(n, i);
> > >              assert(!r);
> > >          } else {
> > > @@ -920,7 +920,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
> > >          virtio_net_apply_guest_offloads(n);
> > >      }
> > >
> > > -    for (i = 0;  i < n->max_queues; i++) {
> > > +    for (i = 0;  i < n->max_qps; i++) {
> > >          NetClientState *nc = qemu_get_subqueue(n->nic, i);
> > >
> > >          if (!get_vhost_net(nc->peer)) {
> > > @@ -1247,7 +1247,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
> > >      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> > >      struct virtio_net_rss_config cfg;
> > >      size_t s, offset = 0, size_get;
> > > -    uint16_t queues, i;
> > > +    uint16_t qps, i;
> > >      struct {
> > >          uint16_t us;
> > >          uint8_t b;
> > > @@ -1289,7 +1289,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
> > >      }
> > >      n->rss_data.default_queue = do_rss ?
> > >          virtio_lduw_p(vdev, &cfg.unclassified_queue) : 0;
> > > -    if (n->rss_data.default_queue >= n->max_queues) {
> > > +    if (n->rss_data.default_queue >= n->max_qps) {
> > >          err_msg = "Invalid default queue";
> > >          err_value = n->rss_data.default_queue;
> > >          goto error;
> > > @@ -1318,14 +1318,14 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
> > >      size_get = sizeof(temp);
> > >      s = iov_to_buf(iov, iov_cnt, offset, &temp, size_get);
> > >      if (s != size_get) {
> > > -        err_msg = "Can't get queues";
> > > +        err_msg = "Can't get qps";
> > >          err_value = (uint32_t)s;
> > >          goto error;
> > >      }
> > > -    queues = do_rss ? virtio_lduw_p(vdev, &temp.us) : n->curr_queues;
> > > -    if (queues == 0 || queues > n->max_queues) {
> > > -        err_msg = "Invalid number of queues";
> > > -        err_value = queues;
> > > +    qps = do_rss ? virtio_lduw_p(vdev, &temp.us) : n->curr_qps;
> > > +    if (qps == 0 || qps > n->max_qps) {
> > > +        err_msg = "Invalid number of qps";
> > > +        err_value = qps;
> > >          goto error;
> > >      }
> > >      if (temp.b > VIRTIO_NET_RSS_MAX_KEY_SIZE) {
> > > @@ -1340,7 +1340,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
> > >      }
> > >      if (!temp.b && !n->rss_data.hash_types) {
> > >          virtio_net_disable_rss(n);
> > > -        return queues;
> > > +        return qps;
> > >      }
> > >      offset += size_get;
> > >      size_get = temp.b;
> > > @@ -1373,7 +1373,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
> > >      trace_virtio_net_rss_enable(n->rss_data.hash_types,
> > >                                  n->rss_data.indirections_len,
> > >                                  temp.b);
> > > -    return queues;
> > > +    return qps;
> > >  error:
> > >      trace_virtio_net_rss_error(err_msg, err_value);
> > >      virtio_net_disable_rss(n);
> > > @@ -1384,15 +1384,15 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
> > >                                  struct iovec *iov, unsigned int iov_cnt)
> > >  {
> > >      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> > > -    uint16_t queues;
> > > +    uint16_t qps;
> > >
> > >      virtio_net_disable_rss(n);
> > >      if (cmd == VIRTIO_NET_CTRL_MQ_HASH_CONFIG) {
> > > -        queues = virtio_net_handle_rss(n, iov, iov_cnt, false);
> > > -        return queues ? VIRTIO_NET_OK : VIRTIO_NET_ERR;
> > > +        qps = virtio_net_handle_rss(n, iov, iov_cnt, false);
> > > +        return qps ? VIRTIO_NET_OK : VIRTIO_NET_ERR;
> > >      }
> > >      if (cmd == VIRTIO_NET_CTRL_MQ_RSS_CONFIG) {
> > > -        queues = virtio_net_handle_rss(n, iov, iov_cnt, true);
> > > +        qps = virtio_net_handle_rss(n, iov, iov_cnt, true);
> > >      } else if (cmd == VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET) {
> > >          struct virtio_net_ctrl_mq mq;
> > >          size_t s;
> > > @@ -1403,24 +1403,24 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
> > >          if (s != sizeof(mq)) {
> > >              return VIRTIO_NET_ERR;
> > >          }
> > > -        queues = virtio_lduw_p(vdev, &mq.virtqueue_pairs);
> > > +        qps = virtio_lduw_p(vdev, &mq.virtqueue_pairs);
> > >
> > >      } else {
> > >          return VIRTIO_NET_ERR;
> > >      }
> > >
> > > -    if (queues < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
> > > -        queues > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX ||
> > > -        queues > n->max_queues ||
> > > +    if (qps < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
> > > +        qps > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX ||
> > > +        qps > n->max_qps ||
> > >          !n->multiqueue) {
> > >          return VIRTIO_NET_ERR;
> > >      }
> > >
> > > -    n->curr_queues = queues;
> > > -    /* stop the backend before changing the number of queues to avoid handling a
> > > +    n->curr_qps = qps;
> > > +    /* stop the backend before changing the number of qps to avoid handling a
> > >       * disabled queue */
> > >      virtio_net_set_status(vdev, vdev->status);
> > > -    virtio_net_set_queues(n);
> > > +    virtio_net_set_qps(n);
> > >
> > >      return VIRTIO_NET_OK;
> > >  }
> > > @@ -1498,7 +1498,7 @@ static bool virtio_net_can_receive(NetClientState *nc)
> > >          return false;
> > >      }
> > >
> > > -    if (nc->queue_index >= n->curr_queues) {
> > > +    if (nc->queue_index >= n->curr_qps) {
> > >          return false;
> > >      }
> > >
> > > @@ -2753,11 +2753,11 @@ static void virtio_net_del_queue(VirtIONet *n, int index)
> > >      virtio_del_queue(vdev, index * 2 + 1);
> > >  }
> > >
> > > -static void virtio_net_change_num_queues(VirtIONet *n, int new_max_queues)
> > > +static void virtio_net_change_num_qps(VirtIONet *n, int new_max_qps)
> > >  {
> > >      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> > >      int old_num_queues = virtio_get_num_queues(vdev);
> > > -    int new_num_queues = new_max_queues * 2 + 1;
> > > +    int new_num_queues = new_max_qps * 2 + 1;
> > >      int i;
> > >
> > >      assert(old_num_queues >= 3);
> > > @@ -2790,12 +2790,12 @@ static void virtio_net_change_num_queues(VirtIONet *n, int new_max_queues)
> > >
> > >  static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue)
> > >  {
> > > -    int max = multiqueue ? n->max_queues : 1;
> > > +    int max = multiqueue ? n->max_qps : 1;
> > >
> > >      n->multiqueue = multiqueue;
> > > -    virtio_net_change_num_queues(n, max);
> > > +    virtio_net_change_num_qps(n, max);
> > >
> > > -    virtio_net_set_queues(n);
> > > +    virtio_net_set_qps(n);
> > >  }
> > >
> > >  static int virtio_net_post_load_device(void *opaque, int version_id)
> > > @@ -2828,7 +2828,7 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
> > >       */
> > >      n->saved_guest_offloads = n->curr_guest_offloads;
> > >
> > > -    virtio_net_set_queues(n);
> > > +    virtio_net_set_qps(n);
> > >
> > >      /* Find the first multicast entry in the saved MAC filter */
> > >      for (i = 0; i < n->mac_table.in_use; i++) {
> > > @@ -2841,7 +2841,7 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
> > >      /* nc.link_down can't be migrated, so infer link_down according
> > >       * to link status bit in n->status */
> > >      link_down = (n->status & VIRTIO_NET_S_LINK_UP) == 0;
> > > -    for (i = 0; i < n->max_queues; i++) {
> > > +    for (i = 0; i < n->max_qps; i++) {
> > >          qemu_get_subqueue(n->nic, i)->link_down = link_down;
> > >      }
> > >
> > > @@ -2906,9 +2906,9 @@ static const VMStateDescription vmstate_virtio_net_queue_tx_waiting = {
> > >     },
> > >  };
> > >
> > > -static bool max_queues_gt_1(void *opaque, int version_id)
> > > +static bool max_qps_gt_1(void *opaque, int version_id)
> > >  {
> > > -    return VIRTIO_NET(opaque)->max_queues > 1;
> > > +    return VIRTIO_NET(opaque)->max_qps > 1;
> > >  }
> > >
> > >  static bool has_ctrl_guest_offloads(void *opaque, int version_id)
> > > @@ -2933,13 +2933,13 @@ static bool mac_table_doesnt_fit(void *opaque, int version_id)
> > >  struct VirtIONetMigTmp {
> > >      VirtIONet      *parent;
> > >      VirtIONetQueue *vqs_1;
> > > -    uint16_t        curr_queues_1;
> > > +    uint16_t        curr_qps_1;
> > >      uint8_t         has_ufo;
> > >      uint32_t        has_vnet_hdr;
> > >  };
> > >
> > >  /* The 2nd and subsequent tx_waiting flags are loaded later than
> > > - * the 1st entry in the queues and only if there's more than one
> > > + * the 1st entry in the qps and only if there's more than one
> > >   * entry.  We use the tmp mechanism to calculate a temporary
> > >   * pointer and count and also validate the count.
> > >   */
> > > @@ -2949,9 +2949,9 @@ static int virtio_net_tx_waiting_pre_save(void *opaque)
> > >      struct VirtIONetMigTmp *tmp = opaque;
> > >
> > >      tmp->vqs_1 = tmp->parent->vqs + 1;
> > > -    tmp->curr_queues_1 = tmp->parent->curr_queues - 1;
> > > -    if (tmp->parent->curr_queues == 0) {
> > > -        tmp->curr_queues_1 = 0;
> > > +    tmp->curr_qps_1 = tmp->parent->curr_qps - 1;
> > > +    if (tmp->parent->curr_qps == 0) {
> > > +        tmp->curr_qps_1 = 0;
> > >      }
> > >
> > >      return 0;
> > > @@ -2964,9 +2964,9 @@ static int virtio_net_tx_waiting_pre_load(void *opaque)
> > >      /* Reuse the pointer setup from save */
> > >      virtio_net_tx_waiting_pre_save(opaque);
> > >
> > > -    if (tmp->parent->curr_queues > tmp->parent->max_queues) {
> > > -        error_report("virtio-net: curr_queues %x > max_queues %x",
> > > -            tmp->parent->curr_queues, tmp->parent->max_queues);
> > > +    if (tmp->parent->curr_qps > tmp->parent->max_qps) {
> > > +        error_report("virtio-net: curr_qps %x > max_qps %x",
> > > +            tmp->parent->curr_qps, tmp->parent->max_qps);
> > >
> > >          return -EINVAL;
> > >      }
> > > @@ -2980,7 +2980,7 @@ static const VMStateDescription vmstate_virtio_net_tx_waiting = {
> > >      .pre_save  = virtio_net_tx_waiting_pre_save,
> > >      .fields    = (VMStateField[]) {
> > >          VMSTATE_STRUCT_VARRAY_POINTER_UINT16(vqs_1, struct VirtIONetMigTmp,
> > > -                                     curr_queues_1,
> > > +                                     curr_qps_1,
> > >                                       vmstate_virtio_net_queue_tx_waiting,
> > >                                       struct VirtIONetQueue),
> > >          VMSTATE_END_OF_LIST()
> > > @@ -3122,9 +3122,9 @@ static const VMStateDescription vmstate_virtio_net_device = {
> > >          VMSTATE_UINT8(nobcast, VirtIONet),
> > >          VMSTATE_WITH_TMP(VirtIONet, struct VirtIONetMigTmp,
> > >                           vmstate_virtio_net_has_ufo),
> > > -        VMSTATE_SINGLE_TEST(max_queues, VirtIONet, max_queues_gt_1, 0,
> > > +        VMSTATE_SINGLE_TEST(max_qps, VirtIONet, max_qps_gt_1, 0,
> > >                              vmstate_info_uint16_equal, uint16_t),
> > > -        VMSTATE_UINT16_TEST(curr_queues, VirtIONet, max_queues_gt_1),
> > > +        VMSTATE_UINT16_TEST(curr_qps, VirtIONet, max_qps_gt_1),
> > >          VMSTATE_WITH_TMP(VirtIONet, struct VirtIONetMigTmp,
> > >                           vmstate_virtio_net_tx_waiting),
> > >          VMSTATE_UINT64_TEST(curr_guest_offloads, VirtIONet,
> > > @@ -3368,16 +3368,16 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > >          return;
> > >      }
> > >
> > > -    n->max_queues = MAX(n->nic_conf.peers.queues, 1);
> > > -    if (n->max_queues * 2 + 1 > VIRTIO_QUEUE_MAX) {
> > > -        error_setg(errp, "Invalid number of queues (= %" PRIu32 "), "
> > > +    n->max_qps = MAX(n->nic_conf.peers.queues, 1);
> > > +    if (n->max_qps * 2 + 1 > VIRTIO_QUEUE_MAX) {
> > > +        error_setg(errp, "Invalid number of qps (= %" PRIu32 "), "
> > >                     "must be a positive integer less than %d.",
> > > -                   n->max_queues, (VIRTIO_QUEUE_MAX - 1) / 2);
> > > +                   n->max_qps, (VIRTIO_QUEUE_MAX - 1) / 2);
> > >          virtio_cleanup(vdev);
> > >          return;
> > >      }
> > > -    n->vqs = g_malloc0(sizeof(VirtIONetQueue) * n->max_queues);
> > > -    n->curr_queues = 1;
> > > +    n->vqs = g_malloc0(sizeof(VirtIONetQueue) * n->max_qps);
> > > +    n->curr_qps = 1;
> > >      n->tx_timeout = n->net_conf.txtimer;
> > >
> > >      if (n->net_conf.tx && strcmp(n->net_conf.tx, "timer")
> > > @@ -3391,7 +3391,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > >      n->net_conf.tx_queue_size = MIN(virtio_net_max_tx_queue_size(n),
> > >                                      n->net_conf.tx_queue_size);
> > >
> > > -    for (i = 0; i < n->max_queues; i++) {
> > > +    for (i = 0; i < n->max_qps; i++) {
> > >          virtio_net_add_queue(n, i);
> > >      }
> > >
> > > @@ -3415,13 +3415,13 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > >                                object_get_typename(OBJECT(dev)), dev->id, n);
> > >      }
> > >
> > > -    for (i = 0; i < n->max_queues; i++) {
> > > +    for (i = 0; i < n->max_qps; i++) {
> > >          n->nic->ncs[i].do_not_pad = true;
> > >      }
> > >
> > >      peer_test_vnet_hdr(n);
> > >      if (peer_has_vnet_hdr(n)) {
> > > -        for (i = 0; i < n->max_queues; i++) {
> > > +        for (i = 0; i < n->max_qps; i++) {
> > >              qemu_using_vnet_hdr(qemu_get_subqueue(n->nic, i)->peer, true);
> > >          }
> > >          n->host_hdr_len = sizeof(struct virtio_net_hdr);
> > > @@ -3463,7 +3463,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
> > >  {
> > >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > >      VirtIONet *n = VIRTIO_NET(dev);
> > > -    int i, max_queues;
> > > +    int i, max_qps;
> > >
> > >      if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
> > >          virtio_net_unload_ebpf(n);
> > > @@ -3485,12 +3485,12 @@ static void virtio_net_device_unrealize(DeviceState *dev)
> > >          remove_migration_state_change_notifier(&n->migration_state);
> > >      }
> > >
> > > -    max_queues = n->multiqueue ? n->max_queues : 1;
> > > -    for (i = 0; i < max_queues; i++) {
> > > +    max_qps = n->multiqueue ? n->max_qps : 1;
> > > +    for (i = 0; i < max_qps; i++) {
> > >          virtio_net_del_queue(n, i);
> > >      }
> > >      /* delete also control vq */
> > > -    virtio_del_queue(vdev, max_queues * 2);
> > > +    virtio_del_queue(vdev, max_qps * 2);
> > >      qemu_announce_timer_del(&n->announce_timer, false);
> > >      g_free(n->vqs);
> > >      qemu_del_nic(n->nic);
> > > diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> > > index 824a69c23f..a9b6dc252e 100644
> > > --- a/include/hw/virtio/virtio-net.h
> > > +++ b/include/hw/virtio/virtio-net.h
> > > @@ -194,8 +194,8 @@ struct VirtIONet {
> > >      NICConf nic_conf;
> > >      DeviceState *qdev;
> > >      int multiqueue;
> > > -    uint16_t max_queues;
> > > -    uint16_t curr_queues;
> > > +    uint16_t max_qps;
> > > +    uint16_t curr_qps;
> > >      size_t config_size;
> > >      char *netclient_name;
> > >      char *netclient_type;
> > > --
> > > 2.25.1
> >


