Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3A667FEEA
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 13:35:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM6sQ-0004sy-M0; Sun, 29 Jan 2023 07:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pM6sN-0004sp-Dk
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 07:33:39 -0500
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pM6sJ-0001Eb-6e
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 07:33:38 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VaKbRcy_1674995599; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaKbRcy_1674995599) by smtp.aliyun-inc.com;
 Sun, 29 Jan 2023 20:33:20 +0800
Message-ID: <1674995321.4898639-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
Date: Sun, 29 Jan 2023 20:28:41 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <20230129021402-mutt-send-email-mst@kernel.org>
 <1674977308.9335406-2-xuanzhuo@linux.alibaba.com>
 <20230129025950-mutt-send-email-mst@kernel.org>
 <1674980588.489446-5-xuanzhuo@linux.alibaba.com>
 <20230129065705-mutt-send-email-mst@kernel.org>
 <1674993822.7782302-1-xuanzhuo@linux.alibaba.com>
 <20230129071154-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230129071154-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
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

On Sun, 29 Jan 2023 07:15:47 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Sun, Jan 29, 2023 at 08:03:42PM +0800, Xuan Zhuo wrote:
> > On Sun, 29 Jan 2023 06:57:29 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Sun, Jan 29, 2023 at 04:23:08PM +0800, Xuan Zhuo wrote:
> > > > On Sun, 29 Jan 2023 03:12:12 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > On Sun, Jan 29, 2023 at 03:28:28PM +0800, Xuan Zhuo wrote:
> > > > > > On Sun, 29 Jan 2023 02:25:43 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > On Sun, Jan 29, 2023 at 10:51:50AM +0800, Xuan Zhuo wrote:
> > > > > > > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > > > > > > >
> > > > > > > > Before per-queue reset, we need to recover async tx resources. At this
> > > > > > > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > > > > > > new packets, so virtio_net_flush_tx() should check the current
> > > > > > > > per-queue reset state.
> > > > > > >
> > > > > > >
> > > > > > > What does "at this time" mean here?
> > > > > > > Do you in fact mean it's called from flush_or_purge_queued_packets?
> > > > > >
> > > > > > Yes
> > > > > >
> > > > > > virtio_queue_reset
> > > > > > 	k->queue_reset
> > > > > > 		virtio_net_queue_reset
> > > > > > 			flush_or_purge_queued_packets
> > > > > > 				qemu_flush_or_purge_queued_packets
> > > > > > 					.....
> > > > > > 					(callback) virtio_net_tx_complete
> > > > > > 						virtio_net_flush_tx <-- here send new packet. We need stop it.
> > > > > >
> > > > > >
> > > > > > Because it is inside the callback, I can't pass information through the stack. I
> > > > > > originally thought it was a general situation, so I wanted to put it in
> > > > > > struct VirtQueue.
> > > > > >
> > > > > > If it is not very suitable, it may be better to put it in VirtIONetQueue.
> > > > > >
> > > > > > Thanks.
> > > > >
> > > > > Hmm maybe. Another idea: isn't virtio_net_tx_complete called
> > > > > with length 0 here? Are there other cases where length is 0?
> > > > >
> > > > >
> > > > > > > What does the call stack look like?
> > > > > > >
> > > > > > > If yes introducing a vq state just so virtio_net_flush_tx
> > > > > > > knows we are in the process of reset would be a bad idea.
> > > > > > > We want something much more local, ideally on stack even ...
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > > > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > > > > > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > > ---
> > > > > > > >  hw/net/virtio-net.c | 3 ++-
> > > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > > > > index 3ae909041a..fba6451a50 100644
> > > > > > > > --- a/hw/net/virtio-net.c
> > > > > > > > +++ b/hw/net/virtio-net.c
> > > > > > > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > > > > > > >      VirtQueueElement *elem;
> > > > > > > >      int32_t num_packets = 0;
> > > > > > > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > > > > > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > > > > > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > > > > > > +        virtio_queue_reset_state(q->tx_vq)) {
> > > > >
> > > > > btw this sounds like you are asking it to reset some state.
> > > > >
> > > > > > > >          return num_packets;
> > > > >
> > > > > and then
> > > > >
> > > > >     ret = virtio_net_flush_tx(q);
> > > > >     if (ret >= n->tx_burst)
> > > > >
> > > > >
> > > > > will reschedule automatically won't it?
> > > > >
> > > > > also why check in virtio_net_flush_tx and not virtio_net_tx_complete?
> > > >
> > > > virtio_net_flush_tx may been called by timer.
> > > >
> > > > Thanks.
> > >
> > > timer won't run while flush_or_purge_queued_packets is in progress.
> >
> > Is timer not executed during the VMEXIT process? Otherwise, we still have to
> > consider that after the flush_or_purge_queued_packets, this process before the
> > structure is cleared.
>
>
>
> void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> {
>     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>
>     if (k->queue_reset) {
>         k->queue_reset(vdev, queue_index);
>     }
>
>     __virtio_queue_reset(vdev, queue_index);
> }
>
>
> No timers do not run between  k->queue_reset and __virtio_queue_reset.
>
>
> > Even if it can be processed in virtio_net_tx_complete, is there any good way?
> > This is a callback, it is not convenient to pass the parameters.
> >
> > Thanks
>
>
> How about checking that length is 0?


I think you refer to the second parameter of virtio_net_tx_complete "len".

void qemu_net_queue_purge(NetQueue *queue, NetClientState *from)
{
    NetPacket *packet, *next;

    QTAILQ_FOREACH_SAFE(packet, &queue->packets, entry, next) {
        if (packet->sender == from) {
            QTAILQ_REMOVE(&queue->packets, packet, entry);
            queue->nq_count--;
            if (packet->sent_cb) {
                packet->sent_cb(packet->sender, 0);
            }
            g_free(packet);
        }
    }
}

qemu_net_queue_purge pass 0 as len. This function has been called in large
quantities. I am not sure if it will have a bad impact. I will try if there is a
good way to pass the parameters on the stack.

Thanks.

>
> >
> > >
> > > > >
> > > > >
> > > > > > > >      }
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.32.0.3.g01195cf9f
> > > > > > >
> > > > >
> > >
>

