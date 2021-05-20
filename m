Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1762638AFD1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:21:40 +0200 (CEST)
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljicN-0001TC-3E
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljiZp-0007Ke-DW; Thu, 20 May 2021 09:19:02 -0400
Received: from [201.28.113.2] (port=6295 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljiZm-0007R1-Sf; Thu, 20 May 2021 09:19:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 20 May 2021 10:18:54 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id A30AD8013D0;
 Thu, 20 May 2021 10:18:54 -0300 (-03)
Subject: Re: [PATCH 24/24] target/ppc: Restrict ppc_cpu_tlb_fill to TCG
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-25-richard.henderson@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <c50f336a-37bc-2d16-0c7f-87562cb017c3@eldorado.org.br>
Date: Thu, 20 May 2021 10:18:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518201146.794854-25-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------9A1B832A57354DB1474FE7D1"
Content-Language: en-US
X-OriginalArrivalTime: 20 May 2021 13:18:54.0866 (UTC)
 FILETIME=[AF08D720:01D74D7A]
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
--------------9A1B832A57354DB1474FE7D1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/05/2021 17:11, Richard Henderson wrote:
> This function is used by TCGCPUOps, and is thus TCG specific.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/mmu_helper.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 2535ea1836..78e6f7496b 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2964,6 +2964,7 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>       return -1;
>   }
>   
> +#ifdef CONFIG_TCG
>   bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr)
> @@ -2984,3 +2985,4 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
>       raise_exception_err_ra(&cpu->env, cs->exception_index,
>                              cpu->env.error_code, retaddr);
>   }
> +#endif

This patch makes it look like we would compile mmu_helper.c after all. 
Is that it? That looks like the simplest solution (ifdef'ing away all 
helpers) but I thought mmu_helper was supposed to have all TCG-only code 
relating to MMU.

-- 

Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------9A1B832A57354DB1474FE7D1
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
      cite="mid:20210518201146.794854-25-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">This function is used by TCGCPUOps, and is thus TCG specific.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
---
 target/ppc/mmu_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2535ea1836..78e6f7496b 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2964,6 +2964,7 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     return -1;
 }
 
+#ifdef CONFIG_TCG
 bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
@@ -2984,3 +2985,4 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
     raise_exception_err_ra(&amp;cpu-&gt;env, cs-&gt;exception_index,
                            cpu-&gt;env.error_code, retaddr);
 }
+#endif</pre>
    </blockquote>
    <p>This patch makes it look like we would compile mmu_helper.c after
      all. Is that it? That looks like the simplest solution (ifdef'ing
      away all helpers) but I thought mmu_helper was supposed to have
      all TCG-only code relating to MMU. <br>
    </p>
    <p>-- </p>
    <div class="moz-signature">Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------9A1B832A57354DB1474FE7D1--

