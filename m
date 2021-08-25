Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5003F6E94
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:52:09 +0200 (CEST)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIktT-0003HE-Ig
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkrS-0001NK-KU; Wed, 25 Aug 2021 00:50:02 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36697 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkrO-0005it-Sx; Wed, 25 Aug 2021 00:50:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvYS20JnSz9sWc; Wed, 25 Aug 2021 14:49:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629866994;
 bh=lS7JGFdDQtImTfvmo1pPn4INORBLC23MVCbDAlsTgrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LfNhb5VXHw1yzRReowvN4CpMqjPLT01O2qHW4q28PRQ+wxpfDyB5OztfNr9R8XjsN
 fpdKtUb39u3qLwVv7HbpF96Xev93ube0uzHg44JuIUCERhi7Cw6bYka+WwSPF942zJ
 aAB5eoKpbhKC5efdkOdNxNKbXuupKTcSbD04oqvY=
Date: Wed, 25 Aug 2021 14:37:15 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 03/16] target/ppc: add exclusive user write function
 for MMCR0
Message-ID: <YSXI+9o7T8fun0Lg@yekko>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UBE0nj1MjsThX7N+"
Content-Disposition: inline
In-Reply-To: <20210824163032.394099-4-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UBE0nj1MjsThX7N+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 01:30:19PM -0300, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
>=20
> Similar to the previous patch, user write on some PowerPC
> PMU regs, in this case, MMCR0, is limited. Create a new
> function to handle that.

Ok.. ok, this fixes my concern on the previous patch.  Best to avoid
the confusing interim step though.  I'm not sure there's a lot of use
adding the general "group A" helper if you're going to replace them
with more specific functions shortly afterwards.

>=20
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu_init.c  |  2 +-
>  target/ppc/spr_tcg.h   |  1 +
>  target/ppc/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 5510c3799f..860716da18 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6868,7 +6868,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
>  static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> -                 &spr_read_MMCR0_ureg, &spr_write_PMU_groupA_ureg,
> +                 &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 64ef2cd089..5c383dae3d 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -43,6 +43,7 @@ void spr_read_601_rtcu(DisasContext *ctx, int gprn, int=
 sprn);
>  void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
>  void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
> =20
>  #ifndef CONFIG_USER_ONLY
>  void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index ec4160378d..b48eec83e3 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -592,11 +592,49 @@ void spr_write_PMU_groupA_ureg(DisasContext *ctx, i=
nt sprn, int gprn)
>      }
>      spr_write_ureg(ctx, sprn, gprn);
>  }
> +
> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0, t1;
> +
> +    /*
> +     * MMCR0 is a Group A SPR. The same write access control
> +     * done in spr_write_PMU_groupA_ureg() applies.
> +     */
> +    if (ctx->pmcc_clear) {
> +        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +        return;
> +    }
> +
> +    t0 =3D tcg_temp_new();
> +    t1 =3D tcg_temp_new();
> +
> +    /*
> +     * Filter out all bits but FC, PMAO, and PMAE, according
> +     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
> +     * fourth paragraph.
> +     */
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
> +                    MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE);
> +    gen_load_spr(t1, SPR_POWER_MMCR0);
> +    tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));

Since you're reusing them again here, definitely want a #define for
this mask.

> +    /* Keep all other bits intact */
> +    tcg_gen_or_tl(t1, t1, t0);
> +    gen_store_spr(SPR_POWER_MMCR0, t1);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +}
>  #else
>  void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
>  {
>      spr_noaccess(ctx, gprn, sprn);
>  }
> +
> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
> +{
> +    spr_noaccess(ctx, gprn, sprn);
> +}
>  #endif
> =20
>  /* SPR common to all non-embedded PowerPC */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UBE0nj1MjsThX7N+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElyPsACgkQbDjKyiDZ
s5IJHg/+I5Gvi6ylA2XB9Y0lG0BhQVD08eJ3oFzwSMVOcan/IJj9SMvqm5gXA83x
rPyDK9NhO2Nvta6XnPt2C6AHyS8sMJ7w10BoLKX7mNfBW/LKM8wL9AUa4jHuogtl
u+lEw8uV8lJkYvR9CLCLRK5+tOix3UmPs0dSNaQzPldonxtSXdqCKT8eiAm2V0q1
xo7bvedra4PC6ESoF0F4vl7NDBYkdFo/n7cUgTI5WZgX+E16sA8ThL9b5D+57SOc
DMZYQWtqf58QrunTYNFc3nj77HlVrDH65lq6ID1dMgLLxMYb0wdO9JIldN3K9pdb
Y+C/RG0KwJmzE1G7wWBtng+Vaj5WnRDZc5HjNSvAppRLaIEnDQlhbH5w5OjaT06J
TZszu6eLqB7cqf/Q5iwq06meNee07nhYyQqnraTp6ziUkUU/iBfj/+YQoVTxP2ry
eDHq6lfg1PE/ml/MXF95VTpCBXh/zSzMFuyB3JB1bI4s19/Vzka0hpLMFAqYJUxP
EtSDro72x0tQQMeVLb4MR4xiGJIxwVHKUBcI/dZ4z3fpHfD62Xe5knkICuF+JV7R
kk2fJ2+4iImJbB/w3GFA3WSTCwug7iJ+HUbDN6moTYn0Nk0FmqEeW3Wdl0F1Q/X9
T2Od5EN9wvGLtZNpPTOZJRQTlreiN0f5SDj4mTPUi826u1k0wk4=
=2yx3
-----END PGP SIGNATURE-----

--UBE0nj1MjsThX7N+--

