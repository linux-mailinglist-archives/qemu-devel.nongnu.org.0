Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644534D6DC3
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 10:36:53 +0100 (CET)
Received: from localhost ([::1]:35892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSyB9-0007F4-Vs
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 04:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nSxvD-0007CU-FE; Sat, 12 Mar 2022 04:20:24 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:59147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nSxv9-0005a3-0Z; Sat, 12 Mar 2022 04:20:22 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KFy1z2cmwz4xMW; Sat, 12 Mar 2022 20:20:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647076807;
 bh=8u994h1WNs/hrkh4rEdS9ntSPZ5+rALmmEHL+xmMW1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gWQfChF871VP6KO2R5/Wx0ImGtL36YMO2mk8VhzCtzJYigslfJTkvf3EDTsmcHjCx
 PWgEZvBMgzPLGXU2O/RzGPJ054VgE+ddRk+npBUJM3KU7/4EVMnheWGCWwirAD2VMZ
 KhDybj9lgge29N5gsdsXHfqRvTTUBhFPstvZL0co=
Date: Sat, 12 Mar 2022 19:45:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/4] target/ppc: Fix masked PVR matching
Message-ID: <YixdxnawYgQi9b1H@yekko>
References: <20220307065527.156132-1-npiggin@gmail.com>
 <20220307065527.156132-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6mQLb1fX6awFzEFv"
Content-Disposition: inline
In-Reply-To: <20220307065527.156132-2-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6mQLb1fX6awFzEFv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 04:55:24PM +1000, Nicholas Piggin wrote:
> The pvr_match for a CPU class is not supposed to just match for any
> CPU in the family, but rather whether this particular CPU class is the
> best match in the family.

Ok... but I don't see how that question can possibly be answered
without reference to all the available options.

> Prior to this fix, e.g., a POWER9 DD2.3 KVM host matches to the
> power9_v1.0 class (because that's first in the list). After the patch,
> it matches the power9_v2.0 class.

=2E. so, doesn't this indicate a problem in the check order, rather than
a problem with the matching function?

>=20
> Fixes: 03ae4133ab8 ("target-ppc: Add pvr_match() callback")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  target/ppc/cpu_init.c | 51 ++++++++++++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 17 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 073fd10168..83ca741bea 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5910,13 +5910,14 @@ static void init_proc_POWER7(CPUPPCState *env)
> =20
>  static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr)
>  {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) =3D=3D CPU_POWERPC_POWER7P=
_BASE) {
> -        return true;
> -    }
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) =3D=3D CPU_POWERPC_POWER7_=
BASE) {
> -        return true;
> +    uint32_t base =3D pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base =3D pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (base !=3D pcc_base) {
> +        return false;
>      }
> -    return false;
> +
> +    return true;
>  }
> =20
>  static bool cpu_has_work_POWER7(CPUState *cs)
> @@ -6070,16 +6071,14 @@ static void init_proc_POWER8(CPUPPCState *env)
> =20
>  static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr)
>  {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) =3D=3D CPU_POWERPC_POWER8N=
VL_BASE) {
> -        return true;
> -    }
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) =3D=3D CPU_POWERPC_POWER8E=
_BASE) {
> -        return true;
> -    }
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) =3D=3D CPU_POWERPC_POWER8_=
BASE) {
> -        return true;
> +    uint32_t base =3D pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base =3D pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (base !=3D pcc_base) {
> +        return false;
>      }
> -    return false;
> +
> +    return true;
>  }
> =20
>  static bool cpu_has_work_POWER8(CPUState *cs)
> @@ -6277,9 +6276,18 @@ static void init_proc_POWER9(CPUPPCState *env)
> =20
>  static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr)
>  {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) =3D=3D CPU_POWERPC_POWER9_=
BASE) {
> +    uint32_t base =3D pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base =3D pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (base !=3D pcc_base) {
> +        return false;
> +    }
> +
> +    if ((pvr & 0x0f00) =3D=3D (pcc->pvr & 0x0f00)) {
> +        /* Major DD version matches to power9_v1.0 and power9_v2.0 */
>          return true;
>      }
> +
>      return false;
>  }
> =20
> @@ -6489,9 +6497,18 @@ static void init_proc_POWER10(CPUPPCState *env)
> =20
>  static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr)
>  {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) =3D=3D CPU_POWERPC_POWER10=
_BASE) {
> +    uint32_t base =3D pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base =3D pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (base !=3D pcc_base) {
> +        return false;
> +    }
> +
> +    if ((pvr & 0x0f00) =3D=3D (pcc->pvr & 0x0f00)) {
> +        /* Major DD version matches to power10_v1.0 and power10_v2.0 */
>          return true;
>      }
> +
>      return false;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6mQLb1fX6awFzEFv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIsXZYACgkQgypY4gEw
YSKHGRAAkYyyD2qRgkOChI/b4XLUCUQ9/5uYjiDLKrK/oAQ7slNjRR0tRp5OlmJ9
JiniJrBAVpV57dfwfKgIHI11QDIDq5BqNOLOXdulropzBzxPlWmm7kKKQwraar9e
AO5vvkYwjXFb3aDGBOwx8aXTRCijEK2HxElKLIlDws+2G/quTgsjeX3sNmHOKr0p
c6y4r3wsondHPluduB7WIqGy2IIuIsHIMILUnQsZAIKXYZkegC+CS1sKjqBCUYKW
y+PF+QGFmwQ0C70nf+QiqBizBJtNrhIfsxqQIo+MndOAao5U4IT4aPRZSxGJjCi/
zKn5ixGbPBSoT9oZjumAn2BeYuoPpV7bPfUauImo1Usl4QmxJF5c5cyVLnz3j9U3
BIRNfgU7rW6r4fZoSZKdUvTsU7AfC6lJNoVhP7WXjcfvYkykWywpBouKRMZnr7t4
/lIpWYEEyDYy457Zd2BMbvVPsbZ/ywIK6/p+iTwlBk6NSNJrchbFj3OQNhxr1TSU
VCixhjE8s0S680xMA62jwmXmhSUmJORr5mTEig+y9UyUQMEHa8KsUUeV8GsGHLmK
pTwbaAUqb3ZpKGgj6VvCI03yo3ZE6ndS+K42+gx5+kBTLgLEz13l9yM0JlIf3wx/
J2hRoPIhhCpueBDGnQC6YdUnzvNbKMyuGLeuX7Y0SwCAWsBWkFI=
=RoV8
-----END PGP SIGNATURE-----

--6mQLb1fX6awFzEFv--

