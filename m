Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B233437DC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:21:02 +0100 (CET)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOC3o-0006AR-QX
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv1-0006Mw-A1; Mon, 22 Mar 2021 00:11:55 -0400
Received: from ozlabs.org ([203.11.71.1]:60133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBuv-0004gZ-KB; Mon, 22 Mar 2021 00:11:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzy6fzsz9sWV; Mon, 22 Mar 2021 15:11:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386302;
 bh=n3nPplATF2Wpe1U1kj6mF5c1yxnbJAVHWBUx7U+ajE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KJPcusHVgIRndJhgPVun4Xz60d5HqMSoZ706nZRHuoENgxQnuYwFhJ+Sqrv5CdJS+
 51ZN87gITsgSm8fdoB9Wl7sAFOzsc9BSySzWm/jZeAMSqnf2lFBtRi4/eV65ii89vX
 LyAdMealcVjL2JGcx3TLcxXU6k08MUcT/UGizimg=
Date: Mon, 22 Mar 2021 14:22:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/net: fsl_etsec: Tx padding length should exclude CRC
Message-ID: <YFgNZFAKjVhder2R@yekko.fritz.box>
References: <20210316081505.72898-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GIYpTgZAiTEKiqat"
Content-Disposition: inline
In-Reply-To: <20210316081505.72898-1-bmeng.cn@gmail.com>
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GIYpTgZAiTEKiqat
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 04:15:05PM +0800, Bin Meng wrote:
> As the comment of tx_padding_and_crc() says: "Never add CRC in QEMU",
> min_frame_len should excluce CRC, so it should be 60 instead of 64.

Sorry, your reasoning still isn't clear to me.  If qemu is not adding
the CRC, what is?  Will it always append a CRC after this padding is
complete?

>=20
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>=20
>  hw/net/fsl_etsec/rings.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index d6be0d7d18..8f08446415 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -259,7 +259,7 @@ static void process_tx_bd(eTSEC         *etsec,
>                  || etsec->regs[MACCFG2].value & MACCFG2_PADCRC) {
> =20
>                  /* Padding and CRC (Padding implies CRC) */
> -                tx_padding_and_crc(etsec, 64);
> +                tx_padding_and_crc(etsec, 60);
> =20
>              } else if (etsec->first_bd.flags & BD_TX_TC
>                         || etsec->regs[MACCFG2].value & MACCFG2_CRC_EN) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GIYpTgZAiTEKiqat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYDWQACgkQbDjKyiDZ
s5LNMg/9FuSL9mVmDEnGP/2ZhCOFngdBk1d8WPwpE+/kCaw2b567wnRqle3nxsTZ
m7byoD+kW2uLjOCGaT6lnRGlMWJYg9Yp93fTPGaW4Z85fGp/O09/vJSEVfulNvXp
wAvkX5Tj9wbYn/mR5KNrlEmxKj1BhWPSK5vRxc+I02gIBBxcyN3VQNFzA1crnShI
hE80ZqPugyceCN0GNa1fMtl540x6o2WWzofFyhBmgRLqZW/r86CjRoGuX2NFp4hY
GYsKvbyoJRbyiiimD/eKAfkpZrDGB+Nln05ASeI5Uzhho+mkoF8xfkZZoVcqS+dF
3guw+8thIiTQYkm2vhGeMYUIqElA4Kou3RJrLT6cPw98rZPK+TVVfoA4OqkjOouv
KX3+euneVCjn/tXcdu34EZ4zrtvRirC/68MntB1PkNG6HjcvBXzSCSeA+F7V4e+E
iXKEz586aSdOYpaiXepvpseFNg4OBvQZAaQmIMpz5FK7PcuzCIWx4RAJIUBAlboC
eJhkiXquWWBxNUjHEmXo59NPy45JqAS41Ju9fyQNqwSW7a5Z1ptaa7EmvZBisH0j
OUIZdphf4Z/RyZMsgkqIimC+W8rwxBPYcVTtpIBUW13+ZBFpzrk8hrBJdUF/CvTU
PYaOsoMfM1eGXA6oEFwMa+xmC+FE4DVMFD/1XkQn9ORrszLku2g=
=nxDH
-----END PGP SIGNATURE-----

--GIYpTgZAiTEKiqat--

