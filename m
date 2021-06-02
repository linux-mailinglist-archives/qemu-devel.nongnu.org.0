Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AF73980D4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 07:53:42 +0200 (CEST)
Received: from localhost ([::1]:44540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loJoy-0001se-Kp
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 01:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1loJo7-0001DT-LA
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 01:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1loJo4-0001nV-Gx
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 01:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622613162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YavqWbyDNuNP3ttp66ys6n268f6dpeMvZiOAme5c+Yg=;
 b=cRLb/yoxK/fX3w8aCknCV5C/QbepaxowaHxHR7LVopTB77cWHVTKe2xGky2Qy3Lcz4gugr
 M4AEkNwUYYa2vtn1ma6c5LwndTilFL5IxHyoYVBy8/jHzCiVCtK/neALOReJ+Va74zSSWj
 Tki20chMN1xm/tXguYLno10EyeEshL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-XJ0p9K4fPkSaSJntfqMxZw-1; Wed, 02 Jun 2021 01:52:40 -0400
X-MC-Unique: XJ0p9K4fPkSaSJntfqMxZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DA4C801817;
 Wed,  2 Jun 2021 05:52:39 +0000 (UTC)
Received: from localhost (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E239760C0F;
 Wed,  2 Jun 2021 05:52:38 +0000 (UTC)
Date: Wed, 2 Jun 2021 07:52:38 +0200
From: Sergio Lopez <slp@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/2] nbd/server: Use drained block ops to quiesce the
 server
Message-ID: <20210602055238.7e4lnkfzvqafudzz@mhamilton>
References: <20210601055728.90849-1-slp@redhat.com>
 <20210601055728.90849-3-slp@redhat.com>
 <20210601212907.hc4u4hgjxml5aqjd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601212907.hc4u4hgjxml5aqjd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hpqtmvgyvb6x7chm"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hpqtmvgyvb6x7chm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 04:29:07PM -0500, Eric Blake wrote:
> On Tue, Jun 01, 2021 at 07:57:28AM +0200, Sergio Lopez wrote:
> > Before switching between AioContexts we need to make sure that we're
> > fully quiesced ("nb_requests =3D=3D 0" for every client) when entering =
the
> > drained section.
> >=20
> > To do this, we set "quiescing =3D true" for every client on
> > ".drained_begin" to prevent new coroutines to be created, and check if
>=20
> s/to be created/from being created/
>=20
> > "nb_requests =3D=3D 0" on ".drained_poll". Finally, once we're exiting =
the
> > drained section, on ".drained_end" we set "quiescing =3D false" and
> > call "nbd_client_receive_next_request()" to resume the processing of
> > new requests.
> >=20
> > With these changes, "blk_aio_attach()" and "blk_aio_detach()" can be
> > reverted to be as simple as they were before f148ae7d36.
>=20
> Is that reversion planned to be patch 3 of your series in v2?

Actually, we need part of the changes introduced in f148ae7d36, so
it's probably simpler to manually revert "blk_aio_attach()" and
"blk_aio_detach()" here than doing an actual reversion and then
reintroducing the changes.

Thanks,
Sergio.

--hpqtmvgyvb6x7chm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmC3HKMACgkQ9GknjS8M
AjUZuw//VB32g0d5LytNECYCK57/hYbPz/Gmp0rjuUNDXzzLp18SsIuq1ApMVy4Z
XuR9GXGzIdtWEGlzH1YaDwmY7RJ6HfuCwZXSZWPUJ13zrs7SPrg0apKrMBOkr1av
8iiHJ10bs0c6Vkl8XttB1FhhST7U7W4vXoAiDQFtBS3YH+rdSC7RGah6K3fnQG6d
B9NUKjdJqKPf8z+WsZEuHzFsIVHq8DaxYpgaWNDE0/0kWY0MEAsrSAhaHvSwVLma
yJ1+BwqtUbza19+49RGXFkxymU7pUtlHVJCZru7dT+Ne2Y0XAEdPkUhqTymB4S5e
k7pg2e1a2h6ifpx4fxAjxuAgIF3AcJXPctps4DC82TjOHoE0M9OpC86DU9Lwo55f
vjtGyz3WMQYJX4dRZnhzQ87wO4F1/061s5+tULTMNX+P/iXZeQtqSLbq4gdxzmZF
e68xHGZWZR6L+Agfl7ZoK4y7EFfNyzVrRYwGYc+dl5ioBm4ES/ooozfhCVYu1B27
gXbgaaLhrbz9KIwHbqaK8pYHjSHbuCwDT/1OT2gZpeXWhYvfjJfJn/RwUmhq7ltN
ZxtIFOgaLuBgFTlx4Y15e8Nt4L2I8Dx+tpaLV+OHGtU7YdLK6kCuRslkikrbEn9X
fbkmOiKfdeqdpf7p82AKgeBw+stm4ZQKG4OxZCytMXoAopYDEI0=
=d6Bh
-----END PGP SIGNATURE-----

--hpqtmvgyvb6x7chm--


