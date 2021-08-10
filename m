Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59AD3E5235
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:32:10 +0200 (CEST)
Received: from localhost ([::1]:44902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJQv-0005s6-Qv
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDx-0008PC-KD; Tue, 10 Aug 2021 00:18:45 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39685 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDv-0002V6-Ct; Tue, 10 Aug 2021 00:18:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSW1WVwz9tJD; Tue, 10 Aug 2021 14:18:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569099;
 bh=bKI97DIAsrok+RAw8Jt3CqQIpdqgz2AM5CMAspw8tV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=anl/8ZtkZKSOiqSPlhgFWJdQXqfs+pcaZMQY7Gx/C9t46eP7sMsEdCnbGdE34MJHJ
 Xh1tqXAFgZGHTu5Vg+krw6X4h/27xCaEgqG+4xNRI8j6nbjwOyfxOBp65viQxMgUny
 A2M9e/gxigGgKOf70xsgV82bKIX58idEsyX4ArCQ=
Date: Tue, 10 Aug 2021 14:11:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 15/19] target/ppc/pmu_book3s_helper: enable counter
 negative for all PMCs
Message-ID: <YRH8dz8SLDFWTe1m@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-16-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+vr/VfFO52u+GkZ9"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-16-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+vr/VfFO52u+GkZ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:53AM -0300, Daniel Henrique Barboza wrote:
> All performance monitor counters can trigger a counter negative
> condition if the proper MMCR0 bits are set. This patch does that by
> doing the following:
>=20
> - pmc_counter_negative_enabled() will check whether a given PMC is
> eligible to trigger the counter negative alert;
>=20
> - get_counter_neg_timeout() will return the timeout for the counter
> negative condition for a given PMC, or -1 if the PMC is not able to
> trigger this alert;
>=20
> - the existing counter_negative_cond_enabled() now must consider the
> counter negative bit for PMCs 2-6, MMCR0_PMCjCE;
>=20
> - set_PMU_excp_timer() will now search all existing PMCs for the
> shortest counter negative timeout. The shortest timeout will be used to
> set the PMC interrupt timer.
>=20
> This change makes most EBB powepc kernel tests pass, validating that the
> existing EBB logic is consistent. There are a few tests that aren't passi=
ng
> due to additional PMU bits and perf events that aren't covered yet.
> We'll attempt to cover some of those in the next patches.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h               |  1 +
>  target/ppc/pmu_book3s_helper.c | 96 ++++++++++++++++++++++++++++++----
>  2 files changed, 87 insertions(+), 10 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 5c81d459f4..1aa1fd42af 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -351,6 +351,7 @@ typedef struct ppc_v3_pate_t {
>  #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
>  #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
>  #define MMCR0_PMC1CE PPC_BIT(48)
> +#define MMCR0_PMCjCE PPC_BIT(49)
> =20
>  #define MMCR1_PMC1SEL_SHIFT (63 - 39)
>  #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> index 7126e9b3d5..c5c5ab38c9 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -143,22 +143,98 @@ static int64_t get_CYC_timeout(CPUPPCState *env, in=
t sprn)
>      return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
>  }
> =20
> -static void set_PMU_excp_timer(CPUPPCState *env)
> +static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
>  {
> -    uint64_t timeout, now;
> +    switch (sprn) {
> +    case SPR_POWER_PMC1:
> +        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
> =20
> -    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
> -        return;
> +    case SPR_POWER_PMC2:
> +    case SPR_POWER_PMC3:
> +    case SPR_POWER_PMC4:
> +    case SPR_POWER_PMC5:
> +    case SPR_POWER_PMC6:
> +        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
> +
> +    default:
> +        break;
>      }
> =20
> -    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
> -    case 0x2:
> -        timeout =3D get_INST_CMPL_timeout(env, SPR_POWER_PMC1);
> +    return false;
> +}
> +
> +static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
> +{
> +    int64_t timeout =3D -1;
> +
> +    if (!pmc_counter_negative_enabled(env, sprn)) {
> +        return -1;
> +    }
> +
> +    if (env->spr[sprn] >=3D COUNTER_NEGATIVE_VAL) {
> +        return 0;
> +    }
> +
> +    switch (sprn) {
> +    case SPR_POWER_PMC1:
> +    case SPR_POWER_PMC2:
> +    case SPR_POWER_PMC3:
> +    case SPR_POWER_PMC4:
> +        switch (get_PMC_event(env, sprn)) {
> +        case 0x2:
> +            timeout =3D get_INST_CMPL_timeout(env, sprn);
> +            break;
> +        case 0x1E:
> +            timeout =3D get_CYC_timeout(env, sprn);
> +            break;
> +        }
> +
>          break;
> -    case 0x1e:
> -        timeout =3D get_CYC_timeout(env, SPR_POWER_PMC1);
> +    case SPR_POWER_PMC5:
> +        timeout =3D get_INST_CMPL_timeout(env, sprn);
> +        break;
> +    case SPR_POWER_PMC6:
> +        timeout =3D get_CYC_timeout(env, sprn);
>          break;
>      default:
> +        break;
> +    }
> +
> +    return timeout;
> +}
> +
> +static void set_PMU_excp_timer(CPUPPCState *env)
> +{
> +    int64_t timeout =3D -1;
> +    uint64_t now;
> +    int i;
> +
> +    /*
> +     * Scroll through all PMCs and check which one is closer to a
> +     * counter negative timeout.

I'm wondering if it would be simpler to use a separate timer for each
PMC: after all the core timer logic must have already implemented this
"who fires first" logic.

> +     */
> +    for (i =3D SPR_POWER_PMC1; i <=3D SPR_POWER_PMC6; i++) {
> +        int64_t curr_timeout =3D get_counter_neg_timeout(env, i);
> +
> +        if (curr_timeout =3D=3D -1) {
> +            continue;
> +        }
> +
> +        if (curr_timeout =3D=3D 0) {
> +            timeout =3D 0;
> +            break;
> +        }
> +
> +        if (timeout =3D=3D -1 || timeout > curr_timeout) {
> +            timeout =3D curr_timeout;
> +        }
> +    }
> +
> +    /*
> +     * This can happen if counter negative conditions were enabled
> +     * without any events to be sampled.
> +     */
> +    if (timeout =3D=3D -1) {
>          return;
>      }
> =20
> @@ -204,7 +280,7 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
> =20
>  static bool counter_negative_cond_enabled(uint64_t mmcr0)
>  {
> -    return mmcr0 & MMCR0_PMC1CE;
> +    return mmcr0 & (MMCR0_PMC1CE | MMCR0_PMCjCE);
>  }
> =20
>  void helper_store_mmcr0(CPUPPCState *env, target_ulong value)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+vr/VfFO52u+GkZ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER/HYACgkQbDjKyiDZ
s5Lk0hAA0ANvBA+/0ZcEYiZ0tjLnJMAF6xKOMbOzPc39wsWJsvJVdLmZT1XBmEQX
LDkkugq+2E4lbsiOTqB0mhIzIPj2Jg4Dq8otG/TEropHeYMba2NrOmL8I1GKsxKc
ePPqul/vKD7hZ/VRWJYafmc0mY4MWihmqvXfO9ZVSVRPxI5KZpmf8JkVztJwRnuM
koRNE/7hOina7XQPKhC+ICGndSkDE1VOmrqp0HxoZlSEvRG85I3Xa8GtcDuvD5Ts
8EQUecV+G+2JnTYBRcIR6f5XM9W6xR+Hyg4OMmkcT2wrNzRS/vHSFzcOvft0yG+B
r7vWWiEyJtcqQAcf7Ukh6RjRnbMnjtRimbA8aX9D9CTGIqCNXcHpx9DNyKuN+tyD
GOHUKgNEDmR2v/78cCR0CahlZD/QLPup92p4NOPZFB98Q3c2oEwozimzHzYVQqri
nLhFzp0L1GOTPtAi7Nfc9WQm37F94O4l4NtQ+M3tDtJYDra2gTBmgnnxy0Ue/UVc
2G54kwG1pYqwFAKEe10sNy8AIbJ8EtClG5EGi0rM8rLchf/lu+v0pp4K7wHwx1rX
43eiBol3LboTxRaLk2eDCqdh+jncmQr8BWp6AKgMs+olOGgAE7878uBOyzNlT61K
OFTDO9ce/fpBx12UgSkZDsmy+UnpQD04kgyvgXXHY5vAjslQoMQ=
=OL6g
-----END PGP SIGNATURE-----

--+vr/VfFO52u+GkZ9--

