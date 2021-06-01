Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D380D39781E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:33:12 +0200 (CEST)
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7KJ-0007ks-Fd
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lo7Iu-0005bm-Ej
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lo7Is-0005Kc-6o
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622565101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7NfC2exaQIBSL441VhQr4NvZhLf+7hNaUuapAbg5Qv4=;
 b=LKXWPhWkCTCnQQ8xxSu+rRDbTvzCGr18JZEyeKhsGqiI7GGpp2KrCqqwOLa04ghLoeHFpk
 HuPQfCid70IHIswffm5i8LnYartAlmeT0gWV0SfDdxTJ29tnVbH6y9zQr4tWK/K6lHHJd3
 Qy8skRlWj+M3LaD0MD3TjM6LiYK4faU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-uD--BmKcNqekfDraA4lC8A-1; Tue, 01 Jun 2021 12:31:39 -0400
X-MC-Unique: uD--BmKcNqekfDraA4lC8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E48508143E5;
 Tue,  1 Jun 2021 16:31:30 +0000 (UTC)
Received: from localhost (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 421A260CCE;
 Tue,  1 Jun 2021 16:31:30 +0000 (UTC)
Date: Tue, 1 Jun 2021 18:31:29 +0200
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/2] nbd/server: Use drained block ops to quiesce the
 server
Message-ID: <20210601163129.wcx5li7lkdvxrxgi@mhamilton>
References: <20210601055728.90849-1-slp@redhat.com>
 <20210601055728.90849-3-slp@redhat.com>
 <YLZbibzZFibabhm/@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YLZbibzZFibabhm/@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sbnuz4gbuue4tqut"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--sbnuz4gbuue4tqut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 06:08:41PM +0200, Kevin Wolf wrote:
