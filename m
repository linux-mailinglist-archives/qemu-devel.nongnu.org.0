Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791263A837F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:01:10 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAYu-0004KS-Uq
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ltAVg-0002cX-4R; Tue, 15 Jun 2021 10:57:48 -0400
Received: from [201.28.113.2] (port=41772 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ltAVc-0002FB-Os; Tue, 15 Jun 2021 10:57:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 15 Jun 2021 11:57:40 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 5A88D800144;
 Tue, 15 Jun 2021 11:57:40 -0300 (-03)
Subject: Re: [PATCH v2 1/2] target/ppc: fix address translation bug for radix
 mmus
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <8805c9ed-8ca1-540a-5fcb-81f146c76afb@kaod.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <87ab59ec-012c-a708-869f-e4bd9b822f10@eldorado.org.br>
Date: Tue, 15 Jun 2021 11:57:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8805c9ed-8ca1-540a-5fcb-81f146c76afb@kaod.org>
Content-Type: multipart/alternative;
 boundary="------------1A33AE745E335ECEFA683532"
Content-Language: en-US
X-OriginalArrivalTime: 15 Jun 2021 14:57:40.0780 (UTC)
 FILETIME=[C9E50EC0:01D761F6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.095, PDS_HP_HELO_NORDNS=0.308, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------1A33AE745E335ECEFA683532
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15/06/2021 10:57, Cédric Le Goater wrote:
> On 6/14/21 9:16 PM, Bruno Larsen (billionai) wrote:
>> Based-on: <20210518201146.794854-1-richard.henderson@linaro.org>
>>
>> This commit attempts to fix the first bug mentioned by Richard Henderson in
>> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html
>>
>> To sumarize the bug here, when radix-style mmus are translating an
>> address, they might need to call a second level of translation, with
>> hypvervisor priviledges. However, the way it was being done up until
>> this point meant that the second level translation had the same
>> priviledges as the first level. This would only happen when a TCG guest
>> was emulating KVM, which is why it hasn't been discovered yet.
> What do you mean ? The QEMU PowerNV machine emulates baremetal and
> can run KVM pseries guests.

Is the PowerNV using radix? The bug only happens when guest1 (the 
emulated PowerNV, not it's guest), and if so, we might need to 
reevaluate if the bug actually happens, or if it's just a theoretical 
hiccup. And also change the commit message.

Either way, if my explanation is a bit confusing, there are more details 
on the link. I sort of just implemented the solutions suggested in that 
e-mail chain.

>
> It has some issues under load but not related to memory translation.
> This patch is certainly improving the model and it is worth testing
> but this version does not apply on ppc-6.1.
Ah, yes, it is based on a patch series made by Richard Henderson a few 
weeks ago. Since we need that patch to be accepted to finally support 
disable-tcg and I don't want to delay that by adding a change that might 
change a lot of his remaining patches.
>
> Thanks,
>
> C.
>
>
>> This patch attempts to correct that by making radix64_*_xlate functions
>> receive the mmu_idx, and passing one with the correct permission for the
>> second level translation.
>>
>> The mmuidx macros added by this patch are only correct for non-bookE
>> mmus, because BookE style set the IS and DS bits inverted and there
>> might be other subtle differences. However, there doesn't seem to be
>> BookE cpus that have radix-style mmus, so we left a comment there to
>> document the issue, in case a machine does have that and was missed.
>>
>> As part of this cleanup, we now need to send the correct mmmu_idx
>> when calling get_phys_page_debug, otherwise we might not be able to see the
>> memory that the CPU could
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/internal.h    | 12 ++++++++++++
>>   target/ppc/mmu-radix64.c | 38 ++++++++++++++++++++++----------------
>>   target/ppc/mmu-radix64.h |  2 +-
>>   target/ppc/mmu_helper.c  |  8 +++++---
>>   4 files changed, 40 insertions(+), 20 deletions(-)
>>
>> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
>> index f1fd3c8d04..003df7e8a9 100644
>> --- a/target/ppc/internal.h
>> +++ b/target/ppc/internal.h
>> @@ -245,4 +245,16 @@ static inline int prot_for_access_type(MMUAccessType access_type)
>>       g_assert_not_reached();
>>   }
>>   
>> +/*
>> + * These correspond to the mmu_idx values computed in
>> + * hreg_compute_hflags_value. See the tables therein
>> + */
>> +static inline bool mmuidx_pr(int idx) { return !(idx & 1); }
>> +/*
>> + * If we want to use these macros for hash-style MMUs, we need to
>> + * add an if or another macro here.
>> + */
>> +static inline bool mmuidx_real(int idx) { return idx & 2; }
>> +static inline bool mmuidx_hv(int idx) { return idx & 4; }
>> +
>>   #endif /* PPC_INTERNAL_H */
>> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
>> index cbd404bfa4..0ae8f6b572 100644
>> --- a/target/ppc/mmu-radix64.c
>> +++ b/target/ppc/mmu-radix64.c
>> @@ -155,7 +155,7 @@ static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, MMUAccessType access_type,
>>   
>>   static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
>>                                      uint64_t pte, int *fault_cause, int *prot,
>> -                                   bool partition_scoped)
>> +                                   int mmu_idx, bool partition_scoped)
>>   {
>>       CPUPPCState *env = &cpu->env;
>>       int need_prot;
>> @@ -173,7 +173,8 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
>>       /* Determine permissions allowed by Encoded Access Authority */
>>       if (!partition_scoped && (pte & R_PTE_EAA_PRIV) && msr_pr) {
>>           *prot = 0;
>> -    } else if (msr_pr || (pte & R_PTE_EAA_PRIV) || partition_scoped) {
>> +    } else if (mmuidx_pr(mmu_idx) || (pte & R_PTE_EAA_PRIV) ||
>> +               partition_scoped) {
>>           *prot = ppc_radix64_get_prot_eaa(pte);
>>       } else { /* !msr_pr && !(pte & R_PTE_EAA_PRIV) && !partition_scoped */
>>           *prot = ppc_radix64_get_prot_eaa(pte);
>> @@ -299,7 +300,7 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
>>                                                 ppc_v3_pate_t pate,
>>                                                 hwaddr *h_raddr, int *h_prot,
>>                                                 int *h_page_size, bool pde_addr,
>> -                                              bool guest_visible)
>> +                                              int mmu_idx, bool guest_visible)
>>   {
>>       int fault_cause = 0;
>>       hwaddr pte_addr;
>> @@ -310,7 +311,9 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
>>       if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_RPDB,
>>                                 pate.dw0 & PRTBE_R_RPDS, h_raddr, h_page_size,
>>                                 &pte, &fault_cause, &pte_addr) ||
>> -        ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, h_prot, true)) {
>> +        ppc_radix64_check_prot(cpu, access_type, pte,
>> +                               &fault_cause, h_prot, mmu_idx, true)
>> +        ) {
>>           if (pde_addr) { /* address being translated was that of a guest pde */
>>               fault_cause |= DSISR_PRTABLE_FAULT;
>>           }
>> @@ -332,7 +335,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>>                                               vaddr eaddr, uint64_t pid,
>>                                               ppc_v3_pate_t pate, hwaddr *g_raddr,
>>                                               int *g_prot, int *g_page_size,
>> -                                            bool guest_visible)
>> +                                            int mmu_idx, bool guest_visible)
>>   {
>>       CPUState *cs = CPU(cpu);
>>       CPUPPCState *env = &cpu->env;
>> @@ -367,7 +370,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>>           ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, prtbe_addr,
>>                                                    pate, &h_raddr, &h_prot,
>>                                                    &h_page_size, true,
>> -                                                 guest_visible);
>> +            /* mmu_idx is 5 because we're translating from hypervisor scope */
>> +                                                 5, guest_visible);
>>           if (ret) {
>>               return ret;
>>           }
>> @@ -407,7 +411,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>>               ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, pte_addr,
>>                                                        pate, &h_raddr, &h_prot,
>>                                                        &h_page_size, true,
>> -                                                     guest_visible);
>> +            /* mmu_idx is 5 because we're translating from hypervisor scope */
>> +                                                     5, guest_visible);
>>               if (ret) {
>>                   return ret;
>>               }
>> @@ -431,7 +436,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>>           *g_raddr = (rpn & ~mask) | (eaddr & mask);
>>       }
>>   
>> -    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, g_prot, false)) {
>> +    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause,
>> +                               g_prot, mmu_idx, false)) {
>>           /* Access denied due to protection */
>>           if (guest_visible) {
>>               ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
>> @@ -464,7 +470,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>>    *              +-------------+----------------+---------------+
>>    */
>>   bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
>> -                       hwaddr *raddr, int *psizep, int *protp,
>> +                       hwaddr *raddr, int *psizep, int *protp, int mmu_idx,
>>                          bool guest_visible)
>>   {
>>       CPUPPCState *env = &cpu->env;
>> @@ -474,17 +480,17 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
>>       hwaddr g_raddr;
>>       bool relocation;
>>   
>> -    assert(!(msr_hv && cpu->vhyp));
>> +    assert(!(mmuidx_hv(mmu_idx) && cpu->vhyp));
>>   
>> -    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
>> +    relocation = !mmuidx_real(mmu_idx);
>>   
>>       /* HV or virtual hypervisor Real Mode Access */
>> -    if (!relocation && (msr_hv || cpu->vhyp)) {
>> +    if (!relocation && (mmuidx_hv(mmu_idx) || cpu->vhyp)) {
>>           /* In real mode top 4 effective addr bits (mostly) ignored */
>>           *raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
>>   
>>           /* In HV mode, add HRMOR if top EA bit is clear */
>> -        if (msr_hv || !env->has_hv_mode) {
>> +        if (mmuidx_hv(mmu_idx) || !env->has_hv_mode) {
>>               if (!(eaddr >> 63)) {
>>                   *raddr |= env->spr[SPR_HRMOR];
>>              }
>> @@ -546,7 +552,7 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
>>       if (relocation) {
>>           int ret = ppc_radix64_process_scoped_xlate(cpu, access_type, eaddr, pid,
>>                                                      pate, &g_raddr, &prot,
>> -                                                   &psize, guest_visible);
>> +                                                   &psize, mmu_idx, guest_visible);
>>           if (ret) {
>>               return false;
>>           }
>> @@ -564,13 +570,13 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
>>            * quadrants 1 or 2. Translates a guest real address to a host
>>            * real address.
>>            */
>> -        if (lpid || !msr_hv) {
>> +        if (lpid || !mmuidx_hv(mmu_idx)) {
>>               int ret;
>>   
>>               ret = ppc_radix64_partition_scoped_xlate(cpu, access_type, eaddr,
>>                                                        g_raddr, pate, raddr,
>>                                                        &prot, &psize, false,
>> -                                                     guest_visible);
>> +                                                     mmu_idx, guest_visible);
>>               if (ret) {
>>                   return false;
>>               }
>> diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
>> index 6b13b89b64..b70357cf34 100644
>> --- a/target/ppc/mmu-radix64.h
>> +++ b/target/ppc/mmu-radix64.h
>> @@ -45,7 +45,7 @@
>>   #ifdef TARGET_PPC64
>>   
>>   bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
>> -                       hwaddr *raddr, int *psizep, int *protp,
>> +                       hwaddr *raddr, int *psizep, int *protp, int mmu_idx,
>>                          bool guest_visible);
>>   
>>   static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
>> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
>> index ba1952c77d..9dcdf88597 100644
>> --- a/target/ppc/mmu_helper.c
>> +++ b/target/ppc/mmu_helper.c
>> @@ -2908,7 +2908,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
>>       case POWERPC_MMU_3_00:
>>           if (ppc64_v3_radix(cpu)) {
>>               return ppc_radix64_xlate(cpu, eaddr, access_type,
>> -                                     raddrp, psizep, protp, guest_visible);
>> +                                     raddrp, psizep, protp, mmu_idx, guest_visible);
>>           }
>>           /* fall through */
>>       case POWERPC_MMU_64B:
>> @@ -2941,8 +2941,10 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>>        * try an MMU_DATA_LOAD, we may not be able to read instructions
>>        * mapped by code TLBs, so we also try a MMU_INST_FETCH.
>>        */
>> -    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
>> -        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) {
>> +    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p,
>> +                  cpu_mmu_index(&cpu->env, false), false) ||
>> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p,
>> +                  cpu_mmu_index(&cpu->env, true), false)) {
>>           return raddr & TARGET_PAGE_MASK;
>>       }
>>       return -1;
>>
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------1A33AE745E335ECEFA683532
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15/06/2021 10:57, Cédric Le Goater
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8805c9ed-8ca1-540a-5fcb-81f146c76afb@kaod.org">
      <pre class="moz-quote-pre" wrap="">On 6/14/21 9:16 PM, Bruno Larsen (billionai) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Based-on: <a class="moz-txt-link-rfc2396E" href="mailto:20210518201146.794854-1-richard.henderson@linaro.org">&lt;20210518201146.794854-1-richard.henderson@linaro.org&gt;</a>

This commit attempts to fix the first bug mentioned by Richard Henderson in
<a class="moz-txt-link-freetext" href="https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html">https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html</a>

To sumarize the bug here, when radix-style mmus are translating an
address, they might need to call a second level of translation, with
hypvervisor priviledges. However, the way it was being done up until
this point meant that the second level translation had the same
priviledges as the first level. This would only happen when a TCG guest
was emulating KVM, which is why it hasn't been discovered yet.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What do you mean ? The QEMU PowerNV machine emulates baremetal and 
can run KVM pseries guests. </pre>
    </blockquote>
    <p>Is the PowerNV using radix? The bug only happens when guest1 (the
      emulated PowerNV, not it's guest), and if so, we might need to
      reevaluate if the bug actually happens, or if it's just a
      theoretical hiccup. And also change the commit message.<br>
    </p>
    <p>Either way, if my explanation is a bit confusing, there are more
      details on the link. I sort of just implemented the solutions
      suggested in that e-mail chain.<br>
    </p>
    <blockquote type="cite"
      cite="mid:8805c9ed-8ca1-540a-5fcb-81f146c76afb@kaod.org">
      <pre class="moz-quote-pre" wrap="">

It has some issues under load but not related to memory translation. 
This patch is certainly improving the model and it is worth testing 
but this version does not apply on ppc-6.1.</pre>
    </blockquote>
    Ah, yes, it is based on a patch series made by Richard Henderson a
    few weeks ago. Since we need that patch to be accepted to finally
    support disable-tcg and I don't want to delay that by adding a
    change that might change a lot of his remaining patches.<br>
    <blockquote type="cite"
      cite="mid:8805c9ed-8ca1-540a-5fcb-81f146c76afb@kaod.org">
      <pre class="moz-quote-pre" wrap="">

Thanks,

C.


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch attempts to correct that by making radix64_*_xlate functions
receive the mmu_idx, and passing one with the correct permission for the
second level translation.

The mmuidx macros added by this patch are only correct for non-bookE
mmus, because BookE style set the IS and DS bits inverted and there
might be other subtle differences. However, there doesn't seem to be
BookE cpus that have radix-style mmus, so we left a comment there to
document the issue, in case a machine does have that and was missed.

As part of this cleanup, we now need to send the correct mmmu_idx
when calling get_phys_page_debug, otherwise we might not be able to see the
memory that the CPU could

Suggested-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 target/ppc/internal.h    | 12 ++++++++++++
 target/ppc/mmu-radix64.c | 38 ++++++++++++++++++++++----------------
 target/ppc/mmu-radix64.h |  2 +-
 target/ppc/mmu_helper.c  |  8 +++++---
 4 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index f1fd3c8d04..003df7e8a9 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -245,4 +245,16 @@ static inline int prot_for_access_type(MMUAccessType access_type)
     g_assert_not_reached();
 }
 
+/*
+ * These correspond to the mmu_idx values computed in
+ * hreg_compute_hflags_value. See the tables therein
+ */
+static inline bool mmuidx_pr(int idx) { return !(idx &amp; 1); }
+/*
+ * If we want to use these macros for hash-style MMUs, we need to
+ * add an if or another macro here.
+ */
+static inline bool mmuidx_real(int idx) { return idx &amp; 2; }
+static inline bool mmuidx_hv(int idx) { return idx &amp; 4; }
+
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index cbd404bfa4..0ae8f6b572 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -155,7 +155,7 @@ static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, MMUAccessType access_type,
 
 static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
                                    uint64_t pte, int *fault_cause, int *prot,
-                                   bool partition_scoped)
+                                   int mmu_idx, bool partition_scoped)
 {
     CPUPPCState *env = &amp;cpu-&gt;env;
     int need_prot;
@@ -173,7 +173,8 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
     /* Determine permissions allowed by Encoded Access Authority */
     if (!partition_scoped &amp;&amp; (pte &amp; R_PTE_EAA_PRIV) &amp;&amp; msr_pr) {
         *prot = 0;
-    } else if (msr_pr || (pte &amp; R_PTE_EAA_PRIV) || partition_scoped) {
+    } else if (mmuidx_pr(mmu_idx) || (pte &amp; R_PTE_EAA_PRIV) ||
+               partition_scoped) {
         *prot = ppc_radix64_get_prot_eaa(pte);
     } else { /* !msr_pr &amp;&amp; !(pte &amp; R_PTE_EAA_PRIV) &amp;&amp; !partition_scoped */
         *prot = ppc_radix64_get_prot_eaa(pte);
@@ -299,7 +300,7 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
                                               ppc_v3_pate_t pate,
                                               hwaddr *h_raddr, int *h_prot,
                                               int *h_page_size, bool pde_addr,
-                                              bool guest_visible)
+                                              int mmu_idx, bool guest_visible)
 {
     int fault_cause = 0;
     hwaddr pte_addr;
@@ -310,7 +311,9 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
     if (ppc_radix64_walk_tree(CPU(cpu)-&gt;as, g_raddr, pate.dw0 &amp; PRTBE_R_RPDB,
                               pate.dw0 &amp; PRTBE_R_RPDS, h_raddr, h_page_size,
                               &amp;pte, &amp;fault_cause, &amp;pte_addr) ||
-        ppc_radix64_check_prot(cpu, access_type, pte, &amp;fault_cause, h_prot, true)) {
+        ppc_radix64_check_prot(cpu, access_type, pte,
+                               &amp;fault_cause, h_prot, mmu_idx, true)
+        ) {
         if (pde_addr) { /* address being translated was that of a guest pde */
             fault_cause |= DSISR_PRTABLE_FAULT;
         }
@@ -332,7 +335,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
                                             vaddr eaddr, uint64_t pid,
                                             ppc_v3_pate_t pate, hwaddr *g_raddr,
                                             int *g_prot, int *g_page_size,
-                                            bool guest_visible)
+                                            int mmu_idx, bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
@@ -367,7 +370,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
         ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, prtbe_addr,
                                                  pate, &amp;h_raddr, &amp;h_prot,
                                                  &amp;h_page_size, true,
-                                                 guest_visible);
+            /* mmu_idx is 5 because we're translating from hypervisor scope */
+                                                 5, guest_visible);
         if (ret) {
             return ret;
         }
