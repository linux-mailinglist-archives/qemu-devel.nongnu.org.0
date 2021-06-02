Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB63989B3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:35:11 +0200 (CEST)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQ5W-0008AI-FZ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1loQ22-0004p5-G0; Wed, 02 Jun 2021 08:31:34 -0400
Received: from [201.28.113.2] (port=52070 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1loQ1x-0004GZ-52; Wed, 02 Jun 2021 08:31:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 2 Jun 2021 09:31:25 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id CD26F80148C;
 Wed,  2 Jun 2021 09:31:24 -0300 (-03)
Subject: Re: [RFC PATCH 5/5] target/ppc: powerpc_excp: Move interrupt raising
 code to QOM
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210601214649.785647-1-farosas@linux.ibm.com>
 <20210601214649.785647-6-farosas@linux.ibm.com>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <3f551efa-33ce-427c-6f1f-8f21a5e59728@eldorado.org.br>
Date: Wed, 2 Jun 2021 09:31:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601214649.785647-6-farosas@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------7E5723C6AB5726BA2F221AC1"
Content-Language: en-US
X-OriginalArrivalTime: 02 Jun 2021 12:31:25.0120 (UTC)
 FILETIME=[33D2DC00:01D757AB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.613, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------7E5723C6AB5726BA2F221AC1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 01/06/2021 18:46, Fabiano Rosas wrote:
> This patch introduces a new way to dispatch the emulated interrupts in
> powerpc_excp. It leverages the QEMU object model to store the
> implementations for each interrupt and link them to their identifier
> from POWERPC_EXCP enum. The processor-specific code then uses this
> identifier to register which interrupts it supports.
>
> Interrupts now come out of the big switch in powerpc_excp into their
> own functions:
>
>    static void ppc_intr_system_reset(<args>)
>    {
>        /*
>         * Interrupt code. Sets any specific registers and MSR bits.
>         */
>    }
>    PPC_DEFINE_INTR(POWERPC_EXCP_RESET, system_reset, "System reset");
>
>    ^This line registers the interrupt with QOM.
>
> When we initialize the emulated processor, the correct set of
> interrupts is instantiated (pretty much like we already do):
>
>    static void init_excp_POWER9(CPUPPCState *env)
>    {
>        ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
>        (...)
>    }
>
> When it comes the time to inject the interrupt:
>
>    static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>    {
>        (...)
>
>        intr = &env->entry_points[excp];
>        intr->setup_regs(<args>);    <-- ppc_intr_system_reset function
>
>        (...)
>        env->spr[srr0] = nip;
>        env->spr[srr1] = msr;
>
>        env->nip = intr->addr;
>        env->msr = new_msr;
>    }
>
> Some points to notice:
>
> - The structure for the new PPCInterrupt class object is stored
>    directly inside of CPUPPCState (env) so the translation code can
>    still access it linearly at an offset.
>
> - Some interrupts were being registered for P7/8/9/10 but were never
>    implemented (i.e. not in the powerpc_excp switch statement). They
>    are likely never triggered. We now get the benefit of QOM warning in
>    such cases:
>
>    qemu-system-ppc64: missing object type 'POWERPC_EXCP_SDOOR'
>    qemu-system-ppc64: missing object type 'POWERPC_EXCP_HV_MAINT'
>
> - The code currently allows for Program interrupts to be ignored and
>    System call interrupts to be directed to the vhyp hypercall code. I
>    have added an 'ignore' flag to deal with these two cases and return
>    early from powerpc_excp.
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---

I don't see anything really wrong with the code itself, but this patch 
should probably be broken up into at least 2, one for the code motion 
and another for the ppc_intr'ification of the exception model.

>   target/ppc/cpu.h         |  29 +-
>   target/ppc/cpu_init.c    | 640 +++++++++++++++++++--------------------
>   target/ppc/excp_helper.c | 545 ++-------------------------------
>   target/ppc/interrupts.c  | 638 ++++++++++++++++++++++++++++++++++++++
>   target/ppc/machine.c     |   2 +-
>   target/ppc/meson.build   |   1 +
>   target/ppc/ppc_intr.h    |  55 ++++
>   target/ppc/translate.c   |   3 +-
>   8 files changed, 1066 insertions(+), 847 deletions(-)
>   create mode 100644 target/ppc/interrupts.c
>   create mode 100644 target/ppc/ppc_intr.h
>
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index b0934d9be4..012677965f 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -174,6 +174,33 @@ enum {
>       POWERPC_EXCP_TRAP          = 0x40,
>   };
>   
> +typedef struct PPCInterrupt PPCInterrupt;
> +typedef struct ppc_intr_args ppc_intr_args;
> +typedef void (*ppc_intr_fn_t)(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                              int excp_model, ppc_intr_args *regs,
> +                              bool *ignore);
> +
> +struct ppc_intr_args {
> +    target_ulong nip;
> +    target_ulong msr;
> +    target_ulong new_nip;
> +    target_ulong new_msr;
> +    int sprn_srr0;
> +    int sprn_srr1;
> +    int sprn_asrr0;
> +    int sprn_asrr1;
> +    int lev;
> +};
> +
This part also has me a bit confused. Why define it first in 
excp_helper.c in the last patch just to move it to here now?
> +struct PPCInterrupt {
> +    Object parent;
> +
> +    int id;
> +    const char *name;
> +    target_ulong addr;
> +    ppc_intr_fn_t setup_regs;
> +};
> +
>   #define PPC_INPUT(env) ((env)->bus_model)
>   
>   /*****************************************************************************/
> @@ -1115,7 +1142,7 @@ struct CPUPPCState {
>       uint32_t irq_input_state;
>       void **irq_inputs;
>   
> -    target_ulong excp_vectors[POWERPC_EXCP_NB]; /* Exception vectors */
> +    PPCInterrupt entry_points[POWERPC_EXCP_NB];
>       target_ulong excp_prefix;
>       target_ulong ivor_mask;
>       target_ulong ivpr_mask;
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index d0411e7302..d91183357d 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -46,6 +46,7 @@
>   #include "helper_regs.h"
>   #include "internal.h"
>   #include "spr_tcg.h"
> +#include "ppc_intr.h"
>   
>   /* #define PPC_DEBUG_SPR */
>   /* #define USE_APPLE_GDB */
> @@ -2132,16 +2133,16 @@ static void register_8xx_sprs(CPUPPCState *env)
>   static void init_excp_4xx_real(CPUPPCState *env)
>   {
>   #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_PIT]      = 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00001010;
> -    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00001020;
> -    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00002000;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_CRITICAL);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_PIT);
> +    ppc_intr_add(env, 0x00001010, POWERPC_EXCP_FIT);
> +    ppc_intr_add(env, 0x00001020, POWERPC_EXCP_WDT);
> +    ppc_intr_add(env, 0x00002000, POWERPC_EXCP_DEBUG);
>       env->ivor_mask = 0x0000FFF0UL;
>       env->ivpr_mask = 0xFFFF0000UL;
>       /* Hardware reset vector */
<snip>
> @@ -2624,8 +2625,8 @@ static void init_excp_POWER9(CPUPPCState *env)
>       init_excp_POWER8(env);
>   
>   #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_HVIRT]    = 0x00000EA0;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] = 0x00017000;
> +    ppc_intr_add(env, 0x00000EA0, POWERPC_EXCP_HVIRT);
> +    ppc_intr_add(env, 0x00017000, POWERPC_EXCP_SYSCALL_VECTORED);
>   #endif
>   }
Not sure if this is possible, but if this bit can be done separately as 
an earlier patch, it would make reviewing a lot easier.
>   
> @@ -8375,13 +8376,8 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>       PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>       CPUPPCState *env = &cpu->env;
>   #if !defined(CONFIG_USER_ONLY)
> -    int i;
>   
>       env->irq_inputs = NULL;
> -    /* Set all exception vectors to an invalid address */
> -    for (i = 0; i < POWERPC_EXCP_NB; i++) {
> -        env->excp_vectors[i] = (target_ulong)(-1ULL);
> -    }
We don't need to use this to set invalid values?
>       env->ivor_mask = 0x00000000;
>       env->ivpr_mask = 0x00000000;
>       /* Default MMU definitions */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 12bf829c8f..26cbfab923 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -29,14 +29,6 @@
>   #endif
>   
>   /* #define DEBUG_OP */
> -/* #define DEBUG_SOFTWARE_TLB */
> -/* #define DEBUG_EXCEPTIONS */
> -
> -#ifdef DEBUG_EXCEPTIONS
> -#  define LOG_EXCP(...) qemu_log(__VA_ARGS__)
> -#else
> -#  define LOG_EXCP(...) do { } while (0)
> -#endif
>   
>   /*****************************************************************************/
>   /* Exception processing */
<snip>
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e16a2721e2..2c82bda8cc 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -951,7 +951,8 @@ void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
>       TCGv t0 = tcg_temp_new();
>       tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivor_mask));
>       tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> -    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_offs]));
> +    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, entry_points[sprn_offs]) +
> +                  offsetof(PPCInterrupt, addr));
>       gen_store_spr(sprn, t0);
>       tcg_temp_free(t0);
>   }
Other than that, from what I can see, looks ok
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------7E5723C6AB5726BA2F221AC1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01/06/2021 18:46, Fabiano Rosas
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210601214649.785647-6-farosas@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">This patch introduces a new way to dispatch the emulated interrupts in
powerpc_excp. It leverages the QEMU object model to store the
implementations for each interrupt and link them to their identifier
from POWERPC_EXCP enum. The processor-specific code then uses this
identifier to register which interrupts it supports.

