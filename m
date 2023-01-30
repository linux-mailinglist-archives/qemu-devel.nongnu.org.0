Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E433D6803FD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 04:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMKQh-0004kN-VS; Sun, 29 Jan 2023 22:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pMKQf-0004hi-3h
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 22:01:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pMKQd-0006pO-8w
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 22:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675047714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Ok6s27rgbvWGJO9QbfGRzIi79CMmpPjSFwPk7Wy23g=;
 b=LlCiVIYnR95bDVytw82LkAjxUubLDMubLZ1eykK8vZiiQt9spevTt2i3I9WtXDhz6ERkaX
 4hkjTHnOPtPOFvxA4vqTayOn9jKq2/7UlYUm28n5W1dIxjYTgZXGFPGNjHtv8QnMhtuUrt
 Z0+fr7cPHchS/jc+SYxzd5sbgV7drHQ=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-ylJXchd2McCEZk6rwv2o4g-1; Sun, 29 Jan 2023 22:01:52 -0500
X-MC-Unique: ylJXchd2McCEZk6rwv2o4g-1
Received: by mail-ot1-f72.google.com with SMTP id
 y18-20020a9d6352000000b00686b3ef5990so5148804otk.11
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 19:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Ok6s27rgbvWGJO9QbfGRzIi79CMmpPjSFwPk7Wy23g=;
 b=f5Gg1R3YZK9pNLuj+zVFbtG+ba2qDqtcT0s3QQeLMDbk58yI2SHipxRcgml+sMcFcY
 KTbpeZru8oKybWQZ85ubWTVan8oufubkZ4df5Od+HFRYHvbyhA3RbN7Ar+nXDoJhPMn8
 7uBCy/tvoMRx5HHW37dTPslScQn8sIFz6+6XaRTFHhvWrWq0AirFIFY1ffqohARyrYD/
 f7kQv9diogYLbrdKLyys1ysSRZuUIJEWnf4qbrZJjqcVr4Pg6JECzc20lyfuDKcKfkTF
 A65VAKK72v9VUORQsjhGOEP4IN4QptkI9ivjbEx44MKfGoxzaesEAQs7sx7UOlS9yNsk
 aHRw==
X-Gm-Message-State: AO0yUKXJd+pEAV1XQ5vHju8M/QcljRGsrXyYiwHqfs9KdG2qsaEzDKpg
 5nw/gFGAIYiG8JP21mFhcvfCl8E45kdEYnfr71hwE19aKTNEmMhnpoyFsDNCPieRr50fsLSUbY9
 JAV1nZ8eYGCb2pkek3TRw742f5rIeqg0=
X-Received: by 2002:a05:6870:959e:b0:163:9cea:eea7 with SMTP id
 k30-20020a056870959e00b001639ceaeea7mr257606oao.35.1675047712090; 
 Sun, 29 Jan 2023 19:01:52 -0800 (PST)
X-Google-Smtp-Source: AK7set90nbwtpIeaqu/hcdpsZ4BY3HtlXkbDg0juRD9m1Q2SeIxCrNlJL8P/Py8RCR8JHrMZufa5qS0X5znSA0l+0ZQ=
X-Received: by 2002:a05:6870:959e:b0:163:9cea:eea7 with SMTP id
 k30-20020a056870959e00b001639ceaeea7mr257599oao.35.1675047711817; Sun, 29 Jan
 2023 19:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEvHyRr_nt6eFzE632yOLLOsrcCv3dN5sD01AaGD_-LZVg@mail.gmail.com>
 <1674978207.8889825-4-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1674978207.8889825-4-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 30 Jan 2023 11:01:40 +0800
Message-ID: <CACGkMEs0NeOA4H9z2LkgYRZhcdQ4Hx2kgH+hE+JLV8TzsfWohg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>
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

On Sun, Jan 29, 2023 at 3:44 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> On Sun, 29 Jan 2023 14:23:21 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > On Sun, Jan 29, 2023 at 10:52 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > >
> > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > >
> > > Before per-queue reset, we need to recover async tx resources. At this
> > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > new packets, so virtio_net_flush_tx() should check the current
> > > per-queue reset state.
> > >
> > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >  hw/net/virtio-net.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index 3ae909041a..fba6451a50 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > >      VirtQueueElement *elem;
> > >      int32_t num_packets = 0;
> > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > +        virtio_queue_reset_state(q->tx_vq)) {
> >
> > We have other places that check DRIVER_OK do we need to check queue
> > reset as well?
>
> I checked it again. I still think that the location of other checking DRIVER_OK
> does not need to check the queue reset.

For example, if we don't disable can_receive() when the queue is
reset, it means rx may go for virtio_net_receive_rcu(). It means the
Qemu is still trying to process the traffic from the network backend
like tap which may waste cpu cycles.

I think the correct way is to return false when the queue is reset in
can_receive(), then the backend poll will be disabled (e.g TAP). When
the queue is enabled again, qemu_flush_queued_packets() will wake up
the backend polling.

Having had time to check other places but it would be better to
mention why it doesn't need a check in the changelog.

Thanks

>
> Thanks.
>
>
> >
> > E.g:
> > virtio_net_can_receive()
> > virtio_net_tx_{timer|bh}()
> >
> > Thanks
> >
> > >          return num_packets;
> > >      }
> > >
> > > --
> > > 2.32.0.3.g01195cf9f
> > >
> >
>


