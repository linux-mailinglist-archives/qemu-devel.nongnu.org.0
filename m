Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E837D41F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:13:36 +0200 (CEST)
Received: from localhost ([::1]:42384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvEd-0008H7-0e
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lguaS-0002So-5X; Wed, 12 May 2021 15:32:04 -0400
Received: from [201.28.113.2] (port=10267 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lguaM-0004J4-Vw; Wed, 12 May 2021 15:32:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 16:31:55 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 477C98000C2;
 Wed, 12 May 2021 16:31:55 -0300 (-03)
Subject: Re: [PATCH v4 08/31] target/ppc: Replace POWERPC_EXCP_SYNC with
 DISAS_EXIT
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-9-matheus.ferst@eldorado.org.br>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <975ea0e6-ce2d-d847-df80-07593f0a7ca5@eldorado.org.br>
Date: Wed, 12 May 2021 16:31:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512185441.3619828-9-matheus.ferst@eldorado.org.br>
Content-Type: multipart/alternative;
 boundary="------------28C840EBDF66DC2462518B36"
Content-Language: en-US
X-OriginalArrivalTime: 12 May 2021 19:31:55.0609 (UTC)
 FILETIME=[77B13490:01D74765]
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
Cc: lagarcia@br.ibm.com, luis.pires@eldorado.org.br,
 richard.henderson@linaro.org, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------28C840EBDF66DC2462518B36
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/05/2021 15:54, matheus.ferst@eldorado.org.br wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>
> Remove the synthetic "exception" after no more uses.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/cpu.h       |  1 -
>   target/ppc/translate.c | 27 +++++++++------------------
>   2 files changed, 9 insertions(+), 19 deletions(-)
>
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 98fcf1c4d6..503de6db85 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -135,7 +135,6 @@ enum {
>       POWERPC_EXCP_STOP         = 0x200, /* stop translation                   */
>       POWERPC_EXCP_BRANCH       = 0x201, /* branch instruction                 */
>       /* QEMU exceptions: special cases we want to stop translation            */
> -    POWERPC_EXCP_SYNC         = 0x202, /* context synchronizing instruction  */
>       POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
>   };
>   
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 4bebb00bb2..88fe24ef95 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -359,14 +359,6 @@ static inline void gen_stop_exception(DisasContext *ctx)
>       ctx->exception = POWERPC_EXCP_STOP;
>   }
>   
> -#ifndef CONFIG_USER_ONLY
> -/* No need to update nip here, as execution flow will change */
> -static inline void gen_sync_exception(DisasContext *ctx)
> -{
> -    ctx->exception = POWERPC_EXCP_SYNC;
> -}
> -#endif
> -
>   /*****************************************************************************/
>   /* SPR READ/WRITE CALLBACKS */
>   
> @@ -5035,7 +5027,7 @@ static void gen_rfi(DisasContext *ctx)
>       }
>       gen_update_cfar(ctx, ctx->cia);
>       gen_helper_rfi(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp = DISAS_EXIT;
>   #endif
>   }
>   
> @@ -5052,7 +5044,7 @@ static void gen_rfid(DisasContext *ctx)
>       }
>       gen_update_cfar(ctx, ctx->cia);
>       gen_helper_rfid(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp = DISAS_EXIT;
>   #endif
>   }
>   
> @@ -5069,7 +5061,7 @@ static void gen_rfscv(DisasContext *ctx)
>       }
>       gen_update_cfar(ctx, ctx->cia);
>       gen_helper_rfscv(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp = DISAS_EXIT;
>   #endif
>   }
>   #endif
> @@ -5082,7 +5074,7 @@ static void gen_hrfid(DisasContext *ctx)
>       /* Restore CPU state */
>       CHK_HV;
>       gen_helper_hrfid(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp = DISAS_EXIT;
>   #endif
>   }
>   #endif
> @@ -6923,7 +6915,7 @@ static void gen_rfsvc(DisasContext *ctx)
>       CHK_SV;
>   
>       gen_helper_rfsvc(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp = DISAS_EXIT;
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -7303,7 +7295,7 @@ static void gen_rfci_40x(DisasContext *ctx)
>       CHK_SV;
>       /* Restore CPU state */
>       gen_helper_40x_rfci(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp = DISAS_EXIT;
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -7315,7 +7307,7 @@ static void gen_rfci(DisasContext *ctx)
>       CHK_SV;
>       /* Restore CPU state */
>       gen_helper_rfci(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp = DISAS_EXIT;
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -7330,7 +7322,7 @@ static void gen_rfdi(DisasContext *ctx)
>       CHK_SV;
>       /* Restore CPU state */
>       gen_helper_rfdi(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp = DISAS_EXIT;
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -7343,7 +7335,7 @@ static void gen_rfmci(DisasContext *ctx)
>       CHK_SV;
>       /* Restore CPU state */
>       gen_helper_rfmci(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp = DISAS_EXIT;
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> @@ -9429,7 +9421,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>           case POWERPC_EXCP_BRANCH:
>               ctx->base.is_jmp = DISAS_NORETURN;
>               break;
> -        case POWERPC_EXCP_SYNC:
>           case POWERPC_EXCP_STOP:
>               ctx->base.is_jmp = DISAS_EXIT;
>               break;
Reviewed-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------28C840EBDF66DC2462518B36
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/05/2021 15:54,
      <a class="moz-txt-link-abbreviated" href="mailto:matheus.ferst@eldorado.org.br">matheus.ferst@eldorado.org.br</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210512185441.3619828-9-matheus.ferst@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">From: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>

Remove the synthetic "exception" after no more uses.

Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Signed-off-by: Matheus Ferst <a class="moz-txt-link-rfc2396E" href="mailto:matheus.ferst@eldorado.org.br">&lt;matheus.ferst@eldorado.org.br&gt;</a>
---
 target/ppc/cpu.h       |  1 -
 target/ppc/translate.c | 27 +++++++++------------------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 98fcf1c4d6..503de6db85 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -135,7 +135,6 @@ enum {
     POWERPC_EXCP_STOP         = 0x200, /* stop translation                   */
     POWERPC_EXCP_BRANCH       = 0x201, /* branch instruction                 */
     /* QEMU exceptions: special cases we want to stop translation            */
-    POWERPC_EXCP_SYNC         = 0x202, /* context synchronizing instruction  */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
 };
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 4bebb00bb2..88fe24ef95 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -359,14 +359,6 @@ static inline void gen_stop_exception(DisasContext *ctx)
     ctx-&gt;exception = POWERPC_EXCP_STOP;
 }
 
-#ifndef CONFIG_USER_ONLY
-/* No need to update nip here, as execution flow will change */
-static inline void gen_sync_exception(DisasContext *ctx)
-{
-    ctx-&gt;exception = POWERPC_EXCP_SYNC;
-}
-#endif
-
 /*****************************************************************************/
 /* SPR READ/WRITE CALLBACKS */
 
@@ -5035,7 +5027,7 @@ static void gen_rfi(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx-&gt;cia);
     gen_helper_rfi(cpu_env);
-    gen_sync_exception(ctx);
+    ctx-&gt;base.is_jmp = DISAS_EXIT;
 #endif
 }
 
@@ -5052,7 +5044,7 @@ static void gen_rfid(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx-&gt;cia);
     gen_helper_rfid(cpu_env);
-    gen_sync_exception(ctx);
+    ctx-&gt;base.is_jmp = DISAS_EXIT;
 #endif
 }
 
@@ -5069,7 +5061,7 @@ static void gen_rfscv(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx-&gt;cia);
     gen_helper_rfscv(cpu_env);
-    gen_sync_exception(ctx);
+    ctx-&gt;base.is_jmp = DISAS_EXIT;
 #endif
 }
 #endif
@@ -5082,7 +5074,7 @@ static void gen_hrfid(DisasContext *ctx)
     /* Restore CPU state */
     CHK_HV;
     gen_helper_hrfid(cpu_env);
-    gen_sync_exception(ctx);
+    ctx-&gt;base.is_jmp = DISAS_EXIT;
 #endif
 }
 #endif
