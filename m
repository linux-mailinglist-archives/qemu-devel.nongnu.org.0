Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC63989F7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:46:21 +0200 (CEST)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQGK-00076S-Ps
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1loQEy-0005gX-IF
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1loQEw-0003T5-5h
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622637892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JRLTCcGZv1juiFgxVkIsRt0B1UnpirCaa06gS+M76EQ=;
 b=NiicQkVXhnUDXvt/KKlVBwYfC7/UlfMnIbGDuUB//iYFumMZEI+AhYHQTBSZBHTJyyCWd0
 RJenF1NXsWIhytXcDf/g44zZxWQlDjTSnHu23hS/deriAF5F2dnpuC4bvTU9P9B4wFHhWF
 WC+I5RE6q9iJr9DJFSaxlzVNQYQqNvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-AUC9M1t_OL6enex7RDrZpQ-1; Wed, 02 Jun 2021 08:44:51 -0400
X-MC-Unique: AUC9M1t_OL6enex7RDrZpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C06A6D5B5;
 Wed,  2 Jun 2021 12:44:31 +0000 (UTC)
Received: from localhost (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3821E5C230;
 Wed,  2 Jun 2021 12:44:31 +0000 (UTC)
Date: Wed, 2 Jun 2021 14:44:30 +0200
From: Sergio Lopez <slp@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 2/2] nbd/server: Use drained block ops to quiesce the
 server
Message-ID: <20210602124430.7v6jbeydyie4as26@mhamilton>
References: <20210602060552.17433-1-slp@redhat.com>
 <20210602060552.17433-3-slp@redhat.com>
 <631d21ed-52e7-9d9c-4692-ca3212fdbdd9@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <631d21ed-52e7-9d9c-4692-ca3212fdbdd9@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4z6tbjuoxg72xgge"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4z6tbjuoxg72xgge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 03:06:02PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> 02.06.2021 09:05, Sergio Lopez wrote:
> > Before switching between AioContexts we need to make sure that we're
> > fully quiesced ("nb_requests =3D=3D 0" for every client) when entering =
the
> > drained section.
> >=20
> > To do this, we set "quiescing =3D true" for every client on
> > ".drained_begin" to prevent new coroutines from being created, and
> > check if "nb_requests =3D=3D 0" on ".drained_poll". Finally, once we're
> > exiting the drained section, on ".drained_end" we set "quiescing =3D
> > false" and call "nbd_client_receive_next_request()" to resume the
> > processing of new requests.
> >=20
> > With these changes, "blk_aio_attach()" and "blk_aio_detach()" can be
> > reverted to be as simple as they were before f148ae7d36.
> >=20
> > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1960137
> > Suggested-by: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > ---
> >   nbd/server.c | 82 ++++++++++++++++++++++++++++++++++++++-------------=
-
> >   1 file changed, 61 insertions(+), 21 deletions(-)
> >=20
> > diff --git a/nbd/server.c b/nbd/server.c
> > index 86a44a9b41..b60ebc3ab6 100644
> > --- a/nbd/server.c
> > +++ b/nbd/server.c
> > @@ -1513,6 +1513,11 @@ static void nbd_request_put(NBDRequestData *req)
> >       g_free(req);
> >       client->nb_requests--;
> > +
> > +    if (client->quiescing && client->nb_requests =3D=3D 0) {
> > +        aio_wait_kick();
> > +    }
> > +
> >       nbd_client_receive_next_request(client);
> >       nbd_client_put(client);
> > @@ -1530,49 +1535,68 @@ static void blk_aio_attached(AioContext *ctx, v=
oid *opaque)
> >       QTAILQ_FOREACH(client, &exp->clients, next) {
> >           qio_channel_attach_aio_context(client->ioc, ctx);
> > +        assert(client->nb_requests =3D=3D 0);
> >           assert(client->recv_coroutine =3D=3D NULL);
> >           assert(client->send_coroutine =3D=3D NULL);
> > -
> > -        if (client->quiescing) {
> > -            client->quiescing =3D false;
> > -            nbd_client_receive_next_request(client);
> > -        }
> >       }
> >   }
> > -static void nbd_aio_detach_bh(void *opaque)
> > +static void blk_aio_detach(void *opaque)
> >   {
> >       NBDExport *exp =3D opaque;
> >       NBDClient *client;
> > +    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
> > +
> >       QTAILQ_FOREACH(client, &exp->clients, next) {
> >           qio_channel_detach_aio_context(client->ioc);
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
> >           client->quiescing =3D true;
> > +    }
> > +}
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
> > -        if (client->send_coroutine) {
> > -            AIO_WAIT_WHILE(exp->common.ctx, client->send_coroutine !=
=3D NULL);
> > -        }
> > +    QTAILQ_FOREACH(client, &exp->clients, next) {
> > +        client->quiescing =3D false;
> > +        nbd_client_receive_next_request(client);
> >       }
> >   }
> > -static void blk_aio_detach(void *opaque)
> > +static bool nbd_drained_poll(void *opaque)
> >   {
> >       NBDExport *exp =3D opaque;
> > +    NBDClient *client;
> > -    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
> > +    QTAILQ_FOREACH(client, &exp->clients, next) {
> > +        if (client->nb_requests !=3D 0) {
> > +            /*
> > +             * If there's a coroutine waiting for a request on nbd_rea=
d_eof()
> > +             * enter it here so we don't depend on the client to wake =
it up.
> > +             */
> > +            if (client->recv_coroutine !=3D NULL && client->read_yield=
ing) {
> > +                qemu_aio_coroutine_enter(exp->common.ctx,
> > +                                         client->recv_coroutine);
> > +            }
> > -    aio_wait_bh_oneshot(exp->common.ctx, nbd_aio_detach_bh, exp);
> > +            return true;
> > +        }
> > +    }
> > -    exp->common.ctx =3D NULL;
> > +    return false;
> >   }
> >   static void nbd_eject_notifier(Notifier *n, void *data)
> > @@ -1594,6 +1618,12 @@ void nbd_export_set_on_eject_blk(BlockExport *ex=
p, BlockBackend *blk)
> >       blk_add_remove_bs_notifier(blk, &nbd_exp->eject_notifier);
> >   }
> > +static const BlockDevOps nbd_block_ops =3D {
> > +    .drained_begin =3D nbd_drained_begin,
> > +    .drained_end =3D nbd_drained_end,
> > +    .drained_poll =3D nbd_drained_poll,
> > +};
> > +
> >   static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions=
 *exp_args,
