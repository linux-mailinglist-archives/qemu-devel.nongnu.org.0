Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1FF3437DF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:23:12 +0100 (CET)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOC5u-0008HC-S7
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv9-0006PQ-5J; Mon, 22 Mar 2021 00:12:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43289 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv1-0004jO-Ka; Mon, 22 Mar 2021 00:11:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz0zhvz9sWw; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=AwINAzF3Ol5nnYKXWOwalG9nLdev8/Vq7vRFanIZwQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PLCtw82HtdKI0TJU76jqp9WSxkLdMLs1ZEkpkcxD1ztEuJ0vsOtOAVUunSzbOj4Jt
 X5oQUaYfRk+OhSLt0HyCYLiicVvjTGnZjPQmc1Sl2U6uwkGv6/kkHZ7196IpBdbHGk
 TPUqIfVNumzDLuSWaBf5N546GgRh19lYPe2e6ZwE=
Date: Mon, 22 Mar 2021 14:38:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 03/17] target/ppc: Properly sync cpu state with new
 msr in cpu_load_old
Message-ID: <YFgRLjsamwBCAGbM@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-4-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PmMq6QynCFUgM6dW"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-4-richard.henderson@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--PmMq6QynCFUgM6dW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:01PM -0600, Richard Henderson wrote:
> Match cpu_post_load in using ppc_store_msr to set all of
> the cpu state implied by the value of msr.  Do not restore
> hflags or hflags_nmsr, as we recompute them in ppc_store_msr.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  target/ppc/machine.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 283db1d28a..87d7bffb86 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -21,6 +21,7 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int =
version_id)
>      int32_t slb_nr;
>  #endif
>      target_ulong xer;
> +    target_ulong msr;
> =20
>      for (i =3D 0; i < 32; i++) {
>          qemu_get_betls(f, &env->gpr[i]);
> @@ -111,11 +112,19 @@ static int cpu_load_old(QEMUFile *f, void *opaque, =
int version_id)
>      qemu_get_betls(f, &env->ivpr_mask);
>      qemu_get_betls(f, &env->hreset_vector);
>      qemu_get_betls(f, &env->nip);
> -    qemu_get_betls(f, &env->hflags);
> -    qemu_get_betls(f, &env->hflags_nmsr);
> +    qemu_get_sbetl(f); /* Discard unused hflags */
> +    qemu_get_sbetl(f); /* Discard unused hflags_nmsr */
>      qemu_get_sbe32(f); /* Discard unused mmu_idx */
>      qemu_get_sbe32(f); /* Discard unused power_mode */
> =20
> +    /*
> +     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
> +     * before restoring.  Note that this recomputes hflags and mem_idx.
> +     */
> +    msr =3D env->msr;
> +    env->msr ^=3D env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
> +    ppc_store_msr(env, msr);
> +
>      /* Recompute mmu indices */
>      hreg_compute_mem_idx(env);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PmMq6QynCFUgM6dW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYES4ACgkQbDjKyiDZ
s5K2+w/7BL/P2sELR176fxApeGoXk+a3qt3v4NVpAWxPwwPT/RBl1YVPqcBXCeIU
wLcTNLQHtl6OReLH9W7S7l4EQ7U/6oBXUjjZHBtIxoS9LbOmKAa3Jywm9q648E3d
272LHCFYo7RYX84KHjZv+m4RwBPz+GfReVjh3mu3LjlERDnHKsghM8c++GlruFwN
SMoQEkFwzNGH9cNJ+fQiOTxe2kHnpgkFRGZ8Xq8x3l62jMbmQAU+GkTBB/HITfOx
2SRJOsSBwVHVe2LzYlyLNume7F2MIgi98x5lxk4hQFagwy/Ii5FGmQH9AfEU11Ng
oIzk2YQE5DnT7Aw4dHeA2LTb13YG5qxQN98OErK9F4h14+vjrFuVEd6C+TfC6dAz
KNcfNZXudeGbnICxH6/qR182j6gCymbtPhfJO0uzBTeZCZ17c7Dln43gtbXjes17
4dC7AfSMi+hDWMAg1Heg7u4vbnI3UJNQ1S1EoGs77Ev2TK3HGM3NY2o+bi3H1KM0
LKkiPCazdAT3VAslygzGu3VCTClxqQEJmLOEF9CTuPhyuyHEhmUPyG7PFPbGFqcz
adGpmmL+Y4pjoiqiR69b4Mz0qD/1kSS+Dy61gHDOv99124PZu94EQRxH93s8Zbmv
ikHi0yV8TSaLD8MPs3QAWvvWZjJf+Al9KVkXnR4DpGWwO2sHIUw=
=IOAP
-----END PGP SIGNATURE-----

--PmMq6QynCFUgM6dW--

