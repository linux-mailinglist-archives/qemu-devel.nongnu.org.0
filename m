Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF62E34CA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:42:04 +0100 (CET)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnAJ-00039e-Pc
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy8-0002WX-Kt; Mon, 28 Dec 2020 02:29:28 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:49117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy6-0000PW-MX; Mon, 28 Dec 2020 02:29:28 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D48Lh2qL3z9sX7; Mon, 28 Dec 2020 18:29:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609140556;
 bh=lJhQiGV2vK51p2WppUgxpOwc/JDw9wOOAVcSykUKQ0U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eIKfdkoV7tuzBMTGehLw+xg/z88svNfeM0PA27/spkPY5EU8TzGRxA1TEWCYO1xRl
 PApLZRt4zZbI362oDDOwaBtmOcWoK/DwcfXLPGH+YyT8tonrVLF8XA5n2JWxEw7oj6
 DFMJMwvJ+nlcBiBU7trvHRNHCVl0cDlzAGklYSus=
Date: Mon, 28 Dec 2020 18:29:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 4/6] spapr: Use spapr_drc_reset_all() at machine reset
Message-ID: <20201228072908.GJ6952@yekko.fritz.box>
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-5-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ELVYuRnMxQ5nnKRy"
Content-Disposition: inline
In-Reply-To: <20201218103400.689660-5-groug@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ELVYuRnMxQ5nnKRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 11:33:58AM +0100, Greg Kurz wrote:
> Documentation of object_child_foreach_recursive() clearly stipulates
> that "it is forbidden to add or remove children from @obj from the @fn
> callback". But this is exactly what we do during machine reset. The call
> to spapr_drc_reset() can finalize the hot-unplug sequence of a PHB or a
> PCI bridge, both of which will then in turn destroy their PCI DRCs. This
> could potentially invalidate the iterator used by do_object_child_foreach=
().
> It is pure luck that this haven't caused any issues so far.
>=20
> Use spapr_drc_reset_all() since it can cope with DRC removal.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied, thanks.

> ---
>  hw/ppc/spapr.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 43dded87f498..8528bc90fec4 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1566,19 +1566,6 @@ void spapr_setup_hpt(SpaprMachineState *spapr)
>      }
>  }
> =20
> -static int spapr_reset_drcs(Object *child, void *opaque)
> -{
> -    SpaprDrc *drc =3D
> -        (SpaprDrc *) object_dynamic_cast(child,
> -                                                 TYPE_SPAPR_DR_CONNECTOR=
);
> -
> -    if (drc) {
> -        spapr_drc_reset(drc);
> -    }
> -
> -    return 0;
> -}
> -
>  static void spapr_machine_reset(MachineState *machine)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(machine);
> @@ -1633,7 +1620,7 @@ static void spapr_machine_reset(MachineState *machi=
ne)
>       * will crash QEMU if the DIMM holding the vring goes away). To avoi=
d such
>       * situations, we reset DRCs after all devices have been reset.
>       */
> -    object_child_foreach_recursive(object_get_root(), spapr_reset_drcs, =
NULL);
> +    spapr_drc_reset_all(spapr);
> =20
>      spapr_clear_pending_events(spapr);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ELVYuRnMxQ5nnKRy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/piUQACgkQbDjKyiDZ
s5JCcRAA534800f9Uu5Nc+aEqceVg+wZVSuPPg9OYGmfibrYJGE3gnFrDodt0ARA
sLiCle05xhnVm3GXeE4OhPlAU/36Mrfa7/QjcA3MAIpvURDFzG3+gZNYk1AILnQN
A7KalAHIRxEx6/ctdjnnMDdbhb+Gb6Aoabqw/piaCxTNAIvIF1s6XEOujSS3gSVH
xBQnVwyTqjQsyeT3bMJRxMTBirRDsHja/+A3pspaKO86Dc0LzkxDTxKhw3E5Hik2
n5fNg124D2flLlH5rkGxKT3EMhadJeq9CnnrESZEy8WhunX5FRfH0Dz2wuxjtUgR
MG6aPHEj04GzRgK6RDlNystu4ukci/TmNdPFgkOs78Sqt01Daxr30xOomWKL3tVC
i6chPsz4UCn3ZlXe11L6sQjZh+xxPhMy1pf/nEagrYX4MlQzeopCGhUbzmy1P43l
C1c1XteVh2b1tMcEx6GIzulFxLpbT8WLlrs1sM46/8dHjEFT2SP6Tv3ySvLZQQVJ
qtirGYhiyHnZu83y/T0zhJqSsuCGHWCyLCDXyHeN9CySviho/wxk/0YpWxB20/HB
WvyP2vE+yAQQ0WyuI0uvMC5Z/QM9ycmSlB7OfqvwoXI9/XRbgxUoQx+Wrb4cuyvc
8PkpvAnEi1qRmwB2JQH0y1ueNIUsK6X3OK7xOB7hF3sH6jMRG/g=
=hm9W
-----END PGP SIGNATURE-----

--ELVYuRnMxQ5nnKRy--

