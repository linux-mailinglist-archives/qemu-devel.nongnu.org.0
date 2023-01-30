Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A06807A4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:42:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPjw-0007fM-82; Mon, 30 Jan 2023 03:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pMPjt-0007WC-0f
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:42:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pMPjq-00071Q-UU
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675068125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8davWxB33Nodzh/YIduniqEdZ0WsDAu6swSquUyqzg=;
 b=PRHYu+DxnZ/H4CRNS8oTCxnLxtbuK+p7DkFhG0plwO+fIsSsqM/Ok84UDrKylMOJ02AiqS
 oH45CyCzMR3p07lkVWmhcmi3ORO/4DWzdsjytv3KV8wxa609xijrbCI+wdvISTrSZ1VQBk
 +BMwsRmK6h+44mah9zmDRdZFRhUncJg=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-511-Z9-F2VrnM8KCVu0RlIZNuw-1; Mon, 30 Jan 2023 03:42:03 -0500
X-MC-Unique: Z9-F2VrnM8KCVu0RlIZNuw-1
Received: by mail-ot1-f70.google.com with SMTP id
 bu27-20020a0568300d1b00b006865fffa6d7so5405975otb.14
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 00:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N8davWxB33Nodzh/YIduniqEdZ0WsDAu6swSquUyqzg=;
 b=kudhEsRDgbMG0d+l8VZAqafBiWMC6Lk3+l4ZoQj+wrxELFFUIH2rMNtOBragfh71kL
 KZJbck5k2knJ6y7nv/rAYYU+co5fBdKhBo4sY4YuMwoB8wqR8u445KEoB3lmLrA6nTUJ
 tJhiPZwd0mrs/I3r6Bv0MIeUSWjq/6+0bMIwZXDlfcXuCrxnAS0vkBxwQJzzaeOxvG45
 wMoMxrBp/KLNOm2YjFtEhBWFyXNXJTHbC6xusiZ7vD7Uo3vyz8HDq4g2zi+8JVBQ1in3
 oqdiAUDeSwbehlxE2OtFXzU7QmV0bFx+k+a8TkWKK8fQJUzIlx/9FerUVJ/qPTTnlLaf
 ukMw==
X-Gm-Message-State: AO0yUKVuvg9kv01m14rE3NpeVNv7bGEHUvJuRcnjcFSFfzJQaz4UbSzU
 efVIarPkwNbfWMId1x0Gm+Iq946CeoNWgt64kiGChEV3oUafidFbYiETuyGLwi5D50kDa+mWk09
 OgT1RYPfhojurB8Ai8nFn5Rb1sJ5AwW0=
X-Received: by 2002:a05:6870:959e:b0:163:9cea:eea7 with SMTP id
 k30-20020a056870959e00b001639ceaeea7mr305442oao.35.1675068122412; 
 Mon, 30 Jan 2023 00:42:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/JOkDNIniLZR2NzW9pzNMKEZnYi/NwN7PxW4v+REoZqsT05BQTHNWxT92WZhlVbabsFYkUAkoAoH4r6Hux/Bk=
X-Received: by 2002:a05:6870:959e:b0:163:9cea:eea7 with SMTP id
 k30-20020a056870959e00b001639ceaeea7mr305437oao.35.1675068122168; Mon, 30 Jan
 2023 00:42:02 -0800 (PST)
MIME-Version: 1.0
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEvHyRr_nt6eFzE632yOLLOsrcCv3dN5sD01AaGD_-LZVg@mail.gmail.com>
 <1674978207.8889825-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEs0NeOA4H9z2LkgYRZhcdQ4Hx2kgH+hE+JLV8TzsfWohg@mail.gmail.com>
 <1675049912.7650461-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEvwfoGbTRPP1MmL-i_mNZB+ct70qJ3eO07vpWyw7-35Cw@mail.gmail.com>
 <20230130004440-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230130004440-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 30 Jan 2023 16:41:51 +0800
