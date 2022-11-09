Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE47622430
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 07:53:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osewu-0000DZ-Lv; Wed, 09 Nov 2022 01:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1osewr-0000D2-V0
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 01:52:33 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1osewn-0006U7-0v
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 01:52:31 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VUMeqnp_1667976735; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VUMeqnp_1667976735) by smtp.aliyun-inc.com;
 Wed, 09 Nov 2022 14:52:16 +0800
Message-ID: <1667976509.6798587-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
Date: Wed, 9 Nov 2022 14:48:29 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
References: <20221107224600.934080-30-mst@redhat.com>
 <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
 <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
 <20221109013400-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221109013400-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
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

On Wed, 9 Nov 2022 01:39:32 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Wed, Nov 09, 2022 at 11:31:23AM +0800, Jason Wang wrote:
> > On Wed, Nov 9, 2022 at 3:43 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >
> > > On Mon, 7 Nov 2022 at 18:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > > >
> > > > Introduce the interface queue_enable() in VirtioDeviceClass and the
> > > > fucntion virtio_queue_enable() in virtio, it can be called when
> > > > VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
> > > > started. It only supports the devices of virtio 1 or later. The
> > > > not-supported devices can only start the virtqueue when DRIVER_OK.
> > > >
> > > > Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > Message-Id: <20221017092558.111082-4-xuanzhuo@linux.alibaba.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  include/hw/virtio/virtio.h |  2 ++
> > > >  hw/virtio/virtio.c         | 14 ++++++++++++++
> > > >  2 files changed, 16 insertions(+)
> > > >
> > > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > > index 74d76c1dbc..b00b3fcf31 100644
> > > > --- a/include/hw/virtio/virtio.h
> > > > +++ b/include/hw/virtio/virtio.h
> > > > @@ -149,6 +149,7 @@ struct VirtioDeviceClass {
> > > >      void (*reset)(VirtIODevice *vdev);
> > > >      void (*set_status)(VirtIODevice *vdev, uint8_t val);
> > > >      void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
> > > > +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
> > > >      /* For transitional devices, this is a bitmap of features
> > > >       * that are only exposed on the legacy interface but not
> > > >       * the modern one.
> > > > @@ -288,6 +289,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
> > > >  int virtio_set_status(VirtIODevice *vdev, uint8_t val);
> > > >  void virtio_reset(void *opaque);
> > > >  void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> > > > +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
> > > >  void virtio_update_irq(VirtIODevice *vdev);
> > > >  int virtio_set_features(VirtIODevice *vdev, uint64_t val);
> > > >
> > > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > > index cf5f9ca387..9683b2e158 100644
> > > > --- a/hw/virtio/virtio.c
> > > > +++ b/hw/virtio/virtio.c
> > > > @@ -2495,6 +2495,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > > >      __virtio_queue_reset(vdev, queue_index);
> > > >  }
> > > >
> > > > +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> > > > +{
> > > > +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > > > +
> > > > +    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > > > +        error_report("queue_enable is only suppported in devices of virtio "
> > > > +                     "1.0 or later.");
> > >
> > > Why is this triggering here? Maybe virtio_queue_enable() is called too
> > > early. I have verified that the Linux guest driver sets VERSION_1. I
> > > didn't check what SeaBIOS does.
> >
> > Looks like a bug, we should check device features here at least and it
> > should be guest errors instead of error_report() here.
> >
> > Thanks
> >
>
> I suspect we should just drop this print. Kangjie?


I think it is.

At that time, this inspection was only added at hand, and theoretically it
should not be performed.

I am responsible for this patch set now.

hi, Michael,

What should I do, do I send a new version again?

Thanks.

>
>
> > > $ build/qemu-system-x86_64 -M accel=kvm -m 1G -cpu host -blockdev
> > > file,node-name=drive0,filename=test.img -device
> > > virtio-blk-pci,drive=drive0
> > > qemu: queue_enable is only suppported in devices of virtio 1.0 or later.
> > >
> > > Stefan
> > >
>

