Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC56805BB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:51:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMN3a-0008JN-4j; Mon, 30 Jan 2023 00:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMN3W-0008J1-Te
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:50:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMN3U-00076I-VC
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675057812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRrm9oWapLjmfDoAe+7E9OcrgrCIVgGtG4ZCiH+W3mE=;
 b=AeTM9Qs5mLUYrKx51PGc+5em1dO2lzEE7qENcOUX2VP5tEndA4veZs4mjrzMbwXiWawLFD
 7PMRBMJcSj1moG/rFiRvS9TfchATvtiHXPsbXh6P+Gnnbcth9vHtAy3txTMZM97izUVbdF
 DsKI9xDEiSmOUx6L/X5le4Z7lro0P9M=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-vzWoz8NNNeSWig-iYg5ujA-1; Mon, 30 Jan 2023 00:50:10 -0500
X-MC-Unique: vzWoz8NNNeSWig-iYg5ujA-1
Received: by mail-ua1-f72.google.com with SMTP id
 z42-20020ab0492d000000b00423b333ff7dso4261637uac.22
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RRrm9oWapLjmfDoAe+7E9OcrgrCIVgGtG4ZCiH+W3mE=;
 b=x3GZ7xAU3teB879JLqde1R47F0AmBQo9v9b4ay6qYXkhCXwm88KVixugaWvFt7WFwm
 dGEpKtVDLbaCBw1YGs6d99B9j3LOxs6H4iWUvyi+TqWiDO47hdZ1SkQTS4MfBkQpU2KF
 YqRy0f4B9QeuMr0lQyoP/4UFOFC01u89tBs1PJH3kIzSdiD5ypRIMt4VHvuTIW1Dv9X+
 hXOY7dsCAJ13RX5DDKJlrssALSe0whSqt0SMpslq8Ou+1MbTkORIONoHH+8lHRurLzgw
 E7Leb17cZEVTOkBc6rLrMzqY0D76sYoEWu+Sg4KvvP2VzNuCyQWNsle2Qdof3LqbnmPW
 z9Ag==
X-Gm-Message-State: AO0yUKU5F3SwW1LnlmSFZMD1Q4USIRkEQ4p8CWvnrey4M/VIPWdn/1BX
 irSDtaV5GvPSeLIh8UFP9f4WdqXwZ/RwxTBcdMCrvLDSNlGoWE2HO9yR29O4pD8aNHjKBCpDZO5
 xgJr4dYE/0fXIldo=
X-Received: by 2002:a05:6102:8:b0:3eb:4440:ca72 with SMTP id
 j8-20020a056102000800b003eb4440ca72mr7214055vsp.9.1675057810099; 
 Sun, 29 Jan 2023 21:50:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+E0Jare0w/Q73KGl55zjA9/nQ2BVHt0KYVpAkoJB7e+B0ioL0DHAMcZVycI1/brUT7Lv923g==
X-Received: by 2002:a05:6102:8:b0:3eb:4440:ca72 with SMTP id
 j8-20020a056102000800b003eb4440ca72mr7214050vsp.9.1675057809791; 
 Sun, 29 Jan 2023 21:50:09 -0800 (PST)
Received: from redhat.com ([87.249.138.139]) by smtp.gmail.com with ESMTPSA id
 k19-20020a67e3d3000000b003d3d976f799sm766705vsm.4.2023.01.29.21.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:50:09 -0800 (PST)
Date: Mon, 30 Jan 2023 00:50:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
Message-ID: <20230130004440-mutt-send-email-mst@kernel.org>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEvHyRr_nt6eFzE632yOLLOsrcCv3dN5sD01AaGD_-LZVg@mail.gmail.com>
 <1674978207.8889825-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEs0NeOA4H9z2LkgYRZhcdQ4Hx2kgH+hE+JLV8TzsfWohg@mail.gmail.com>
 <1675049912.7650461-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEvwfoGbTRPP1MmL-i_mNZB+ct70qJ3eO07vpWyw7-35Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEvwfoGbTRPP1MmL-i_mNZB+ct70qJ3eO07vpWyw7-35Cw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Jan 30, 2023 at 11:53:18AM +0800, Jason Wang wrote:
