Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B845C3618EA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 06:30:45 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXG7w-0002Ba-01
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 00:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXG6T-0000ut-0k; Fri, 16 Apr 2021 00:29:14 -0400
Received: from ozlabs.org ([203.11.71.1]:50329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXG6O-0005kW-JG; Fri, 16 Apr 2021 00:29:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FM3BR4RQJz9sWK; Fri, 16 Apr 2021 14:29:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618547343;
 bh=c/PIna/V13NEqbxzoxB4h9Pk9wgDQKxIcqnvVeW8d94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E3czzSMs0b7esEOyMHpL4F11h+h6msWPNBbjNpS7e8yYxOYueKC53qVVYc6b8f60r
 szI/38KybKP1+P9sjPlOjUeSYBomCdBTamOY3MHtAuLkZZmwNGFK1eGLrG+9s+2fIT
 RpLEWMw/0mZXUE3URsGggXBTPCpn6Ho6VO/RfDFM=
Date: Fri, 16 Apr 2021 14:24:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/4] target/ppc: Rework AIL logic in interrupt delivery
Message-ID: <YHkRk653hdZwUZiq@yekko.fritz.box>
References: <20210415054227.1793812-1-npiggin@gmail.com>
 <20210415054227.1793812-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uqfwfNxoXHklhGm/"
Content-Disposition: inline
In-Reply-To: <20210415054227.1793812-4-npiggin@gmail.com>
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
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uqfwfNxoXHklhGm/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 03:42:26PM +1000, Nicholas Piggin wrote:
> The AIL logic is becoming unmanageable spread all over powerpc_excp(),
> and it is slated to get even worse with POWER10 support.
>=20
> Move it all to a new helper function.
>=20
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Tested-by: C=E9dric Le Goater <clg@kaod.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Looks like a nice cleanup overall, just a few minor comments.

