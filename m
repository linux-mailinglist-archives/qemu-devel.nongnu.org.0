Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF596DFFAF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:24:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmh0s-0001Ck-5X; Wed, 12 Apr 2023 16:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmh0q-0001C2-5i
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:24:16 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmh0o-0006Y4-6H
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:24:15 -0400
Received: by mail-oi1-x233.google.com with SMTP id bl22so26599602oib.11
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681331053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=djXHK7wE/n3jdX6m+OpWdumqm7OxdW35+/IgdxE2z1U=;
 b=UXTTtF9D7ZLQIOusBwI/gidt7WT2TRcFZHaPwsh5XATOlXmV/7wrl8ShPKNF9sfVOP
 XEwRrkNH7wG0e9F9BugNex+Fb2ArwW9aQTMz9+WFH59ETcoeExuM5ic2AeAYMbJAVgrb
 A2ns/CyPZla+b9dHQA0+ME63P8M01Co4H2Ea/8H1IJ2r25jTt+h8C1xjZrzSBWqlHlxz
 g2LwnZ5J7CrICfgMvh2bFZCQtlZmaJDX+OsVRhobwUkc3fDbyBVqTX9Whnj3CG3S9r4B
 19RLtkXbMYCgQhR1atRCZAuk9bME/cpngb0NBWtY2nB1vQrCY3Mns0zsR9ju8QoqI03q
 FDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681331053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djXHK7wE/n3jdX6m+OpWdumqm7OxdW35+/IgdxE2z1U=;
 b=XEksxg/Y53XtwDyCLaQX8S+/+d6OFG35hvShMFjdIT346be2MFwuN3Y9nYx/T3JwG/
 nhsWFxvCEn3Qq8ZiUanEGrzOFG9KVKIsI1b4TKFrci3RlV71PysGtY3ZXm1yxCESDGdP
 coszm6Hyc8kjUxhF+IS0klGhuMTjnk5atXmLwGPgJ4kkT2IbBjjJ/a4DTizKVefjA8SK
 Tke6PmDv756sUEBsmVwuDCZJFMCA9Jn4C76tytBbyZDX30olrad1OqAPti84hjNV14gM
 Julvd9FT1G/vzL3Lpzsf6j3xyuii4+hPHT2H9Ky72lElTiI+cEdiIR7/sFG3kLuYonbT
 7QUQ==
X-Gm-Message-State: AAQBX9f38kF3UrZHZNIbHHGu/qi8pOGlJOQQYl3AFQ/ahNSYvc8cpuFp
 6Lgrh81Wwqp1W1AbLkHlLrZcJQ==
X-Google-Smtp-Source: AKy350Zn2uzhbvuTUY2JoUbNsA6CnKOOhhNio854TjE4x0VMVOEsTRsqMnbCfe2vgBwSr7pneA2dkw==
X-Received: by 2002:a05:6808:4389:b0:389:4be5:d120 with SMTP id
 dz9-20020a056808438900b003894be5d120mr3824305oib.14.1681331053135; 
 Wed, 12 Apr 2023 13:24:13 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a9d4809000000b006a41ab165dfsm10278otf.34.2023.04.12.13.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 13:24:12 -0700 (PDT)
Message-ID: <e1622429-8dc5-5c9d-4c3f-1428f629fd71@ventanamicro.com>
Date: Wed, 12 Apr 2023 17:24:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC 1/5] target/riscv: Add properties for BF16 extensions
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
 <20230412023320.50706-2-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230412023320.50706-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/11/23 23:33, Weiwei Li wrote:
> Add ext_zfbfmin/zvfbfmin/zvfbfwma properties.
> Add require check for BF16 extensions.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 13 +++++++++++++
>   target/riscv/cpu.h |  3 +++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..c19bbb41fb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -874,6 +874,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if ((cpu->cfg.ext_zfbfmin | cpu->cfg.ext_zvfbfmin |
> +         cpu->cfg.ext_zvfbfwma) && !cpu->cfg.ext_f) {
> +        error_setg(errp, "BF16 extensions require F extension");
> +        return;
> +    }
> +
>       if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
>           error_setg(errp, "D extension requires F extension");
>           return;
> @@ -918,6 +924,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if ((cpu->cfg.ext_zvfbfmin | cpu->cfg.ext_zvfbfwma) &&
> +        !cpu->cfg.ext_zve32f) {
> +        error_setg(errp, "Zvfbfmin/Zvfbfwma extensions require Zve32f "
> +                         "extension");
> +        return;
> +    }
> +
>       /* Set the ISA extensions, checks should have happened above */
>       if (cpu->cfg.ext_zhinx) {
>           cpu->cfg.ext_zhinxmin = true;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..6c99a82624 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -462,6 +462,7 @@ struct RISCVCPUConfig {
>       bool ext_svpbmt;
>       bool ext_zdinx;
>       bool ext_zawrs;
> +    bool ext_zfbfmin;
>       bool ext_zfh;
>       bool ext_zfhmin;
>       bool ext_zfinx;
> @@ -471,6 +472,8 @@ struct RISCVCPUConfig {
>       bool ext_zve64f;
>       bool ext_zve64d;
>       bool ext_zmmul;
> +    bool ext_zvfbfmin;
> +    bool ext_zvfbfwma;
>       bool ext_zvfh;
>       bool ext_zvfhmin;
>       bool ext_smaia;

