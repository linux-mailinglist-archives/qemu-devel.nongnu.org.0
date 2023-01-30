Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22936805A2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:33:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMmk-0004A8-Cc; Mon, 30 Jan 2023 00:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMMmQ-00049V-RF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:32:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMMmO-0004O6-Pt
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675056751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rkzwHLoO6w4DzRckU+YwfSQKK4KeZitO/MDHJPwdwYg=;
 b=aYFkwdg9Uc1UxFQYVuugBJKY2ydk3MZ8xFMxcBZxSJSc/v5lBBUM6iRNOnPVLmLtJoDdCR
 m59aH3FgEYRH2w6GjMdF435/BIqjXZVI1NeIOL5zFg2KtYCp9c4MUG3CRqcXCGkPzRDt3l
 VRDaj6UgduSct2E4lReKFd3ozSpWqc8=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-sY8UtQXGOTiT2wj3UAwwnw-1; Mon, 30 Jan 2023 00:32:28 -0500
X-MC-Unique: sY8UtQXGOTiT2wj3UAwwnw-1
Received: by mail-vk1-f198.google.com with SMTP id
 z128-20020a1fe286000000b003e1cb6fe65dso3804527vkg.9
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkzwHLoO6w4DzRckU+YwfSQKK4KeZitO/MDHJPwdwYg=;
 b=p9ncByYMqPoktR44XyeMdpdto5goUcZNZOohdr2ue7wqAtWnOmyfmgauT8r59iZhnP
 0SsccPAw3Ix9QlQtrqTyLc4MMwmYXynbUXeY1/DOabinOVaj9EQsYKM3Xx/3P5WAAS25
 JaDoGjuVbS0zHt1II3OL3uVKkJtvEf0LK4eziMKPFBq2ycvrAIqdUfRjEci1bLpq3F64
 z2KTDGuEqztFaJwCRAhsGZ89c4805NbSGV132vKG28jzX2r/gkwmzQUUd9d7pKOJ0ZI0
 /UDmlcvvFFYUYiLxO3kQzehOMi/g1gynCm5qLbrflTZu0/FTNa8JaJiqahFiKD0mhhOP
 lH2w==
X-Gm-Message-State: AO0yUKWdpvZBpGmQiBriwOLxl77YK0dJPOQLmgzPRdwBZbixB7+9YElA
 HDGEwV+dUvQ7qcfte4Ig4+ZQJ10E1czv3a+XaJVOAsibbbj59pRk2qpJX41ppQ+5pAxRLL/mYbm
 OWVO/vQ3lrz2gihA=
X-Received: by 2002:a1f:2d44:0:b0:3ea:3814:6edb with SMTP id
 t65-20020a1f2d44000000b003ea38146edbmr740784vkt.2.1675056747527; 
 Sun, 29 Jan 2023 21:32:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8qluGuup3/8qn4CfFEXZTTM8xCsDpkBAl5x3Te5zD9MPl5oro3RtmsD6+AXYCgkCUlGFv+pA==
X-Received: by 2002:a1f:2d44:0:b0:3ea:3814:6edb with SMTP id
 t65-20020a1f2d44000000b003ea38146edbmr740779vkt.2.1675056747237; 
 Sun, 29 Jan 2023 21:32:27 -0800 (PST)
Received: from redhat.com ([87.249.138.139]) by smtp.gmail.com with ESMTPSA id
 s1-20020a1f2c01000000b003e71eab54d2sm862679vks.2.2023.01.29.21.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:32:26 -0800 (PST)
