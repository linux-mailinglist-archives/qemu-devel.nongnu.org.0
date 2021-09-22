Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD44147C7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:27:59 +0200 (CEST)
Received: from localhost ([::1]:53898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0Pu-0006JL-Gg
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mT0M3-00059o-W2; Wed, 22 Sep 2021 07:24:00 -0400
Received: from [201.28.113.2] (port=1187 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mT0M1-0008KX-TO; Wed, 22 Sep 2021 07:23:59 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 22 Sep 2021 08:23:51 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6B4208014D2;
 Wed, 22 Sep 2021 08:23:51 -0300 (-03)
Subject: Re: [PATCH v3 01/15] target/ppc: add user read functions for MMCR0
 and MMCR2
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-2-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <f628b376-8535-7297-a38f-aa243373e86b@eldorado.org.br>
Date: Wed, 22 Sep 2021 08:23:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903203116.80628-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Sep 2021 11:23:51.0973 (UTC)
 FILETIME=[5239B550:01D7AFA4]
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 17:31, Daniel Henrique Barboza wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> From: Gustavo Romero <gromero@linux.ibm.com>
> 
> We're going to add PMU support for TCG PPC64 chips, based on IBM POWER8+
> emulation and following PowerISA v3.1.
> 
> Let's start by handling the user read of UMMCR0 and UMMCR2. According to
> PowerISA 3.1 these registers omit some of its bits from userspace.
> 
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/cpu.h       | 10 ++++++++++
>   target/ppc/cpu_init.c  |  4 ++--
>   target/ppc/spr_tcg.h   |  2 ++
>   target/ppc/translate.c | 37 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 500205229c..f68bb8d8aa 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -342,6 +342,16 @@ typedef struct ppc_v3_pate_t {
>   #define MSR_RI   1  /* Recoverable interrupt                        1        */
>   #define MSR_LE   0  /* Little-endian mode                           1 hflags */
> 
> +/* PMU bits */
> +#define MMCR0_FC    PPC_BIT(32)         /* Freeze Counters  */
> +#define MMCR0_PMAO  PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
> +#define MMCR0_PMAE  PPC_BIT(37)         /* Perf Monitor Alert Enable */
> +#define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
> +#define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
> +#define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> +/* MMCR0 userspace r/w mask */
> +#define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
> +
>   /* LPCR bits */
>   #define LPCR_VPM0         PPC_BIT(0)
>   #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index ad7abc6041..9efc6c2d87 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6867,7 +6867,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
>   static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>   {
>       spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_MMCR0_ureg, SPR_NOACCESS,
>                    &spr_read_ureg, &spr_write_ureg,
>                    0x00000000);
>       spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> @@ -6975,7 +6975,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
>   static void register_power8_pmu_user_sprs(CPUPPCState *env)
>   {
>       spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_MMCR2_ureg, SPR_NOACCESS,
>                    &spr_read_ureg, &spr_write_ureg,
>                    0x00000000);
>       spr_register(env, SPR_POWER_USIER, "USIER",
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 0be5f347d5..30cb6c3fdc 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -32,6 +32,8 @@ void spr_write_lr(DisasContext *ctx, int sprn, int gprn);
>   void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
>   void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
>   void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
>   void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
>   void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
>   void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 171b216e17..b2ead144d1 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -519,6 +519,43 @@ void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
>       gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
>   }
> 
> +void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +
> +    /*
> +     * Filter out all bits but FC, PMAO, and PMAE, according
> +     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
> +     * fourth paragraph.
> +     */
> +    gen_load_spr(t0, SPR_POWER_MMCR0);
> +    tcg_gen_andi_tl(t0, t0, MMCR0_UREG_MASK);
> +    tcg_gen_mov_tl(cpu_gpr[gprn], t0);

 From the other patches, it seems that the focus is in the MMCR0[PMCC] = 
0b00 case, but I would note that the PMCC field description says that 
when MMCR0[PMCC] = 0b01, "Group A is not allowed to be read or written 
in problem state." If this case doesn't matter for this initial 
implementation, it'd be nice to leave a comment (XXX/TODO/etc.) saying 
that it's not handled. Otherwise, I think we'll need a helper or add 
both PMCC bits to hflags.

> +
> +    tcg_temp_free(t0);
> +}
> +
> +void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +
> +    /*
> +     * On read, filter out all bits that are not FCnP0 bits.
> +     * When MMCR0[PMCC] is set to 0b10 or 0b11, providing
> +     * problem state programs read/write access to MMCR2,
> +     * only the FCnP0 bits can be accessed. All other bits are
> +     * not changed when mtspr is executed in problem state, and
> +     * all other bits return 0s when mfspr is executed in problem
> +     * state, according to ISA v3.1, section 10.4.6 Monitor Mode
> +     * Control Register 2, p. 1316, third paragraph.
> +     */
> +    gen_load_spr(t0, SPR_POWER_MMCR2);
> +    tcg_gen_andi_tl(t0, t0, 0x4020100804020000UL);
> +    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
> +
> +    tcg_temp_free(t0);
> +}
> +
>   #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>   void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
>   {
> --
> 2.31.1
> 


-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

