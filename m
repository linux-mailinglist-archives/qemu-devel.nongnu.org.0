Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F054E389522
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:15:30 +0200 (CEST)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQjB-0006g4-Gt
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljQdP-0004JK-Or; Wed, 19 May 2021 14:09:31 -0400
Received: from [201.28.113.2] (port=16283 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljQdL-00030m-9j; Wed, 19 May 2021 14:09:30 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 19 May 2021 15:09:17 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 840FF80139F;
 Wed, 19 May 2021 15:09:17 -0300 (-03)
Subject: Re: [PATCH 20/24] target/ppc: Split out ppc_hash64_xlate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-21-richard.henderson@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <3cdefa3b-f285-ca02-66e9-8e97fe8f631c@eldorado.org.br>
Date: Wed, 19 May 2021 15:09:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518201146.794854-21-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------87D1E08B733BEC01269664D2"
Content-Language: en-US
X-OriginalArrivalTime: 19 May 2021 18:09:17.0730 (UTC)
 FILETIME=[15752820:01D74CDA]
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
--------------87D1E08B733BEC01269664D2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/05/2021 17:11, Richard Henderson wrote:
> Mirror the interface of ppc_radix64_xlate, putting all of
> the logic for hash64 translation into a single function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Is it worth it to describe a bit better where the logic was removed 
from? Something like "... ... hash64 translation from handle_mmu_fault 
and get_phys_page_debug" maybe?

otherwise:

Reviewed-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>

> ---
>   target/ppc/mmu-hash64.c | 125 +++++++++++++++++++---------------------
>   1 file changed, 59 insertions(+), 66 deletions(-)
>
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 877a01a296..3024dd1e8c 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -866,8 +866,10 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
>       return -1;
>   }
>   
> -int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                MMUAccessType access_type, int mmu_idx)
> +static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
> +                             MMUAccessType access_type,
> +                             hwaddr *raddrp, int *psizep, int *protp,
> +                             bool guest_visible)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> @@ -911,9 +913,11 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>               slb = &vrma_slbe;
>               if (build_vrma_slbe(cpu, slb) != 0) {
>                   /* Invalid VRMA setup, machine check */
> -                cs->exception_index = POWERPC_EXCP_MCHECK;
> -                env->error_code = 0;
> -                return 1;
> +                if (guest_visible) {
> +                    cs->exception_index = POWERPC_EXCP_MCHECK;
> +                    env->error_code = 0;
> +                }
> +                return false;
>               }
>   
>               goto skip_slb_search;
> @@ -922,6 +926,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>   
>               /* Emulated old-style RMO mode, bounds check against RMLS */
>               if (raddr >= limit) {
> +                if (!guest_visible) {
> +                    return false;
> +                }
>                   switch (access_type) {
>                   case MMU_INST_FETCH:
>                       ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
> @@ -936,15 +943,16 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>                   default:
>                       g_assert_not_reached();
>                   }
> -                return 1;
> +                return false;
>               }
>   
>               raddr |= env->spr[SPR_RMOR];
>           }
> -        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
> -                     TARGET_PAGE_SIZE);
> -        return 0;
> +
> +        *raddrp = raddr;
> +        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        *psizep = TARGET_PAGE_BITS;
> +        return true;
>       }
>   
>       /* 2. Translation is on, so look up the SLB */
> @@ -957,6 +965,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>               exit(1);
>           }
>           /* Segment still not found, generate the appropriate interrupt */
> +        if (!guest_visible) {
> +            return false;
> +        }
>           switch (access_type) {
>           case MMU_INST_FETCH:
>               cs->exception_index = POWERPC_EXCP_ISEG;
> @@ -971,20 +982,25 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>           default:
>               g_assert_not_reached();
>           }
> -        return 1;
> +        return false;
>       }
>   
> -skip_slb_search:
> + skip_slb_search:
>   
>       /* 3. Check for segment level no-execute violation */
>       if (access_type == MMU_INST_FETCH && (slb->vsid & SLB_VSID_N)) {
> -        ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
> -        return 1;
> +        if (guest_visible) {
> +            ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
> +        }
> +        return false;
>       }
>   
>       /* 4. Locate the PTE in the hash table */
>       ptex = ppc_hash64_htab_lookup(cpu, slb, eaddr, &pte, &apshift);
>       if (ptex == -1) {
> +        if (!guest_visible) {
> +            return false;
> +        }
>           switch (access_type) {
>           case MMU_INST_FETCH:
>               ppc_hash64_set_isi(cs, SRR1_NOPTE);
> @@ -998,7 +1014,7 @@ skip_slb_search:
>           default:
>               g_assert_not_reached();
>           }
> -        return 1;
> +        return false;
>       }
>       qemu_log_mask(CPU_LOG_MMU,
>                     "found PTE at index %08" HWADDR_PRIx "\n", ptex);
> @@ -1014,6 +1030,9 @@ skip_slb_search:
>       if (need_prot & ~prot) {
>           /* Access right violation */
>           qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
> +        if (!guest_visible) {
> +            return false;
> +        }
>           if (access_type == MMU_INST_FETCH) {
>               int srr1 = 0;
>               if (PAGE_EXEC & ~exec_prot) {
> @@ -1038,7 +1057,7 @@ skip_slb_search:
>               }
>               ppc_hash64_set_dsi(cs, eaddr, dsisr);
>           }
> -        return 1;
> +        return false;
>       }
>   
>       qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
> @@ -1062,66 +1081,40 @@ skip_slb_search:
>   
>       /* 7. Determine the real address from the PTE */
>   
> -    raddr = deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, eaddr);
> +    *raddrp = deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, eaddr);
> +    *protp = prot;
> +    *psizep = apshift;
> +    return true;
> +}
> +
> +int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                MMUAccessType access_type, int mmu_idx)
> +{
> +    CPUState *cs = CPU(cpu);
> +    int page_size, prot;
> +    hwaddr raddr;
> +
> +    if (!ppc_hash64_xlate(cpu, eaddr, access_type, &raddr,
> +                          &page_size, &prot, true)) {
> +        return 1;
> +    }
>   
>       tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                 prot, mmu_idx, 1ULL << apshift);
> -
> +                 prot, mmu_idx, 1UL << page_size);
>       return 0;
>   }
>   
> -hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr)
> +hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
>   {
> -    CPUPPCState *env = &cpu->env;
> -    ppc_slb_t vrma_slbe;
> -    ppc_slb_t *slb;
> -    hwaddr ptex, raddr;
> -    ppc_hash_pte64_t pte;
> -    unsigned apshift;
> +    int psize, prot;
> +    hwaddr raddr;
>   
> -    /* Handle real mode */
> -    if (msr_dr == 0) {
> -        /* In real mode the top 4 effective address bits are ignored */
> -        raddr = addr & 0x0FFFFFFFFFFFFFFFULL;
> -
> -        if (cpu->vhyp) {
> -            /*
> -             * In virtual hypervisor mode, there's nothing to do:
> -             *   EA == GPA == qemu guest address
> -             */
> -            return raddr;
> -        } else if ((msr_hv || !env->has_hv_mode) && !(addr >> 63)) {
> -            /* In HV mode, add HRMOR if top EA bit is clear */
> -            return raddr | env->spr[SPR_HRMOR];
> -        } else if (ppc_hash64_use_vrma(env)) {
> -            /* Emulated VRMA mode */
> -            slb = &vrma_slbe;
> -            if (build_vrma_slbe(cpu, slb) != 0) {
> -                return -1;
> -            }
> -        } else {
> -            target_ulong limit = rmls_limit(cpu);
> -
> -            /* Emulated old-style RMO mode, bounds check against RMLS */
> -            if (raddr >= limit) {
> -                return -1;
> -            }
> -            return raddr | env->spr[SPR_RMOR];
> -        }
> -    } else {
> -        slb = slb_lookup(cpu, addr);
> -        if (!slb) {
> -            return -1;
> -        }
> -    }
> -
> -    ptex = ppc_hash64_htab_lookup(cpu, slb, addr, &pte, &apshift);
> -    if (ptex == -1) {
> +    if (!ppc_hash64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> +                          &psize, &prot, false)) {
>           return -1;
>       }
>   
> -    return deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, addr)
> -        & TARGET_PAGE_MASK;
> +    return raddr & TARGET_PAGE_MASK;
>   }
>   
>   void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------87D1E08B733BEC01269664D2
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
      cite="mid:20210518201146.794854-21-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">Mirror the interface of ppc_radix64_xlate, putting all of
