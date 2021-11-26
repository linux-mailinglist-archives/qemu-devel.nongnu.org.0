Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C630D45EC3E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 12:12:12 +0100 (CET)
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZ9G-0007I2-Kk
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 06:12:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqZ4B-0005VU-4X; Fri, 26 Nov 2021 06:06:55 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=59495
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqZ47-0000f1-Gy; Fri, 26 Nov 2021 06:06:54 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J0sPt5yKlz4xcs; Fri, 26 Nov 2021 22:06:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637924802;
 bh=pjHLqugrCcJ3g+xD0aYYS+NhDHYCxS04nXh1tlp9/9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J6RT+9nxvkiYF+KN+zjbR7WbCKmg3NZOtnAfiV3Dc2vYdhWquqmRg9BietRfJ0STA
 1wvagfjDcicmZi4UbRtyxFTOmqBnaGq8LW5TXNtn5YugWbycre1VlU8PS70SMA/iGd
 8QyGY303xceIKz4hGLSasRSfodf0/eUdJe2EyFJQ=
Date: Fri, 26 Nov 2021 13:24:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 04/10] target/ppc: PMU: update counters on MMCR1 write
Message-ID: <YaBFcHCbj8C2CXKT@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zd/Qqvw0izrF+EGj"
Content-Disposition: inline
In-Reply-To: <20211125150817.573204-5-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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


--zd/Qqvw0izrF+EGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 12:08:11PM -0300, Daniel Henrique Barboza wrote:
> MMCR1 determines the events to be sampled by the PMU. Updating the
> counters at every MMCR1 write ensures that we're not sampling more
> or less events by looking only at MMCR0 and the PMCs.
>=20
> It is worth noticing that both the Book3S PowerPC PMU, and this IBM
> Power8+ PMU that we're modeling, also uses MMCRA, MMCR2 and MMCR3 to
> control the PMU. These three registers aren't being handled in this
> initial implementation, so for now we're controlling all the PMU
> aspects using MMCR0, MMCR1 and the PMCs.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c            |  2 +-
>  target/ppc/helper.h              |  1 +
>  target/ppc/power8-pmu-regs.c.inc | 11 +++++++++++
>  target/ppc/power8-pmu.c          |  7 +++++++
>  target/ppc/spr_tcg.h             |  1 +
>  5 files changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index a7f47ec322..2d72dde26d 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6825,7 +6825,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
>                       KVM_REG_PPC_MMCR0, 0x80000000);
>      spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_generic, &spr_write_MMCR1,
>                       KVM_REG_PPC_MMCR1, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_MMCRA, "MMCRA",
>                       SPR_NOACCESS, SPR_NOACCESS,
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index d7567f75b4..94b4690375 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
>  DEF_HELPER_2(store_lpcr, void, env, tl)
>  DEF_HELPER_2(store_pcr, void, env, tl)
>  DEF_HELPER_2(store_mmcr0, void, env, tl)
> +DEF_HELPER_2(store_mmcr1, void, env, tl)
>  DEF_HELPER_3(store_pmc, void, env, i32, i64)
>  DEF_HELPER_2(read_pmc, tl, env, i32)
>  #endif
> diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-reg=
s.c.inc
> index f0c9cc343b..25b13ad564 100644
> --- a/target/ppc/power8-pmu-regs.c.inc
> +++ b/target/ppc/power8-pmu-regs.c.inc
> @@ -255,6 +255,12 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, in=
t gprn)
>  {
>      write_MMCR0_common(ctx, cpu_gpr[gprn]);
>  }
> +
> +void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_icount_io_start(ctx);
> +    gen_helper_store_mmcr1(cpu_env, cpu_gpr[gprn]);
> +}
>  #else
>  void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
>  {
> @@ -301,6 +307,11 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, in=
t gprn)
>      spr_write_generic(ctx, sprn, gprn);
>  }
> =20
> +void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
> +{
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +
>  void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
>  {
>      spr_write_generic(ctx, sprn, gprn);
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 5f2623aa25..acdaee7459 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -145,6 +145,13 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulo=
ng value)
>      }
>  }
> =20
> +void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
> +{
> +    pmu_update_cycles(env);
> +
> +    env->spr[SPR_POWER_MMCR1] =3D value;
> +}
> +
>  target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
>  {
>      pmu_update_cycles(env);
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 1e79a0522a..1d6521eedc 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -26,6 +26,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn=
);
>  void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
>  void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
>  void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_xer(DisasContext *ctx, int sprn, int gprn);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zd/Qqvw0izrF+EGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGgRXAACgkQbDjKyiDZ
s5JZ8g//Uj3I2JeY5i2RQizm1Y1+ibdLnPEVxY9pIpojjJDWntQw3+5xw4exyg8q
bsXlU7PMn6tc2pnjjjDFH9RuCY984KMKUalWRuWhKAMWwQko9+zcRcxNMyfszhuW
DBVxzbZhgDQF99PsdKLUqkcb6/zqv+QJqhSH0NglYZ/MPbS5vxMKKSok7yhymkOI
trb6VB28A6WsP9pSSkAkqkyPGeYved2JnMJaym0rLZGWpPpGs1AcDgRre4bWXQRy
jf6dccASPo/RjoMlCY2glD4VVyEcObbxoIdkUt+nxaPR7R5EhMxZRtEnjY4p/2br
C02TS1uAzI6CvqrKjPRmThqn28/7hWHmGT1AhTm7h5713fGogIi1MxIWKA7pCPW6
Dpd3bicHpMHDPm1ERCLbSFDlGpiwWEKANJskxkdj5Do4AvnakcHp6VWk8Fw+W87h
F4xm3BXoEKBj+fLr4cBDYpCgbEQklkbgtCkn0iiP/qraTex2XzAwydr87YSJonk7
obcRGdoAunp231GM+fbd0Nwx551qtxV2koWnOJZcNO/mixg8c7NFIcwouzogMqLC
MJ+hc0JI3ZjluoQVs1edKqugYZnaajO/Ra06wgbM3UriUegj9sXCz1ZfBgW1tJ8Q
frXWE4wgw7zlVLn2MeuomwhCMqj+J2bC9A37jbjN+LoKqaonMBI=
=Bw+S
-----END PGP SIGNATURE-----

--zd/Qqvw0izrF+EGj--

