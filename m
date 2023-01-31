Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8495B6825A8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 08:39:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMlEV-0000LA-FT; Tue, 31 Jan 2023 02:39:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pMlET-0000Km-9t
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 02:39:09 -0500
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pMlEQ-0006B9-GT
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 02:39:08 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R851e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VaVsS7h_1675150733; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaVsS7h_1675150733) by smtp.aliyun-inc.com;
 Tue, 31 Jan 2023 15:38:54 +0800
Message-ID: <1675150700.8574536-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
Date: Tue, 31 Jan 2023 15:38:20 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>
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
In-Reply-To: <CACGkMEscnrRBwEajRmXPgyTGdJCwKQypDJrGUtqcHLS8MUinCQ@mail.gmail.com>
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Mon, 30 Jan 2023 15:49:36 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Mon, Jan 30, 2023 at 1:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jan 30, 2023 at 10:15:12AM +0800, Xuan Zhuo wrote:
> > > On Sun, 29 Jan 2023 07:15:47 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > On Sun, Jan 29, 2023 at 08:03:42PM +0800, Xuan Zhuo wrote:
> > > > > On Sun, 29 Jan 2023 06:57:29 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > On Sun, Jan 29, 2023 at 04:23:08PM +0800, Xuan Zhuo wrote:
> > > > > > > On Sun, 29 Jan 2023 03:12:12 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > > On Sun, Jan 29, 2023 at 03:28:28PM +0800, Xuan Zhuo wrote:
> > > > > > > > > On Sun, 29 Jan 2023 02:25:43 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > > > > On Sun, Jan 29, 2023 at 10:51:50AM +0800, Xuan Zhuo wrote:
> > > > > > > > > > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > > > > > > > > > >
> > > > > > > > > > > Before per-queue reset, we need to recover async tx resources. At this
> > > > > > > > > > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > > > > > > > > > new packets, so virtio_net_flush_tx() should check the current
> > > > > > > > > > > per-queue reset state.
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > What does "at this time" mean here?
> > > > > > > > > > Do you in fact mean it's called from flush_or_purge_queued_packets?
> > > > > > > > >
> > > > > > > > > Yes
> > > > > > > > >
> > > > > > > > > virtio_queue_reset
> > > > > > > > >   k->queue_reset
> > > > > > > > >           virtio_net_queue_reset
> > > > > > > > >                   flush_or_purge_queued_packets
> > > > > > > > >                           qemu_flush_or_purge_queued_packets
> > > > > > > > >                                   .....
> > > > > > > > >                                   (callback) virtio_net_tx_complete
> > > > > > > > >                                           virtio_net_flush_tx <-- here send new packet. We need stop it.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Because it is inside the callback, I can't pass information through the stack. I
> > > > > > > > > originally thought it was a general situation, so I wanted to put it in
> > > > > > > > > struct VirtQueue.
> > > > > > > > >
> > > > > > > > > If it is not very suitable, it may be better to put it in VirtIONetQueue.
> > > > > > > > >
> > > > > > > > > Thanks.
> > > > > > > >
> > > > > > > > Hmm maybe. Another idea: isn't virtio_net_tx_complete called
> > > > > > > > with length 0 here? Are there other cases where length is 0?
> > > > > > > >
> > > > > > > >
> > > > > > > > > > What does the call stack look like?
> > > > > > > > > >
> > > > > > > > > > If yes introducing a vq state just so virtio_net_flush_tx
> > > > > > > > > > knows we are in the process of reset would be a bad idea.
> > > > > > > > > > We want something much more local, ideally on stack even ...
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > > > > > > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > > > > > > > > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > > > > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  hw/net/virtio-net.c | 3 ++-
> > > > > > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > > > > > > > index 3ae909041a..fba6451a50 100644
> > > > > > > > > > > --- a/hw/net/virtio-net.c
> > > > > > > > > > > +++ b/hw/net/virtio-net.c
> > > > > > > > > > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > > > > > > > > > >      VirtQueueElement *elem;
> > > > > > > > > > >      int32_t num_packets = 0;
> > > > > > > > > > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > > > > > > > > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > > > > > > > > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > > > > > > > > > +        virtio_queue_reset_state(q->tx_vq)) {
> > > > > > > >
> > > > > > > > btw this sounds like you are asking it to reset some state.
> > > > > > > >
> > > > > > > > > > >          return num_packets;
> > > > > > > >
> > > > > > > > and then
> > > > > > > >
> > > > > > > >     ret = virtio_net_flush_tx(q);
> > > > > > > >     if (ret >= n->tx_burst)
> > > > > > > >
> > > > > > > >
> > > > > > > > will reschedule automatically won't it?
> > > > > > > >
> > > > > > > > also why check in virtio_net_flush_tx and not virtio_net_tx_complete?
> > > > > > >
> > > > > > > virtio_net_flush_tx may been called by timer.
>
> We stop timer/bh during device reset, do we need to do the same with vq reset?


Should I stop timer/bh?

Thanks.


>
> > > > > > >
> > > > > > > Thanks.
> > > > > >
> > > > > > timer won't run while flush_or_purge_queued_packets is in progress.
> > > > >
> > > > > Is timer not executed during the VMEXIT process? Otherwise, we still have to
> > > > > consider that after the flush_or_purge_queued_packets, this process before the
> > > > > structure is cleared.
> > > >
> > > >
> > > >
> > > > void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > > > {
> > > >     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > > >
> > > >     if (k->queue_reset) {
> > > >         k->queue_reset(vdev, queue_index);
> > > >     }
> > > >
> > > >     __virtio_queue_reset(vdev, queue_index);
> > > > }
> > > >
> > > >
> > > > No timers do not run between  k->queue_reset and __virtio_queue_reset.
> > > >
> > > >
> > > > > Even if it can be processed in virtio_net_tx_complete, is there any good way?
> > > > > This is a callback, it is not convenient to pass the parameters.
> > > > >
> > > > > Thanks
> > > >
> > > >
> > > > How about checking that length is 0?
> > >
> > >
> > > I think that check length is not a good way. This modifys the semantics of 0.
>
> 0 seems to mean "purge" and
>
> > It is
> > > not friendly to the future maintenance. On the other hand, qemu_net_queue_purge()
> > > will pass 0, and this function is called by many places.
>
> That's exactly what we want actually, when do purge we don't need a flush?
>
> > >
> > > How about we add an api in queue.c to replace the sent_cb callback on queue?
> > >
> > > Thanks.
> >
> > OK I guess. Jason?
>
> Not sure, anything different from adding a check in
> virtio_net_tx_complete()? (assuming bh and timer is cancelled or
> deleted).
>
> Thanks
>
> >
> > >
> > > >
> > > > >
> > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > > > >      }
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > 2.32.0.3.g01195cf9f
> > > > > > > > > >
> > > > > > > >
> > > > > >
> > > >
> >
>

