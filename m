Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD46F3894DA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:57:52 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQS7-00027a-Qu
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljQPc-0000gr-WC; Wed, 19 May 2021 13:55:17 -0400
Received: from [201.28.113.2] (port=42347 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljQPa-00038C-3s; Wed, 19 May 2021 13:55:16 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 19 May 2021 14:53:56 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 7D1D880139F;
 Wed, 19 May 2021 14:53:56 -0300 (-03)
Subject: Re: [PATCH 19/24] target/ppc: Use bool success for ppc_radix64_xlate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-20-richard.henderson@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <05f2d33a-9435-f01c-62da-fb7be6587ced@eldorado.org.br>
Date: Wed, 19 May 2021 14:53:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518201146.794854-20-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------264AA9AB8E65913D12DF723D"
Content-Language: en-US
X-OriginalArrivalTime: 19 May 2021 17:53:56.0723 (UTC)
 FILETIME=[F07EA430:01D74CD7]
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
--------------264AA9AB8E65913D12DF723D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/05/2021 17:11, Richard Henderson wrote:
> Instead of returning non-zero for failure, return true for success.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>

> ---
>   target/ppc/mmu-radix64.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 76a5cc8cdb..7af3e697b2 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -464,10 +464,10 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>    *              | = On        | Process Scoped |    Scoped     |
>    *              +-------------+----------------+---------------+
>    */
> -static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
> -                             MMUAccessType access_type,
> -                             hwaddr *raddr, int *psizep, int *protp,
> -                             bool guest_visible)
> +static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
> +                              MMUAccessType access_type,
> +                              hwaddr *raddr, int *psizep, int *protp,
> +                              bool guest_visible)
>   {
>       CPUPPCState *env = &cpu->env;
>       uint64_t lpid, pid;
> @@ -493,7 +493,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>           }
>           *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           *psizep = TARGET_PAGE_BITS;
> -        return 0;
> +        return true;
>       }
>   
>       /*
> @@ -511,7 +511,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>           if (guest_visible) {
>               ppc_radix64_raise_segi(cpu, access_type, eaddr);
>           }
> -        return 1;
> +        return false;
>       }
>   
>       /* Get Process Table */
> @@ -524,13 +524,13 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>               if (guest_visible) {
>                   ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
>               }
> -            return 1;
> +            return false;
>           }
>           if (!validate_pate(cpu, lpid, &pate)) {
>               if (guest_visible) {
>                   ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
>               }
> -            return 1;
> +            return false;
>           }
>       }
>   
> @@ -550,7 +550,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>                                                      pate, &g_raddr, &prot,
>                                                      &psize, guest_visible);
>           if (ret) {
> -            return ret;
> +            return false;
>           }
>           *psizep = MIN(*psizep, psize);
>           *protp &= prot;
> @@ -574,7 +574,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>                                                        &prot, &psize, false,
>                                                        guest_visible);
>               if (ret) {
> -                return ret;
> +                return false;
>               }
>               *psizep = MIN(*psizep, psize);
>               *protp &= prot;
> @@ -583,7 +583,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
>           }
>       }
>   
> -    return 0;
> +    return true;
>   }
>   
>   int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> @@ -594,8 +594,8 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
>       hwaddr raddr;
>   
>       /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
> -    if (ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
> -                          &page_size, &prot, true)) {
> +    if (!ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
> +                           &page_size, &prot, true)) {
>           return 1;
>       }
>   
> @@ -609,8 +609,8 @@ hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
>       int psize, prot;
>       hwaddr raddr;
>   
> -    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> -                          &psize, &prot, false)) {
> +    if (!ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> +                           &psize, &prot, false)) {
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

--------------264AA9AB8E65913D12DF723D
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
      cite="mid:20210518201146.794854-20-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">Instead of returning non-zero for failure, return true for success.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a></pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20210518201146.794854-20-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
---
 target/ppc/mmu-radix64.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 76a5cc8cdb..7af3e697b2 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -464,10 +464,10 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  *              | = On        | Process Scoped |    Scoped     |
  *              +-------------+----------------+---------------+
  */
-static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
-                             MMUAccessType access_type,
-                             hwaddr *raddr, int *psizep, int *protp,
-                             bool guest_visible)
+static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                              MMUAccessType access_type,
+                              hwaddr *raddr, int *psizep, int *protp,
+                              bool guest_visible)
 {
     CPUPPCState *env = &amp;cpu-&gt;env;
     uint64_t lpid, pid;
@@ -493,7 +493,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
         }
         *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         *psizep = TARGET_PAGE_BITS;
-        return 0;
+        return true;
     }
 
     /*
@@ -511,7 +511,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
         if (guest_visible) {
             ppc_radix64_raise_segi(cpu, access_type, eaddr);
         }
-        return 1;
+        return false;
     }
 
     /* Get Process Table */
@@ -524,13 +524,13 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
             if (guest_visible) {
                 ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
             }
-            return 1;
+            return false;
         }
         if (!validate_pate(cpu, lpid, &amp;pate)) {
             if (guest_visible) {
                 ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
             }
-            return 1;
+            return false;
         }
     }
 
@@ -550,7 +550,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
                                                    pate, &amp;g_raddr, &amp;prot,
                                                    &amp;psize, guest_visible);
         if (ret) {
-            return ret;
+            return false;
         }
         *psizep = MIN(*psizep, psize);
         *protp &amp;= prot;
@@ -574,7 +574,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
                                                      &amp;prot, &amp;psize, false,
                                                      guest_visible);
             if (ret) {
-                return ret;
+                return false;
             }
             *psizep = MIN(*psizep, psize);
             *protp &amp;= prot;
@@ -583,7 +583,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
         }
     }
 
-    return 0;
+    return true;
 }
 
 int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
@@ -594,8 +594,8 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     hwaddr raddr;
 
     /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (ppc_radix64_xlate(cpu, eaddr, access_type, &amp;raddr,
-                          &amp;page_size, &amp;prot, true)) {
+    if (!ppc_radix64_xlate(cpu, eaddr, access_type, &amp;raddr,
+                           &amp;page_size, &amp;prot, true)) {
         return 1;
     }
 
@@ -609,8 +609,8 @@ hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
     int psize, prot;
     hwaddr raddr;
 
-    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &amp;raddr,
-                          &amp;psize, &amp;prot, false)) {
+    if (!ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &amp;raddr,
+                           &amp;psize, &amp;prot, false)) {
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

--------------264AA9AB8E65913D12DF723D--

