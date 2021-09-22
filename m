Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE34147D4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:32:34 +0200 (CEST)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0UL-00089M-Fo
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mT0Mn-0005hB-VG; Wed, 22 Sep 2021 07:24:45 -0400
Received: from [201.28.113.2] (port=29306 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mT0Mm-0000b9-5z; Wed, 22 Sep 2021 07:24:45 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 22 Sep 2021 08:24:42 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 21EBC8014D2;
 Wed, 22 Sep 2021 08:24:42 -0300 (-03)
Subject: Re: [PATCH v3 03/15] target/ppc: PMU basic cycle count for pseries TCG
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-4-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <fa7aa371-3fa0-e064-cf73-1c89508bba00@eldorado.org.br>
Date: Wed, 22 Sep 2021 08:24:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903203116.80628-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Sep 2021 11:24:42.0572 (UTC)
 FILETIME=[706280C0:01D7AFA4]
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
Cc: richard.henderson@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 17:31, Daniel Henrique Barboza wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> This patch adds the barebones of the PMU logic by enabling cycle
> counting, done via the performance monitor counter 6. The overall logic
> goes as follows:
> 
> - a helper is added to control the PMU state on each MMCR0 write. This
> allows for the PMU to start/stop as the frozen counter bit (MMCR0_FC)
> is cleared or set;
> 
> - MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
> having to spin the PMU right at system init;
> 
> - the intended usage is to freeze the counters by setting MMCR0_FC, do
> any additional setting of events to be counted via MMCR1 (not
> implemented yet) and enable the PMU by zeroing MMCR0_FC. Software must
> freeze counters to read the results - on the fly reading of the PMCs
> will return the starting value of each one.
> 
> Since there will be more PMU exclusive code to be added next, put the
> PMU logic in its own helper to keep all in the same place. The name of
> the new helper file, power8_pmu.c, is an indicative that the PMU logic
> has been tested with the IBM POWER chip family, POWER8 being the oldest
> version tested. This doesn't mean that this PMU logic will break with
> any other PPC64 chip that implements Book3s, but since we can't assert
> that this PMU will work with all available Book3s emulated processors
> we're choosing to be explicit.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

<snip>

> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 0babde3131..c3e2e3d329 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -401,6 +401,24 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
>       spr_store_dump_spr(sprn);
>   }
> 
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    /*
> +     * helper_store_mmcr0 will make clock based operations that
> +     * will cause 'bad icount read' errors if we do not execute
> +     * gen_icount_io_start() beforehand.
> +     */
> +    gen_icount_io_start(ctx);
> +    gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
> +}
> +#else
> +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +#endif
> +
>   #if !defined(CONFIG_USER_ONLY)
>   void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
>   {
> @@ -596,7 +614,10 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
>       tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
>       /* Keep all other bits intact */
>       tcg_gen_or_tl(t1, t1, t0);
> -    gen_store_spr(SPR_POWER_MMCR0, t1);
> +
> +    /* Overwrite cpu_gpr[gprn] and use spr_write_MMCR0() */
> +    tcg_gen_mov_tl(cpu_gpr[gprn], t1);
> +    spr_write_MMCR0(ctx, sprn + 0x10, gprn);

IIUC, this makes writing to MMCR0 change the GPR value and expose the 
unfiltered content of the SPR to problem state. It might be better to 
call the helper directly or create another method that takes a TCGv as 
an argument and call it from spr_write_MMCR0_ureg and spr_write_MMCR0.

> 
>       tcg_temp_free(t0);
>       tcg_temp_free(t1);
> --
> 2.31.1
> 


-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

