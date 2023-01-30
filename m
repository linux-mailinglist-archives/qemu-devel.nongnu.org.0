Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35668680474
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 04:54:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMLEh-0004AT-7b; Sun, 29 Jan 2023 22:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pMLEf-0004AC-BF
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 22:53:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pMLEd-0006Z4-Dv
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 22:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675050812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hZPauyqVYtO/kuB19FlaBHHi216A/07JqGTaIDA+JU=;
 b=OQt8wcw2Efvdvk5L41EQzJDsUgkiEBJyooDHt3B6XOmGEA7W/7tEGB+fPgB4TMW5KivUpF
 4HiJvZXzZ3NE3Le2dLDYFjsRDQlTNzLsTz1C28eEArLHuWCJKCErzuf3PpFyOYm5RS/6jd
 vKai2kUFesq1Y2O9MiYydYf8NkpGtVU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-MbFXhypdM-248wf7ziIBJw-1; Sun, 29 Jan 2023 22:53:30 -0500
X-MC-Unique: MbFXhypdM-248wf7ziIBJw-1
Received: by mail-ot1-f69.google.com with SMTP id
 m47-20020a05683026ef00b0068bbc172013so2237693otu.12
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 19:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8hZPauyqVYtO/kuB19FlaBHHi216A/07JqGTaIDA+JU=;
 b=cGE/g+xNvSgbG7fgMwsOxwIHXv7V0I4Dsa5ZkWNEOqSoogbz2WgUog+FMlD4PVk+tF
 BoQALlWDkhHY2bvqG/IzLFhGTW9RRMq14Dkz8zbj7k2K9iIgnxhkouJ0Vt3G6tykOXY8
 92yXmkDvaLUdGzFPTMmp14ejNe34+wN1pGu5J2+XVHDdugM4PxU4YP3QNZ3/Mdp7DFE2
 cYR7JEqy9FJCPUDh8PAgDZD3OTn1VIH46aZUP5QT8uKikl3Fl2eRHNJm9cYnx6REIKMz
 F8PX/f4TF6EMyeV53H4MwLJFRZGL2KgSjw2WcFc6dFbx1ufNDba3bsswLC5cfe03dBhd
 kNbw==
X-Gm-Message-State: AFqh2ko0qoecj+k2pfATMPkhoRdiaiiHcVlhGIuRnzOlrXIFEuPdWxhR
 lu1K92w2+WI4cxleAojK7cDIe6l013iT673aEtlcHK2Kqfwc1jzXk3AZN147HFk9Kflyz07ckKQ
 5Pwua2zHCMUN2ztddQ5JH1EQTPZuxFpU=
X-Received: by 2002:a05:6808:b2f:b0:363:a978:6d41 with SMTP id
 t15-20020a0568080b2f00b00363a9786d41mr2715343oij.280.1675050809994; 
 Sun, 29 Jan 2023 19:53:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtXbuy85xNxlmpJp58kfkT8zNWuiXHubZ2bQ786hGLf5AWwcOYH1DKd5KopJM9gWqFCFVH2WRdthIoXEOOOKbo=
X-Received: by 2002:a05:6808:b2f:b0:363:a978:6d41 with SMTP id
 t15-20020a0568080b2f00b00363a9786d41mr2715341oij.280.1675050809701; Sun, 29
 Jan 2023 19:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEvHyRr_nt6eFzE632yOLLOsrcCv3dN5sD01AaGD_-LZVg@mail.gmail.com>
 <1674978207.8889825-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEs0NeOA4H9z2LkgYRZhcdQ4Hx2kgH+hE+JLV8TzsfWohg@mail.gmail.com>
 <1675049912.7650461-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1675049912.7650461-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 30 Jan 2023 11:53:18 +0800
