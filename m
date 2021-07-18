Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B9F3CC7FA
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 08:42:52 +0200 (CEST)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m50Vn-0003LS-SM
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 02:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m50SF-0001wc-Gi; Sun, 18 Jul 2021 02:39:11 -0400
Received: from ozlabs.org ([203.11.71.1]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m50SC-0006xP-IT; Sun, 18 Jul 2021 02:39:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GSFgR3K2Gz9sSs; Sun, 18 Jul 2021 16:38:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626590339;
 bh=pnKdEQfeX51ikTuY9/lOMnZlcCVDFaKBXOpF9Nt9mb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwDf/ahJCOn/GwHDJ+lou9owWVGNY10CXLxA75z0vikYA7pekIgIDb2VsS6G08mdD
 hRIFm2P+ty+clmLJhvHzL5udSyeR3Hn05Uk+Djr/pq9t/xdwDjHJ4rMd7dzVBjzIaU
 KHvMjp+8McL3soOVZOo6s9wQtAH3Qm0ez+APvIEg=
Date: Sun, 18 Jul 2021 16:24:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 2/2] i2c/smbus_eeprom: Add feature bit to SPD data
Message-ID: <YPPJM7s6mA7BedBA@yekko>
References: <cover.1626367844.git.balaton@eik.bme.hu>
 <19d42ade295d5297aa624a9eb757b8df18cf64d6.1626367844.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fuGFJT4RPdLQapE2"
Content-Disposition: inline
In-Reply-To: <19d42ade295d5297aa624a9eb757b8df18cf64d6.1626367844.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fuGFJT4RPdLQapE2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 15, 2021 at 06:50:44PM +0200, BALATON Zoltan wrote:
> Add the differential clock input feature bit to the generated SPD
> data. Most guests don't seem to care but pegasos2 firmware version 1.2
> checks for this bit and stops with unsupported module type error if
> it's not present. Since this feature is likely present on real memory
> modules add it in the general code rather than patching the generated
> SPD data in pegasos2 board only.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> I've tested it with the firmware of pegasos2, sam460ex, fuloong2e and
> g3beige (latter is not upstream yet) that are the only ones using this
> function currently. Probably this could go in via PPC tree with my
> other pegasos2 fix if respective maitainers ack this patch.
>=20
>  hw/i2c/smbus_eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This isn't really my area, so I'd need acks to take it through my
tree.


>=20
> diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
> index 4d2bf99207..12c5741f38 100644
> --- a/hw/i2c/smbus_eeprom.c
> +++ b/hw/i2c/smbus_eeprom.c
> @@ -276,7 +276,7 @@ uint8_t *spd_data_generate(enum sdram_type type, ram_=
addr_t ram_size)
>      spd[18] =3D 12;   /* ~CAS latencies supported */
>      spd[19] =3D (type =3D=3D DDR2 ? 0 : 1); /* reserved / ~CS latencies =
supported */
>      spd[20] =3D 2;    /* DIMM type / ~WE latencies */
> -                    /* module features */
> +    spd[21] =3D (type < DDR2 ? 0x20 : 0); /* module features */
>                      /* memory chip features */
>      spd[23] =3D 0x12; /* clock cycle time @ medium CAS latency */
>                      /* data access time */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fuGFJT4RPdLQapE2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDzyTMACgkQbDjKyiDZ
s5IVSw//ZcaDWVm5SH1oKJLYMyoOqDiBsPuzHCXhxKHwc5QWWF2IXyOItuEeHOHQ
AaF9twIWhjYZg9gMbtsaZBJ+Qa1pma4CyW4B8tiBwcFZNkPp5hhSC3UzaMaLidHR
pQkz/6rcW591VzwAAEzg1I90Vun0Ghszi6NpSip7EKi/Yy2utgsr/0iXC1Yu+0Yp
eMT/zg62+zd85RjEGnOpQXYmk58w4kwKx0Czbnygy8PaFKbho2pMgRqDlhMI/DD9
pDdbQqLvX345qeIUD4y2vFoSGMJmQn0ev7Qi5/edFgggTg4ia0jcQQaG1IYT1ky6
2deS8m+19hIw/FuTz0LIdGMWcRle+2XHkH8cbQXvkJYkA5WDlVl70TaWKrwXl0zc
rahxfbV3khqIxG/hUSdhLsChLKTo/4uT+BQqwKuPBVokw4vgR1VJng2hvG9yRUrQ
IYRe6egyN08wgakpVcqZwHCDt6U3k+vBTfOVXXfH8R9A/Q0kB4XZvwrTKlqxDp1G
aXl8ZbPhhzdStBYRDtgTXiIig3+Q9FYBIOmDg1e75fKLi+eE/pHcVLtSvVW8pCVS
gmVsFT3lhg56zWJxtVR4ek4Gv34ZcIWrWUeHN0g4zBLyM4DBtYrc7CWqVciMKdwm
lUppZG7XhTkBKgFeHHvrU8mW6kh+6ZlrbzTWgK+cBJRXmpJhZGs=
=ktd9
-----END PGP SIGNATURE-----

--fuGFJT4RPdLQapE2--

