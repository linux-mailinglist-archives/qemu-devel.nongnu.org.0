Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F48412D7F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 05:32:38 +0200 (CEST)
Received: from localhost ([::1]:47952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSWWL-0004Dw-BL
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 23:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSWSW-0002py-K3; Mon, 20 Sep 2021 23:28:40 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:57277 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSWSS-0005lU-4Y; Mon, 20 Sep 2021 23:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632194910;
 bh=rqSC4bIJjfz5iwTDRB9XTBMuMhUoTpF9d4l7w8Ot3T8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SIbFIazJXUNX8aY/2Bx6+U/95FNyi5r4cztpsgrw1/8nmOgc4xZ5MRyHScvX1CYQm
 nzdLV46HB/kFfA2IzQFEQY2QNhT8JKY1iLykbQCi5ZNCh0p4VkkvqGn6jyrkNXmW07
 UVGO8nSEQY9yBOojdExAUxDtTvVjw9b8LJ1ex5RA=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HD6Mf1Wqlz9t0k; Tue, 21 Sep 2021 13:28:30 +1000 (AEST)
Date: Tue, 21 Sep 2021 13:25:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [RESEND PATCH 1/3] hw/intc: openpic: Correct the reset value of
 IPIDR for FSL chipset
Message-ID: <YUlQo68s9mxISwEs@yekko>
References: <20210918032653.646370-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VdsJWNCLXY2coTdb"
Content-Disposition: inline
In-Reply-To: <20210918032653.646370-1-bin.meng@windriver.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VdsJWNCLXY2coTdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 18, 2021 at 11:26:51AM +0800, Bin Meng wrote:
> The reset value of IPIDR should be zero for Freescale chipset, per
> the following 2 manuals I checked:
>=20
> - P2020RM (https://www.nxp.com/webapp/Download?colCode=3DP2020RM)
> - P4080RM (https://www.nxp.com/webapp/Download?colCode=3DP4080RM)
>=20
> Currently it is set to 1, which leaves the IPI enabled on core 0
> after power-on reset. Such may cause unexpected interrupt to be
> delivered to core 0 if the IPI is triggered from core 0 to other
> cores later.
>=20
> Fixes: ffd5e9fe0276 ("openpic: Reset IRQ source private members")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/584
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Since these patches are very simple and look sensible, I've applied
them to ppc-for-6.2.

However, you should note that Greg and I are both moving into other
areas and don't have much capacity for ppc maintainership any more.
Therefore I'll shortly be sending some MAINTAINERS updates moving
openpic (amongst other things) to "Orphan" status.

> ---
>=20
>  hw/intc/openpic.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
> index 9b4c17854d..2790c6710a 100644
> --- a/hw/intc/openpic.c
> +++ b/hw/intc/openpic.c
> @@ -1276,6 +1276,15 @@ static void openpic_reset(DeviceState *d)
>              break;
>          }
> =20
> +        /* Mask all IPI interrupts for Freescale OpenPIC */
> +        if ((opp->model =3D=3D OPENPIC_MODEL_FSL_MPIC_20) ||
> +            (opp->model =3D=3D OPENPIC_MODEL_FSL_MPIC_42)) {
> +            if (i >=3D opp->irq_ipi0 && i < opp->irq_tim0) {
> +                write_IRQreg_idr(opp, i, 0);
> +                continue;
> +            }
> +        }
> +
>          write_IRQreg_idr(opp, i, opp->idr_reset);
>      }
>      /* Initialise IRQ destinations */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VdsJWNCLXY2coTdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFJUKEACgkQbDjKyiDZ
s5Ju3Q/7BOTqJGQrDn168x+G9tKYwljA4EhuV5UjpCmn5oMvwCjMyOdSkI5D4O5H
C1oObEZkKOGdOyh0l09zKnsKkPIIs3PtrivyFxu9ahuVioCBsMXEWelLIlwiDG1h
CztCDW1UFBy6o8EHiruJ4TwngZF6b8zXqE+ECWQ7gnRBuYToIErNqi89u851vOSg
T8iwXKVQ/lf3VDxVHVfoNDk/ofaygFUjWwKo6cTZL4xO1vP2Dwr2K91sixhiUMBc
/ei7/WDlvXZ8Q//hdOxMR7RrhmOrHciK4O54OKCF1M3EiF2QuwBQCZrVHaCwxe91
JzC7L8dPnPE6imTQX/cXqYYvWKbggMbm8r/UWoLsf+uVA1n9xYK5uLk+/JXHJ1v6
+JA6PW2+6dhtM3VguEGL3vIUBBDEYlsU1WayCnRYamnABdu0Hr9w0Gsg6BAVSzen
R0Gjpjb8825uPG3yapLVv9BLsvotZspT5zV5QqvUUGU63kweedrO3cd+P+y2bKMd
jkXLlDRIMUbE8Oq0hCGd/Hl9usCu+lsbucFlE5pLexJYQ3j0m/q0v+AiYNPM55od
ro/NeP76hVmgmqRnoQNpspmWPizPtdPdPTic5IWM1rLad4t9WhWcl6GXh8v4/keJ
xUEILbUMZRrnaZgLIgAQM1aDwJ9Gq9FRk0G2rXz71TZf+Kb3tOQ=
=LCFz
-----END PGP SIGNATURE-----

--VdsJWNCLXY2coTdb--

