Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DF9493899
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:34:04 +0100 (CET)
Received: from localhost ([::1]:35670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8Hy-0004Yo-Tn
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86a-0003NL-0W; Wed, 19 Jan 2022 05:22:16 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:59693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86X-0007oo-41; Wed, 19 Jan 2022 05:22:15 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jf1sT1XN2z4y3t; Wed, 19 Jan 2022 21:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642587725;
 bh=6lfp6hMaEBr9J2YWg9gmYqzzKf61wDygx+d/b6/4Jr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQbg+gW++BzE6parQlmh+03KLWyaaAr9GihmRByunA9mCtl8Nr5TXxwCfHPWRXSe4
 C8C0+rxwfgZE6uoB02otfEqTSehBRRAFxhychUZJd6stzoUken5Hl9E9oL0xqRpXNY
 7dpH6SMoALCWxtIdfRKa9Iu3kX7diwYtP0YxyzUw=
Date: Wed, 19 Jan 2022 17:04:46 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 04/14] target/ppc: Simplify powerpc_excp_40x
Message-ID: <Yeep/om7Nbc3SX5y@yekko>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bVcjyxqCRuPtLzdB"
Content-Disposition: inline
In-Reply-To: <20220118184448.852996-5-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bVcjyxqCRuPtLzdB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 03:44:38PM -0300, Fabiano Rosas wrote:
> Differences from the generic powerpc_excp code:
>=20
> - Not BookE, so some MSR bits are cleared at interrupt dispatch;
> - No MSR_HV or MSR_LE;
> - No power saving states;
> - No Hypervisor Emulation Assistance;
> - Not 64 bits;
> - No System call vectored;
> - No Interrupts Little Endian;
> - No Alternate Interrupt Location.
>=20
> Exceptions used:
>=20
> POWERPC_EXCP_ALIGN
> POWERPC_EXCP_CRITICAL
> POWERPC_EXCP_DEBUG
> POWERPC_EXCP_DSI
> POWERPC_EXCP_DTLB
> POWERPC_EXCP_EXTERNAL
> POWERPC_EXCP_FIT
> POWERPC_EXCP_ISI
> POWERPC_EXCP_ITLB
> POWERPC_EXCP_MCHECK
> POWERPC_EXCP_PIT
> POWERPC_EXCP_PROGRAM
> POWERPC_EXCP_SYSCALL
> POWERPC_EXCP_WDT
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 205 ++-------------------------------------
>  1 file changed, 10 insertions(+), 195 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 12ab5e1b34..b5975dff3e 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -409,54 +409,26 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
xcp)
>                    excp, env->error_code);
> =20
>      /* new srr1 value excluding must-be-zero bits */
> -    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> -        msr =3D env->msr;
> -    } else {
> -        msr =3D env->msr & ~0x783f0000ULL;
> -    }
> +    msr =3D env->msr & ~0x783f0000ULL;
> =20
>      /*
> -     * new interrupt handler msr preserves existing HV and ME unless
> -     * explicitly overriden
> +     * new interrupt handler msr preserves existing ME unless
> +     * explicitly overriden.
>       */
> -    new_msr =3D env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> +    new_msr =3D env->msr & (((target_ulong)1 << MSR_ME));
> =20
>      /* target registers */
>      srr0 =3D SPR_SRR0;
>      srr1 =3D SPR_SRR1;
> =20
> -    /*
> -     * check for special resume at 0x100 from doze/nap/sleep/winkle on
> -     * P7/P8/P9
> -     */
> -    if (env->resume_as_sreset) {
> -        excp =3D powerpc_reset_wakeup(cs, env, excp, &msr);
> -    }
> -
>      /*
>       * Hypervisor emulation assistance interrupt only exists on server
> -     * arch 2.05 server or later. We also don't want to generate it if
> -     * we don't have HVB in msr_mask (PAPR mode).
> +     * arch 2.05 server or later.
>       */
> -    if (excp =3D=3D POWERPC_EXCP_HV_EMU
> -#if defined(TARGET_PPC64)
> -        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
> -#endif /* defined(TARGET_PPC64) */
> -
> -    ) {
> +    if (excp =3D=3D POWERPC_EXCP_HV_EMU) {
>          excp =3D POWERPC_EXCP_PROGRAM;
>      }
> =20
> -#ifdef TARGET_PPC64
> -    /*
> -     * SPEU and VPU share the same IVOR but they exist in different
> -     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
> -     */
> -    if (excp_model =3D=3D POWERPC_EXCP_BOOKE && excp =3D=3D POWERPC_EXCP=
_VPU) {
> -        excp =3D POWERPC_EXCP_SPEU;
> -    }
> -#endif
> -
>      vector =3D env->excp_vectors[excp];
>      if (vector =3D=3D (target_ulong)-1ULL) {
>          cpu_abort(cs, "Raised an exception without defined vector %d\n",
> @@ -645,24 +617,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int ex=
cp)
>              new_msr |=3D (target_ulong)MSR_HVB;
>          }
>          break;
> -    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                =
     */
> -        lev =3D env->error_code;
> -        dump_syscall(env);
> -        env->nip +=3D 4;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -
> -        vector +=3D lev * 0x20;
> -
> -        env->lr =3D env->nip;
> -        env->ctr =3D msr;
> -        break;
> -    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception=
     */
> -    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable     =
     */
> -    case POWERPC_EXCP_DECR:      /* Decrementer exception               =
     */
> -        break;
>      case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt      =
     */
> -        /* FIT on 4xx */
>          trace_ppc_excp_print("FIT");
>          break;
>      case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt            =
     */
> @@ -693,119 +648,9 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
xcp)
>              cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
>          }
>          break;
> -    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable=
/VPU  */
> -        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt         =
     */
