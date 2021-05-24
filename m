Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7038DFC5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:11:41 +0200 (CEST)
Received: from localhost ([::1]:55200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll10G-0005WK-Ck
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sW-0008C7-V3; Sun, 23 May 2021 23:03:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46391 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sS-0000ZU-DI; Sun, 23 May 2021 23:03:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpMV45Fb0z9sW6; Mon, 24 May 2021 13:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621825404;
 bh=ofkZlwrb6xt4BZ/hPXYxHDm0hf8PUYXZLE4Q1F50cgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aM5eQPAkqlgxMzfFYH9Zz/vkEd3oj2wCioJG/0E7u/Vrlh6CVYjhu9IKmTf9bbvis
 /XmMJCwxwuyJCSjahptWXZ3iRe22TsmdKYl5+E+Ml9kHht5o1VS8p6vANJP4MYD4W2
 kx4qQlR8Ivyn/tuTvNcdnOz8qG2y70D7LVuED6KY=
Date: Mon, 24 May 2021 12:41:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 4/9] target/ppc: overhauled and moved logic of storing
 fpscr
Message-ID: <YKsSPNvcCjyRCxW5@yekko>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-5-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TfYFx51dHR8Y3v/7"
Content-Disposition: inline
In-Reply-To: <20210521201759.85475-5-bruno.larsen@eldorado.org.br>
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


--TfYFx51dHR8Y3v/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 05:17:54PM -0300, Bruno Larsen (billionai) wrote:
65;6401;1c> Followed the suggested overhaul to store_fpscr logic, and moved=
 it to
