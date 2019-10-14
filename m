Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9FDD5AFB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 08:01:54 +0200 (CEST)
Received: from localhost ([::1]:44770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJtQX-0001nX-AQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 02:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iJtNx-0000DE-NK
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 01:59:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iJtNw-0004Lp-48
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 01:59:13 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38343 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iJtNv-0004KW-D9; Mon, 14 Oct 2019 01:59:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46s7D904r7z9s4Y; Mon, 14 Oct 2019 16:59:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571032745;
 bh=c+ddTcdSARAT6mQZ51dqMv/9D4TjFZykuGsU1+UZFf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B3lqEe2/ndL61vPjed2IJJ3/hKYk5h1s72jddhExHtnwD7qSbQzS1zJ+gKe6G8SJ+
 AT5QL2p4N3N0oKpZwOpmVKY2QqHTSIt617vs29NY42tbpkrVIbpL/NRjfKgRj1+4dJ
 UONWvJA1QPBe2BwKrYvwByOtvS0mnaUiW5t1KsCA=
Date: Mon, 14 Oct 2019 16:30:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/9] ppc/pnv: Use address_space_stq_be() when triggering
 an interrupt from PSI
Message-ID: <20191014053005.GT4080@umbus.fritz.box>
References: <20191007084102.29776-1-clg@kaod.org>
 <20191007084102.29776-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1Dvf9Qz7hFaodvwE"
Content-Disposition: inline
In-Reply-To: <20191007084102.29776-3-clg@kaod.org>
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


--1Dvf9Qz7hFaodvwE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2019 at 10:40:55AM +0200, C=E9dric Le Goater wrote:
> Include the XIVE_TRIGGER_PQ bit in the trigger data which is how
> hardware signals to the IC that the PQ bits of the interrupt source
> have been checked.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-4.2, thanks.

> ---
>  hw/ppc/pnv_psi.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index a997f16bb4e6..68d0dfacfe2b 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -660,10 +660,19 @@ static void pnv_psi_notify(XiveNotifier *xf, uint32=
_t srcno)
> =20
>      uint32_t offset =3D
>          (psi->regs[PSIHB_REG(PSIHB9_IVT_OFFSET)] >> PSIHB9_IVT_OFF_SHIFT=
);
> -    uint64_t lisn =3D cpu_to_be64(offset + srcno);
> +    uint64_t data =3D XIVE_TRIGGER_PQ | offset | srcno;
> +    MemTxResult result;
> =20
> -    if (valid) {
> -        cpu_physical_memory_write(notify_addr, &lisn, sizeof(lisn));
> +    if (!valid) {
> +        return;
> +    }
> +
> +    address_space_stq_be(&address_space_memory, notify_addr, data,
> +                         MEMTXATTRS_UNSPECIFIED, &result);
> +    if (result !=3D MEMTX_OK) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: trigger failed @%"
> +                      HWADDR_PRIx "\n", __func__, notif_port);
> +        return;
>      }
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1Dvf9Qz7hFaodvwE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2kB90ACgkQbDjKyiDZ
s5LPnBAAsNhtKgV8omqpT2zHoYnzDqnpSufFt0zoIbzH72/EVWkdhT89VXqrddCM
JtDWC0To5iZogbgr5Lb46P3wzVt1ei23kN3wGb/u+enbNIt8NiK0nvhrSznvrWrZ
rFVXMJIxrWVRKKhw2GKONGzLRCLWepw5T9CO6hptowocuz/cSNet/Pi1Os1TL+O5
Pj3jBbuCv/dkNKMzfxEmXIKWxj6Lk1bd15cyrtKM1LFb8Et0OTSLpMbDSpVNvz5i
qxV/o9YnpGLDAA37zarfrLBVVe6yIZDHZu1C4STzWmjfk69QG04maN/vryhym6cA
cEDllGPANSaWoWcamB03q1yttDBAaP53zo6DNkGjdpnhtS40Ai+u9zpko5I+drwM
RZZgJLsHRjEGB9uN+xqpKVoU0lttEqmjCE871BjEwx2jlIDKbrcVP9LFODJX5CuH
ZsHS/Qf33wNJoKjLdZjhXoWeMr/trKX+r/m7vD6Q054PdLXCQwrBukvXxYz6tN6o
bhwSQw0ll3B1LSm8ghloAgI54FaUwFACASr9dOFnO3p+B0qZbx7QuXCmO4hSwNGr
XG8uCyvbcqPhvhdrIRGXtV5hEgI3YkEOhO2SZnxPIdR79nA3pXqry3RrBJk3BsU0
1SFcZHeDPCGsswfBdOeua8cRUkxOffRNlNnG/TAlgi05yXGkr7w=
=Ipwx
-----END PGP SIGNATURE-----

--1Dvf9Qz7hFaodvwE--