> -        break;
> -    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt=
     */
> -        srr0 =3D SPR_BOOKE_CSRR0;
> -        srr1 =3D SPR_BOOKE_CSRR1;
> -        break;
> -    case POWERPC_EXCP_RESET:     /* System reset exception              =
     */
> -        /* A power-saving exception sets ME, otherwise it is unchanged */
> -        if (msr_pow) {
> -            /* indicate that we resumed from power save mode */
> -            msr |=3D 0x10000;
> -            new_msr |=3D ((target_ulong)1 << MSR_ME);
> -        }
> -        if (env->msr_mask & MSR_HVB) {
> -            /*
> -             * ISA specifies HV, but can be delivered to guest with HV
> -             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
> -             */
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -        } else {
> -            if (msr_pow) {
> -                cpu_abort(cs, "Trying to deliver power-saving system res=
et "
> -                          "exception %d with no HV support\n", excp);
> -            }
> -        }
> -        break;
> -    case POWERPC_EXCP_DSEG:      /* Data segment exception              =
     */
> -    case POWERPC_EXCP_ISEG:      /* Instruction segment exception       =
     */
> -    case POWERPC_EXCP_TRACE:     /* Trace exception                     =
     */
> -        break;
> -    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage excep=
tion */
> -        msr |=3D env->error_code;
> -        /* fall through */
> -    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception    =
     */
> -    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception   =
     */
> -    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception   =
     */
> -    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment excep=
tion */
> -    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt       =
     */
> -    case POWERPC_EXCP_HV_EMU:
> -    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization           =
     */
> -        srr0 =3D SPR_HSRR0;
> -        srr1 =3D SPR_HSRR1;
> -        new_msr |=3D (target_ulong)MSR_HVB;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -        break;
> -    case POWERPC_EXCP_VPU:       /* Vector unavailable exception        =
     */
> -    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception          =
     */
> -    case POWERPC_EXCP_FU:         /* Facility unavailable exception     =
     */
> -#ifdef TARGET_PPC64
> -        env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << 56);
> -#endif
> -        break;
> -    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exce=
ption */
> -#ifdef TARGET_PPC64
> -        env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FSCR_=
IC_POS);
> -        srr0 =3D SPR_HSRR0;
> -        srr1 =3D SPR_HSRR1;
> -        new_msr |=3D (target_ulong)MSR_HVB;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -#endif
> -        break;
>      case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
>          trace_ppc_excp_print("PIT");
>          break;
> -    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error         =
     */
> -    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
> -    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_602:
> -        case POWERPC_EXCP_603:
> -        case POWERPC_EXCP_G2:
> -            /* Swap temporary saved registers with GPRs */
> -            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
> -                new_msr |=3D (target_ulong)1 << MSR_TGPR;
> -                hreg_swap_gpr_tgpr(env);
> -            }
> -            /* fall through */
> -        case POWERPC_EXCP_7x5:
> -            ppc_excp_debug_sw_tlb(env, excp);
> -
> -            msr |=3D env->crf[0] << 28;
> -            msr |=3D env->error_code; /* key, D/I, S/L bits */
> -            /* Set way using a LRU mechanism */
> -            msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
> -            break;
> -        default:
> -            cpu_abort(cs, "Invalid TLB miss exception\n");
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
> -    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
> -    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
> -    case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
> -    case POWERPC_EXCP_RUNM:      /* Run mode exception                  =
     */
