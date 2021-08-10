Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7F3E5226
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:25:18 +0200 (CEST)
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJKH-0001U5-Td
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDs-0008A7-JH; Tue, 10 Aug 2021 00:18:40 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49141 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDq-0002Q6-7Q; Tue, 10 Aug 2021 00:18:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSR4vhpz9t6h; Tue, 10 Aug 2021 14:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569095;
 bh=B80eCdFuiTsAYBe6ShMHJY8XdgLDBIlmUXFM491RW7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UreT2idlFoxd8T8FszKx18U332f634rgsUYzXrRKA9GduYLf9HOV9D9xcZ4Nb25ZA
 KMPHFBz3D4snyT29tgMX7JFdNbZjXWQKeBXWaYbkmoAziCb8HAraCQb/FShucG5a1z
 XZQQ390otnf/Zk31DSZykOtMSjxW7NEJ8QmZ+vf0=
Date: Tue, 10 Aug 2021 13:39:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 04/19] target/ppc: PMU Book3s basic insns count for
 pseries TCG
Message-ID: <YRH05uCNwvjS5Nws@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JZNEEGd5dpLkrdej"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-5-danielhb413@gmail.com>
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


--JZNEEGd5dpLkrdej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:42AM -0300, Daniel Henrique Barboza wrote:
> The PMCC (PMC Control) bit in the MMCR0 register controls whether the
> counters PMC5 and PMC6 are being part of the performance monitor
> facility in a specific time. If PMCC allows it, PMC5 and PMC6 will
> always be used to measure instructions completed and cycles,
> respectively.
>=20
> This patch adds the barebones of the Book3s PMU logic by enabling
> instruction counting, using the icount framework, using the performance
> monitor counters 5 and 6. The overall logic goes as follows:
>=20
> - a helper is added to control the PMU state on each MMCR0 write. This
> allows for the PMU to start/stop as quick as possible;

Um.. why does a helper accomplish that goal?

>=20
> - only PMC5 and PMC6 are being set. PMC6 (cycles) is default to 4*insns
> (for cycles per instruction) for now;

What's the justification for that value?  With a superscalar core, I'd
expect average (median) cycles per instruction to be < 1 a lot of the
time.  Mean cycles per instruction could be higher since certain
instructions could take a lot.

> - the intended usage is to freeze the counters by setting MMCR0_FC, do
> any additional setting via MMCR1 (not implemented yet) and setting
> initial counter values,  and enable the PMU by zeroing MMCR0_FC. Software
> must freeze counters to read the results - on the fly reading of the PMCs
> will return the starting value of each one.

Is that the way hardware behaves?  Or is it just a limitation of this
software implementation?  Either is fine, we should just be clear on
what it is.

>=20
> Since there will be more PMU exclusive code to be added next, let's also
> put the PMU logic in its own helper to keep all in the same place. The
> code is also repetitive and not really extensible to add more PMCs, but
> we'll handle this in the next patches.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h               |  4 ++
>  target/ppc/cpu_init.c          |  4 +-
>  target/ppc/helper.h            |  1 +
>  target/ppc/meson.build         |  1 +
>  target/ppc/pmu_book3s_helper.c | 78 ++++++++++++++++++++++++++++++++++
>  target/ppc/translate.c         | 14 ++++--
>  6 files changed, 97 insertions(+), 5 deletions(-)
>  create mode 100644 target/ppc/pmu_book3s_helper.c
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 4d96015f81..229abfe7ee 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1175,6 +1175,10 @@ struct CPUPPCState {
>      uint32_t tm_vscr;
>      uint64_t tm_dscr;
>      uint64_t tm_tar;
> +
> +    /* PMU registers icount state */
> +    uint64_t pmc5_base_icount;
> +    uint64_t pmc6_base_icount;
>  };
> =20
>  #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 71062809c8..fce89ee994 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6822,7 +6822,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
>      spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
>                       SPR_NOACCESS, SPR_NOACCESS,
>                       &spr_read_pmu_generic, &spr_write_pmu_generic,
> -                     KVM_REG_PPC_MMCR0, 0x00000000);
> +                     KVM_REG_PPC_MMCR0, 0x80000000);
>      spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
>                       SPR_NOACCESS, SPR_NOACCESS,
>                       &spr_read_pmu_generic, &spr_write_pmu_generic,
> @@ -6870,7 +6870,7 @@ static void register_book3s_pmu_user_sprs(CPUPPCSta=
te *env)
>      spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
>                   &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
> -                 0x00000000);
> +                 0x80000000);
>      spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
>                   &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 4076aa281e..5122632784 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
>  DEF_HELPER_1(hrfid, void, env)
>  DEF_HELPER_2(store_lpcr, void, env, tl)
>  DEF_HELPER_2(store_pcr, void, env, tl)
> +DEF_HELPER_2(store_mmcr0, void, env, tl)
>  #endif
>  DEF_HELPER_1(check_tlb_flush_local, void, env)
>  DEF_HELPER_1(check_tlb_flush_global, void, env)
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index b85f295703..bf252ca3ac 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -14,6 +14,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'int_helper.c',
>    'mem_helper.c',
>    'misc_helper.c',
> +  'pmu_book3s_helper.c',
>    'timebase_helper.c',
>    'translate.c',
>  ))
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> new file mode 100644
> index 0000000000..fe16fcfce0
> --- /dev/null
> +++ b/target/ppc/pmu_book3s_helper.c

I'd prefer to call this just book3s_pmu.c.  Or better yet
"powerX_pmu.c", where X is the specific PMU model you're implementing
since IIRC the particulars of the PMU vary quite a lot from POWER7
through to POWER10.