Message-ID: <CACGkMEt+GE-HPY8pwHtzcFgP8tiLhqktPomhS+x5SmGZkEwTLA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, qemu-devel@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Mon, Jan 30, 2023 at 1:50 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jan 30, 2023 at 11:53:18AM +0800, Jason Wang wrote:
> > On Mon, Jan 30, 2023 at 11:42 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > >
> > > On Mon, 30 Jan 2023 11:01:40 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > > On Sun, Jan 29, 2023 at 3:44 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > >
> > > > > On Sun, 29 Jan 2023 14:23:21 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > > > > On Sun, Jan 29, 2023 at 10:52 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > > > >
> > > > > > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > > > > > >
> > > > > > > Before per-queue reset, we need to recover async tx resources. At this
> > > > > > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > > > > > new packets, so virtio_net_flush_tx() should check the current
> > > > > > > per-queue reset state.
> > > > > > >
> > > > > > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > > > > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > ---
> > > > > > >  hw/net/virtio-net.c | 3 ++-
> > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > > > index 3ae909041a..fba6451a50 100644
> > > > > > > --- a/hw/net/virtio-net.c
> > > > > > > +++ b/hw/net/virtio-net.c
> > > > > > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > > > > > >      VirtQueueElement *elem;
> > > > > > >      int32_t num_packets = 0;
> > > > > > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > > > > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > > > > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > > > > > +        virtio_queue_reset_state(q->tx_vq)) {
> > > > > >
> > > > > > We have other places that check DRIVER_OK do we need to check queue
> > > > > > reset as well?
> > > > >
> > > > > I checked it again. I still think that the location of other checking DRIVER_OK
> > > > > does not need to check the queue reset.
> > > >
> > > > For example, if we don't disable can_receive() when the queue is
> > > > reset, it means rx may go for virtio_net_receive_rcu(). It means the
> > > > Qemu is still trying to process the traffic from the network backend
> > > > like tap which may waste cpu cycles.
> > > >
> > > > I think the correct way is to return false when the queue is reset in
> > > > can_receive(), then the backend poll will be disabled (e.g TAP). When
> > > > the queue is enabled again, qemu_flush_queued_packets() will wake up
> > > > the backend polling.
> > > >
> > > > Having had time to check other places but it would be better to
> > > > mention why it doesn't need a check in the changelog.
> > >
> > >
> > > static bool virtio_net_can_receive(NetClientState *nc)
> > > {
> > >     VirtIONet *n = qemu_get_nic_opaque(nc);
> > >     VirtIODevice *vdev = VIRTIO_DEVICE(n);
> > >     VirtIONetQueue *q = virtio_net_get_subqueue(nc);
> > >
> > >     if (!vdev->vm_running) {
> > >         return false;
> > >     }
> > >
> > >     if (nc->queue_index >= n->curr_queue_pairs) {
> > >         return false;
> > >     }
> > >
> > >     if (!virtio_queue_ready(q->rx_vq) ||
> > >         !(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > >         return false;
> > >     }
> > >
> > >     return true;
> > > }
> > >
> > > int virtio_queue_ready(VirtQueue *vq)
> > > {
> > >     return vq->vring.avail != 0;
> > > }
> > >
> > >
> > > static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
> > > {
> > >     vdev->vq[i].vring.desc = 0;
> > >     vdev->vq[i].vring.avail = 0;
> > >     vdev->vq[i].vring.used = 0;
> > >     vdev->vq[i].last_avail_idx = 0;
> > >     vdev->vq[i].shadow_avail_idx = 0;
> > >     vdev->vq[i].used_idx = 0;
> > >     vdev->vq[i].last_avail_wrap_counter = true;
> > >     vdev->vq[i].shadow_avail_wrap_counter = true;
> > >     vdev->vq[i].used_wrap_counter = true;
> > >     virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
> > >     vdev->vq[i].signalled_used = 0;
> > >     vdev->vq[i].signalled_used_valid = false;
> > >     vdev->vq[i].notification = true;
> > >     vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
> > >     vdev->vq[i].inuse = 0;
> > >     virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
> > > }
> > >
> > > In the implementation of Per-Queue Reset, for RX, we stop RX by setting vdev->vq[i].vring.avail to 0.
> >
> > Ok, but this is kind of fragile (especially when vIOMMU is enabled).
> > I'd add an explicit check for reset there.
>
> It's not great in that spec says avail 0 is actually legal.
> But I don't really want to see more and more checks.
> If we are doing cleanups, the right way is probably a new "live" flag
> that transports can set correctly from the combination of
> DRIVER_OK, desc, kick, queue_enable, queue_reset and so on.

I second this, but for kick, we can only do that unless it is mandated
by the spec (otherwise we may break drivers silently).

Thanks

>
> > (probably on top).
> >
> > Thanks
> >
> > > Then callback can_receive will return False.
> > >
> > >
> > > Thanks.
> > >
> > >
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks.
> > > > >
> > > > >
> > > > > >
> > > > > > E.g:
> > > > > > virtio_net_can_receive()
> > > > > > virtio_net_tx_{timer|bh}()
> > > > > >
> > > > > > Thanks
> > > > > >
> > > > > > >          return num_packets;
> > > > > > >      }
> > > > > > >
> > > > > > > --
> > > > > > > 2.32.0.3.g01195cf9f
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
>


