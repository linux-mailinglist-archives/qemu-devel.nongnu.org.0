Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84050388F64
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:43:41 +0200 (CEST)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMU8-0000z9-GP
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljLqD-0002uo-S0; Wed, 19 May 2021 09:02:25 -0400
Received: from [201.28.113.2] (port=49845 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljLq9-0006sB-2W; Wed, 19 May 2021 09:02:24 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 19 May 2021 10:02:16 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 3407E80139F;
 Wed, 19 May 2021 10:02:16 -0300 (-03)
Subject: Re: [PATCH 16/24] target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-17-richard.henderson@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <777cbabc-f36b-91c6-f474-f4bb7c5b5955@eldorado.org.br>
Date: Wed, 19 May 2021 10:02:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518201146.794854-17-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------B6F5663B03DA6AF5AE33D5B3"
Content-Language: en-US
X-OriginalArrivalTime: 19 May 2021 13:02:16.0457 (UTC)
 FILETIME=[3185F790:01D74CAF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B6F5663B03DA6AF5AE33D5B3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/05/2021 17:11, Richard Henderson wrote:
> Instead, use a switch on env->mmu_model.  This avoids some
> replicated information in cpu setup.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>

> ---
>   target/ppc/cpu-qom.h    |  1 -
>   target/ppc/cpu_init.c   | 45 -----------------------------------------
>   target/ppc/mmu_helper.c | 24 ++++++++++++++++++----
>   3 files changed, 20 insertions(+), 50 deletions(-)
>
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 06b6571bc9..3b14d2f134 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -198,7 +198,6 @@ struct PowerPCCPUClass {
>       int n_host_threads;
>       void (*init_proc)(CPUPPCState *env);
>       int  (*check_pow)(CPUPPCState *env);
> -    int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int mmu_idx);
>       bool (*interrupts_big_endian)(PowerPCCPU *cpu);
>   };
>   
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index d0fa219880..d33aded7cf 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -4580,9 +4580,6 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
>                       (1ull << MSR_IR) |
>                       (1ull << MSR_DR);
>       pcc->mmu_model = POWERPC_MMU_601;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_601;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_601;
> @@ -4625,9 +4622,6 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
>                       (1ull << MSR_IR) |
>                       (1ull << MSR_DR);
>       pcc->mmu_model = POWERPC_MMU_601;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_601;
>       pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
> @@ -4891,9 +4885,6 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_604;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_604;
> @@ -4975,9 +4966,6 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_604;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_604;
> @@ -5046,9 +5034,6 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_7x0;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_750;
> @@ -5126,9 +5111,6 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_7x0;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_750;
> @@ -5329,9 +5311,6 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_7x0;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_750;
> @@ -5412,9 +5391,6 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_7x0;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_750;
> @@ -5500,9 +5476,6 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_7x0;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_750;
> @@ -5588,9 +5561,6 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_7x0;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_750;
> @@ -5830,9 +5800,6 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_74xx;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_7400;
> @@ -5916,9 +5883,6 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_74xx;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_7400;
> @@ -6745,9 +6709,6 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
>       pcc->mmu_model = POWERPC_MMU_32B;
> -#if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
> -#endif
>       pcc->excp_model = POWERPC_EXCP_74xx;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_7400;
> @@ -7507,7 +7468,6 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
>                       (1ull << MSR_RI);
>       pcc->mmu_model = POWERPC_MMU_64B;
>   #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
>       pcc->hash64_opts = &ppc_hash64_opts_basic;
>   #endif
>       pcc->excp_model = POWERPC_EXCP_970;
> @@ -7585,7 +7545,6 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
>           LPCR_RMI | LPCR_HDICE;
>       pcc->mmu_model = POWERPC_MMU_2_03;
>   #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
>       pcc->hash64_opts = &ppc_hash64_opts_basic;
>       pcc->lrg_decr_bits = 32;
>   #endif
> @@ -7729,7 +7688,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>       pcc->lpcr_pm = LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
>       pcc->mmu_model = POWERPC_MMU_2_06;
>   #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
>       pcc->hash64_opts = &ppc_hash64_opts_POWER7;
>       pcc->lrg_decr_bits = 32;
>   #endif
> @@ -7906,7 +7864,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>                      LPCR_P8_PECE3 | LPCR_P8_PECE4;
>       pcc->mmu_model = POWERPC_MMU_2_07;
>   #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
>       pcc->hash64_opts = &ppc_hash64_opts_POWER7;
>       pcc->lrg_decr_bits = 32;
>       pcc->n_host_threads = 8;
> @@ -8122,7 +8079,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>       pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
>       pcc->mmu_model = POWERPC_MMU_3_00;
>   #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc64_v3_handle_mmu_fault;
>       /* segment page size remain the same */
>       pcc->hash64_opts = &ppc_hash64_opts_POWER7;
>       pcc->radix_page_info = &POWER9_radix_page_info;
> @@ -8334,7 +8290,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>       pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
>       pcc->mmu_model = POWERPC_MMU_3_00;
>   #if defined(CONFIG_SOFTMMU)
> -    pcc->handle_mmu_fault = ppc64_v3_handle_mmu_fault;
>       /* segment page size remain the same */
>       pcc->hash64_opts = &ppc_hash64_opts_POWER7;
>       pcc->radix_page_info = &POWER10_radix_page_info;
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index ef634fcb33..863e556a22 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2963,14 +2963,30 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>                         bool probe, uintptr_t retaddr)
>   {
>       PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
>       CPUPPCState *env = &cpu->env;
>       int ret;
>   
> -    if (pcc->handle_mmu_fault) {
> -        ret = pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> -    } else {
> +    switch (env->mmu_model) {
> +#if defined(TARGET_PPC64)
> +    case POWERPC_MMU_64B:
> +    case POWERPC_MMU_2_03:
> +    case POWERPC_MMU_2_06:
> +    case POWERPC_MMU_2_07:
> +        ret = ppc_hash64_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> +        break;
> +    case POWERPC_MMU_3_00:
> +        ret = ppc64_v3_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> +        break;
> +#endif
> +
> +    case POWERPC_MMU_32B:
> +    case POWERPC_MMU_601:
> +        ret = ppc_hash32_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
> +        break;
> +
> +    default:
>           ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
> +        break;
>       }
>       if (unlikely(ret != 0)) {
>           if (probe) {
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------B6F5663B03DA6AF5AE33D5B3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18/05/2021 17:11, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-17-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">Instead, use a switch on env-&gt;mmu_model.  This avoids some
replicated information in cpu setup.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a></pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-17-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
---
 target/ppc/cpu-qom.h    |  1 -
 target/ppc/cpu_init.c   | 45 -----------------------------------------
 target/ppc/mmu_helper.c | 24 ++++++++++++++++++----
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 06b6571bc9..3b14d2f134 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -198,7 +198,6 @@ struct PowerPCCPUClass {
     int n_host_threads;
     void (*init_proc)(CPUPPCState *env);
     int  (*check_pow)(CPUPPCState *env);
-    int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int mmu_idx);
     bool (*interrupts_big_endian)(PowerPCCPU *cpu);
 };
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d0fa219880..d33aded7cf 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4580,9 +4580,6 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_IR) |
                     (1ull &lt;&lt; MSR_DR);
     pcc-&gt;mmu_model = POWERPC_MMU_601;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_601;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_601;
@@ -4625,9 +4622,6 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_IR) |
                     (1ull &lt;&lt; MSR_DR);
     pcc-&gt;mmu_model = POWERPC_MMU_601;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_601;
     pcc-&gt;flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
@@ -4891,9 +4885,6 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_604;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_604;
@@ -4975,9 +4966,6 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_604;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_604;
@@ -5046,9 +5034,6 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_7x0;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_750;
@@ -5126,9 +5111,6 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_7x0;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_750;
@@ -5329,9 +5311,6 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_7x0;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_750;
@@ -5412,9 +5391,6 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_7x0;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_750;
@@ -5500,9 +5476,6 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_7x0;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_750;
@@ -5588,9 +5561,6 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_7x0;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_750;
@@ -5830,9 +5800,6 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_74xx;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_7400;
@@ -5916,9 +5883,6 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_74xx;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_7400;
@@ -6745,9 +6709,6 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI) |
                     (1ull &lt;&lt; MSR_LE);
     pcc-&gt;mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc-&gt;excp_model = POWERPC_EXCP_74xx;
     pcc-&gt;bus_model = PPC_FLAGS_INPUT_6xx;
     pcc-&gt;bfd_mach = bfd_mach_ppc_7400;