> On Mon, Jan 30, 2023 at 11:42 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >
> > On Mon, 30 Jan 2023 11:01:40 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > On Sun, Jan 29, 2023 at 3:44 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > >
> > > > On Sun, 29 Jan 2023 14:23:21 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > > > On Sun, Jan 29, 2023 at 10:52 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > > >
> > > > > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > > > > >
> > > > > > Before per-queue reset, we need to recover async tx resources. At this
> > > > > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > > > > new packets, so virtio_net_flush_tx() should check the current
> > > > > > per-queue reset state.
> > > > > >
> > > > > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > > > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > ---
> > > > > >  hw/net/virtio-net.c | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > > index 3ae909041a..fba6451a50 100644
> > > > > > --- a/hw/net/virtio-net.c
> > > > > > +++ b/hw/net/virtio-net.c
> > > > > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > > > > >      VirtQueueElement *elem;
> > > > > >      int32_t num_packets = 0;
> > > > > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > > > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > > > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > > > > +        virtio_queue_reset_state(q->tx_vq)) {
> > > > >
> > > > > We have other places that check DRIVER_OK do we need to check queue
> > > > > reset as well?
> > > >
> > > > I checked it again. I still think that the location of other checking DRIVER_OK
> > > > does not need to check the queue reset.
> > >
> > > For example, if we don't disable can_receive() when the queue is
> > > reset, it means rx may go for virtio_net_receive_rcu(). It means the
> > > Qemu is still trying to process the traffic from the network backend
> > > like tap which may waste cpu cycles.
> > >
> > > I think the correct way is to return false when the queue is reset in
> > > can_receive(), then the backend poll will be disabled (e.g TAP). When
> > > the queue is enabled again, qemu_flush_queued_packets() will wake up
> > > the backend polling.
> > >
> > > Having had time to check other places but it would be better to
> > > mention why it doesn't need a check in the changelog.
> >
> >
> > static bool virtio_net_can_receive(NetClientState *nc)
> > {
> >     VirtIONet *n = qemu_get_nic_opaque(nc);
> >     VirtIODevice *vdev = VIRTIO_DEVICE(n);
> >     VirtIONetQueue *q = virtio_net_get_subqueue(nc);
> >
> >     if (!vdev->vm_running) {
> >         return false;
> >     }
> >
> >     if (nc->queue_index >= n->curr_queue_pairs) {
> >         return false;
> >     }
> >
> >     if (!virtio_queue_ready(q->rx_vq) ||
> >         !(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> >         return false;
> >     }
> >
> >     return true;
> > }
> >
> > int virtio_queue_ready(VirtQueue *vq)
> > {
> >     return vq->vring.avail != 0;
> > }
> >
> >
> > static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
> > {
> >     vdev->vq[i].vring.desc = 0;
> >     vdev->vq[i].vring.avail = 0;
> >     vdev->vq[i].vring.used = 0;
> >     vdev->vq[i].last_avail_idx = 0;
> >     vdev->vq[i].shadow_avail_idx = 0;
> >     vdev->vq[i].used_idx = 0;
> >     vdev->vq[i].last_avail_wrap_counter = true;
> >     vdev->vq[i].shadow_avail_wrap_counter = true;
> >     vdev->vq[i].used_wrap_counter = true;
> >     virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
> >     vdev->vq[i].signalled_used = 0;
> >     vdev->vq[i].signalled_used_valid = false;
> >     vdev->vq[i].notification = true;
> >     vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
> >     vdev->vq[i].inuse = 0;
> >     virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
> > }
> >
> > In the implementation of Per-Queue Reset, for RX, we stop RX by setting vdev->vq[i].vring.avail to 0.
> 
> Ok, but this is kind of fragile (especially when vIOMMU is enabled).
> I'd add an explicit check for reset there.

It's not great in that spec says avail 0 is actually legal.
But I don't really want to see more and more checks.
If we are doing cleanups, the right way is probably a new "live" flag
that transports can set correctly from the combination of
DRIVER_OK, desc, kick, queue_enable, queue_reset and so on.

> (probably on top).
> 
> Thanks
> 
> > Then callback can_receive will return False.
> >
> >
> > Thanks.
> >
> >
> > >
> > > Thanks
> > >
> > > >
> > > > Thanks.
> > > >
> > > >
> > > > >
> > > > > E.g:
> > > > > virtio_net_can_receive()
> > > > > virtio_net_tx_{timer|bh}()
> > > > >
> > > > > Thanks
> > > > >
> > > > > >          return num_packets;
> > > > > >      }
> > > > > >
> > > > > > --
> > > > > > 2.32.0.3.g01195cf9f
> > > > > >
> > > > >
> > > >
> > >
> >


