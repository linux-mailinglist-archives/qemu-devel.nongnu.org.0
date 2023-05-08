Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEDA6FAFB3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:13:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvzim-0008Og-6c; Mon, 08 May 2023 08:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1pvzij-0008OW-Ve
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:12:01 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1pvzif-0008KQ-8m
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:11:59 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 8 May 2023 09:11:53 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id EB0508001CA;
 Mon,  8 May 2023 09:11:52 -0300 (-03)
Message-ID: <5e24eb88-8ad0-a46d-a571-3965acb4164f@eldorado.org.br>
Date: Mon, 8 May 2023 09:11:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] target/ppc: Fix fallback to MFSS for MFFS*
 instructions on pre 3.0 ISAs
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230506065240.3177798-1-richard.purdie@linuxfoundation.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20230506065240.3177798-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 08 May 2023 12:11:53.0667 (UTC)
 FILETIME=[46CF1130:01D981A6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.802,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/05/2023 03:52, Richard Purdie wrote:
> The following commits changed the code such that the fallback to MFSS for MFFSCRN,
> MFFSCRNI, MFFSCE and MFFSL on pre 3.0 ISAs was removed and became an illegal instruction:
> 
>    bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
>    394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
>    3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree
> 
> The hardware will handle them as a MFFS instruction as the code did previously.
> This means applications that were segfaulting under qemu when encountering these
> instructions which is used in glibc libm functions for example.
> 
> The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.
> 
> This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
> as the hardware decoder would, fixing the segfaulting libm code. It and also ensures
> the MFSS instruction is used for currently reserved bits to handle other potential
> ISA additions more correctly.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   target/ppc/insn32.decode           | 19 ++++++++++++-------
>   target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++------
>   2 files changed, 36 insertions(+), 13 deletions(-)
> 
> v2 - switch to use decodetree pattern groups per feedback
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index f8f589e9fd..3c4e2c2fc2 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -390,13 +390,18 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
> 
>   ### Move To/From FPSCR
> 
> -MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
> -MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
> -MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
> -MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
> -MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
> -MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
> -MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
> +{
> +  # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be ignored
> +  [
> +    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
> +    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
> +    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
> +    MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
> +    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
> +    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
> +  ]
> +  MFFS            111111 ..... ----- ----- 1001000111 .   @X_t_rc
> +}
> 
>   ### Decimal Floating-Point Arithmetic Instructions
> 
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
> index 57d8437851..10dfd91aa4 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
>   {
>       TCGv_i64 fpscr;
> 
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> +        return false;
> +    }
> +
>       REQUIRE_FPU(ctx);
> 
>       gen_reset_fpstatus();
> @@ -597,7 +600,10 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
>   {
>       TCGv_i64 t1, fpscr;
> 
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> +        return false;
> +    }
> +
>       REQUIRE_FPU(ctx);
> 
>       t1 = tcg_temp_new_i64();
> @@ -614,7 +620,10 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
>   {
>       TCGv_i64 t1, fpscr;
> 
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> +        return false;
> +    }
> +
>       REQUIRE_FPU(ctx);
> 
>       t1 = tcg_temp_new_i64();
> @@ -631,7 +640,10 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
>   {
>       TCGv_i64 t1, fpscr;
> 
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> +        return false;
> +    }
> +
>       REQUIRE_FPU(ctx);
> 
>       t1 = tcg_temp_new_i64();
> @@ -647,7 +659,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
>   {
>       TCGv_i64 t1, fpscr;
> 
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> +        return false;
> +    }
> +
>       REQUIRE_FPU(ctx);
> 
>       t1 = tcg_temp_new_i64();
> @@ -661,7 +676,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
> 
>   static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
>   {
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> +        return false;
> +    }
> +
>       REQUIRE_FPU(ctx);
> 
>       gen_reset_fpstatus();
> --
> 2.39.2
> 

As mention in the v1 thread, we should validate bits 11~15 on Power ISA 
v3.0+ to follow what the ISA says and keep the same behavior as the 
hardware. Again, sorry for the delayed response.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