> ---
>  hw/ppc/spapr_hcall.c            |   3 +-
>  target/ppc/cpu.h                |   8 --
>  target/ppc/excp_helper.c        | 159 ++++++++++++++++++++------------
>  target/ppc/translate_init.c.inc |   2 +-
>  4 files changed, 102 insertions(+), 70 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7b5cd3553c..2fbe04a689 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1395,7 +1395,8 @@ static target_ulong h_set_mode_resource_addr_trans_=
mode(PowerPCCPU *cpu,
>          return H_P4;
>      }
> =20
> -    if (mflags =3D=3D AIL_RESERVED) {
> +    if (mflags =3D=3D 1) {
> +        /* AIL=3D1 is reserved */
>          return H_UNSUPPORTED_FLAG;
>      }
> =20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e73416da68..5200a16d23 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2375,14 +2375,6 @@ enum {
>      HMER_XSCOM_STATUS_MASK      =3D PPC_BITMASK(21, 23),
>  };
> =20
> -/* Alternate Interrupt Location (AIL) */
> -enum {
> -    AIL_NONE                =3D 0,
> -    AIL_RESERVED            =3D 1,
> -    AIL_0001_8000           =3D 2,
> -    AIL_C000_0000_0000_4000 =3D 3,
> -};

Yeah, I always thought these particular constants were a but
pointless.

> -
>  /***********************************************************************=
******/
> =20
>  #define is_isa300(ctx) (!!(ctx->insns_flags2 & PPC2_ISA300))
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index b8881c0f85..964a58cfdc 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -136,25 +136,105 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUP=
PCState *env, int excp,
>      return POWERPC_EXCP_RESET;
>  }
> =20
> -static uint64_t ppc_excp_vector_offset(CPUState *cs, int ail)
> +/*
> + * AIL - Alternate Interrupt Location, a mode that allows interrupts to =
be
> + * taken with the MMU on, and which uses an alternate location (e.g., so=
 the
> + * kernel/hv can map the vectors there with an effective address).
> + *
> + * An interrupt is considered to be taken "with AIL" or "AIL applies" if=
 they
> + * are delivered in this way. AIL requires the LPCR to be set to enable =
this
> + * mode, and then a number of conditions have to be true for AIL to appl=
y.
> + *
> + * First of all, SRESET, MCE, and HMI are always delivered without AIL, =
because
> + * they specifically want to be in real mode (e.g., the MCE might be sig=
naling
> + * a SLB multi-hit which requires SLB flush before the MMU can be enable=
d).
> + *
> + * After that, behaviour depends on the current MSR[IR], MSR[DR], MSR[HV=
],
> + * whether or not the interrupt changes MSR[HV] from 0 to 1, and the cur=
rent
> + * radix mode (LPCR[HR]).
> + *
> + * POWER8, POWER9 with LPCR[HR]=3D0
> + * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
> + * +-----------+-------------+---------+-------------+-----+
> + * | a         | 00/01/10    | x       | x           | 0   |
> + * | a         | 11          | 0       | 1           | 0   |
> + * | a         | 11          | 1       | 1           | a   |
> + * | a         | 11          | 0       | 0           | a   |
> + * +-------------------------------------------------------+
> + *
> + * POWER9 with LPCR[HR]=3D1
> + * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
> + * +-----------+-------------+---------+-------------+-----+
> + * | a         | 00/01/10    | x       | x           | 0   |
> + * | a         | 11          | x       | x           | a   |
> + * +-------------------------------------------------------+
> + *
> + * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be =
sent to
> + * the hypervisor in AIL mode if the guest is radix.
> + */
> +static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, i=
nt excp,
> +                                      target_ulong msr,
> +                                      target_ulong *new_msr,
> +                                      target_ulong *vector)
>  {
> -    uint64_t offset =3D 0;
> +#if defined(TARGET_PPC64)
> +    CPUPPCState *env =3D &cpu->env;
> +    bool mmu_all_on =3D ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
> +    bool hv_escalation =3D !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
> +    int ail =3D 0;
> +
> +    if (excp =3D=3D POWERPC_EXCP_MCHECK ||
> +        excp =3D=3D POWERPC_EXCP_RESET ||
> +        excp =3D=3D POWERPC_EXCP_HV_MAINT) {
> +        /* SRESET, MCE, HMI never apply AIL */
> +        return;
> +    }
> =20
> -    switch (ail) {
> -    case AIL_NONE:
> -        break;
> -    case AIL_0001_8000:
> -        offset =3D 0x18000;
> -        break;
> -    case AIL_C000_0000_0000_4000:
> -        offset =3D 0xc000000000004000ull;
> -        break;
> -    default:
> -        cpu_abort(cs, "Invalid AIL combination %d\n", ail);
> -        break;
> +    if (excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> +        excp_model =3D=3D POWERPC_EXCP_POWER9) {
> +        if (!mmu_all_on) {
> +            /* AIL only works if MSR[IR] and MSR[DR] are both enabled. */
> +            return;
> +        }
> +        if (hv_escalation && !(env->spr[SPR_LPCR] & LPCR_HR)) {
> +            /*
> +             * AIL does not work if there is a MSR[HV] 0->1 transition a=
nd the
> +             * partition is in HPT mode. For radix guests, such interrup=
ts are
> +             * allowed to be delivered to the hypervisor in ail mode.
> +             */
> +            return;
> +        }
> +
> +        ail =3D (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
> +        if (ail !=3D 2 && ail !=3D 3) {
> +            /* AIL=3D1 is reserved */

So, AIL=3D=3D0 and AIL=3D=3D1 are treated the same here, but for kinda
different reasons.  AIL=3D=3D0 means no offset should be applied.  AIL=3D=
=3D1
is invalid, so we're just ignoring AIL in that case.

I wonder if it would make things clearer to filter the AIL=3D=3D1 case at
LPCR write time, and just assert() it's not the case here.

> +            return;
> +        }
> +    } else {
> +        /* Other processors do not support AIL */
> +        return;
>      }
> =20
> -    return offset;
> +    /*
> +     * AIL applies, so the new MSR gets IR and DR set, and an offset app=
lied
> +     * to the new IP.
> +     */
> +    *new_msr |=3D (1 << MSR_IR) | (1 << MSR_DR);
> +
> +    if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
> +        if (ail =3D=3D 2) {
> +            *vector |=3D 0x0000000000018000ull;
> +        } else if (ail =3D=3D 3) {
> +            *vector |=3D 0xc000000000004000ull;
> +        }
> +    } else {
> +        /* scv AIL is a little different */

What happens with AIL=3D=3D2 and an SCV?  I mean, here it's as if AIL=3D=3D=
0,
but is that right?  If so, I think we should comment it to make it
clear that's not an omission.

> +        if (ail =3D=3D 3) {
> +            *vector &=3D ~0x0000000000017000ull; /* Un-apply the base of=
fset */
> +            *vector |=3D 0xc000000000003000ull; /* Apply scv's AIL=3D3 o=
ffset */
> +        }



> +    }
> +#endif
>  }
> =20
>  static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
> @@ -197,7 +277,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      target_ulong msr, new_msr, vector;
> -    int srr0, srr1, asrr0, asrr1, lev =3D -1, ail;
> +    int srr0, srr1, asrr0, asrr1, lev =3D -1;
>      bool lpes0;
> =20
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> @@ -238,25 +318,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>       *
>       * On anything else, we behave as if LPES0 is 1
>       * (externals don't alter MSR:HV)
> -     *
> -     * AIL is initialized here but can be cleared by
> -     * selected exceptions
>       */
>  #if defined(TARGET_PPC64)
>      if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
>          excp_model =3D=3D POWERPC_EXCP_POWER8 ||
>          excp_model =3D=3D POWERPC_EXCP_POWER9) {
>          lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> -        if (excp_model !=3D POWERPC_EXCP_POWER7) {
> -            ail =3D (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
> -        } else {
> -            ail =3D 0;
> -        }
>      } else
>  #endif /* defined(TARGET_PPC64) */
>      {
>          lpes0 =3D true;
> -        ail =3D 0;
>      }
> =20
>      /*
> @@ -315,7 +386,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>               */
>              new_msr |=3D (target_ulong)MSR_HVB;
>          }
> -        ail =3D 0;
> =20
>          /* machine check exceptions don't have ME set */
>          new_msr &=3D ~((target_ulong)1 << MSR_ME);
> @@ -519,7 +589,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>                            "exception %d with no HV support\n", excp);
>              }
>          }
> -        ail =3D 0;
>          break;
>      case POWERPC_EXCP_DSEG:      /* Data segment exception              =
     */