Message-ID: <CACGkMEvwfoGbTRPP1MmL-i_mNZB+ct70qJ3eO07vpWyw7-35Cw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Mon, Jan 30, 2023 at 11:42 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> On Mon, 30 Jan 2023 11:01:40 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > On Sun, Jan 29, 2023 at 3:44 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > >
> > > On Sun, 29 Jan 2023 14:23:21 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > > On Sun, Jan 29, 2023 at 10:52 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > >
> > > > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > > > >
> > > > > Before per-queue reset, we need to recover async tx resources. At this
> > > > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > > > new packets, so virtio_net_flush_tx() should check the current
> > > > > per-queue reset state.
> > > > >
> > > > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > ---
> > > > >  hw/net/virtio-net.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > index 3ae909041a..fba6451a50 100644
> > > > > --- a/hw/net/virtio-net.c
> > > > > +++ b/hw/net/virtio-net.c
> > > > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > > > >      VirtQueueElement *elem;
> > > > >      int32_t num_packets = 0;
> > > > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > > > +        virtio_queue_reset_state(q->tx_vq)) {
> > > >
> > > > We have other places that check DRIVER_OK do we need to check queue
> > > > reset as well?
> > >
> > > I checked it again. I still think that the location of other checking DRIVER_OK
> > > does not need to check the queue reset.
> >
> > For example, if we don't disable can_receive() when the queue is
> > reset, it means rx may go for virtio_net_receive_rcu(). It means the
> > Qemu is still trying to process the traffic from the network backend
> > like tap which may waste cpu cycles.
> >
> > I think the correct way is to return false when the queue is reset in
> > can_receive(), then the backend poll will be disabled (e.g TAP). When
> > the queue is enabled again, qemu_flush_queued_packets() will wake up
> > the backend polling.
> >
> > Having had time to check other places but it would be better to
> > mention why it doesn't need a check in the changelog.
>
>
> static bool virtio_net_can_receive(NetClientState *nc)
> {
>     VirtIONet *n = qemu_get_nic_opaque(nc);
>     VirtIODevice *vdev = VIRTIO_DEVICE(n);
>     VirtIONetQueue *q = virtio_net_get_subqueue(nc);
>
>     if (!vdev->vm_running) {
>         return false;
>     }
>
>     if (nc->queue_index >= n->curr_queue_pairs) {
>         return false;
>     }
>
>     if (!virtio_queue_ready(q->rx_vq) ||
>         !(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
>         return false;
>     }
>
>     return true;
> }
>
> int virtio_queue_ready(VirtQueue *vq)
> {
>     return vq->vring.avail != 0;
> }
>
>
> static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
> {
>     vdev->vq[i].vring.desc = 0;
>     vdev->vq[i].vring.avail = 0;
>     vdev->vq[i].vring.used = 0;
>     vdev->vq[i].last_avail_idx = 0;
>     vdev->vq[i].shadow_avail_idx = 0;
>     vdev->vq[i].used_idx = 0;
>     vdev->vq[i].last_avail_wrap_counter = true;
>     vdev->vq[i].shadow_avail_wrap_counter = true;
>     vdev->vq[i].used_wrap_counter = true;
>     virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
>     vdev->vq[i].signalled_used = 0;
>     vdev->vq[i].signalled_used_valid = false;
>     vdev->vq[i].notification = true;
>     vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
>     vdev->vq[i].inuse = 0;
>     virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
> }
>
> In the implementation of Per-Queue Reset, for RX, we stop RX by setting vdev->vq[i].vring.avail to 0.

Ok, but this is kind of fragile (especially when vIOMMU is enabled).
I'd add an explicit check for reset there.

(probably on top).

Thanks

> Then callback can_receive will return False.
>
>
> Thanks.
>
>
> >
> > Thanks
> >
> > >
> > > Thanks.
> > >
> > >
> > > >
> > > > E.g:
> > > > virtio_net_can_receive()
> > > > virtio_net_tx_{timer|bh}()
> > > >
> > > > Thanks
> > > >
> > > > >          return num_packets;
> > > > >      }
> > > > >
> > > > > --
> > > > > 2.32.0.3.g01195cf9f
> > > > >
> > > >
> > >
> >
>