> >                                Error **errp)
> >   {
> > @@ -1715,8 +1745,17 @@ static int nbd_export_create(BlockExport *blk_ex=
p, BlockExportOptions *exp_args,
> >       exp->allocation_depth =3D arg->allocation_depth;
> > +    /*
> > +     * We need to inhibit request queuing in the block layer to ensure=
 we can
> > +     * be properly quiesced when entering a drained section, as our co=
routines
> > +     * servicing pending requests might enter blk_pread().
> > +     */
>=20
> Not very understandable to me :(. What's bad in queuing requests at blk l=
ayer during drained section?

We need to make sure that all coroutines in the NBD server have
finished (client->nb_requests =3D=3D 0) before detaching from the
AioContext. If we don't inhibit request queuing, some coroutines may
get stuck in blk_pread()->...->blk_wait_while_drained(), causing
nbd_drained_poll() to always return that we're busy.

> > +    blk_set_disable_request_queuing(blk, true);
> > +
> >       blk_add_aio_context_notifier(blk, blk_aio_attached, blk_aio_detac=
h, exp);
> > +    blk_set_dev_ops(blk, &nbd_block_ops, exp);
> > +
> >       QTAILQ_INSERT_TAIL(&exports, exp, next);
> >       return 0;
> > @@ -1788,6 +1827,7 @@ static void nbd_export_delete(BlockExport *blk_ex=
p)
> >           }
> >           blk_remove_aio_context_notifier(exp->common.blk, blk_aio_atta=
ched,
> >                                           blk_aio_detach, exp);
> > +        blk_set_disable_request_queuing(exp->common.blk, false);
> >       }
> >       for (i =3D 0; i < exp->nr_export_bitmaps; i++) {
> >=20
>=20
> I don't follow the whole logic of clients quiescing, but overall looks go=
od to me. As I understand, prior to patch we have a kind of drain_begin rea=
lization in blk_aio_detach handler, and after patch we instead utilize gene=
ric code of drained sections with help of appropriate devops handlers.

Doing that in blk_aio_detach() was a bit too late since we were
already in the drained section, and as stated above, we need it alive
to ensure that all of the NBD server coroutines finish properly.

Also, .drained_poll allows us to align quiescing the NBD server with
the block layer.

Thanks,
Sergio.

> weak:
>=20
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>=20
>=20
> --=20
> Best regards,
> Vladimir
>=20

--4z6tbjuoxg72xgge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmC3fS0ACgkQ9GknjS8M
AjWX6BAAmlXtInjJsFqB8GlPkOawFi6H/YSRfTaM9F5B4ApkA+3kvnHmfR4sIVl1
fq9hHYbE5oLr7Q4W9OnHiM5gR8yWjirDSkHpR5DKZxpAUa8h/XqrNvuZy65U9Kvh
WY8tTZJHcZiTHLQfZrbguw005AW1bHFd0daDOZDyNGElhgZrr3n/muGSm/G+E27o
UX15/yc18BnWy+74ZVn0MgKS1hMr3InnCIuB50mnljUCj58hYrnc32ji+SUv8eqr
i/NZk92gvKKvgmC/2V744KiaP8Zm0y39rBM0lxacW/7dBVoJVuFBuSciqKzynLEx
ZdrjBHl7LuBqw4oPPOyfEkVRZhGWU+drK8c63xspIjIctTCMTxA4T7zhlzDvmG/r
GnOIpmDW5UhdbjXbHz34hfZT+nws1iO/VRWohEJ6KauwA6XuKErXyxCyOCkrOiEB
ixFPfNCzXO7Zlg+6IIEREPPpbYCIF1DAEOjfVQBI9rIxz+FISaEMZbdC4MP3eWxZ
psm6GBOUm72syl2CcXhCAITUVbl6A/uaokmz6t6iJHrP1KJZskgrcc+3pDrwsin6
YbVU90C1TBgI0wkXGLzNzYUDSqRYN4mmR2BpY64UOAnB6ruotevAwWwOWElnd2he
/FY2naBYwFF7XxNwxNSc5mcclAGVQWJRGQ30lZtbi6pl4qhoGYM=
=mbUv
-----END PGP SIGNATURE-----

--4z6tbjuoxg72xgge--