Date: Mon, 30 Jan 2023 00:32:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
Message-ID: <20230130003158-mutt-send-email-mst@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675044912.9269125-1-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Jan 30, 2023 at 10:15:12AM +0800, Xuan Zhuo wrote:
> On Sun, 29 Jan 2023 07:15:47 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Sun, Jan 29, 2023 at 08:03:42PM +0800, Xuan Zhuo wrote:
> > > On Sun, 29 Jan 2023 06:57:29 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > On Sun, Jan 29, 2023 at 04:23:08PM +0800, Xuan Zhuo wrote:
> > > > > On Sun, 29 Jan 2023 03:12:12 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > On Sun, Jan 29, 2023 at 03:28:28PM +0800, Xuan Zhuo wrote:
> > > > > > > On Sun, 29 Jan 2023 02:25:43 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > > On Sun, Jan 29, 2023 at 10:51:50AM +0800, Xuan Zhuo wrote:
> > > > > > > > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > > > > > > > >
> > > > > > > > > Before per-queue reset, we need to recover async tx resources. At this
> > > > > > > > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > > > > > > > new packets, so virtio_net_flush_tx() should check the current
> > > > > > > > > per-queue reset state.
> > > > > > > >
> > > > > > > >
> > > > > > > > What does "at this time" mean here?
> > > > > > > > Do you in fact mean it's called from flush_or_purge_queued_packets?
> > > > > > >
> > > > > > > Yes
> > > > > > >
> > > > > > > virtio_queue_reset
> > > > > > > 	k->queue_reset
> > > > > > > 		virtio_net_queue_reset
> > > > > > > 			flush_or_purge_queued_packets
> > > > > > > 				qemu_flush_or_purge_queued_packets
> > > > > > > 					.....
> > > > > > > 					(callback) virtio_net_tx_complete
> > > > > > > 						virtio_net_flush_tx <-- here send new packet. We need stop it.
> > > > > > >
> > > > > > >
> > > > > > > Because it is inside the callback, I can't pass information through the stack. I
> > > > > > > originally thought it was a general situation, so I wanted to put it in
> > > > > > > struct VirtQueue.
> > > > > > >
> > > > > > > If it is not very suitable, it may be better to put it in VirtIONetQueue.
> > > > > > >
> > > > > > > Thanks.
> > > > > >
> > > > > > Hmm maybe. Another idea: isn't virtio_net_tx_complete called
> > > > > > with length 0 here? Are there other cases where length is 0?
> > > > > >
> > > > > >
> > > > > > > > What does the call stack look like?
> > > > > > > >
> > > > > > > > If yes introducing a vq state just so virtio_net_flush_tx
> > > > > > > > knows we are in the process of reset would be a bad idea.
> > > > > > > > We want something much more local, ideally on stack even ...
> > > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > > > > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > > > > > > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > > > ---
> > > > > > > > >  hw/net/virtio-net.c | 3 ++-
> > > > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > > > > > index 3ae909041a..fba6451a50 100644
> > > > > > > > > --- a/hw/net/virtio-net.c
> > > > > > > > > +++ b/hw/net/virtio-net.c
> > > > > > > > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > > > > > > > >      VirtQueueElement *elem;
> > > > > > > > >      int32_t num_packets = 0;
> > > > > > > > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > > > > > > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > > > > > > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > > > > > > > +        virtio_queue_reset_state(q->tx_vq)) {
> > > > > >
> > > > > > btw this sounds like you are asking it to reset some state.
> > > > > >
> > > > > > > > >          return num_packets;
> > > > > >
> > > > > > and then
> > > > > >
> > > > > >     ret = virtio_net_flush_tx(q);
> > > > > >     if (ret >= n->tx_burst)
> > > > > >
> > > > > >
> > > > > > will reschedule automatically won't it?
> > > > > >
> > > > > > also why check in virtio_net_flush_tx and not virtio_net_tx_complete?
> > > > >
> > > > > virtio_net_flush_tx may been called by timer.
> > > > >
> > > > > Thanks.
> > > >
> > > > timer won't run while flush_or_purge_queued_packets is in progress.
> > >
> > > Is timer not executed during the VMEXIT process? Otherwise, we still have to
> > > consider that after the flush_or_purge_queued_packets, this process before the
> > > structure is cleared.
> >
> >
> >
> > void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > {
> >     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> >
> >     if (k->queue_reset) {
> >         k->queue_reset(vdev, queue_index);
> >     }
> >
> >     __virtio_queue_reset(vdev, queue_index);
> > }
> >
> >
> > No timers do not run between  k->queue_reset and __virtio_queue_reset.
> >
> >
> > > Even if it can be processed in virtio_net_tx_complete, is there any good way?
> > > This is a callback, it is not convenient to pass the parameters.
> > >
> > > Thanks
> >
> >
> > How about checking that length is 0?
> 
> 
> I think that check length is not a good way. This modifys the semantics of 0. It is
> not friendly to the future maintenance. On the other hand, qemu_net_queue_purge()
> will pass 0, and this function is called by many places.
> 
> How about we add an api in queue.c to replace the sent_cb callback on queue?
> 
> Thanks.

OK I guess. Jason?

> 
> >
> > >
> > > >
> > > > > >
> > > > > >
> > > > > > > > >      }
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 2.32.0.3.g01195cf9f
> > > > > > > >
> > > > > >
> > > >
> >


