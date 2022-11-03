Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FD5618A58
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 22:13:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqhUx-0005dW-Kq; Thu, 03 Nov 2022 17:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqhUk-0005dG-AT
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:11:26 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqhUi-0004P2-2m
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:11:25 -0400
Received: by mail-pg1-x535.google.com with SMTP id q1so2724229pgl.11
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 14:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LA2SPkYkjFkOyFejLOy3z5Lm9UbIywrJXG/aLzTuemQ=;
 b=XfXQJkz35wM90N/jGxoCaFiq5khP3Hialen7yV7mgUqH+2d8AkbYZxvsWY0GEnV7Rj
 uklyYqqnTpwRHTK7FRo0jVZSeHJJf20h5oaf5wbrEjhIu7ocWP8H/wjxhqu31ruKh9kr
 dVW9+dTi2f/dGo02LBK6Pj3+hj6SgUwyBv58meeiSB1lq6b1cPhXNQ6M4OASBZ59Jbxr
 o+MDySMXQgEYKV182rCpoy8gU/NtynQbQd5pKTj8MIhKshDZfSB8OXFNci1+IXiWOLYa
 Y/FBBhLKm0R0Sm8nIs11lG7Oe+u3V2lAI4ulGa0YpNLzzUY/uStThTSsteXvGDxiQwVY
 PQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LA2SPkYkjFkOyFejLOy3z5Lm9UbIywrJXG/aLzTuemQ=;
 b=fJSYtHH8zerNdUjpCa7yWxnhTQLp2SetQhkZtsaKNEuaOHPGFpWG3gJfnzTcYkqDz9
 VoGzLk2nOr10YSAJ8s2jYsBlt3jqOk87XnckJnlfr+uScAnRxY86DiiL49/ZZO2gW74y
 tGlUB5c7ugcR7ta4bc3JSIOTVezwmD7ZDqYW9Wvow9j6l0k8asPTfCuE5z9/Qy2MMZtV
 vHU4b0HH6vIHXj72BfrH/+DK5HXvbSTOdYC7U/DCZha6WMXRnaIq2hp0Clm6UAoW/XZm
 IfoUl2cHpbsf+rnx1+7mI3wzP4c88+294X7Ck5ut5GjUPe4xmif5kSE6LMfNf5KZcK1e
 j+KQ==
X-Gm-Message-State: ACrzQf3W7JSCghq7jalAQZuvvTzWto5xQ3laRlh7eHugwULbyz/kj7QQ
 2pkbGB9dHLNsohHkPwf2CR4BPA==
X-Google-Smtp-Source: AMsMyM7WlfumVU03xBeN6Cyo8vMAi2dHaTHJAOafj+rZXvnabrOZOHolmm9povzLUFXCAe0LWYzeHQ==
X-Received: by 2002:a05:6a00:1253:b0:56d:8742:a9ff with SMTP id
 u19-20020a056a00125300b0056d8742a9ffmr21891927pfi.5.1667509882171; 
 Thu, 03 Nov 2022 14:11:22 -0700 (PDT)
Received: from [192.168.229.227] ([206.83.113.103])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902b70500b00186748fe6ccsm1060223pls.214.2022.11.03.14.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 14:11:21 -0700 (PDT)
Message-ID: <514c0f75-8e89-9a65-01c1-0053961d5676@linaro.org>
Date: Fri, 4 Nov 2022 08:11:14 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] target/loongarch: Fix emulation of float-point disable
 exception
Content-Language: en-US
To: Rui Wang <wangrui@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 qemu-devel@nongnu.org, hev <qemu@hev.cc>
References: <20221103122551.152380-1-wangrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221103122551.152380-1-wangrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 23:25, Rui Wang wrote:
> +/*
> + * LoongArch CPUs hardware flags.
> + * bit[2..0] for MMU index.
> + * bit[7..4] for CSR.EUEN.{ BTE, ASXE, SXE, FPE }.
> + */
> +#define HW_FLAGS_MMU_MASK   0x07
> +#define HW_FLAGS_EUEN_FPE   0x10
> +
>   static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
>                                           target_ulong *pc,
>                                           target_ulong *cs_base,
> @@ -399,6 +408,10 @@ static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
>       *pc = env->pc;
>       *cs_base = 0;
>       *flags = cpu_mmu_index(env, false);
> +
> +    if (FIELD_EX64(env->CSR_EUEN, CSR_EUEN, FPE)) {
> +        *flags |= HW_FLAGS_EUEN_FPE;
> +    }
>   }
>   
>   void loongarch_cpu_list(void);
> diff --git a/target/loongarch/insn_trans/trans_farith.c.inc b/target/loongarch/insn_trans/trans_farith.c.inc
> index 7bb3f41aee..e2dec75dfb 100644
> --- a/target/loongarch/insn_trans/trans_farith.c.inc
> +++ b/target/loongarch/insn_trans/trans_farith.c.inc
> @@ -3,9 +3,22 @@
>    * Copyright (c) 2021 Loongson Technology Corporation Limited
>    */
>   
> +#ifndef CONFIG_USER_ONLY
> +#define CHECK_FPE do { \
> +    if ((ctx->base.tb->flags & HW_FLAGS_EUEN_FPE) == 0) { \
> +        generate_exception(ctx, EXCCODE_FPD); \
> +        return false; \
> +    } \
> +} while (0)
> +#else
> +#define CHECK_FPE
> +#endif

Oh excellent, you found the correct solution on your own.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

The only thing remaining from my comments on v1, which should be a separate patch, is to 
separate PG from PLV in tb->flags, so that the check

> --- a/target/loongarch/insn_trans/trans_privileged.c.inc
> +++ b/target/loongarch/insn_trans/trans_privileged.c.inc
> @@ -159,7 +159,7 @@ static const CSRInfo csr_info[] = {
>   
>   static bool check_plv(DisasContext *ctx)
>   {
> -    if (ctx->base.tb->flags == MMU_USER_IDX) {
> +    if (ctx->mem_idx == MMU_USER_IDX) {

here is correct.  I would suggest

#define HW_FLAGS_PLV_MASK   R_CSR_CRMD_PLV_MASK  /* 0x03 */
#define HW_FLAGS_CRMD_PG    R_CSR_CRMD_PG_MASK   /* 0x10 */
#define HW_FLAGS_EUEN_FPE   0x04

For cpu_get_tb_cpu_state

     *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
     *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, FPE) * HW_FLAGS_EUEN_FPE;

And for loongarch_tr_init_disas_context,

     ctx->plv = ctx->base.tb->flags & HW_FLAGS_PLV_MASK;
     if (ctx->base.tb->flags & HW_FLAGS_CRMD_PG_MASK) {
         ctx->mem_idx = ctx->plv;
     } else {
         ctx->mem_idx = MMU_DA_IDX;
     }


r~

