Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50F0187641
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 00:36:50 +0100 (CET)
Received: from localhost ([::1]:50418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDzHt-000566-OD
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 19:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50384)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jDzDa-0007dV-Fq
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 19:32:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jDzDZ-0005eM-33
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 19:32:22 -0400
Received: from ozlabs.org ([203.11.71.1]:48823)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jDzDY-00057D-La; Mon, 16 Mar 2020 19:32:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48hCJJ5ps6z9sRf; Tue, 17 Mar 2020 10:32:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584401536;
 bh=7MBm6BJBxXuAZ7QWrvQ79T6NMme54v/42Wo2if0FVqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wt2HGbi1q/4RG1ZZp9wHo14fGL+AhtbGMVUwXsM3ipmh0UAysiXOqZPEfYoGpL1ov
 T3NIowdDKau7yNZsw9Z5R+dFv/qUZMXhWa9GniIBisiv+2PexOKhWLkx61ECK2P5sD
 E/uwlF5j2ZkhFNv6w6CXHVaWZBXBzHea1sQcFHD4=
Date: Tue, 17 Mar 2020 10:32:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 8/8] ppc/spapr: Ignore common "ibm,nmi-interlock"
 Linux bug
Message-ID: <20200316233206.GI20264@umbus.fritz.box>
References: <20200316142613.121089-1-npiggin@gmail.com>
 <20200316142613.121089-9-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D6z0c4W1rkZNF4Vu"
Content-Disposition: inline
In-Reply-To: <20200316142613.121089-9-npiggin@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--D6z0c4W1rkZNF4Vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2020 at 12:26:13AM +1000, Nicholas Piggin wrote:
> Linux kernels call "ibm,nmi-interlock" in their system reset handlers
> contrary to PAPR. Returning an error because the CPU does not hold the
> interlock here causes Linux to print warning messages. PowerVM returns
> success in this case, so do the same for now.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied, thanks.

> ---
>  hw/ppc/spapr_rtas.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 521e6b0b72..9fb8c8632a 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -461,8 +461,18 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>      }
> =20
>      if (spapr->fwnmi_machine_check_interlock !=3D cpu->vcpu_id) {
> -        /* The vCPU that hit the NMI should invoke "ibm,nmi-interlock" */
> -        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
> +        /*
> +	 * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
> +         * This should be PARAM_ERROR, but Linux calls "ibm,nmi-interloc=
k"
> +	 * for system reset interrupts, despite them not being interlocked.
> +	 * PowerVM silently ignores this and returns success here. Returning
> +	 * failure causes Linux to print the error "FWNMI: nmi-interlock
> +	 * failed: -3", although no other apparent ill effects, this is a
> +	 * regression for the user when enabling FWNMI. So for now, match
> +	 * PowerVM. When most Linux clients are fixed, this could be
> +	 * changed.
> +	 */
> +        rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>          return;
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--D6z0c4W1rkZNF4Vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5wDHYACgkQbDjKyiDZ
s5JcwQ/9EL0ELzyB1ya18A1m0XXZiqtMJa7qPXfrwEZkbWu12sFLOXwQXEt1BJCT
yV7yPr6u8+sUQHA0j3GtbRs7sr/zpP9CFFKKzidmyQEkI83M1YPO/i1Dc//cCcOh
rwUTkIefjaZl/b1ShXpBGVY2xEnhaCqW2OEhejA+JWVVKOPK9ftmsYcGJ5udgqAQ
rP8OLa/1rUReMBPkB30QtlS1GkXZruE5ooPBcFFP/t7oU1NJjsbSbSUf61hxBX4I
wVhl6NWSt78Ug3e65L31O5xbAQ5gScf0JEui4GoWk2wgBqGSNS/DJA09pdQCbUaJ
0Q2ogwQeKniI4So5rD/Gtaj1iQthPji8VymTam0cyZVshCzT/GzOrUNKv2q2Xzvn
uWXcyDsT59vnWONmvmUH3i7toRMUXN2MfzFM2ttEs1BsTMYaeCD1qKT+DdhugG06
tFHskOEbrLrLxAPTxP+pM6Es7uEZPDWmqg0tISrS/zxwaLPwSmOgcpaPLGIpwvln
P4Cv+6SXOvTgYBNheME1RHxRt/pr4yQcX+A4+kUbXGCakhODczGLSKhvSsSBqEd8
QoPEKvSbKA8Pct1UXsx01wsvmPSVnOOyCGFjEPk/RjoTROlBuON5EMj5ngjscX7M
Yjxbi4kvioyhBH9Sj6HVR3f0KWfVmlq44A+cYmDNhO7K5TXwA40=
=my4s
-----END PGP SIGNATURE-----

--D6z0c4W1rkZNF4Vu--