the logic for hash64 translation into a single function.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a></pre>
    </blockquote>
    <p>Is it worth it to describe a bit better where the logic was
      removed from? Something like "... ... hash64 translation from
      handle_mmu_fault and get_phys_page_debug" maybe?</p>
    <p>otherwise:<br>
    </p>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-21-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
---
 target/ppc/mmu-hash64.c | 125 +++++++++++++++++++---------------------
 1 file changed, 59 insertions(+), 66 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 877a01a296..3024dd1e8c 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -866,8 +866,10 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
     return -1;
 }
 
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
+static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                             MMUAccessType access_type,
+                             hwaddr *raddrp, int *psizep, int *protp,
+                             bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
@@ -911,9 +913,11 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
             slb = &amp;vrma_slbe;
             if (build_vrma_slbe(cpu, slb) != 0) {
                 /* Invalid VRMA setup, machine check */
-                cs-&gt;exception_index = POWERPC_EXCP_MCHECK;
-                env-&gt;error_code = 0;
-                return 1;
+                if (guest_visible) {
+                    cs-&gt;exception_index = POWERPC_EXCP_MCHECK;
+                    env-&gt;error_code = 0;
+                }
+                return false;
             }
 
             goto skip_slb_search;
@@ -922,6 +926,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
             /* Emulated old-style RMO mode, bounds check against RMLS */
             if (raddr &gt;= limit) {
+                if (!guest_visible) {
+                    return false;
+                }
                 switch (access_type) {
                 case MMU_INST_FETCH:
                     ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
@@ -936,15 +943,16 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
                 default:
                     g_assert_not_reached();
                 }
-                return 1;
+                return false;
             }
 
             raddr |= env-&gt;spr[SPR_RMOR];
         }
