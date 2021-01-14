Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DCA2F5A88
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 06:59:10 +0100 (CET)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzvf3-0000Ng-3D
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 00:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kzveE-000874-L8
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 00:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kzveB-0005cH-1y
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 00:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610603893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNacylOqAbPVozexioUNB5fGR3ZWvB9JOUlLoQKvmxM=;
 b=VE2ffzAZUIHXA5zAF15Xf2ckf1eh8PFYIh6Ing6GUbs3kvNJHqnDln2yukMQ+lPz2maDjH
 BYGFampsakLgTckrDInatPZGG/2MFLO7Qb9sKj+Qs3kvVyvEY993NUZ8rCzUr+SLgf5nCj
 EsKHutmwcrOWkeYwKJI4BUEco1rY41M=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-Gd4qfNhMMKOsIxIdoRDkwA-1; Thu, 14 Jan 2021 00:58:11 -0500
X-MC-Unique: Gd4qfNhMMKOsIxIdoRDkwA-1
Received: by mail-pj1-f69.google.com with SMTP id 25so2677874pjb.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 21:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iNacylOqAbPVozexioUNB5fGR3ZWvB9JOUlLoQKvmxM=;
 b=C9/TdDVouiencUbIQhhHH6IR60GOYQXuEKJF0qYIR9o58FsDangyOAl1pupskabWe+
 Dp45lhvOsZDfJc//Z726iE0xXDlb65fhQBdFkyRodjReKMNaRJ7GaB4sBe7IptxquTlx
 N5QhP2xDw8gkEbNyRNqT8XPXh4Ddy69f5fpawueaI4R6wlTK1WtFs8n+xt8Aym2Qepq/
 8ozAupWLB9zS7M72hniJHAHZM3R1j7Zg/lzJBGRawumKbsUpXXdskVtVA7oNkV8pBLoP
 pRCCad7kyQ2CebvW0FMOXMnhxup9raRJOlzeUNQBs+10yfByPYzxcCPs5id3MUSa4Tc9
 uGXg==
X-Gm-Message-State: AOAM530eZ56TEisJlQxnGS8MOrNzgTJWpm9JuQ1Aw+sBei4Bgscg9yNw
 STNAPrlyU8JA75xuxwuTMwRwZ4jAobklvMVea+fi7jo3VBBo08V+m9WpqzCMWyikWmmBWqotSVB
 zz5x2//opXQZ7psje7ytEVB+pkbmZWAU=
X-Received: by 2002:a63:8f4c:: with SMTP id r12mr5769035pgn.311.1610603890068; 
 Wed, 13 Jan 2021 21:58:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAcKHxrPRIfNwWz4rzU3KkUOQEJlvQ/T5KueHTKvwj937C8rgkGmw8qNxKKDka1sIByfhLf99+XgQ5CAlpBi8=
X-Received: by 2002:a63:8f4c:: with SMTP id r12mr5769013pgn.311.1610603889829; 
 Wed, 13 Jan 2021 21:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20210113154540.24981-1-lulu@redhat.com>
 <20210113154540.24981-2-lulu@redhat.com>
 <f139945e-e81c-3c6d-9f18-8f6f88e16094@redhat.com>
In-Reply-To: <f139945e-e81c-3c6d-9f18-8f6f88e16094@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 14 Jan 2021 13:57:33 +0800
Message-ID: <CACLfguWT0n2e=-zaK_rkM-q_eTzteBPrvBSERm30mFovx9LcBg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] virtio:add support in configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 12:34 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/13 =E4=B8=8B=E5=8D=8811:45, Cindy Lu wrote:
> > Add configure notifier and virtio_set_config_notifier_fd_handler
> > in virtio
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/virtio.c         | 25 +++++++++++++++++++++++++
> >   include/hw/virtio/virtio.h |  5 +++++
> >   2 files changed, 30 insertions(+)
> >
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index ceb58fda6c..66ed1daf95 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -3502,6 +3502,15 @@ static void virtio_queue_guest_notifier_read(Eve=
ntNotifier *n)
> >       }
> >   }
> >
> > +static void virtio_queue_config_read(EventNotifier *n)
> > +{
>
>
> Note that the config interrupt belongs to the device. So it's better not
> name it as "queue" here.
>
sure I will fix this
>
> > +    VirtIODevice *vdev =3D container_of(n, VirtIODevice, config_notifi=
er);
> > +
> > +    if (event_notifier_test_and_clear(n)) {
> > +
> > +        virtio_notify_config(vdev);
> > +    }
> > +}
> >   void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool a=
ssign,
> >                                                   bool with_irqfd)
> >   {
> > @@ -3518,6 +3527,17 @@ void virtio_queue_set_guest_notifier_fd_handler(=
VirtQueue *vq, bool assign,
> >       }
> >   }
> >
> > +void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool as=
sign,
> > +                                                bool with_irqfd)
> > +{
> > +    if (assign && !with_irqfd) {
> > +        event_notifier_set_handler(&vdev->config_notifier,
> > +                                   virtio_queue_config_read);
> > +    } else {
> > +       event_notifier_set_handler(&vdev->config_notifier, NULL);
> > +    }
> > +}
>
>
> I wonder whether we can simply generalize
> virtio_queue_set_guest_notifier_fd_handler from
>
> void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assig=
n,
>                                                  bool with_irqfd)
>
> to
>
> void virtio_set_guest_notifier_fd_handler(EventNotifier *e, bool assign,
>                                                  bool with_irqfd)
>
>
> Since there's actually no virtqueue specific setup in this function,
> what its callee really want is a simple EventNotifier.
>
> Thanks
>
Thanks Jason=EF=BC=8C I will fix ths
>
> > +
> >   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
> >   {
> >       return &vq->guest_notifier;
> > @@ -3591,6 +3611,11 @@ EventNotifier *virtio_queue_get_host_notifier(Vi=
rtQueue *vq)
> >       return &vq->host_notifier;
> >   }
> >
> > +EventNotifier *virtio_queue_get_config_notifier(VirtIODevice *vdev)
> > +{
> > +    return &vdev->config_notifier;
> > +
> > +}
> >   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabl=
ed)
> >   {
> >       vq->host_notifier_enabled =3D enabled;
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index b7ece7a6a8..38bd28242e 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -108,6 +108,7 @@ struct VirtIODevice
> >       bool use_guest_notifier_mask;
> >       AddressSpace *dma_as;
> >       QLIST_HEAD(, VirtQueue) *vector_queues;
> > +    EventNotifier config_notifier;
> >   };
> >
> >   struct VirtioDeviceClass {
> > @@ -310,11 +311,15 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
> >   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
> >   void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool a=
ssign,
> >                                                   bool with_irqfd);
> > +void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool as=
sign,
> > +                                                bool with_irqfd);
> > +
> >   int virtio_device_start_ioeventfd(VirtIODevice *vdev);
> >   int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
> >   void virtio_device_release_ioeventfd(VirtIODevice *vdev);
> >   bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
> >   EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
> > +EventNotifier *virtio_queue_get_config_notifier(VirtIODevice *vdev);
> >   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabl=
ed);
> >   void virtio_queue_host_notifier_read(EventNotifier *n);
> >   void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioCon=
text *ctx,
>


