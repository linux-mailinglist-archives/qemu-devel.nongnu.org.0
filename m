Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39506475DDC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:51:13 +0100 (CET)
Received: from localhost ([::1]:37824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXUm-0004CH-2U
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxXQs-0001kj-NR
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:47:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxXQo-00011F-OC
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639586825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=deqdMxBY1Qzgl0nRwTtU0W9unutdm60B7sU32B85ChQ=;
 b=Fj4sNYASUkuqYp7rLBo0JSARoTgq9w5scf+Bob0OWL0IkjlZWjJ/j4MvEk1RjDcb+B+Dtg
 Em2OZ+vIKq0rDrqmQ7bEZN5ifhUBVmrF6ye0mcLbQGTDHCFrlL8f+lGTPVXDYrfJFOwtL/
 fezPB+OdPE9Og8DQM8O1vroDylNBJ20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-cPC3AC3kOrmkiqlmia20Ug-1; Wed, 15 Dec 2021 11:47:03 -0500
X-MC-Unique: cPC3AC3kOrmkiqlmia20Ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E71E802921;
 Wed, 15 Dec 2021 16:47:02 +0000 (UTC)
Received: from localhost (unknown [10.39.195.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0C815BD07;
 Wed, 15 Dec 2021 16:46:52 +0000 (UTC)
Date: Wed, 15 Dec 2021 16:46:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] block-backend: prevent dangling BDS pointers across
 aio_poll()
Message-ID: <Ybob+y8vPIFyKVTW@stefanha-x1.localdomain>
References: <20211214143542.14758-1-stefanha@redhat.com>
 <YbixZeHqqImnPbwL@redhat.com>
 <YbnRbuf92sNj8cSA@stefanha-x1.localdomain>
 <YboKTv0hpoXUot8+@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YboKTv0hpoXUot8+@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GV5ndK7ySptRBa4a"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GV5ndK7ySptRBa4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 04:31:26PM +0100, Kevin Wolf wrote:
> Am 15.12.2021 um 12:28 hat Stefan Hajnoczi geschrieben:
> > On Tue, Dec 14, 2021 at 03:59:49PM +0100, Kevin Wolf wrote:
> > > Am 14.12.2021 um 15:35 hat Stefan Hajnoczi geschrieben:
> > > > The BlockBackend root child can change when aio_poll() is invoked. =
This
> > > > happens when a temporary filter node is removed upon blockjob
> > > > completion, for example.
> > > >=20
> > > > Functions in block/block-backend.c must be aware of this when using=
 a
> > > > blk_bs() pointer across aio_poll() because the BlockDriverState ref=
cnt
> > > > may reach 0, resulting in a stale pointer.
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
> > > > Explicitly hold a reference to bs across block APIs that invoke
> > > > aio_poll().
> > > >=20
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > > v2:
> > > > - Audit block/block-backend.c and fix additional cases
> > > > ---
> > > >  block/block-backend.c | 11 +++++++++++
> > > >  1 file changed, 11 insertions(+)
> > > >=20
> > > > diff --git a/block/block-backend.c b/block/block-backend.c
> > > > index 12ef80ea17..a40ad7fa92 100644
> > > > --- a/block/block-backend.c
> > > > +++ b/block/block-backend.c
> > > > @@ -828,10 +828,12 @@ void blk_remove_bs(BlockBackend *blk)
> > > >      notifier_list_notify(&blk->remove_bs_notifiers, blk);
> > > >      if (tgm->throttle_state) {
> > > >          bs =3D blk_bs(blk);
> > > > +        bdrv_ref(bs);
> > > >          bdrv_drained_begin(bs);
> > > >          throttle_group_detach_aio_context(tgm);
> > > >          throttle_group_attach_aio_context(tgm, qemu_get_aio_contex=
t());
> > > >          bdrv_drained_end(bs);
> > > > +        bdrv_unref(bs);
> > > >      }
> > > > =20
> > > >      blk_update_root_state(blk);
> > >=20
> > > This hunk is unnecessary, we still hold a reference that is only give=
n
> > > up a few lines down with bdrv_root_unref_child(root).
> >=20
> > That's not the only place where the reference can be dropped:
> > bdrv_drop_filter() removes the filter node from the graph.
> >=20
> > Here is a case where it happens: block/backup.c:backup_clean() ->
> > bdrv_cbw_drop() -> bdrv_drop_filter() -> bdrv_replace_node_common() ->
> > bdrv_replace_child_commit(). After we reach this bdrv_unref() is called
> > a few times and all references are dropped because the node is no longe=
r
> > in the graph.
> >=20
> > This happens during blk_remove_bs() -> bdrv_drained_begin(), so the bs
> > pointer in the above hunk can be stale.
>=20
> Is the scenario that blk->root doesn't go away, but the node it
> references changes? So the unref below will be for a different node than
> we're draining here?

Yes, exactly.

> If so, let's add a comment that blk_bs(blk) can change after the drain,
> and maybe move the BlockDriverState *bs declaration inside the if block
> because the variable is invalid after it anyway.

Will fix.

> Can it also happen that instead of removing a node from the chain, a new
> one is inserted and we actually end up having drained the wrong node
> before switching the context for tgm?

I'll investigate that. There is already some level of support for
draining new nodes but I'm not sure it covers all insert and replace
cases.

Stefan

--GV5ndK7ySptRBa4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG6G/sACgkQnKSrs4Gr
c8i/WQgAs+JANRLcimflJfg9Tt15bH+BI98CIj/2TqloRCnpx7v/TUjJe3BjUy0g
mbFXOZXeMnXA7JO8jUB+upJlTq/gtXMI2Otfz94WBFC/MKlD+RoOrefqo3dWpL1J
xEgac964LBfDm16PZd5nxXEAzMwRmt7fm9LtJgG/qr/WkOlBiYYfMzm49Vd9+JXC
M4XZglPdorU1r/TeGvQ7C7B8rBBHiDQg9cCyaztDZz/oh3ofUGIhy8CQqHW0KQuX
Bbq0oeG3KagX5ME74IMW8sqcRsj8cVGvOQRqFr2XbciziZK/kx8+HV4cLVM2wuEc
Wtp84jDpudJ67LOkkLLDTypUSW7F0g==
=SM6p
-----END PGP SIGNATURE-----

--GV5ndK7ySptRBa4a--


