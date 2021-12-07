Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51046AF9E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 02:18:25 +0100 (CET)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muP7f-00020l-VC
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 20:18:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1muP4H-00013r-Cu; Mon, 06 Dec 2021 20:14:53 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:40547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1muP4C-0008JG-LR; Mon, 06 Dec 2021 20:14:52 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J7MlL6XDNz4xgq; Tue,  7 Dec 2021 12:14:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638839662;
 bh=IHvDvwGwcWbz0oQQgDAbpiONUrlZrqloLuqsdmaLuCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFyGRHPuF0ajbhLwBPAFwnJpbBm3aKDrzeF/GVhAV7mn0p1hfRgmVRYM0HG/CrZ41
 HoG6osR9KQ/zT7fQaPc0CHGvsYWQZ9+TWVoOSwE7bCzNFz2XhUvk0ArEGrrH0cxk8I
 IotdcjtCvACMBwFUQl6GujqRgS9kGPUY0kQxAYIo=
Date: Tue, 7 Dec 2021 11:09:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2] ppc/pnv.c: fix "system-id" FDT when -uuid is set
Message-ID: <Ya6mHauaGPv7HwYf@yekko>
References: <20211206130253.630655-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H63+JKMgn4B/5XqZ"
Content-Disposition: inline
In-Reply-To: <20211206130253.630655-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--H63+JKMgn4B/5XqZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 10:02:53AM -0300, Daniel Henrique Barboza wrote:
> Setting -uuid in the pnv machine does not work:
>=20
> ./qemu-system-ppc64 -machine powernv8,accel=3Dtcg  -uuid 7ff61ca1-a4a0-4b=
c1-944c-abd114a35e80
> qemu-system-ppc64: error creating device tree: (fdt_property_string(fdt, =
"system-id", buf)): FDT_ERR_BADSTATE
>=20
> This happens because we're using "fdt_property_string" to retrieve a
> "system-id" attribute that does not exist, instead of using
> fdt_setprop_string() to create a "system-id" attribute with the uuid
> provided via command line.

Fix is correct but this description isn't really accurate.
fdt_property_string() is a "sequential write" function, only used when
you're building a new DT up from scratch, which is an entirely
different mode from read/write access to an existing tree.  Using when
the tree is in read-write state will cause an immediate BADSTATE
error; whether the property exists already or not is irrelevant.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>=20
> changes from v1:
> - fixed typo in commit title
>=20
>=20
>  hw/ppc/pnv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 32ab8071a4..9e532caa9f 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -552,7 +552,7 @@ static void *pnv_dt_create(MachineState *machine)
>      buf =3D  qemu_uuid_unparse_strdup(&qemu_uuid);
>      _FDT((fdt_setprop_string(fdt, 0, "vm,uuid", buf)));
>      if (qemu_uuid_set) {
> -        _FDT((fdt_property_string(fdt, "system-id", buf)));
> +        _FDT((fdt_setprop_string(fdt, 0, "system-id", buf)));
>      }
>      g_free(buf);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--H63+JKMgn4B/5XqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGuph0ACgkQbDjKyiDZ
s5LyahAAw0AgpgKs4v7ZQ66kUzxFanXzrMP7tjpoc8/mIBhA+BV25et5IM7Kwj0X
ixXzu6neiR66vU2JcbgnE9bod34F9h6eDek9Oij50dmPVwg7jJNyOUWq0gx5gn0b
8F7U4WkGFAmUfyfN/tdgNq1M3WYsRGl9gx+bjwKlAUaKbqaVWzrkXZ+oaJ6Fdbis
Ak50Ak2MgV1szchJCH5UjGr97VTcxJtZ0JN2xKBlfnCo4NhCIitxTEYdUZdT8Ll3
TGP+OYFFF0PBKkERyUSaGuKP9uT+KGDCRHnmMGQkxb3vYB6Z5CoQeWD6wS1jsWrh
W7KM/D/MaNn9uQxUs9jHtmIUDY+wk9Y3VE9exu9BiEqchtXNBUu7ctakHQUpKe6U
eV3TTcOLHoOc3zGJDxKyD03XCRDunLPEZDZmaIUHNMx91L9C0YE/iotBfI3Ayldw
LtkI/N9cFQGSfJPXPE49P0G59x3oWg6pFGhGQHoRlAsZR+mnOqWlis4guG3WL2M9
GMW1dlNyLIJVm1yeYtT4sYqJrilj8wYrgYZPs9Fn5AEYi31UIWR1oe4TlxNa65VF
aTZw4rWHlPOLHQNF5hJPvcYHEHAzwzkJsBQHsaojDd5HXU0fRYoikKSTSsIfjXmr
eLz7vmq5BOFvS7mGr2/Qlm47jCqb1qRKi9w5NkEmdWi0WeAil2k=
=TOYE
-----END PGP SIGNATURE-----

--H63+JKMgn4B/5XqZ--

