Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E3346EFE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:46:48 +0100 (CET)
Received: from localhost ([::1]:51790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsbf-0006yX-Dm
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPw-0004QB-Kv; Tue, 23 Mar 2021 21:34:40 -0400
Received: from ozlabs.org ([203.11.71.1]:41251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPu-0001mD-Gs; Tue, 23 Mar 2021 21:34:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rPd0mH5z9sXS; Wed, 24 Mar 2021 12:34:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616549669;
 bh=fp39D3tGptJ3iDoH9NbZJFhYcltZejBi7zBZyT1gnOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q6yWCsabfMwZ0EurUC5z9rpMJz3B8l5fP7Emk8zWZRl+/3KegLF0Ck1c4rEZqa/G2
 SXJXqLODNa6bBqRQwWmx+JYeOucgcGawbOTGzmljdYv/LQHvaoanzG7HUOX5lervgX
 +N0aeI7P5sOy5Fsn/sigcLnBpJMMON9ZZAqAkmmE=
Date: Wed, 24 Mar 2021 11:12:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 10/10] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
Message-ID: <YFqD5JOVEXVFv9Tr@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-11-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+7JJfLQPX6wRrRzJ"
Content-Disposition: inline
In-Reply-To: <20210323184340.619757-11-richard.henderson@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+7JJfLQPX6wRrRzJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:43:40PM -0600, Richard Henderson wrote:
> Verify that hflags was updated correctly whenever we change
> cpu state that is used by hflags.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  target/ppc/cpu.h         |  5 +++++
>  target/ppc/helper_regs.c | 29 +++++++++++++++++++++++++++--
>  2 files changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 3d021f61f3..69fc9a2831 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2425,6 +2425,10 @@ void cpu_write_xer(CPUPPCState *env, target_ulong =
xer);
>   */
>  #define is_book3s_arch2x(ctx) (!!((ctx)->insns_flags & PPC_SEGMENT_64B))
> =20
> +#ifdef CONFIG_DEBUG_TCG
> +void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
> +                          target_ulong *cs_base, uint32_t *flags);
> +#else
>  static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *=
pc,
>                                          target_ulong *cs_base, uint32_t =
*flags)
>  {
> @@ -2432,6 +2436,7 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState=
 *env, target_ulong *pc,
>      *cs_base =3D 0;
>      *flags =3D env->hflags;
>  }
> +#endif
> =20
>  void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t exception);
>  void QEMU_NORETURN raise_exception_ra(CPUPPCState *env, uint32_t excepti=
on,
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 5411a67e9a..3723872aa6 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -43,7 +43,7 @@ void hreg_swap_gpr_tgpr(CPUPPCState *env)
>      env->tgpr[3] =3D tmp;
>  }
> =20
> -void hreg_compute_hflags(CPUPPCState *env)
> +static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>  {
>      target_ulong msr =3D env->msr;
>      uint32_t ppc_flags =3D env->flags;
> @@ -155,9 +155,34 @@ void hreg_compute_hflags(CPUPPCState *env)
>      hflags |=3D dmmu_idx << HFLAGS_DMMU_IDX;
>  #endif
> =20
> -    env->hflags =3D hflags | (msr & msr_mask);
> +    return hflags | (msr & msr_mask);
>  }
> =20
> +void hreg_compute_hflags(CPUPPCState *env)
> +{
> +    env->hflags =3D hreg_compute_hflags_value(env);
> +}
> +
> +#ifdef CONFIG_DEBUG_TCG
> +void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
> +                          target_ulong *cs_base, uint32_t *flags)
> +{
> +    uint32_t hflags_current =3D env->hflags;
> +    uint32_t hflags_rebuilt;
> +
> +    *pc =3D env->nip;
> +    *cs_base =3D 0;
> +    *flags =3D hflags_current;
> +
> +    hflags_rebuilt =3D hreg_compute_hflags_value(env);
> +    if (unlikely(hflags_current !=3D hflags_rebuilt)) {
> +        cpu_abort(env_cpu(env),
> +                  "TCG hflags mismatch (current:0x%08x rebuilt:0x%08x)\n=
",
> +                  hflags_current, hflags_rebuilt);
> +    }
> +}
> +#endif
> +
>  void cpu_interrupt_exittb(CPUState *cs)
>  {
>      if (!kvm_enabled()) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+7JJfLQPX6wRrRzJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBag+MACgkQbDjKyiDZ
s5IzERAA5Mi2qaXzzaLyAx+Ryr8vXv/rariNJsNK1cuDkPoGyGGqvjUnH2pGhM5I
E2G8QwgI4mI994uy5Mc+H+0um1jv+3fAwk/O+5JTzwnPAuGR1WWddxV2/lob0MhU
u9kw0bTgtILoqT91aC8gbkWlF0c5+ksH0MUTViBaSnCoqxfgYV/uJosZdMr/fRID
d0LjmbhVuI2pzDXZFLJiAbcmLa1/v71HLerdGI56BMc9JRR3V4W/xUOe08XWttEE
Uc1zFiJQJ1+d8PffN71UREPUTKSWCPSYWkHdMy5DgJ9Cnb02BVOgjmRlFL2GcmO6
l8FH2C2d7KgwzW3CBqejSmeaaF/Si3/bw/4MkorUtfY2ddjPW617P27CtAUEo2dr
8iI5nL89iawo4FMjGtFwUe1f+UPTCzzHfOSTG5VJWGnhTLkC87bBg7CGmQe4a/Qx
y5BneR73angj9r9T0IUUqa8KABMLzePgO/7JAw4iO4OWN+Ro0RGZT10qeo4HI/45
XFgD3K6/AwwJu88NDifCY2/ouLAj8hAbPYDGhESWnnREl9CT8GtUXbZIAtmL1Kx9
WnwSBVVDYQzPpTX08rApB8fiC9WIwoKV0/vdSPLlEZJy4Pnz1xtwSc6MzhLXMjGp
c3YsAYEeyYJ/ZjpWD+1aok0c8+CK1NuJisamAjzo2E3ECct5P5c=
=tFpg
-----END PGP SIGNATURE-----

--+7JJfLQPX6wRrRzJ--

