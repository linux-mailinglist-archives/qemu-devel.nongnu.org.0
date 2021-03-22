Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224723437D8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:18:09 +0100 (CET)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOC11-00039i-TV
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBuz-0006Ma-Bj; Mon, 22 Mar 2021 00:11:54 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:48587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBuv-0004gb-NT; Mon, 22 Mar 2021 00:11:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzy70SCz9sWS; Mon, 22 Mar 2021 15:11:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386302;
 bh=IAR9ze8ne9+XxZ2WhiG8kcROOAxz6OTw2V4rgPTzBc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Li3AeAVeVcAAzK9PjwNmd5pz9vzfvQyGqa8HXPjI6BF5RGGEgF+0nn9jWueoE2QrS
 1EwRUXxUCAhBPY+qaRmNN/tJ6j4277oQr3si5pc+1A3IaE+ujhwk7hFDQoweGLSWF+
 UbvjM+BFq7lA/B4hNI83Jltmz0Ucw+WkK4aZUZ4o=
Date: Mon, 22 Mar 2021 14:35:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 02/17] target/ppc: Move 601 hflags adjustment to
 hreg_compute_hflags
Message-ID: <YFgQmFiu+FPHTmfZ@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-3-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d0fHKg3knkeNwy5i"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-3-richard.henderson@linaro.org>
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


--d0fHKg3knkeNwy5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:00PM -0600, Richard Henderson wrote:
> Keep all hflags computation in one place, as this will be
> especially important later.
>=20
> Introduce a new POWERPC_FLAG_HID0_LE bit to indicate when
> LE should be taken from HID0.  This appears to be set if
> and only if POWERPC_FLAG_RTC_CLK is set, but we're not
> short of bits and having both names will avoid confusion.
>=20
> Note that this was the only user of hflags_nmsr, so we can
> perform a straight assignment rather than mask and set.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  target/ppc/cpu.h                |  2 ++
>  target/ppc/helper_regs.c        | 13 +++++++++++--
>  target/ppc/misc_helper.c        |  8 +++-----
>  target/ppc/translate_init.c.inc |  4 ++--
>  4 files changed, 18 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e73416da68..061d2eed1b 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -581,6 +581,8 @@ enum {
>      POWERPC_FLAG_TM       =3D 0x00100000,
>      /* Has SCV (ISA 3.00)                                               =
     */
>      POWERPC_FLAG_SCV      =3D 0x00200000,
> +    /* Has HID0 for LE bit (601)                                        =
     */
> +    POWERPC_FLAG_HID0_LE  =3D 0x00400000,
>  };
> =20
>  /***********************************************************************=
******/
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 5e18232b84..95b9aca61f 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -96,8 +96,17 @@ void hreg_compute_hflags(CPUPPCState *env)
>      hflags_mask |=3D (1ULL << MSR_CM) | (1ULL << MSR_SF) | MSR_HVB;
>      hreg_compute_mem_idx(env);
>      env->hflags =3D env->msr & hflags_mask;
> -    /* Merge with hflags coming from other registers */
> -    env->hflags |=3D env->hflags_nmsr;
> +
> +    if (env->flags & POWERPC_FLAG_HID0_LE) {
> +        /*
> +         * Note that MSR_LE is not set in env->msr_mask for this cpu,
> +         * and so will never be set in msr or hflags at this point.
> +         */
> +        uint32_t le =3D extract32(env->spr[SPR_HID0], 3, 1);
> +        env->hflags |=3D le << MSR_LE;
> +        /* Retain for backward compatibility with migration. */
> +        env->hflags_nmsr =3D le << MSR_LE;
> +    }
>  }
> =20
>  void cpu_interrupt_exittb(CPUState *cs)
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index 5d6e0de396..63e3147eb4 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -194,16 +194,14 @@ void helper_store_hid0_601(CPUPPCState *env, target=
_ulong val)
>      target_ulong hid0;
> =20
>      hid0 =3D env->spr[SPR_HID0];
> +    env->spr[SPR_HID0] =3D (uint32_t)val;
> +
>      if ((val ^ hid0) & 0x00000008) {
>          /* Change current endianness */
> -        env->hflags &=3D ~(1 << MSR_LE);
> -        env->hflags_nmsr &=3D ~(1 << MSR_LE);
> -        env->hflags_nmsr |=3D (1 << MSR_LE) & (((val >> 3) & 1) << MSR_L=
E);
> -        env->hflags |=3D env->hflags_nmsr;
> +        hreg_compute_hflags(env);
>          qemu_log("%s: set endianness to %c =3D> " TARGET_FMT_lx "\n", __=
func__,
>                   val & 0x8 ? 'l' : 'b', env->hflags);
>      }
> -    env->spr[SPR_HID0] =3D (uint32_t)val;
>  }
> =20
>  void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong v=
alue)
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index c03a7c4f52..049d76cfd1 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -5441,7 +5441,7 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
>      pcc->excp_model =3D POWERPC_EXCP_601;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_601;
> -    pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK;
> +    pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG=
_HID0_LE;
>  }
> =20
>  #define POWERPC_MSRR_601v    (0x0000000000001040ULL)
> @@ -5485,7 +5485,7 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
>  #endif
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_601;
> -    pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK;
> +    pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG=
_HID0_LE;
>  }
> =20
>  static void init_proc_602(CPUPPCState *env)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d0fHKg3knkeNwy5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYEJYACgkQbDjKyiDZ
s5JGFhAAgbms9FCdyAMfm/H5FBfcRn4W/vNoZ9xQNXqr7F67l9M3cUApdoqQztzg
oCyu+G2KeyeTNKfmqAsLZfDeski1Q4KWU6gigaeO/7eeVoJNfnHqiE0/actJTbct
3D3pVR/A0o/FN2twYj6cZ6xI3MgpeUZOAA+1fEnZ9jLwDp4L8AMuK1wo0lMAiEaS
mecESFupNr5xe6hzsjSI9XvWTRSU6LmrFn36xNnhsOnlt7A+xLmSREWGQi9lRHJU
JIZe2B/2nCyxvhy75rsAqCZl0bjKDgAY+AXZK0bLC+Sbv7HqrTXatCSqicg+Ke3Z
bXF99d7x3Atz8J7l+4s9rm4MR9K7VGB+NltMqtvWCVd2rIpejbo0DfY/eA5K1DnR
KlmK8BwuDmGcZJ73UCb8A7mx6XmxiBpmvvrvna3p21bLvftdFSWSgQex8awEOKIf
BL9c9t3PEsR7Z8uBASkTA/7j6NUuaW6heUpNHmYd7WIHaETdx/RJVLU4/MF8+lVi
3k5naxCpq+BQ1ru6hDtWTMdPdUVtAhgSL0MmVvgWkRAe3zDeQdHH/uIBScmFWI9k
9qX75zbyA7Odmz4iN495dH/fkLTx5XBwP9ew4H5mz+jimukSAvyx8lTFNhmx2+FB
aa+Du1flCmRgPGXTJdg2WGzcBEQg5c4tyyYSAt0FeEcDlINRmBY=
=O2u3
-----END PGP SIGNATURE-----

--d0fHKg3knkeNwy5i--