Interrupts now come out of the big switch in powerpc_excp into their
own functions:

  static void ppc_intr_system_reset(&lt;args&gt;)
  {
      /*
       * Interrupt code. Sets any specific registers and MSR bits.
       */
  }
  PPC_DEFINE_INTR(POWERPC_EXCP_RESET, system_reset, "System reset");

  ^This line registers the interrupt with QOM.

When we initialize the emulated processor, the correct set of
interrupts is instantiated (pretty much like we already do):

  static void init_excp_POWER9(CPUPPCState *env)
  {
      ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
      (...)
  }

When it comes the time to inject the interrupt:

  static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
  {
      (...)

      intr = &amp;env-&gt;entry_points[excp];
      intr-&gt;setup_regs(&lt;args&gt;);    &lt;-- ppc_intr_system_reset function

      (...)
      env-&gt;spr[srr0] = nip;
      env-&gt;spr[srr1] = msr;

      env-&gt;nip = intr-&gt;addr;
      env-&gt;msr = new_msr;
  }

Some points to notice:

- The structure for the new PPCInterrupt class object is stored
  directly inside of CPUPPCState (env) so the translation code can
  still access it linearly at an offset.

- Some interrupts were being registered for P7/8/9/10 but were never
  implemented (i.e. not in the powerpc_excp switch statement). They
  are likely never triggered. We now get the benefit of QOM warning in
  such cases:

  qemu-system-ppc64: missing object type 'POWERPC_EXCP_SDOOR'
  qemu-system-ppc64: missing object type 'POWERPC_EXCP_HV_MAINT'

