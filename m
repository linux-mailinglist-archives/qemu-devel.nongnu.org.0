Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD16442653
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 05:11:36 +0100 (CET)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhl93-0000Zz-9D
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 00:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhl6q-0008JE-Tr
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 00:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhl6n-0003kw-97
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 00:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635826151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CSqNw3Iz5CQGAgUEakxIHRw23+3p899uO5GqnAsNP3w=;
 b=b3Krv3AkSEV+DfMmSsNkx+bhBke1AH9Ce8a6/uQKP9qBj2I2zok5zGTnpoMx+Qm8p/tPDa
 3m0ioHwde3H5SuNlRpsmSaH/t3IJqZ/CUUnhVFsmMpaDkbg8VQI9dFQMNQHolZo9LyRqGL
 VPeO3zQOIj9jGCCSXUobblFqXsv6iqw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-dIpvVj3zNMqEOIXMdG0Qow-1; Tue, 02 Nov 2021 00:09:10 -0400
X-MC-Unique: dIpvVj3zNMqEOIXMdG0Qow-1
Received: by mail-lj1-f197.google.com with SMTP id
 d20-20020a2e8114000000b00212bedb4998so5020926ljg.14
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 21:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CSqNw3Iz5CQGAgUEakxIHRw23+3p899uO5GqnAsNP3w=;
 b=Mcc3Z3mRGBeseUkbJffa/VgcjxPvtLEdlw9ptJsSW3+VGrHfQygLBU01mnSmbwwnIT
 Bj1DzawYedXhY66DSS9v+fIiwY4wq+UBN5KrgiVkaB/utWKfixu6Jla96muwvP2mpzPP
 uWpxIaDt5oe8sLB4+ydO3ezMAgPHwdIB+Mn/9fGfuuambxsSmmLmkfQfka1+XRST6uMZ
 CDifpP3H4WcGy1oayySGuXB8i3phHNlLh6wcCzjfG6mE0MqyVkuWQCu3bTt5s6asngs6
 U4O11DqVVd9x1iup4Y6qt9d1KfKNfYw3tWQD+hokWi9B2pAFPx3qALOSg0mlcpomg/Ox
 niWA==
X-Gm-Message-State: AOAM530W2AEZBBO2oXUuRyx5G0PJOKzQfR1MWcKqI0ZsqvU5BHL+cqW4
 V+5V3MCOA9ZxMc0v+nV8V/ImPDybSksmYQBin2Dnbl7cD9/2/Wn4duSb65LepBsoc2xxcwfn9me
 cKBVN0b628gVyOXSXNlfoUVIHbEJQTz0=
X-Received: by 2002:a2e:8605:: with SMTP id a5mr37519736lji.107.1635826149024; 
 Mon, 01 Nov 2021 21:09:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk/s8lhpQ53voPQNL5nO7dOfhyRb7AyEGIgS9rxERkY4DbduvJDR9KoxqXGq/Csnznn/eZWkBUv3XX0Ek5cKQ=
X-Received: by 2002:a2e:8605:: with SMTP id a5mr37519711lji.107.1635826148746; 
 Mon, 01 Nov 2021 21:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
 <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
In-Reply-To: <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 2 Nov 2021 12:08:57 +0800
Message-ID: <CACGkMEv9OR1yTVWhy8bqxdH8s6+f_6KY=Avw2z3soeBudR+Ocw@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 1, 2021 at 4:59 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Mon, Nov 1, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Oct 29, 2021 at 10:16 PM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> > >
> > > The -1 assumes that all devices with no cvq have an spare vq allocate=
d
> > > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be =
the
> > > case, and the device may have a pair number of queues.
> > >
> > > To fix this, just resort to the lower even number of queues.
> > >
> > > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the =
virtio device")
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  hw/net/vhost_net.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > index 0d888f29a6..edf56a597f 100644
> > > --- a/hw/net/vhost_net.c
> > > +++ b/hw/net/vhost_net.c
> > > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientS=
tate *ncs,
> > >      NetClientState *peer;
> > >
> > >      if (!cvq) {
> > > -        last_index -=3D 1;
> > > +        last_index &=3D ~1ULL;
> > >      }
> >
> > The math here looks correct but we need to fix vhost_vdpa_dev_start() i=
nstead?
> >
> > if (dev->vq_index + dev->nvqs - 1 !=3D dev->last_index) {
> > ...
> > }
> >
>
> If we just do that, devices that offer an odd number of queues but do
> not offer ctrl vq would never enable the last vq pair, isn't it?

For vq pair, you assume that it's a networking device, so the device
you described here violates the spec.

>
> Also, I would say that the right place for the solution of this
> problem should not be virtio/vhost-vdpa: This is highly dependent on
> having cvq, and this implies a knowledge about the use of each
> virtqueue. Another kind of device could have an odd number of
> virtqueues naturally, and that (-1) would not work for them, isn't it?

It actually depends on how multiqueue is modeled for each specific
type of device. They need to initialize the vq_index and nvqs
correctly:

E.g if we had a device with 3 queues, we could model it with the following:

vhost_dev 1, vq_index =3D 0, nvqs =3D 2
vhost_dev 2, vq_index =3D 2, nvqs =3D 1

In this case the last_index should be initialized to 2, then we know
all the vhost_dev is initialized and we can start the hardware.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > >
> > >      if (!k->set_guest_notifiers) {
> > > --
> > > 2.27.0
> > >
> >
>