@@ -7507,7 +7468,6 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
                     (1ull &lt;&lt; MSR_RI);
     pcc-&gt;mmu_model = POWERPC_MMU_64B;
 #if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc-&gt;hash64_opts = &amp;ppc_hash64_opts_basic;
 #endif
     pcc-&gt;excp_model = POWERPC_EXCP_970;
@@ -7585,7 +7545,6 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
         LPCR_RMI | LPCR_HDICE;
     pcc-&gt;mmu_model = POWERPC_MMU_2_03;
 #if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc-&gt;hash64_opts = &amp;ppc_hash64_opts_basic;
     pcc-&gt;lrg_decr_bits = 32;
 #endif
@@ -7729,7 +7688,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc-&gt;lpcr_pm = LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
     pcc-&gt;mmu_model = POWERPC_MMU_2_06;
 #if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc-&gt;hash64_opts = &amp;ppc_hash64_opts_POWER7;
     pcc-&gt;lrg_decr_bits = 32;
 #endif
@@ -7906,7 +7864,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                    LPCR_P8_PECE3 | LPCR_P8_PECE4;
     pcc-&gt;mmu_model = POWERPC_MMU_2_07;
 #if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc-&gt;hash64_opts = &amp;ppc_hash64_opts_POWER7;
     pcc-&gt;lrg_decr_bits = 32;
     pcc-&gt;n_host_threads = 8;
