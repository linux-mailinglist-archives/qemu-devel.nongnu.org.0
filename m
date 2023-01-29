Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4727167FD63
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 08:37:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM2Eh-0006dO-35; Sun, 29 Jan 2023 02:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pM2Eb-0006d8-OX
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:36:18 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pM2EX-0000Jw-VD
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:36:16 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VaJivYM_1674977761; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaJivYM_1674977761) by smtp.aliyun-inc.com;
 Sun, 29 Jan 2023 15:36:02 +0800
Message-ID: <1674977308.9335406-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
Date: Sun, 29 Jan 2023 15:28:28 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <20230129021402-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230129021402-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-57.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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

On Sun, 29 Jan 2023 02:25:43 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Sun, Jan 29, 2023 at 10:51:50AM +0800, Xuan Zhuo wrote:
> > Check whether it is per-queue reset state in virtio_net_flush_tx().
> >
> > Before per-queue reset, we need to recover async tx resources. At this
> > time, virtio_net_flush_tx() is called, but we should not try to send
> > new packets, so virtio_net_flush_tx() should check the current
> > per-queue reset state.
>
>
> What does "at this time" mean here?
> Do you in fact mean it's called from flush_or_purge_queued_packets?

Yes

virtio_queue_reset
	k->queue_reset
		virtio_net_queue_reset
			flush_or_purge_queued_packets
				qemu_flush_or_purge_queued_packets
					.....
					(callback) virtio_net_tx_complete
						virtio_net_flush_tx <-- here send new packet. We need stop it.


Because it is inside the callback, I can't pass information through the stack. I
originally thought it was a general situation, so I wanted to put it in
struct VirtQueue.

If it is not very suitable, it may be better to put it in VirtIONetQueue.

Thanks.

> What does the call stack look like?
>
> If yes introducing a vq state just so virtio_net_flush_tx
> knows we are in the process of reset would be a bad idea.
> We want something much more local, ideally on stack even ...
>
>
> >
> > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >  hw/net/virtio-net.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 3ae909041a..fba6451a50 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> >      VirtQueueElement *elem;
> >      int32_t num_packets = 0;
> >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > +        virtio_queue_reset_state(q->tx_vq)) {
> >          return num_packets;
> >      }
> >
> > --
> > 2.32.0.3.g01195cf9f
>

