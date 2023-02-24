Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782646A1BA2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 12:54:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVWe7-0002Rs-HJ; Fri, 24 Feb 2023 06:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWe5-0002Rb-Uc
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:53:49 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWe4-0000n4-DB
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:53:49 -0500
Received: by mail-oi1-x234.google.com with SMTP id bm20so15105271oib.7
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 03:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MvqvB85GzyImxzc9FrUa6+WYjCjVHIFrMy6ScFOPlaQ=;
 b=mOssgRsovPy2KzeX/HQ3Z3qaEbgnAnasoElPOtfhKOhQdj0xG/4yC8IUHopFYHPiE3
 JlcgBnk+jAlR+S1rmJcFKZWx+H7DYSmhM0AGifjc8z1SGj8yEqLqPbbqs9iaGb4sIA5w
 bRno5J9d1DWCSff8B8N3H3TltaDdJFbTtTELtQWe6CWEE2ec0jXNLvavEWcXOr7YsGXl
 Zurgr61yvwFfS7qOpoKZ+5KLghHdyDCs4Kvg9Vp8KAiEFxM5QCD/jVyplWTWdx00sM9+
 +H+MqG1brzBdIANm36uftuXPzjg8+iwme7xq4gDRaMAOGG7mQVfyqhfNs2PlvMMrXwvm
 YjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MvqvB85GzyImxzc9FrUa6+WYjCjVHIFrMy6ScFOPlaQ=;
 b=n1wnRA2QEbyBlRQDcQCZvW+gyfZAMmprUOABjKFPb2cTpLJDk8KMe5zSGLyJ6H0/OE
 /xYantQRpFANNXK82wngERu7SL32lGa8Mar75qdcpMpVTOuDWoPttLREUSHDJ8k6cPv+
 dCjGASPbnghnXFC2kw4u/ooXJ7spJmEM1cskZsVqFmYpUzFLFcRHan2kKbA6C0E9tbXG
 WYRVcbOJWl5wEXOw2CgSkKxZa19f9J+zzIRA37yLpmGFMtCUwJzyztOBwCPXuavVMStm
 0CeydMBRMJnBbuTxOd0mEnMmIA6nEOBJqpuWRyDGSkcA2Wd4X99wst+PgK8ziZlF90eG
 4++g==
X-Gm-Message-State: AO0yUKVlGZ6uTHSZgBfBQXlTQ9ncjEByC/UCemjwjPEeU8OTNJ6ICX2U
 qEu2E8fNb8OHJgEFBk4KHZ///w==
X-Google-Smtp-Source: AK7set+W44SiiK714B58TasCHofncdX4GcD7co/i/RwSxCcSQ3EKO8X2oNgz0NIbIqpnxf5UheSu9A==
X-Received: by 2002:a05:6808:2981:b0:37f:8776:7fb with SMTP id
 ex1-20020a056808298100b0037f877607fbmr5592679oib.24.1677239627125; 
 Fri, 24 Feb 2023 03:53:47 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f?
 ([2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a056870d38700b00172899830dasm1186696oag.4.2023.02.24.03.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:53:46 -0800 (PST)
Message-ID: <3bf0d629-14ac-6837-4481-fb3fc56330df@ventanamicro.com>
Date: Fri, 24 Feb 2023 08:53:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 5/6] target/riscv: Add *envcfg.HADE related check in
 address translation
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
 <20230224040852.37109-6-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230224040852.37109-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 2/24/23 01:08, Weiwei Li wrote:
> When menvcfg.HADE is 1, hardware updating of PTE A/D bits is enabled
> during single-stage address translation. When the hypervisor extension is
> implemented, if menvcfg.HADE is 1, hardware updating of PTE A/D bits is
> enabled during G-stage address translation.
> 
> Set *envcfg.HADE default true for backward compatibility.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c        | 6 ++++--
>   target/riscv/cpu_helper.c | 6 ++++++
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2d99679f2f..b81ab65de5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -613,8 +613,10 @@ static void riscv_cpu_reset_hold(Object *obj)
>       env->bins = 0;
>       env->two_stage_lookup = false;
>   
> -    env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0);
> -    env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0);
> +    env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0) |
> +                   (cpu->cfg.ext_svadu ? MENVCFG_HADE : 0);
> +    env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0) |
> +                   (cpu->cfg.ext_svadu ? HENVCFG_HADE : 0);
>   
>       /* Initialized default priorities of local interrupts. */
>       for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 552c0f0b58..9e122ee92a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -937,9 +937,11 @@ restart:
>           }
>   
>           bool pbmte = env->menvcfg & MENVCFG_PBMTE;
> +        bool hade = env->menvcfg & MENVCFG_HADE;
>   
>           if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
>               pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
> +            hade = hade && (env->henvcfg & HENVCFG_HADE);
>           }
>   
>           if (riscv_cpu_sxl(env) == MXL_RV32) {
> @@ -998,6 +1000,10 @@ restart:
>   
>               /* Page table updates need to be atomic with MTTCG enabled */
>               if (updated_pte != pte) {
> +                if (!hade) {
> +                    return TRANSLATE_FAIL;
> +                }
> +
>                   /*
>                    * - if accessed or dirty bits need updating, and the PTE is
>                    *   in RAM, then we do so atomically with a compare and swap.