@@ -8122,7 +8079,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc-&gt;lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc-&gt;mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc64_v3_handle_mmu_fault;
     /* segment page size remain the same */
     pcc-&gt;hash64_opts = &amp;ppc_hash64_opts_POWER7;
     pcc-&gt;radix_page_info = &amp;POWER9_radix_page_info;
@@ -8334,7 +8290,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
     pcc-&gt;lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc-&gt;mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
-    pcc-&gt;handle_mmu_fault = ppc64_v3_handle_mmu_fault;
     /* segment page size remain the same */
     pcc-&gt;hash64_opts = &amp;ppc_hash64_opts_POWER7;
     pcc-&gt;radix_page_info = &amp;POWER10_radix_page_info;
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index ef634fcb33..863e556a22 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2963,14 +2963,30 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                       bool probe, uintptr_t retaddr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
     CPUPPCState *env = &amp;cpu-&gt;env;
     int ret;
 
-    if (pcc-&gt;handle_mmu_fault) {
-        ret = pcc-&gt;handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-    } else {
+    switch (env-&gt;mmu_model) {
+#if defined(TARGET_PPC64)
+    case POWERPC_MMU_64B:
+    case POWERPC_MMU_2_03:
+    case POWERPC_MMU_2_06:
+    case POWERPC_MMU_2_07:
+        ret = ppc_hash64_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
+        break;
+    case POWERPC_MMU_3_00:
+        ret = ppc64_v3_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
+        break;
+#endif
+
+    case POWERPC_MMU_32B:
+    case POWERPC_MMU_601:
+        ret = ppc_hash32_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
+        break;
+
+    default:
         ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
+        break;
     }
     if (unlikely(ret != 0)) {
         if (probe) {
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------B6F5663B03DA6AF5AE33D5B3--

