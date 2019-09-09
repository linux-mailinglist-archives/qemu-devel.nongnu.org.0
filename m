Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046EEAD768
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 12:58:32 +0200 (CEST)
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7HNP-0003iw-3T
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 06:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i7HM2-0003DR-TD
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 06:57:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i7HM1-0004AO-RR
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 06:57:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33290)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i7HLz-00045i-0F; Mon, 09 Sep 2019 06:57:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5C37806A41;
 Mon,  9 Sep 2019 10:57:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-198.ams2.redhat.com
 [10.36.117.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2463960BF3;
 Mon,  9 Sep 2019 10:56:56 +0000 (UTC)
Date: Mon, 9 Sep 2019 12:56:55 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190909105655.GE17606@localhost.localdomain>
References: <20190906173201.7926-1-mlevitsk@redhat.com>
 <20190906173201.7926-3-mlevitsk@redhat.com>
 <3ac8c65d-4bca-372c-d863-1f794292f5cb@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline
In-Reply-To: <3ac8c65d-4bca-372c-d863-1f794292f5cb@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 09 Sep 2019 10:57:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] block/qcow2: fix the corruption when
 rebasing luks encrypted files
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
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-stable <qemu-stable@nongnu.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 06.09.2019 um 21:17 hat Eric Blake geschrieben:
> > -        assert((offset_in_cluster & ~BDRV_SECTOR_MASK) =3D=3D 0);
> > +        assert((guest_offset & ~BDRV_SECTOR_MASK) =3D=3D 0);
> > +        assert((host_offset & ~BDRV_SECTOR_MASK) =3D=3D 0);
> >          assert((bytes & ~BDRV_SECTOR_MASK) =3D=3D 0);
>=20
> Pre-existing, but we could use QEMU_IS_ALIGNED(x, BDRV_SECTOR_SIZE) for
> slightly more legibility than open-coding the bit operation.
>=20
> Neat trick about power-of-2 alignment checks:
>=20
> assert(QEMU_IS_ALIGNED(offset_in_cluster | guest_offset |
>                        host_offset | bytes, BDRV_SECTOR_SIZE));
>=20
> gives the same result in one assertion.  (I've used it elsewhere in the
> code base, but I'm not opposed to one assert per variable if you think
> batching is too dense.)

A possible downside of this is that if a user reports an assertion
failure, you can't tell any more which of the variables ended up in a
bad state.

If you're lucky, you can still tell in gdb at least if the bug is
reproducible, but I wouldn't be surprised if in release builds, half of
the variables were actually optimised away, so that even this wouldn't
work.

Kevin

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJddi/3AAoJEH8JsnLIjy/Wci0P/1DSiFGPnBQMqzfw66xqlhk+
U58zMN0WtPUC8W2eFu+TlQYTUbEKSyToFh09wdHtteVC/eY3VYT6F7oGouZ2eKlv
iJ92Ln1GgLLuyBG/HY9TPfB1fBFqplJiP35KTQv99XaVWkQnNedbP5Ej7vOX6g5P
uKKvRp3E446d5Pl0dsE4ItbEY0Vr0o3UbzAgp7xPxs7V0v29YnhN+/I9205hBABZ
6Uz2EsUJnW/XxGmfz0rfVCRdYJL1SBTMRpbbTBd69xA9cH7Me6UpFO4qbZl75PyK
hRWy4qvyBuBsQxN27ytpCkaiZLSAajzRtcctFLm/PeCALCt4M8+JdYkv2AQuJcCM
JqFvMfqgQ6O1qPFz5DtJnIrhKJCUe7VUfvTZ/6Ko8/TR36EBeECCggFzbojnaTCP
7yff3CJipQExxBJU3Dzf78d9HyG9vdmPd8m4ZZZdHWdDAGi2TZLFX/uI5GlvnPaU
l7mZgs16b6RrebjgeTGO72yre/wXRWXryHd5roSlkce+QOHQxBMDOxIX47pbu4Fq
Lxab0alX+uEx+z09P5ThYd4P6rGrTJ4ZsWZo03a+9UA7vY2ZK2HXYITpThZAsnY0
nisK3v6A5y3AfBu1Z8SXy9HeLo9NiZBn5kXm8AUgsl6DQOZlDAZPXCrJV/fj/xEu
TJnES8oY8sZfiqfJ/NMT
=rVaQ
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--

