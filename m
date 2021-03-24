Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4BB346EF1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:39:59 +0100 (CET)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsV4-0000hJ-TY
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPw-0004Q1-Hi; Tue, 23 Mar 2021 21:34:40 -0400
Received: from ozlabs.org ([203.11.71.1]:33261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPu-0001m7-C9; Tue, 23 Mar 2021 21:34:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rPc6hfcz9sXG; Wed, 24 Mar 2021 12:34:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616549668;
 bh=nefogDx3IlmEHchmOdDZpUHs/iWCXMaNkRazHjwj5mc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kYTt38hNO0vX1Wh0i0igX9h6MemIBBcwvlbAlUZf/bpd8qFIRb3xqUX2KGF8hLsdO
 wEjaKBM9UeQX6QjcRwXVv2uxDpf9gMojgyA/Tkm6Q/u8A/rOzDj43aJ/aSNEgNhNan
 ExlsF7qAnSmEjnVOst+nHhAz8aJJDipNvGjyhENU=
Date: Wed, 24 Mar 2021 11:10:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 09/10] linux-user/ppc: Fix msr updates for signal
 handling
Message-ID: <YFqDj93aQoiNQM8e@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-10-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z5UUcRyDpgv10YAW"
Content-Disposition: inline
In-Reply-To: <20210323184340.619757-10-richard.henderson@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


--z5UUcRyDpgv10YAW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:43:39PM -0600, Richard Henderson wrote:
> In save_user_regs, there are two bugs where we OR in a bit number
> instead of the bit, clobbering the low bits of MSR.  However:
>=20
> The MSR_VR and MSR_SPE bits control the availability of the insns.
> If the bits were not already set in MSR, then any attempt to access
> those registers would result in SIGILL.
>=20
> For linux-user, we always initialize MSR to the capabilities
> of the cpu.  We *could* add checks vs MSR where we currently
> check insn_flags and insn_flags2, but we know they match.
>=20
> Also, there's a stray cut-and-paste comment in restore.
>=20
> Then, do not force little-endian binaries into big-endian mode.
>=20
> Finally, use ppc_store_msr for the update to affect hflags.
> Which is the reason none of these bugs were previously noticed.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0.

> ---
>  linux-user/ppc/cpu_loop.c |  5 +++--
>  linux-user/ppc/signal.c   | 23 +++++++++++------------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index df71e15a25..4a0f6c8dc2 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -492,11 +492,12 @@ void target_cpu_copy_regs(CPUArchState *env, struct=
 target_pt_regs *regs)