- The code currently allows for Program interrupts to be ignored and
  System call interrupts to be directed to the vhyp hypercall code. I
  have added an 'ignore' flag to deal with these two cases and return
  early from powerpc_excp.

Signed-off-by: Fabiano Rosas <a class="moz-txt-link-rfc2396E" href="mailto:farosas@linux.ibm.com">&lt;farosas@linux.ibm.com&gt;</a>
---</pre>
    </blockquote>
    <p>I don't see anything really wrong with the code itself, but this
      patch should probably be broken up into at least 2, one for the
      code motion and another for the ppc_intr'ification of the
      exception model.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20210601214649.785647-6-farosas@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
 target/ppc/cpu.h         |  29 +-
 target/ppc/cpu_init.c    | 640 +++++++++++++++++++--------------------
 target/ppc/excp_helper.c | 545 ++-------------------------------
 target/ppc/interrupts.c  | 638 ++++++++++++++++++++++++++++++++++++++
 target/ppc/machine.c     |   2 +-
 target/ppc/meson.build   |   1 +
 target/ppc/ppc_intr.h    |  55 ++++
 target/ppc/translate.c   |   3 +-
 8 files changed, 1066 insertions(+), 847 deletions(-)
 create mode 100644 target/ppc/interrupts.c
 create mode 100644 target/ppc/ppc_intr.h

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b0934d9be4..012677965f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -174,6 +174,33 @@ enum {
     POWERPC_EXCP_TRAP          = 0x40,
 };
 
+typedef struct PPCInterrupt PPCInterrupt;
+typedef struct ppc_intr_args ppc_intr_args;
+typedef void (*ppc_intr_fn_t)(PowerPCCPU *cpu, PPCInterrupt *intr,
+                              int excp_model, ppc_intr_args *regs,
+                              bool *ignore);
+
+struct ppc_intr_args {
+    target_ulong nip;
+    target_ulong msr;
+    target_ulong new_nip;
+    target_ulong new_msr;
+    int sprn_srr0;
+    int sprn_srr1;
+    int sprn_asrr0;
+    int sprn_asrr1;
+    int lev;
+};
+</pre>
    </blockquote>
    This part also has me a bit confused. Why define it first in
    excp_helper.c in the last patch just to move it to here now?<br>
    <blockquote type="cite"
      cite="mid:20210601214649.785647-6-farosas@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
+struct PPCInterrupt {
+    Object parent;
+
+    int id;
+    const char *name;
+    target_ulong addr;
+    ppc_intr_fn_t setup_regs;
+};
+
 #define PPC_INPUT(env) ((env)-&gt;bus_model)
 
 /*****************************************************************************/