-        tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
-                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
-                     TARGET_PAGE_SIZE);
-        return 0;
+
+        *raddrp = raddr;
+        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *psizep = TARGET_PAGE_BITS;
+        return true;
     }
 
     /* 2. Translation is on, so look up the SLB */
@@ -957,6 +965,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
             exit(1);
         }
         /* Segment still not found, generate the appropriate interrupt */
+        if (!guest_visible) {
+            return false;
+        }
         switch (access_type) {
         case MMU_INST_FETCH:
             cs-&gt;exception_index = POWERPC_EXCP_ISEG;
@@ -971,20 +982,25 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
         default:
             g_assert_not_reached();
         }
-        return 1;
+        return false;
     }
 
-skip_slb_search:
+ skip_slb_search:
 
     /* 3. Check for segment level no-execute violation */
     if (access_type == MMU_INST_FETCH &amp;&amp; (slb-&gt;vsid &amp; SLB_VSID_N)) {
-        ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
-        return 1;
+        if (guest_visible) {
+            ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
+        }
+        return false;
     }
 
     /* 4. Locate the PTE in the hash table */
     ptex = ppc_hash64_htab_lookup(cpu, slb, eaddr, &amp;pte, &amp;apshift);
     if (ptex == -1) {
+        if (!guest_visible) {
+            return false;
+        }
         switch (access_type) {
         case MMU_INST_FETCH:
             ppc_hash64_set_isi(cs, SRR1_NOPTE);
@@ -998,7 +1014,7 @@ skip_slb_search:
         default:
             g_assert_not_reached();
         }
-        return 1;
+        return false;
     }
     qemu_log_mask(CPU_LOG_MMU,
                   "found PTE at index %08" HWADDR_PRIx "\n", ptex);
