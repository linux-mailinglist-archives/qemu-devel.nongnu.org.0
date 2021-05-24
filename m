Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B912338DFB0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:10:02 +0200 (CEST)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0yf-00036z-Q5
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sc-0008H9-94; Sun, 23 May 2021 23:03:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49417 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sY-0000hb-73; Sun, 23 May 2021 23:03:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpMV46kfzz9sWB; Mon, 24 May 2021 13:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621825404;
 bh=EWG6VnHKMmw6lbifefaIPWq6Ia15mrJba3PAw4XGWeU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yni0U5ybxEw7oNic5rgdLc1YnZrGbyvMKS/7jMbWaewARmSYJ1c7EeGPLdCBaCpAV
 C9/RsKYFXiHZ/6VHlP60WEhVvKiBj+cwzNxfuASDbMFPUsltbv+0BKa7abIfP+SPIf
 GytOvkMQGzA8PM/rXiCdXN0Uqoxd7F9PeeE5XnN4=
Date: Mon, 24 May 2021 12:57:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 6/9] target/ppc: moved ppc_cpu_do_interrupt to cpu.c
Message-ID: <YKsWMUM5+LY68Am6@yekko>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-7-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VDU3wYoGd3ycM3x1"
Content-Disposition: inline
In-Reply-To: <20210521201759.85475-7-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VDU3wYoGd3ycM3x1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 05:17:56PM -0300, Bruno Larsen (billionai) wrote:
> Moved the ppc_cpu_do_interrupt function to cpu.c file, where it makes
> more sense, and turned powerpc_excp not static, as it now needs to be
> accessed from outside of excp_helper.c
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Looks ok to me, but I'd like to get a review from Richard before applying.

> ---
>  target/ppc/cpu.c         | 20 ++++++++++++++++++++
>  target/ppc/cpu.h         |  1 +
>  target/ppc/excp_helper.c | 19 +------------------
>  3 files changed, 22 insertions(+), 18 deletions(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 19d67b5b07..95898f348b 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -152,3 +152,23 @@ void ppc_store_fpscr(CPUPPCState *env, target_ulong =
val)
>          fpscr_set_rounding_mode(env);
>      }
>  }
> +
> +/* Exception processing */
> +#if defined(CONFIG_USER_ONLY)
> +void ppc_cpu_do_interrupt(CPUState *cs)
> +{
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    cs->exception_index =3D POWERPC_EXCP_NONE;
> +    env->error_code =3D 0;
> +}
> +#else
> +void ppc_cpu_do_interrupt(CPUState *cs)
> +{
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    powerpc_excp(cpu, env->excp_model, cs->exception_index);
> +}
> +#endif
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 203f07e48e..65a08cc424 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1254,6 +1254,7 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtu=
alHypervisorClass,
>  #endif /* CONFIG_USER_ONLY */
> =20
>  void ppc_cpu_do_interrupt(CPUState *cpu);
> +void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp);
>  bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index f4f15279eb..80bb6e70e9 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -38,15 +38,6 @@
>  /***********************************************************************=
******/
>  /* Exception processing */
>  #if defined(CONFIG_USER_ONLY)
> -void ppc_cpu_do_interrupt(CPUState *cs)
> -{
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    CPUPPCState *env =3D &cpu->env;
> -
> -    cs->exception_index =3D POWERPC_EXCP_NONE;
> -    env->error_code =3D 0;
> -}
> -
>  static void ppc_hw_interrupt(CPUPPCState *env)
>  {
>      CPUState *cs =3D env_cpu(env);
> @@ -324,7 +315,7 @@ static inline void powerpc_set_excp_state(PowerPCCPU =
*cpu,
>   * Note that this function should be greatly optimized when called
>   * with a constant excp, from ppc_hw_interrupt
>   */
> -static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int exc=
p)
> +inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -968,14 +959,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>      powerpc_set_excp_state(cpu, vector, new_msr);
>  }
> =20
> -void ppc_cpu_do_interrupt(CPUState *cs)
> -{
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    CPUPPCState *env =3D &cpu->env;
> -
> -    powerpc_excp(cpu, env->excp_model, cs->exception_index);
> -}
> -
>  static void ppc_hw_interrupt(CPUPPCState *env)
>  {
>      PowerPCCPU *cpu =3D env_archcpu(env);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VDU3wYoGd3ycM3x1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrFi8ACgkQbDjKyiDZ
s5JIZA/+JX48ZuyAI/LlzBbs1icT7oDpxcVLONCUOR4B+aXxEe8QxG7UawxGNSbo
J9rla+RbbKi8tSUh/BQeehtstpscf3CCBFwP6I6Mb9yn7BYo1uHzz1Yi/grGMSo9
V/nHigQFmEIkN14DMSFAzjUhXb7Ac7xL8z74Zhq1WXt/Iy3RP1kTCMVsAwlGqaeY
cwYh2Ay3BQXZRNc0o5ftgwR4IEuu2DSrPQVRCXIhQxro+Zm45bkBVHo2rvutqqrd
3bvALNP/b55cyHQ3YVWzH1gVGP4N9eC0lNYc8UrZ9sdlLZ2dVKaXF9NUMN+pibQd
UZEvML+GzVkc/Tb6oWMGkGDag0FwU1wqzwAtBPq8Ay/Lm59TQS/mmm8hsaF2vUCw
O5SJ4DXAvPyCDFg9xSeZIQ15O/sZ6vZlHDAY7HesmIG6OMDnxDWTT0sroODWxYBu
mnAGZ+v3D5YYQSWeRVxyAZPbtpOfB+GWYrBT06RNYbAPX70YmWpkHw9l+vg8RFhd
OmcHrC8L4PgSNpyXzOgrF6/OE5FF1pT3kWCdjn2qfb2Uh8dRQ2Dqy95YOAWjSiwh
IsnuRAJ2TvSjKlYtfUDYwIRLsbu3DRlo51krou8dTp+luZ/Y8e+43olTo1ztf88T
dRblRO8ECP5CHHqro7HyT6rA4F2UNgUMfW69/lr7WIAYEO4gcto=
=aEi6
-----END PGP SIGNATURE-----

--VDU3wYoGd3ycM3x1--

