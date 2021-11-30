Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD2462BA2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 05:22:07 +0100 (CET)
Received: from localhost ([::1]:56166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrueb-0001Rj-M0
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 23:22:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mruaR-0007gY-Ks; Mon, 29 Nov 2021 23:17:47 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:57297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mruaO-0005pd-9D; Mon, 29 Nov 2021 23:17:47 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J38832QJ3z4xRB; Tue, 30 Nov 2021 15:17:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638245859;
 bh=Y9LDIKPZ2UANtvoLQbq5F3ZLaJi7XGP07aw0KDZ36fQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RT4QIoH0UTnCeLoRiPDWAv0CF7NB2PNkDmkrlfHcX9q+ZEcPcR2+y/wsM3TaY/KEe
 vQNMHFgXN17t6F4zfVX85UdKvKLPefzDhNdxTU7E/4MYUCWf5y5qjnAudifQ/dVlbv
 e1JhqAQ5uLh/XvOAvNoI7bR/wdfLhN5Z3GTOjnUk=
Date: Tue, 30 Nov 2021 15:11:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 08/10] PPC64/TCG: Implement 'rfebb' instruction
Message-ID: <YaWkXD5vGR5DgQIS@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-9-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UElYTfFymdyh/S0i"
Content-Disposition: inline
In-Reply-To: <20211125150817.573204-9-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UElYTfFymdyh/S0i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 12:08:15PM -0300, Daniel Henrique Barboza wrote:
> An Event-Based Branch (EBB) allows applications to change the NIA when a
> event-based exception occurs. Event-based exceptions are enabled by
> setting the Branch Event Status and Control Register (BESCR). If the
> event-based exception is enabled when the exception occurs, an EBB
> happens.
>=20
> The following operations happens during an EBB:
>=20
> - Global Enable (GE) bit of BESCR is set to 0;
> - bits 0-61 of the Event-Based Branch Return Register (EBBRR) are set
> to the the effective address of the NIA that would have executed if the E=
BB
> didn't happen;
> - Instruction fetch and execution will continue in the effective address
> contained in the Event-Based Branch Handler Register (EBBHR).
>=20
> The EBB Handler will process the event and then execute the Return From
> Event-Based Branch (rfebb) instruction. rfebb sets BESCR_GE and then
> redirects execution to the address pointed in EBBRR. This process is
> described in the PowerISA v3.1, Book II, Chapter 6 [1].
>=20
> This patch implements the rfebb instruction. Descriptions of all
> relevant BESCR bits are also added - this patch is only using BESCR_GE,
> but the next patches will use the remaining bits.
>=20
> [1] https://wiki.raptorcs.com/w/images/f/f5/PowerISA_public.v3.1.pdf
>=20
> Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

I'm guessing that for some applications rfebb could be a fairly hot
path, so you might want to rework this to avoid the helper.  But that
can certainly be a later improvement.

