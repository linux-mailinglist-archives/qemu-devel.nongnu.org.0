Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA3461A86
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:59:33 +0100 (CET)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mri7v-0006C9-No
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mri5C-0004nv-Sw
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mri5A-0006IE-2H
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638197798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yG/K5abKIWovr0m/hnD7Y2sx0coWGLJLa4Vcz7RYYpc=;
 b=O85kLtQnloVKXNWhmKSNgZ2aGE5MpBHh602Yfk27jTEjk9LFTTJBKt4sPd7gVWSYk/QYUF
 YzsLTez3ICDfTf3aQmhZRa8N0eCFXOMv0UC32BwIq0/Hb1b9GFo9owtkpaHgCbBrkkSNJQ
 nLa7T4cenDm2Tr0XA/CumG4rI5O3npo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-8e4oSW65Pb2bjpZvo-METQ-1; Mon, 29 Nov 2021 09:56:37 -0500
X-MC-Unique: 8e4oSW65Pb2bjpZvo-METQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 fw10-20020a056214238a00b003c05d328ad2so25447608qvb.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yG/K5abKIWovr0m/hnD7Y2sx0coWGLJLa4Vcz7RYYpc=;
 b=iPCRUa7TokHjGb5nPqayXacJDfDl/5prnkHTitJKXM1Ac4XDENkthrk3HyewjZuB+I
 dNQao7B7tSMTEptkx1+OgqzbvlIB1LF/7h9y/bjq3ppipBWdWw2tfcpPjwDZCkTB5x+r
 mpJZDPIiM35s3A29CYFuopZwcaSy2gLOCCBde0e2ClyELVqn+IEkJn/I2+D59H+cshcZ
 BgfKLELo47P2Qz7Y5gANSWyOxFtRZl/GMTIhFwQkLOvgzIaZrkvJ7UnB6U2R3gwDVcoH
 VHj8jNgQ34jlHTFsYqnm7onUHVQPEpTwZiGYFhF7Etk9dDlcWtPPvZrqG6L96L7jMYeg
 WmFQ==
X-Gm-Message-State: AOAM530n/LEO2vvYF639lYzMMw98pFxbkGMVDzl4EBGwvR432EfJXSjy
 5wYHq3gn7DGJj5PzCVt9J14wKMuvEMN5ViBsj7t8kDTzRZgnsRlv3N4sxLXkpCZpZatC9VCH5mU
 ZsMMsvJazyhtdfTu3+whXAmSPYKeqbgo=
X-Received: by 2002:a05:6214:234f:: with SMTP id
 hu15mr43568101qvb.26.1638197797064; 
 Mon, 29 Nov 2021 06:56:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUXPnHOEfpqtDU7ZemDlOGxU1+PgybQriSlhoHPBhAt6uCW1bzXcDNKx4j4f7X05mhPx+CCcVidbEASdoKPuM=
X-Received: by 2002:a05:6214:234f:: with SMTP id
 hu15mr43568061qvb.26.1638197796781; 
 Mon, 29 Nov 2021 06:56:36 -0800 (PST)
MIME-Version: 1.0
References: <20211125101614.76927-1-eperezma@redhat.com>
 <20211125101614.76927-3-eperezma@redhat.com>
 <CACGkMEubkMz-BGxQ3zX__-gmweAvEid=CQxLaRXVDEnCHDoE=A@mail.gmail.com>
 <20211129084249-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211129084249-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 29 Nov 2021 15:56:00 +0100
Message-ID: <CAJaqyWejCiv3qc5KdB4FH+z-98nbLviQEzmneuYz0=ZYgV+tJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] virtio-net: Fix log message
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 29, 2021 at 2:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Nov 26, 2021 at 10:54:32AM +0800, Jason Wang wrote:
> > On Thu, Nov 25, 2021 at 6:16 PM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> > >
> > > The message has never been true in the case of non tap networking, so
> > > only tell that userland networking will be used if possible.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> > Acked-by: Jason Wang <jasowang@redhat.com>
>
> Breaks make check. I suspect it's called without a peer or something.
>

You're right, sending it as a separate patch since I saw the other one
made it into the pull request.

Thanks!

> Dropped for 6.2.
>
> > > ---
> > >  hw/net/virtio-net.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index f2014d5ea0..d6c98c3c2d 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -245,6 +245,7 @@ static void virtio_net_vhost_status(VirtIONet *n,=
 uint8_t status)
> > >      NetClientState *nc =3D qemu_get_queue(n->nic);
> > >      int queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> > >      int cvq =3D n->max_ncs - n->max_queue_pairs;
> > > +    bool tap_backend =3D nc->peer->info->type =3D=3D NET_CLIENT_DRIV=
ER_TAP;
> > >
> > >      if (!get_vhost_net(nc->peer)) {
> > >          return;
> > > @@ -258,9 +259,9 @@ static void virtio_net_vhost_status(VirtIONet *n,=
 uint8_t status)
> > >          int r, i;
> > >
> > >          if (n->needs_vnet_hdr_swap) {
> > > -            error_report("backend does not support %s vnet headers; =
"
> > > -                         "falling back on userspace virtio",
> > > -                         virtio_is_big_endian(vdev) ? "BE" : "LE");
> > > +            error_report("backend does not support %s vnet headers%s=
",
> > > +                    virtio_is_big_endian(vdev) ? "BE" : "LE",
> > > +                    tap_backend ? "; falling back on userspace virti=
o" : "");
> > >              return;
> > >          }
> > >
> > > @@ -288,8 +289,8 @@ static void virtio_net_vhost_status(VirtIONet *n,=
 uint8_t status)
> > >          n->vhost_started =3D 1;
> > >          r =3D vhost_net_start(vdev, n->nic->ncs, queue_pairs, cvq);
> > >          if (r < 0) {
> > > -            error_report("unable to start vhost net: %d: "
> > > -                         "falling back on userspace virtio", -r);
> > > +            error_report("unable to start vhost net: %d%s", -r,
> > > +                       tap_backend ? " falling back on userspace vir=
tio" : "");
> > >              n->vhost_started =3D 0;
> > >          }
> > >      } else {
> > > --
> > > 2.27.0
> > >
>


