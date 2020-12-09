Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AFA2D481D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:41:43 +0100 (CET)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3TC-0000mU-4S
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kn3Hv-0000r0-Tp
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:30:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kn3Hp-0002rs-6C
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607534994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ZcH9qazmuM9xeD6upGHXUZvGOVaLXM+/o8TpesgAxo=;
 b=K8VQmpYF+6q9/8w2sA6OEBcvUZ1pVBYxX1hRh+EqUSkUxwzB99vE8cycm7pgWgTnQ0Nv/q
 m99VZqy5WaBH9EAFizna+ijJmKXHDPQENaR2qSbnXHHhO5o7do7NFrbrJEtQ9c3tLImjvN
 m8qvzir2NWRQpo8MOctpJupzyy6hc2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-LZhEf6sFOTCo0NygQJwTcg-1; Wed, 09 Dec 2020 12:29:52 -0500
X-MC-Unique: LZhEf6sFOTCo0NygQJwTcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 412E4800D53;
 Wed,  9 Dec 2020 17:29:51 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FCD65D6BA;
 Wed,  9 Dec 2020 17:29:43 +0000 (UTC)
Date: Wed, 9 Dec 2020 18:29:41 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 1/2] virtio-blk: Acquire context while switching them on
 dataplane start
Message-ID: <20201209172941.GA6660@merkur.fritz.box>
References: <20201204165347.73542-1-slp@redhat.com>
 <20201204165347.73542-2-slp@redhat.com>
 <20201207153753.GD5281@merkur.fritz.box>
 <20201209165112.o46ommtx2xab7lg2@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20201209165112.o46ommtx2xab7lg2@mhamilton>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 09.12.2020 um 17:51 hat Sergio Lopez geschrieben:
> On Mon, Dec 07, 2020 at 04:37:53PM +0100, Kevin Wolf wrote:
> > Am 04.12.2020 um 17:53 hat Sergio Lopez geschrieben:
> > > On dataplane start, acquire the new AIO context before calling
> > > 'blk_set_aio_context', releasing it immediately afterwards. This
> > > prevents reaching the AIO context attach/detach notifier functions
> > > without having acquired it first.
> > >=20
> > > It was also the only place where 'blk_set_aio_context' was called wit=
h
> > > an unprotected AIO context.
> > >=20
> > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > > ---
> > >  hw/block/dataplane/virtio-blk.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/vir=
tio-blk.c
> > > index 37499c5564..034e43cb1f 100644
> > > --- a/hw/block/dataplane/virtio-blk.c
> > > +++ b/hw/block/dataplane/virtio-blk.c
> > > @@ -214,7 +214,9 @@ int virtio_blk_data_plane_start(VirtIODevice *vde=
v)
> > >      vblk->dataplane_started =3D true;
> > >      trace_virtio_blk_data_plane_start(s);
> > > =20
> > > +    aio_context_acquire(s->ctx);
> > >      r =3D blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_err)=
;
> > > +    aio_context_release(s->ctx);
> >=20
> > bdrv_set_aio_context_ignore() is documented like this:
> >=20
> >  * The caller must own the AioContext lock for the old AioContext of bs=
, but it
> >  * must not own the AioContext lock for new_context (unless new_context=
 is the
> >  * same as the current context of bs).
>=20
> Does that rule apply to blk_set_aio_context too?

bdrv_set_aio_context_ignore() is what blk_set_aio_context() calls, so I
would say yes.

> All use cases I can find in the code are acquiring the new context:
> [...]

Hm... That's unfortunate.

I think the reason why you shouldn't hold it is that the
bdrv_drained_begin() call in bdrv_set_aio_context_ignore() could
deadlock if you hold the lock of a context that is not the current
context of the BlockDriverState.

Maybe there are more reasons, I'm not sure.

Kevin

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAl/RCYUACgkQfwmycsiP
L9bylg/9HDo3B+UTvt4toGt+FSJMpqFszACi6EYKST1+nRh7hBzqjz8oia1HP0Pk
0irWEBHc8JdJqhU1EOKuvrUTajB4ny77SmvbVfu4yCCfX/eUQdZpuhx0Kiys/HPd
JmP3LULX9eo8FaqC5GrSgrs4U40cyCkf3XkU2XYCzOdqrGfaB/uQLgyD+0JMJ7Q/
cdO8IafbCdMPmEEk6ejivJMk8nBtJ3A8S6/t+lzSM7hmppUEkqKXG3fC/4ZY972T
fnevKrfu7XXjzhrtxfYWZNg3Pk57JhUsG/Eh3QZx1AG2jqYS1oTutFy2K0BGXPtL
1IBiy7hruNMtEEAU3Uk3MyDymdXgMNbbGvM9ZtSy/53RAGzJfr/w/LLXhdrqOS4g
Zko4ZLedm0XBkl7WIm7IUBK5T/ZqdeobrNLbX95Sf/mO66ChNESuHFdIrlGDYjrF
Qi79hqJ1qswDnvSB4zGs9iFFHgzIF5KCaZaskFkWTLDSmFi2j8g4t3ZfnYtHKVen
0UBTIwb/EGJyb/7XY7ls+kCqHT6Xjtf31rwUqkPIgtmssExM9yeCOQEaWEaCP+q2
mgpf4TIVCF3hLMFeDjnyEVcq191etJYIrbqPKTg+P2nTULUcNehsxgF5GdINpqAh
Kk2Tt1+FQSh9fIoeaDqTFDNitBvuYP0G8RwNpaeGFvY2AyZ2Dxw=
=OqeD
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--


