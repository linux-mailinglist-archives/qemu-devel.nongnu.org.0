Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9063E5234
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:31:40 +0200 (CEST)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJQQ-0004sW-8m
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJEJ-0000hW-6s; Tue, 10 Aug 2021 00:19:07 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52369 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJEH-0002XK-4b; Tue, 10 Aug 2021 00:19:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSY3cxwz9tjs; Tue, 10 Aug 2021 14:18:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569101;
 bh=dJ/nnr9mHKgs0fTQN8Gr6A32E4i7ebAExaYK+PBFxhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bTzcFKo++hxmNDpXppAGECyUB4PpYHIFo98t4QrPvA5j4DiMoIkptJbJ/3G+2WA2V
 agd5NDEqhWg8leMGYwzO0I1WPXE7S+vH2IurTRHQ6rt8urepdDGC8EDRMiNpi/G0mZ
 OEHskFo435Xd9N/TCDqQ0cC8zitHJsTElnw3PuoE=
Date: Tue, 10 Aug 2021 14:17:47 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 18/19] target/ppc/pmu_book3s_helper.c: add PM_CMPLU_STALL
 mock events
Message-ID: <YRH96w0+vMRHob7w@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-19-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LhvRFnYjC+jx9ESN"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-19-danielhb413@gmail.com>
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


--LhvRFnYjC+jx9ESN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:56AM -0300, Daniel Henrique Barboza wrote:
> EBB powerpc kernel test 'multi_counter_test' uses PM_CMPLU_STALL events
> that we do not support. These events are related to CPU stalled/wasted
> cycles while waiting for resources, cache misses and so on.
>=20
> Unlike the 0xFA event added previously, there's no available equivalent
> for us to use, and at this moment we can't sample those events as well.
> What we can do is mock those events as if we were calculating them.
>=20
> This patch implements PM_CMPLU_STALL, PM_CMPLU_STALL_FXU,
> PM_CMPLU_STALL_OTHER_CMPL and PM_CMPLU_STALL_THRD mock events by giving
> them a fixed amount of the total elapsed cycles.
>=20
> The chosen sample values for these events (25% of total cycles for
> PM_CMPLU_STALL and 5% for the other three) were chosen at random and has
> no intention of being truthful with what a real PowerPC hardware would
> give us. Our intention here is to make 'multi_counter_test' EBB test
> pass.