> ---
>  target/ppc/cpu.h                       | 13 ++++++++++
>  target/ppc/excp_helper.c               | 31 ++++++++++++++++++++++++
>  target/ppc/helper.h                    |  1 +
>  target/ppc/insn32.decode               |  5 ++++
>  target/ppc/translate.c                 |  2 ++
>  target/ppc/translate/branch-impl.c.inc | 33 ++++++++++++++++++++++++++
>  6 files changed, 85 insertions(+)
>  create mode 100644 target/ppc/translate/branch-impl.c.inc
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 993884164f..edb4488176 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -393,6 +393,19 @@ typedef enum {
>  /* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
>  #define CTRL_RUN PPC_BIT(63)
> =20
> +/* EBB/BESCR bits */
> +/* Global Enable */
> +#define BESCR_GE PPC_BIT(0)
> +/* External Event-based Exception Enable */
> +#define BESCR_EE PPC_BIT(30)
> +/* Performance Monitor Event-based Exception Enable */
> +#define BESCR_PME PPC_BIT(31)
> +/* External Event-based Exception Occurred */
> +#define BESCR_EEO PPC_BIT(62)
> +/* Performance Monitor Event-based Exception Occurred */
> +#define BESCR_PMEO PPC_BIT(63)
> +#define BESCR_INVALID PPC_BITMASK(32, 33)
> +
>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 17607adbe4..7ead32279c 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1250,6 +1250,37 @@ void helper_hrfid(CPUPPCState *env)
>  }
>  #endif
> =20
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +void helper_rfebb(CPUPPCState *env, target_ulong s)
> +{
> +    target_ulong msr =3D env->msr;
> +
> +    /*
> +     * Handling of BESCR bits 32:33 according to PowerISA v3.1:
> +     *
> +     * "If BESCR 32:33 !=3D 0b00 the instruction is treated as if
> +     *  the instruction form were invalid."
> +     */
> +    if (env->spr[SPR_BESCR] & BESCR_INVALID) {
> +        raise_exception_err(env, POWERPC_EXCP_PROGRAM,
> +                            POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVA=
L);
> +    }
> +
> +    env->nip =3D env->spr[SPR_EBBRR];
> +
> +    /* Switching to 32-bit ? Crop the nip */
> +    if (!msr_is_64bit(env, msr)) {
> +        env->nip =3D (uint32_t)env->spr[SPR_EBBRR];
> +    }
> +
> +    if (s) {
> +        env->spr[SPR_BESCR] |=3D BESCR_GE;
> +    } else {
> +        env->spr[SPR_BESCR] &=3D ~BESCR_GE;
> +    }
> +}
> +#endif
> +
>  /***********************************************************************=
******/
>  /* Embedded PowerPC specific helpers */
>  void helper_40x_rfci(CPUPPCState *env)
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index d8a23e054a..b0535b389b 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -18,6 +18,7 @@ DEF_HELPER_2(pminsn, void, env, i32)
>  DEF_HELPER_1(rfid, void, env)
>  DEF_HELPER_1(rfscv, void, env)
>  DEF_HELPER_1(hrfid, void, env)
> +DEF_HELPER_2(rfebb, void, env, tl)
>  DEF_HELPER_2(store_lpcr, void, env, tl)
>  DEF_HELPER_2(store_pcr, void, env, tl)
>  DEF_HELPER_2(store_mmcr0, void, env, tl)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index e135b8aba4..6cad783dde 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -427,3 +427,8 @@ XXSPLTW         111100 ..... ---.. ..... 010100100 . =
=2E  @XX2
>  ## VSX Vector Load Special Value Instruction
> =20
>  LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
> +
> +### rfebb
> +&XL_s           s:uint8_t
> +@XL_s           ......-------------- s:1 .......... -   &XL_s
> +RFEBB           010011-------------- .   0010010010 -   @XL_s
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index d0e361a9d1..d643a83a51 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7467,6 +7467,8 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D =
*d, arg_PLS_D *a)
> =20
>  #include "translate/spe-impl.c.inc"
> =20
> +#include "translate/branch-impl.c.inc"
> +
>  /* Handles lfdp, lxsd, lxssp */
>  static void gen_dform39(DisasContext *ctx)
>  {
> diff --git a/target/ppc/translate/branch-impl.c.inc b/target/ppc/translat=
e/branch-impl.c.inc
> new file mode 100644
> index 0000000000..29cfa11854
> --- /dev/null
> +++ b/target/ppc/translate/branch-impl.c.inc
> @@ -0,0 +1,33 @@
> +/*
> + * Power ISA decode for branch instructions
> + *
> + *  Copyright IBM Corp. 2021
> + *
> + * Authors:
> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +
> +static bool trans_RFEBB(DisasContext *ctx, arg_XL_s *arg)
> +{
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
> +
> +    gen_icount_io_start(ctx);
> +    gen_update_cfar(ctx, ctx->cia);
> +    gen_helper_rfebb(cpu_env, cpu_gpr[arg->s]);
> +
> +    ctx->base.is_jmp =3D DISAS_CHAIN;
> +
> +    return true;
> +}
> +#else
> +static bool trans_RFEBB(DisasContext *ctx, arg_XL_s *arg)
> +{
> +    gen_invalid(ctx);
> +    return true;
> +}
> +#endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UElYTfFymdyh/S0i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGlpFkACgkQbDjKyiDZ
s5LlLw//WfgY/W+wSPiUtg8mM6cXQWh2+09s7djD4fRotbeUuLk3JGtG9mqSBWy9
g3F6o5U1sKKYBd6gejkyyqdxZ1S4WX53hHR7MG5JFqk9sgrZIYfIBagrFopZ2icr
ipKCD1sAgIIt81BpXgoPTgizIK5zw09NN/0mHZ6P2UvkBN9x0JBTvEZ9OTCh5TUP
LFxk5cfW9oChtGA+qNvHsH7U3MCON1UovWP3wJyCm7hkLf3E2PdpnNlJOcnErwmj
La009x7hzxl5VPpZve2NSMPeOPu5J/rhS8qVygon9yieuVVNQ3Q6sfOcnnnd/yUk
RhUUqERu9rhK9dxkHqZPwbdnzD3B384zUx1j7vLfzoSbNYYNQyJ2VUA1lQ1VWIaG
VawFez1L9hBNFK1o01wI3JQzz++c7Nkn3gV32NxS6B4iDgLbiYXWUhok1T2mPotE
uNWUsUfb5C9SPI2dMbgXBdibt+sn1AkPL7R6wkut3E7RWHP66aFTQzKp/dd2DbK1
yWJgO34n5QYCr/7INM6AthM+9pYNA9BPNa2nFOKNlUQucQXJzz6LUebG1WvQJJTw
/Fm020Gz3vRm/PxKc6q8ORnUDW6p57fzuSszxlGbN/wpy2y2t05FhktnMKGv/b7U
UMb2aAl8zVIgJZ6KNqBQpVi//vK0DL+ar8WDRurroMht1LQxPCY=
=kNz0
-----END PGP SIGNATURE-----

--UElYTfFymdyh/S0i--

