Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058B767FD69
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 08:45:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM2Mh-0000xX-HZ; Sun, 29 Jan 2023 02:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pM2Mb-0000xH-Hz
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:44:33 -0500
Received: from out30-1.freemail.mail.aliyun.com ([115.124.30.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pM2MY-0001Ds-MN
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:44:33 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VaJu7Kq_1674978261; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaJu7Kq_1674978261) by smtp.aliyun-inc.com;
 Sun, 29 Jan 2023 15:44:22 +0800
Message-ID: <1674978207.8889825-4-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
Date: Sun, 29 Jan 2023 15:43:27 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEvHyRr_nt6eFzE632yOLLOsrcCv3dN5sD01AaGD_-LZVg@mail.gmail.com>
In-Reply-To: <CACGkMEvHyRr_nt6eFzE632yOLLOsrcCv3dN5sD01AaGD_-LZVg@mail.gmail.com>
Received-SPF: pass client-ip=115.124.30.1;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-1.freemail.mail.aliyun.com
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

On Sun, 29 Jan 2023 14:23:21 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Sun, Jan 29, 2023 at 10:52 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >
> > Check whether it is per-queue reset state in virtio_net_flush_tx().
> >
> > Before per-queue reset, we need to recover async tx resources. At this
> > time, virtio_net_flush_tx() is called, but we should not try to send
> > new packets, so virtio_net_flush_tx() should check the current
> > per-queue reset state.
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
>
> We have other places that check DRIVER_OK do we need to check queue
> reset as well?

I checked it again. I still think that the location of other checking DRIVER_OK
does not need to check the queue reset.

Thanks.


>
> E.g:
> virtio_net_can_receive()
> virtio_net_tx_{timer|bh}()
>
> Thanks
>
> >          return num_packets;
> >      }
> >
> > --
> > 2.32.0.3.g01195cf9f
> >
>

