Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236EC475BDE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:33:31 +0100 (CET)
Received: from localhost ([::1]:34266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWHa-0001Yh-95
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:33:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxWFt-0008UG-Er
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxWFq-0007km-IJ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639582301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oqlz1tiNpEviH2PMIr4dQt/gv+P/L0F7L7mMSyJHUjA=;
 b=Vfi6MFpyP/qYjx1g6KqTtMYekonbbNPyR3iPOL3bO3mh/wFF7qdEOHExoE8jsuqLPWESg1
 vskDb02fYoUU6+YsIo0OjT1m2zaPhkyiN6Um2G8ASbbMIivxNHByRcUAR9XvlmKxfCIHgR
 qN0NerbKiFQZtrD09Q9OQaIGztHdAEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-NudRc8wiNSiPx6hVuEJF4Q-1; Wed, 15 Dec 2021 10:31:34 -0500
X-MC-Unique: NudRc8wiNSiPx6hVuEJF4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A4A618C89E8;
 Wed, 15 Dec 2021 15:31:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D56805BE00;
 Wed, 15 Dec 2021 15:31:27 +0000 (UTC)
Date: Wed, 15 Dec 2021 16:31:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2] block-backend: prevent dangling BDS pointers across
 aio_poll()
Message-ID: <YboKTv0hpoXUot8+@redhat.com>
References: <20211214143542.14758-1-stefanha@redhat.com>
 <YbixZeHqqImnPbwL@redhat.com>
 <YbnRbuf92sNj8cSA@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YbnRbuf92sNj8cSA@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1xBMTRFBH24oiMlL"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1xBMTRFBH24oiMlL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 15.12.2021 um 12:28 hat Stefan Hajnoczi geschrieben:
> On Tue, Dec 14, 2021 at 03:59:49PM +0100, Kevin Wolf wrote:
> > Am 14.12.2021 um 15:35 hat Stefan Hajnoczi geschrieben:
> > > The BlockBackend root child can change when aio_poll() is invoked. Th=
is
> > > happens when a temporary filter node is removed upon blockjob
> > > completion, for example.
> > >=20
> > > Functions in block/block-backend.c must be aware of this when using a
> > > blk_bs() pointer across aio_poll() because the BlockDriverState refcn=
t
> > > may reach 0, resulting in a stale pointer.
> > >=20
> > > One example is scsi_device_purge_requests(), which calls blk_drain() =
to
> > > wait for in-flight requests to cancel. If the backup blockjob is acti=
ve,
> > > then the BlockBackend root child is a temporary filter BDS owned by t=
he
> > > blockjob. The blockjob can complete during bdrv_drained_begin() and t=
he
> > > last reference to the BDS is released when the temporary filter node =
is
> > > removed. This results in a use-after-free when blk_drain() calls
> > > bdrv_drained_end(bs) on the dangling pointer.
> > >=20
> > > Explicitly hold a reference to bs across block APIs that invoke
> > > aio_poll().
> > >=20
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > > v2:
> > > - Audit block/block-backend.c and fix additional cases
> > > ---
> > >  block/block-backend.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/block/block-backend.c b/block/block-backend.c
> > > index 12ef80ea17..a40ad7fa92 100644
> > > --- a/block/block-backend.c
> > > +++ b/block/block-backend.c
> > > @@ -828,10 +828,12 @@ void blk_remove_bs(BlockBackend *blk)
> > >      notifier_list_notify(&blk->remove_bs_notifiers, blk);
> > >      if (tgm->throttle_state) {
> > >          bs =3D blk_bs(blk);
> > > +        bdrv_ref(bs);
> > >          bdrv_drained_begin(bs);
> > >          throttle_group_detach_aio_context(tgm);
> > >          throttle_group_attach_aio_context(tgm, qemu_get_aio_context(=
));
> > >          bdrv_drained_end(bs);
> > > +        bdrv_unref(bs);
> > >      }
> > > =20
> > >      blk_update_root_state(blk);
> >=20
> > This hunk is unnecessary, we still hold a reference that is only given
> > up a few lines down with bdrv_root_unref_child(root).
>=20
> That's not the only place where the reference can be dropped:
> bdrv_drop_filter() removes the filter node from the graph.
>=20
> Here is a case where it happens: block/backup.c:backup_clean() ->
> bdrv_cbw_drop() -> bdrv_drop_filter() -> bdrv_replace_node_common() ->
> bdrv_replace_child_commit(). After we reach this bdrv_unref() is called
> a few times and all references are dropped because the node is no longer
> in the graph.
>=20
> This happens during blk_remove_bs() -> bdrv_drained_begin(), so the bs
> pointer in the above hunk can be stale.

Is the scenario that blk->root doesn't go away, but the node it
references changes? So the unref below will be for a different node than
we're draining here?

If so, let's add a comment that blk_bs(blk) can change after the drain,
and maybe move the BlockDriverState *bs declaration inside the if block
because the variable is invalid after it anyway.

Can it also happen that instead of removing a node from the chain, a new
one is inserted and we actually end up having drained the wrong node
before switching the context for tgm?

Kevin

--1xBMTRFBH24oiMlL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmG6Ck4ACgkQfwmycsiP
L9bS1Q//Z5yWNZdgeMgWXPjs+H4WT8UHOmP7F6B3Qhn8Ybpph44+jRqkp0GciZuC
j8J56DjgTvucAOtXJn86b2lJLXNWtPoWpl/4Jl8dqmoVd3vo5go/kTErshhWfbXs
+RUds12NSQmzNWFKumZDUugThPvYIpz3G2TdsMvV6qilBT9ZCXbeQV7t9uEKQi7F
kir1rOceV5eL4eOI6ade4syzj+8q1Mr5OorLTUBgR4nIQwZAOlql2G50buVsKAo8
awHQWRwHmlmztHurzc3KRcPtJQixWSHHmlNtMLoMKxGjVPa7RdXZB4Ir0I2wA7zf
se1Fl66WSVQwOt2bdx6kZOikKcKK+VwvNAeicQr3YkpGqw3d+IzzzeAl2yiy0Jnx
O7ZBulzzqQ/aW/DIAI1q0/NJUTbk8znecPtNIE+GiRQJDg+ssOWWcwP2eWtG5IHG
TGtKfWCtO5Ag9fBaIlj82aullCFO5vq8rLGaZGgEI72x5vuFcv5oh/1yLudefjTD
27ef0I6EyhFQ3Nix1Yte2yGv7j2XImVNmBCtt6Cqq8qgNTlpl+j8gjeWN/9JwQgz
9hbkIoskWsyRxDsjfT3l4MSrD5aZR7gMemvJfXqUCcREiogG0FYUJsqCT9zpZVUP
SaYPqIpMm60CNH/O+Sd+LWlIi6ETxvHmp16V9mke7eJFKi6jpEE=
=SiE/
-----END PGP SIGNATURE-----

--1xBMTRFBH24oiMlL--