@@ -1115,7 +1142,7 @@ struct CPUPPCState {
     uint32_t irq_input_state;
     void **irq_inputs;
 
-    target_ulong excp_vectors[POWERPC_EXCP_NB]; /* Exception vectors */
+    PPCInterrupt entry_points[POWERPC_EXCP_NB];
     target_ulong excp_prefix;
     target_ulong ivor_mask;
     target_ulong ivpr_mask;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d0411e7302..d91183357d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -46,6 +46,7 @@
 #include "helper_regs.h"
 #include "internal.h"
 #include "spr_tcg.h"
+#include "ppc_intr.h"
 
 /* #define PPC_DEBUG_SPR */
 /* #define USE_APPLE_GDB */
@@ -2132,16 +2133,16 @@ static void register_8xx_sprs(CPUPPCState *env)
 static void init_excp_4xx_real(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env-&gt;excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000100;
-    env-&gt;excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
-    env-&gt;excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
-    env-&gt;excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
-    env-&gt;excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
-    env-&gt;excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
-    env-&gt;excp_vectors[POWERPC_EXCP_PIT]      = 0x00001000;
-    env-&gt;excp_vectors[POWERPC_EXCP_FIT]      = 0x00001010;
-    env-&gt;excp_vectors[POWERPC_EXCP_WDT]      = 0x00001020;
-    env-&gt;excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00002000;
+    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_CRITICAL);
+    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
+    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
+    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
+    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
+    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
+    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_PIT);
+    ppc_intr_add(env, 0x00001010, POWERPC_EXCP_FIT);
+    ppc_intr_add(env, 0x00001020, POWERPC_EXCP_WDT);
+    ppc_intr_add(env, 0x00002000, POWERPC_EXCP_DEBUG);
     env-&gt;ivor_mask = 0x0000FFF0UL;
     env-&gt;ivpr_mask = 0xFFFF0000UL;
     /* Hardware reset vector */</pre>
    </blockquote>
    &lt;snip&gt;
    <blockquote type="cite"
      cite="mid:20210601214649.785647-6-farosas@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">@@ -2624,8 +2625,8 @@ static void init_excp_POWER9(CPUPPCState *env)
     init_excp_POWER8(env);
 
 #if !defined(CONFIG_USER_ONLY)
-    env-&gt;excp_vectors[POWERPC_EXCP_HVIRT]    = 0x00000EA0;
-    env-&gt;excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] = 0x00017000;
+    ppc_intr_add(env, 0x00000EA0, POWERPC_EXCP_HVIRT);
+    ppc_intr_add(env, 0x00017000, POWERPC_EXCP_SYSCALL_VECTORED);
 #endif
 }</pre>
    </blockquote>
    Not sure if this is possible, but if this bit can be done separately
    as an earlier patch, it would make reviewing a lot easier.<br>
    <blockquote type="cite"
      cite="mid:20210601214649.785647-6-farosas@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
 
@@ -8375,13 +8376,8 @@ static void init_ppc_proc(PowerPCCPU *cpu)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &amp;cpu-&gt;env;
 #if !defined(CONFIG_USER_ONLY)
-    int i;
 
     env-&gt;irq_inputs = NULL;
-    /* Set all exception vectors to an invalid address */
-    for (i = 0; i &lt; POWERPC_EXCP_NB; i++) {
-        env-&gt;excp_vectors[i] = (target_ulong)(-1ULL);
-    }</pre>
    </blockquote>
    We don't need to use this to set invalid values?<br>
    <blockquote type="cite"
      cite="mid:20210601214649.785647-6-farosas@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
     env-&gt;ivor_mask = 0x00000000;
     env-&gt;ivpr_mask = 0x00000000;
     /* Default MMU definitions */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 12bf829c8f..26cbfab923 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -29,14 +29,6 @@
 #endif
 
 /* #define DEBUG_OP */
-/* #define DEBUG_SOFTWARE_TLB */
-/* #define DEBUG_EXCEPTIONS */
-
-#ifdef DEBUG_EXCEPTIONS
-#  define LOG_EXCP(...) qemu_log(__VA_ARGS__)
-#else
-#  define LOG_EXCP(...) do { } while (0)
-#endif
 
 /*****************************************************************************/
 /* Exception processing */
</pre>
    </blockquote>
    &lt;snip&gt;<br>
    <blockquote type="cite"
      cite="mid:20210601214649.785647-6-farosas@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e16a2721e2..2c82bda8cc 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -951,7 +951,8 @@ void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
     TCGv t0 = tcg_temp_new();
     tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivor_mask));
     tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
-    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_offs]));
+    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, entry_points[sprn_offs]) +
+                  offsetof(PPCInterrupt, addr));
     gen_store_spr(sprn, t0);
     tcg_temp_free(t0);
 }
</pre>
    </blockquote>
    Other than that, from what I can see, looks ok<br>
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

--------------7E5723C6AB5726BA2F221AC1--

