Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F152307D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:14:11 +0200 (CEST)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nojMA-0007Jm-QE
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1nojKK-0005il-CH; Wed, 11 May 2022 06:12:17 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1nojKI-0007Dy-9k; Wed, 11 May 2022 06:12:16 -0400
Received: by mail-pl1-x633.google.com with SMTP id d17so1466582plg.0;
 Wed, 11 May 2022 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version;
 bh=y4Esvdb+OMsQXNCiQrX4avlTTX7PN4AslkwCUG9/Fh0=;
 b=Mt38pG8aJs6FWofo+hdehIYb4iHS2cX1gJqsG8Jewk/jh/IE53zo3dv8ty5BzrvXfP
 Sec45BhQ8d+Axwzj6p/yYyePvQURCAEWLFupG27XRcamsUoj1kkhoU6hzMA5wVGavhTF
 F7rQUQ/dU2IUC/Egxp9Soi3bj16OpqFzBDoSl1ujDKz21a8YEtLINYnTb9CZ7JanCKt9
 EGOZ2AonQFLBDk7InXtjLlS9iSBKaQ3n2KX+FY8a+IF5eQ0SATUPeRYRJMEWjb2xgMoX
 0Pvr4tgD/MvWT6rkvRY5cqnaauA9QT0RbXJi+eSxnVe48io794axjOAAmBWDGTgWwXGP
 6/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version;
 bh=y4Esvdb+OMsQXNCiQrX4avlTTX7PN4AslkwCUG9/Fh0=;
 b=jwnpcRWUKT2UMDNPssM159gWtwgEd05xKYMLAzJz4me3TAFtASJl7NEd9SnOH/kgIz
 z3lSf+qxsAcfoHj6PZLOV4+HCbm2XPzK19lZSBa6LXNP41vp6+i2ot3Cjuo7GmRakUm+
 R9t8FHT6AgcJti35eAOSZPRUGPiy8XVH6T8SLPCCvwfjfXeqTORZu7SU9Eyqy5oOjIcU
 T1+N45XqbMMiMc4q2oXGRnErGN81mcyYL0tqVPdOKZuhUq9dJ9E6e+O7uKtgf/J0+9/4
 5l7xTJOILFqNGl57guiJbhdS7HTWiTHzxVDSuZTDpEOPteP4mwawojGa05nzKN0ar92Y
 vC3w==
X-Gm-Message-State: AOAM532Yn77vRSbBJC7ubut1MsZeWg3Z0tSRNuwXLAUZCU+N0u9/dFMp
 kxm6f3E8VuvRn20hmKm3FXM=
X-Google-Smtp-Source: ABdhPJx8l3xlXgP7pBIwV+f58sFpLuhagiiJuWcZB301h5CVrD30D1a26q4KzrQsyOnDZ4By1e7VEg==
X-Received: by 2002:a17:903:2c1:b0:158:f9d0:839c with SMTP id
 s1-20020a17090302c100b00158f9d0839cmr24295792plk.118.1652263930252; 
 Wed, 11 May 2022 03:12:10 -0700 (PDT)
Received: from [10.0.30.13] (116-255-17-40.ip4.superloop.com. [116.255.17.40])
 by smtp.googlemail.com with ESMTPSA id
 u6-20020a170902bf4600b0015e8d4eb25fsm1347832pls.169.2022.05.11.03.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 03:12:09 -0700 (PDT)
Message-ID: <244b0614581cbec66f6cf87dd13f806af036b769.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] target/ppc: Fix FPSCR.FI bit being cleared when
 it shouldn't
From: Rashmica Gupta <rashmica.g@gmail.com>
To: =?ISO-8859-1?Q?V=EDctor?= Colombo <victor.colombo@eldorado.org.br>, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au, 
 groug@kaod.org, richard.henderson@linaro.org, Nicholas Piggin
 <npiggin@gmail.com>,  Paul Mackerras <paulus@samba.org>
Date: Wed, 11 May 2022 20:12:02 +1000
In-Reply-To: <20220510204610.100867-2-victor.colombo@eldorado.org.br>
References: <20220510204610.100867-1-victor.colombo@eldorado.org.br>
 <20220510204610.100867-2-victor.colombo@eldorado.org.br>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-7lFHgzn+P4XQO3nEbVq4"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=rashmica.g@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--=-7lFHgzn+P4XQO3nEbVq4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

cc'ing Paul and Nick for clarification on the behaviour of xsrsp (see below=
)