> Am 01.06.2021 um 07:57 hat Sergio Lopez geschrieben:
> > Before switching between AioContexts we need to make sure that we're
> > fully quiesced ("nb_requests =3D=3D 0" for every client) when entering =
the
> > drained section.
> >=20
> > To do this, we set "quiescing =3D true" for every client on
> > ".drained_begin" to prevent new coroutines to be created, and check if
> > "nb_requests =3D=3D 0" on ".drained_poll". Finally, once we're exiting =
the
> > drained section, on ".drained_end" we set "quiescing =3D false" and
> > call "nbd_client_receive_next_request()" to resume the processing of
> > new requests.
> >=20
> > With these changes, "blk_aio_attach()" and "blk_aio_detach()" can be
> > reverted to be as simple as they were before f148ae7d36.
> >=20
> > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1960137
> > Suggested-by: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > ---
> >  nbd/server.c | 99 +++++++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 75 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/nbd/server.c b/nbd/server.c
> > index 86a44a9b41..33e55479d7 100644
> > --- a/nbd/server.c
> > +++ b/nbd/server.c
> > @@ -132,7 +132,7 @@ struct NBDClient {
> >      CoMutex send_lock;
> >      Coroutine *send_coroutine;
> > =20
> > -    bool read_yielding;
> > +    GSList *yield_co_list; /* List of coroutines yielding on nbd_read_=
eof */
> >      bool quiescing;
>=20
> Hm, how do you get more than one coroutine per client yielding in
> nbd_read_eof() at the same time? I thought the model is that you always
> have one coroutine reading the next request (which is
> client->recv_coroutine) and all the others are just processing the
> request they had read earlier. Multiple coroutines reading from the
> same socket would sound like a bad idea.

You're right, there's only a single coroutine yielding on
nbd_read_eof(). I've added the list while at a moment I was trying to
keep track of every coroutine, and I kept it without thinking if it
was really needed.

I'll drop it, entering just client->recv_coroutine is it isn't NULL.

> >      QTAILQ_ENTRY(NBDClient) next;
> > @@ -1367,6 +1367,7 @@ static inline int coroutine_fn
> >  nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **err=
p)
> >  {
> >      bool partial =3D false;
> > +    Coroutine *co;
> > =20
> >      assert(size);
> >      while (size > 0) {
> > @@ -1375,9 +1376,12 @@ nbd_read_eof(NBDClient *client, void *buffer, si=
ze_t size, Error **errp)
> > =20
> >          len =3D qio_channel_readv(client->ioc, &iov, 1, errp);
> >          if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {
> > -            client->read_yielding =3D true;
> > +            co =3D qemu_coroutine_self();
> > +
> > +            client->yield_co_list =3D g_slist_prepend(client->yield_co=
_list, co);
> >              qio_channel_yield(client->ioc, G_IO_IN);
> > -            client->read_yielding =3D false;
> > +            client->yield_co_list =3D g_slist_remove(client->yield_co_=
list, co);
> > +
> >              if (client->quiescing) {
> >                  return -EAGAIN;
> >              }
> > @@ -1513,6 +1517,11 @@ static void nbd_request_put(NBDRequestData *req)
> >      g_free(req);
> > =20
> >      client->nb_requests--;
> > +
> > +    if (client->quiescing && client->nb_requests =3D=3D 0) {
> > +        aio_wait_kick();
> > +    }
> > +
> >      nbd_client_receive_next_request(client);
> > =20
> >      nbd_client_put(client);
> > @@ -1530,49 +1539,75 @@ static void blk_aio_attached(AioContext *ctx, v=
oid *opaque)
> >      QTAILQ_FOREACH(client, &exp->clients, next) {
> >          qio_channel_attach_aio_context(client->ioc, ctx);
> > =20
> > +        assert(client->nb_requests =3D=3D 0);
> >          assert(client->recv_coroutine =3D=3D NULL);
> >          assert(client->send_coroutine =3D=3D NULL);
> > -
> > -        if (client->quiescing) {
> > -            client->quiescing =3D false;
> > -            nbd_client_receive_next_request(client);
> > -        }
> >      }
> >  }
> > =20
> > -static void nbd_aio_detach_bh(void *opaque)
> > +static void blk_aio_detach(void *opaque)
> >  {
> >      NBDExport *exp =3D opaque;
> >      NBDClient *client;
> > =20
> > +    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
> > +
> >      QTAILQ_FOREACH(client, &exp->clients, next) {
> >          qio_channel_detach_aio_context(client->ioc);
> > +    }
> > +
> > +    exp->common.ctx =3D NULL;
> > +}
> > +
> > +static void nbd_drained_begin(void *opaque)
> > +{
> > +    NBDExport *exp =3D opaque;
> > +    NBDClient *client;
> > +
> > +    QTAILQ_FOREACH(client, &exp->clients, next) {
> >          client->quiescing =3D true;
> > +    }
> > +}
> > =20
> > -        if (client->recv_coroutine) {
> > -            if (client->read_yielding) {
> > -                qemu_aio_coroutine_enter(exp->common.ctx,
> > -                                         client->recv_coroutine);
> > -            } else {
> > -                AIO_WAIT_WHILE(exp->common.ctx, client->recv_coroutine=
 !=3D NULL);
> > -            }
> > -        }
> > +static void nbd_drained_end(void *opaque)
> > +{
> > +    NBDExport *exp =3D opaque;
> > +    NBDClient *client;
> > =20
> > -        if (client->send_coroutine) {
> > -            AIO_WAIT_WHILE(exp->common.ctx, client->send_coroutine !=
=3D NULL);
> > -        }
> > +    QTAILQ_FOREACH(client, &exp->clients, next) {
> > +        client->quiescing =3D false;
> > +        nbd_client_receive_next_request(client);
> >      }
> >  }
> > =20
> > -static void blk_aio_detach(void *opaque)
> > +static bool nbd_drained_poll(void *opaque)
> >  {
> >      NBDExport *exp =3D opaque;
> > +    NBDClient *client;
> > +    Coroutine *co;
> > +    GSList *entry;
> > +    GSList *coroutine_list;
> > =20
> > -    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
> > +    QTAILQ_FOREACH(client, &exp->clients, next) {
> > +        if (client->nb_requests !=3D 0) {
> > +            /*
> > +             * Enter coroutines waiting for new requests on nbd_read_e=
of(), so
> > +             * we don't depend on the client to wake us up.
> > +             */
> > +            coroutine_list =3D g_slist_copy(client->yield_co_list);
> > +            for (entry =3D coroutine_list;
> > +                 entry !=3D NULL;
> > +                 entry =3D g_slist_next(entry)) {
> > +                co =3D entry->data;
> > +                qemu_aio_coroutine_enter(exp->common.ctx, co);
> > +            }
> > +            g_slist_free(coroutine_list);
> > =20
> > -    aio_wait_bh_oneshot(exp->common.ctx, nbd_aio_detach_bh, exp);
> > +            return 1;
>=20
> This would be more accurately spelt true...
>=20
> > +        }
> > +    }
> > =20
> > -    exp->common.ctx =3D NULL;
> > +    return 0;
>=20
> ...and this false.

I'll change this in v2.

Thanks,
Sergio.

> >  }
> > =20
> >  static void nbd_eject_notifier(Notifier *n, void *data)
>=20
> The patch looks correct to me, though I'm not sure if yield_co_list is
> an unnecessary complication (and if it isn't, whether that's safe).
>=20
> I would be happy enough to apply it anyway if you can explain the
> yield_co_list thing, but I'll give Eric some time to have a look, too.
>=20
> Kevin
>=20

--sbnuz4gbuue4tqut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmC2YN4ACgkQ9GknjS8M
AjWNzA/7Bsy43NC1TZQK0fvO4f/ApwH656QsNhOH1iXphNyjXrxYJit+1nMjLJcE
bEp+SZppcRCtLvIhmKZfZznEJnvWkilNvzSF1nMH4LHpgPw6mxpBpWjBml0k4EAa
npn2XN8n1jUB3i3hqF/c8koTpYL2YIxapRdW2C3wlNMTErk7ACnyhymurepxaFF7
4y5pxdAgJksWRs3fD3DAgQ5xAneXopze4H4AE776KNT7o60BXhWRQob2RyQe+9G0
GtGbN6HRH7mdZIjEqndAy8WwllCTfHIW/P7+p3xTwAhD5YOYuE8oIKwPBs5czb43
3SkXPtmlxoFeGeJFY5ou0BXd7i41VOLDeNqmwD8xEpxB6XKJ+NMAGCumprNXxUCl
OCSeC07aodoRg4OZiS+7coQ6maaGisaR/1vjbfEyhznaCFg0vUcRUpFhREYoIBEL
uQdxu9jb83gxK8LsVntHxK24XtTsTbhI7OPa5Ywco9vXLfmbVIXJm0vzRoPHUtIw
dIEN9NFSaddgZnAhHDtdCb2FA3dE3bJ97uyCfvZadmdnzoDLvAU4lqh0USHVNwHu
uac7nfd5KembZc4m/HVtSK+kVtnlL3n7H5tWAtv4cMcXLXXBPpBf4bPMzysxcaUP
YulV/UvzLBOxCHKl6XVpVgeQoSZW0f5WGE8JmkGlzzOP99oWyic=
=7Nu6
-----END PGP SIGNATURE-----

--sbnuz4gbuue4tqut--


