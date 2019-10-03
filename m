Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3987C96CC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 04:46:30 +0200 (CEST)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFr8P-0001qb-57
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 22:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40637)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iFr5M-00007X-0q
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 22:43:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iFr5K-0000xP-8g
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 22:43:19 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42101)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iFr5I-0000wD-8z; Wed, 02 Oct 2019 22:43:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46kHP93QwZz9sCJ; Thu,  3 Oct 2019 12:43:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570070589;
 bh=Ak2YepIEOn2zKKfc4xWPRpfRAWskuVvrikE7yy3uoh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bWXA1bPnhQ9upDn55CyepUdazsdIRXwS6FAJU9T8HK6FxmE4gxBjBB13sppxItU3x
 njIT7cK+/P0cqVR3Y/ibXfLjkisQ2Ojt0aP0QbRm51Lx18I7tKehya8CfpfWmQgW45
 qEr9NjL+mqD5LbYh3LZk5h/kWeasq7zv2q33kuJ0=
Date: Thu, 3 Oct 2019 11:51:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 04/25] ppc/pnv: Introduce a pnv_xive_is_cpu_enabled()
 helper
Message-ID: <20191003015123.GF11105@umbus.fritz.box>
References: <20190918160645.25126-1-clg@kaod.org>
 <20190918160645.25126-5-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wtUqn8XWZYmnPFNh"
Content-Disposition: inline
In-Reply-To: <20190918160645.25126-5-clg@kaod.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wtUqn8XWZYmnPFNh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 06:06:24PM +0200, C=E9dric Le Goater wrote:
> and use this helper to exclude CPUs which were not enabled by the XIVE
> controller.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/intc/pnv_xive.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> index e1c15b6b5b71..5c97ccda1cad 100644
> --- a/hw/intc/pnv_xive.c
> +++ b/hw/intc/pnv_xive.c
> @@ -408,6 +408,14 @@ static int cpu_chip_id(PowerPCCPU *cpu)
>      CPU_FOREACH(cs)                                                     \
>          if (chip->chip_id !=3D cpu_chip_id(POWERPC_CPU(cs))) {} else
> =20
> +static bool pnv_xive_is_cpu_enabled(PnvXive *xive, PowerPCCPU *cpu)
> +{
> +    int pir =3D cpu_pir(cpu);
> +    int thrd_id =3D pir & 0x7f;
> +
> +    return xive->regs[PC_THREAD_EN_REG0 >> 3] & PPC_BIT(thrd_id);
> +}
> +
>  static int pnv_xive_match_nvt(XivePresenter *xptr, uint8_t format,
>                                uint8_t nvt_blk, uint32_t nvt_idx,
>                                bool cam_ignore, uint8_t priority,
> @@ -426,6 +434,10 @@ static int pnv_xive_match_nvt(XivePresenter *xptr, u=
int8_t format,
>          XiveTCTX *tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
>          int ring;
> =20
> +        if (!pnv_xive_is_cpu_enabled(xive, cpu)) {
> +            continue;
> +        }
> +
>          /*
>           * Check the thread context CAM lines and record matches.
>           */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wtUqn8XWZYmnPFNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2VVBsACgkQbDjKyiDZ
s5LN7g/4+c4olAwTxA++9IG99zVoEDDUSWmpcEMcIpcQ7yxR7NkNap3NiSQ5dL9c
Tu0uJPO0IIBVCeh3ctoGrQLST+2FinCm9bgGmHbSVCvaigEPmXih9ZMZylvCiIEY
o+lX3k3KoUfqkUcWGzw3F6zRsqLi6bPd9quJKKzBEx7HPq8RC49iNkgI9UTllMRd
od9MfGOexv7wtnen2V/iNROmSYmBPkglyH8yZ0/0BCV+mQK+qvyd4/Ezfl+JWr+S
oCYMMH5FzM6q9dx/rWzaegjmE538Kd+fSQOlaSGATeBj06j1aw4XmrqbuJ7USs3A
tMS9U1+xOKdt1gyZoD9M6mrWhbSftiv/nuJp8o5PBwBLPMNvSDOIbXtALcW75Mhi
N4YoIXPxJcPPIn0hZYryJFjBAXsslrQm7ZqzFOJHxf6T2HRGWswQ5qBu9T8/JllP
PitH5OYYBFPf1+KQK1eZT08/Ew/dTMw+kknudyGUcoAN1si2TGIercTsu10davqV
ek1nqpmv4hV8msCvCvlMB9FibvVOmMqq+WAo0MSytyQ6mg3IUBzZ6ufESiCuPTeC
DsV8H9qgpizS8rDH7H7KFyF29oUMZU2/U0H/prEoUmnEPkfmnJ2NCLru5LRXlBcA
1MtVPps3kC6xBNusx0u6V7c2xyRM3ZvNL3XaRfwrdGYfl2YN8g==
=ybGP
-----END PGP SIGNATURE-----

--wtUqn8XWZYmnPFNh--

