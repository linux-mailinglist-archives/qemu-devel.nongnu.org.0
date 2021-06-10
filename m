Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C313A31C8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 19:11:38 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrODP-0000QO-ET
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 13:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lrO9q-0006tZ-8z; Thu, 10 Jun 2021 13:07:54 -0400
Received: from [201.28.113.2] (port=57503 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lrO9o-0000Ij-4U; Thu, 10 Jun 2021 13:07:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 10 Jun 2021 14:07:47 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id B6997800144;
 Thu, 10 Jun 2021 14:07:47 -0300 (-03)
Subject: Re: [PATCH v2 1/3] target/ppc: Turn ppc_tlb_invalid_all in a noop
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210610164648.83878-1-lucas.araujo@eldorado.org.br>
 <20210610164648.83878-2-lucas.araujo@eldorado.org.br>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <39bbb600-88b2-bef4-47d5-8d1eef41e49d@eldorado.org.br>
Date: Thu, 10 Jun 2021 14:07:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610164648.83878-2-lucas.araujo@eldorado.org.br>
Content-Type: multipart/alternative;
 boundary="------------D3F90129292F278642491B5A"
Content-Language: en-US
X-OriginalArrivalTime: 10 Jun 2021 17:07:48.0007 (UTC)
 FILETIME=[234C9B70:01D75E1B]
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
Cc: luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------D3F90129292F278642491B5A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/06/2021 13:46, Lucas Mateus Castro (alqotel) wrote:
> The function ppc_tlb_invalid_all is now a no op when compiling without TCG.
>
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/mmu_helper.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 1ecb36e85a..e7ba39c9e1 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -825,6 +825,7 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>       return ret;
>   }
>   
> +#ifdef CONFIG_TCG
>   static void booke206_flush_tlb(CPUPPCState *env, int flags,
>                                  const int check_iprot)
>   {
> @@ -846,6 +847,7 @@ static void booke206_flush_tlb(CPUPPCState *env, int flags,
>   
>       tlb_flush(env_cpu(env));
>   }
> +#endif
I think you could use ATTRIBUTE_UNUSED instead of ifdefs here. Not sure 
which would be preferable in this case, but IMHO unused is a bit more 
informative as to what is happening...
>   
>   static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
>                                           ppcmas_tlb_t *tlb)
> @@ -1956,6 +1958,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
>   /* TLB management */
>   void ppc_tlb_invalidate_all(CPUPPCState *env)
>   {
> +#ifdef CONFIG_TCG
>   #if defined(TARGET_PPC64)
>       if (mmu_is_64bit(env->mmu_model)) {
>           env->tlb_need_flush = 0;
> @@ -1994,6 +1997,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>           cpu_abort(env_cpu(env), "Unknown MMU model %x\n", env->mmu_model);
>           break;
>       }
> +#endif
>   }
>   
>   #ifdef CONFIG_TCG
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------D3F90129292F278642491B5A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/06/2021 13:46, Lucas Mateus
      Castro (alqotel) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210610164648.83878-2-lucas.araujo@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">The function ppc_tlb_invalid_all is now a no op when compiling without TCG.

Signed-off-by: Lucas Mateus Castro (alqotel) <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
---
 target/ppc/mmu_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 1ecb36e85a..e7ba39c9e1 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -825,6 +825,7 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     return ret;
 }
 
+#ifdef CONFIG_TCG
 static void booke206_flush_tlb(CPUPPCState *env, int flags,
                                const int check_iprot)
 {
@@ -846,6 +847,7 @@ static void booke206_flush_tlb(CPUPPCState *env, int flags,
 
     tlb_flush(env_cpu(env));
 }
+#endif</pre>
    </blockquote>
    I think you could use ATTRIBUTE_UNUSED instead of ifdefs here. Not
    sure which would be preferable in this case, but IMHO unused is a
    bit more informative as to what is happening...<br>
    <blockquote type="cite"
      cite="mid:20210610164648.83878-2-lucas.araujo@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">
 
 static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
                                         ppcmas_tlb_t *tlb)
@@ -1956,6 +1958,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
 /* TLB management */
 void ppc_tlb_invalidate_all(CPUPPCState *env)
 {
+#ifdef CONFIG_TCG
 #if defined(TARGET_PPC64)
     if (mmu_is_64bit(env-&gt;mmu_model)) {
         env-&gt;tlb_need_flush = 0;
@@ -1994,6 +1997,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
         cpu_abort(env_cpu(env), "Unknown MMU model %x\n", env-&gt;mmu_model);
         break;
     }
+#endif
 }
 
 #ifdef CONFIG_TCG
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

--------------D3F90129292F278642491B5A--