> -    case POWERPC_EXCP_EMUL:      /* Emulation trap exception            =
     */
> -    case POWERPC_EXCP_FPA:       /* Floating-point assist exception     =
     */
> -    case POWERPC_EXCP_DABR:      /* Data address breakpoint             =
     */
> -    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint      =
     */
> -    case POWERPC_EXCP_SMI:       /* System management interrupt         =
     */
> -    case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
> -    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
> -    case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
     */
> -    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                =
     */
> -    case POWERPC_EXCP_MAINT:     /* Maintenance exception               =
     */
> -    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint        =
     */
> -    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint    =
     */
> -        cpu_abort(cs, "%s exception not implemented\n",
> -                  powerpc_excp_name(excp));
> -        break;
>      default:
>      excp_invalid:
>          cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> @@ -824,41 +669,11 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
xcp)
>          }
>      }
> =20
> -    /*
> -     * Sort out endianness of interrupt, this differs depending on the
> -     * CPU, the HV mode, etc...
> -     */
> -    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
> -        new_msr |=3D (target_ulong)1 << MSR_LE;
> -    }
> +    /* Save PC */
> +    env->spr[srr0] =3D env->nip;
> =20
> -#if defined(TARGET_PPC64)
> -    if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> -        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
> -            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
> -            new_msr |=3D (target_ulong)1 << MSR_CM;
> -        } else {
> -            vector =3D (uint32_t)vector;
> -        }
> -    } else {
> -        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
> -            vector =3D (uint32_t)vector;
> -        } else {
> -            new_msr |=3D (target_ulong)1 << MSR_SF;
> -        }
> -    }
> -#endif
> -
> -    if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
> -        /* Save PC */
> -        env->spr[srr0] =3D env->nip;
> -
> -        /* Save MSR */
> -        env->spr[srr1] =3D msr;
> -    }
> -
> -    /* This can update new_msr and vector if AIL applies */
> -    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
> +    /* Save MSR */
> +    env->spr[srr1] =3D msr;
> =20
>      powerpc_set_excp_state(cpu, vector, new_msr);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bVcjyxqCRuPtLzdB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHnqfcACgkQgypY4gEw
YSLc/g//bumaqexXo+/WV3ABDXED1WBy4xiWUeWXPeHuq/JZ0a7XCLYMujKdeVYj
OjMnx9qAXFSP6CO4OPDfaoJdKOU/qMqxKhKaOeliqqsh3KFQzj+P5eeo9Plw+6TK
kQdyxz0DIzeWtURTGd2ywdhbpOLS2/T/MF2Mpsqz0o73UCieBEmZu2iuM38tiQF4
KVzurqI96JrOmsJtgfY9WSmfoXq+eZf7Yu/gNxq8UKZRyqF67PT7aSFlaPI+wlyo
kpekCPFTNO+H31JHHPEOXbBaSUEOta9ZAnjD7h2DnfbJQFzM/lOPwwXzb2/4grQQ
Dp6Ccl8vB9klmlD3SVRrBGsMvSR7xeFN1I/Ydti4iUYkCyzDsWHAxO1PU9UqUJs3
/HM+4WufhM8vAxSGIHw1ahdAqV0jMNbOv8YS+pcuNkMBWTKiRuw+rYA7vzeOMoHe
qmuNt5gV4DOvvcDYO7kNoscK9aVmIDuChSQzNvU8pe4vXwrDudLUxIPxHEO/GRJ2
ccscVp5pIFHjUNHp283DPThAPJOWX1I1FHyLlAFChz94Qu7kyXow1ncc4vClBIT1
TRPDmzaTwPTiZRcgCUY4c5W4Al3PgAgJ2PVVmi17TUjkyka+f5cllO2VQEvtC/mI
7mV2vr4DY+yUNaEwff4rw0npntYKzgSE86qZxMKt/75YdHaT6vY=
=5n1w
-----END PGP SIGNATURE-----

--bVcjyxqCRuPtLzdB--

