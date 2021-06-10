Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F0D3A3192
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:57:58 +0200 (CEST)
Received: from localhost ([::1]:44866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrO0D-0003UN-4O
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lrNwu-0000QQ-0w; Thu, 10 Jun 2021 12:54:32 -0400
Received: from [201.28.113.2] (port=57814 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lrNwr-0005wf-1X; Thu, 10 Jun 2021 12:54:31 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 10 Jun 2021 13:54:25 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 224E68014C4;
 Thu, 10 Jun 2021 13:54:25 -0300 (-03)
Subject: Re: [PATCH v2 3/3] target/ppc: moved ppc_store_sdr1 to mmu_common.c
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210610164648.83878-1-lucas.araujo@eldorado.org.br>
 <20210610164648.83878-4-lucas.araujo@eldorado.org.br>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <9f391290-a5b5-6508-e75a-9c2630c41e64@eldorado.org.br>
Date: Thu, 10 Jun 2021 13:54:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610164648.83878-4-lucas.araujo@eldorado.org.br>
Content-Type: multipart/alternative;
 boundary="------------C7850B9128A1B3EACB32B160"
Content-Language: en-US
X-OriginalArrivalTime: 10 Jun 2021 16:54:25.0450 (UTC)
 FILETIME=[44F020A0:01D75E19]
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
--------------C7850B9128A1B3EACB32B160
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/06/2021 13:46, Lucas Mateus Castro (alqotel) wrote:
> Moved ppc_store_sdr1 to mmu_common.c as it was originally in
> mmu_helper.c.
>
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/cpu.c        | 28 ----------------------------
>   target/ppc/mmu_common.c | 28 ++++++++++++++++++++++++++++
>   2 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 19d67b5b07..7ad9bd6044 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -67,34 +67,6 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
>       return env->vscr | (sat << VSCR_SAT);
>   }
>   
> -#ifdef CONFIG_SOFTMMU
> -void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
> -{
> -    PowerPCCPU *cpu = env_archcpu(env);
> -    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
> -    assert(!cpu->vhyp);
> -#if defined(TARGET_PPC64)
> -    if (mmu_is_64bit(env->mmu_model)) {
> -        target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
> -        target_ulong htabsize = value & SDR_64_HTABSIZE;
> -
> -        if (value & ~sdr_mask) {
> -            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
> -                     " set in SDR1", value & ~sdr_mask);
> -            value &= sdr_mask;
> -        }
> -        if (htabsize > 28) {
> -            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_FMT_lx
> -                     " stored in SDR1", htabsize);
> -            return;
> -        }
> -    }
> -#endif /* defined(TARGET_PPC64) */
> -    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
> -    env->spr[SPR_SDR1] = value;
> -}
> -#endif /* CONFIG_SOFTMMU */
> -
>   /* GDBstub can read and write MSR... */
>   void ppc_store_msr(CPUPPCState *env, target_ulong value)
>   {
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 93e7b8f955..54c6a7ac6f 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -58,6 +58,34 @@
>   #  define LOG_BATS(...) do { } while (0)
>   #endif
>   
> +#ifdef CONFIG_SOFTMMU
> +void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
> +    assert(!cpu->vhyp);
> +#if defined(TARGET_PPC64)
> +    if (mmu_is_64bit(env->mmu_model)) {
> +        target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
> +        target_ulong htabsize = value & SDR_64_HTABSIZE;
> +
> +        if (value & ~sdr_mask) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
> +                     " set in SDR1", value & ~sdr_mask);
> +            value &= sdr_mask;
> +        }
> +        if (htabsize > 28) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_FMT_lx
> +                     " stored in SDR1", htabsize);
> +            return;
> +        }
> +    }
> +#endif /* defined(TARGET_PPC64) */
> +    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
> +    env->spr[SPR_SDR1] = value;
> +}
> +#endif /* CONFIG_SOFTMMU */
> +
>   /*****************************************************************************/
>   /* PowerPC MMU emulation */
>   

Maybe just a nit, but if this file is being compiled, CONFIG_SOFTMMU 
will be defined. This ifdef here is redundant. I only added because it 
was needed for cpu.c

Other than that, LGTM

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------C7850B9128A1B3EACB32B160
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
      cite="mid:20210610164648.83878-4-lucas.araujo@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">Moved ppc_store_sdr1 to mmu_common.c as it was originally in
mmu_helper.c.

Signed-off-by: Lucas Mateus Castro (alqotel) <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
---
 target/ppc/cpu.c        | 28 ----------------------------
 target/ppc/mmu_common.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 19d67b5b07..7ad9bd6044 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -67,34 +67,6 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
     return env-&gt;vscr | (sat &lt;&lt; VSCR_SAT);
 }
 
-#ifdef CONFIG_SOFTMMU
-void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
-    assert(!cpu-&gt;vhyp);
-#if defined(TARGET_PPC64)
-    if (mmu_is_64bit(env-&gt;mmu_model)) {
-        target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
-        target_ulong htabsize = value &amp; SDR_64_HTABSIZE;
-
-        if (value &amp; ~sdr_mask) {
-            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
-                     " set in SDR1", value &amp; ~sdr_mask);
-            value &amp;= sdr_mask;
-        }
-        if (htabsize &gt; 28) {
-            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_FMT_lx
-                     " stored in SDR1", htabsize);
-            return;
-        }
-    }
-#endif /* defined(TARGET_PPC64) */
-    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
-    env-&gt;spr[SPR_SDR1] = value;
-}
-#endif /* CONFIG_SOFTMMU */
-
 /* GDBstub can read and write MSR... */
 void ppc_store_msr(CPUPPCState *env, target_ulong value)
 {
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 93e7b8f955..54c6a7ac6f 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -58,6 +58,34 @@
 #  define LOG_BATS(...) do { } while (0)
 #endif
 
+#ifdef CONFIG_SOFTMMU
+void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
+    assert(!cpu-&gt;vhyp);
+#if defined(TARGET_PPC64)
+    if (mmu_is_64bit(env-&gt;mmu_model)) {
+        target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
+        target_ulong htabsize = value &amp; SDR_64_HTABSIZE;
+
+        if (value &amp; ~sdr_mask) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
+                     " set in SDR1", value &amp; ~sdr_mask);
+            value &amp;= sdr_mask;
+        }
+        if (htabsize &gt; 28) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_FMT_lx
+                     " stored in SDR1", htabsize);
+            return;
+        }
+    }
+#endif /* defined(TARGET_PPC64) */
+    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
+    env-&gt;spr[SPR_SDR1] = value;
+}
+#endif /* CONFIG_SOFTMMU */
+
 /*****************************************************************************/
 /* PowerPC MMU emulation */
 </pre>
    </blockquote>
    <p>Maybe just a nit, but if this file is being compiled,
      CONFIG_SOFTMMU will be defined. This ifdef here is redundant. I
      only added because it was needed for cpu.c</p>
    <p>Other than that, LGTM<br>
    </p>
    <blockquote type="cite"
      cite="mid:20210610164648.83878-4-lucas.araujo@eldorado.org.br">
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

--------------C7850B9128A1B3EACB32B160--

