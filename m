Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB84411D8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 02:38:43 +0100 (CET)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhMHZ-0002bv-5h
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 21:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhM7I-0004Wp-KK; Sun, 31 Oct 2021 21:28:04 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:49287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhM76-0001kE-OD; Sun, 31 Oct 2021 21:28:04 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HjFlM6ypWz4xbw; Mon,  1 Nov 2021 12:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635730063;
 bh=cT0ATujkCxa+OkeeQ1CvMaXkEdRK8K1tRO2yI2VHAB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MN/Zlp4alTZ2z6H3bb6tGCwxKEPJcVVIU+pDFIzdz386tKhLP24dC9SQfZXtv/I57
 okjJflFX5uJl3NDoakpApvDtp5Mh466IuKxTHuOjKETZZlDMYsKtX9yL2u/ojCIAaO
 PYFS9wxdPLvAXmXaVTRSNd0OO7hA/SLtdt6JFcpo=
Date: Mon, 1 Nov 2021 11:24:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH v5 00/15] target/ppc: DFP instructions using decodetree
Message-ID: <YX8zq+XFYuDFCbp5@yekko>
References: <20211029192417.400707-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PRVKGcy0jM2cn9xf"
Content-Disposition: inline
In-Reply-To: <20211029192417.400707-1-luis.pires@eldorado.org.br>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PRVKGcy0jM2cn9xf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 04:24:02PM -0300, Luis Pires wrote:
> This series moves all existing DFP instructions to decodetree and
> implements the 2 new instructions (dcffixqq and dctfixqq) from
> Power ISA 3.1.
>=20
> In order to implement dcffixqq, divu128/divs128 were modified to
> support 128-bit quotients (previously, they were limited to 64-bit
> quotients), along with adjustments being made to their existing callers.
> libdecnumber was also expanded to allow creating decimal numbers from
> 128-bit integers.
>=20
> Similarly, for dctfixqq, mulu128 (host-utils) and decNumberIntegralToInt1=
28
> (libdecnumber) were introduced to support 128-bit integers.
>=20
> The remaining patches of this series move all of the already existing
> DFP instructions to decodetree, and end up removing dfp-ops.c.inc, which
> is no longer needed.

Applied to ppc-for-6.2, thanks.

>=20
> ---
>=20
> I'm resending this series because I missed adding a R-b tag on one
> of the commits in v4. I also dropped patches that were already applied and
> rebased against master.
>=20
> All of these patches are reviewed and ready to be applied.
>=20
> Changes in v5:
> - Rebased against master
> - Skipped patches that were already applied (v4 1-4)
>=20
> Changes in v4:
> - Rebased against dgibson/ppc-for-6.2
> - Skipped patches that were already applied (v3 1-4)
> - Changed divu128/divs128 to return the remainder (rth)
> - Moved changes that drop nip updates to a separate patch (rth)
>=20
> Changes in v3:
> - Split the uabs64 patch in 2
> - Included patch to fix missing zero-extension in divs128
> - Folded divisor =3D=3D 0 into the dhi =3D=3D 0 case in divu128
> - Moved udiv_qrnnd from softfloat-macros.h to host-utils.h
> - Used udiv_qrnnd in divu128
> - Replaced int with bool in divs128
> - Added unit test to check the divisor normalization in divu128
> - Removed 'inline' from times_* functions in ppc/translate.c
> - Used uadd64_overflow in mulu128
> - Removed unnecessary 'else' from decNumberIntegralToInt128
>=20
> Changes in v2:
> - Renamed abs64() to uabs64()
>=20
> Bruno Larsen (1):
>   target/ppc: Move REQUIRE_ALTIVEC/VECTOR to translate.c
>=20
> Fernando Valle (1):
>   target/ppc: Introduce REQUIRE_FPU
>=20
> Luis Pires (13):
>   libdecnumber: introduce decNumberFrom[U]Int128
>   target/ppc: Implement DCFFIXQQ
>   host-utils: Introduce mulu128
>   libdecnumber: Introduce decNumberIntegralToInt128
>   target/ppc: Implement DCTFIXQQ
>   target/ppc: Do not update nip on DFP instructions
>   target/ppc: Move dtstdc[q]/dtstdg[q] to decodetree
>   target/ppc: Move d{add,sub,mul,div,iex}[q] to decodetree
>   target/ppc: Move dcmp{u,o}[q],dts{tex,tsf,tsfi}[q] to decodetree
>   target/ppc: Move dquai[q], drint{x,n}[q] to decodetree
>   target/ppc: Move dqua[q], drrnd[q] to decodetree
>   target/ppc: Move dct{dp,qpq},dr{sp,dpq},dc{f,t}fix[q],dxex[q] to
>     decodetree
>   target/ppc: Move ddedpd[q],denbcd[q],dscli[q],dscri[q] to decodetree
>=20
>  include/libdecnumber/decNumber.h       |   4 +
>  include/libdecnumber/decNumberLocal.h  |   2 +-
>  include/qemu/host-utils.h              |  36 +++
>  libdecnumber/decContext.c              |   7 +-
>  libdecnumber/decNumber.c               | 131 ++++++++
>  target/ppc/dfp_helper.c                | 168 +++++++---
>  target/ppc/helper.h                    | 106 ++++---
>  target/ppc/insn32.decode               | 171 ++++++++++
>  target/ppc/translate.c                 |  23 +-
>  target/ppc/translate/dfp-impl.c.inc    | 419 ++++++++++++-------------
>  target/ppc/translate/dfp-ops.c.inc     | 165 ----------
>  target/ppc/translate/vector-impl.c.inc |  10 +-
>  12 files changed, 747 insertions(+), 495 deletions(-)
>  delete mode 100644 target/ppc/translate/dfp-ops.c.inc
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PRVKGcy0jM2cn9xf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF/M6sACgkQbDjKyiDZ
s5Ld4xAAh7V8vM0Q8pfhu9zTjFoD9hPFmywbYUiCF0IyzZJiBFCFqw0GP7rgwuuv
NMmqbaXFGav/q9iRlNhLKWwyyo+FcC+AXFMTNMLGd47p4Lup1U5tC+r6QXYVe8F9
qV6ml5+TLkM3URniqDlP3qkGhzjPAgDwcS9vhnzOl83p4sD0SOof7zdd6cjFGOlE
dUyLml+YPC+VUDnXYk7cPi2z1lOdFacAubFMDnTYqisG4QVD+lZ9v0ns7YDcefB2
OjRbuBH9+ObQk2eKKn4N6NiggRNwTsUtvwztMMFAa+3cBXEzdyBdrJD5fYNUA0pQ
n5pYqH2pgpcAPTCRvj6d2tGw7rlGu4LnNjiJiUomERha35xgNLIivx9oh8i7DtqB
hiGgc01QhtNeQUshb+pGKb2Heq3J8cbrpuOm92El/TQSSHZhV/5oZF/YMxUzECD2
n5LuzLfUY8jTnM9tMGM/TgnetFDk2t25IwN//pSzXzkBjn6EniZdaIZc9SH7DT5a
YA288KNOGONSOP26jNm+YEnLDWJvISF4+KdezeCdl2xIbawN7ipbwW+/OF3ogjjl
8X+sNR9A89i6MZo3silCzAzHDmsCMFA10wXEG6MF7KlxmRhyv4xBLVZlo9TR7wTe
iZZI8ofcES8o1yB/aR1ctP35gZnM0SDlAsP/qttf9uHj3vCcuwo=
=hCh9
-----END PGP SIGNATURE-----

--PRVKGcy0jM2cn9xf--

