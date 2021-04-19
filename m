Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A0363B18
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:44:46 +0200 (CEST)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMiD-0006Jy-Ud
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMgA-0004yw-Ma; Mon, 19 Apr 2021 01:42:38 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40751 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMg7-0008Qp-1d; Mon, 19 Apr 2021 01:42:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNwgp5YVBz9vFb; Mon, 19 Apr 2021 15:42:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618810950;
 bh=4EEpCrzMuD4Pmue6nINo2FTbv8bhfMMPKAivl9Rjytc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ItVVZ89c7jXJ8IefHSFZ7prN3hqHGEo4XiMz0IZkVJEsA74XpLjqWcPxtB/SNaa/Z
 w7RSI4drS0jMht0OTJCTrU9RIgyeGaHigwmeLhKV1OEwjuO4Vxvdv7nY+S6uf/FH3Y
 Jzul/o+xLGnD3iC29m8LTSz4gFB81o9OQGPkzwWA=
Date: Mon, 19 Apr 2021 15:41:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/2] spapr.h: increase FDT_MAX_SIZE
Message-ID: <YH0YHyqiyeobJC6U@yekko.fritz.box>
References: <20210408204049.221802-1-danielhb413@gmail.com>
 <20210408204049.221802-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lHmmi43Xv4t9AX1C"
Content-Disposition: inline
In-Reply-To: <20210408204049.221802-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lHmmi43Xv4t9AX1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 05:40:49PM -0300, Daniel Henrique Barboza wrote:
> Certain SMP topologies stress, e.g. 1 thread/core, 2048 cores and
> 1 socket, stress the current maximum size of the pSeries FDT:
>=20
> Calling ibm,client-architecture-support...qemu-system-ppc64: error
> creating device tree: (fdt_setprop(fdt, offset,
> "ibm,processor-segment-sizes", segs, sizeof(segs))): FDT_ERR_NOSPACE
>=20
> 2048 is the default NR_CPUS value for the pSeries kernel. It's expected
> that users will want QEMU to be able to handle this kind of
> configuration.
>=20
> Bumping FDT_MAX_SIZE to 2MB is enough for these setups to be created.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.1, thanks.

> ---
>  include/hw/ppc/spapr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index bf7cab7a2c..3deb382678 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -95,7 +95,7 @@ typedef enum {
>  #define SPAPR_CAP_FIXED_CCD             0x03
>  #define SPAPR_CAP_FIXED_NA              0x10 /* Lets leave a bit of a ga=
p... */
> =20
> -#define FDT_MAX_SIZE                    0x100000
> +#define FDT_MAX_SIZE                    0x200000
> =20
>  /*
>   * NUMA related macros. MAX_DISTANCE_REF_POINTS was taken

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lHmmi43Xv4t9AX1C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9GB8ACgkQbDjKyiDZ
s5In4RAAn7mCOhNW3wMs1xLz2v+1T84p20vFoF1z5avIrdGays45I77LQVh0y22j
w9BcpExudvohBBQu+lvPc65Jnxvg60zln5M+mJPN5EVDxWLIQiqudk5UPuJTBkir
txvLRIqTISKxENNKQyORtyW/hlkrxGr9zvZeghkHpxXQUo0rF7BLrBT+DcOz2eyp
SG+f0F3QaQJcumyHrziTQlwaWaiRcITDCyPIiCjj4xJhpJzXWovlHCnhewEmuXT7
hT5D3buCWNPEFWSpXZapey/BtSHkgOZ9jNHSytCZCHmVPPSG4pQbS3YKlDxCT4rR
GCGgfVdXNYNnWycL2rwof9pwIZBuNYEprnO9v9fdhAVhg97N+UANH9geoMuiUGcn
aeimZVHzofpvyokUKSQoAEF4napbARq6238kCHs6zJJpqZvcs4MHD8kSf64XAdYi
hZHFaKUEU4q24n4o5uS4GYPRSfxno6yzlHhUVBZtTc6mKnK9a8/q+6FXUKUZIbis
seY/thlQ3INn3f8Lovlj4oKgFhK2GAFT2KIQFFZm92NSTQBKMug5YODPXfshUGcl
Cdh2ro2fBoztvgXJZ5oZVbizpgROI2CA43mhLTxD/xZ2clS8n3mzfAF7cyX82VH8
QOj4F/tyM5Arv5YpsT+YWiisRAITy/WLRtKiGNpN0KPv0T2/kf8=
=+4Iu
-----END PGP SIGNATURE-----

--lHmmi43Xv4t9AX1C--

