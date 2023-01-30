Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFEE68079B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:41:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPiK-0005Kg-W6; Mon, 30 Jan 2023 03:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pMPiI-0005Jl-Ty
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:40:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pMPiG-0006s9-Um
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675068028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bUgClvTxqsc+38Dy7M7xof7bqX2TBAARRzetlANt3QA=;
 b=Yk0AAVoO8d3bH8+FjAz5XBHpD/k4Z+Y0OfGqMQhAnt/MMLrtFywgP/2rVIgjCnjDUEh1fM
 v+SRIt4x/FjI3+v3NmqE48+UKgZxNNNQM4ou1aE/5hltNAu9ZMuUzjt8w407TWxGMhf3uI
 TPmXpDzi4s15A9mjHD+fo/GA4lgfao4=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-AEzzRhW1NISCQRskMORuSQ-1; Mon, 30 Jan 2023 03:40:21 -0500
X-MC-Unique: AEzzRhW1NISCQRskMORuSQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 ex11-20020a056808298b00b003612dac2af8so4952197oib.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 00:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bUgClvTxqsc+38Dy7M7xof7bqX2TBAARRzetlANt3QA=;
 b=7BKkk9cwoqlPdb5X7Z3aQJzCAkvtvgb9ReeYtAVUKhrkUCwNFed/b7clXtQuz0qiXe
 nXE/fC1e4RO5r+l2R5iMOOLFJAvcLbr3/P/MU0ETtAFqQCogkNPmSCZ0sWSE4VLe1nTS
 +WEwUvG0mh6iS0fPWPX9XNruFul3Dg6dseEMRY/GYBWPp5FsufseaGe9P9gfG3mc3Wgt
 QVpMHrLYwkYX4vvEhUixGE/TJL06XUkUjDm5fwgg788PfKn6OKuPOCgBLvGC+g3loYHO
 sfXH0JcishQDTHqNbdPg/1QkcwCbFDWuAW+oJcYZCdbEiZfUb5AvOtW7YEB7n0diJmvs
 GQow==
X-Gm-Message-State: AFqh2kpliNjKMAIZGqg7lV6qrS8feHCL9SK4U6YonJaNZV1NCzPCz3cQ
 zN5q9pcI5UGSslnO8ULudHuCdwZpayEqoYMvz+vLOvKxk3yQYsExiRZFN5GXL7RIzoCBqY+2iw4
 YzLtmd/iB6oWDhvcwxRs1ytSgTp4p1vM=
X-Received: by 2002:a05:6808:b2f:b0:363:a978:6d41 with SMTP id
 t15-20020a0568080b2f00b00363a9786d41mr2756105oij.280.1675068020348; 
 Mon, 30 Jan 2023 00:40:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvFsJnWW7Fr095eW73fToH1UXrBmop9ckLEzfEBe/Q3Ay7KGwD4td22e85ge1+9niui2Nea4oHaMPtQEcrS8N8=
X-Received: by 2002:a05:6808:b2f:b0:363:a978:6d41 with SMTP id
 t15-20020a0568080b2f00b00363a9786d41mr2756102oij.280.1675068020057; Mon, 30
 Jan 2023 00:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <20230129021402-mutt-send-email-mst@kernel.org>
 <1674977308.9335406-2-xuanzhuo@linux.alibaba.com>
 <20230129025950-mutt-send-email-mst@kernel.org>
 <1674980588.489446-5-xuanzhuo@linux.alibaba.com>
 <20230129065705-mutt-send-email-mst@kernel.org>
 <1674993822.7782302-1-xuanzhuo@linux.alibaba.com>
 <20230129071154-mutt-send-email-mst@kernel.org>
 <1675044912.9269125-1-xuanzhuo@linux.alibaba.com>
 <20230130003158-mutt-send-email-mst@kernel.org>
 <CACGkMEscnrRBwEajRmXPgyTGdJCwKQypDJrGUtqcHLS8MUinCQ@mail.gmail.com>
 <1675065225.6382265-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1675065225.6382265-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 30 Jan 2023 16:40:08 +0800
