Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED36F5936
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:44:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puClK-0005VQ-Nh; Wed, 03 May 2023 09:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puClJ-0005Ux-0x
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:43:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puClH-00048c-Bb
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683121394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LnWGqGWWdJPHGGU1rFwcwMAX+ugZvyvG/DLBRKCKxQk=;
 b=U7UJHYbecJD9rXD7Fts4+fnfSHTfowFdOFjCtbByy/ojv1PgG9emOTzBb7Xq+Sn+iHpJn0
 bu6L7o+x+uBT4qsMXtoFlbSodno4p7TevMxzgfxGhQ5C6cFWvZsdrFfgjO9HcHjv9RXcxZ
 nH9OvwPLLFNkhMdXUqn4JZNMZzjz0mw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-BMx0iVPUPgGDcLgQ7YyuzA-1; Wed, 03 May 2023 09:43:10 -0400
X-MC-Unique: BMx0iVPUPgGDcLgQ7YyuzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92812852AF6;
 Wed,  3 May 2023 13:43:09 +0000 (UTC)
Received: from redhat.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 164622166B29;
 Wed,  3 May 2023 13:43:05 +0000 (UTC)
Date: Wed, 3 May 2023 15:43:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 07/20] block/export: stop using is_external in
 vhost-user-blk server
Message-ID: <ZFJjicw0Kjfvl5qN@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-8-stefanha@redhat.com>
 <ZFE0iFnbr2ey0A7X@redhat.com> <20230502200645.GE535070@fedora>
 <ZFIWjuST/9tHVNMG@redhat.com> <20230503131125.GB757667@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3jXylBdepGNQTKaY"
Content-Disposition: inline
In-Reply-To: <20230503131125.GB757667@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--3jXylBdepGNQTKaY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 03.05.2023 um 15:11 hat Stefan Hajnoczi geschrieben:
> On Wed, May 03, 2023 at 10:08:46AM +0200, Kevin Wolf wrote:
> > Am 02.05.2023 um 22:06 hat Stefan Hajnoczi geschrieben:
> > > On Tue, May 02, 2023 at 06:04:24PM +0200, Kevin Wolf wrote:
> > > > Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > > > > vhost-user activity must be suspended during bdrv_drained_begin/e=
nd().
> > > > > This prevents new requests from interfering with whatever is happ=
ening
> > > > > in the drained section.
> > > > >=20
> > > > > Previously this was done using aio_set_fd_handler()'s is_external
> > > > > argument. In a multi-queue block layer world the aio_disable_exte=
rnal()
> > > > > API cannot be used since multiple AioContext may be processing I/=
O, not
> > > > > just one.
> > > > >=20
> > > > > Switch to BlockDevOps->drained_begin/end() callbacks.
> > > > >=20
> > > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > ---
> > > > >  block/export/vhost-user-blk-server.c | 43 ++++++++++++++--------=
------
> > > > >  util/vhost-user-server.c             | 10 +++----
> > > > >  2 files changed, 26 insertions(+), 27 deletions(-)
> > > > >=20
> > > > > diff --git a/block/export/vhost-user-blk-server.c b/block/export/=
vhost-user-blk-server.c
> > > > > index 092b86aae4..d20f69cd74 100644
> > > > > --- a/block/export/vhost-user-blk-server.c
> > > > > +++ b/block/export/vhost-user-blk-server.c
> > > > > @@ -208,22 +208,6 @@ static const VuDevIface vu_blk_iface =3D {
> > > > >      .process_msg           =3D vu_blk_process_msg,
> > > > >  };
> > > > > =20
> > > > > -static void blk_aio_attached(AioContext *ctx, void *opaque)
> > > > > -{
> > > > > -    VuBlkExport *vexp =3D opaque;
> > > > > -
> > > > > -    vexp->export.ctx =3D ctx;
> > > > > -    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
> > > > > -}
> > > > > -
> > > > > -static void blk_aio_detach(void *opaque)
> > > > > -{
> > > > > -    VuBlkExport *vexp =3D opaque;
> > > > > -
> > > > > -    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > > > > -    vexp->export.ctx =3D NULL;
> > > > > -}
> > > >=20
> > > > So for changing the AioContext, we now rely on the fact that the no=
de to
> > > > be changed is always drained, so the drain callbacks implicitly cov=
er
> > > > this case, too?
> > >=20
> > > Yes.
> >=20
> > Ok. This surprised me a bit at first, but I think it's fine.
> >=20
> > We just need to remember it if we ever decide that once we have
> > multiqueue, we can actually change the default AioContext without
> > draining the node. But maybe at that point, we have to do more
> > fundamental changes anyway.
> >=20
> > > > >  static void
> > > > >  vu_blk_initialize_config(BlockDriverState *bs,
> > > > >                           struct virtio_blk_config *config,
> > > > > @@ -272,6 +256,25 @@ static void vu_blk_exp_resize(void *opaque)
> > > > >      vu_config_change_msg(&vexp->vu_server.vu_dev);
> > > > >  }
> > > > > =20
> > > > > +/* Called with vexp->export.ctx acquired */
> > > > > +static void vu_blk_drained_begin(void *opaque)
> > > > > +{
> > > > > +    VuBlkExport *vexp =3D opaque;
> > > > > +
> > > > > +    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > > > > +}
> > > >=20
> > > > Compared to the old code, we're losing the vexp->export.ctx =3D NUL=
L. This
> > > > is correct at this point because after drained_begin we still keep
> > > > processing requests until we arrive at a quiescent state.
> > > >=20
> > > > However, if we detach the AioContext because we're deleting the
> > > > iothread, won't we end up with a dangling pointer in vexp->export.c=
tx?
> > > > Or can we be certain that nothing interesting happens before draine=
d_end
> > > > updates it with a new valid pointer again?
> > >=20
> > > If you want I can add the detach() callback back again and set ctx to
> > > NULL there?
> >=20
> > I haven't thought enough about it to say if it's a problem. If you have
> > and are confident that it's correct the way it is, I'm happy with it.
> >
> > But bringing the callback back is the minimal change compared to the old
> > state. It's just unnecessary code if we don't actually need it.
>=20
> The reasoning behind my patch is that detach() sets NULL today and we
> would see crashes if ctx was accessed between detach() -> attach().
> Therefore, I'm assuming there are no ctx accesses in the code today and
> removing the ctx =3D NULL assignment doesn't break anything.

