Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C4612C210
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 09:41:33 +0100 (CET)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilU8i-0001vJ-9z
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 03:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52168)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ilU7v-0001UG-T4
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 03:40:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ilU7u-0003pS-9y
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 03:40:43 -0500
Received: from ozlabs.org ([203.11.71.1]:48155)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1ilU7t-0003Ou-Aj
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 03:40:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47lvCP0cDSz9sR0; Sun, 29 Dec 2019 19:40:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1577608833;
 bh=n/R7ARHE523TozN1pVhCuaRYfW1juuQoWeIgOA5nhyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pmt8Smh7wpGbyTiblXdYgd9OmwemsbFVJJOQHLTqDSqZp/rA0b2ZMnAvxw+NNHbFR
 3fw2ZX7a6S+y4PYpvP9qJ4zx34UVOkxd1VbUn6NMIuxmj82KJcnzZBOWdqxlhbD9Fg
 0pLXqFzMRZZtv+QqzqqZ0iOC//LiE1Lo2hwyhHwM=
Date: Sun, 29 Dec 2019 19:40:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 26/28] target/ppc: Use cpu_*_mmuidx_ra instead of
 MMU_MODE*_SUFFIX
Message-ID: <20191229084024.GB4812@umbus.modem>
References: <20191216221158.29572-1-richard.henderson@linaro.org>
 <20191216221158.29572-27-richard.henderson@linaro.org>
 <875ziabwrn.fsf@linaro.org>
 <a748c624-d1d2-cd76-bee4-048abea9d4f5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <a748c624-d1d2-cd76-bee4-048abea9d4f5@linaro.org>
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
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2019 at 08:18:35AM +1100, Richard Henderson wrote:
> On 12/21/19 6:51 AM, Alex Benn=E9e wrote:
> >> --- a/target/ppc/mem_helper.c
> >> +++ b/target/ppc/mem_helper.c
> >> @@ -177,14 +177,7 @@ static void dcbz_common(CPUPPCState *env, target_=
ulong addr,
> >>      } else {
> >>          /* Slow path */
> >>          for (i =3D 0; i < dcbz_size; i +=3D 8) {
> >> -            if (epid) {
> >> -#if !defined(CONFIG_USER_ONLY)
> >> -                /* Does not make sense on USER_ONLY config */
> >> -                cpu_stq_eps_ra(env, addr + i, 0, retaddr);
> >> -#endif
> >> -            } else {
> >> -                cpu_stq_data_ra(env, addr + i, 0, retaddr);
> >> -            }
> >> +            cpu_stq_mmuidx_ra(env, addr + i, 0, mmu_idx, retaddr);
> >=20
> > I assume the possibility of a user-mode with epid is elided in the
> > translation phase by avoiding gen_dcbzep although I can't quite see
> > where they get called from. Anyway:
>=20
> I suspect that dcbzep (vs dcbze) is supposed to be privileged, but I can'=
t see
> that enforced anywhere.  Certainly one can't write to the EPSC register f=
rom
> userspace...

So... it's true that dcbzep is privileged (as are all the external PID
instructions, I believe).  I'm not certain if the reasoning you used
to guess that was correct, though.  In this case the suffix is "ep"
for "External PID" not "p" for "Privileged".  There is no "dcbze"
instruction, only "dcbz" which happens not to be privileged.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4IZnUACgkQbDjKyiDZ
s5JYORAAzcj3xWo9/LY3yac2NBenoRN/Ifzap13JlDwVNdVZ7Ogs095Z8qEXG3eB
tVYEPFHE+JqpaoWQtvlIpiR+k0nb5Mzp/cIwfl/6i7H85OWeb6Kqya4mgYBzzAX5
bjwOaM2Ssm0dDj1hHKj94LCTAaYDWv1gOW2aJ/xonU/4EPA8zg2T3qZluDSq6dkU
/C/dBYzYvwgFg0sIEbGQ9GfqyT0iYwcv6oImhfKqccvFBGO3QO1TPygzEpvJtEbG
zyHqfumh3hQ8gg9rzKs5yIjZ/RL5rr648sibE8H4e7JdQTacFG1mgxI60Jvl3XLB
ps0OgO1UrwjRvs/k2aUL7OiK8hqUCGGIFx+9s7zcyX4YTPn9w/h6VrpMDu5ZUo8W
1VwIXzSIzzrRYrho236w4mPJDdPsl4ynxLze0yasuLMQAZWgn1UEZDuXPyPnU4wV
niyPseVbXnF2osGwUCSZ41xs1e4WiSmjdWWkvTs/bpqaE21toRKNz7D2pI7a8682
N0ao1I7T3l7jEwBgcnjDMWIN9qEqnMxmg7LnycZOYKh8sg4jzr7jeMQZmtdx5KyR
QvfOKfT4Nwv1OyeeHGz7Z4CQs9j8TrRoGJIMHTEXofdr1D3ToPdGkpb7L15gkFFV
MJqzWrMD24h6SyMIMAD6+77ozXbEY8uvHeVXB1+jqiip6sDm0rw=
=zQ8B
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--

