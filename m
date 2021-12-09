Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B9546ED22
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 17:34:37 +0100 (CET)
Received: from localhost ([::1]:56162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvMNQ-0005lu-48
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 11:34:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvMLy-0004y1-FA
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:33:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvMLu-0005xr-Vk
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639067581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5X4MtKcb0zOnXHsT/bSx/xdp5YeyeFyRXOCHyd0yxKc=;
 b=bwue4bbFTywOhpuxmlR7Expb++h046amcoadQOmemNd1q4pJvc9OLoN/gI4WrHLC0d9hgM
 eLhCsf0cjzLHTwtPPIZsG+5OM5GnCwgkgjK+D6gmgwYi74TRPL4a0pGT5mj7t469Nr5Est
 AE26qZ/+aoNYEA1VSrsqjcIad76T7Es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-mavTdumlO6WWdUnpxawY0A-1; Thu, 09 Dec 2021 11:33:00 -0500
X-MC-Unique: mavTdumlO6WWdUnpxawY0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12A6961245;
 Thu,  9 Dec 2021 16:32:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C287C19724;
 Thu,  9 Dec 2021 16:32:55 +0000 (UTC)
Date: Thu, 9 Dec 2021 16:32:54 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC] block-backend: prevent dangling BDS pointer in blk_drain()
Message-ID: <YbIvtoLHeZLcBE4b@stefanha-x1.localdomain>
References: <20211209142304.381253-1-stefanha@redhat.com>
 <404e8b66-b64a-fded-db53-81eef675fc33@redhat.com>
MIME-Version: 1.0
In-Reply-To: <404e8b66-b64a-fded-db53-81eef675fc33@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dBJHe8kNryM4YAD5"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dBJHe8kNryM4YAD5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 04:45:13PM +0100, Hanna Reitz wrote:
> On 09.12.21 15:23, Stefan Hajnoczi wrote:
> > The BlockBackend root child can change during bdrv_drained_begin() when
> > aio_poll() is invoked. In fact the BlockDriverState can reach refcnt 0
> > and blk_drain() is left with a dangling BDS pointer.
> >=20
> > One example is scsi_device_purge_requests(), which calls blk_drain() to
> > wait for in-flight requests to cancel. If the backup blockjob is active=
,
> > then the BlockBackend root child is a temporary filter BDS owned by the
> > blockjob. The blockjob can complete during bdrv_drained_begin() and the
> > last reference to the BDS is released when the temporary filter node is
> > removed. This results in a use-after-free when blk_drain() calls
> > bdrv_drained_end(bs) on the dangling pointer.
> >=20
> > The general problem is that a function and its callers must not assume
> > that bs is still valid across aio_poll(). Explicitly hold a reference t=
o
> > bs in blk_drain() to avoid the dangling pointer.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > I found that BDS nodes are sometimes deleted with bs->quiesce_counter >
> > 0 (at least when running "make check"), so it is currently not possible
> > to put the bdrv_ref/unref() calls in bdrv_do_drained_begin() and
> > bdrv_do_drained_end() because they will be unbalanced. That would have
> > been a more general solution than only fixing blk_drain().
>=20
> Deleting nodes that have a `quiesce_counter > 0` doesn=E2=80=99t seem wro=
ng to me =E2=80=93
> deleting only depends on strong references, and so I=E2=80=99d expect tha=
t anything
> that increases the quiesce_counter also has a strong reference to the nod=
e
> if the former wants the latter to stay around.
>=20
> I suppose we could make it so that both the quiesce_counter and the refcn=
t
> need to be 0 before a BDS is deleted (and then deletion can happen both f=
rom
> bdrv_unref() and drained_end), but I don=E2=80=99t know whether that=E2=
=80=99s really
> necessary.=C2=A0 I=E2=80=99d rather leave it to the caller to ensure they=
 keep a strong