Sometimes ctx =3D NULL defaults to qemu_get_aio_context(), so in theory
there could be cases where NULL works, but a dangling pointer wouldn't.

> However, my approach is not very defensive. If the code is changed in
> a way that accesses ctx when it's not supposed to, then a dangling
> pointer will be accessed.
>=20
> I think leaving the detach() callback there can be justified because it
> will make it easier to detect bugs in the future. I'll add it back in
> the next revision.

Ok, sounds good me.

Kevin

--3jXylBdepGNQTKaY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmRSZOgACgkQfwmycsiP
L9Z4eQ/+LgU+OhaX4MhIHoKVbBeqTOHQYSWlDg/eh/I3pVF0g/HToZc1vLm0azxU
NhSqg87kLo3DRKFUh25e5370t219xFbDW4rz4RVy0OJLklLfj7qi59XOxE0MLiVI
5ySbG1FxdFTNS9dAoYmPuxrucX+RPEpwHw1gIpmIx+GqLGuYhrjvjqOeB/Nx7tm6
dAUmxB4Vt16wsTPs92zA09I8KtiWqr+fm+P2u/jfdsC1HqtWL93uiyQoon7LoCqO
c3VwmyR+aFr5AUmlIkS0dxzd9Bbnixd0jnHUEdaowCVLmAYbKvDJkl5HTjYEyF+D
p7Lm7GRdQPaJgu4GyKtj8NWwfra2VXEDW0M+VhWEYCLMrka00wXGO1bxjUZzEpP5
8F25eFcpNb2rixwMHlEU3UQJxNS+wtODzmkjIcj4N8F0aM7eNZDuUIDnwGMQirid
9VubITTJZtDtnp+AOO2B3zMhuAqi7EslMXOYHb5NZ9Yi31otsYE5BKScKxaCy5jq
w1h+o7sNoyW+48yvjUhxkH1bU/CHbhv9VLQ1QTHgy+uR5lADMjEba7XHBQnclHs2
rzyA9WgwuQcdq4pbUCH/hFMpoPCSNdL/Dw7riadrx7hoJB+GRr7AYfR9NEk6NtAd
uBfxOOO5MBpngMUdiDQdlDHmigg2QSJMyFacVTs/NVGFuAO1B6c=
=+t1f
-----END PGP SIGNATURE-----

--3jXylBdepGNQTKaY--


