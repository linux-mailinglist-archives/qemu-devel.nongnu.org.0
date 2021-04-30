Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC036FBC9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:53:36 +0200 (CEST)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTaJ-0008SP-CR
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lcSlG-0001Lb-Dh; Fri, 30 Apr 2021 09:00:50 -0400
Received: from [201.28.113.2] (port=18734 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lcSlA-0005UE-JC; Fri, 30 Apr 2021 09:00:50 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 10:00:40 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id ECF078013C2;
 Fri, 30 Apr 2021 10:00:39 -0300 (-03)
Subject: Re: [PATCH v3 17/30] target/ppc: Remove DisasContext.exception
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-18-richard.henderson@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <42925c13-ec33-0e88-e4f0-c6a10ce91f82@eldorado.org.br>
Date: Fri, 30 Apr 2021 10:00:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430011543.1017113-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Apr 2021 13:00:40.0383 (UTC)
 FILETIME=[D268FCF0:01D73DC0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/2021 22:15, Richard Henderson wrote:
> Now that we have removed all of the fake exceptions, and all real
> exceptions exit via DISAS_NORETURN, we can remove this field.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/translate.c | 22 ++--------------------
>   1 file changed, 2 insertions(+), 20 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 276a4a2a79..d78071a4a4 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -259,15 +259,12 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
>        * These are all synchronous exceptions, we set the PC back to the
>        * faulting instruction
>        */
> -    if (ctx->exception == POWERPC_EXCP_NONE) {
> -        gen_update_nip(ctx, ctx->cia);
> -    }
> +    gen_update_nip(ctx, ctx->cia);
>       t0 = tcg_const_i32(excp);
>       t1 = tcg_const_i32(error);
>       gen_helper_raise_exception_err(cpu_env, t0, t1);
>       tcg_temp_free_i32(t0);
>       tcg_temp_free_i32(t1);
> -    ctx->exception = excp;
>       ctx->base.is_jmp = DISAS_NORETURN;
>   }
>   
> @@ -279,13 +276,10 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
>        * These are all synchronous exceptions, we set the PC back to the
>        * faulting instruction
>        */
> -    if (ctx->exception == POWERPC_EXCP_NONE) {
> -        gen_update_nip(ctx, ctx->cia);
> -    }
> +    gen_update_nip(ctx, ctx->cia);
>       t0 = tcg_const_i32(excp);
>       gen_helper_raise_exception(cpu_env, t0);
>       tcg_temp_free_i32(t0);
> -    ctx->exception = excp;
>       ctx->base.is_jmp = DISAS_NORETURN;
>   }
>   
> @@ -298,7 +292,6 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
>       t0 = tcg_const_i32(excp);
>       gen_helper_raise_exception(cpu_env, t0);
>       tcg_temp_free_i32(t0);
> -    ctx->exception = excp;
>       ctx->base.is_jmp = DISAS_NORETURN;
>   }
>   
> @@ -7919,7 +7912,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       CPUPPCState *env = cs->env_ptr;
>       int bound;
>   
> -    ctx->exception = POWERPC_EXCP_NONE;
>       ctx->spr_cb = env->spr_cb;
>       ctx->pr = msr_pr;
>       ctx->mem_idx = env->dmmu_idx;
> @@ -8067,16 +8059,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>                    "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
>                    opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
>       }
> -
> -    if (ctx->base.is_jmp == DISAS_NEXT) {
> -        switch (ctx->exception) {
> -        case POWERPC_EXCP_NONE:
> -            break;
> -        default:
> -            /* Every other ctx->exception should have set NORETURN. */
> -            g_assert_not_reached();
> -        }
> -    }
>   }
>   
>   static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
> 

You removed the uses, but left the field.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