On Tue, 2022-05-10 at 17:46 -0300, V=C3=ADctor Colombo wrote:
> The FI bit in FPSCR is said to be a non-sticky bit on Power ISA.
> One could think this means that, if an instruction is said to modify
> the FPSCR register, the bit FI should be cleared. This is what QEMU
> does today.
>=20
> However, the following inconsistency was found when comparing results
> from the hardware (tested on both a Power 9 processor and in
> Power 10 Mambo):
>=20
> (FI bit is set before the execution of the instruction)
> Hardware: xscmpeqdp(0xff..ff, 0xff..ff) =3D FI: SET -> SET
> QEMU: xscmpeqdp(0xff..ff, 0xff..ff) =3D FI: SET -> CLEARED
>=20
> This is happening to multiple instructions in the vsx
> implementations. As the FI bit is non-sticky, one could think that
> xscmpeqdp, a instruction the ISA states doesn't change FI bit, should
> result in a cleared FI. However, this is not happening on hardware.

I would think that if an instruction doesn't change a bit
then that instruction wouldn't clear or set that bit, regardless of if
that bit is sticky or not.

>=20
> An investigation resulted in the following conclusion:
> If the ISA does not list the FI bit as altered for a particular
> instruction, then it should be kept as it was before the instruction.
>=20
> QEMU is not following this behavior. Affected instructions include:
> - xv* (all vsx-vector instructions);
> - xscmp*, xsmax*, xsmin*;
> - xstdivdp and similars;
> (to identify the affected instructions, just search in the ISA for
> =C2=A0the instructions that does not list FI in "Special Registers
> Altered")

The ISA does state=20
"Floating-Point Fraction Inexact (FI)
This bit is set to 0 or 1 by VSX Scalar
Floating-Point Arithmetic, VSX Scalar Integer
Conversion, and VSX Scalar Round to
Floating-Point Integer class instructions to
indicate whether or not the rounded result is
inexact or the instruction caused a disabled
Overflow exception. See Section 7.3.2.6 on
page 524. This bit is not sticky."

So it seems that instruction classes like VSX Vector Round and VSX Vector
convert don't touch the FI bit.

>=20
> Most instructions use the function do_float_check_status() to commit
> changes in the inexact flag. So the fix is to add a parameter to it
> that will control if the bit FI should be changed or not.
> All users of do_float_check_status() are then modified to provide
> this
> argument, controlling if that specific instruction changes bit FI or
> not.
> Some macro helpers are responsible for both instructions that change
> and instructions that aren't suposed to change FI. This seems to
> always
> overlap with the sfprf flag. So, reuse this flag for this purpose
> when
> applicable.
>=20
> Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
>=20
> ---
>=20
> v2:
> - move the FI change from float_inexact_excp to do_float_check_status
> - sfprf will be renamed to sfifprf in another patch, as suggested by
> =C2=A0 Richard
> ---
> =C2=A0target/ppc/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +
> =C2=A0target/ppc/fpu_helper.c | 122 +++++++++++++++++++++----------------=
-
> --
> =C2=A02 files changed, 66 insertions(+), 58 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 48596cfb25..901ded79e9 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -735,6 +735,8 @@ enum {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << FPSCR_VX=
SOFT) | (1 << FPSCR_VXSQRT) | \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << FPSCR_VX=
CVI))
> =C2=A0
> +FIELD(FPSCR, FI, FPSCR_FI, 1)
> +
> =C2=A0#define FP_DRN2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1u=
ll << FPSCR_DRN2)
> =C2=A0#define FP_DRN1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1u=
ll << FPSCR_DRN1)
> =C2=A0#define FP_DRN0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1u=
ll << FPSCR_DRN0)
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index f6c8318a71..f1ea4aa10e 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -370,7 +370,6 @@ static inline void float_inexact_excp(CPUPPCState
> *env)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 CPUState *cs =3D env_cpu(env);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 env->fpscr |=3D FP_FI;
> =C2=A0=C2=A0=C2=A0=C2=A0 env->fpscr |=3D FP_XX;
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Update the floating-point exception summary *=
/
> =C2=A0=C2=A0=C2=A0=C2=A0 env->fpscr |=3D FP_FX;
> @@ -462,7 +461,8 @@ void helper_fpscr_check_status(CPUPPCState *env)
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
> +static void do_float_check_status(CPUPPCState *env, bool change_fi,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uintptr_t raddr)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 CPUState *cs =3D env_cpu(env);
> =C2=A0=C2=A0=C2=A0=C2=A0 int status =3D get_float_exception_flags(&env->f=
p_status);
> @@ -474,8 +474,10 @@ static void do_float_check_status(CPUPPCState
> *env, uintptr_t raddr)
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 if (status & float_flag_inexact) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 float_inexact_excp(env);
> -=C2=A0=C2=A0=C2=A0 } else {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->fpscr &=3D ~FP_FI; /* cl=
ear the FPSCR[FI] bit */
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 if (change_fi) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->fpscr =3D FIELD_DP64(env=
->fpscr, FPSCR, FI,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !!(status & float_flag_inexact));
> =C2=A0=C2=A0=C2=A0=C2=A0 }


