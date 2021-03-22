Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC63B3437DA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:19:24 +0100 (CET)
Received: from localhost ([::1]:54772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOC2F-0004QS-Rc
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBvA-0006Ti-Jn; Mon, 22 Mar 2021 00:12:04 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv3-0004ka-AT; Mon, 22 Mar 2021 00:12:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz2XWyz9sXH; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=urlNOCo1X1yvUPdDIzEZc9Od4heQujrhqRE7r6nEBrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pz97cdLQI8Wi3vqAUAyEEDXn+pTg1RBHzhmip/IFI2VJd2EY8Ay+d70WL8dV0dzxd
 nic9WcdBhT8MJCj/fFZpkMqq3OqwuJomF6WYCTEOzQvPUdYKfCODPhXD9RKu3ssG5Q
 KSwOOmpw94MYwjM/ktuDVO6I0/Nkmk3V+tG7ULyY=
Date: Mon, 22 Mar 2021 14:53:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 08/17] target/ppc: Reduce env->hflags to uint32_t
Message-ID: <YFgUzZEuuJQ+vN6L@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-9-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rLwKTa/LVi6mvt3E"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-9-richard.henderson@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rLwKTa/LVi6mvt3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:06PM -0600, Richard Henderson wrote:
> It will be stored in tb->flags, which is also uint32_t,
> so let's use the correct size.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h         | 4 ++--
>  target/ppc/misc_helper.c | 2 +-
>  target/ppc/translate.c   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 39f35b570c..2abaf56869 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1128,8 +1128,8 @@ struct CPUPPCState {
>      bool resume_as_sreset;
>  #endif
> =20
> -    /* These resources are used only in QEMU core */
> -    target_ulong hflags;
> +    /* These resources are used only in TCG */
> +    uint32_t hflags;
>      target_ulong hflags_compat_nmsr; /* for migration compatibility */
>      int immu_idx;     /* precomputed MMU index to speed up insn accesses=
 */
>      int dmmu_idx;     /* precomputed MMU index to speed up data accesses=
 */
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index 63e3147eb4..b04b4d7c6e 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -199,7 +199,7 @@ void helper_store_hid0_601(CPUPPCState *env, target_u=
long val)
>      if ((val ^ hid0) & 0x00000008) {
>          /* Change current endianness */
>          hreg_compute_hflags(env);
> -        qemu_log("%s: set endianness to %c =3D> " TARGET_FMT_lx "\n", __=
func__,
> +        qemu_log("%s: set endianness to %c =3D> %08x\n", __func__,
>                   val & 0x8 ? 'l' : 'b', env->hflags);
>      }
>  }
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index a9325a12e5..a85b890bb0 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7657,7 +7657,7 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int =
flags)
>                   env->nip, env->lr, env->ctr, cpu_read_xer(env),
>                   cs->cpu_index);
>      qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
> -                 TARGET_FMT_lx " iidx %d didx %d\n",
> +                 "%08x iidx %d didx %d\n",
>                   env->msr, env->spr[SPR_HID0],
>                   env->hflags, env->immu_idx, env->dmmu_idx);
>  #if !defined(NO_TIMER_DUMP)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rLwKTa/LVi6mvt3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYFM0ACgkQbDjKyiDZ
s5LncxAAv2qUoq6DnYOsycyXwgw0/sBbms9rCiYNU8JOEK9bn9o2RJh/ZZXz5UZa
wMJdGEqpGxyKLomkhKKkHAGVgTvn8wiFPW7N6Ro7+bljqH3Dv/6Tlj9QY1+Y6+wF
Hxq9pNZsDGxtirJ81T3zSHVQd6VJ7DvnOUCWDZb1HDjjZ9TotU6g5OwD9EMVdShh
y8v6ELbMe1YSC5CgN2/m2sJVk6C6RMOIw4f05LsDHnvccoEXhFj3eejmcO6/aACX
wjOzodfk6rZmHvop0OC68SxFjJnq0hGg4wjUqusiMB5tYcKp+hj6UqQvVCK1N0M4
20eqlENtmBzFPfmOq6SkjBTYLSZLZT+wtHNdmMASD28/UD63uM7EGtzHPN/gDyNa
8SVxCVX1UFu/CfxdI6TamijZGgxlgQ/8yTfIzOwMind8jchT7ooTVjcwFEegsWIY
iXjMnnGiRtCS752ULWFxLQKHwvgK3LW200jE3W3IfoufFD2VczsLwuPvByEeRblZ
9v6Yx3/ZFgEZQsT8g3dgzr3QWJnD59jESeCsGihZ8enrwneWKY7Ja5v1wB5c5V/Y
S/f0cDnqv/mISulVIPUlnyCP+j657vIEG8G95VZP/eadZ+C0POt06+AaiUCNYRdB
HkAzmIha3YQ3TThJHLxxypAIHXe1gK2Ucs6v475nvOVpRC2gD4c=
=KYyv
-----END PGP SIGNATURE-----

--rLwKTa/LVi6mvt3E--

