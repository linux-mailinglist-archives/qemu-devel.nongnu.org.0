Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D3E3C684E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 03:59:01 +0200 (CEST)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m37hM-0000CV-66
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 21:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37Yk-0002Kf-2X; Mon, 12 Jul 2021 21:50:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60943 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37Yh-000717-9c; Mon, 12 Jul 2021 21:50:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GP3VG5F66z9sWk; Tue, 13 Jul 2021 11:49:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626140998;
 bh=ot32b1u2gcZuc14KS9PhPYhl3aqrqFbX6ZL9dRliSlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B/95T7+u0J5fgi+nUxgtWi56ugFXLOX9B1uYXFxXh0JGIDlB2yTQLKk7H7bq6IdjA
 TsXDdP4+kVtA34t7KA+cQYzL3Ft0PTD9cnRgU/bOOaI3raXcLXa7AuDlYOuX/7Bo8S
 p7Fzqji5RX8khMfZUsFZMTWxkeq4RyGNor6RsHcc=
Date: Tue, 13 Jul 2021 10:12:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] mv64361: Remove extra break from a switch case
Message-ID: <YOzafmzcDkRJhAUV@yekko>
References: <20210712131259.B705B7456E3@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="o3xgrNghijRqKiLO"
Content-Disposition: inline
In-Reply-To: <20210712131259.B705B7456E3@zero.eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--o3xgrNghijRqKiLO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 03:11:01PM +0200, BALATON Zoltan wrote:
> The switch case of writing PCI 1 IO base address had an extra break
> statement that made part of the code unreachable. This did not cause a
> problem as guests ususally leave this register at its default value.
>=20
> Reported-by: Coverity (CID 1458135)
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/pci-host/mv64361.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
> index 20510d8680..92b0f5d047 100644
> --- a/hw/pci-host/mv64361.c
> +++ b/hw/pci-host/mv64361.c
> @@ -687,7 +687,6 @@ static void mv64361_write(void *opaque, hwaddr addr, =
uint64_t val,
>      case MV64340_PCI_1_IO_BASE_ADDR:
>          s->pci[1].io_base =3D val & 0x30fffffULL;
>          warn_swap_bit(val);
> -        break;
>          if (!(s->cpu_conf & BIT(27))) {
>              s->pci[1].remap[4] =3D (val & 0xffffULL) << 16;
>          }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--o3xgrNghijRqKiLO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDs2n0ACgkQbDjKyiDZ
s5IEpRAAyWS1J2C7ivlRnVDKP8t6dqq3gCgInCE7Ffd81+oJ279bkckWu3SkX7/0
T/sGIUstRn2aFT4m4G1QKhUt4McNBepE3k+bKQPFXs4MQRNinEEjZGzOZyK8ghnc
3BexZ31qvnZTKPMa4Yc2yMNwijnaWjDtbHEs97yf9MEWNZQe8UtmT9I4FQVKdIDV
YuG8/VeIRUBPikLN+kLTRWc1IYMUpjHPJiHsvv2xdy9thqYD0nJB2fN9Y8xNKyCB
odg5tm4jtH/rPBHi5m16HnNPt/JNAJGBMplwyFPwcie0td1lKpuxPjJa3pA9ZMRh
h7veymaTa/icrwJ7fRqI47iJYN79jkIDkfnab1WyGXXHmkoz/RJ8NA5Jr1cBYrob
KBwET3KZ3kwaX9wT+CbrhG3+7gtH/CFEC8ciSH92dy26MfxgQhVVfWFRMWhBTKEc
T4pCBmI0ENtHGGjr6oKwvgNJx1LeFTRPzL2nvy43ots6npceJsSDS3Rq7A6lmB4F
RgZlwp3C6tFvTBv2gKg7W9Gc7HMLsMLwFElpo5eca1WsKIJEdLMdS2pmzreY0fgO
DX9cqtb3KVDSK/2KpnqhE1vaqpAK0Ce2xgVs1UrdxJMfUm1YQ52c93Q7Mdet9N9E
Ay6hbODRsgbVGGkbswcaIPGB62ya7PLsCPrQbxgpMWHxGOMQH4Q=
=+116
-----END PGP SIGNATURE-----

--o3xgrNghijRqKiLO--

