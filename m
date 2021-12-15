Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C0247583E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:57:21 +0100 (CET)
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSuO-00071L-68
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:57:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxSTG-000699-AU
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:29:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxST2-0008Da-LP
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639567742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZygp4+7rd+gUDsh3u9hKpPHrSyUXo0FH26Mgnok3iA=;
 b=Puwv+OzssUhSHPX2h77l+0sJE4fiSWZ95P5nr5e6zx9GVw6eUUqvSg0S7W3kUw/gIdZf0R
 dbINYBIqXrZKecdm02+LPuBKy5Go6vLpRt1x26eaWxLE6RH/9R/U24DWNhX6PRu2j22mzI
 psiQAQ2weg1K3f/+1PKmQCr0DtBErac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-MGbTVg3WNYSTwOrTbjEemw-1; Wed, 15 Dec 2021 06:28:59 -0500
X-MC-Unique: MGbTVg3WNYSTwOrTbjEemw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDBF581EE61;
 Wed, 15 Dec 2021 11:28:57 +0000 (UTC)
Received: from localhost (unknown [10.39.195.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 615C97E675;
 Wed, 15 Dec 2021 11:28:47 +0000 (UTC)
Date: Wed, 15 Dec 2021 11:28:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] block-backend: prevent dangling BDS pointers across
 aio_poll()
Message-ID: <YbnRbuf92sNj8cSA@stefanha-x1.localdomain>
References: <20211214143542.14758-1-stefanha@redhat.com>
 <YbixZeHqqImnPbwL@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YbixZeHqqImnPbwL@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uR1hRuk4fMrx5QiY"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--uR1hRuk4fMrx5QiY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021 at 03:59:49PM +0100, Kevin Wolf wrote:
> Am 14.12.2021 um 15:35 hat Stefan Hajnoczi geschrieben:
> > The BlockBackend root child can change when aio_poll() is invoked. This
> > happens when a temporary filter node is removed upon blockjob
> > completion, for example.
> >=20
> > Functions in block/block-backend.c must be aware of this when using a
> > blk_bs() pointer across aio_poll() because the BlockDriverState refcnt
> > may reach 0, resulting in a stale pointer.
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
> > Explicitly hold a reference to bs across block APIs that invoke
> > aio_poll().
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > v2:
> > - Audit block/block-backend.c and fix additional cases
> > ---
> >  block/block-backend.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index 12ef80ea17..a40ad7fa92 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -828,10 +828,12 @@ void blk_remove_bs(BlockBackend *blk)
> >      notifier_list_notify(&blk->remove_bs_notifiers, blk);
> >      if (tgm->throttle_state) {
> >          bs =3D blk_bs(blk);
> > +        bdrv_ref(bs);
> >          bdrv_drained_begin(bs);
> >          throttle_group_detach_aio_context(tgm);
> >          throttle_group_attach_aio_context(tgm, qemu_get_aio_context())=
;
> >          bdrv_drained_end(bs);
> > +        bdrv_unref(bs);
> >      }
> > =20
> >      blk_update_root_state(blk);
>=20
> This hunk is unnecessary, we still hold a reference that is only given
> up a few lines down with bdrv_root_unref_child(root).

That's not the only place where the reference can be dropped:
bdrv_drop_filter() removes the filter node from the graph.

Here is a case where it happens: block/backup.c:backup_clean() ->
bdrv_cbw_drop() -> bdrv_drop_filter() -> bdrv_replace_node_common() ->
bdrv_replace_child_commit(). After we reach this bdrv_unref() is called
a few times and all references are dropped because the node is no longer
in the graph.

This happens during blk_remove_bs() -> bdrv_drained_begin(), so the bs
pointer in the above hunk can be stale.

Stefan

--uR1hRuk4fMrx5QiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG50W4ACgkQnKSrs4Gr
c8i/Cgf9HyPEVKwbJMNLj0NKY385Tlw7edlUomimClsQIvsBMn/BJd5xzB8IDL83
QJL+i/aZJEt7Hloj2ckX26qRNMIlHEfqRSRtX0/Td7sHiVsL5WzXdt+j9G/imLcG
6N0lKbauAsSAXZqnjGgMllSp2sCeXOnf1LhqHmvqKkn4wYstlD9Yyn+j6Qeb/e9D
RH8ap+DZXXE2p5HVQUS3uPMPbzCRKS9ZEKF2J82UvwTrUpIirq/shtGvzsS/4TzM
hHRTY27YAEz5sEE5zilyapOFZjubizKtUB+DNhiOg7fJsA0/QIPJ9S4cyJB/rxR3
UzwHxluWkPcjyFtCrvj5dZnwJcqv+Q==
=kZzB
-----END PGP SIGNATURE-----

--uR1hRuk4fMrx5QiY--