Message-ID: <CACGkMEta6Y-P1wc95K5YBqpLYta09b_sh7Kfki2+Vj2S18m-eA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Mon, Jan 30, 2023 at 4:03 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> On Mon, 30 Jan 2023 15:49:36 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > On Mon, Jan 30, 2023 at 1:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Jan 30, 2023 at 10:15:12AM +0800, Xuan Zhuo wrote:
> > > > On Sun, 29 Jan 2023 07:15:47 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > On Sun, Jan 29, 2023 at 08:03:42PM +0800, Xuan Zhuo wrote:
> > > > > > On Sun, 29 Jan 2023 06:57:29 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > On Sun, Jan 29, 2023 at 04:23:08PM +0800, Xuan Zhuo wrote:
> > > > > > > > On Sun, 29 Jan 2023 03:12:12 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > > > On Sun, Jan 29, 2023 at 03:28:28PM +0800, Xuan Zhuo wrote:
> > > > > > > > > > On Sun, 29 Jan 2023 02:25:43 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > > > > > On Sun, Jan 29, 2023 at 10:51:50AM +0800, Xuan Zhuo wrote:
> > > > > > > > > > > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > > > > > > > > > > >
> > > > > > > > > > > > Before per-queue reset, we need to recover async tx resources. At this
> > > > > > > > > > > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > > > > > > > > > > new packets, so virtio_net_flush_tx() should check the current
> > > > > > > > > > > > per-queue reset state.
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > What does "at this time" mean here?
> > > > > > > > > > > Do you in fact mean it's called from flush_or_purge_queued_packets?
> > > > > > > > > >
> > > > > > > > > > Yes
> > > > > > > > > >
> > > > > > > > > > virtio_queue_reset
> > > > > > > > > >   k->queue_reset
> > > > > > > > > >           virtio_net_queue_reset
> > > > > > > > > >                   flush_or_purge_queued_packets
> > > > > > > > > >                           qemu_flush_or_purge_queued_packets
> > > > > > > > > >                                   .....
> > > > > > > > > >                                   (callback) virtio_net_tx_complete
> > > > > > > > > >                                           virtio_net_flush_tx <-- here send new packet. We need stop it.
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Because it is inside the callback, I can't pass information through the stack. I
> > > > > > > > > > originally thought it was a general situation, so I wanted to put it in
> > > > > > > > > > struct VirtQueue.
> > > > > > > > > >
> > > > > > > > > > If it is not very suitable, it may be better to put it in VirtIONetQueue.
> > > > > > > > > >
> > > > > > > > > > Thanks.
> > > > > > > > >
> > > > > > > > > Hmm maybe. Another idea: isn't virtio_net_tx_complete called
> > > > > > > > > with length 0 here? Are there other cases where length is 0?
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > > What does the call stack look like?
> > > > > > > > > > >
> > > > > > > > > > > If yes introducing a vq state just so virtio_net_flush_tx
> > > > > > > > > > > knows we are in the process of reset would be a bad idea.
> > > > > > > > > > > We want something much more local, ideally on stack even ...
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > > > > > > > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > > > > > > > > > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > > > > > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > >  hw/net/virtio-net.c | 3 ++-
> > > > > > > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > > > > > > >
> > > > > > > > > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > > > > > > > > index 3ae909041a..fba6451a50 100644
> > > > > > > > > > > > --- a/hw/net/virtio-net.c
> > > > > > > > > > > > +++ b/hw/net/virtio-net.c
> > > > > > > > > > > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > > > > > > > > > > >      VirtQueueElement *elem;
> > > > > > > > > > > >      int32_t num_packets = 0;
> > > > > > > > > > > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > > > > > > > > > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > > > > > > > > > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > > > > > > > > > > +        virtio_queue_reset_state(q->tx_vq)) {
> > > > > > > > >
> > > > > > > > > btw this sounds like you are asking it to reset some state.
> > > > > > > > >
> > > > > > > > > > > >          return num_packets;
> > > > > > > > >
> > > > > > > > > and then
> > > > > > > > >
> > > > > > > > >     ret = virtio_net_flush_tx(q);
> > > > > > > > >     if (ret >= n->tx_burst)
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > will reschedule automatically won't it?
> > > > > > > > >
> > > > > > > > > also why check in virtio_net_flush_tx and not virtio_net_tx_complete?
> > > > > > > >
> > > > > > > > virtio_net_flush_tx may been called by timer.
> >
> > We stop timer/bh during device reset, do we need to do the same with vq reset?
> >
> > > > > > > >
> > > > > > > > Thanks.
> > > > > > >
> > > > > > > timer won't run while flush_or_purge_queued_packets is in progress.
> > > > > >
> > > > > > Is timer not executed during the VMEXIT process? Otherwise, we still have to
> > > > > > consider that after the flush_or_purge_queued_packets, this process before the
> > > > > > structure is cleared.
> > > > >
> > > > >
> > > > >
> > > > > void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > > > > {
> > > > >     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > > > >
> > > > >     if (k->queue_reset) {
> > > > >         k->queue_reset(vdev, queue_index);
> > > > >     }
> > > > >
> > > > >     __virtio_queue_reset(vdev, queue_index);
> > > > > }
> > > > >
> > > > >
> > > > > No timers do not run between  k->queue_reset and __virtio_queue_reset.
> > > > >
> > > > >
> > > > > > Even if it can be processed in virtio_net_tx_complete, is there any good way?
> > > > > > This is a callback, it is not convenient to pass the parameters.
> > > > > >
> > > > > > Thanks
> > > > >
> > > > >
> > > > > How about checking that length is 0?
> > > >
> > > >
> > > > I think that check length is not a good way. This modifys the semantics of 0.
> >
> > 0 seems to mean "purge" and
> >
> > > It is
> > > > not friendly to the future maintenance. On the other hand, qemu_net_queue_purge()
> > > > will pass 0, and this function is called by many places.
> >
> > That's exactly what we want actually, when do purge we don't need a flush?
>
> Yes, but I'm not sure. If we stop flush, there will be any other effects.

So we did:

virtio_net_queue_reset():
    nc = qemu_get_subqueue(n->nic, vq2q(queue_index);
    flush_or_purge_queued_packets(nc);
        qemu_flush_or_purge_queued_packets(nc->peer, true); // [1]
            if (qemu_net_queue_flush(nc->incoming_queue)) {
            ....
            } else if (purge) {
                qemu_net_queue_purge(nc->incoming_queue, nc->peer);
                        packet->send_cb()
                            virtio_net_tx_complete()
                                virtio_net_flush_tx()
                                    qemu_sendv_packet_async() // [2]
            }

We try to flush the tap's incoming queue and if we fail we will purge
in [1]. But the sent_cb() tries to send more packets which could be
queued to the tap incoming queue [2]. This breaks the semantic of
qemu_flush_or_purge_queued_packets().

>
> On the other hand, if we use "0" as a judgment condition, do you mean only the
> implementation of the purge in the flush_or_purge_queued_packets()?

It should be all the users of qemu_net_queue_purge(). The rest users
seems all fine:

virtio_net_vhost_status(), if we do flush, it may end up with touching
vring during vhost is running.
filters: all do a flush before.

>
> >
> > > >
> > > > How about we add an api in queue.c to replace the sent_cb callback on queue?
> > > >
> > > > Thanks.
> > > > > OK I guess. Jason?
> >
> > Not sure, anything different from adding a check in
> > virtio_net_tx_complete()? (assuming bh and timer is cancelled or
> > deleted).
>
> We replaced the sent_cb with a function without flush.

I meant it won't be different from adding a

if (virtio_queue_is_rest())

somewhere in virtio_net_tx_complete()?

Thanks

>
> Thanks.
>
>
> >
> > Thanks
> >
> > >
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > > >      }
> > > > > > > > > > > >
> > > > > > > > > > > > --
> > > > > > > > > > > > 2.32.0.3.g01195cf9f
> > > > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > >
> > >
> >
>


