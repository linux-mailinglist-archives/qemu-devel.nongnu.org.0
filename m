Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213963894CA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:49:27 +0200 (CEST)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQJx-0001pQ-M5
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljQFF-0007Ma-Pa; Wed, 19 May 2021 13:44:33 -0400
Received: from [201.28.113.2] (port=25524 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljQFC-0004pk-Sn; Wed, 19 May 2021 13:44:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 19 May 2021 14:44:25 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 610B780139F;
 Wed, 19 May 2021 14:44:25 -0300 (-03)
Subject: Re: [PATCH 18/24] target/ppc: Push real-mode handling into
 ppc_radix64_xlate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-19-richard.henderson@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <f5341c3e-3178-5c10-5b10-1276997db463@eldorado.org.br>
Date: Wed, 19 May 2021 14:44:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518201146.794854-19-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------6F013632150B7A95393E4275"
Content-Language: en-US
X-OriginalArrivalTime: 19 May 2021 17:44:25.0613 (UTC)
 FILETIME=[9C162BD0:01D74CD6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
--------------6F013632150B7A95393E4275
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/05/2021 17:11, Richard Henderson wrote:
> This removes some incomplete duplication between
> ppc_radix64_handle_mmu_fault and ppc_radix64_get_phys_page_debug.
> The former was correct wrt SPR_HRMOR and the latter was not.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>

> ---
>   target/ppc/mmu-radix64.c | 77 ++++++++++++++++++----------------------
>   1 file changed, 34 insertions(+), 43 deletions(-)
>
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index f6d96f73b2..76a5cc8cdb 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -466,7 +466,6 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>    */
>   static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>                                MMUAccessType access_type,
> -                             bool relocation,
>                                hwaddr *raddr, int *psizep, int *protp,
>                                bool guest_visible)
>   {
> @@ -475,6 +474,37 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>       ppc_v3_pate_t pate;
>       int psize, prot;
>       hwaddr g_raddr;
> +    bool relocation;
> +
> +    assert(!(msr_hv && cpu->vhyp));
> +
> +    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
> +
> +    /* HV or virtual hypervisor Real Mode Access */
> +    if (!relocation && (msr_hv || cpu->vhyp)) {
> +        /* In real mode top 4 effective addr bits (mostly) ignored */
> +        *raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
> +
> +        /* In HV mode, add HRMOR if top EA bit is clear */
> +        if (msr_hv || !env->has_hv_mode) {
> +            if (!(eaddr >> 63)) {
> +                *raddr |= env->spr[SPR_HRMOR];
> +           }
> +        }
> +        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        *psizep = TARGET_PAGE_BITS;
> +        return 0;
> +    }
> +
> +    /*
> +     * Check UPRT (we avoid the check in real mode to deal with
> +     * transitional states during kexec.
> +     */
> +    if (guest_visible && !ppc64_use_proc_tbl(cpu)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "LPCR:UPRT not set in radix mode ! LPCR="
> +                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
> +    }
>   
>       /* Virtual Mode Access - get the fully qualified address */
>       if (!ppc_radix64_get_fully_qualified_addr(&cpu->env, eaddr, &lpid, &pid)) {
> @@ -560,43 +590,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>                                    MMUAccessType access_type, int mmu_idx)
>   {
>       CPUState *cs = CPU(cpu);
> -    CPUPPCState *env = &cpu->env;
>       int page_size, prot;
> -    bool relocation;
>       hwaddr raddr;
>   
> -    assert(!(msr_hv && cpu->vhyp));
> -
> -    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
> -    /* HV or virtual hypervisor Real Mode Access */
> -    if (!relocation && (msr_hv || cpu->vhyp)) {
> -        /* In real mode top 4 effective addr bits (mostly) ignored */
> -        raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
> -
> -        /* In HV mode, add HRMOR if top EA bit is clear */
> -        if (msr_hv || !env->has_hv_mode) {
> -            if (!(eaddr >> 63)) {
> -                raddr |= env->spr[SPR_HRMOR];
> -           }
> -        }
> -        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
> -                     TARGET_PAGE_SIZE);
> -        return 0;
> -    }
> -
> -    /*
> -     * Check UPRT (we avoid the check in real mode to deal with
> -     * transitional states during kexec.
> -     */
> -    if (!ppc64_use_proc_tbl(cpu)) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "LPCR:UPRT not set in radix mode ! LPCR="
> -                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
> -    }
> -
>       /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
> -    if (ppc_radix64_xlate(cpu, eaddr, access_type, relocation, &raddr,
> +    if (ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
>                             &page_size, &prot, true)) {
>           return 1;
>       }
> @@ -608,18 +606,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>   
>   hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
>   {
> -    CPUPPCState *env = &cpu->env;
>       int psize, prot;
>       hwaddr raddr;
>   
> -    /* Handle Real Mode */
> -    if ((msr_dr == 0) && (msr_hv || cpu->vhyp)) {
> -        /* In real mode top 4 effective addr bits (mostly) ignored */
> -        return eaddr & 0x0FFFFFFFFFFFFFFFULL;
> -    }
> -
> -    if (ppc_radix64_xlate(cpu, eaddr, 0, msr_dr, &raddr, &psize,
> -                          &prot, false)) {
> +    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> +                          &psize, &prot, false)) {
>           return -1;
>       }
>   
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------6F013632150B7A95393E4275
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
      cite="mid:20210518201146.794854-19-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">This removes some incomplete duplication between
ppc_radix64_handle_mmu_fault and ppc_radix64_get_phys_page_debug.
The former was correct wrt SPR_HRMOR and the latter was not.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a></pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-19-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
---
 target/ppc/mmu-radix64.c | 77 ++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index f6d96f73b2..76a5cc8cdb 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -466,7 +466,6 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  */
 static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
                              MMUAccessType access_type,
-                             bool relocation,
                              hwaddr *raddr, int *psizep, int *protp,
                              bool guest_visible)
 {
@@ -475,6 +474,37 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
     ppc_v3_pate_t pate;
     int psize, prot;
     hwaddr g_raddr;
+    bool relocation;
+
+    assert(!(msr_hv &amp;&amp; cpu-&gt;vhyp));
+
+    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
+
+    /* HV or virtual hypervisor Real Mode Access */
+    if (!relocation &amp;&amp; (msr_hv || cpu-&gt;vhyp)) {
+        /* In real mode top 4 effective addr bits (mostly) ignored */
+        *raddr = eaddr &amp; 0x0FFFFFFFFFFFFFFFULL;
+
+        /* In HV mode, add HRMOR if top EA bit is clear */
+        if (msr_hv || !env-&gt;has_hv_mode) {
+            if (!(eaddr &gt;&gt; 63)) {
+                *raddr |= env-&gt;spr[SPR_HRMOR];
+           }
+        }
+        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *psizep = TARGET_PAGE_BITS;
+        return 0;
+    }
+
+    /*
+     * Check UPRT (we avoid the check in real mode to deal with
+     * transitional states during kexec.
+     */
+    if (guest_visible &amp;&amp; !ppc64_use_proc_tbl(cpu)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "LPCR:UPRT not set in radix mode ! LPCR="
+                      TARGET_FMT_lx "\n", env-&gt;spr[SPR_LPCR]);
+    }
 
     /* Virtual Mode Access - get the fully qualified address */
     if (!ppc_radix64_get_fully_qualified_addr(&amp;cpu-&gt;env, eaddr, &amp;lpid, &amp;pid)) {
@@ -560,43 +590,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
                                  MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &amp;cpu-&gt;env;
     int page_size, prot;
-    bool relocation;
     hwaddr raddr;
 
-    assert(!(msr_hv &amp;&amp; cpu-&gt;vhyp));
-
-    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
-    /* HV or virtual hypervisor Real Mode Access */
-    if (!relocation &amp;&amp; (msr_hv || cpu-&gt;vhyp)) {
-        /* In real mode top 4 effective addr bits (mostly) ignored */
-        raddr = eaddr &amp; 0x0FFFFFFFFFFFFFFFULL;
-
-        /* In HV mode, add HRMOR if top EA bit is clear */
-        if (msr_hv || !env-&gt;has_hv_mode) {
-            if (!(eaddr &gt;&gt; 63)) {
-                raddr |= env-&gt;spr[SPR_HRMOR];
-           }
-        }
-        tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
-                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
-                     TARGET_PAGE_SIZE);
-        return 0;
-    }
-
-    /*
-     * Check UPRT (we avoid the check in real mode to deal with
-     * transitional states during kexec.
-     */
-    if (!ppc64_use_proc_tbl(cpu)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "LPCR:UPRT not set in radix mode ! LPCR="
-                      TARGET_FMT_lx "\n", env-&gt;spr[SPR_LPCR]);
-    }
-
     /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (ppc_radix64_xlate(cpu, eaddr, access_type, relocation, &amp;raddr,
+    if (ppc_radix64_xlate(cpu, eaddr, access_type, &amp;raddr,
                           &amp;page_size, &amp;prot, true)) {
         return 1;
     }
@@ -608,18 +606,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
 hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
 {
-    CPUPPCState *env = &amp;cpu-&gt;env;
     int psize, prot;
     hwaddr raddr;
 
-    /* Handle Real Mode */
-    if ((msr_dr == 0) &amp;&amp; (msr_hv || cpu-&gt;vhyp)) {
-        /* In real mode top 4 effective addr bits (mostly) ignored */
-        return eaddr &amp; 0x0FFFFFFFFFFFFFFFULL;
-    }
-
-    if (ppc_radix64_xlate(cpu, eaddr, 0, msr_dr, &amp;raddr, &amp;psize,
-                          &amp;prot, false)) {
+    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &amp;raddr,
+                          &amp;psize, &amp;prot, false)) {
         return -1;
     }
 
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

--------------6F013632150B7A95393E4275--

