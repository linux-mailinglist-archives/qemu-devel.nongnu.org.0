Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FB46DC747
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 15:29:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plrZv-00058m-IW; Mon, 10 Apr 2023 09:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plrZs-00054f-N1
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:29:00 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plrZn-00073A-3l
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:29:00 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-184549428acso1816795fac.8
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 06:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681133321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=94ISA3Kt4k+7aYHeTe+2qTZKOclVi23kssQQHK/4Ads=;
 b=FbQpP3Cf2gPxB16XS2Xxue445NIrZ09nvD1AmnlhsCHfQF7z7f2oKiwzExEl2kRzIT
 cGtT5LBnD3p8+7v1sxdCXWWMPa8NuoVVr8wuJr0GutvSdQFWoEmeU/b3TYL64f1XBTGS
 TxjcxBQ1ZXucgkAiWi4wW8KtQZgsQ6ZTBVVRmoEfWAsUxzHG2NduVpJjb9FXnU5WG2n4
 OIgEAPOLBOcFPzKuw2c9s0Ygym4Ft+nVJVFZf7ribdZQhcAKtDZSEqfQGEl95pkwP9XA
 2d8CraNPPPFb3nOspNbUDaBVycbxp0USZzxCFHL+T1S86Ycjd3wy+M7j6c5sAU/XjTBJ
 KpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681133321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=94ISA3Kt4k+7aYHeTe+2qTZKOclVi23kssQQHK/4Ads=;
 b=y0SXJFmvMmqxysK1hCZ8tJtTtkXZrBB87cPAMFiNZTbY0plWg0Css5fFIqME5wS/yn
 BD1ZslN3QtO0luUn2W59hvHm+hNsKenxLp1o8WQ5ZWx3IrnEail3+XpghJnOSyb48Smf
 iT7RXHB4P174lQ5baGQO6cP1weZbq4zgL4c5pVtfK7rYEufa67u7FsRgH/dp1TVFBOGL
 357HlfU12WW9KPJGfep7iQX00xW7DCPmg/9dzGBmfZzfPh3mqDxLDBjfak/QAinii/6n
 G09kfU1YWuAsxQzMjpT/qYEAgNuCHHjAhyHMRIPD8nAoqMx1k8AaHkxOQ0bOzNsVNrh5
 EKUg==
X-Gm-Message-State: AAQBX9cStmzn5R6YkIToc822RwVUz4uNcxrLwIzq6geVaeDt6k6NyuGw
 kI+HJzT1vnGh66n9gdpLAFj7vQ==
X-Google-Smtp-Source: AKy350ZVkW+l6iLU2zlfq6nJTto8WpUrMBbGlG3iAFzO8rw2sqKKEFHHwaXy7ovTkVo6riNHk4udYA==
X-Received: by 2002:a05:6870:9687:b0:183:f65c:8c41 with SMTP id
 o7-20020a056870968700b00183f65c8c41mr5870705oaq.15.1681133321434; 
 Mon, 10 Apr 2023 06:28:41 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 bd16-20020a056871b31000b0016e8726f0d4sm4070108oac.3.2023.04.10.06.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 06:28:41 -0700 (PDT)
Message-ID: <14b6c764-4667-a032-33c7-da0521de6f09@ventanamicro.com>
Date: Mon, 10 Apr 2023 10:28:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] target/riscv: Add set_implicit_extensions_from_ext()
 function
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230410033526.31708-1-liweiwei@iscas.ac.cn>
 <20230410033526.31708-2-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230410033526.31708-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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



On 4/10/23 00:35, Weiwei Li wrote:
> Move multi-letter extensions that may implicitly enabled from misa.EXT
> alone to prepare for following separation of implicitly enabled and
> explicitly enabled extensions.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Regardless of what we end up doing with patch 2 I believe this is a good
separation to have.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 56 +++++++++++++++++++++++++---------------------
>   1 file changed, 31 insertions(+), 25 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cb68916fce..abb65d41b1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -809,6 +809,35 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>       }
>   }
>   
> +static void set_implicit_extensions_from_ext(RISCVCPU *cpu)
> +{
> +
> +    /* The V vector extension depends on the Zve64d extension */
> +    if (cpu->cfg.ext_v) {
> +        cpu->cfg.ext_zve64d = true;
> +    }
> +
> +    /* The Zve64d extension depends on the Zve64f extension */
> +    if (cpu->cfg.ext_zve64d) {
> +        cpu->cfg.ext_zve64f = true;
> +    }
> +
> +    /* The Zve64f extension depends on the Zve32f extension */
> +    if (cpu->cfg.ext_zve64f) {
> +        cpu->cfg.ext_zve32f = true;
> +    }
> +
> +    if (cpu->cfg.ext_c) {
> +        cpu->cfg.ext_zca = true;
> +        if (cpu->cfg.ext_f && cpu->env.misa_mxl_max == MXL_RV32) {
> +            cpu->cfg.ext_zcf = true;
> +        }
> +        if (cpu->cfg.ext_d) {
> +            cpu->cfg.ext_zcd = true;
> +        }
> +    }
> +}
> +
>   /*
>    * Check consistency between chosen extensions while setting
>    * cpu->cfg accordingly, doing a set_misa() in the end.
> @@ -833,6 +862,8 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_ifencei = true;
>       }
>   
> +    set_implicit_extensions_from_ext(cpu);
> +
>       if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>           error_setg(errp,
>                      "I and E extensions are incompatible");
> @@ -886,21 +917,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    /* The V vector extension depends on the Zve64d extension */
> -    if (cpu->cfg.ext_v) {
> -        cpu->cfg.ext_zve64d = true;
> -    }
> -
> -    /* The Zve64d extension depends on the Zve64f extension */
> -    if (cpu->cfg.ext_zve64d) {
> -        cpu->cfg.ext_zve64f = true;
> -    }
> -
> -    /* The Zve64f extension depends on the Zve32f extension */
> -    if (cpu->cfg.ext_zve64f) {
> -        cpu->cfg.ext_zve32f = true;
> -    }
> -
>       if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
>           error_setg(errp, "Zve64d/V extensions require D extension");
>           return;
> @@ -956,16 +972,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           }
>       }
>   
> -    if (cpu->cfg.ext_c) {
> -        cpu->cfg.ext_zca = true;
> -        if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
> -            cpu->cfg.ext_zcf = true;
> -        }
> -        if (cpu->cfg.ext_d) {
> -            cpu->cfg.ext_zcd = true;
> -        }
> -    }
> -
>       if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
>           error_setg(errp, "Zcf extension is only relevant to RV32");
>           return;

