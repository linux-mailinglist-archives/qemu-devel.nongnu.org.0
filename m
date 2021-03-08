Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4433121C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:26:53 +0100 (CET)
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHmW-0003M6-Hx
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJHdP-0002N6-Vy
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJHdN-0005sd-8x
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615216643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j3StYLloDS3kczxpH4ftxbUzrmLXw6Q8IbWqxohRATc=;
 b=cK0vWDXZJ7QCZSJ48GhFqFDYrdwukIzd0coYR+UcWqKaXGYeFMJp/sNrropVEF7qdf4ZNQ
 rUxf+U6aYDZNvVlwXOzzvYRMflok8a6QjN2hd2vSAV1xR3RJT+c3mAcwhXVAqqJjm8Uj0i
 d44zdwcC7LO1nA5wq0gE/ZOfHwkoREY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-IsuvMZYFNVKUbkn-8D84Aw-1; Mon, 08 Mar 2021 10:17:19 -0500
X-MC-Unique: IsuvMZYFNVKUbkn-8D84Aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9335019200C5;
 Mon,  8 Mar 2021 15:17:18 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CCA45D9CD;
 Mon,  8 Mar 2021 15:17:14 +0000 (UTC)
Date: Mon, 8 Mar 2021 15:17:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] block/file-posix: Optimize for macOS
Message-ID: <YEY/9DyFk9U87JtM@stefanha-x1.localdomain>
References: <20210305121748.65173-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210305121748.65173-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b0+B6oEhaGPdN7n9"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Konstantin Nazarov <mail@knazarov.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--b0+B6oEhaGPdN7n9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 05, 2021 at 09:17:48PM +0900, Akihiko Odaki wrote:
> This commit introduces "punch hole" operation and optimizes transfer
> block size for macOS.
>=20
> This commit introduces two additional members,
> discard_granularity and opt_io to BlockSizes type in
> include/block/block.h. Also, the members of the type are now
> optional. Set -1 to discard_granularity and 0 to other members
> for the default values.
>=20
> Thanks to Konstantin Nazarov for detailed analysis of a flaw in an
> old version of this change:
> https://gist.github.com/akihikodaki/87df4149e7ca87f18dc56807ec5a1bc5#gist=
comment-3654667
>=20
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  block/file-posix.c    | 40 ++++++++++++++++++++++++++++++++++++++--
>  block/nvme.c          |  2 ++
>  block/raw-format.c    |  4 +++-
>  hw/block/block.c      | 12 ++++++++++--
>  include/block/block.h |  2 ++
>  5 files changed, 55 insertions(+), 5 deletions(-)

The live migration compatibility issue is still present. Migrating to
another host might not work if the block limits are different.

Here is an idea for solving it:

Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
support a new value called "host". The default behavior remains
unchanged for live migration compatibility but now you can use "host" if
you know it's okay but don't care about migration compatibility.

The downside to this approach is that users must explicitly say
something like --drive ...,opt_io_size=3Dhost. But it's still better than
the situation we have today where user must manually enter values for
their disk.

Does this sound okay to everyone?

Stefan

--b0+B6oEhaGPdN7n9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGP/QACgkQnKSrs4Gr
c8iSeAf/X52/ZFGMjCVSY48E+xJLWqdsvMllGOg9wb/hhM+JKiAlXsUIkShM4kts
jaONO3KTQ066nGcy446J7yvZpq9ofBzIq0E4f/xpEB+muZqbKlqU10Zr/dKYYMaF
WgzQGcNWUsgSAPHGsYsdNfKAGOn6J61LLPN/WZ6YP0b06pZ5rMnm4HyLHH0j/zR2
uXmjYJARltSjl1xwsGDcY3ukUTc6GrQW/tj58U0yZdv3n06tdJsN0zOviuYUJG1+
0fpmH/JcXGIZUyQKqLOq6pR+5duquMqECVo6/ngiym69UacRrbcfydQ0ou2bbROY
t6wuAJs02vFUIIYxMn0DJv4GrWSG4A==
=bY46
-----END PGP SIGNATURE-----

--b0+B6oEhaGPdN7n9--