@@ -1014,6 +1030,9 @@ skip_slb_search:
     if (need_prot &amp; ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
+        if (!guest_visible) {
+            return false;
+        }
         if (access_type == MMU_INST_FETCH) {
             int srr1 = 0;
             if (PAGE_EXEC &amp; ~exec_prot) {
@@ -1038,7 +1057,7 @@ skip_slb_search:
             }
             ppc_hash64_set_dsi(cs, eaddr, dsisr);
         }
-        return 1;
+        return false;
     }
 
     qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
@@ -1062,66 +1081,40 @@ skip_slb_search:
 
     /* 7. Determine the real address from the PTE */
 
-    raddr = deposit64(pte.pte1 &amp; HPTE64_R_RPN, 0, apshift, eaddr);
+    *raddrp = deposit64(pte.pte1 &amp; HPTE64_R_RPN, 0, apshift, eaddr);
+    *protp = prot;
+    *psizep = apshift;
+    return true;
+}
+
+int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                MMUAccessType access_type, int mmu_idx)
+{
+    CPUState *cs = CPU(cpu);
+    int page_size, prot;
+    hwaddr raddr;
+
+    if (!ppc_hash64_xlate(cpu, eaddr, access_type, &amp;raddr,
+                          &amp;page_size, &amp;prot, true)) {
+        return 1;
+    }
 
     tlb_set_page(cs, eaddr &amp; TARGET_PAGE_MASK, raddr &amp; TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1ULL &lt;&lt; apshift);
-
+                 prot, mmu_idx, 1UL &lt;&lt; page_size);
     return 0;
 }
 
-hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr)
+hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
 {
-    CPUPPCState *env = &amp;cpu-&gt;env;
-    ppc_slb_t vrma_slbe;
-    ppc_slb_t *slb;
-    hwaddr ptex, raddr;
-    ppc_hash_pte64_t pte;
-    unsigned apshift;
+    int psize, prot;
+    hwaddr raddr;
 
-    /* Handle real mode */
-    if (msr_dr == 0) {
-        /* In real mode the top 4 effective address bits are ignored */
-        raddr = addr &amp; 0x0FFFFFFFFFFFFFFFULL;
-
-        if (cpu-&gt;vhyp) {
-            /*
-             * In virtual hypervisor mode, there's nothing to do:
-             *   EA == GPA == qemu guest address
-             */
-            return raddr;
-        } else if ((msr_hv || !env-&gt;has_hv_mode) &amp;&amp; !(addr &gt;&gt; 63)) {
-            /* In HV mode, add HRMOR if top EA bit is clear */
-            return raddr | env-&gt;spr[SPR_HRMOR];
-        } else if (ppc_hash64_use_vrma(env)) {
-            /* Emulated VRMA mode */
-            slb = &amp;vrma_slbe;
-            if (build_vrma_slbe(cpu, slb) != 0) {
-                return -1;
-            }
-        } else {
-            target_ulong limit = rmls_limit(cpu);
-
-            /* Emulated old-style RMO mode, bounds check against RMLS */
-            if (raddr &gt;= limit) {
-                return -1;
-            }
-            return raddr | env-&gt;spr[SPR_RMOR];
-        }
-    } else {
-        slb = slb_lookup(cpu, addr);
-        if (!slb) {
-            return -1;
-        }
-    }
-
-    ptex = ppc_hash64_htab_lookup(cpu, slb, addr, &amp;pte, &amp;apshift);
-    if (ptex == -1) {
+    if (!ppc_hash64_xlate(cpu, eaddr, MMU_DATA_LOAD, &amp;raddr,
+                          &amp;psize, &amp;prot, false)) {
         return -1;
     }
 
-    return deposit64(pte.pte1 &amp; HPTE64_R_RPN, 0, apshift, addr)
-        &amp; TARGET_PAGE_MASK;
+    return raddr &amp; TARGET_PAGE_MASK;
 }
 
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
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

--------------87D1E08B733BEC01269664D2--

