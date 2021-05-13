Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F3F37F22D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:28:46 +0200 (CEST)
Received: from localhost ([::1]:53830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh2xp-0004ga-BT
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sT-0007DF-Lq; Thu, 13 May 2021 00:23:14 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sQ-0004Ww-HR; Thu, 13 May 2021 00:23:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms2RdKz9sjB; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=kYO2Qej8MhpAEZn4gBZR2H74LNm9GRKR6uFeD82nqAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lmNGGP/4uQOamF0wTzIu+MUUGEdf6WdsrT+4KCtQnzF30xv9HoH/9f7rtv6OibOmJ
 fA3UKBvKYzUSRtSPTUGyMiVYhTgAUrOnEWRp0SR256fl+4XZSRqU0YIqZXVVu7csh9
 aZYZWKrDZRpk6Fch/mspU0nOMqEEfuky7HQ9pHmk=
Date: Thu, 13 May 2021 13:50:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 02/11] target/ppc: moved ppc_store_sdr1 to cpu.c
Message-ID: <YJyiDaBAK48lVaDF@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-3-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mgsth4v4LMmq9bwR"
Content-Disposition: inline
In-Reply-To: <20210512140813.112884-3-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mgsth4v4LMmq9bwR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 11:08:04AM -0300, Bruno Larsen (billionai) wrote:
> Moved this function that is required in !TCG cases into a
> common code file

The reasons it's needed by !TCG are kind of bogus, related to
weirdness in the way KVM PR works.  But it's fair not to care about
that right now, so, applied to ppc-for-6.1.

>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/cpu.c        | 29 +++++++++++++++++++++++++++++
>  target/ppc/mmu_helper.c | 26 --------------------------
>  2 files changed, 29 insertions(+), 26 deletions(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index cb794e9f4f..0ab7ac1af1 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -20,7 +20,10 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "cpu-models.h"
> +#include "cpu-qom.h"
> +#include "exec/log.h"
>  #include "fpu/softfloat-helpers.h"
> +#include "mmu-hash64.h"
> =20
>  target_ulong cpu_read_xer(CPUPPCState *env)
>  {
> @@ -61,3 +64,29 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
>      uint32_t sat =3D (env->vscr_sat.u64[0] | env->vscr_sat.u64[1]) !=3D =
0;
>      return env->vscr | (sat << VSCR_SAT);
>  }
> +
> +void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, valu=
e);
> +    assert(!cpu->vhyp);
> +#if defined(TARGET_PPC64)
> +    if (mmu_is_64bit(env->mmu_model)) {
> +        target_ulong sdr_mask =3D SDR_64_HTABORG | SDR_64_HTABSIZE;
> +        target_ulong htabsize =3D value & SDR_64_HTABSIZE;
> +
> +        if (value & ~sdr_mask) {
> +            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
> +                         value & ~sdr_mask);
> +            value &=3D sdr_mask;
> +        }
> +        if (htabsize > 28) {
> +            error_report("Invalid HTABSIZE 0x" TARGET_FMT_lx" stored in =
SDR1",
> +                         htabsize);
> +            return;
> +        }
> +    }
> +#endif /* defined(TARGET_PPC64) */
> +    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
> +    env->spr[SPR_SDR1] =3D value;
> +}
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index ca88658cba..06e1ebdcbc 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2085,32 +2085,6 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, targ=
et_ulong addr)
> =20
>  /***********************************************************************=
******/
>  /* Special registers manipulation */
> -void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, valu=
e);
> -    assert(!cpu->vhyp);
> -#if defined(TARGET_PPC64)
> -    if (mmu_is_64bit(env->mmu_model)) {
> -        target_ulong sdr_mask =3D SDR_64_HTABORG | SDR_64_HTABSIZE;
> -        target_ulong htabsize =3D value & SDR_64_HTABSIZE;
> -
> -        if (value & ~sdr_mask) {
> -            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
> -                         value & ~sdr_mask);
> -            value &=3D sdr_mask;
> -        }
> -        if (htabsize > 28) {
> -            error_report("Invalid HTABSIZE 0x" TARGET_FMT_lx" stored in =
SDR1",
> -                         htabsize);
> -            return;
> -        }
> -    }
> -#endif /* defined(TARGET_PPC64) */
> -    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
> -    env->spr[SPR_SDR1] =3D value;
> -}
> -
>  #if defined(TARGET_PPC64)
>  void ppc_store_ptcr(CPUPPCState *env, target_ulong value)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mgsth4v4LMmq9bwR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcog0ACgkQbDjKyiDZ
s5JmMQ/+JHGwprpKAcIM/fscuFCnwM5q3JWeaahEcqfZPipuVMpEhiBon9/uaher
Rjtb5c/8QRyY2MJpfqanpWA80k86NzYd9WMtRn+BOxIXCS+YiPxaetA4EIOXpml2
Avm3i3J7UIDDb7h1Zeo9Q2AaI16a2O2rfhxlhyqEOdjqZUVQfA9+3F9TJIMXE6PS
Q2w9x0njYP3ClleLuj6egSI/Inl7Hl35szlgFmOBPGsrz4DwQi2sWt4FPOvF7nAq
h1TxPxrmHfs7oqaGC58lk6sSeSq8K8/TbvS/ehkgLJrLbmgz0RFzt9tNSjLJr89W
MSGA85xBrzveufXg32V5Knv/3QCB6EnGzCHz26YwBmgnjprVuunLLkBxydtG2HGj
cDYlyIt0JbC+FMnEpd36iMtqIhqOyj2jit4TOklJ4mBsizO1nhpYO4/Nbfi3u8og
a1P21U0tAGw/0Rg9mPVC4uKTdPCVO3VaaCYBXoOYHMF17J3+7PXIthScpcz8I8TN
wopLckaHZEKCbEz8sunwTk2tjE2PzxxTP3JvfkFzN1vJYo2RbKVvdBdM1BM8JCpv
IR1L5ptWnYphzlKGBmRJJDLvVfl63+DHGggIhIibkz46iY0vqoerZr3i9UxdK+IU
5RP7MhQ4qDco6Gkb7iV9A2CKKzqWTWxte1bqQfZ6crt0KfuF+4A=
=/wD2
-----END PGP SIGNATURE-----

--mgsth4v4LMmq9bwR--

