Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EB8462A17
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 03:02:21 +0100 (CET)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrsTM-00029h-7t
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 21:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mrsNg-0008A3-T4; Mon, 29 Nov 2021 20:56:28 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=49307
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mrsNd-0006b0-OW; Mon, 29 Nov 2021 20:56:28 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J35101gBYz4xRC; Tue, 30 Nov 2021 12:56:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638237380;
 bh=OjiEacMQ1qLAmBbbjnIMivXANnlVWRuZiSHVgP1Xdvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZQ370fRXxPk8QQP0RD0W6VZ8w/+BtDJFuf2E0ZnkypsccGFMMSC6scIoBzeo6b1rB
 GYpRL2rJ4i9ITaaPcD5kLPLPXwiDzxdsoIwH9KfUuym7IUqnEv7ScfM3rUYMvPiAlk
 hPhz40hdzFyWZcie3lE5qLzYIQ+un6C9tdU7HK6M=
Date: Tue, 30 Nov 2021 11:33:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 07/10] target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL
 (0xFA) event
Message-ID: <YaVxaQYFkvqfms08@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-8-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MFumB8Pyfkp4LQi8"
Content-Disposition: inline
In-Reply-To: <20211125150817.573204-8-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MFumB8Pyfkp4LQi8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 12:08:14PM -0300, Daniel Henrique Barboza wrote:
> PM_RUN_INST_CMPL, instructions completed with the run latch set, is
> the architected PowerISA v3.1 event defined with PMC4SEL =3D 0xFA.
>=20
> Implement it by checking for the CTRL RUN bit before incrementing the
> counter. To make this work properly we also need to force a new
> translation block each time SPR_CTRL is written. A small tweak in
> pmu_increment_insns() is then needed to only increment this event
> if the thread has the run latch.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Obviously, it would also be possible to treat the runlatch
instructions event like the all-instructions event but force an update
on runlatch changes.  Having to incoporate CTRL into the active
counter logic as well as the other stuff seems like it might make
things messier that way overall though.

