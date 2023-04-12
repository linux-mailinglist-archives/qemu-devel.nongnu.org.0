Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5336DFF88
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:20:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmgwi-0007Vq-B5; Wed, 12 Apr 2023 16:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgwf-0007TU-A4
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:19:57 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgwd-0005Nh-9B
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:19:57 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-187878a90e6so1186949fac.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681330794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mtDT1s8ytycY5s/f+gsLv+bsMbAt90FdENmVDqAC+Og=;
 b=LHMphMCkiAIoGIqz2ukUu0vx+Z5J0caaKsSmwI1yFBjELWrQkJntklW3vhm6DzNzCs
 xdUw0S0kFr20dEkNj7AomZsYBPLm6zki5ttBodN4N+O0NUSusz1VkXssLS41be5Ef3De
 3zlfIScfuIQBcMLmme1EF7XjfS2Bcvh2QYbWvSGkVCms2w4fgNxKBHBQGhOmauC+UV4Y
 IthwUmJ7w3hrO+bdHNIX8l9EKf5AsXJzGY0vrSb/lOithJeGarkmmBYy4oBoYoByA63R
 WkDBEMh4mDdphA4D8ABzdvQ5H1tpkT7YvnmiVDJB9s4deaAPgoWtw+2TpO4XaZ7nbaCi
 w3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681330794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mtDT1s8ytycY5s/f+gsLv+bsMbAt90FdENmVDqAC+Og=;
 b=j1zJgwLUxGPQKw57ZFJri0f4bpxyeu+M7RZPowJNYG/cIny/PzyH4ZamtK4UOJ/LfI
 dxh8i58M2BYLeB5F7tX9EnOqbbnHsyWBmyyMOr2ygu5jMq8EqPk4orWrWtyt0+1doTZ5
 ITcn+K/0RKiVueMrOo/qd3k0swKfEUFyHPG4OmYExHH9CMs/sXhErX6fH/a+BfLyj/88
 Kue7QGNg+fC44Fr0hTxJGBiniFUJpbl0gQD6OmI/zCZ0JGzzuZ7rbanXP9ssPqHTOydf
 4WAjLFriEDVTaGuTkSAJmYPfgVIE3883c77M50OtCxcmAt6G4H7WST5pOHhhrNt+JMyG
 Ne7g==
X-Gm-Message-State: AAQBX9eZVB7nrfqhj0vavppiSb0yAXZ6nk2WrZeIDZXhoQbM3z0bZCuF
 TzIWFN3BzjsX186VLu1Bw8sTiw==
X-Google-Smtp-Source: AKy350bCfOmzpT7XWVMM6IvUKpdUL+kx2jAPcWNK1HuQPwHfLtQKVJfwSymobSTJWmA+JOijwHRt5Q==
X-Received: by 2002:a05:6870:b6a7:b0:184:8286:a5cf with SMTP id
 cy39-20020a056870b6a700b001848286a5cfmr47189oab.13.1681330793953; 
 Wed, 12 Apr 2023 13:19:53 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a4aa9cd000000b00524f381f681sm7349518oon.27.2023.04.12.13.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 13:19:53 -0700 (PDT)
Message-ID: <695c5a2d-a354-b71a-7c6a-6e31db290ae0@ventanamicro.com>
Date: Wed, 12 Apr 2023 17:19:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 43/54] tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-44-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230411010512.5375-44-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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



On 4/10/23 22:05, Richard Henderson wrote:
> Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
> and tcg_out_st_helper_args.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/riscv/tcg-target.c.inc | 37 ++++++++++---------------------------
>   1 file changed, 10 insertions(+), 27 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index d4134bc86f..425ea8902e 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -994,14 +994,14 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
>       label->label_ptr[0] = label_ptr[0];
>   }
>   
> +/* We have three temps, we might as well expose them. */
> +static const TCGLdstHelperParam ldst_helper_param = {
> +    .ntmp = 3, .tmp = { TCG_REG_TMP0, TCG_REG_TMP1, TCG_REG_TMP2 }
> +};
> +
>   static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>   {
> -    MemOpIdx oi = l->oi;
> -    MemOp opc = get_memop(oi);
> -    TCGReg a0 = tcg_target_call_iarg_regs[0];
> -    TCGReg a1 = tcg_target_call_iarg_regs[1];
> -    TCGReg a2 = tcg_target_call_iarg_regs[2];
> -    TCGReg a3 = tcg_target_call_iarg_regs[3];
> +    MemOp opc = get_memop(l->oi);
>   
>       /* resolve label address */
>       if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
> @@ -1009,13 +1009,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>       }
>   
>       /* call load helper */
> -    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
> -    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
> -    tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
> -    tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
> -
> +    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
>       tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
> -    tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
> +    tcg_out_ld_helper_ret(s, l, true, &ldst_helper_param);
>   
>       tcg_out_goto(s, l->raddr);
>       return true;
> @@ -1023,14 +1019,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>   
>   static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>   {
> -    MemOpIdx oi = l->oi;
> -    MemOp opc = get_memop(oi);
> -    MemOp s_bits = opc & MO_SIZE;
> -    TCGReg a0 = tcg_target_call_iarg_regs[0];
> -    TCGReg a1 = tcg_target_call_iarg_regs[1];
> -    TCGReg a2 = tcg_target_call_iarg_regs[2];
> -    TCGReg a3 = tcg_target_call_iarg_regs[3];
> -    TCGReg a4 = tcg_target_call_iarg_regs[4];
> +    MemOp opc = get_memop(l->oi);
>   
>       /* resolve label address */
>       if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
> @@ -1038,13 +1027,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>       }
>   
>       /* call store helper */
> -    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
> -    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
> -    tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, a2,
> -                   l->type, s_bits, l->datalo_reg);
> -    tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
> -    tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
> -
> +    tcg_out_st_helper_args(s, l, &ldst_helper_param);
>       tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
>   
>       tcg_out_goto(s, l->raddr);

