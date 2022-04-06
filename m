Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2C4F596F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:24:19 +0200 (CEST)
Received: from localhost ([::1]:33626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc1th-0001rt-Km
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nc1mT-0008AS-9c
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:16:49 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:43441
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nc1mO-0007U3-Kd
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:16:47 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KYJmM3wYtz4xY4; Wed,  6 Apr 2022 19:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1649236595;
 bh=cxlbYKNjFK0EYMyiTpOV69Q4uFp495BsqRUTrknP1kg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pS9KYWXYsDYb/JUBwLLOs5VDSI4v9vWyQgvwzuGCBdNu8x7ZuV7nMkdWRCs8Om5P2
 fNmWNyDojtnGYXFzUN8sjf0eH1ok2JN62SslONhi2kvQz8Fm1d8sD8C8HTzdwVL1OV
 kebfGE5BwlYdxYCB0JgJXKzx7IkRBVdXN9R8ldYo=
Date: Wed, 6 Apr 2022 11:46:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC PATCH 1/1] kvm-all.c: hint Valgrind that kvm_get_one_reg()
 inits memory
Message-ID: <Ykzw2o3ut5zVu27m@yekko>
References: <20220405130439.44253-1-danielhb413@gmail.com>
 <20220405130439.44253-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6jDmyqtNAkEQ87fx"
Content-Disposition: inline
In-Reply-To: <20220405130439.44253-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6jDmyqtNAkEQ87fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2022 at 10:04:39AM -0300, Daniel Henrique Barboza wrote:
> There is a lot of Valgrind warnings about conditional jump depending on
> unintialized values like this one (taken from a pSeries guest):
>=20
>  Conditional jump or move depends on uninitialised value(s)
>     at 0xB011DC: kvmppc_enable_cap_large_decr (kvm.c:2544)
>     by 0x92F28F: cap_large_decr_cpu_apply (spapr_caps.c:523)
>     by 0x930C37: spapr_caps_cpu_apply (spapr_caps.c:921)
>     by 0x955D3B: spapr_reset_vcpu (spapr_cpu_core.c:73)
> (...)
>   Uninitialised value was created by a stack allocation
>     at 0xB01150: kvmppc_enable_cap_large_decr (kvm.c:2538)
>=20
> In this case, the alleged unintialized value is the 'lpcr' variable that
> is written by kvm_get_one_reg() and then used in an if clause:
>=20
> int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
> {
>     CPUState *cs =3D CPU(cpu);
>     uint64_t lpcr;
>=20
>     kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
>     /* Do we need to modify the LPCR? */
>     if (!!(lpcr & LPCR_LD) !=3D !!enable) { <---- Valgrind warns here
> (...)
>=20
> A quick fix is to init the variable that kvm_get_one_reg() is going to
> write ('lpcr' in the example above). Another idea is to convince
> Valgrind that kvm_get_one_reg() inits the 'void *target' memory in case
> the ioctl() is successful. This will put some boilerplate in the
> function but it will bring benefit for its other callers.
>=20
> This patch uses the memcheck VALGRING_MAKE_MEM_DEFINED() to mark the
> 'target' variable as initialized if the ioctl is successful.
>=20
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  accel/kvm/kvm-all.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 5f1377ca04..d9acba23c7 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -53,6 +53,10 @@
>  #include <sys/eventfd.h>
>  #endif
> =20
> +#ifdef CONFIG_VALGRIND_H
> +#include <valgrind/memcheck.h>
> +#endif
> +
>  /* KVM uses PAGE_SIZE in its definition of KVM_COALESCED_MMIO_MAX. We
>   * need to use the real host PAGE_SIZE, as that's what KVM will use.
>   */
> @@ -3504,6 +3508,19 @@ int kvm_get_one_reg(CPUState *cs, uint64_t id, voi=
d *target)
>      if (r) {
>          trace_kvm_failed_reg_get(id, strerror(-r));
>      }
> +
> +#ifdef CONFIG_VALGRIND_H
> +    if (r =3D=3D 0) {
> +        switch (id & KVM_REG_SIZE_MASK) {
> +        case KVM_REG_SIZE_U32:
> +            VALGRIND_MAKE_MEM_DEFINED(target, sizeof(uint32_t));
> +            break;
> +        case KVM_REG_SIZE_U64:
> +            VALGRIND_MAKE_MEM_DEFINED(target, sizeof(uint64_t));
> +            break;
> +        }
> +    }
> +#endif
>      return r;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6jDmyqtNAkEQ87fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJM8NMACgkQgypY4gEw
YSLfVw//TluxVS2nc8jmFKHU3CBBLyD6uE7Hb58FKUvLieTn4KGHtCTe5Wkbwxcf
VFzMjvIguEANv36NlUra5kiErCEfgun0a2aQkB3sQ2PTiKNw1Pb+8sJCMBNi3yiN
bVYbXe6JfTCxs1NZvnTMWlvvPtCD8ILh0AwOTSa/hvq9c6cD2Pods/9USD4o7GmI
QzFTZ+e3ouDYMpUB0c+dUGmBtthpuiWvBZomiIpJlO33JLhVaE8MlV9GK0ywFag4
nV1JVsWbdDOUD5tfkn7hrO26LrQTtzYHCObzBSxY3whg8yflNVfQ+PvIZ6yBIjWa
b7K1xu5QC0ec4kpobpws6iV0k3Q//RXBLVSTFTQRuvMbnX6fct4Pe2plL83vy+Lj
LqeltUtUgWw65EnERVEIb4t/izT0Z4Yfc0I80UPoQwga3+RpDaydk8VU8eaXgync
guITSjz1ytgg/l2RjXKckRPTcVB1tdZeGjQCEncghZ7emXi9V0xURXYcszinkIR0
09EMtp2LgqWdECdXKQLTwH4alZnhbJGbOqWpnftp/YJGotvFEeFfyBT81oClUWRF
MKNFyOceKhi+v132zvjDdXLabMEOE/Qt2tRMhiTSzx5dybI9lq0BF0Z+tR7W78Zj
GnjGyU0idJ3i3u0KwE8kNAUO2nEF8n29peiLWWiku17tLhGggU0=
=2xYR
-----END PGP SIGNATURE-----

--6jDmyqtNAkEQ87fx--

