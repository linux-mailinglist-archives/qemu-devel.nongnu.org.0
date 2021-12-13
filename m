Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30688472533
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:42:28 +0100 (CET)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwhql-0002cI-BO
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:42:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwhoU-0001fC-Rn
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:40:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwhoQ-00041l-Hc
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639388381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0h7sBr/+xzdOmiQg3Btkk5N5mtJIuKG5y5l1NrTU+s=;
 b=XfM0hiprnVmH98AEM+FvEMw2++3P3iaeWfGLLJ1X3viIVPF8tPcDg0krxXVxQN2Lhr6sf+
 XfXsw0Nb6QmqqAk3OiRWb6o72m7i6q2AitY1fwI65E8Je5TubbSZedUNZo1BDJwEwCSyx7
 msKlRFqJCTgs6T6BDztvfSl5j7eaxJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-vBo0DOTkMU2m2j7TWsKaaA-1; Mon, 13 Dec 2021 04:39:37 -0500
X-MC-Unique: vBo0DOTkMU2m2j7TWsKaaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBC6D1023F4E;
 Mon, 13 Dec 2021 09:39:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 059E2101E397;
 Mon, 13 Dec 2021 09:39:29 +0000 (UTC)
Date: Mon, 13 Dec 2021 09:39:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC] block-backend: prevent dangling BDS pointer in blk_drain()
Message-ID: <YbcU0KYIpHRlu7yf@stefanha-x1.localdomain>
References: <20211209142304.381253-1-stefanha@redhat.com>
 <404e8b66-b64a-fded-db53-81eef675fc33@redhat.com>
 <YbIvtoLHeZLcBE4b@stefanha-x1.localdomain>
 <1542b233-8828-3a95-a511-b19b916398be@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <1542b233-8828-3a95-a511-b19b916398be@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fGyb44A/O4TKS/9z"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fGyb44A/O4TKS/9z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 07:51:02PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> 09.12.2021 19:32, Stefan Hajnoczi wrote:
> > On Thu, Dec 09, 2021 at 04:45:13PM +0100, Hanna Reitz wrote:
> > > On 09.12.21 15:23, Stefan Hajnoczi wrote:
> > > > The BlockBackend root child can change during bdrv_drained_begin() =
when
> > > > aio_poll() is invoked. In fact the BlockDriverState can reach refcn=
t 0
> > > > and blk_drain() is left with a dangling BDS pointer.
> > > >=20
> > > > One example is scsi_device_purge_requests(), which calls blk_drain(=
) to
> > > > wait for in-flight requests to cancel. If the backup blockjob is ac=
tive,
> > > > then the BlockBackend root child is a temporary filter BDS owned by=
 the
> > > > blockjob. The blockjob can complete during bdrv_drained_begin() and=
 the
> > > > last reference to the BDS is released when the temporary filter nod=
e is
> > > > removed. This results in a use-after-free when blk_drain() calls
> > > > bdrv_drained_end(bs) on the dangling pointer.
> > > >=20
> > > > The general problem is that a function and its callers must not ass=
ume
> > > > that bs is still valid across aio_poll(). Explicitly hold a referen=
ce to
> > > > bs in blk_drain() to avoid the dangling pointer.
> > > >=20
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > > I found that BDS nodes are sometimes deleted with bs->quiesce_count=
er >
> > > > 0 (at least when running "make check"), so it is currently not poss=
ible
> > > > to put the bdrv_ref/unref() calls in bdrv_do_drained_begin() and
> > > > bdrv_do_drained_end() because they will be unbalanced. That would h=
ave
> > > > been a more general solution than only fixing blk_drain().
> > >=20
> > > Deleting nodes that have a `quiesce_counter > 0` doesn=E2=80=99t seem=
 wrong to me =E2=80=93
> > > deleting only depends on strong references, and so I=E2=80=99d expect=
 that anything
> > > that increases the quiesce_counter also has a strong reference to the=
 node
> > > if the former wants the latter to stay around.
> > >=20
> > > I suppose we could make it so that both the quiesce_counter and the r=
efcnt
> > > need to be 0 before a BDS is deleted (and then deletion can happen bo=
th from
> > > bdrv_unref() and drained_end), but I don=E2=80=99t know whether that=
=E2=80=99s really
> > > necessary.=C2=A0 I=E2=80=99d rather leave it to the caller to ensure =
they keep a strong
> > > reference throughout the drain.
> > >=20
> > > The question is, how often do we have a situation like this, where we=
 take a
