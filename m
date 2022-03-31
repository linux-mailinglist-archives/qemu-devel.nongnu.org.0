Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B04ED152
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 03:31:45 +0200 (CEST)
Received: from localhost ([::1]:39052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZjf6-0008Kj-Qq
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 21:31:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZjZr-0004Vm-AE; Wed, 30 Mar 2022 21:26:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZjZn-0004Bf-Dk; Wed, 30 Mar 2022 21:26:18 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KTQcH3dZmz4xPv; Thu, 31 Mar 2022 12:26:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648689967;
 bh=eQAYKrPHcaRCuhSE+SmmbP8AsW3L+p0UBXsDkZBcKGQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ke9hZeLEsPIjF1FRL+4O1UPzb+zzSfTXtstMeIYa7okOPuHTGK9Zm6Lw99dsHV/gD
 0KtI1u5/+OMog1aC638mYT/JAWnxGFEIYMZhuEuLFusDwum3omG85zr9FZQ8bdzP2A
 /+RDVQLwuRapHRBzN9wMaRGWI7uNNKuWNR4QjaDE=
Date: Thu, 31 Mar 2022 12:20:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/4] target/ppc: initialize 'val' union in
 kvm_get_one_spr()
Message-ID: <YkUB1miNaGYsEgy1@yekko>
References: <20220331001717.616938-1-danielhb413@gmail.com>
 <20220331001717.616938-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v34aRkScU/dpM9xe"
Content-Disposition: inline
In-Reply-To: <20220331001717.616938-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--v34aRkScU/dpM9xe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 09:17:14PM -0300, Daniel Henrique Barboza wrote:
> Valgrind isn't convinced that we are initializing the values we assign
> to env->spr[spr] because it doesn't understand that the 'val' union is
> being written by the kvm_vcpu_ioctl() that follows (via struct
> kvm_one_reg).
>=20
> This results in Valgrind complaining about uninitialized values every
> time we use env->spr in a conditional, like this instance:
>=20
> =3D=3D707578=3D=3D Thread 1:
> =3D=3D707578=3D=3D Conditional jump or move depends on uninitialised valu=
e(s)
> =3D=3D707578=3D=3D    at 0xA10A40: hreg_compute_hflags_value (helper_regs=
=2Ec:106)
> =3D=3D707578=3D=3D    by 0xA10C9F: hreg_compute_hflags (helper_regs.c:173)
> =3D=3D707578=3D=3D    by 0xA110F7: hreg_store_msr (helper_regs.c:262)
> =3D=3D707578=3D=3D    by 0xA051A3: ppc_cpu_reset (cpu_init.c:7168)
> =3D=3D707578=3D=3D    by 0xD4730F: device_transitional_reset (qdev.c:799)
> =3D=3D707578=3D=3D    by 0xD4A11B: resettable_phase_hold (resettable.c:18=
2)
> =3D=3D707578=3D=3D    by 0xD49A77: resettable_assert_reset (resettable.c:=
60)
> =3D=3D707578=3D=3D    by 0xD4994B: resettable_reset (resettable.c:45)
> =3D=3D707578=3D=3D    by 0xD458BB: device_cold_reset (qdev.c:296)
> =3D=3D707578=3D=3D    by 0x48FBC7: cpu_reset (cpu-common.c:114)
> =3D=3D707578=3D=3D    by 0x97B5EB: spapr_reset_vcpu (spapr_cpu_core.c:38)
> =3D=3D707578=3D=3D    by 0x97BABB: spapr_cpu_core_reset (spapr_cpu_core.c=
:209)
> =3D=3D707578=3D=3D  Uninitialised value was created by a stack allocation
> =3D=3D707578=3D=3D    at 0xB11F08: kvm_get_one_spr (kvm.c:543)
>=20
> Initializing 'val' has no impact in the logic and makes Valgrind output
> more bearable.
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/kvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..858866ecd4 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -543,10 +543,11 @@ static void kvm_get_one_spr(CPUState *cs, uint64_t =
id, int spr)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      CPUPPCState *env =3D &cpu->env;
> +    /* Init 'val' to avoid "uninitialised value" Valgrind warnings */
>      union {
>          uint32_t u32;
>          uint64_t u64;
> -    } val;
> +    } val =3D { };
>      struct kvm_one_reg reg =3D {
>          .id =3D id,
>          .addr =3D (uintptr_t) &val,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--v34aRkScU/dpM9xe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJFAdAACgkQgypY4gEw
YSLvog/9FQvxNYkuysbzpjsev8QiznfK5i01+FOdHjsoWUNfo7acV+VmKDr71zuf
gN4yMx3wNWK2AbTHrXje27Q0cTLdFNpd/wPaEgx9p68xXgMXQAy/7aEQXTXyL8BY
8zeMTJMym9mePJeqjZEQ/+rVvN9ZhvrpuqZdBKZuU1T9z95YHUq5+qDs67105V4S
dWR9bPWVE7VPBOaZ3MvzlNkB0FdlLYX9S7ctSU84ZsDrCkRTOsC1iNvJRJ0jmR0U
+j2lyz73TDFBPyRKdvsoFADGQgFdbEqh4kVQoLxz+2OkcUdAYLqTruCsRNInxV1I
FJCGTYQN53Si8GonaFpzn2/Q+EpWSc/7mXbpzFhxWUza1u0R5WiArXV3mgTsxahG
/6UCbYTbpyNA4UTByNDyOQsYe+nb+eVqG6AdVFPCYh0zE3rQiNVOC0FqPOXPTq+r
TDc0tGrvAmu/dhubbJFI4LjQVsrTGhZH4cnEGWxYQxzY5JsAZ2PkOhGp5WuEQiGn
bgILH1JAmiYDQnZzQilKao3uScvZVuOyZVMZEGRVGjShxAFXKQ6b0KLdLfmjqJoD
LO4uF//f/LswovgFeJVFdeWX3tTb2YOAICrOSTSxHC8zJOhd28i/W0U2EQAt61e6
IaOc56ZgffRClImKlCEDnG4fsgdaxZfiuU50nZugMmlpRoeglGE=
=CYr1
-----END PGP SIGNATURE-----

--v34aRkScU/dpM9xe--