> reference throughout the drain.
>=20
> The question is, how often do we have a situation like this, where we tak=
e a
> weak reference for draining, because we assume there=E2=80=99s a strong r=
eference
> backing us up (namely the one through blk->root), but that strong referen=
ce
> then can go away due to draining...
>=20
> > Any suggestions for a better fix?
>=20
> The fix makes sense to me.

Okay. My concern was that this is a whole class of bugs and my patch
only fixes blk_drain(). I have audited the code some more in the
meantime.

bdrv_insert_node() may be unsafe in the case where bs is a temporary
filter node that is unref'd during bdrv_drained_begin():

  BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
                                     int flags, Error **errp)
  {
      ERRP_GUARD();
      int ret;
      BlockDriverState *new_node_bs =3D NULL;
      const char *drvname, *node_name;
      BlockDriver *drv;
 =20
      drvname =3D qdict_get_try_str(options, "driver");
      if (!drvname) {
          error_setg(errp, "driver is not specified");
          goto fail;
      }
 =20
      drv =3D bdrv_find_format(drvname);
      if (!drv) {
          error_setg(errp, "Unknown driver: '%s'", drvname);
          goto fail;
      }
 =20
      node_name =3D qdict_get_try_str(options, "node-name");
 =20
      new_node_bs =3D bdrv_new_open_driver_opts(drv, node_name, options, fl=
ags,
                                              errp);
      options =3D NULL; /* bdrv_new_open_driver() eats options */
      if (!new_node_bs) {
          error_prepend(errp, "Could not create node: ");
          goto fail;
      }
 =20
      bdrv_drained_begin(bs);
      ^^^^^^^^^^^^^^^^^^^^^^^ <--- bs can be dangling pointer
      ret =3D bdrv_replace_node(bs, new_node_bs, errp);
      bdrv_drained_end(bs);

The fix isn't as simple as blk_drain() because we don't want to insert
the new node before the now-deleted node. I think the correct way to
insert a node is against BdrvChild, not BlockDriverState. That way we
can be sure the new node will be inserted into a graph that is reachable
via BdrvChild (e.g. BlockBackend) instead of a detached BDS.

bdrv_set_aio_context_ignore() and blk_io_limits_disable() need to ref bs
like blk_drain() in this patch.

There are some other bdrv_drained_begin() calls that I'm assuming are
safe because they are during creation/deletion so I think we have strong
references there or nothing else knows about our BDS yet.

Do you agree with extending this patch series to cover the functions I
mentioned above?

> One alternative that comes to my mind is to instead re-fetch `bs =3D
> blk_bs(blk);` after the AIO_WAIT_WHILE() loop.=C2=A0 But that might be wr=
ong,
> because if the node attached to the BB changed (i.e. isn=E2=80=99t `bs`, =
and isn=E2=80=99t
> `NULL`), then we=E2=80=99d end the drain on the wrong node.

Yes.

Stefan

--dBJHe8kNryM4YAD5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGyL7YACgkQnKSrs4Gr
c8j11wgArqCBjzOPhOVEjosX69ja3sQK3dw2WD5x7HiRoaBWy34d2Wok48UlPFOy
Wkp8qRVtxL8H+zDx0LcpJG210T7Al0ltlQVZyrCCn0ys54IWBPNjcn6kmTvQeO5m
u35EG6UTFy0TATfexL0kGxzS/oCVuZUOayFNzyvCBzA/FWCLR/8pZwH0xfrwtk6L
ELtPQ1QtdLcQYv+JsLjrqr4Zl6WPTfMh0kBfEDVdrm4nL8R9KdHP1XzKPucb0RQI
cZ3rSBQuP9H42rktUpb9z/hkxoBnT2JfscLT0pz9v1JFQrbcyyXk8z1O3IXFppP7
oUVThSqjYptzpfh7mE4QmOuPLhE7Jg==
=4RSx
-----END PGP SIGNATURE-----

--dBJHe8kNryM4YAD5--


