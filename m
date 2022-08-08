Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB1858C224
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 05:42:31 +0200 (CEST)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKtew-00004x-Cw
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 23:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZi-0003uE-8Q; Sun, 07 Aug 2022 23:37:06 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZe-0006a5-8V; Sun, 07 Aug 2022 23:37:05 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M1MM85834z4xMW; Mon,  8 Aug 2022 13:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1659929812;
 bh=4VvvaKCJhPUo2Ye8oEnieV7F5GByqSGI8pv/QBMYplE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EmTm7LVxFxGvfFtjmwO5XzBQDOVmzJDa6ZaFrc346AOyA3078yQ+ol8XsQDz5JqHZ
 tmKRvkSgKlXpOnoEpXZUDZDMqerxGWBedl1zlPdL2sbpkIE5ghnKZr/m+/EsafBE0S
 JKslmVYkhLykxpy+kZvLdmRk3cvA/NqB3edmWHr8=
Date: Mon, 8 Aug 2022 13:23:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH for-7.2 v2 01/20] hw/arm: do not free machine->fdt in
 arm_load_dtb()
Message-ID: <YvCBwE200sVzMixz@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bPHyV/5iBO3d7ztV"
Content-Disposition: inline
In-Reply-To: <20220805093948.82561-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bPHyV/5iBO3d7ztV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 06:39:29AM -0300, Daniel Henrique Barboza wrote:
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>=20
> This is not an issue right now because there's no code that access
> machine->fdt after arm_load_dtb(), but we're going to add a couple do
> FDT HMP commands that will rely on machine->fdt being valid.
>=20
> Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
> machine->fdt. This will allow the FDT of ARM machines that relies on
> arm_load_dtb() to be accessed later on.
>=20
> Since all ARM machines allocates the FDT only once, we don't need to
> worry about leaking the existing FDT during a machine reset (which is
> something that other machines have to look after, e.g. the ppc64 pSeries
> machine).
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/arm/boot.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..9f5ceb62d2 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -684,7 +684,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
>       */
>      rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
> =20
> -    g_free(fdt);
> +    /*
> +     * Update the ms->fdt pointer to enable support for 'dumpdtb'
> +     * and 'info fdt' commands. Use fdt_pack() to shrink the blob
> +     * size we're going to store.
> +     */
> +    fdt_pack(fdt);
> +    ms->fdt =3D fdt;
> =20
>      return size;

fdt_pack() could change (reduce) the effective size of the dtb blob,
so returning a 'size' value from above rather than the new value of
fdt_totalsize(fdt) doesn't see right.

I believe some of the other patches in the series have similar concerns.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bPHyV/5iBO3d7ztV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLwgakACgkQgypY4gEw
YSJlqA/8CD358Ck1lrnt1Xfx7HqJpqx4IA8M0LUL2UBWdaL0aVME14E1GMKb80Wk
i95WJOWrf8lZilVEOkR28k2y61KK0dP5pQ/iTLSaltNXugRJwTVbeawWcqWaXYZX
tuBaA/EWUHsI37nimF6LT7DTbxscoY0VWhgysORZN6LujgojkSAdNnHxcDl9zkZY
e9BpSBLfAxzWoDBQoNQZqGuJCWLw2sfZShTw9bXYE2Vo5wI2fBGoHyz7TbKd34MF
ydsmvOS6PpbBWuzAOorYqSfmD/27mhxAOQqIq8TzZFLcbj3dNkPtbsLzMBE4Rhja
O0SVw53Qk0Rc9kesaoPcY1iQPG1bzdcUB3i3VQP0rAwXUEksgBc6KKukqopFo8Ly
vELGp5q79RmgMlS2ZEYyMPxazzpirwZcrbCLqsf/Lsg2JwCuBhANjycoTKRFLFts
Fml1jNwuAx/OyzTCKPZHV5EaBt+ZVYvAH7vgugRSgM1VaZFv6cYdyorodRABEbdR
6nQ5WrDSmlwqOs26omleQ0Bp1OQLKC5+98D/mfrH0LuU0XYp8BWbE0iyX/1MsLDd
U1zQ8l9LBvg1kcGirm06RJTxXS9v1DCPPq/PBQlu/KxU7GGC++W7HDOoBD2Aqp4R
pXHFVAJBCCWbXhnnoWAgid1dmYe/wUWJSpW9e/wAOoJEiagqgZI=
=gls5
-----END PGP SIGNATURE-----

--bPHyV/5iBO3d7ztV--

