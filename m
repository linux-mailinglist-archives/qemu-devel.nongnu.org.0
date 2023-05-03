Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C016F589B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:09:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCE9-0006wT-Ir; Wed, 03 May 2023 09:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puCE6-0006vs-JN
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:08:59 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puCE4-0003N8-HS
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FL0JsrieTbmfasnsFGDNy0Jv8fdr7OUCtLlj0A/Rh9U=; b=S0+FXMiW7ax95a7AbJ3JwfLuDt
 72qQZMeBxTQ2qeGyvc3xyvXHVResRbAsyfBt3B9nBsMC65Or+ebS2fhsU0fNraGexy9XI+BN545hw
 q9UQmBoAc6MsBlJn54wj/xFpapb/FD1fQheAaFGiQJpk+UDgBOm6eaXPkjAyRwjfG5hc=;
Message-ID: <b93063d6-3162-db59-5a16-3613cceadec0@rev.ng>
Date: Wed, 3 May 2023 15:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 4/9] target/m68k: Finish conversion to
 tcg_gen_qemu_{ld,st}_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, laurent@vivier.eu, philmd@linaro.org, jiaxun.yang@flygoat.com,
 david@redhat.com, iii@linux.ibm.com, thuth@redhat.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com, jcmvbkbc@gmail.com
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-5-richard.henderson@linaro.org>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230502135741.1158035-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 5/2/23 15:57, Richard Henderson wrote:
> Convert away from the old interface with the implicit
> MemOp argument.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 76 ++++++++++++++---------------------------
>   1 file changed, 25 insertions(+), 51 deletions(-)
>
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 422f4652f1..744eb3748b 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -304,23 +304,14 @@ static inline void gen_addr_fault(DisasContext *s)
>   static inline TCGv gen_load(DisasContext *s, int opsize, TCGv addr,
>                               int sign, int index)
>   {
> -    TCGv tmp;
> -    tmp = tcg_temp_new_i32();
> -    switch(opsize) {
> +    TCGv tmp = tcg_temp_new_i32();
> +
> +    switch (opsize) {
>       case OS_BYTE:
> -        if (sign)
> -            tcg_gen_qemu_ld8s(tmp, addr, index);
> -        else
> -            tcg_gen_qemu_ld8u(tmp, addr, index);
> -        break;
>       case OS_WORD:
> -        if (sign)
> -            tcg_gen_qemu_ld16s(tmp, addr, index);
> -        else
> -            tcg_gen_qemu_ld16u(tmp, addr, index);
> -        break;
>       case OS_LONG:
> -        tcg_gen_qemu_ld32u(tmp, addr, index);
> +        tcg_gen_qemu_ld_tl(tmp, addr, index,
> +                           opsize | (sign ? MO_SIGN : 0) | MO_TE);
>           break;
>       default:
>           g_assert_not_reached();
> @@ -332,15 +323,11 @@ static inline TCGv gen_load(DisasContext *s, int opsize, TCGv addr,
>   static inline void gen_store(DisasContext *s, int opsize, TCGv addr, TCGv val,
>                                int index)
>   {
> -    switch(opsize) {
> +    switch (opsize) {
>       case OS_BYTE:
> -        tcg_gen_qemu_st8(val, addr, index);
> -        break;
>       case OS_WORD:
> -        tcg_gen_qemu_st16(val, addr, index);
> -        break;
>       case OS_LONG:
> -        tcg_gen_qemu_st32(val, addr, index);
> +        tcg_gen_qemu_st_tl(val, addr, index, opsize | MO_TE);
>           break;
>       default:
>           g_assert_not_reached();
> @@ -971,23 +958,16 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
>       tmp = tcg_temp_new();
>       switch (opsize) {
>       case OS_BYTE:
> -        tcg_gen_qemu_ld8s(tmp, addr, index);
> -        gen_helper_exts32(cpu_env, fp, tmp);
> -        break;
>       case OS_WORD:
> -        tcg_gen_qemu_ld16s(tmp, addr, index);
> -        gen_helper_exts32(cpu_env, fp, tmp);
> -        break;
> -    case OS_LONG:

Accidental label removal?


> -        tcg_gen_qemu_ld32u(tmp, addr, index);
> +        tcg_gen_qemu_ld_tl(tmp, addr, index, opsize | MO_SIGN | MO_TE);
>           gen_helper_exts32(cpu_env, fp, tmp);
>           break;
>       case OS_SINGLE:
> -        tcg_gen_qemu_ld32u(tmp, addr, index);
> +        tcg_gen_qemu_ld_tl(tmp, addr, index, MO_TEUL);
>           gen_helper_extf32(cpu_env, fp, tmp);
>           break;
>       case OS_DOUBLE:
> -        tcg_gen_qemu_ld64(t64, addr, index);
> +        tcg_gen_qemu_ld_i64(t64, addr, index, MO_TEUQ);
>           gen_helper_extf64(cpu_env, fp, t64);
>           break;
>       case OS_EXTENDED:
> @@ -995,11 +975,11 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
>               gen_exception(s, s->base.pc_next, EXCP_FP_UNIMP);
>               break;
>           }
> -        tcg_gen_qemu_ld32u(tmp, addr, index);
> +        tcg_gen_qemu_ld_i32(tmp, addr, index, MO_TEUL);

tcg_gen_qemu_ld_tl


>           tcg_gen_shri_i32(tmp, tmp, 16);
>           tcg_gen_st16_i32(tmp, fp, offsetof(FPReg, l.upper));
>           tcg_gen_addi_i32(tmp, addr, 4);
> -        tcg_gen_qemu_ld64(t64, tmp, index);
> +        tcg_gen_qemu_ld_i64(t64, tmp, index, MO_TEUQ);
>           tcg_gen_st_i64(t64, fp, offsetof(FPReg, l.lower));
>           break;
>       case OS_PACKED:
> @@ -1024,24 +1004,18 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
>       tmp = tcg_temp_new();
>       switch (opsize) {
>       case OS_BYTE:
> -        gen_helper_reds32(tmp, cpu_env, fp);
> -        tcg_gen_qemu_st8(tmp, addr, index);
> -        break;
>       case OS_WORD:
> -        gen_helper_reds32(tmp, cpu_env, fp);
> -        tcg_gen_qemu_st16(tmp, addr, index);
> -        break;
>       case OS_LONG:
>           gen_helper_reds32(tmp, cpu_env, fp);
> -        tcg_gen_qemu_st32(tmp, addr, index);
> +        tcg_gen_qemu_st_tl(tmp, addr, index, opsize | MO_TE);
>           break;
>       case OS_SINGLE:
>           gen_helper_redf32(tmp, cpu_env, fp);
> -        tcg_gen_qemu_st32(tmp, addr, index);
> +        tcg_gen_qemu_st_tl(tmp, addr, index, MO_TEUL);
>           break;
>       case OS_DOUBLE:
>           gen_helper_redf64(t64, cpu_env, fp);
> -        tcg_gen_qemu_st64(t64, addr, index);
> +        tcg_gen_qemu_st_i64(t64, addr, index, MO_TEUQ);
>           break;
>       case OS_EXTENDED:
>           if (m68k_feature(s->env, M68K_FEATURE_CF_FPU)) {
> @@ -1050,10 +1024,10 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
>           }
>           tcg_gen_ld16u_i32(tmp, fp, offsetof(FPReg, l.upper));
>           tcg_gen_shli_i32(tmp, tmp, 16);
> -        tcg_gen_qemu_st32(tmp, addr, index);
> +        tcg_gen_qemu_st_i32(tmp, addr, index, MO_TEUL);

tcg_gen_qemu_st_tl


>           tcg_gen_addi_i32(tmp, addr, 4);
>           tcg_gen_ld_i64(t64, fp, offsetof(FPReg, l.lower));
> -        tcg_gen_qemu_st64(t64, tmp, index);
> +        tcg_gen_qemu_st_i64(t64, tmp, index, MO_TEUQ);
>           break;
>       case OS_PACKED:
>           /*
> @@ -2079,14 +2053,14 @@ DISAS_INSN(movep)
>       if (insn & 0x80) {
>           for ( ; i > 0 ; i--) {
>               tcg_gen_shri_i32(dbuf, reg, (i - 1) * 8);
> -            tcg_gen_qemu_st8(dbuf, abuf, IS_USER(s));
> +            tcg_gen_qemu_st_i32(dbuf, abuf, IS_USER(s), MO_UB);

tcg_gen_qemu_st_tl


Otherwise:

Reviewed-by: Anton Johansson <anjo@rev.ng>


