Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3522167FED3
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 13:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM6bL-0002Td-Am; Sun, 29 Jan 2023 07:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM6bJ-0002TV-UA
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 07:16:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM6bD-0006uU-UC
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 07:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674994554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=421vk0XnmBy8rW3jVnVjHQiwTGnYiyE8GVtcwYD/pS4=;
 b=JPSHOidnb7OsW7WtKaXt9/Xo2U3sNSZhues35tXtoFTmeXn++eWtv/zdXxmF3pyJ+19K9L
 8S/rpNoQHoESonLs7kLpjKPFEn//e/AymwLOp8nBi/xreSiHDptXrZpLa1GMgf9p8xTkFC
 i0RxZ9LxqSfBVeGqlSIwIX12ge/tDH0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-zqhR2munO_C4HAiXgqI9cg-1; Sun, 29 Jan 2023 07:15:53 -0500
X-MC-Unique: zqhR2munO_C4HAiXgqI9cg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l5-20020a1ced05000000b003db300f2e1cso2793501wmh.0
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 04:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=421vk0XnmBy8rW3jVnVjHQiwTGnYiyE8GVtcwYD/pS4=;
 b=d6O/l7uWdGQ0+fClZwi1Tb86N3/ruziZxRPhEMQwzu9nHp/W/xKgIPUoJUv3gCy4F3
 Kz92ZSz6VRCLa16SlIfKnhc9Fkxoz+CEQlmqXyZoopE2vWz1twpZxswBETgmfq1almH7
 iz57nxlIm5S4l9L5TnQWKtoUf52unKcbvnDjl8DXvl4Z7Xn+KPd1sjx8930nCoraT0OK
 VtHpHmHiBl2RFO78hgQ8/n0qIraoNZDxULqNL5BBo+RhdxwT3bWVjfba/8sXClOJDTTG
 6y1UjXpQV7RMojIg67Mb46qUsgarXpnK4Jyj/0+RRZNoNzHh6Aam7Daw/CvhYMHuXuNq
 VDqw==
X-Gm-Message-State: AO0yUKVMKwTniAmjCLEqCBqtVx2b5z4kzGYfrCgGm5wqex6VkQ/jWiAO
 Ak5XEOsfHmQcpR0FtUAxcixcNL99reImNFkAzMMM4ye4h2Oz+3+/BhGTFh+qywNkn3CYHywbKCz
 AI9yHweNj8XqzgMk=
X-Received: by 2002:adf:a418:0:b0:2bf:dafa:dfee with SMTP id
 d24-20020adfa418000000b002bfdafadfeemr4220396wra.25.1674994551845; 
 Sun, 29 Jan 2023 04:15:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8AyIMbzNnJa72dICwER/p11uTWMp8SH0kNL71UzKZAlGkNmQKNSR8U10YqFZ/3taZ+DTAa5g==
X-Received: by 2002:adf:a418:0:b0:2bf:dafa:dfee with SMTP id
 d24-20020adfa418000000b002bfdafadfeemr4220374wra.25.1674994551420; 
 Sun, 29 Jan 2023 04:15:51 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 r6-20020adff106000000b002bfe05bf6dcsm3679330wro.88.2023.01.29.04.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 04:15:50 -0800 (PST)
Date: Sun, 29 Jan 2023 07:15:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
Message-ID: <20230129071154-mutt-send-email-mst@kernel.org>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <20230129021402-mutt-send-email-mst@kernel.org>
 <1674977308.9335406-2-xuanzhuo@linux.alibaba.com>
 <20230129025950-mutt-send-email-mst@kernel.org>
 <1674980588.489446-5-xuanzhuo@linux.alibaba.com>
 <20230129065705-mutt-send-email-mst@kernel.org>
 <1674993822.7782302-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674993822.7782302-1-xuanzhuo@linux.alibaba.com>
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

