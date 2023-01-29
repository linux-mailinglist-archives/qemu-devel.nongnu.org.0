Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885AB67FD67
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 08:42:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM2Jt-0008KG-4C; Sun, 29 Jan 2023 02:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pM2Jq-0008K2-TW
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:41:43 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pM2Jk-0000qP-JB
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:41:38 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R391e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VaJtMhm_1674978086; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaJtMhm_1674978086) by smtp.aliyun-inc.com;
 Sun, 29 Jan 2023 15:41:27 +0800
Message-ID: <1674977997.4606206-3-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v1 1/2] virtio: struct VirtQueue introduce reset
Date: Sun, 29 Jan 2023 15:39:57 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-2-xuanzhuo@linux.alibaba.com>
 <20230129020903-mutt-send-email-mst@kernel.org>
 <1674976516.577517-1-xuanzhuo@linux.alibaba.com>
 <20230129023241-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230129023241-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
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

On Sun, 29 Jan 2023 02:37:22 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Sun, Jan 29, 2023 at 03:15:16PM +0800, Xuan Zhuo wrote:
> > On Sun, 29 Jan 2023 02:12:36 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >
> > > subject seems wrong.
> >
> >
> > Will fix.
> >
> >
> > >
> > > On Sun, Jan 29, 2023 at 10:51:49AM +0800, Xuan Zhuo wrote:
> > > > In the current design, we stop the device from operating on the vring
> > > > during per-queue reset by resetting the structure VirtQueue.
> > > >
> > > > But before the reset operation, when recycling some resources, we should
> > > > stop referencing new vring resources. For example, when recycling
> > > > virtio-net's asynchronous sending resources, virtio-net should be able
> > > > to perceive that the current queue is in the per-queue reset state, and
> > > > stop sending new packets from the tx queue.
> > > >
> > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > ---
> > > >  hw/virtio/virtio.c         | 15 +++++++++++++++
> > > >  include/hw/virtio/virtio.h |  1 +
> > > >  2 files changed, 16 insertions(+)
> > > >
> > > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > > index f35178f5fc..c954f2a2b3 100644
> > > > --- a/hw/virtio/virtio.c
> > > > +++ b/hw/virtio/virtio.c
> > > > @@ -142,6 +142,8 @@ struct VirtQueue
> > > >      /* Notification enabled? */
> > > >      bool notification;
> > > >
> > > > +    bool disabled_by_reset;
> > > > +
> > > >      uint16_t queue_index;
> > > >
> > > >      unsigned int inuse;
> > > > @@ -2079,6 +2081,12 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > > >  {
> > > >      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > > >
> > > > +    /*
> > > > +     * Mark this queue is per-queue reset status. The device should release the
> > > > +     * references of the vring, and not refer more new vring item.
> > >
> > > items
> >
> >
> > Will fix.
> >
> > >
> > > > +     */
> > > > +    vdev->vq[queue_index].disabled_by_reset = true;
> > > > +
> > > >      if (k->queue_reset) {
> > > >          k->queue_reset(vdev, queue_index);
> > > >      }
> > >
> > > can we set this after calling queue_reset? For symmetry with enable.
> >
> >
> > In fact,  queue_reset() will check it.
> >
>
> when you disable you first set it then disable.
> so when we are not 100% ready it's already set.
> when you enable you first clear it then enable.
> so we are not 100% ready but it's no longer set.
> inconsistent.
>
>
> > >
> > > > @@ -2102,11 +2110,18 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> > > >      }
> > > >      */
> > > >
> > > > +    vdev->vq[queue_index].disabled_by_reset = false;
> > > > +
> > > >      if (k->queue_enable) {
> > > >          k->queue_enable(vdev, queue_index);
> > > >      }
> > > >  }
> > > >
> > > > +bool virtio_queue_reset_state(VirtQueue *vq)
> > > > +{
> > > > +    return vq->disabled_by_reset;
> > > > +}
> > > > +
> > > >  void virtio_reset(void *opaque)
> > > >  {
> > > >      VirtIODevice *vdev = opaque;
> > > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > > index 77c6c55929..00e91af7c4 100644
> > > > --- a/include/hw/virtio/virtio.h
> > > > +++ b/include/hw/virtio/virtio.h
> > > > @@ -319,6 +319,7 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val);
> > > >  void virtio_reset(void *opaque);
> > > >  void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> > > >  void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
> > > > +bool virtio_queue_reset_state(VirtQueue *vq);
> > > >  void virtio_update_irq(VirtIODevice *vdev);
> > > >  int virtio_set_features(VirtIODevice *vdev, uint64_t val);
> > >
> > > OK I guess ... what about migration. This state won't be
> > > set correctly will it?
> >
> > I think it has no effect. After the reset, there is actually no state. We can
> > migrate.
> >
> > The current variable is only used by ->queue_reset().
> >
> > Thanks.
> >
>
> Yea maybe it works for this bug but ... yack. This means the state has
> no logic consistency.  It's just there because you found a bug and
> wanted to fix it.
> An ultra specific
> 	bool this_weird_state_fuzzer_gets_in_issue_1451;
> is hard to maintain, not happy :(


I agree.


Thanks.


>
>
> > >
> > >
> > > >
> > > > --
> > > > 2.32.0.3.g01195cf9f
> > >
>

