Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8361C488886
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:39:49 +0100 (CET)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Ug0-0000Ee-Kf
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:39:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTt-0005al-Cd
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:17 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55782
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTo-0006MC-O4
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:17 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E466B62E84;
 Sun,  9 Jan 2022 17:26:50 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720411; bh=4J32nN0Q5fsFU4O/nrB6gLH3CaW2PGO3kvaxrfPs5rE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=oUSKR25hSguulWpbNmRzwFBS78fRkexQL5/uq3O9UsRVQg4qi7CYKUD5IyqB55WlI
 SpN50rOFzt+pH/p80kknSVZd+yFUbXufO7kKGimMZ52ld4OGWD+SG9qCARu/vTtmr7
 LysBBOkzYvp4UZg1CZJz1v0cWJPsm8zqmaNGJGkw=
Message-ID: <5bade3dd-798e-7bee-73ab-a957ab1a3937@xen0n.name>
Date: Sun, 9 Jan 2022 17:26:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [RFC PATCH v4 12/30] target/loongarch: Add timer related
 instructions support.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-13-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220108091419.2027710-13-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 philmd@redhat.com, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/8/22 17:14, Xiaojuan Yang wrote:
> This includes:
> -RDTIME{L/H}.W
> -RDTIME.D
>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/helper.h                     |  1 +
>   target/loongarch/insn_trans/trans_extra.c.inc | 32 +++++++++++++++++++
>   target/loongarch/op_helper.c                  |  6 ++++
>   target/loongarch/translate.c                  |  2 ++
>   4 files changed, 41 insertions(+)
>
> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
> index c916f2650b..035bd141ed 100644
> --- a/target/loongarch/helper.h
> +++ b/target/loongarch/helper.h
> @@ -116,4 +116,5 @@ DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
>   DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
>   DEF_HELPER_1(ertn, void, env)
>   DEF_HELPER_1(idle, void, env)
> +DEF_HELPER_1(rdtime_d, i64, env)
Are we missing rdtimel_w and rdtimeh_w here?
>   #endif /* !CONFIG_USER_ONLY */
> diff --git a/target/loongarch/insn_trans/trans_extra.c.inc b/target/loongarch/insn_trans/trans_extra.c.inc
> index 2ce95d3382..8d3425ba61 100644
> --- a/target/loongarch/insn_trans/trans_extra.c.inc
> +++ b/target/loongarch/insn_trans/trans_extra.c.inc
> @@ -33,22 +33,54 @@ static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
>       return true;
>   }
>   
> +#ifndef CONFIG_USER_ONLY
> +static bool gen_rdtime(DisasContext *ctx, arg_rr *a,
> +                       bool word, bool high)
> +{
> +    TCGv dst1 = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv dst2 = gpr_dst(ctx, a->rj, EXT_NONE);
> +
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_rdtime_d(dst1, cpu_env);
> +    if (word) {
> +        tcg_gen_sextract_tl(dst1, dst1, high ? 32 : 0, 32);
> +    }
> +    tcg_gen_ld_i64(dst2, cpu_env, offsetof(CPULoongArchState, CSR_TID));
> +
> +    return true;
> +}
> +#endif
> +
>   static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
>   {
> +#ifdef CONFIG_USER_ONLY
>       tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
>       return true;
> +#else
> +    return gen_rdtime(ctx, a, 1, 0);
> +#endif
>   }
>   
>   static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
>   {
> +#ifdef CONFIG_USER_ONLY
>       tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
>       return true;
> +#else
> +    return gen_rdtime(ctx, a, 1, 1);
> +#endif
>   }
>   
>   static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
>   {
> +#ifdef CONFIG_USER_ONLY
>       tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
>       return true;
> +#else
> +    return gen_rdtime(ctx, a, 0, 0);
> +#endif
>   }
>   
>   static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
> diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
> index 6f9742054a..1d8b501ab9 100644
> --- a/target/loongarch/op_helper.c
> +++ b/target/loongarch/op_helper.c
> @@ -133,4 +133,10 @@ void helper_idle(CPULoongArchState *env)
>        */
>       do_raise_exception(env, EXCP_HLT, 0);
>   }
> +
> +uint64_t helper_rdtime_d(CPULoongArchState *env)
> +{
> +     LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
> +     return cpu_loongarch_get_constant_timer_counter(cpu);
> +}
>   #endif /* !CONFIG_USER_ONLY */
> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
> index ddb97661fa..53a5ef3aa9 100644
> --- a/target/loongarch/translate.c
> +++ b/target/loongarch/translate.c
> @@ -25,6 +25,8 @@ static TCGv cpu_lladdr, cpu_llval;
>   TCGv_i32 cpu_fcsr0;
>   TCGv_i64 cpu_fpr[32];
>   
> +#include "exec/gen-icount.h"
> +
>   #define DISAS_STOP       DISAS_TARGET_0
>   #define DISAS_EXIT       DISAS_TARGET_1
>   