According to the ISA not all instructions that affect FI, set FI on an
inexact exception (xsrqpi apparently clears FI on an inexact exception
-- I have no idea if this actually happens on hardware).


> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if (cs->exception_index =3D=3D POWERPC_EXCP_PROG=
RAM &&
> @@ -490,7 +492,7 @@ static void do_float_check_status(CPUPPCState
> *env, uintptr_t raddr)
> =C2=A0
> =C2=A0void helper_float_check_status(CPUPPCState *env)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0 do_float_check_status(env, GETPC());
> +=C2=A0=C2=A0=C2=A0 do_float_check_status(env, true, GETPC());
> =C2=A0}
> =C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0
... snip ...

> @@ -3195,7 +3201,7 @@ uint64_t helper_xsrsp(CPUPPCState *env,
> uint64_t xb)
> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t xt =3D do_frsp(env, xb, GETPC());
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 helper_compute_fprf_float64(env, xt);
> -=C2=A0=C2=A0=C2=A0 do_float_check_status(env, GETPC());
> +=C2=A0=C2=A0=C2=A0 do_float_check_status(env, true, GETPC());
> =C2=A0=C2=A0=C2=A0=C2=A0 return xt;
> =C2=A0}

I'm not clear what the behaviour of xsrsp should be.=20

Section 7.4.5 Floating-Point Inexact Exception leads me to think it
shouldn't affect FI but the instruction definition indicates the
opposite. Maybe Paul or Nick can weigh in on this?


> =C2=A0
> @@ -3355,7 +3361,7 @@ void helper_xsrqpi(CPUPPCState *env, uint32_t
> opcode,
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 helper_compute_fprf_float128(env, t.f128);
> -=C2=A0=C2=A0=C2=A0 do_float_check_status(env, GETPC());
> +=C2=A0=C2=A0=C2=A0 do_float_check_status(env, true, GETPC());
> =C2=A0=C2=A0=C2=A0=C2=A0 *xt =3D t;
> =C2=A0}
> =C2=A0
> @@ -3408,7 +3414,7 @@ void helper_xsrqpxp(CPUPPCState *env, uint32_t
> opcode,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 helper_compute_fprf_float128(env, t.f128);
> =C2=A0=C2=A0=C2=A0=C2=A0 *xt =3D t;
> -=C2=A0=C2=A0=C2=A0 do_float_check_status(env, GETPC());
> +=C2=A0=C2=A0=C2=A0 do_float_check_status(env, true, GETPC());
> =C2=A0}
> =C2=A0
> =C2=A0void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode,
> @@ -3434,7 +3440,7 @@ void helper_xssqrtqp(CPUPPCState *env, uint32_t
> opcode,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 helper_compute_fprf_float128(env, t.f128);
> =C2=A0=C2=A0=C2=A0=C2=A0 *xt =3D t;
> -=C2=A0=C2=A0=C2=A0 do_float_check_status(env, GETPC());
> +=C2=A0=C2=A0=C2=A0 do_float_check_status(env, true, GETPC());
> =C2=A0}
> =C2=A0
> =C2=A0void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
> @@ -3460,5 +3466,5 @@ void helper_xssubqp(CPUPPCState *env, uint32_t
> opcode,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 helper_compute_fprf_float128(env, t.f128);
> =C2=A0=C2=A0=C2=A0=C2=A0 *xt =3D t;
> -=C2=A0=C2=A0=C2=A0 do_float_check_status(env, GETPC());
> +=C2=A0=C2=A0=C2=A0 do_float_check_status(env, true, GETPC());
> =C2=A0}


All the other instruction helpers and definitions look correct to me.

--=-7lFHgzn+P4XQO3nEbVq4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEERkA2etWI6dXQfX34cbqTfKjlEScFAmJ7i/IACgkQcbqTfKjl
EScSugf/erPLIaJgm+SZeHzxe6HN9lAkvPK5yLtVepr4VKV6SCuS1S++CrRU7/J3
1K7KjZG4PVqgmDIKMPWkCL8G2kvVSWIufBOFkJ57o9no9MjpIc7M0q7/0V0tjnDH
9k2ZmTOYHQjIvONor0XMNrJhKXob6A4QqZ6mWcb+8rgfqQd8Ef7jpZOwNh91zo0Q
958UVjimR7NV/1jxcb1Rzd0AttQLvoP82TvONxPPqNKCdKhY5xEj7z2tBLd4TlVK
k4RJWUlt36RpViJXbG0NXToX/YPyuM7AZuRTba4n3KTxkv8X8IXHmC/30b4Mc6Xb
OF5EnSAnhENUor3KeSVAp0Vv9NXAIA==
=Y4oQ
-----END PGP SIGNATURE-----

--=-7lFHgzn+P4XQO3nEbVq4--

