Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF77422073
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:16:53 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfd5-0005X1-1x
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXfWG-0006DQ-2r
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:09:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXfWE-0005Io-B0
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633421385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t+6ORXs8UcjEYu6uoOB2fcLF3iJ1Dp0dFc99tBe7B0Y=;
 b=bqeun0wFucJ3mLzBQWgbeQOUdRYOO3p6Pf49WvZeb35H/caY0mvY4iYRYnvCHa8gpsbYx1
 EiLUV0JuK4gaRmahoHpvxgBSLGvuBzpoG0OdxibCnJ5sMAHll6ya7Coojb/luIVtLz61dW
 sUg4/lbNuKuFAuavMNxhd3QQtQGnt6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-r4iyaI0zORKzz7kUrnF02g-1; Tue, 05 Oct 2021 04:09:43 -0400
X-MC-Unique: r4iyaI0zORKzz7kUrnF02g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D923835DED;
 Tue,  5 Oct 2021 08:09:42 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89E605D9DE;
 Tue,  5 Oct 2021 08:09:36 +0000 (UTC)
Date: Tue, 5 Oct 2021 09:09:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 06/13] vhost-user-fs: Use helpers to create/cleanup
 virtqueue
Message-ID: <YVwIPxELo8PSoE2B@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-7-vgoyal@redhat.com>
 <YVsHifrJdRtVyERb@stefanha-x1.localdomain>
 <YVtc0UMWQtAaCNog@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVtc0UMWQtAaCNog@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+iqnBC8z7q5gu8r7"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+iqnBC8z7q5gu8r7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 03:58:09PM -0400, Vivek Goyal wrote:
> On Mon, Oct 04, 2021 at 02:54:17PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Sep 30, 2021 at 11:30:30AM -0400, Vivek Goyal wrote:
> > > Add helpers to create/cleanup virtuqueues and use those helpers. I wi=
ll
> >=20
> > s/virtuqueues/virtqueues/
> >=20
> > > need to reconfigure queues in later patches and using helpers will al=
low
> > > reusing the code.
> > >=20
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > >  hw/virtio/vhost-user-fs.c | 87 +++++++++++++++++++++++--------------=
--
> > >  1 file changed, 52 insertions(+), 35 deletions(-)
> > >=20
> > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > index c595957983..d1efbc5b18 100644
> > > --- a/hw/virtio/vhost-user-fs.c
> > > +++ b/hw/virtio/vhost-user-fs.c
> > > @@ -139,6 +139,55 @@ static void vuf_set_status(VirtIODevice *vdev, u=
int8_t status)
> > >      }
> > >  }
> > > =20
> > > +static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > > +{
> > > +    /*
> > > +     * Not normally called; it's the daemon that handles the queue;
> > > +     * however virtio's cleanup path can call this.
> > > +     */
> > > +}
> > > +
> > > +static void vuf_create_vqs(VirtIODevice *vdev)
> > > +{
> > > +    VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > > +    unsigned int i;
> > > +
> > > +    /* Hiprio queue */
> > > +    fs->hiprio_vq =3D virtio_add_queue(vdev, fs->conf.queue_size,
> > > +                                     vuf_handle_output);
> > > +
> > > +    /* Request queues */
> > > +    fs->req_vqs =3D g_new(VirtQueue *, fs->conf.num_request_queues);
> > > +    for (i =3D 0; i < fs->conf.num_request_queues; i++) {
> > > +        fs->req_vqs[i] =3D virtio_add_queue(vdev, fs->conf.queue_siz=
e,
> > > +                                          vuf_handle_output);
> > > +    }
> > > +
> > > +    /* 1 high prio queue, plus the number configured */
> > > +    fs->vhost_dev.nvqs =3D 1 + fs->conf.num_request_queues;
> > > +    fs->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, fs->vhost_d=
ev.nvqs);
> >=20
> > These two lines prepare for vhost_dev_init(), so moving them here is
> > debatable. If a caller is going to use this function again in the futur=
e
> > then they need to be sure to also call vhost_dev_init(). For now it
> > looks safe, so I guess it's okay.
>=20
> Hmm..., I do call this function later from vuf_set_features() and
> reconfigure the queues. I see that I don't call vhost_dev_init()
> in that path. I am not even sure if I should be calling
> vhost_dev_init() from inside vuf_set_features().
>=20
> So core reuirement is that at the time of first creating device
> I have no idea if driver supports notification queue or not. So
> I do create device with notification queue. But later if driver
> (and possibly vhost device) does not support notifiation queue,
> then we need to reconfigure queues. What's the correct way to
> do that?

Ah, I see. The simplest approach is to always allocate the maximum
number of virtqueues. QEMU's vhost-user-fs device shouldn't need to
worry about which virtqueues are actually in use. Let virtiofsd (the
vhost-user backend) worry about that.

I posted ideas about how to do that in a reply to another patch in this
series. I can't guarantee it will work, but I think it's worth
exploring.

Stefan

--+iqnBC8z7q5gu8r7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcCD8ACgkQnKSrs4Gr
c8jdjgf/e1SGpQd5MmZoaTevqKLpWjV3OK81VQtwN4FSZSjYCxyj5PVrp7c31bIR
da/751eNaluxZR3EcOH+0J8FmPbkWuLTlNeCvBl+h1jkbg6h6jztDs1tXIIiUTBW
ZApCIgBr4LdfsvBZ/3m2072V9zcUQGnhERVrhvJ7Nx5/TbLwP/LpxLHLYcD0VGfJ
KtvYcTouN9VlTvgeT2zDhcqlsuy74t/4Xpu/0dmIgozNj1RHYRg04ew7tIgFLUOz
kz3RYYxvr0h/A1SxokRP2W565kgU/IYLZ0m+Fgzp2tmeR9+iCk8UJ3rG+h2lqPoK
YWLtzEC4sLDbn48B3nzkzuYo9vpU5w==
=DUE7
-----END PGP SIGNATURE-----

--+iqnBC8z7q5gu8r7--


