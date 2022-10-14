Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2445FE771
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 05:12:39 +0200 (CEST)
Received: from localhost ([::1]:56102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojB7m-0003D2-90
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 23:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ojB6V-0001nV-I0
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 23:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ojB6Q-0000sr-RV
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 23:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665717073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4+PMWs9BlNNY8agVDZY3dpe218n7fLD2OwDp/mqH3+o=;
 b=RjcNL/CUPNmpWYQREG4dQM6XbJdD0q9jRXHa7SueDfLvLA0PFv+zm5jBRnG3KIgXSXZF+E
 5fy/udjSDAPvQBKmr+esrRf/dDNJUYe8nC6loGPZVMlBVwWunwVXKBhSt2/X455LpmJOzE
 d9DJzLNLmawgcTh6kopMGUd2yG+X6NM=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-loUWoowZOM-ujtqO0B0oIw-1; Thu, 13 Oct 2022 23:11:05 -0400
X-MC-Unique: loUWoowZOM-ujtqO0B0oIw-1
Received: by mail-oo1-f71.google.com with SMTP id
 x26-20020a4aea1a000000b00480a4135181so1224273ood.15
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 20:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4+PMWs9BlNNY8agVDZY3dpe218n7fLD2OwDp/mqH3+o=;
 b=CvILW9AXSvDtSrvklHSgPwy99V6VQ8XHsgJliH15Wy/Jwi8ZmEcoQdAWdwnDeCz4AR
 tmxQRF/IxiJjJ/tzppC4RmiYW7IMCjlhjHZQqbrcajOR0Hgi1KFyAHZv1fsG318PkdiG
 o+bxyZnODzpZAbMCgLD1nWFNybmxKjiTGYxmGJ383g/n9Xh5SqrveELZOdq4Yt5b7y1k
 zP0jEjzplWHHWObC5SSgH8HOgVysd9jdSlUH01hssL6Yiy4uA5Mk6X4CZkhFyWU/ztPx
 pUw8vWqmlHaPUgf16YePi5+0Q1kiylr3JpU3tGke+1z5dKXEb0uohYjqOCorBn0MGO0R
 GwAw==
X-Gm-Message-State: ACrzQf3tlKWjldgtAo8XVaTYrr/K+VR9BVJIbC5ai3N/tk4zvw6r36Mw
 2GvbwInW4qrYJfdlelAMBk9GcNmy+3RVHsCeckLzuBNlxemW4qwhcMKC9RK6VS4yomzviF7Q3+9
 DXXwWXmwb4VfiXock6S3nghp1LOEbMb4=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr6075260oiw.35.1665717064336; 
 Thu, 13 Oct 2022 20:11:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ARhX22CSRCliAEaMFRUYIhlKr13Q+Tiw5l4zXxOvRaXHmaFGM3mj+7RbSlPeJwxxUgOJ+bsBaGWH2fTNy31Y=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr6075248oiw.35.1665717064127; Thu, 13 Oct
 2022 20:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221013140057.63575-1-lvivier@redhat.com>
 <20221013104724-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221013104724-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 Oct 2022 11:10:53 +0800
Message-ID: <CACGkMEsEhudE-yM7cZ5e9rXP-+w8-YTeL3MV73mghVh1uoF+9g@mail.gmail.com>
Subject: Re: [PATCH RFC] virtio-net: fix bottom-half packet TX on asynchronous
 completion
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org, 
 David Gibson <david@gibson.dropbear.id.au>, Stefano Brivio <sbrivio@redhat.com>,
 alex.williamson@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 10:48 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Oct 13, 2022 at 04:00:57PM +0200, Laurent Vivier wrote:
> > When virtio-net is used with the socket netdev backend, the backend
> > can be busy and not able to collect new packets.
> >
> > In this case, net_socket_receive() returns 0 and registers a poll function
> > to detect when the socket is ready again.
> >
> > In virtio_net_tx_bh(), virtio_net_flush_tx() forwards the 0, the virtio
> > notifications are disabled and the function is not rescheduled, waiting
> > for the backend to be ready.
> >
> > When the socket netdev backend is again able to send packets, the poll
> > function re-starts to flush remaining packets. This is done by
> > calling virtio_net_tx_complete(). It re-enables notifications and calls
> > again virtio_net_flush_tx().
> >
> > But it seems if virtio_net_flush_tx() reaches the tx_burst value all
> > the queue is not flushed and no new notification is sent to reschedule
> > virtio_net_tx_bh(). Nothing re-start to flush the queue and remaining packets
> > are stuck in the queue.
> >
> > To fix that, detect in virtio_net_tx_complete() if virtio_net_flush_tx()
> > has been stopped by tx_burst and if yes reschedule the bottom half
> > function virtio_net_tx_bh() to flush the remaining packets.
> >
> > This is what is done in virtio_net_tx_bh() when the virtio_net_flush_tx()
> > is synchronous, and completely by-passed when the operation needs to be
> > asynchronous.
> >
> > RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC
> >
> > Do we need to reschedule the function in the other case managed
> > in virtio_net_tx_bh() and by-passed when the completion is asynchronous?
>
>
> I am guessing no.
>
> >     /* If less than a full burst, re-enable notification and flush
> >      * anything that may have come in while we weren't looking.  If
> >      * we find something, assume the guest is still active and reschedule */
> >     virtio_queue_set_notification(q->tx_vq, 1);
> >     ret = virtio_net_flush_tx(q);
> >     if (ret == -EINVAL) {
> >         return;
> >     } else if (ret > 0) {
> >         virtio_queue_set_notification(q->tx_vq, 0);
> >         qemu_bh_schedule(q->tx_bh);
> >         q->tx_waiting = 1;
> >     }
> >
> > RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC
> >
> > Fixes: a697a334b3c4 ("virtio-net: Introduce a new bottom half packet TX")
> > Cc: alex.williamson@redhat.com
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>
> Looks ok superficially
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> Jason, your area.
>
> > ---
> >  hw/net/virtio-net.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index e9f696b4cfeb..1fbf2f3e19a7 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -2526,6 +2526,7 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
> >      VirtIONet *n = qemu_get_nic_opaque(nc);
> >      VirtIONetQueue *q = virtio_net_get_subqueue(nc);
> >      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> > +    int ret;
> >
> >      virtqueue_push(q->tx_vq, q->async_tx.elem, 0);
> >      virtio_notify(vdev, q->tx_vq);
> > @@ -2534,7 +2535,17 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
> >      q->async_tx.elem = NULL;
> >
> >      virtio_queue_set_notification(q->tx_vq, 1);
> > -    virtio_net_flush_tx(q);
> > +    ret = virtio_net_flush_tx(q);
> > +    if (q->tx_bh && ret >= n->tx_burst) {
> > +        /*
> > +         * the flush has been stopped by tx_burst
> > +         * we will not receive notification for the
> > +         * remainining part, so re-schedule
> > +         */
> > +        virtio_queue_set_notification(q->tx_vq, 0);
> > +        qemu_bh_schedule(q->tx_bh);
> > +        q->tx_waiting = 1;
> > +    }

Do we need to fix the case of tx timer or it doesn't suffer from this issue?

Thanks

> >  }
> >
> >  /* TX */
> > --
> > 2.37.3
>


