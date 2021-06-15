Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29593A7691
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 07:43:42 +0200 (CEST)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt1rR-0002zC-8a
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 01:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lt1qN-0001gp-V7; Tue, 15 Jun 2021 01:42:36 -0400
Received: from ozlabs.org ([203.11.71.1]:43831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lt1qM-0007UL-6C; Tue, 15 Jun 2021 01:42:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3xzT4MSPz9sW8; Tue, 15 Jun 2021 15:42:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623735749;
 bh=1WE+JSX6aS9FiwQnFexqJIC3K6VLGeUj7AFOKpiOKas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WU9FBwkoOoY4X71qHvjZG4l9ZKl43RZH10+M562jxXoJFY3x4lgfQU1viPDF5smqf
 3bef+kE+rV/T7adYGQmEydQspYvQs2hcOE7dQnrcnDdUUf5ra7qbzZxDnNFpbVaN2b
 UuqetXSc/oLMXjfiMDLjzOgkZApO0Aqu4RzCp3NU=
Date: Tue, 15 Jun 2021 15:38:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v2 1/3] target/ppc: Turn ppc_tlb_invalid_all in a noop
Message-ID: <YMg815tpe++WuRuR@yekko>
References: <20210610164648.83878-1-lucas.araujo@eldorado.org.br>
 <20210610164648.83878-2-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QVBshb67QIC6Cs8L"
Content-Disposition: inline
In-Reply-To: <20210610164648.83878-2-lucas.araujo@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QVBshb67QIC6Cs8L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 01:46:46PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> The function ppc_tlb_invalid_all is now a no op when compiling without TC=
G.
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>


Hm, I think I suggested making ppc_tlb_invalidate_all() a stub, rather
than removing the call from !TCG code.  But looking at this again, I
think that was a mistake.  I think it makes more sense to suppress
this on the caller side, and make this a TCG only function.

> ---
>  target/ppc/mmu_helper.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 1ecb36e85a..e7ba39c9e1 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -825,6 +825,7 @@ static int mmubooke_get_physical_address(CPUPPCState =
*env, mmu_ctx_t *ctx,
>      return ret;
>  }
> =20
> +#ifdef CONFIG_TCG
>  static void booke206_flush_tlb(CPUPPCState *env, int flags,
>                                 const int check_iprot)
>  {
> @@ -846,6 +847,7 @@ static void booke206_flush_tlb(CPUPPCState *env, int =
flags,
> =20
>      tlb_flush(env_cpu(env));
>  }
> +#endif
> =20
>  static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
>                                          ppcmas_tlb_t *tlb)
> @@ -1956,6 +1958,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32=
_t nr, target_ulong value)
>  /* TLB management */
>  void ppc_tlb_invalidate_all(CPUPPCState *env)
>  {
> +#ifdef CONFIG_TCG
>  #if defined(TARGET_PPC64)
>      if (mmu_is_64bit(env->mmu_model)) {
>          env->tlb_need_flush =3D 0;
> @@ -1994,6 +1997,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>          cpu_abort(env_cpu(env), "Unknown MMU model %x\n", env->mmu_model=
);
>          break;
>      }
> +#endif
>  }
> =20
>  #ifdef CONFIG_TCG

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QVBshb67QIC6Cs8L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIPNUACgkQbDjKyiDZ
s5IBXBAAgkcPFtQjswV3B6X6rGxwA6U4U3vAR/Na1iiIj7g5ShUh7aJjRlYm1j0T
QztfxtVASP50nHkEMlyfmPUggrwpIbVCA+9yeT/Y6BwnaW4LKidWoIRiJUGz0Kz5
qOahkhbuXW9f1h+wdNRrFjmX7KZr15xo3QfrSBceB6s41NPcn2sRIJ1eTLd4tkrl
g1t5dq+H1Sg0mcS7ohA5B0qzsxJZXz8aQyATmH2t7BUZyhJ9tHitxrB+HyGfE+dY
LCnAWvQYXkuY98RQbGmIdNsHBv4vrGW5qX38x3DXSQBUxDtDUVfVlNDLibqP2WAg
lmAuINzQr+j2s1Olk5rQUoZoaz4ZKL1lksmiPzj9DoHOEHSIwoTdEekf+EaMsmqx
I6Y+2p8E99Y/2WkH1HG8o+9RJdPu4zojCU5K9saNQKS/1aSG+vTR74txv61WbWtN
X87q/3dSx/pBsZJvv61rFtps9ZDJUpItprmnDdv+Bp+E1TcG43n/ZpcYOq19A5Oo
5A5Hr5Pq52kjGqWAGSrUaawkfLycD1sSOUOJ1weUI5xpGSixfbMAwOTAnsR2PwyS
7C6+P/muU83Tb+vW3DT+Eyi34sSeS3WFo4CihYVCg4EjCSi40G4nutLmxt7TzKjl
kEeRoU1nR1SUWy5CadCqPlZZiGS7FpqI1uIXHW5oq02gppnRb3g=
=P0Y6
-----END PGP SIGNATURE-----

--QVBshb67QIC6Cs8L--

