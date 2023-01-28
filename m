Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F5567F75C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 11:49:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLikf-0002qh-6A; Sat, 28 Jan 2023 05:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pLikQ-0002kx-6o
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:47:50 -0500
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pLikN-0008Fg-Ef
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:47:49 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VaHFijx_1674902856; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaHFijx_1674902856) by smtp.aliyun-inc.com;
 Sat, 28 Jan 2023 18:47:36 +0800
Message-ID: <1674902469.9566288-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH 2/3]  virtio: struct VirtQueue introduce reset
Date: Sat, 28 Jan 2023 18:41:09 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
References: <20230128071724.33677-1-xuanzhuo@linux.alibaba.com>
 <20230128071724.33677-3-xuanzhuo@linux.alibaba.com>
 <20230128050411-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230128050411-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=115.124.30.112;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-112.freemail.mail.aliyun.com
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

On Sat, 28 Jan 2023 05:22:05 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Sat, Jan 28, 2023 at 03:17:23PM +0800, Xuan Zhuo wrote:
> >  In the current design, we stop the device from operating on the vring
> >  during per-queue reset by resetting the structure VirtQueue.
> >
> >  But before the reset operation, when recycling some resources, we should
> >  stop referencing new vring resources. For example, when recycling
> >  virtio-net's asynchronous sending resources, virtio-net should be able
> >  to perceive that the current queue is in the per-queue reset state, and
> >  stop sending new packets from the tx queue.
> >
> >  Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >  hw/virtio/virtio.c         | 8 ++++++++
> >  include/hw/virtio/virtio.h | 3 +++
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index 03077b2ecf..907d5b8bde 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -2030,6 +2030,12 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> >  {
> >      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> >
> > +    /*
> > +     * Mark this queue is per-queue reset status. The device should release the
> > +     * references of the vring, and not refer more new vring item.
> > +     */
> > +    vdev->vq[queue_index].reset = true;
> > +
> >      if (k->queue_reset) {
> >          k->queue_reset(vdev, queue_index);
> >      }
> > @@ -2053,6 +2059,8 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> >      }
> >      */
> >
> > +    vdev->vq[queue_index].reset = false;
> > +
> >      if (k->queue_enable) {
> >          k->queue_enable(vdev, queue_index);
> >      }
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index 1c0d77c670..b888538d09 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -251,6 +251,9 @@ struct VirtQueue {
> >      /* Notification enabled? */
> >      bool notification;
> >
> > +    /* Per-Queue Reset status */
> > +    bool reset;
> > +
> >      uint16_t queue_index;
> >
>
> Reset state makes no sense. It seems to imply queue_reset
> in the spec. And for extra fun there's "reset" in the pci
> proxy which means "virtio_queue_reset is in progress" - I have no
> idea what uses it though - it is not guest visible.  First what is it?
> It actually means "queue has been reset and not has not been enabled since".
> So disabled_by_reset maybe?


In fact, when reading this, the queue has not been reset,
so prepare_for_reset?

>
> Second this hack helps make the change minimal
> so it's helpful for stable, but it's ugly in that it
> duplicates the reverse of enabled value - we don't really
> care what disabled it in practice.
>
> With the fixups above I can apply so it's easier to backport, but later
> a patch on top should clean it all up, perhaps by adding
> "enabled" in VirtQueue. We should also get rid of "reset" in the proxy
> unless there's some way it's useful which I don't currently see.
>

I have some confusion, I don't understand what you mean.

Why did we remove the "reset" in the proxy?

I agree to rename the "reset".

Thanks.

>
>
> >      unsigned int inuse;
> > --
> > 2.32.0.3.g01195cf9f
>

