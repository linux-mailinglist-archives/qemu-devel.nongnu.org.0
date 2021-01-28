Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF6306AB3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 02:49:58 +0100 (CET)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wRZ-0003WL-Ux
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 20:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO9-000819-88; Wed, 27 Jan 2021 20:46:25 -0500
Received: from ozlabs.org ([203.11.71.1]:40979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO7-0005Bp-BX; Wed, 27 Jan 2021 20:46:24 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DR3GT53Dqz9sWK; Thu, 28 Jan 2021 12:46:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611798369;
 bh=IW5Xfkmzcv+6Ba19+8lxFIhkmOKqXd7A1mzh4DT3aa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jn8OyKkRy1vpnAc1MORk9Uq2t0L/VCrYwg4C+I8syHKu4K+Q0qo2JAGHVzNUHVWwi
 XMWBRFiLm239BzZ8GGRj7RvxqOkXA4ugYUlr26wAHTomhOaAV1mC1QMpZISGz6QSZA
 DwCSKvA9nlwOS2MhF/DORCttS0D11n3JxksZmOVI=
Date: Thu, 28 Jan 2021 11:50:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 5/7] ppc/pnv: Discard internal BMC initialization when
 BMC is external
Message-ID: <20210128005059.GH18347@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-6-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LiQwW4YX+w4axhAx"
Content-Disposition: inline
In-Reply-To: <20210126171059.307867-6-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--LiQwW4YX+w4axhAx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 06:10:57PM +0100, C=E9dric Le Goater wrote:
> The PowerNV machine can be run with an external IPMI BMC device
> connected to a remote QEMU machine acting as BMC, using these options :
>=20
>   -chardev socket,id=3Dipmi0,host=3Dlocalhost,port=3D9002,reconnect=3D10 \
>   -device ipmi-bmc-extern,id=3Dbmc0,chardev=3Dipmi0 \
>   -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 \
>   -nodefaults
>=20
> In that case, some aspects of the BMC initialization should be
> skipped, since they rely on the simulator interface.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/pnv_bmc.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 86d16b493539..b9bf5735ea0f 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -51,6 +51,11 @@ typedef struct OemSel {
>  #define SOFT_OFF        0x00
>  #define SOFT_REBOOT     0x01
> =20
> +static bool pnv_bmc_is_simulator(IPMIBmc *bmc)
> +{
> +    return object_dynamic_cast(OBJECT(bmc), TYPE_IPMI_BMC_SIMULATOR);
> +}
> +
>  static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t reboot)
>  {
>      /* IPMI SEL Event are 16 bytes long */
> @@ -79,6 +84,10 @@ void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt)
>      const struct ipmi_sdr_compact *sdr;
>      uint16_t nextrec;
> =20
> +    if (!pnv_bmc_is_simulator(bmc)) {
> +        return;
> +    }
> +
>      offset =3D fdt_add_subnode(fdt, 0, "bmc");
>      _FDT(offset);
> =20
> @@ -243,6 +252,10 @@ static const IPMINetfn hiomap_netfn =3D {
> =20
>  void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
>  {
> +    if (!pnv_bmc_is_simulator(bmc)) {
> +        return;
> +    }
> +
>      object_ref(OBJECT(pnor));
>      object_property_add_const_link(OBJECT(bmc), "pnor", OBJECT(pnor));
> =20
> @@ -286,7 +299,7 @@ static int bmc_find(Object *child, void *opaque)
> =20
>  IPMIBmc *pnv_bmc_find(Error **errp)
>  {
> -    ForeachArgs args =3D { TYPE_IPMI_BMC_SIMULATOR, NULL };
> +    ForeachArgs args =3D { TYPE_IPMI_BMC, NULL };
>      int ret;
> =20
>      ret =3D object_child_foreach_recursive(object_get_root(), bmc_find, =
&args);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LiQwW4YX+w4axhAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmASCnMACgkQbDjKyiDZ
s5JbJRAAvsaZ/4m8wb3/Ol/7F3YMI0accyWARZjrbyCME1fwrEHAwyn6OpGiiaMq
89cL7e/wwk0z/fcTCH+MFunANqCpBToKAuxrC+PQYzB+wdowtRXinw4o5qUVU1Dd
1Dz4riCyecvMguJ/ucFxacNQfKBzy1DszCC/zkW7v/M7DHXH3fCKakrNiBJ+wnGd
Z3D3uIdBDA49yzdIQNYtwfxoODeZ9/KpjaEE4sbkVSjd6XJLLVYA13WenRLprMhR
4oYdJRQQW7IIGGxjz5MeW49xQFtOOM7IaWsl7scA/DJET/4GI8nP2kv9QooRW3Oa
RK4sV3GLdoa/lqryGoWmlpZ0hrPh2MgBVDz7fxOvo333mLgTsYbHN7Ciyo5q6M0Q
FEguhAhRnlrYmv4R5W/kA/yE1BiVQAvpPp9Qadrb4/h8P+cYa0MH/jGhbipfO7+V
ckqvqdyLRysQ5W+VwzutQXYfw/ahJsR1V03V4uG4J2EtjH3dWSexAY0fAxoVubVt
SbzW0IfqfmZVyCecbFuKeeFvvCAWF1wdknDqDquy+hqcwQ6xrHVEq/+iO7CYtF9S
O9Ru4IfDpYi/bT8mIZzLIXsTARELAuOoiwCnCzSuE0/CNE1KCnzW/wuHTgGZwkXd
+iTLiw/xnlvPhPVdTI0VFjE9F68b+D3IKscjba+siTWHWE2xQ3Y=
=vB7C
-----END PGP SIGNATURE-----

--LiQwW4YX+w4axhAx--

