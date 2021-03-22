Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99E3437CF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:15:06 +0100 (CET)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOBy5-00006Q-Du
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv1-0006Mv-9C; Mon, 22 Mar 2021 00:11:55 -0400
Received: from ozlabs.org ([203.11.71.1]:55271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBuv-0004gX-Qz; Mon, 22 Mar 2021 00:11:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz0d1wz9sWd; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=HxNfRwB4QT69Zv9Uk/35KNQIS5wgwuonYHmjfNa3bRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bk8w7CeDO/zRPIu+AKnZ2shOtvd4SfzH42kTns8lnGjvYI1nHtJrmg41rH06TW0kv
 cSJoTGCmLV3djwKj99drC3abCAVysIcrXAnYv/xVwgcNtKwwQsAm5To9ABOOoQPJ50
 j4shKC0GuvpvxgJ0gArv3Fft/ikWy6hvvyu144OE=
Date: Mon, 22 Mar 2021 14:39:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 04/17] target/ppc: Do not call hreg_compute_mem_idx
 after ppc_store_msr
Message-ID: <YFgReeK8T+pW5jor@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-5-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zNnwkpRdEK3uz8D8"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-5-richard.henderson@linaro.org>
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


--zNnwkpRdEK3uz8D8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:02PM -0600, Richard Henderson wrote:
> In ppc_store_msr we call hreg_compute_hflags, which itself
> calls hreg_compute_mem_idx.  Rely on ppc_store_msr to update
> everything required by the msr update.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0.

> ---
>  target/ppc/machine.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 87d7bffb86..f6eeda9642 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -125,9 +125,6 @@ static int cpu_load_old(QEMUFile *f, void *opaque, in=
t version_id)
>      env->msr ^=3D env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
>      ppc_store_msr(env, msr);
> =20
> -    /* Recompute mmu indices */
> -    hreg_compute_mem_idx(env);
> -
>      return 0;
>  }
> =20
> @@ -418,14 +415,12 @@ static int cpu_post_load(void *opaque, int version_=
id)
> =20
>      /*
>       * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
> -     * before restoring
> +     * before restoring.  Note that this recomputes hflags and mem_idx.
>       */
>      msr =3D env->msr;
>      env->msr ^=3D env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
>      ppc_store_msr(env, msr);
> =20
> -    hreg_compute_mem_idx(env);
> -
>      return 0;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zNnwkpRdEK3uz8D8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYEXkACgkQbDjKyiDZ
s5IWeA//exgoK1nEhCD3YYHlX8DYUkw5KqudctHXWvxgP5rYLOsQVnq3XtmxEHjo
20fT8FrVuxdfiz9ThJlUWgcbBpqmrrqn9PfVJqeFL8r8ElYmv//zavde8eaIpR9M
qW6E9lCvR+n3NVDtFJJYUTtpqVXBU8peRFyfJRptQpY+6xr0RojWCeLoezI8jGHQ
JrgQryexm40SQLwmmcQa/mClKv2ogQnDG4hfpXAfVEqkvmRoQFrO3cK46h3QoYKw
J3zgJ+nC/sAc4gemb0KNn//KhkzQCsmoCd01qQRhCYhtyJ5BHfJmrKeRTBthxISX
ZwYmjGH8cD0lSP5HuXrFF2EDpxnnCK8HyG9O9ln2uIOp48OGKsPF31w4fceP1e6y
pkdbgLEXrlG7OTc7iJW6hy3Eo3JZlBvp8033a09ADCvhWp0okYEcz6lZgpt4B0A9
nbivJUyI+18MuCVbf71FNVP7wdV+jG8X3UEMOgxD23y4wkrTE5a67NNYIDrgrsBO
qIWozkgEmWYvudoTkfut4wfPP18B34aCB3BS1uJsVPkGJvcCBqEbzxc9c98dUgiS
ZloXO0A6NJsmJEW83OibEqUPyk7/gKqFsgyhyKSF2C47CC/62daYqHfeir0imUCi
VI6G/sxcKbKnExLcGw/fRlfY53NJTBj862Alut+s74L8jSK/cU0=
=hBsz
-----END PGP SIGNATURE-----

--zNnwkpRdEK3uz8D8--

