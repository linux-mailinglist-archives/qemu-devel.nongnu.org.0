Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881533E522C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:28:22 +0200 (CEST)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJNF-0007C7-JS
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDs-0008A3-Iq; Tue, 10 Aug 2021 00:18:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDq-0002Q5-98; Tue, 10 Aug 2021 00:18:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSR44pZz9t6g; Tue, 10 Aug 2021 14:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569095;
 bh=L6UY1YEf57dHpNiF0lX+vDeBwus29qrsn3sBEiZHpnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=neRQraR5ay+u/8DA07hM07HPK/YU7TgNr192wfEQHYCs51ffPzBHTAgpVvYkmhTle
 UkrpVhpMryzDYzNp556VR89PvCNPG9bnX1aPhsdQHx7MVFXzh9wcgQVhQ6NEoA+B9m
 RiRcBRmPAfUmzOMVknxpE0hxIU71vH6bziKxCWdI=
Date: Tue, 10 Aug 2021 13:29:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 03/19] target/ppc: add exclusive user write function for
 PMU regs
Message-ID: <YRHyk2n6xvTQ6Eyl@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="11+3RzzZkXln+tui"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-4-danielhb413@gmail.com>
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--11+3RzzZkXln+tui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:41AM -0300, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
>=20
> Similar to the previous patch, write read on PowerPC PMU regs
> requires extra handling than the generic write ureg functions.
>=20
> This patch adds a specific write function for user PMU SPRs,
> spr_write_pmu_ureg(). MMCR0 and PMC1 are being treated before
> write, all other registers will be default to what is done in
> spr_write_ureg(), for now.
>=20
> Since spr_write_pmu_ureg() needs to have a look in SPR_POWER_MMCR0
> to validate if the write is valid or not, we're adding a 'spr'
> array in DisasContext that points to env->spr.
>=20
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu_init.c  | 26 +++++++++++++-------------
>  target/ppc/spr_tcg.h   |  1 +
>  target/ppc/translate.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 13 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index d30aa0fe1e..71062809c8 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6868,47 +6868,47 @@ static void register_book3s_pmu_sup_sprs(CPUPPCSt=
ate *env)
>  static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC1, "UPMC1",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC2, "UPMC2",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC3, "UPMC3",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC4, "UPMC4",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC5, "UPMC5",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC6, "UPMC6",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USIAR, "USIAR",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USDAR, "USDAR",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>  }
> @@ -6976,8 +6976,8 @@ static void register_power8_pmu_sup_sprs(CPUPPCStat=
e *env)
>  static void register_power8_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
> -                 &spr_read_pmu_ureg, SPR_NOACCESS,
> -                 &spr_read_pmu_ureg, &spr_write_ureg,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
> +                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USIER, "USIER",
>                   &spr_read_generic, SPR_NOACCESS,
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 84ecba220f..40b5de34b9 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -28,6 +28,7 @@ void spr_write_generic(DisasContext *ctx, int sprn, int=
 gprn);
