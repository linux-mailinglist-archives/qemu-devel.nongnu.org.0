Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12D438DFF6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:52:48 +0200 (CEST)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll1e3-00072b-Mg
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yx-0006SX-R8; Sun, 23 May 2021 23:47:31 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yv-0003Dh-BV; Sun, 23 May 2021 23:47:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpNSl4B2tz9sW6; Mon, 24 May 2021 13:47:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621828039;
 bh=ijPbIh/qZIdyt+nGzUveQQQbTnVLiw1aaOsrS02Or4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oSas625HFO72fUimJ9aC5lqtkUXb+XoGSwh59B4GKQe4Mq1ZMjTy3gXBXWQveILG8
 AXeFRS68RYyz4uaPDvCB1vOich7vbpM+k90lGA08gXNw506vwihdVYUIt4C1ZG87iO
 5CO6rx5nhF7+Jz0yjLXbpGGvlt1TKpyqfzjue5rQ=
Date: Mon, 24 May 2021 13:28:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 16/24] target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
Message-ID: <YKsdQ4IKyLJpGi4Y@yekko>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-17-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="af4UE4dE/AR8nqjD"
Content-Disposition: inline
In-Reply-To: <20210518201146.794854-17-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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


--af4UE4dE/AR8nqjD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 03:11:38PM -0500, Richard Henderson wrote:
> Instead, use a switch on env->mmu_model.  This avoids some
> replicated information in cpu setup.

I have mixed feelings about this, since I introduced
pcc->handle_mmu_fault specifically to get rid of the nasty
mega-switch, with the hope of eventually getting rid of env->mmu_model
entirely.

But.. it does simplify your patch series, which makes a good change
overall.