> @@ -0,0 +1,78 @@
> +/*
> + * PowerPC Book3s PMU emulation helpers for QEMU TCG
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
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +
> +static uint64_t get_insns(void)
> +{
> +    return (uint64_t)icount_get_raw();
> +}
> +
> +static uint64_t get_cycles(uint64_t insns)
> +{
> +    /* Placeholder value */
> +    return insns * 4;
> +}
> +
> +/* PMC5 always count instructions */
> +static void freeze_PMC5_value(CPUPPCState *env)
> +{
> +    uint64_t insns =3D get_insns() - env->pmc5_base_icount;
> +
> +    env->spr[SPR_POWER_PMC5] +=3D insns;
> +    env->pmc5_base_icount +=3D insns;
> +}
> +
> +/* PMC6 always count cycles */
> +static void freeze_PMC6_value(CPUPPCState *env)
> +{
> +    uint64_t insns =3D get_insns() - env->pmc6_base_icount;
> +
> +    env->spr[SPR_POWER_PMC6] +=3D get_cycles(insns);
> +    env->pmc6_base_icount +=3D insns;
> +}
> +
> +void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
> +{
> +    bool curr_FC =3D env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
> +    bool new_FC =3D value & MMCR0_FC;
> +
> +    /*
> +     * In an frozen count (FC) bit change:
> +     *
> +     * - if PMCs were running (curr_FC =3D false) and we're freezing
> +     * them (new_FC =3D true), save the PMCs values in the registers.
> +     *
> +     * - if PMCs were frozen (curr_FC =3D true) and we're activating
> +     * them (new_FC =3D false), calculate the current icount for each
> +     * register to allow for subsequent reads to calculate the insns
> +     * passed.
> +     */
> +    if (curr_FC !=3D new_FC) {
> +        if (!curr_FC) {
> +            freeze_PMC5_value(env);
> +            freeze_PMC6_value(env);
> +        } else {
> +            uint64_t curr_icount =3D get_insns();
> +
> +            env->pmc5_base_icount =3D curr_icount;
> +            env->pmc6_base_icount =3D curr_icount;
> +        }
> +    }
> +
> +    env->spr[SPR_POWER_MMCR0] =3D value;
> +}
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 29b0a340a9..62356cfadf 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -409,8 +409,14 @@ void spr_write_generic(DisasContext *ctx, int sprn, =
int gprn)
> =20
>  void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
>  {
> -    /* For now it's just a call to spr_write_generic() */
> -    spr_write_generic(ctx, sprn, gprn);
> +    switch (sprn) {
> +    case SPR_POWER_MMCR0:
> +        gen_icount_io_start(ctx);
> +        gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
> +        break;
> +    default:
> +        spr_write_generic(ctx, sprn, gprn);
> +    }
>  }
> =20
>  #if !defined(CONFIG_USER_ONLY)
> @@ -592,6 +598,8 @@ void spr_write_pmu_ureg(DisasContext *ctx, int sprn, =
int gprn)
>          t0 =3D tcg_temp_new();
>          t1 =3D tcg_temp_new();
> =20
> +        gen_icount_io_start(ctx);
> +
>          /*
>           * Filter out all bits but FC, PMAO, and PMAE, according
>           * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
> @@ -603,7 +611,7 @@ void spr_write_pmu_ureg(DisasContext *ctx, int sprn, =
int gprn)
>          tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));
>          /* Keep all other bits intact */
>          tcg_gen_or_tl(t1, t1, t0);
> -        gen_store_spr(effective_sprn, t1);
> +        gen_helper_store_mmcr0(cpu_env, t1);
> =20
>          tcg_temp_free(t0);
>          tcg_temp_free(t1);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JZNEEGd5dpLkrdej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER9OYACgkQbDjKyiDZ
s5JGnQ//e0NOOVn3wVoGu1eL5B38Midln9L6QfckVX+Y82Uwn2eOqjhjL7d/ZItz
xd2mn6lEIV9CCbdmT+JyH6aE/CN0gijcrNLIgtJuM+8/qx+sUlVNsHrSWqJst9Lx
fGvPe5Ksv/m8pCTrKOkVO4IHeOq7K88Wzh8da2YCGBtDEDh0mmLc2aGsvmdcTBK2
AkOpqmppDyaKxUco8aEwnuczdWmlxkE7dCoOgQBkT6tH2q49L1bWDmggsssDhq1f
+CuzwBRd/eJXtUsdkhCrFp3IP5ZQw2KuF9MUZLH9jmQFR10noCbVja4VSDbsb3gU
UGFmWz2MsUAq2xPL+rO2R9BwVx3CGq/zP/AHh/EfPUF/uyZhi6aUSFXUM5dPuNAq
x3V9lKPUBDmfFUzN9yiwe/F/wGeM2eacHGFIZAi+9A1AhjgIYpc3LHeV2BBTjnkY
mLQhGnTvP83bM/g8YfyXqjHAvAdD85TKs0NdDoqWmjGIHGg0uQlYUqGiUAfzLR9O
eZ4/Cs6Z01RtHCsq6l/6GoG3dPdpI85RBpf73mGy9+2bInQFPf9s4VPnJw9ILcq+
JekwB9lm53IXm/yLtqh55pzIj/qZkg1NZD/Nin8RkmGpFJ/aXknNgAHZIRUbNq+J
17rNyUgJO+pV/2Vx8FbV3yBNvbieHOqyegEsdmv1xC/+iyXCxa0=
=d5bz
-----END PGP SIGNATURE-----

--JZNEEGd5dpLkrdej--

