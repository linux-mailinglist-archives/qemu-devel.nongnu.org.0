Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AE44ED153
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 03:31:47 +0200 (CEST)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZjf8-0008Ki-Q5
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 21:31:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZjZr-0004Vc-7B; Wed, 30 Mar 2022 21:26:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZjZn-0004Bg-Dk; Wed, 30 Mar 2022 21:26:18 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KTQcH3nptz4xXt; Thu, 31 Mar 2022 12:26:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648689967;
 bh=x/YLJECqI6mr1gqWDCwThfQ8bHYUhQaP52m7nBvFEqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YMfSP3TQ5OXQh/mFG+4z8VPkwYYkFODbgzUcUgx5mvEGtgNB5CUEmBJEhqtjMWmTC
 ZRHLa/L03hlZDo9AZToAtVv38MrgxKA0nvaK7DhbOw+xoZYnzNernRAwCm5WMD13vt
 Uu6F2ZMW6PMgY3zdDVVqSvCFIFu0azMOlUVCC6GE=
Date: Thu, 31 Mar 2022 12:25:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/4] target/ppc: init 'lpcr' in
 kvmppc_enable_cap_large_decr()
Message-ID: <YkUDCdUsjjmzFgJr@yekko>
References: <20220331001717.616938-1-danielhb413@gmail.com>
 <20220331001717.616938-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V/i1Dxzu3tWGKMu1"
Content-Disposition: inline
In-Reply-To: <20220331001717.616938-3-danielhb413@gmail.com>
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


--V/i1Dxzu3tWGKMu1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 09:17:15PM -0300, Daniel Henrique Barboza wrote:
> 'lpcr' is used as an input of kvm_get_one_reg(). Valgrind doesn't
> understand that and it returns warnings as such for this function:
>=20
> =3D=3D55240=3D=3D Thread 1:
> =3D=3D55240=3D=3D Conditional jump or move depends on uninitialised value=
(s)
> =3D=3D55240=3D=3D    at 0xB011E4: kvmppc_enable_cap_large_decr (kvm.c:254=
6)
> =3D=3D55240=3D=3D    by 0x92F28F: cap_large_decr_cpu_apply (spapr_caps.c:=
523)
> =3D=3D55240=3D=3D    by 0x930C37: spapr_caps_cpu_apply (spapr_caps.c:921)
> =3D=3D55240=3D=3D    by 0x955D3B: spapr_reset_vcpu (spapr_cpu_core.c:73)
> =3D=3D55240=3D=3D    by 0x95612B: spapr_cpu_core_reset (spapr_cpu_core.c:=
209)
> =3D=3D55240=3D=3D    by 0x95619B: spapr_cpu_core_reset_handler (spapr_cpu=
_core.c:218)
> =3D=3D55240=3D=3D    by 0xD3605F: qemu_devices_reset (reset.c:69)
> =3D=3D55240=3D=3D    by 0x92112B: spapr_machine_reset (spapr.c:1641)
> =3D=3D55240=3D=3D    by 0x4FBD63: qemu_system_reset (runstate.c:444)
> =3D=3D55240=3D=3D    by 0x62812B: qdev_machine_creation_done (machine.c:1=
247)
> =3D=3D55240=3D=3D    by 0x5064C3: qemu_machine_creation_done (vl.c:2725)
> =3D=3D55240=3D=3D    by 0x5065DF: qmp_x_exit_preconfig (vl.c:2748)
> =3D=3D55240=3D=3D  Uninitialised value was created by a stack allocation
> =3D=3D55240=3D=3D    at 0xB01158: kvmppc_enable_cap_large_decr (kvm.c:254=
0)
>=20
> Init 'lpcr' to avoid this warning.

Hmm... this is seeming a bit like whack-a-mole.  Could we instead use
one of the valgrind hinting mechanisms to inform it that
kvm_get_one_reg() writes the variable at *target?

> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 858866ecd4..42814e1b97 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2538,7 +2538,7 @@ int kvmppc_get_cap_large_decr(void)
>  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
>  {
>      CPUState *cs =3D CPU(cpu);
> -    uint64_t lpcr;
> +    uint64_t lpcr =3D 0;
> =20
>      kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
>      /* Do we need to modify the LPCR? */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--V/i1Dxzu3tWGKMu1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJFAwIACgkQgypY4gEw
YSLdnA//QiZvZEQk9uty23AgdZq5VHRD4aoeEZ1otdVsyHy94WMf6mTxqKp6wf3z
MH9aLGG/Z6+gFwZwQnBA5bdOfIy0UWS2Spz2wDIw3sGnoFJyJXTOdu8M42Bmq0NR
RugV2gzkFyXpIfVr/iR4ylhnv/h2z54e3dADpr/ITnW/UYGxf8iQra7Gaq2DE++W
QMHRaUNfV/0mFqqaC6Ag/3B+G+DFupR7b8cm8CxLa9LM/m7xCXrhNOeVepxdXLsq
VQ8qQxGkOtVebShdJzQpN6RenEI/LfACsyK5uyh2aoCRn5xjM+J53EoZruU7M8o7
VCYBtPHwfPm7mk2SJjQE7voMfVH58nsoD3eomZB5kfo1mzzFAANktazE4nuroeGD
Gmwe/EyhiOloGJeYXE5k7KA4xN1+KvLfRlCkESVVYzGD6W5/Txm4YW/aj6EoQc8E
hzc5h22UCFZWi0sbw2HC7DnadB+J6r7sxTvFJaqWnYD7qnCaZ9J6H2o3J9BRqpru
MvvjKbMEVGSH0Odec7m60N7OmrVBoJN+DoLGv+TYJiO4skf1uWNMoAZBSk9j4rSU
3rsfWaTomamU0s8iC0D6nGQCnnBC+fOMGogIGpCI+3im/t4ZYkltkjDvFEsdYbVw
gL8/T2M9FeIg+emWeyiNvv3CL5eaplkz5VruH8eB45lr+7yhAgM=
=CD2N
-----END PGP SIGNATURE-----

--V/i1Dxzu3tWGKMu1--

