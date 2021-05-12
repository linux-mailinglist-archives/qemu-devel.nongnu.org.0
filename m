Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71B237D40B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:56:59 +0200 (CEST)
Received: from localhost ([::1]:35522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguyY-0000my-Ou
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lguQ6-0002lG-N4; Wed, 12 May 2021 15:21:23 -0400
Received: from [201.28.113.2] (port=3866 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lguQ2-00062C-M7; Wed, 12 May 2021 15:21:21 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 16:21:14 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id F114C8000C2;
 Wed, 12 May 2021 16:21:13 -0300 (-03)
Subject: Re: [PATCH v4 10/31] target/ppc: Introduce gen_icount_io_start
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-11-matheus.ferst@eldorado.org.br>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <18ff1d20-264e-125c-42ed-596f455ec5ad@eldorado.org.br>
Date: Wed, 12 May 2021 16:21:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210512185441.3619828-11-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 19:21:14.0330 (UTC)
 FILETIME=[F975CBA0:01D74763]
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 15:54, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Create a function to handle the details for interacting with icount.
> 
> Force the exit from the tb via DISAS_TOO_MANY, which allows chaining
> to the next tb, where the code emitted for gen_tb_start() will
> determine if we must exit.  We can thus remove any matching
> conditional call to gen_stop_exception.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate.c | 174 +++++++++--------------------------------
>   1 file changed, 39 insertions(+), 135 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 1c02e21a56..f6410dc76c 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -301,6 +301,20 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
>       ctx->base.is_jmp = DISAS_NORETURN;
>   }
>   
> +static void gen_icount_io_start(DisasContext *ctx)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +        /*
> +         * An I/O instruction must be last in the TB.
> +         * Chain to the next TB, and let the code from gen_tb_start
> +         * decide if we need to return to the main loop.
> +         * Doing this first also allows this value to be overridden.
> +         */
> +        ctx->base.is_jmp = DISAS_TOO_MANY;
> +    }
> +}
> +
>   /*
>    * Tells the caller what is the appropriate exception to generate and prepares
>    * SPR registers for this exception.
> @@ -538,24 +552,14 @@ static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
>   #if !defined(CONFIG_USER_ONLY)
>   static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   #endif
>   
> @@ -563,24 +567,14 @@ static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
>   /* Time base */
>   static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   ATTRIBUTE_UNUSED
> @@ -598,24 +592,14 @@ static void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
>   #if !defined(CONFIG_USER_ONLY)
>   static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   ATTRIBUTE_UNUSED
> @@ -634,80 +618,45 @@ static void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
>   ATTRIBUTE_UNUSED
>   static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   /* HDECR */
>   static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   #endif
> @@ -915,71 +864,41 @@ static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
>   #if !defined(CONFIG_USER_ONLY)
>   static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_store_spr(sprn, cpu_gpr[gprn]);
>       gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
>       /* We must stop translation as we may have rebooted */
>       gen_stop_exception(ctx);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   
>   static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
>   {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>   }
>   #endif
>   
> @@ -2863,18 +2782,13 @@ static void gen_darn(DisasContext *ctx)
>       if (l > 2) {
>           tcg_gen_movi_i64(cpu_gpr[rD(ctx->opcode)], -1);
>       } else {
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -        }
> +        gen_icount_io_start(ctx);
>           if (l == 0) {
>               gen_helper_darn32(cpu_gpr[rD(ctx->opcode)]);
>           } else {
>               /* Return 64-bit random for both CRN and RRN */
>               gen_helper_darn64(cpu_gpr[rD(ctx->opcode)]);
>           }
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_stop_exception(ctx);
> -        }
>       }
>   }
>   #endif
> @@ -5016,9 +4930,7 @@ static void gen_rfi(DisasContext *ctx)
>       }
>       /* Restore CPU state */
>       CHK_SV;
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_update_cfar(ctx, ctx->cia);
>       gen_helper_rfi(cpu_env);
>       ctx->base.is_jmp = DISAS_EXIT;
> @@ -5033,9 +4945,7 @@ static void gen_rfid(DisasContext *ctx)
>   #else
>       /* Restore CPU state */
>       CHK_SV;
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_update_cfar(ctx, ctx->cia);
>       gen_helper_rfid(cpu_env);
>       ctx->base.is_jmp = DISAS_EXIT;
> @@ -5050,9 +4960,7 @@ static void gen_rfscv(DisasContext *ctx)
>   #else
>       /* Restore CPU state */
>       CHK_SV;
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       gen_update_cfar(ctx, ctx->cia);
>       gen_helper_rfscv(cpu_env);
>       ctx->base.is_jmp = DISAS_EXIT;
> @@ -5382,9 +5290,7 @@ static void gen_mtmsrd(DisasContext *ctx)
>       CHK_SV;
>   
>   #if !defined(CONFIG_USER_ONLY)
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       if (ctx->opcode & 0x00010000) {
>           /* L=1 form only updates EE and RI */
>           TCGv t0 = tcg_temp_new();
> @@ -5419,9 +5325,7 @@ static void gen_mtmsr(DisasContext *ctx)
>       CHK_SV;
>   
>   #if !defined(CONFIG_USER_ONLY)
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>       if (ctx->opcode & 0x00010000) {
>           /* L=1 form only updates EE and RI */
>           TCGv t0 = tcg_temp_new();
> 

Sorry, I somehow changed the author by mistake, which must be
From: Richard Henderson <richard.henderson@linaro.org>

Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