@@ -407,7 +411,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
             ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, pte_addr,
                                                      pate, &amp;h_raddr, &amp;h_prot,
                                                      &amp;h_page_size, true,
-                                                     guest_visible);
+            /* mmu_idx is 5 because we're translating from hypervisor scope */
+                                                     5, guest_visible);
             if (ret) {
                 return ret;
             }
@@ -431,7 +436,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
         *g_raddr = (rpn &amp; ~mask) | (eaddr &amp; mask);
     }
 
-    if (ppc_radix64_check_prot(cpu, access_type, pte, &amp;fault_cause, g_prot, false)) {
+    if (ppc_radix64_check_prot(cpu, access_type, pte, &amp;fault_cause,
+                               g_prot, mmu_idx, false)) {
         /* Access denied due to protection */
         if (guest_visible) {
             ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
@@ -464,7 +470,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  *              +-------------+----------------+---------------+
  */
 bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                       hwaddr *raddr, int *psizep, int *protp,
+                       hwaddr *raddr, int *psizep, int *protp, int mmu_idx,
                        bool guest_visible)
 {
     CPUPPCState *env = &amp;cpu-&gt;env;
@@ -474,17 +480,17 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     hwaddr g_raddr;
     bool relocation;
 
-    assert(!(msr_hv &amp;&amp; cpu-&gt;vhyp));
+    assert(!(mmuidx_hv(mmu_idx) &amp;&amp; cpu-&gt;vhyp));
 
-    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
+    relocation = !mmuidx_real(mmu_idx);
 
     /* HV or virtual hypervisor Real Mode Access */
-    if (!relocation &amp;&amp; (msr_hv || cpu-&gt;vhyp)) {
+    if (!relocation &amp;&amp; (mmuidx_hv(mmu_idx) || cpu-&gt;vhyp)) {
         /* In real mode top 4 effective addr bits (mostly) ignored */
         *raddr = eaddr &amp; 0x0FFFFFFFFFFFFFFFULL;
 
         /* In HV mode, add HRMOR if top EA bit is clear */
-        if (msr_hv || !env-&gt;has_hv_mode) {
+        if (mmuidx_hv(mmu_idx) || !env-&gt;has_hv_mode) {
             if (!(eaddr &gt;&gt; 63)) {
                 *raddr |= env-&gt;spr[SPR_HRMOR];
            }
@@ -546,7 +552,7 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     if (relocation) {
         int ret = ppc_radix64_process_scoped_xlate(cpu, access_type, eaddr, pid,
                                                    pate, &amp;g_raddr, &amp;prot,
-                                                   &amp;psize, guest_visible);
+                                                   &amp;psize, mmu_idx, guest_visible);
         if (ret) {
             return false;
         }
@@ -564,13 +570,13 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
          * quadrants 1 or 2. Translates a guest real address to a host
          * real address.
          */
-        if (lpid || !msr_hv) {
+        if (lpid || !mmuidx_hv(mmu_idx)) {
             int ret;
 
             ret = ppc_radix64_partition_scoped_xlate(cpu, access_type, eaddr,
                                                      g_raddr, pate, raddr,
                                                      &amp;prot, &amp;psize, false,
-                                                     guest_visible);
+                                                     mmu_idx, guest_visible);
             if (ret) {
                 return false;
             }
diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index 6b13b89b64..b70357cf34 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -45,7 +45,7 @@
 #ifdef TARGET_PPC64
 
 bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                       hwaddr *raddr, int *psizep, int *protp,
+                       hwaddr *raddr, int *psizep, int *protp, int mmu_idx,
                        bool guest_visible);
 
 static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index ba1952c77d..9dcdf88597 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2908,7 +2908,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     case POWERPC_MMU_3_00:
         if (ppc64_v3_radix(cpu)) {
             return ppc_radix64_xlate(cpu, eaddr, access_type,
-                                     raddrp, psizep, protp, guest_visible);
+                                     raddrp, psizep, protp, mmu_idx, guest_visible);
         }
         /* fall through */
     case POWERPC_MMU_64B:
@@ -2941,8 +2941,10 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
      * try an MMU_DATA_LOAD, we may not be able to read instructions
      * mapped by code TLBs, so we also try a MMU_INST_FETCH.
      */
-    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &amp;raddr, &amp;s, &amp;p, 0, false) ||
-        ppc_xlate(cpu, addr, MMU_INST_FETCH, &amp;raddr, &amp;s, &amp;p, 0, false)) {
+    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &amp;raddr, &amp;s, &amp;p,
+                  cpu_mmu_index(&amp;cpu-&gt;env, false), false) ||
+        ppc_xlate(cpu, addr, MMU_INST_FETCH, &amp;raddr, &amp;s, &amp;p,
+                  cpu_mmu_index(&amp;cpu-&gt;env, true), false)) {
         return raddr &amp; TARGET_PAGE_MASK;
     }
     return -1;

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
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

--------------1A33AE745E335ECEFA683532--