>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/cpu-qom.h    |  1 -
>  target/ppc/cpu_init.c   | 45 -----------------------------------------
>  target/ppc/mmu_helper.c | 24 ++++++++++++++++++----
>  3 files changed, 20 insertions(+), 50 deletions(-)
>=20
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 06b6571bc9..3b14d2f134 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -198,7 +198,6 @@ struct PowerPCCPUClass {
>      int n_host_threads;
>      void (*init_proc)(CPUPPCState *env);
>      int  (*check_pow)(CPUPPCState *env);
> -    int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int m=
mu_idx);
>      bool (*interrupts_big_endian)(PowerPCCPU *cpu);
>  };
> =20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index d0fa219880..d33aded7cf 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -4580,9 +4580,6 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
>                      (1ull << MSR_IR) |
>                      (1ull << MSR_DR);
>      pcc->mmu_model =3D POWERPC_MMU_601;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_601;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_601;
> @@ -4625,9 +4622,6 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
>                      (1ull << MSR_IR) |
>                      (1ull << MSR_DR);
>      pcc->mmu_model =3D POWERPC_MMU_601;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_601;
>      pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG=
_HID0_LE;
> @@ -4891,9 +4885,6 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_604;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_604;
> @@ -4975,9 +4966,6 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_604;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_604;
> @@ -5046,9 +5034,6 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5126,9 +5111,6 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5329,9 +5311,6 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5412,9 +5391,6 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5500,9 +5476,6 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5588,9 +5561,6 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5830,9 +5800,6 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_74xx;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_7400;
> @@ -5916,9 +5883,6 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_74xx;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_7400;
> @@ -6745,9 +6709,6 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_74xx;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_7400;
> @@ -7507,7 +7468,6 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI);
>      pcc->mmu_model =3D POWERPC_MMU_64B;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash64_handle_mmu_fault;
>      pcc->hash64_opts =3D &ppc_hash64_opts_basic;
>  #endif
>      pcc->excp_model =3D POWERPC_EXCP_970;
> @@ -7585,7 +7545,6 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
>          LPCR_RMI | LPCR_HDICE;
>      pcc->mmu_model =3D POWERPC_MMU_2_03;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash64_handle_mmu_fault;
>      pcc->hash64_opts =3D &ppc_hash64_opts_basic;
>      pcc->lrg_decr_bits =3D 32;
>  #endif
> @@ -7729,7 +7688,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>      pcc->lpcr_pm =3D LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
>      pcc->mmu_model =3D POWERPC_MMU_2_06;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash64_handle_mmu_fault;
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->lrg_decr_bits =3D 32;
>  #endif
> @@ -7906,7 +7864,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>                     LPCR_P8_PECE3 | LPCR_P8_PECE4;
>      pcc->mmu_model =3D POWERPC_MMU_2_07;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash64_handle_mmu_fault;
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->lrg_decr_bits =3D 32;
>      pcc->n_host_threads =3D 8;
> @@ -8122,7 +8079,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>      pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
>      pcc->mmu_model =3D POWERPC_MMU_3_00;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc64_v3_handle_mmu_fault;
>      /* segment page size remain the same */
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->radix_page_info =3D &POWER9_radix_page_info;
> @@ -8334,7 +8290,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>      pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
>      pcc->mmu_model =3D POWERPC_MMU_3_00;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc64_v3_handle_mmu_fault;
>      /* segment page size remain the same */
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->radix_page_info =3D &POWER10_radix_page_info;
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index ef634fcb33..863e556a22 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2963,14 +2963,30 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, i=
nt size,
>                        bool probe, uintptr_t retaddr)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cs);
>      CPUPPCState *env =3D &cpu->env;
>      int ret;
> =20
> -    if (pcc->handle_mmu_fault) {
> -        ret =3D pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> -    } else {
> +    switch (env->mmu_model) {
> +#if defined(TARGET_PPC64)
> +    case POWERPC_MMU_64B:
> +    case POWERPC_MMU_2_03:
> +    case POWERPC_MMU_2_06:
> +    case POWERPC_MMU_2_07:
> +        ret =3D ppc_hash64_handle_mmu_fault(cpu, addr, access_type, mmu_=
idx);
> +        break;
> +    case POWERPC_MMU_3_00:
> +        ret =3D ppc64_v3_handle_mmu_fault(cpu, addr, access_type, mmu_id=
x);
> +        break;
> +#endif
> +
> +    case POWERPC_MMU_32B:
> +    case POWERPC_MMU_601:
> +        ret =3D ppc_hash32_handle_mmu_fault(cpu, addr, access_type, mmu_=
idx);
> +        break;
> +
> +    default:
>          ret =3D cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx=
);
> +        break;
>      }
>      if (unlikely(ret !=3D 0)) {
>          if (probe) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--af4UE4dE/AR8nqjD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrHUMACgkQbDjKyiDZ
s5JCRBAAjUHXiejrwB3zfbb757a+7tkl+qCstO27hCUucW7jqE+hhsD+xE/7aDQ1
Q+ePBJCAw3J4xGF3P1hKr7O1pFsZ3e2BFj7wH6soTEYASu+b0l/1/tdHmPXoocAj
66Cz/9nsPjM0ytFNJGJXnanHiHyYcWLS0Yik/QeeRU13kFU+5DMyp2E0ZVldtM5M
mMNhf65qvPMaWFE+f0pJ9WmgPQAeoSgamiWqN9vcTeF8V5ZAkoDz8K1BwkRvQk9s
UZm01FRC+7mLugLDonAdXf11Xoc5wVneI57Awx0RH0UwDm+ajdh9VcTUDWY5tRYr
i+Znd4BCAtf+1Fj3VxhUm/VEMjI7TMTw3hXniWI8ON6nsxfOLpQ01Tvnxvi6p0OD
/hxKZL6lK1YMXaAQ0pq994mdnlfEAR2Iw6Bc5Rb4KP3xQhvo4IMqhxl10hliHfRq
8be72R6VzLb0zLuXpPIAvpJm56zR2HWIWhfHBvWqavQz5dMmtrvHei42uIkmvbxI
n0kHxRKX+aJ7tD3mrCDjobdbut2pQB1f35FIJDF1CsRfUcpwvStZfgegT5M7bF3u
JVaXlmd1J+305rGfRbDmnfzYnVT6M043rxFEepsgZ9S0XOyY/D0lmx5VBOb+g+Cb
ygz7iepb8wis9ET9QWMm9U7f67m2fNjtqU8TiBXUWNNNftGu+r0=
=wpxt
-----END PGP SIGNATURE-----

--af4UE4dE/AR8nqjD--