> cpu.c where it can be accessed in !TCG builds.
>=20
> The overhaul was suggesting because storing a value to fpscr should
> never raise an exception, so we could remove all the mess that happened
> with POWERPC_EXCP_FP.
>=20
> We also moved fpscr_set_rounding_mode into cpu.c as it could now be moved
> there, and it is needed when a value for the fpscr is being stored
> directly.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu.c        |  43 ++++++++
>  target/ppc/cpu.h        |  12 +-
>  target/ppc/fpu_helper.c | 238 +++-------------------------------------
>  target/ppc/gdbstub.c    |   6 +-
>  4 files changed, 65 insertions(+), 234 deletions(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index c8e87e30f1..19d67b5b07 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -25,6 +25,7 @@
>  #include "fpu/softfloat-helpers.h"
>  #include "mmu-hash64.h"
>  #include "helper_regs.h"
> +#include "sysemu/tcg.h"
> =20
>  target_ulong cpu_read_xer(CPUPPCState *env)
>  {
> @@ -109,3 +110,45 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong va=
l)
>      /* The gtse bit affects hflags */
>      hreg_compute_hflags(env);
>  }
> +
> +static inline void fpscr_set_rounding_mode(CPUPPCState *env)
> +{
> +    int rnd_type;
> +
> +    /* Set rounding mode */
> +    switch (fpscr_rn) {
> +    case 0:
> +        /* Best approximation (round to nearest) */
> +        rnd_type =3D float_round_nearest_even;
> +        break;
> +    case 1:
> +        /* Smaller magnitude (round toward zero) */
> +        rnd_type =3D float_round_to_zero;
> +        break;
> +    case 2:
> +        /* Round toward +infinite */
> +        rnd_type =3D float_round_up;
> +        break;
> +    default:
> +    case 3:
> +        /* Round toward -infinite */
> +        rnd_type =3D float_round_down;
> +        break;
> +    }
> +    set_float_rounding_mode(rnd_type, &env->fp_status);
> +}
> +
> +void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
> +{
> +    val &=3D ~(FP_VX | FP_FEX);
> +    if (val & FPSCR_IX) {
> +        val |=3D FP_VX;
> +    }
> +    if ((val >> FPSCR_XX) & (val >> FPSCR_XE) & 0x1f) {
> +        val |=3D FP_FEX;
> +    }
> +    env->fpscr =3D val;
> +    if (tcg_enabled()) {
> +        fpscr_set_rounding_mode(env);
> +    }
> +}
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index cab33a3680..203f07e48e 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -675,11 +675,11 @@ enum {
>  #define fpscr_ni     (((env->fpscr) >> FPSCR_NI)     & 0x1)
>  #define fpscr_rn     (((env->fpscr) >> FPSCR_RN0)    & 0x3)
>  /* Invalid operation exception summary */
> -#define fpscr_ix ((env->fpscr) & ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXIS=
I)  | \
> -                                  (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZD=
Z)  | \
> -                                  (1 << FPSCR_VXIMZ)  | (1 << FPSCR_VXVC=
)   | \
> -                                  (1 << FPSCR_VXSOFT) | (1 << FPSCR_VXSQ=
RT) | \
> -                                  (1 << FPSCR_VXCVI)))
> +#define FPSCR_IX     ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXISI)  | \
> +                      (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZDZ)  | \
> +                      (1 << FPSCR_VXIMZ)  | (1 << FPSCR_VXVC)   | \
> +                      (1 << FPSCR_VXSOFT) | (1 << FPSCR_VXSQRT) | \
> +                      (1 << FPSCR_VXCVI))
>  /* exception summary */
>  #define fpscr_ex  (((env->fpscr) >> FPSCR_XX) & 0x1F)
>  /* enabled exception summary */
> @@ -1334,7 +1334,7 @@ void cpu_ppc_set_vhyp(PowerPCCPU *cpu, PPCVirtualHy=
pervisor *vhyp);
>  #endif
>  #endif
> =20
> -void store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask);
> +void ppc_store_fpscr(CPUPPCState *env, target_ulong val);
>  void helper_hfscr_facility_check(CPUPPCState *env, uint32_t bit,
>                                   const char *caller, uint32_t cause);
> =20
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index a4a283df2b..0f4074fc7e 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -383,247 +383,35 @@ static inline void float_inexact_excp(CPUPPCState =
*env)
>      }
>  }
> =20
> -static inline void fpscr_set_rounding_mode(CPUPPCState *env)
> -{
> -    int rnd_type;
> -
> -    /* Set rounding mode */
> -    switch (fpscr_rn) {
> -    case 0:
> -        /* Best approximation (round to nearest) */
> -        rnd_type =3D float_round_nearest_even;
> -        break;
> -    case 1:
> -        /* Smaller magnitude (round toward zero) */
> -        rnd_type =3D float_round_to_zero;
> -        break;
> -    case 2:
> -        /* Round toward +infinite */
> -        rnd_type =3D float_round_up;
> -        break;
> -    default:
> -    case 3:
> -        /* Round toward -infinite */
> -        rnd_type =3D float_round_down;
> -        break;
> -    }
> -    set_float_rounding_mode(rnd_type, &env->fp_status);
> -}
> -
>  void helper_fpscr_clrbit(CPUPPCState *env, uint32_t bit)
>  {
> -    int prev;
> -
> -    prev =3D (env->fpscr >> bit) & 1;
> -    env->fpscr &=3D ~(1 << bit);
> -    if (prev =3D=3D 1) {
> -        switch (bit) {
> -        case FPSCR_RN1:
> -        case FPSCR_RN0:
> -            fpscr_set_rounding_mode(env);
> -            break;
> -        case FPSCR_VXSNAN:
> -        case FPSCR_VXISI:
> -        case FPSCR_VXIDI:
> -        case FPSCR_VXZDZ:
> -        case FPSCR_VXIMZ:
> -        case FPSCR_VXVC:
> -        case FPSCR_VXSOFT:
> -        case FPSCR_VXSQRT:
> -        case FPSCR_VXCVI:
> -            if (!fpscr_ix) {
> -                /* Set VX bit to zero */
> -                env->fpscr &=3D ~FP_VX;
> -            }
> -            break;
> -        case FPSCR_OX:
> -        case FPSCR_UX:
> -        case FPSCR_ZX:
> -        case FPSCR_XX:
> -        case FPSCR_VE:
> -        case FPSCR_OE:
> -        case FPSCR_UE:
> -        case FPSCR_ZE:
> -        case FPSCR_XE:
> -            if (!fpscr_eex) {
> -                /* Set the FEX bit */
> -                env->fpscr &=3D ~FP_FEX;
> -            }
> -            break;
> -        default:
> -            break;
> -        }
> +    uint32_t mask =3D 1u << bit;
> +    if (env->fpscr & mask) {
> +        ppc_store_fpscr(env, env->fpscr & ~mask);
>      }
>  }
> =20
>  void helper_fpscr_setbit(CPUPPCState *env, uint32_t bit)
>  {
> -    CPUState *cs =3D env_cpu(env);
> -    int prev;
> -
> -    prev =3D (env->fpscr >> bit) & 1;
> -    env->fpscr |=3D 1 << bit;
> -    if (prev =3D=3D 0) {
> -        switch (bit) {
> -        case FPSCR_VX:
> -            env->fpscr |=3D FP_FX;
> -            if (fpscr_ve) {
> -                goto raise_ve;
> -            }
> -            break;
> -        case FPSCR_OX:
> -            env->fpscr |=3D FP_FX;
> -            if (fpscr_oe) {
> -                goto raise_oe;
> -            }
> -            break;
> -        case FPSCR_UX:
> -            env->fpscr |=3D FP_FX;
> -            if (fpscr_ue) {
> -                goto raise_ue;
> -            }
> -            break;
> -        case FPSCR_ZX:
> -            env->fpscr |=3D FP_FX;
> -            if (fpscr_ze) {
> -                goto raise_ze;
> -            }
> -            break;
> -        case FPSCR_XX:
> -            env->fpscr |=3D FP_FX;
> -            if (fpscr_xe) {
> -                goto raise_xe;
> -            }
> -            break;
> -        case FPSCR_VXSNAN:
> -        case FPSCR_VXISI:
> -        case FPSCR_VXIDI:
> -        case FPSCR_VXZDZ:
> -        case FPSCR_VXIMZ:
> -        case FPSCR_VXVC:
> -        case FPSCR_VXSOFT:
> -        case FPSCR_VXSQRT:
> -        case FPSCR_VXCVI:
> -            env->fpscr |=3D FP_VX;
> -            env->fpscr |=3D FP_FX;
> -            if (fpscr_ve !=3D 0) {
> -                goto raise_ve;
> -            }
> -            break;
> -        case FPSCR_VE:
> -            if (fpscr_vx !=3D 0) {
> -            raise_ve:
> -                env->error_code =3D POWERPC_EXCP_FP;
> -                if (fpscr_vxsnan) {
> -                    env->error_code |=3D POWERPC_EXCP_FP_VXSNAN;
> -                }
> -                if (fpscr_vxisi) {
> -                    env->error_code |=3D POWERPC_EXCP_FP_VXISI;
> -                }
> -                if (fpscr_vxidi) {
> -                    env->error_code |=3D POWERPC_EXCP_FP_VXIDI;
> -                }
> -                if (fpscr_vxzdz) {
> -                    env->error_code |=3D POWERPC_EXCP_FP_VXZDZ;
> -                }
> -                if (fpscr_vximz) {
> -                    env->error_code |=3D POWERPC_EXCP_FP_VXIMZ;
> -                }
> -                if (fpscr_vxvc) {
> -                    env->error_code |=3D POWERPC_EXCP_FP_VXVC;
> -                }
> -                if (fpscr_vxsoft) {
> -                    env->error_code |=3D POWERPC_EXCP_FP_VXSOFT;
> -                }
> -                if (fpscr_vxsqrt) {
> -                    env->error_code |=3D POWERPC_EXCP_FP_VXSQRT;
> -                }
> -                if (fpscr_vxcvi) {
> -                    env->error_code |=3D POWERPC_EXCP_FP_VXCVI;
> -                }
> -                goto raise_excp;
> -            }
> -            break;
> -        case FPSCR_OE:
> -            if (fpscr_ox !=3D 0) {
> -            raise_oe:
> -                env->error_code =3D POWERPC_EXCP_FP | POWERPC_EXCP_FP_OX;
> -                goto raise_excp;
> -            }
> -            break;
> -        case FPSCR_UE:
> -            if (fpscr_ux !=3D 0) {
> -            raise_ue:
> -                env->error_code =3D POWERPC_EXCP_FP | POWERPC_EXCP_FP_UX;
> -                goto raise_excp;
> -            }
> -            break;
> -        case FPSCR_ZE:
> -            if (fpscr_zx !=3D 0) {
> -            raise_ze:
> -                env->error_code =3D POWERPC_EXCP_FP | POWERPC_EXCP_FP_ZX;
> -                goto raise_excp;
> -            }
> -            break;
> -        case FPSCR_XE:
> -            if (fpscr_xx !=3D 0) {
> -            raise_xe:
> -                env->error_code =3D POWERPC_EXCP_FP | POWERPC_EXCP_FP_XX;
> -                goto raise_excp;
> -            }
> -            break;
> -        case FPSCR_RN1:
> -        case FPSCR_RN0:
> -            fpscr_set_rounding_mode(env);
> -            break;
> -        default:
> -            break;
> -        raise_excp:
> -            /* Update the floating-point enabled exception summary */
> -            env->fpscr |=3D FP_FEX;
> -            /* We have to update Rc1 before raising the exception */
> -            cs->exception_index =3D POWERPC_EXCP_PROGRAM;
> -            break;
> -        }
> +    uint32_t mask =3D 1u << bit;
> +    if (!(env->fpscr & mask)) {
> +        ppc_store_fpscr(env, env->fpscr | mask);
>      }
>  }
> =20
> -void helper_store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask)
> +void helper_store_fpscr(CPUPPCState *env, uint64_t val, uint32_t nibbles)
>  {
> -    CPUState *cs =3D env_cpu(env);
> -    target_ulong prev, new;
> +    target_ulong mask =3D 0;
>      int i;
> =20
> -    prev =3D env->fpscr;
> -    new =3D (target_ulong)arg;
> -    new &=3D ~(FP_FEX | FP_VX);
> -    new |=3D prev & (FP_FEX | FP_VX);
> +    /* TODO: push this extension back to translation time */
>      for (i =3D 0; i < sizeof(target_ulong) * 2; i++) {
> -        if (mask & (1 << i)) {
> -            env->fpscr &=3D ~(0xFLL << (4 * i));
> -            env->fpscr |=3D new & (0xFLL << (4 * i));
> +        if (nibbles & (1 << i)) {
> +            mask |=3D (target_ulong) 0xf << (4 * i);
>          }
>      }
> -    /* Update VX and FEX */
> -    if (fpscr_ix !=3D 0) {
> -        env->fpscr |=3D FP_VX;
> -    } else {
> -        env->fpscr &=3D ~FP_VX;
> -    }
> -    if ((fpscr_ex & fpscr_eex) !=3D 0) {
> -        env->fpscr |=3D FP_FEX;
> -        cs->exception_index =3D POWERPC_EXCP_PROGRAM;
> -        /* XXX: we should compute it properly */
> -        env->error_code =3D POWERPC_EXCP_FP;
> -    } else {
> -        env->fpscr &=3D ~FP_FEX;
> -    }
> -    fpscr_set_rounding_mode(env);
> -}
> -
> -void store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask)
> -{
> -    helper_store_fpscr(env, arg, mask);
> +    val =3D (val & mask) | (env->fpscr & ~mask);
> +    ppc_store_fpscr(env, val);
>  }
> =20
>  static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 9339e7eafe..c7d866cfcc 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -272,7 +272,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>              break;
>          case 70:
>              /* fpscr */
> -            store_fpscr(env, ldtul_p(mem_buf), 0xffffffff);
> +            ppc_store_fpscr(env, ldtul_p(mem_buf));
>              break;
>          }
>      }
> @@ -322,7 +322,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, ui=
nt8_t *mem_buf, int n)
>              break;
>          case 70 + 32:
>              /* fpscr */
> -            store_fpscr(env, ldq_p(mem_buf), 0xffffffff);
> +            ppc_store_fpscr(env, ldq_p(mem_buf));
>              break;
>          }
>      }
> @@ -475,7 +475,7 @@ static int gdb_set_float_reg(CPUPPCState *env, uint8_=
t *mem_buf, int n)
>      }
>      if (n =3D=3D 32) {
>          ppc_maybe_bswap_register(env, mem_buf, 4);
> -        store_fpscr(env, ldl_p(mem_buf), 0xffffffff);
> +        ppc_store_fpscr(env, ldl_p(mem_buf));
>          return 4;
>      }
>      return 0;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TfYFx51dHR8Y3v/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrEjwACgkQbDjKyiDZ
s5LithAAsV2ldSiDqrRlSQAut1gQKOAUy5iTba2NJ9p9FZEXja75lsX7brRr2dUs
KXfBTcvc1NeRkmyifyIzPeP4Jz5FrCJWCOGUExF0uSROv0IXR8JXE/Ab9bYMSABV
NStUN3ky7cShVy2ttukARmzG7T0h37B4bV9fghpjLL+YQnRGVOYIrhh9kfVkbLHG
33/Ik3nvcN4RmuNK2YM8d+R+Tr71ws3zTPujQmG6Iydkft7OINCtV/5J521KBMMR
RRjGeSgksv7KRX4/o3wryzjBy9tLU5UcqR3MI91PbB5/vJzmyoT/lOayMozUeyzN
40+sG8xQKk2TbMaswA9LmY4INiLZJ/8zbAKx2dwrNZ69+UmH0kHHovjJ40DqoVdv
t2cSS9gaU0z0S37dyQn11Nyu06Oo9BSoC+041SoRrNkcMVkGdGjBaBP94Qgbz7V4
cyraP1sPkFpDAAIKZxRioW9+/2WYbOPwrVTCxVHehazO3eAMl+cmC/FHri1S8shE
ITP8wKABJRGY9h+4auFrvHRWSsoU4aK7vrUXJUSLmGAP2KHlHbY9FTNtOsuoWT3j
wpzSTnjhp++YI/3szD3H2QmEcqN64sSwI+XBk9MqpjtCZcTF6D5CrO60CFi5vnOR
JtEax1s2/6DDDOVBhfm5pYGdzRNppUyDP9wltgnIWZZbgaU4TKM=
=mlRn
-----END PGP SIGNATURE-----

--TfYFx51dHR8Y3v/7--

