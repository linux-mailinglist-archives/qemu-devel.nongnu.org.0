Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8903B01CB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:51:53 +0200 (CEST)
Received: from localhost ([::1]:32844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lve0W-0007xU-Hw
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvdys-00070T-5x
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:50:10 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:40782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvdyq-00011l-5e
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:50:09 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-MW9fFL0HPOag8i6Pkx-MFQ-1; Tue, 22 Jun 2021 06:50:03 -0400
X-MC-Unique: MW9fFL0HPOag8i6Pkx-MFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38E88801B0A;
 Tue, 22 Jun 2021 10:50:01 +0000 (UTC)
Received: from bahia.lan (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7327310013D6;
 Tue, 22 Jun 2021 10:49:58 +0000 (UTC)
Date: Tue, 22 Jun 2021 12:49:57 +0200
From: Greg Kurz <groug@kaod.org>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 01/10] target/ppc: Remove
 PowerPCCPUClass.handle_mmu_fault
Message-ID: <20210622124957.4ae3a670@bahia.lan>
In-Reply-To: <20210621125115.67717-2-bruno.larsen@eldorado.org.br>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
 <20210621125115.67717-2-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Jun 2021 09:51:06 -0300
"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:

> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Instead, use a switch on env->mmu_model.  This avoids some
> replicated information in cpu setup.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Very nice !

Reviewed-by: Greg Kurz <groug@kaod.org>

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
> index d0411e7302..3a8d8d3f07 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -4578,9 +4578,6 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
>                      (1ull << MSR_IR) |
>                      (1ull << MSR_DR);
>      pcc->mmu_model =3D POWERPC_MMU_601;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_601;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_601;
> @@ -4623,9 +4620,6 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
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
> @@ -4889,9 +4883,6 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_604;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_604;
> @@ -4973,9 +4964,6 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_604;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_604;
> @@ -5044,9 +5032,6 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5124,9 +5109,6 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5327,9 +5309,6 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5410,9 +5389,6 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5498,9 +5474,6 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5586,9 +5559,6 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_7x0;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_750;
> @@ -5828,9 +5798,6 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_74xx;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_7400;
> @@ -5914,9 +5881,6 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_74xx;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_7400;
> @@ -6743,9 +6707,6 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI) |
>                      (1ull << MSR_LE);
>      pcc->mmu_model =3D POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash32_handle_mmu_fault;
> -#endif
>      pcc->excp_model =3D POWERPC_EXCP_74xx;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
>      pcc->bfd_mach =3D bfd_mach_ppc_7400;
> @@ -7505,7 +7466,6 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
>                      (1ull << MSR_RI);
>      pcc->mmu_model =3D POWERPC_MMU_64B;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash64_handle_mmu_fault;
>      pcc->hash64_opts =3D &ppc_hash64_opts_basic;
>  #endif
>      pcc->excp_model =3D POWERPC_EXCP_970;
> @@ -7583,7 +7543,6 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data=
)
>          LPCR_RMI | LPCR_HDICE;
>      pcc->mmu_model =3D POWERPC_MMU_2_03;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash64_handle_mmu_fault;
>      pcc->hash64_opts =3D &ppc_hash64_opts_basic;
>      pcc->lrg_decr_bits =3D 32;
>  #endif
> @@ -7727,7 +7686,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>      pcc->lpcr_pm =3D LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
>      pcc->mmu_model =3D POWERPC_MMU_2_06;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash64_handle_mmu_fault;
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->lrg_decr_bits =3D 32;
>  #endif
> @@ -7904,7 +7862,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>                     LPCR_P8_PECE3 | LPCR_P8_PECE4;
>      pcc->mmu_model =3D POWERPC_MMU_2_07;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc_hash64_handle_mmu_fault;
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->lrg_decr_bits =3D 32;
>      pcc->n_host_threads =3D 8;
> @@ -8120,7 +8077,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>      pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
>      pcc->mmu_model =3D POWERPC_MMU_3_00;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc64_v3_handle_mmu_fault;
>      /* segment page size remain the same */
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->radix_page_info =3D &POWER9_radix_page_info;
> @@ -8332,7 +8288,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data=
)
>      pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
>      pcc->mmu_model =3D POWERPC_MMU_3_00;
>  #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault =3D ppc64_v3_handle_mmu_fault;
>      /* segment page size remain the same */
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->radix_page_info =3D &POWER10_radix_page_info;
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 1ecb36e85a..c4b1c93e47 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2947,14 +2947,30 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, i=
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


