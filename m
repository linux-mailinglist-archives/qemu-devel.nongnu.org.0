Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947A24A31C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 17:31:06 +0200 (CEST)
Received: from localhost ([::1]:50548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Q3N-0000Kz-3R
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 11:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8Q17-0006gn-St
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 11:28:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50965
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8Q16-000156-D4
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 11:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597850923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Kd2LXFR2WStC0+SUwnJ/tG5T+8hCOKl1GKkLqxGYfQ=;
 b=HTcAGs8qtZdUKNW6VwCejoztPaZcORYKtmwQe4tqsS2ZGuezX8HTI2oQE/3awgT9E36wXM
 JSbjsAkPCK7s9NV8i/K2v2M5Oz9G4zyAVg6tx8D1YIIOif3FvBH8PXEjxFmNo/MxJH4kzS
 ENoVnKkeJ5CqbEdwtfCpr9+LT5Gs624=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-Dr6r2hhKNRe2N0AgeEzLhQ-1; Wed, 19 Aug 2020 11:28:39 -0400
X-MC-Unique: Dr6r2hhKNRe2N0AgeEzLhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 058AB1DDFC;
 Wed, 19 Aug 2020 15:28:38 +0000 (UTC)
Received: from localhost (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77B93756B6;
 Wed, 19 Aug 2020 15:28:37 +0000 (UTC)
Date: Wed, 19 Aug 2020 16:28:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 02/12] block/io.c: drop assertion on double waiting
 for request serialisation
Message-ID: <20200819152836.GP366841@stefanha-x1.localdomain>
References: <20200817091553.283155-1-vsementsov@virtuozzo.com>
 <20200817091553.283155-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20200817091553.283155-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1LW0Rr0Uq98qh6Rv"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 23:05:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1LW0Rr0Uq98qh6Rv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2020 at 12:15:43PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> The comments states, that on misaligned request we should have already
> been waiting. But for bdrv_padding_rmw_read, we called
> bdrv_mark_request_serialising with align =3D request_alignment, and now
> we serialise with align =3D cluster_size. So we may have to wait again
> with larger alignment.
>=20
> Note, that the only user of BDRV_REQ_SERIALISING is backup which issues
> cluster-aligned requests, so seems the assertion should not fire for
> now. But it's wrong anyway.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/io.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)

This code was added by Paolo, CCing him.

> diff --git a/block/io.c b/block/io.c
> index ad3a51ed53..b18680a842 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -1881,7 +1881,6 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t=
 offset, uint64_t bytes,
>                            BdrvTrackedRequest *req, int flags)
>  {
>      BlockDriverState *bs =3D child->bs;
> -    bool waited;
>      int64_t end_sector =3D DIV_ROUND_UP(offset + bytes, BDRV_SECTOR_SIZE=
);
> =20
>      if (bs->read_only) {
> @@ -1893,15 +1892,7 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_=
t offset, uint64_t bytes,
>      assert(!(flags & ~BDRV_REQ_MASK));
> =20
>      if (flags & BDRV_REQ_SERIALISING) {
> -        waited =3D bdrv_mark_request_serialising(req, bdrv_get_cluster_s=
ize(bs));
> -        /*
> -         * For a misaligned request we should have already waited earlie=
r,
> -         * because we come after bdrv_padding_rmw_read which must be cal=
led
> -         * with the request already marked as serialising.
> -         */
> -        assert(!waited ||
> -               (req->offset =3D=3D req->overlap_offset &&
> -                req->bytes =3D=3D req->overlap_bytes));
> +        bdrv_mark_request_serialising(req, bdrv_get_cluster_size(bs));
>      } else {
>          bdrv_wait_serialising_requests(req);
>      }
> --=20
> 2.18.0
>=20

--1LW0Rr0Uq98qh6Rv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl89RSQACgkQnKSrs4Gr
c8j0zwf/UO3J68X2rx1fTfUiUKccVhA7gjybdLDwRUq9VSsrxispq6AqrCrKsns9
eH9BPUhPOYfnbgEAqWVbnneXyjbtJg+4a5Bp22Vyyzck/+gCGe2YajlnNU7DV8oB
G2eT4q4ytn7B5FViH+BbVv4c+PvyxsTO5LflCLJRhnpJ/MI5ZhfORWmgNYWsP2QZ
3TJqpbuxpD+7DiP8F0a+zJWktGCEahzLdxvXmvrGUZWpvEB7EI4VzK8vukzjhwEe
rASjGzng1yyGv0BZxhQKZLksd2s4JiNe9KK4POlUAawmJ9HsfzmFfc+swT1y5OeF
+ldJPweR2CnrZt2e3vgjahCzOFHHlQ==
=r6E3
-----END PGP SIGNATURE-----

--1LW0Rr0Uq98qh6Rv--


