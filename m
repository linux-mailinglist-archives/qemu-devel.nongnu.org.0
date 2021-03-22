Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B33437E7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:26:50 +0100 (CET)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOC9R-00032J-Pk
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv9-0006Pa-80; Mon, 22 Mar 2021 00:12:03 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:57421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv3-0004jf-5O; Mon, 22 Mar 2021 00:11:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz1KB1z9sWg; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=8OEj8Thj1Np1EpJPeBsC1jbvXvVLGxacadxVYTLY4JM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nudaVMua7Mq9kFBLSWmXwmaeyLFRHd2AXUzZgCshJE+xW8Ic+Kq6r56NBFTztCrdn
 YB4D+K8n/TsZojU21urzeMTdYLjFw4bNZmxcoxpyw6zSauDbhXD9z0E9V5+Q2rZPiG
 gbXUD/q0iv2kMork1s4tJj6GdyZVX8/A2hVhRkUQ=
Date: Mon, 22 Mar 2021 14:41:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 05/17] target/ppc: Retain hflags_nmsr only for migration
Message-ID: <YFgR+EKGCLmphxw5@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-6-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Je882/pIaNPvpsPA"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-6-richard.henderson@linaro.org>
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


--Je882/pIaNPvpsPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:03PM -0600, Richard Henderson wrote:
> We have eliminated all normal uses of hflags_nmsr.  We need
> not even compute it except when we want to migrate.  Rename
> the field to emphasize this.
>=20
> Remove the fixme comment for migrating access_type.  This value
> is only ever used with the current executing instruction, and
> is never live when the cpu is halted for migration.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  target/ppc/cpu.h         | 4 ++--
>  target/ppc/helper_regs.c | 2 --
>  target/ppc/machine.c     | 9 ++++++---
>  3 files changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 061d2eed1b..79c4033a42 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1105,8 +1105,8 @@ struct CPUPPCState {
>  #endif
> =20
>      /* These resources are used only in QEMU core */
> -    target_ulong hflags;      /* hflags is MSR & HFLAGS_MASK */
> -    target_ulong hflags_nmsr; /* specific hflags, not coming from MSR */
> +    target_ulong hflags;
> +    target_ulong hflags_compat_nmsr; /* for migration compatibility */
>      int immu_idx;     /* precomputed MMU index to speed up insn accesses=
 */
>      int dmmu_idx;     /* precomputed MMU index to speed up data accesses=
 */
> =20
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 95b9aca61f..a87e354ca2 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -104,8 +104,6 @@ void hreg_compute_hflags(CPUPPCState *env)
>           */
>          uint32_t le =3D extract32(env->spr[SPR_HID0], 3, 1);
>          env->hflags |=3D le << MSR_LE;
> -        /* Retain for backward compatibility with migration. */
> -        env->hflags_nmsr =3D le << MSR_LE;
>      }
>  }
> =20
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index f6eeda9642..1f7a353c78 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -310,6 +310,10 @@ static int cpu_pre_save(void *opaque)
>          }
>      }
> =20
> +    /* Retain migration compatibility for pre 6.0 for 601 machines. */
> +    env->hflags_compat_nmsr =3D (env->flags & POWERPC_FLAG_HID0_LE
> +                               ? env->hflags & MSR_LE : 0);
> +
>      return 0;
>  }
> =20
> @@ -829,9 +833,8 @@ const VMStateDescription vmstate_ppc_cpu =3D {
>          /* Supervisor mode architected state */
>          VMSTATE_UINTTL(env.msr, PowerPCCPU),
> =20
> -        /* Internal state */
> -        VMSTATE_UINTTL(env.hflags_nmsr, PowerPCCPU),
> -        /* FIXME: access_type? */
> +        /* Backward compatible internal state */
> +        VMSTATE_UINTTL(env.hflags_compat_nmsr, PowerPCCPU),
> =20
>          /* Sanity checking */
>          VMSTATE_UINTTL_TEST(mig_msr_mask, PowerPCCPU, cpu_pre_2_8_migrat=
ion),

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Je882/pIaNPvpsPA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYEfgACgkQbDjKyiDZ
s5LlCw/+KlZpvyUkQJC0IMmBxzUt25ev3lGecVAMPVdgRHXDe2qMfcrkqqHHQ9Ne
Xx4qO/DjH7mIInAdUvL3rfG0xIzuqii1BSG03YB04VVoYtpcXI8fQ9bG3PG3blmR
4yBmvq71g/aosRnIJw89jrjqpWiQpjogvRYDrlc/3wmATwEUpPbdl3wRYqRpRZx1
A0CmcMMS0srLeg/9eOSg1otkMHtWmgyyVKHJMYulTNaUuv1tgTmhlQ+Dyj6AjcTR
JeJitRMFh0+7UaqMZFe8Uk8wQWYAbYDfWmfhadY3KSvDUy8tbzZHp2uk4i/O7wQ8
pXov2OWr3NH+8nljXXbLjBllFlYn1z2inhi27SqcYlbvi8rp16697E3B37kejc6o
PAlYK0EGWGxIRU1beYvWXgVAfhRTingKn9w2wfBZO31yt2pYiyKB9qc2ii7Ditd+
/1QYandGO2n/Pv6ED9DVLU/Twyt2ONwmAfDmnNtRAbcuMhO1jnxrJpbNYEo0sMdr
6DfUEo5Kui7HE2a9Ym0wuNo5eXSl0939QWWuMESMQFWMkc9Z334x0azHsamJARoS
dZidicvvGDeaHAJaTY87ncoI88SmvoN4DJsa5N8I37Zfu+BnewKE4zA8aifCQnvi
6ctX2JB/DSBs6SQyzkwJO+owu5jWTWgzJ0fZx3+9ORzzpnXytVo=
=nUWt
-----END PGP SIGNATURE-----

--Je882/pIaNPvpsPA--