> > > weak reference for draining, because we assume there=E2=80=99s a stro=
ng reference
> > > backing us up (namely the one through blk->root), but that strong ref=
erence
> > > then can go away due to draining...
> > >=20
> > > > Any suggestions for a better fix?
> > >=20
> > > The fix makes sense to me.
> >=20
> > Okay. My concern was that this is a whole class of bugs and my patch
> > only fixes blk_drain(). I have audited the code some more in the
> > meantime.
> >=20
> > bdrv_insert_node() may be unsafe in the case where bs is a temporary
> > filter node that is unref'd during bdrv_drained_begin():
> >=20
> >    BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *opti=
ons,
> >                                       int flags, Error **errp)
> >    {
> >        ERRP_GUARD();
> >        int ret;
> >        BlockDriverState *new_node_bs =3D NULL;
> >        const char *drvname, *node_name;
> >        BlockDriver *drv;
> >        drvname =3D qdict_get_try_str(options, "driver");
> >        if (!drvname) {
> >            error_setg(errp, "driver is not specified");
> >            goto fail;
> >        }
> >        drv =3D bdrv_find_format(drvname);
> >        if (!drv) {
> >            error_setg(errp, "Unknown driver: '%s'", drvname);
> >            goto fail;
> >        }
> >        node_name =3D qdict_get_try_str(options, "node-name");
> >        new_node_bs =3D bdrv_new_open_driver_opts(drv, node_name, option=
s, flags,
> >                                                errp);
> >        options =3D NULL; /* bdrv_new_open_driver() eats options */
> >        if (!new_node_bs) {
> >            error_prepend(errp, "Could not create node: ");
> >            goto fail;
> >        }
> >        bdrv_drained_begin(bs);
> >        ^^^^^^^^^^^^^^^^^^^^^^^ <--- bs can be dangling pointer
> >        ret =3D bdrv_replace_node(bs, new_node_bs, errp);
> >        bdrv_drained_end(bs);
> >=20
> > The fix isn't as simple as blk_drain() because we don't want to insert
> > the new node before the now-deleted node. I think the correct way to
> > insert a node is against BdrvChild, not BlockDriverState. That way we
> > can be sure the new node will be inserted into a graph that is reachabl=
e
> > via BdrvChild (e.g. BlockBackend) instead of a detached BDS.
> >=20
> > bdrv_set_aio_context_ignore() and blk_io_limits_disable() need to ref b=
s
> > like blk_drain() in this patch.
> >=20
> > There are some other bdrv_drained_begin() calls that I'm assuming are
> > safe because they are during creation/deletion so I think we have stron=
g
> > references there or nothing else knows about our BDS yet.
> >=20
> > Do you agree with extending this patch series to cover the functions I
> > mentioned above?
>=20
> I'm not sure.
>=20
> First, we can't support "any graph change" during some graph changing ope=
ration.
>=20
> Actually, when we do some specific graph change operation, we should forb=
id any other graph change operations, they should wait. Possibly, by adding=
 strong references everywhere, we can avoid crashes. But what about the log=
ic? If we do several graph changing operations simultaneously, the result i=
s absolutely unpredictable, it's not what user wants.
>=20
> The problem is known. For example it may lead to 030 iotest failure. Prob=
ably now it can't, after changes by Hanna.. But I think we'll not be safe, =
until we have a kind of global mutex for graph changing operations. For exa=
mple, here is my old attempt: https://lists.nongnu.org/archive/html/qemu-de=
vel/2020-11/msg05290.html .
>=20
> So, probably, until we have a good solution for this, better do only nece=
ssary small fixes like your original patch..
>=20
>=20
> Second, actually bs may disappear on first yield point, which will happen=
 earlier than bdrv_drained_being() - in bdrv_new_open_driver_opts(). So, if=
 fix something, we'd better declare that caller of bdrv_insert_node() is re=
sponsible for bs not disappear during function call. And check callers.

bdrv_insert_node() is tricky. I will leave it alone and focus on
bdrv_set_aio_context_ignore() and blk_io_limits_disable() because I
think they have exactly the same problem as blk_drain().

Stefan

--fGyb44A/O4TKS/9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3FNAACgkQnKSrs4Gr
c8hWbggAtgrXi7z7NfUz3IHzpkXdZY8nxRdSdOJEMv7AIrT391MK2DC8mmLlrsEK
z8/x99hG+PGb+udNmO6XT4SOtKWJL8+L0hQwgAr6XmaDgMRrbyXuI6MgILgf6ANs
BB+mJi1hTz0ULdyR0mT3RbcNEsMi/xAbW3uvZj00QZw2+FslpztITwFI0G9Y+4hO
r2AKowZMWH8sZoomoeXLfJNqV2Xjw/CtW/ZQ600f6mnBaBAxh67xmN+Vsvi+NzI+
LN0QBg3qU38qurfm43n3SZ/7y3jPFHqZEWE2qxSvjWIMSMd7SoFqxIClphp1jhry
MH+zhIu7OQ57a/R0JVv0ui+CkS0+LQ==
=3pCa
-----END PGP SIGNATURE-----

--fGyb44A/O4TKS/9z--