>  void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_pmu_ureg(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_pmu_ureg(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index d3a4d42ff8..29b0a340a9 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -176,6 +176,7 @@ struct DisasContext {
>      bool tm_enabled;
>      bool gtse;
>      ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
> +    target_ulong *spr; /* Needed to check rights for mfspr/mtspr */
>      int singlestep_enabled;
>      uint32_t flags;
>      uint64_t insns_flags;
> @@ -573,6 +574,46 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int=
 gprn)
>  {
>      gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
>  }
> +
> +/* User special write access to PMU SPRs  */
> +void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0, t1;
> +    int effective_sprn =3D sprn + 0x10;
> +
> +    if (((ctx->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) =3D=3D 0) {
> +        /* Hypervisor Emulation Assistance interrupt */
> +        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +        return;
> +    }
> +
> +    switch (effective_sprn) {
> +    case SPR_POWER_MMCR0:

Same comments as earlier patches about stacked multiplexing.

> +        t0 =3D tcg_temp_new();
> +        t1 =3D tcg_temp_new();
> +
> +        /*
> +         * Filter out all bits but FC, PMAO, and PMAE, according
> +         * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
> +         * fourth paragraph.
> +         */
> +        tcg_gen_andi_tl(t0, cpu_gpr[gprn],
> +                        MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE);
> +        gen_load_spr(t1, SPR_POWER_MMCR0);
> +        tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));
> +        /* Keep all other bits intact */
> +        tcg_gen_or_tl(t1, t1, t0);
> +        gen_store_spr(effective_sprn, t1);
> +
> +        tcg_temp_free(t0);
> +        tcg_temp_free(t1);
> +        break;
> +    default:
> +        gen_store_spr(effective_sprn, cpu_gpr[gprn]);
> +        break;
> +    }
> +}
> +
>  #endif
> =20
>  /* SPR common to all non-embedded PowerPC */
> @@ -8563,6 +8604,7 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      uint32_t hflags =3D ctx->base.tb->flags;
> =20
>      ctx->spr_cb =3D env->spr_cb;
> +    ctx->spr =3D env->spr;

Eep... with that one line you're copying 8kiB of data into the context
structure.  That sounds undesirable.. especially since it look like
you only check 8 bytes of it.

Plus.. TBH, I'm a bit fuzzy on how the disascontext stuff works, but
I'm not sure copying the stuff here is correct.  I think it gets set
up at the beginning of each translated basic block.  But I don't think
anything prevents there being multiple mtmmcr0 instructions in a
single translated block, which means the values you're checking will
be outdated for the second one.

I think instead you need to actually generate the instructions to read
=66rom MMCR0 and conditionally generate an exception if the permission
bit isn't set.  Or else just move all the PMU SPR logic to helper
functions which can just look at env->spr directly.  But that might
not be desirable since I expect the counter reads at least might be a
hot path.

>      ctx->pr =3D (hflags >> HFLAGS_PR) & 1;
>      ctx->mem_idx =3D (hflags >> HFLAGS_DMMU_IDX) & 7;
>      ctx->dr =3D (hflags >> HFLAGS_DR) & 1;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--11+3RzzZkXln+tui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER8pMACgkQbDjKyiDZ
s5KJbQ//YuD5kHgOyovVo7AKfoxpIJmwQOwXFcqFyuvBRdqE9Xz5cDd78BGsGhx0
3s81zf9pTnk0L8NJlQrUyU7asbxaogWNe7aW2OHb+bwM50bCpGVwAE+r5YJ0dJi4
TScEjKtk5HA2zTAkr4pQ1mwhoiEwVKsGaco1fFAwgdOrKIKm11aiGxuMsszsIR8c
FuWW/hBG4cYyQxemPWbEF5EOEAUYmte3dhkkX7U4nIp7wm40wDsVzrh0H28GHVkn
O5IKDwWiMdAXJ69H3944/6d2ZS2ZCNDO1QI8aMIzOXiG7FphJV8TEf+yCR189jEQ
7yelxmjlgjAMb/WNumzgY6Uzxne2UQpwyOUa4FzyoUOaB/iDLRsjY8jbv13n3lzx
5avhZ9T+Qa03mh4EDn2xKKDB4T6hMLsDCJIZnl9Jv+kgnseCReurxiuMiKxWjppz
i63LKteOnXSpQ6TcelC+suGUqqZ0arxiYKpiePYotrYYuS0+xjyfCTXh/J1EyJ+s
+UdCuvgMpGC+1Eyk3LGqKSL/2o4rF35D+0xcRhwmukVhqtZzjhztPAu+d+L8EcoW
uY6fVLOBvK0CdAJs/IIgmuyuJZuMOMW43iWEF7DhtGgK0DuIXDjTeK/1xAdN8shY
PgTd4bb6GQSPHdu/Cq0EYKhxY6oK1yjErosdxF5qE2cMZGWzI3o=
=CUTA
-----END PGP SIGNATURE-----

--11+3RzzZkXln+tui--

