Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E122D4832
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:44:51 +0100 (CET)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3WE-0004ts-5D
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kn3K1-0002ME-Ti
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:32:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kn3Jz-0003mP-Be
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607535130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYlyVIaYJOe//nUkqym3NkSR7BHltei9b6PTfv4jVh0=;
 b=VSEY/QtvxOKi8vi3t90ivlG8H87vUNMDPbJNGCT/R79/1i27qfzwvjkQ4C9+IzL/c9axiH
 uRqr74ueW4cjepzKwdJjD5+ZmJEfWuVlnUcTARsFrowHm95ghIM/4sAv7F3WEPHF6UMTVu
 Ce5l0IIyhi76o8kCPiumXBcjEBDiNc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-LFYJ9znUMpGgCi2R7KijBQ-1; Wed, 09 Dec 2020 12:32:05 -0500
X-MC-Unique: LFYJ9znUMpGgCi2R7KijBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6D73803621;
 Wed,  9 Dec 2020 17:32:03 +0000 (UTC)
Received: from localhost (ovpn-115-46.rdu2.redhat.com [10.10.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B03B60BF1;
 Wed,  9 Dec 2020 17:32:00 +0000 (UTC)
Date: Wed, 9 Dec 2020 18:31:59 +0100
From: Sergio Lopez <slp@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/2] nbd/server: Quiesce coroutines on context switch
Message-ID: <20201209173159.jv6vf45syk267vev@mhamilton>
References: <20201204165347.73542-1-slp@redhat.com>
 <20201204165347.73542-3-slp@redhat.com>
 <2a1a0d48-5c0c-fa6a-a648-c65fc8140156@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2a1a0d48-5c0c-fa6a-a648-c65fc8140156@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ap3nbhi5y5m6eem6"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ap3nbhi5y5m6eem6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 12:39:07PM -0600, Eric Blake wrote:
> On 12/4/20 10:53 AM, Sergio Lopez wrote:
> > When switching between AIO contexts we need to me make sure that both
> > recv_coroutine and send_coroutine are not scheduled to run. Otherwise,
> > QEMU may crash while attaching the new context with an error like
> > this one:
> >=20
> > aio_co_schedule: Co-routine was already scheduled in 'aio_co_schedule'
> >=20
> > To achieve this we need a local implementation of
> > 'qio_channel_readv_all_eof' named 'nbd_read_eof' (a trick already done
> > by 'nbd/client.c') that allows us to interrupt the operation and to
> > know when recv_coroutine is yielding.
> >=20
> > With this in place, we delegate detaching the AIO context to the
> > owning context with a BH ('nbd_aio_detach_bh') scheduled using
> > 'aio_wait_bh_oneshot'. This BH signals that we need to quiesce the
> > channel by setting 'client->quiescing' to 'true', and either waits for
> > the coroutine to finish using AIO_WAIT_WHILE or, if it's yielding in
> > 'nbd_read_eof', actively enters the coroutine to interrupt it.
> >=20
> > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1900326
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > ---
> >  nbd/server.c | 120 +++++++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 106 insertions(+), 14 deletions(-)
>=20
> A complex patch, so I'd appreciate a second set of eyes.
>=20
> >=20
> > diff --git a/nbd/server.c b/nbd/server.c
> > index 613ed2634a..7229f487d2 100644
> > --- a/nbd/server.c
> > +++ b/nbd/server.c
> > @@ -132,6 +132,9 @@ struct NBDClient {
> >      CoMutex send_lock;
> >      Coroutine *send_coroutine;
> > =20
> > +    bool read_yielding;
> > +    bool quiescing;
>=20
> Will either of these fields need to be accessed atomically once the
> 'yank' code is added, or are we still safe with direct access because
> coroutines are not multithreaded?

Yes, those are only accessed from coroutines, which will be scheduled
on the same thread.

> > +
> >      QTAILQ_ENTRY(NBDClient) next;
> >      int nb_requests;
> >      bool closing;
> > @@ -1352,14 +1355,60 @@ static coroutine_fn int nbd_negotiate(NBDClient=
 *client, Error **errp)
> >      return 0;
> >  }
> > =20
> > -static int nbd_receive_request(QIOChannel *ioc, NBDRequest *request,
> > +/* nbd_read_eof
> > + * Tries to read @size bytes from @ioc. This is a local implementation=
 of
> > + * qio_channel_readv_all_eof. We have it here because we need it to be
> > + * interruptible and to know when the coroutine is yielding.
> > + * Returns 1 on success
> > + *         0 on eof, when no data was read (errp is not set)
> > + *         negative errno on failure (errp is set)
> > + */
> > +static inline int coroutine_fn
> > +nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **err=
p)
> > +{
> > +    bool partial =3D false;
> > +
> > +    assert(size);
> > +    while (size > 0) {
> > +        struct iovec iov =3D { .iov_base =3D buffer, .iov_len =3D size=
 };
> > +        ssize_t len;
> > +
> > +        len =3D qio_channel_readv(client->ioc, &iov, 1, errp);
> > +        if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {
> > +            client->read_yielding =3D true;
> > +            qio_channel_yield(client->ioc, G_IO_IN);
> > +            client->read_yielding =3D false;
>=20
> nbd/client.c:nbd_read_eof() uses bdrv_dec/inc_in_flight instead of
> read_yielding...
>=20
> > +            if (client->quiescing) {
> > +                return -EAGAIN;
> > +            }
>=20
> and the quiescing check is new; otherwise, these two functions look
> identical.  Having two static functions with the same name makes gdb a
> bit more annoying (which one of the two did you want your breakpoint
> on?).  Is there any way we could write this code only once in
> nbd/common.c for reuse by both client and server?  But I can live with
> it as written.

I'm not happy with this either, but on the first implementation I've
tried to come up with a unique function for both use cases, and it
looked terrible.

We can easily use a different name, though.

> > @@ -2151,20 +2223,23 @@ static int nbd_co_send_bitmap(NBDClient *client=
, uint64_t handle,
> > =20
> >  /* nbd_co_receive_request
> >   * Collect a client request. Return 0 if request looks valid, -EIO to =
drop
> > - * connection right away, and any other negative value to report an er=
ror to
> > - * the client (although the caller may still need to disconnect after =
reporting
> > - * the error).
> > + * connection right away, -EAGAIN to indicate we were interrupted and =
the
> > + * channel should be quiesced, and any other negative value to report =
an error
> > + * to the client (although the caller may still need to disconnect aft=
er
> > + * reporting the error).
> >   */
> >  static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *req=
uest,
> >                                    Error **errp)
> >  {
> >      NBDClient *client =3D req->client;
> >      int valid_flags;
> > +    int ret;
> > =20
> >      g_assert(qemu_in_coroutine());
> >      assert(client->recv_coroutine =3D=3D qemu_coroutine_self());
> > -    if (nbd_receive_request(client->ioc, request, errp) < 0) {
> > -        return -EIO;
> > +    ret =3D nbd_receive_request(client, request, errp);
> > +    if (ret < 0) {
> > +        return  ret;
>=20
> Why the double space?

Ouch, copy/paste mistake.

> The old code slams to EIO, you preserve errors.  Is that going to bite
> us by causing us to see a different errno leaked through?

When reading from the channel, nbd_read_eof hides the actual errno
behind EIO, so the only actual difference is that, with this change,
nbd_receive_request may send this error...

    if (magic !=3D NBD_REQUEST_MAGIC) {
        error_setg(errp, "invalid magic (got 0x%" PRIx32 ")", magic);
        return -EINVAL;
    }

... to the client (via server.c:2624), which I think is the right
thing to do.

> >      }
> > =20
> >      trace_nbd_co_receive_request_decode_type(request->handle, request-=
>type,
> > @@ -2507,6 +2582,17 @@ static coroutine_fn void nbd_trip(void *opaque)
> >          return;
> >      }
> > =20
> > +    if (client->quiescing) {
> > +        /*
> > +         * We're switching between AIO contexts. Don't attempt to rece=
ive a new
> > +         * request and kick the main context which may be waiting for =
us.
>=20
> s/request/request,/

Thanks, will fix this comment.

> > +         */
> > +        nbd_client_put(client);
> > +        client->recv_coroutine =3D NULL;
> > +        aio_wait_kick();
> > +        return;
> > +    }
> > +
> >      req =3D nbd_request_get(client);
> >      ret =3D nbd_co_receive_request(req, &request, &local_err);
> >      client->recv_coroutine =3D NULL;
> > @@ -2519,6 +2605,11 @@ static coroutine_fn void nbd_trip(void *opaque)
> >          goto done;
> >      }
> > =20
> > +    if (ret =3D=3D -EAGAIN) {
> > +        assert(client->quiescing);
> > +        goto done;
> > +    }
> > +
> >      nbd_client_receive_next_request(client);
> >      if (ret =3D=3D -EIO) {
> >          goto disconnect;
> > @@ -2565,7 +2656,8 @@ disconnect:
> > =20
> >  static void nbd_client_receive_next_request(NBDClient *client)
> >  {
> > -    if (!client->recv_coroutine && client->nb_requests < MAX_NBD_REQUE=
STS) {
> > +    if (!client->recv_coroutine && client->nb_requests < MAX_NBD_REQUE=
STS &&
> > +        !client->quiescing) {
> >          nbd_client_get(client);
> >          client->recv_coroutine =3D qemu_coroutine_create(nbd_trip, cli=
ent);
> >          aio_co_schedule(client->exp->common.ctx, client->recv_coroutin=
e);
> >=20
>=20
> Overall looks okay to me,
> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
> --=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>=20

--ap3nbhi5y5m6eem6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/RCg4ACgkQ9GknjS8M
AjXP5RAAt9p1zmg0yhfqq4WUCB+ngA60Vizhfb89YuAHpjHlXLRCJ5GU0hyKNIhp
sRykwQP6lMXUHchNc7TNwn5nMCqoCaURbTinesxrAcv6DoqPxDozMnEKJd/x0DgU
RLDpYD0aGiqy8dsU+92+tbR5Ro9rU+Hc2LpVTzywtoVBFrIGUe2vcJhtXhBoMdlx
EztQtb2Fg/lT+s3r8BiihnsNll09wyL2iUAu1k2zIDe4EUb7OOcJBbF0P+HcFn+r
/qbBitL0o3GDCdW9jXhhWkLhpVshxRqGsUu5MWMKDqPtkMJnISBxY0APrk8r10ek
nTBZ38e1GcZCyd304N3MGwzaN09xeTEREvV/14wm33rpxq+7ZfV/JZisZih/vv+V
p4FQ/Qlyw+s5SCCWbu1gY2OYgRuGy1iexBwl/o9CyksordMt3F4DphzRd1Pwc8Kc
QobRPTQqmBXV2/bu/jlwnXfVm3tSztREhLuTVOVKHPwhUvgLBKmGs2OR4MyMDmqZ
cqe5wIJ5D0pbDRAvbO9sBvfFODdBeOtvActbMYj3hhXOAOBNO0BrObr/QA0e+BnM
LmrJGGvnDBlJYwYZmddPW7tU+CCvP58MAqKbjGzn7rl7emtAde/Io0srFk+Wx5I5
tWxDYdco+d/XUHApIoWjnjzMPnDDdckhy+8NRpdG7hET/coTkvY=
=kyW8
-----END PGP SIGNATURE-----

--ap3nbhi5y5m6eem6--


