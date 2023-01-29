Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8DE67FEB2
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 12:59:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM6Jb-0005jF-IZ; Sun, 29 Jan 2023 06:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM6JY-0005ia-Hz
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 06:57:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM6JW-0003N8-7q
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 06:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674993456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=614/oj7b7bnBlmu6niD6nts++vDORpoYoJ2pv7EhOSg=;
 b=C5XWFWM5/bU+YTvg/pCcy1qYq+3bkysSD38jBuzqjw4gVzKsEPuvhoTt7NxFId6LyPGNZZ
 qUhzl/t80lC5LU80TJI+1XBtcMWdUxkbiTb1Nk3E1sB+eZYkxozBUkvw8dkYYuG7tTUpCF
 14RZ+rSuMGjyY8mo5zDVEPajtl9QyDE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-05WnZgfFPduWlk9mBg5wIA-1; Sun, 29 Jan 2023 06:57:35 -0500
X-MC-Unique: 05WnZgfFPduWlk9mBg5wIA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m10-20020a05600c3b0a00b003dafe7451deso5462264wms.4
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 03:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=614/oj7b7bnBlmu6niD6nts++vDORpoYoJ2pv7EhOSg=;
 b=6uMOfZIKXL0MMr3LAROOr/1hdGbhUXBGOcFAZRZ0opbreIYHr13UGj6de9eMibGxf5
 VuLlnAQIAN/UrO/2BUgYJZTUjDEA6DOVwLZBVZ0qWePDo6jwG9DKbxHbIC0BmXEs/B1M
 Wqx7XMlB8nIayt/kDTdKat88KjHngiomonu+J/vK3V4iXj7cjkHPx8/SG+3pIne3HjMU
 YpBJsDgVgyDUxEbWk7cK9+9nDTraAt3YGyvzK1CByQ35U2FjyqeWpyizb/YwwItf414R
 tESMVb6LsVh73uDg7g2yerf8l4orS4UblQ+y4Uoc3qx/Y19tARdE3+8N189R3GImXUOw
 mJEQ==
X-Gm-Message-State: AFqh2kpRYPsJIZYDOC7N46d9RAQcuB2AQe5tzIWJqZtJ/R6w/Xz6oZCk
 BCgWtOgJzkzxdMWCkhUzNIyDVunLWkDzGThz7mgknByrlzCB2HHLnE9YntpPhQOz4nlLUXi+FCX
 PT3J0VrYE8yhkCQE=
X-Received: by 2002:a05:600c:4e05:b0:3d3:5a4a:9103 with SMTP id
 b5-20020a05600c4e0500b003d35a4a9103mr46161111wmq.31.1674993454110; 
 Sun, 29 Jan 2023 03:57:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJdc1GnXoVBwtTsRTxeDNpcKqFL0FSHE+dAsa1HR4KDAMknmM8525eSG8qcEsyuP14VQ6W6w==
X-Received: by 2002:a05:600c:4e05:b0:3d3:5a4a:9103 with SMTP id
 b5-20020a05600c4e0500b003d35a4a9103mr46161094wmq.31.1674993453798; 
 Sun, 29 Jan 2023 03:57:33 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 hu18-20020a05600ca29200b003dc4b4dea31sm4322282wmb.27.2023.01.29.03.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 03:57:33 -0800 (PST)
Date: Sun, 29 Jan 2023 06:57:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for
 per-queue reset
Message-ID: <20230129065705-mutt-send-email-mst@kernel.org>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
 <20230129021402-mutt-send-email-mst@kernel.org>
 <1674977308.9335406-2-xuanzhuo@linux.alibaba.com>
 <20230129025950-mutt-send-email-mst@kernel.org>
 <1674980588.489446-5-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674980588.489446-5-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Sun, Jan 29, 2023 at 04:23:08PM +0800, Xuan Zhuo wrote:
> On Sun, 29 Jan 2023 03:12:12 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Sun, Jan 29, 2023 at 03:28:28PM +0800, Xuan Zhuo wrote:
> > > On Sun, 29 Jan 2023 02:25:43 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > On Sun, Jan 29, 2023 at 10:51:50AM +0800, Xuan Zhuo wrote:
> > > > > Check whether it is per-queue reset state in virtio_net_flush_tx().
> > > > >
> > > > > Before per-queue reset, we need to recover async tx resources. At this
> > > > > time, virtio_net_flush_tx() is called, but we should not try to send
> > > > > new packets, so virtio_net_flush_tx() should check the current
> > > > > per-queue reset state.
> > > >
> > > >
> > > > What does "at this time" mean here?
> > > > Do you in fact mean it's called from flush_or_purge_queued_packets?
> > >
> > > Yes
> > >
> > > virtio_queue_reset
> > > 	k->queue_reset
> > > 		virtio_net_queue_reset
> > > 			flush_or_purge_queued_packets
> > > 				qemu_flush_or_purge_queued_packets
> > > 					.....
> > > 					(callback) virtio_net_tx_complete
> > > 						virtio_net_flush_tx <-- here send new packet. We need stop it.
> > >
> > >
> > > Because it is inside the callback, I can't pass information through the stack. I
> > > originally thought it was a general situation, so I wanted to put it in
> > > struct VirtQueue.
> > >
> > > If it is not very suitable, it may be better to put it in VirtIONetQueue.
> > >
> > > Thanks.
> >
> > Hmm maybe. Another idea: isn't virtio_net_tx_complete called
> > with length 0 here? Are there other cases where length is 0?
> >
> >
> > > > What does the call stack look like?
> > > >
> > > > If yes introducing a vq state just so virtio_net_flush_tx
> > > > knows we are in the process of reset would be a bad idea.
> > > > We want something much more local, ideally on stack even ...
> > > >
> > > >
> > > > >
> > > > > Fixes: 7dc6be52 ("virtio-net: support queue reset")
> > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
> > > > > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > ---
> > > > >  hw/net/virtio-net.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > > index 3ae909041a..fba6451a50 100644
> > > > > --- a/hw/net/virtio-net.c
> > > > > +++ b/hw/net/virtio-net.c
> > > > > @@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
> > > > >      VirtQueueElement *elem;
> > > > >      int32_t num_packets = 0;
> > > > >      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> > > > > -    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > > > +    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
> > > > > +        virtio_queue_reset_state(q->tx_vq)) {
> >
> > btw this sounds like you are asking it to reset some state.
> >
> > > > >          return num_packets;
> >
> > and then
> >
> >     ret = virtio_net_flush_tx(q);
> >     if (ret >= n->tx_burst)
> >
> >
> > will reschedule automatically won't it?
> >
> > also why check in virtio_net_flush_tx and not virtio_net_tx_complete?
> 
> virtio_net_flush_tx may been called by timer.
> 
> Thanks.

timer won't run while flush_or_purge_queued_packets is in progress.

> >
> >
> > > > >      }
> > > > >
> > > > > --
> > > > > 2.32.0.3.g01195cf9f
> > > >
> >