>      case POWERPC_EXCP_ISEG:      /* Instruction segment exception       =
     */
> @@ -790,24 +859,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>      }
>  #endif
> =20
> -    /*
> -     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
> -     */
> -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
> -        ail =3D 0;
> -    }
> -
> -    /*
> -     * AIL does not work if there is a MSR[HV] 0->1 transition and the
> -     * partition is in HPT mode. For radix guests, such interrupts are
> -     * allowed to be delivered to the hypervisor in ail mode.
> -     */
> -    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
> -        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
> -            ail =3D 0;
> -        }
> -    }
> -
>      vector =3D env->excp_vectors[excp];
>      if (vector =3D=3D (target_ulong)-1ULL) {
>          cpu_abort(cs, "Raised an exception without defined vector %d\n",
> @@ -848,23 +899,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>          /* Save MSR */
>          env->spr[srr1] =3D msr;
> =20
> -        /* Handle AIL */
> -        if (ail) {
> -            new_msr |=3D (1 << MSR_IR) | (1 << MSR_DR);
> -            vector |=3D ppc_excp_vector_offset(cs, ail);
> -        }
> -
>  #if defined(TARGET_PPC64)
>      } else {
> -        /* scv AIL is a little different */
> -        if (ail) {
> -            new_msr |=3D (1 << MSR_IR) | (1 << MSR_DR);
> -        }
> -        if (ail =3D=3D AIL_C000_0000_0000_4000) {
> -            vector |=3D 0xc000000000003000ull;
> -        } else {
> -            vector |=3D 0x0000000000017000ull;
> -        }
>          vector +=3D lev * 0x20;
> =20
>          env->lr =3D env->nip;
> @@ -872,6 +908,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>  #endif
>      }
> =20
> +    /* This can update new_msr and vector if AIL applies */
> +    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
> +
>      powerpc_set_excp_state(cpu, vector, new_msr);
>  }
> =20
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 70f9b9b150..a82d9ed647 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -3457,7 +3457,7 @@ static void init_excp_POWER9(CPUPPCState *env)
> =20
>  #if !defined(CONFIG_USER_ONLY)
>      env->excp_vectors[POWERPC_EXCP_HVIRT]    =3D 0x00000EA0;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] =3D 0x00000000;
> +    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] =3D 0x00017000;
>  #endif
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uqfwfNxoXHklhGm/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB5EZMACgkQbDjKyiDZ
s5JaqRAAzwZfEq66wgfJ5cU8IuC0ccfbdQJO+1pfSZswTzDwu/s0G+7if2lWyaOg
ADLH3Fd0gIjOlsbrNE0KhkeT/IOFDCluqTzRhbob2wOTMSNuLMtKd3ilbqlRYZ+l
PATa4Vl8p6wtcHNCNL+cG02Eskbx+cOWvKaHTrmo3iLEt8kKmS80P3V+esm1tjaQ
CC76cNYuslF2qHoj6awdCKZFVzpxW2CtTC3F4odZn8HhDLVFf5nmk3ifgwH4NiVR
PK56tW38CmWYDHsc7863IEfo+QLZkwDUkbWiYS6W1Xdd0y7qsgqom1WXMEf6NJ+5
TCqc9/CZ3RwVm/39d3uQIZ/8EBx363uAppzMkX90zbXH/CHTYBsiY/TujprNrgYS
ZaYh7TD1ajJgAJ5zJagjB8VT0XW9KMAxYAsVQmJPWhUiqNqMunAh/aF89v2O/Etn
A2MupDyD/ZEGjyY3HfxeVYnzre+8DNOjnSsdeDoOIN6hbw1r8ovEZaqCr0jnfvyK
MIZAkJmX1B8pQ+8i2FAScfNDCyFtOoliUq8a2mT2f7fvK9ROwcI6D/lCiKuUI0Z5
wz52lQDs/lbPg0jXZ1Lv6tgcUTqcZqE6aC7RFvIslcDMiaGqUm69nQEjLsfOZGDE
8RyZ1LV7Vp+5oI69Zjb48A9f6Z3kLXlPDlJGTMFPYa6d1ySl/gE=
=neNu
-----END PGP SIGNATURE-----

--uqfwfNxoXHklhGm/--

