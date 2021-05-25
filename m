Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069338F9D7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 07:12:55 +0200 (CEST)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llPN8-0003x5-3M
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 01:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llPL3-0002bU-KS; Tue, 25 May 2021 01:10:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50559 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llPL0-0000KP-4N; Tue, 25 May 2021 01:10:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fq2GN43dHz9sCD; Tue, 25 May 2021 15:10:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621919436;
 bh=QYmBx4jj3swchvHWfUY6UiT0oplAvreTPT3dum6uB1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kIsOp+4BYDDXDgAUnCAin6hh/HB91tc+/v1cIzmem8M1T9IkkKbETsv8TN97RxkFn
 G4qkPsc3qN1bCy8ql88GWGNlBBTEHh44aYQp7p/hsN/Y715uhAyK65+2RlGa62mQtS
 EYAzTvSNiD4Px4P7axuMxhH7N1CdoFPBSzBzYA2s=
Date: Tue, 25 May 2021 15:09:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v4 1/5] target/ppc: moved ppc_cpu_do_interrupt to cpu.c
Message-ID: <YKyGjNzW1A+7RXsd@yekko>
References: <20210524135908.47505-1-bruno.larsen@eldorado.org.br>
 <20210524135908.47505-2-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ik7KQwbk9u98rLyD"
Content-Disposition: inline
In-Reply-To: <20210524135908.47505-2-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ik7KQwbk9u98rLyD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 10:59:04AM -0300, Bruno Larsen (billionai) wrote:
> Moved the ppc_cpu_do_interrupt function to cpu.c file, where it makes
> more sense, and turned powerpc_excp not static, as it now needs to be
> accessed from outside of excp_helper.c
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Looking at this again, I'm inclined to agree with Richard: I don't see
a lot of point to this.  It's not really clear to me that these belong
more in cpu.c than in excp_helper.c, and I believe we're already
expecting to need excp_helper.c (or at least parts of it) for !TCG
builds.

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

--ik7KQwbk9u98rLyD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCshosACgkQbDjKyiDZ
s5LZaRAAloMSoyu6+9T/dqrlVCFoy/KPDjiFU+sVodpLN3xKNlNfVHOuLQTvdISQ
v3ByvEFxZCrpU77bSh9Kh1CNe0VXqymL/dTZqL5z8eg8cvzOdw31aGGupMpLIjdj
i8bALFLJ7B3RQx4jy4gw+oJ4tFgpOxqWTqnyRGbP6XiaZoT48VQM9h4DGP9zuBtu
Wd0l/QL7/pLQXESf4/8RzlgifATQYsbw8XSdD0LgVeEdwSzDsJ/qR+xtncdtUYBZ
t0+c6UaKzxa2GzeMgTOg+EmgKWo7Hte27dcOaDiPYGsen8xUg2ge4vWjtMEMCgCu
PhcWFrZjodK4GcK6j/3SaE+6qLZEGIy8tymW7GaA9ritI7uUCfkMGKGth7NsRnYQ
W0bCfgkabs3W0rSksSE4uXXYbmC6+FtzZD5+RMnZRzfwHAIK2o2HecGo4ITAbRrT
8tbsVlZ9ZgTdvkMLiP+bGVj1YoYKnujcFr3awfqh0NXjvZFtFWcLEu4IFevfDwZ5
ldY9/rmCpTzvUx5qnud/a68flUEL5hSBGYaYxlBs0w+9DmQbwoXHlXqqfZJ6FvaW
AI3SZpQdrZk9/xde4fNcc99jeyQfeJCxH5yBko9WTvGX8oMJKNfIk7gRMoTJQYVj
A+SXEzt82PYPNfYDc0TkCWml98uTK85EKF002BeOOzVHVyhzdCQ=
=NAAM
-----END PGP SIGNATURE-----

--ik7KQwbk9u98rLyD--