On Sun, Jan 29, 2023 at 08:03:42PM +0800, Xuan Zhuo wrote:
> On Sun, 29 Jan 2023 06:57:29 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Sun, Jan 29, 2023 at 04:23:08PM +0800, Xuan Zhuo wrote:
> > > On Sun, 29 Jan 2023 03:12:12 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > On Sun, Jan 29, 2023 at 03:28:28PM +0800, Xuan Zhuo wrote:
> > > > > On Sun, 29 Jan 2023 02:25:43 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > On Sun, Jan 29, 2023 at 10:51:50AM +0800, Xuan Zhuo wrote:
> > > > > > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > > > > > >
> > > > > > > Before per-queue reset, we need to recover async tx resources. At this
> > > > > > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > > > > > new packets, so virtio_net_flush_tx() should check the current
> > > > > > > per-queue reset state.
> > > > > >
> > > > > >
> > > > > > What does "at this time" mean here?
> > > > > > Do you in fact mean it's called from flush_or_purge_queued_packets?
> > > > >
> > > > > Yes
> > > > >
> > > > > virtio_queue_reset
> > > > > 	k->queue_reset
> > > > > 		virtio_net_queue_reset
> > > > > 			flush_or_purge_queued_packets
> > > > > 				qemu_flush_or_purge_queued_packets
> > > > > 					.....
> > > > > 					(callback) virtio_net_tx_complete
> > > > > 						virtio_net_flush_tx <-- here send new packet. We need stop it.
> > > > >
> > > > >
> > > > > Because it is inside the callback, I can't pass information through the stack. I
> > > > > originally thought it was a general situation, so I wanted to put it in
> > > > > struct VirtQueue.
> > > > >
> > > > > If it is not very suitable, it may be better to put it in VirtIONetQueue.
> > > > >
> > > > > Thanks.
> > > >
> > > > Hmm maybe. Another idea: isn't virtio_net_tx_complete called
> > > > with length 0 here? Are there other cases where length is 0?
> > > >
> > > >
> > > > > > What does the call stack look like?
> > > > > >
> > > > > > If yes introducing a vq state just so virtio_net_flush_tx
> > > > > > knows we are in the process of reset would be a bad idea.
> > > > > > We want something much more local, ideally on stack even ...
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > > > > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > ---
> > > > > > >  hw/net/virtio-net.c | 3 ++-
> > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > > > index 3ae909041a..fba6451a50 100644
> > > > > > > --- a/hw/net/virtio-net.c
> > > > > > > +++ b/hw/net/virtio-net.c
> > > > > > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > > > > > >      VirtQueueElement *elem;
> > > > > > >      int32_t num_packets = 0;
> > > > > > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > > > > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > > > > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > > > > > +        virtio_queue_reset_state(q->tx_vq)) {
> > > >
> > > > btw this sounds like you are asking it to reset some state.
> > > >
> > > > > > >          return num_packets;
> > > >
> > > > and then
> > > >
> > > >     ret = virtio_net_flush_tx(q);
> > > >     if (ret >= n->tx_burst)
> > > >
> > > >
> > > > will reschedule automatically won't it?
> > > >
> > > > also why check in virtio_net_flush_tx and not virtio_net_tx_complete?
> > >
> > > virtio_net_flush_tx may been called by timer.
> > >
> > > Thanks.
> >
> > timer won't run while flush_or_purge_queued_packets is in progress.
> 
> Is timer not executed during the VMEXIT process? Otherwise, we still have to
> consider that after the flush_or_purge_queued_packets, this process before the
> structure is cleared.



void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
{
    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);

    if (k->queue_reset) {
        k->queue_reset(vdev, queue_index);
    }

    __virtio_queue_reset(vdev, queue_index);
}


No timers do not run between  k->queue_reset and __virtio_queue_reset.


> Even if it can be processed in virtio_net_tx_complete, is there any good way?
> This is a callback, it is not convenient to pass the parameters.
> 
> Thanks


How about checking that length is 0?

> 
> >
> > > >
> > > >
> > > > > > >      }
> > > > > > >
> > > > > > > --
> > > > > > > 2.32.0.3.g01195cf9f
> > > > > >
> > > >
> >