>  #if defined(TARGET_PPC64)
>      int flag =3D (env->insns_flags2 & PPC2_BOOKE206) ? MSR_CM : MSR_SF;
>  #if defined(TARGET_ABI32)
> -    env->msr &=3D ~((target_ulong)1 << flag);
> +    ppc_store_msr(env, env->msr & ~((target_ulong)1 << flag));
>  #else
> -    env->msr |=3D (target_ulong)1 << flag;
> +    ppc_store_msr(env, env->msr | (target_ulong)1 << flag);
>  #endif
>  #endif
> +
>      env->nip =3D regs->nip;
>      for(i =3D 0; i < 32; i++) {
>          env->gpr[i] =3D regs->gpr[i];
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index b78613f7c8..bad38f8ed9 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -261,9 +261,6 @@ static void save_user_regs(CPUPPCState *env, struct t=
arget_mcontext *frame)
>              __put_user(avr->u64[PPC_VEC_HI], &vreg->u64[0]);
>              __put_user(avr->u64[PPC_VEC_LO], &vreg->u64[1]);
>          }
> -        /* Set MSR_VR in the saved MSR value to indicate that
> -           frame->mc_vregs contains valid data.  */
> -        msr |=3D MSR_VR;
>  #if defined(TARGET_PPC64)
>          vrsave =3D (uint32_t *)&frame->mc_vregs.altivec[33];
>          /* 64-bit needs to put a pointer to the vectors in the frame */
> @@ -300,9 +297,6 @@ static void save_user_regs(CPUPPCState *env, struct t=
arget_mcontext *frame)
>          for (i =3D 0; i < ARRAY_SIZE(env->gprh); i++) {
>              __put_user(env->gprh[i], &frame->mc_vregs.spe[i]);
>          }
> -        /* Set MSR_SPE in the saved MSR value to indicate that
> -           frame->mc_vregs contains valid data.  */
> -        msr |=3D MSR_SPE;
>          __put_user(env->spe_fscr, &frame->mc_vregs.spe[32]);
>      }
>  #endif
> @@ -354,8 +348,10 @@ static void restore_user_regs(CPUPPCState *env,
>      __get_user(msr, &frame->mc_gregs[TARGET_PT_MSR]);
> =20
>      /* If doing signal return, restore the previous little-endian mode. =
 */
> -    if (sig)
> -        env->msr =3D (env->msr & ~(1ull << MSR_LE)) | (msr & (1ull << MS=
R_LE));
> +    if (sig) {
> +        ppc_store_msr(env, ((env->msr & ~(1ull << MSR_LE)) |
> +                            (msr & (1ull << MSR_LE))));
> +    }
> =20
>      /* Restore Altivec registers if necessary.  */
>      if (env->insns_flags & PPC_ALTIVEC) {
> @@ -376,8 +372,6 @@ static void restore_user_regs(CPUPPCState *env,
>              __get_user(avr->u64[PPC_VEC_HI], &vreg->u64[0]);
>              __get_user(avr->u64[PPC_VEC_LO], &vreg->u64[1]);
>          }
> -        /* Set MSR_VEC in the saved MSR value to indicate that
> -           frame->mc_vregs contains valid data.  */
>  #if defined(TARGET_PPC64)
>          vrsave =3D (uint32_t *)&v_regs[33];
>  #else
> @@ -468,7 +462,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>      env->nip =3D (target_ulong) ka->_sa_handler;
> =20
>      /* Signal handlers are entered in big-endian mode.  */
> -    env->msr &=3D ~(1ull << MSR_LE);
> +    ppc_store_msr(env, env->msr & ~(1ull << MSR_LE));
> =20
>      unlock_user_struct(frame, frame_addr, 1);
>      return;
> @@ -563,8 +557,13 @@ void setup_rt_frame(int sig, struct target_sigaction=
 *ka,
>      env->nip =3D (target_ulong) ka->_sa_handler;
>  #endif
> =20
> +#ifdef TARGET_WORDS_BIGENDIAN
>      /* Signal handlers are entered in big-endian mode.  */
> -    env->msr &=3D ~(1ull << MSR_LE);
> +    ppc_store_msr(env, env->msr & ~(1ull << MSR_LE));
> +#else
> +    /* Signal handlers are entered in little-endian mode.  */
> +    ppc_store_msr(env, env->msr | (1ull << MSR_LE));
> +#endif
> =20
>      unlock_user_struct(rt_sf, rt_sf_addr, 1);
>      return;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z5UUcRyDpgv10YAW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBag44ACgkQbDjKyiDZ
s5K8zg/+IGb09ujGlcSnzzubJXnqd7yccxBgqIv/CDqYEm55Zrmv9xIzGA5sJLZV
8E/HwxJQHPagKQoudLF7WsYfq41Kbu0jSrw6zDqhn8exhA/c3DrpP7F2Nl7d0Q1D
KUfsnw94TEzQlB94n7AZ/n4NAXrg3AQ09cxp86wgNxQH8RwTzkH9CnTppqP8td6t
VmNfWVdSEl/3J4xmaA7kVQg5mrz1BnhrJC6vYqzd3/OFN8KRfDt72DvkqLOjrrhd
Hne0JBZT4Bl5dcsWYu4uRSBpevVifgOiNVSGI+cKwtfqjYh1MR1jn6WacslUNC13
1oOnHw8/Kmc1YpAGMY5zkfV2dse6hmiMXD0dMnJKkjoGadHoSz0NN1XoOyCA3QC8
CvtjKk3Mt+fzrzCC3PE+6VTdyQH7VTmXjUBHNY8j/lCbdhiu2WKNJN+/MZ6cWwuO
0Ao7drFI220p48aSXw4/5dS6tGgOM1KJHx9n7JmRCP9+i7RC45OaRQRSbgDgxxp6
n+RSlcB/D0JroI3+1H287WzqBsRTWJypSK6PZXqc+iwLD3qr09VbcNluCmcFoYvV
XRAkjNg94uhFtoCNIBg63oEzRx2iD4zTIyKk/ZpZLu3tac0T8FeHVUwrT1p0+Gl1
+Efx5PxSL4YeyNU7opoDrcf8dPA7AW4wurRaOl5Ld7/IynF7dWk=
=Llww
-----END PGP SIGNATURE-----

--z5UUcRyDpgv10YAW--