@@ -6923,7 +6915,7 @@ static void gen_rfsvc(DisasContext *ctx)
     CHK_SV;
 
     gen_helper_rfsvc(cpu_env);
-    gen_sync_exception(ctx);
+    ctx-&gt;base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7303,7 +7295,7 @@ static void gen_rfci_40x(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_40x_rfci(cpu_env);
-    gen_sync_exception(ctx);
+    ctx-&gt;base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7315,7 +7307,7 @@ static void gen_rfci(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfci(cpu_env);
-    gen_sync_exception(ctx);
+    ctx-&gt;base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7330,7 +7322,7 @@ static void gen_rfdi(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfdi(cpu_env);
-    gen_sync_exception(ctx);
+    ctx-&gt;base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -7343,7 +7335,7 @@ static void gen_rfmci(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfmci(cpu_env);
-    gen_sync_exception(ctx);
+    ctx-&gt;base.is_jmp = DISAS_EXIT;
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -9429,7 +9421,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         case POWERPC_EXCP_BRANCH:
             ctx-&gt;base.is_jmp = DISAS_NORETURN;
             break;
-        case POWERPC_EXCP_SYNC:
         case POWERPC_EXCP_STOP:
             ctx-&gt;base.is_jmp = DISAS_EXIT;
             break;
</pre>
    </blockquote>
    <div class="moz-signature">Reviewed-by: Bruno Larsen (billionai)
      <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a><br>
    </div>
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

--------------28C840EBDF66DC2462518B36--

