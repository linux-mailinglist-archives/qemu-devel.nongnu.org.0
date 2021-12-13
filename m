Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1647281A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:08:29 +0100 (CET)
Received: from localhost ([::1]:52508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiFw-0005u4-Fb
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:08:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwiEJ-0004SR-HR
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:06:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwiEI-0001rk-3F
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639390005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iU7mhqPd9xnmh/bs6jo63g4/jpMZ2/rQsuUhv91Atqg=;
 b=KI75UjAoin3cIUeYKmlcp7xP88uKNq+uLHUVCkSgl+knSLVO2vcBY+9GKgGNWQu1yIN4k2
 caf1pNr+26O7g0jJaQ7iq/o9oP7sKA2kxyvGraxoFFD/aUFQ0XYb8M0jNZv/ZEKsUlHagf
 aE9CL9MBcqnbX0cF7MWi98cC0q/dGRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-289-jHt7fzm8MqGwRxF_HUlxAw-1; Mon, 13 Dec 2021 05:06:43 -0500
X-MC-Unique: jHt7fzm8MqGwRxF_HUlxAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0D0E100C667;
 Mon, 13 Dec 2021 10:06:42 +0000 (UTC)
Received: from localhost (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9B57A5C2;
 Mon, 13 Dec 2021 10:06:41 +0000 (UTC)
Date: Mon, 13 Dec 2021 10:06:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC] block-backend: prevent dangling BDS pointer in blk_drain()
Message-ID: <YbcbMEJyxKCbuK2T@stefanha-x1.localdomain>
References: <20211209142304.381253-1-stefanha@redhat.com>
 <YbNdhnxItT7zmeyn@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YbNdhnxItT7zmeyn@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9JlEErsPhK/h1Ngd"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9JlEErsPhK/h1Ngd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 03:00:38PM +0100, Kevin Wolf wrote:
> Am 09.12.2021 um 15:23 hat Stefan Hajnoczi geschrieben:
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
> They are not supposed to end up unbalanced because detaching a child
> calls bdrv_unapply_subtree_drain(). In fact, I think test-bdrv-drain
> tests a few scenarios like this.
>=20
> Do have more details about the case that failed for you?

You're right. I put the assert(bs->quiesce_counter =3D=3D 0) statement to
early in bdrv_delete(). Moving it after bdrv_close() shows that the
counter reaches 0 thanks to the bdrv_drain_all_end_quiesce() call in
bdrv_close().

Stefan

--9JlEErsPhK/h1Ngd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3GzAACgkQnKSrs4Gr
c8jISAf/X7qpEKw2/h+gqYlP4v6ICaeDTh57x/3BuqkIPSggGB8fb6rsp4DogsVf
I32tyWHjLO5Sn4hl7gI6KgrpxeuBrXx5c/XzC/DzyM+GzrbvNqBcJGehULCgnDn6
/vGpcNd7oonHeuiAbdihkaFschVc3dzgCsFa9MCa1Z61mRDJxFiFW5pGUhnwFHkF
BxYQ4NUIxvj5CAZeYiBYnnLByn1oCUKm3F7574hFbS++N0JHTDOnwHC+dWJXr8Im
p8jqGatLSzaSHAdWUV+QQ6oa/ptHjol/+qmX+iQJjMptuda/PSb6hT3as9g6hMar
eyvlBh7iAhTCaaq4oHJnCI6bqT9V/A==
=VBq6
-----END PGP SIGNATURE-----

--9JlEErsPhK/h1Ngd--