Hmm.  I guess these mock values make sense for getting the kernel
tests to pass, but I'm not sure if it's a good idea in general.  Would
we be better off just reporting 0 always - that would be a strong hint
to someone attempting to analyze results that something is fishy (in
this case that they don't actually have a real CPU).

>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/pmu_book3s_helper.c | 81 +++++++++++++++++++++++++++++++++-
>  1 file changed, 79 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> index ae7050cd62..32cf76b77f 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -92,16 +92,54 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int s=
prn,
>      env->spr[sprn] +=3D get_cycles(icount_delta);
>  }
> =20
> +static int get_stall_ratio(uint8_t stall_event)
> +{
> +    int stall_ratio =3D 0;
> +
> +    switch (stall_event) {
> +    case 0xA:
> +        stall_ratio =3D 25;
> +        break;
> +    case 0x6:
> +    case 0x16:
> +    case 0x1C:
> +        stall_ratio =3D 5;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return stall_ratio;
> +}
> +
> +static void update_PMC_PM_STALL(CPUPPCState *env, int sprn,
> +                                uint64_t icount_delta,
> +                                uint8_t stall_event)
> +{
> +    int stall_ratio =3D get_stall_ratio(stall_event);
> +    uint64_t cycles =3D muldiv64(get_cycles(icount_delta), stall_ratio, =
100);
> +
> +    env->spr[sprn] +=3D cycles;
> +}
> +
>  static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
>                                          uint64_t icount_delta)
>  {
> -    switch (get_PMC_event(env, sprn)) {
> +    uint8_t event =3D get_PMC_event(env, sprn);
> +
> +    switch (event) {
>      case 0x2:
>          update_PMC_PM_INST_CMPL(env, sprn, icount_delta);
>          break;
>      case 0x1E:
>          update_PMC_PM_CYC(env, sprn, icount_delta);
>          break;
> +    case 0xA:
> +    case 0x6:
> +    case 0x16:
> +    case 0x1C:
> +        update_PMC_PM_STALL(env, sprn, icount_delta, event);
> +        break;
>      default:
>          return;
>      }
> @@ -163,6 +201,34 @@ static int64_t get_CYC_timeout(CPUPPCState *env, int=
 sprn)
>      return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
>  }
> =20
> +static int64_t get_stall_timeout(CPUPPCState *env, int sprn,
> +                                 uint8_t stall_event)
> +{
> +    uint64_t remaining_cyc;
> +    int stall_multiplier;
> +
> +    if (env->spr[sprn] =3D=3D 0) {
> +        return icount_to_ns(COUNTER_NEGATIVE_VAL);
> +    }
> +
> +    if (env->spr[sprn] >=3D COUNTER_NEGATIVE_VAL) {
> +        return 0;
> +    }
> +
> +    remaining_cyc =3D COUNTER_NEGATIVE_VAL - env->spr[sprn];
> +
> +    /*
> +     * Consider that for this stall event we'll advance the counter
> +     * in a lower rate, thus requiring more cycles to overflow.
> +     * E.g. for PM_CMPLU_STALL (0xA), ratio 25, it'll require
> +     * 100/25 =3D 4 times the same amount of cycles to overflow.
> +     */
> +    stall_multiplier =3D 100 / get_stall_ratio(stall_event);
> +    remaining_cyc *=3D stall_multiplier;
> +
> +    return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
> +}
> +
>  static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
>  {
>      bool PMC14_running =3D !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
> @@ -191,6 +257,7 @@ static bool pmc_counter_negative_enabled(CPUPPCState =
*env, int sprn)
>  static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
>  {
>      int64_t timeout =3D -1;
> +    uint8_t event;
> =20
>      if (!pmc_counter_negative_enabled(env, sprn)) {
>          return -1;
> @@ -205,13 +272,23 @@ static int64_t get_counter_neg_timeout(CPUPPCState =
*env, int sprn)
>      case SPR_POWER_PMC2:
>      case SPR_POWER_PMC3:
>      case SPR_POWER_PMC4:
> -        switch (get_PMC_event(env, sprn)) {
> +        event =3D get_PMC_event(env, sprn);
> +
> +        switch (event) {
>          case 0x2:
>              timeout =3D get_INST_CMPL_timeout(env, sprn);
>              break;
>          case 0x1E:
>              timeout =3D get_CYC_timeout(env, sprn);
>              break;
> +        case 0xA:
> +        case 0x6:
> +        case 0x16:
> +        case 0x1c:
> +            timeout =3D get_stall_timeout(env, sprn, event);
> +            break;
> +        default:
> +            break;
>          }
> =20
>          break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LhvRFnYjC+jx9ESN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER/esACgkQbDjKyiDZ
s5IKSBAAw4UQnrd/R2SWxuG8i966zbPXEFJJjRqmUb6Xz1ZeA49E52bH1Mjefj57
0ahvCsLrEElVEe5Nzgd2EVjMBWtJes8XgXD/K+6RpeUic7kmkTK0c6hVZ3G8Mv5m
YeUxDFZDRPY42i6RXI+cmip8JsP1Q8JCQgNdcFJghuhTdxTw5BS4ZBt6x3hYjJw8
hUqq8Wxoo0HIdqIx4IWXioC/yLl7wpzc8CLLR5JNoRihZuBvD3zecy13Mx6l505i
y23byqrZP+kJ2SI1ZRJ5JwBLxRfqJc4CaiuGL8cPX81PXNJf4MqM87K0XqzY3ap8
vesX0jXCoKJvr42hREE8OTUqgJBcqapMZQZMEcIhResOauoRlM/WF7048PCw6KDE
IIaIO7S7zmqRjqYpbe1zC3Ov4xac7AgJ8VmNL3R+W4LHHJcddB+IjST6yO7cFLCR
2wszHTiUwmKnw3LRp0XLGSTOaWDl4xTsVj222nd1a/bMOLBD3WuEodN5LJKbObX1
YVqnqBGOoanEd94huobfIVU0kJrF4SF8gGafPxz4NwS3k8zT7TycvzCFDx+nV9DN
j00s/7HbkUt1tsXcW+Au3jNTB/svqEmDo837dp5tUhcg85KUoV7T/DFHwZ6YoKhb
GLuwghJ1PYb7W1zo/Ydoe3H8GpESRBpmiW+t+Zbft9FTC6MkSgE=
=4DuJ
-----END PGP SIGNATURE-----

--LhvRFnYjC+jx9ESN--