> ---
>  target/ppc/cpu.h        |  4 ++++
>  target/ppc/cpu_init.c   |  2 +-
>  target/ppc/power8-pmu.c | 24 ++++++++++++++++++++++--
>  target/ppc/spr_tcg.h    |  1 +
>  target/ppc/translate.c  | 12 ++++++++++++
>  5 files changed, 40 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 38cd2b5c43..993884164f 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -304,6 +304,7 @@ typedef enum {
>      PMU_EVENT_INACTIVE,
>      PMU_EVENT_CYCLES,
>      PMU_EVENT_INSTRUCTIONS,
> +    PMU_EVENT_INSN_RUN_LATCH,
>  } PMUEventType;
> =20
>  /***********************************************************************=
******/
> @@ -389,6 +390,9 @@ typedef enum {
>  #define MMCR1_PMC4SEL_START 56
>  #define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
> =20
> +/* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
> +#define CTRL_RUN PPC_BIT(63)
> +
>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 2d72dde26d..ecce4c7c1e 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6749,7 +6749,7 @@ static void register_book3s_ctrl_sprs(CPUPPCState *=
env)
>  {
>      spr_register(env, SPR_CTRL, "SPR_CTRL",
>                   SPR_NOACCESS, SPR_NOACCESS,
> -                 SPR_NOACCESS, &spr_write_generic,
> +                 SPR_NOACCESS, &spr_write_CTRL,
>                   0x00000000);
>      spr_register(env, SPR_UCTRL, "SPR_UCTRL",
>                   &spr_read_ureg, SPR_NOACCESS,
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 59d0def79d..98797f0b2f 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -96,6 +96,15 @@ static PMUEventType pmc_get_event(CPUPPCState *env, in=
t sprn)
>              evt_type =3D PMU_EVENT_CYCLES;
>          }
>          break;
> +    case 0xFA:
> +        /*
> +         * PMC4SEL =3D 0xFA is the "instructions completed
> +         * with run latch set" event.
> +         */
> +        if (sprn =3D=3D SPR_POWER_PMC4) {
> +            evt_type =3D PMU_EVENT_INSN_RUN_LATCH;
> +        }
> +        break;
>      case 0xFE:
>          /*
>           * PMC1SEL =3D 0xFE is the architected PowerISA v3.1
> @@ -119,11 +128,22 @@ static bool pmu_increment_insns(CPUPPCState *env, u=
int32_t num_insns)
> =20
>      /* PMC6 never counts instructions */
>      for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
> -        if (pmc_get_event(env, sprn) !=3D PMU_EVENT_INSTRUCTIONS) {
> +        PMUEventType evt_type =3D pmc_get_event(env, sprn);
> +        bool insn_event =3D evt_type =3D=3D PMU_EVENT_INSTRUCTIONS ||
> +                          evt_type =3D=3D PMU_EVENT_INSN_RUN_LATCH;
> +
> +        if (pmc_is_inactive(env, sprn) || !insn_event) {
>              continue;
>          }
> =20
> -        env->spr[sprn] +=3D num_insns;
> +        if (evt_type =3D=3D PMU_EVENT_INSTRUCTIONS) {
> +            env->spr[sprn] +=3D num_insns;
> +        }
> +
> +        if (evt_type =3D=3D PMU_EVENT_INSN_RUN_LATCH &&
> +            env->spr[SPR_CTRL] & CTRL_RUN) {
> +            env->spr[sprn] +=3D num_insns;
> +        }
> =20
>          if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL &&
>              pmc_has_overflow_enabled(env, sprn)) {
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 1d6521eedc..f98d97c0ba 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -28,6 +28,7 @@ void spr_write_generic(DisasContext *ctx, int sprn, int=
 gprn);
>  void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
>  void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
>  void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index ccc83d0603..d0e361a9d1 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -403,6 +403,18 @@ void spr_write_generic(DisasContext *ctx, int sprn, =
int gprn)
>      spr_store_dump_spr(sprn);
>  }
> =20
> +void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
> +{
> +    spr_write_generic(ctx, sprn, gprn);
> +
> +    /*
> +     * SPR_CTRL writes must force a new translation block,
> +     * allowing the PMU to calculate the run latch events with
> +     * more accuracy.
> +     */
> +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
> +}
> +
>  #if !defined(CONFIG_USER_ONLY)
>  void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MFumB8Pyfkp4LQi8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGlcWkACgkQbDjKyiDZ
s5LC7xAAjL6Ko6muRNJfJJjrTEv9VQDewgvivWAtAbGw6IcGRl6qtmT9i6Qnln6h
Uje6e3T2SCZVauAUvEQ+MEFg+1zn0l8vmBffe8ybMLpwbkM0lxMTtbRfVHeDc0/f
4ET8YODcFBnXvvVpAiB+qlmb0LZ4VO8h3elhGMTMMxIhF7i9v36/to5uGGSOc1oz
PqZfY3TiaQ0Dne3xchqF/npVP1dBurHsgLejT1jNiHbPkQfHolxsaqI+8kZgRfAr
6r7WQq009nJDs+KY8+AImeDZe65rNeLQDKKX+hEEueePtb+4Gcvscz1hIhZEWY45
u7PkMyXlnkOa/fGaFYmqU/cZ/LbobBROXk6G4rtZiMKIccBReFRllqPsOuk/S9m+
KnmgA0x3WUjrwGpcq0l4TFdfZzZa5Tf+GomMn59o2sUVHuapPRbERo60ajsHjc2R
r6fNeQ1iDhKdpyKvC0NDL8X6Kpm7WHwpQVSae2itmQlss3wc46fk4A1t3ktvjL2s
3SNWFaYCrJ3bdpLWDumCfrRc4w/mpOmNOaAEE6Jmhs+M3mXeMD0nH6MCA9B8GUWc
UuaYJTo5hPxSxQu3Pi2BTqr2n1h3wzXJBziWmq3e9xedXDhaNu5FH4Kl+Rc8y/Rz
prC8JLtgSqixXSuCBDDAUT5EKl4C4GHKslKFZuRy3v+iKV2QaD4=
=FM2I
-----END PGP SIGNATURE-----

--MFumB8Pyfkp4LQi8--

