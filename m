Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703D56CEF8F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:36:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYmP-0005SB-Kt; Wed, 29 Mar 2023 12:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phYmM-0005RJ-QP
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:36:07 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phYmL-00031P-8m
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:36:06 -0400
Received: by mail-pf1-x434.google.com with SMTP id u38so10657059pfg.10
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680107764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AjvNAt/4YDJVjLGS76iQaE5yaByPsmOs0MvxHruMIGI=;
 b=CwJeDq0Ukj0w/1o4Ev8GAUcrFA2Ezp7zZtkNxHvFp2xGKLxOCcicKOc08efIaV9IrD
 fWSZaFVqNEscMME4m8gpcbxUuCVywIizL4PbrU1Y+x0GB4SYh++mjY2hC3A1SC014O0b
 uMkx4A9vw3uvTlj3ExQPOzVktgUMVNmCGqhjWIFvuHI2Taz4VuyWe3brURgacEA/O5zU
 l6eKc4/iWtPWYWXnBxz7WKtDD5b7d8x/mQjvMaXgQlwjC8B2Wa3MhGImFe5szp31mYPh
 IaWqrw1+aUB2Iow+aUJ5OJwpaNP12N/IN0CWIGG7SUv+rTZVEJYfCFBOjJ/b/zEMqyXz
 9CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680107764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AjvNAt/4YDJVjLGS76iQaE5yaByPsmOs0MvxHruMIGI=;
 b=r27blQ2KbmgGbvlTQe0hxwrb3HjuoiewPQassfyYKIJMdBEcAeWsJRtr1mK+JLGlnx
 nDC2WWCOexMGofYhQxKguLD9MfIHHLtMIS+fhnwJEac6ZyCMwLncl3XvTDCpPtGBdrk9
 xAxaXMLvk/RgADnLYSBeOgTZrNG54vlALdJdQw3dB45PfP3yeIXx0JCjRJKT4ZwNwDpv
 j2KmP2gxCdNVh3bFCL2NgNZhOyy8RjvAR+VcK9JqdjATKJutrhCF9f3giyPOHfM6nsjr
 14MJ1wBny+8QkQoY7usjwzwqjqo7LA3supu/TnVBuJl8Z7IkwBXN4LNaknAZChPPGzlp
 Hypw==
X-Gm-Message-State: AAQBX9ewcWL0jdYA745+tP3bAb5Celkym1B++kf9kJdzR+ZXNaZg+EXK
 GVKwotNERclTbhz5IEyG7j4jUg==
X-Google-Smtp-Source: AKy350b/nMpobfpsqTpDy+WLvTPIO7H6DAd7FAwDczf3BlTKjiBxyf6Oe0U86J5aDDCgxYR+XtFrCw==
X-Received: by 2002:a62:1794:0:b0:624:f1f2:234a with SMTP id
 142-20020a621794000000b00624f1f2234amr15729569pfx.23.1680107763652; 
 Wed, 29 Mar 2023 09:36:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:3369:815f:629b:7300?
 ([2602:ae:1541:f901:3369:815f:629b:7300])
 by smtp.gmail.com with ESMTPSA id
 d9-20020aa78e49000000b005cd81a74821sm19507939pfr.152.2023.03.29.09.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:36:03 -0700 (PDT)
Message-ID: <a1809221-ed92-01ec-28b9-7a9397c9066e@linaro.org>
Date: Wed, 29 Mar 2023 09:36:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230329032346.55185-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/28/23 20:23, Weiwei Li wrote:
> Transform the fetch address in cpu_get_tb_cpu_state() when pointer
> mask for instruction is enabled.
> Enable PC-relative translation when J is enabled.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c        |  4 ++++
>   target/riscv/cpu.h        |  1 +
>   target/riscv/cpu_helper.c | 20 +++++++++++++++++++-
>   target/riscv/csr.c        |  2 --
>   4 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 646fa31a59..99f0177c6d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1193,6 +1193,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>   
>   
>   #ifndef CONFIG_USER_ONLY
> +    if(cpu->cfg.ext_j) {
> +        cs->tcg_cflags |= CF_PCREL;
> +    }

"if ("

Consider enabling it always for system mode.  The reason for the existence of CF_PCREL is 
to improve performance with the guest kernel's address space randomization.  Each guest 
process maps libc.so (et al) at a different virtual address, and this allows those 
translations to be shared.

I would enable CF_PCREL in a separate patch from MMTE_*_PM_INSN.


r~

