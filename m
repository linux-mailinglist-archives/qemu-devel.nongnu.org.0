Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBA13D6040
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:02:52 +0200 (CEST)
Received: from localhost ([::1]:48990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8347-0005as-II
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m831K-0002kG-Ho
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:59:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m831I-0007ZH-R0
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627315195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=inrL5lBClgNE0iy4qYbLSftqWgQC0WR9cM1BurP2M3g=;
 b=fwpCSUnsMQ+xF1szJciaNHtRokWTbMywY1soBNZiuJVOq4M+CXHW32Bw7XZLwNfZWlkWK4
 xj/Pde7hJer+EqOP2doKpaRRk4nwkQCZIxwT7910CBIwC7hbhGa/YDIPRJHeVB2hyRcyW8
 ESTA6A41bcADhgUAQ0kHO5f5IDY5HT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-55D40c4fNayRS0TBu_69vQ-1; Mon, 26 Jul 2021 11:59:53 -0400
X-MC-Unique: 55D40c4fNayRS0TBu_69vQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9096C1084F61;
 Mon, 26 Jul 2021 15:59:52 +0000 (UTC)
Received: from localhost (ovpn-113-151.ams2.redhat.com [10.36.113.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19A221000358;
 Mon, 26 Jul 2021 15:59:51 +0000 (UTC)
Date: Mon, 26 Jul 2021 16:59:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] raw-format: drop WRITE and RESIZE child perms when
 possible
Message-ID: <YP7b9guLztT5XBXB@stefanha-x1.localdomain>
References: <20210726122839.822900-1-stefanha@redhat.com>
 <57dd2772-352b-75b1-6ed2-474423d7680e@virtuozzo.com>
 <YP7X92k+dWBNvORR@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YP7X92k+dWBNvORR@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BamFBM83qcEUBR80"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
 qemu-block@nongnu.org, afrosi@redhat.com, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--BamFBM83qcEUBR80
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2021 at 05:42:47PM +0200, Kevin Wolf wrote:
> Am 26.07.2021 um 16:41 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > 26.07.2021 15:28, Stefan Hajnoczi wrote:
> > > The following command-line fails due to a permissions conflict:
> > >=20
> > >    $ qemu-storage-daemon \
> > >        --blockdev driver=3Dnvme,node-name=3Dnvme0,device=3D0000:08:00=
.0,namespace=3D1 \
> > >        --blockdev driver=3Draw,node-name=3Dl1-1,file=3Dnvme0,offset=
=3D0,size=3D1073741824 \
> > >        --blockdev driver=3Draw,node-name=3Dl1-2,file=3Dnvme0,offset=
=3D1073741824,size=3D1073741824 \
> > >        --nbd-server addr.type=3Dunix,addr.path=3D/tmp/nbd.sock,max-co=
nnections=3D2 \
> > >        --export type=3Dnbd,id=3Dnbd-l1-1,node-name=3Dl1-1,name=3Dl1-1=
,writable=3Don \
> > >        --export type=3Dnbd,id=3Dnbd-l1-2,node-name=3Dl1-2,name=3Dl1-2=
,writable=3Don
> > >=20
> > >    qemu-storage-daemon: --export type=3Dnbd,id=3Dnbd-l1-1,node-name=
=3Dl1-1,name=3Dl1-1,writable=3Don: Permission conflict on node 'nvme0': per=
missions 'resize' are both required by node 'l1-1' (uses node 'nvme0' as 'f=
ile' child) and unshared by node 'l1-2' (uses node 'nvme0' as 'file' child)=
.
> > >=20
> > > The problem is that block/raw-format.c relies on bdrv_default_perms()=
 to
> > > set permissions on the nvme node. The default permissions add RESIZE =
in
> > > anticipation of a format driver like qcow2 that needs to grow the ima=
ge
> > > file. This fails because RESIZE is unshared, so we cannot get the RES=
IZE
> > > permission.
> > >=20
> > > Max Reitz pointed out that block/crypto.c already handles this case b=
y
> > > implementing a custom ->bdrv_child_perm() function that adjusts the
> > > result of bdrv_default_perms().
> > >=20
> > > This patch takes the same approach in block/raw-format.c so that RESI=
ZE
> > > is only required if it's actually necessary (e.g. the parent is qcow2=
).
> > >=20
> > > Cc: Max Reitz <mreitz@redhat.com>
> > > Cc: Kevin Wolf <kwolf@redhat.com>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > > This is not a bug fix, so I didn't mark it for QEMU 6.1. It's new
> > > behavior that hasn't been supported before. I want to split an NVMe
> > > drive using the raw format's offset=3D/size=3D feature.
> > > ---
> > >   block/raw-format.c | 21 ++++++++++++++++++++-
> > >   1 file changed, 20 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/block/raw-format.c b/block/raw-format.c
> > > index 7717578ed6..c26f493688 100644
> > > --- a/block/raw-format.c
> > > +++ b/block/raw-format.c
> > > @@ -580,6 +580,25 @@ static void raw_cancel_in_flight(BlockDriverStat=
e *bs)
> > >       bdrv_cancel_in_flight(bs->file->bs);
> > >   }
> > > +static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
> > > +                           BdrvChildRole role,
> > > +                           BlockReopenQueue *reopen_queue,
> > > +                           uint64_t parent_perm, uint64_t parent_sha=
red,
> > > +                           uint64_t *nperm, uint64_t *nshared)
> > > +{
> > > +    bdrv_default_perms(bs, c, role, reopen_queue, parent_perm,
> > > +                       parent_shared, nperm, nshared);
> > > +
> > > +    /*
> > > +     * bdrv_default_perms() may add WRITE and/or RESIZE (see comment=
 in
> > > +     * bdrv_default_perms_for_storage() for an explanation) but we o=
nly need
> > > +     * them if they are in parent_perm. Drop WRITE and RESIZE whenev=
er possible
> > > +     * to avoid permission conflicts.
> > > +     */
> > > +    *nperm &=3D ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
> > > +    *nperm |=3D parent_perm & (BLK_PERM_WRITE | BLK_PERM_RESIZE);
> > > +}
> > > +
> > >   BlockDriver bdrv_raw =3D {
> > >       .format_name          =3D "raw",
> > >       .instance_size        =3D sizeof(BDRVRawState),
> > > @@ -588,7 +607,7 @@ BlockDriver bdrv_raw =3D {
> > >       .bdrv_reopen_commit   =3D &raw_reopen_commit,
> > >       .bdrv_reopen_abort    =3D &raw_reopen_abort,
> > >       .bdrv_open            =3D &raw_open,
> > > -    .bdrv_child_perm      =3D bdrv_default_perms,
> > > +    .bdrv_child_perm      =3D raw_child_perm,
> > >       .bdrv_co_create_opts  =3D &raw_co_create_opts,
> > >       .bdrv_co_preadv       =3D &raw_co_preadv,
> > >       .bdrv_co_pwritev      =3D &raw_co_pwritev,
> > >=20
> >=20
> > I think it's OK:
> >=20
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> >=20
> >=20
> > Still, did you consider an alternative of making
> > bdrv_filter_default_perm() function public and just do
> > ".bdrv_child_perm =3D bdrv_filter_default_perm," here?
> >=20
> > raw_format is not considered to be filter, but for it's permissions I
> > think it works exactly like filter.
>=20
> I had the same thought, but then commit 69dca43d6b6 explicitly made the
> opposite change. I seem to remember that Max never liked raw being
> treated like a filter much.

Additionally:

  static int raw_open(BlockDriverState *bs, QDict *options, int flags,
                      Error **errp)
  {
  ...
      /*
       * Without offset and a size limit, this driver behaves very much
       * like a filter.  With any such limit, it does not.
       */
      if (offset || has_size) {
          file_role =3D BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY;
      } else {
          file_role =3D BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
      }

Whether the raw child node acts as FILTERED or DATA depends on whether
offset=3D/size=3D were given.

Stefan

--BamFBM83qcEUBR80
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD+2/YACgkQnKSrs4Gr
c8hlTAgAoVEavLlyZ7NVmSdofBLTFeWnJJHdUmJKF6alAI5OVgw53bwRrVlnelC/
X6H29CkaYik8zCUySqWcnBNSBl94PxtQFb1i8R59iTa4Byg72u83gNqeoQriYQ7Z
f3H5DeOlkbe7mM5q2OgLdW5KBjsqoxy/rXnp/MGpZk/As6CPPfpo+ThGY/VkprPV
Jin2RAq5TmGONKAXXRiJTSWTFpq0MnzN8l+xn9YjUcMC3k/nGbO41lTVceALMhMp
rF6x/KF7LfaswV5OTD1zwJtOWKMogY70avyL518O0Qgz7myQY5EX6m/zQTmNw91D
uVAqw6rPeUi5BtkIc+jFNZIRznIvlA==
=uENr
-----END PGP SIGNATURE-----

--BamFBM83qcEUBR80--


