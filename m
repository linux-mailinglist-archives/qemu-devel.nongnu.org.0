Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7904F6DF675
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:06:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmaAs-00056A-LT; Wed, 12 Apr 2023 09:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmaAq-00055O-3t
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:06:08 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmaAm-0006OV-Ls
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:06:07 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-183f4efa98aso19765816fac.2
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681304763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QojcOoShkasWZ78LhbWzd5c0qWMAnrJVHNhAIsRVtaM=;
 b=UJsXWjvmQ2kIJFtuHqTkGveOHG7bY8rwiPrPg18mVcNui/RIjL8zXfUJw7grlPwbVp
 tIVnhaXresVAZDH8T11K09Wx5K888qvOI1T9c9IZoNjTmL0L9KNFVk0vLpOxFaj3awWr
 AQdGNFgJs3JF/f+fLmUBQjgxTzBLhbqL1M/qQtzkvcRiMqUSD8UkEi1fLCh8IEoz18R0
 Y8WbkFwH1DEXBa7OZ8D3SQeRqzPzb4Vzorut9zADnz/GI7vRBp2YpfhvLiKp+fHPhF2N
 e8YRqr4xGG3kArzqIKTQiUTw+GXUD/q0lTRRjbmfMOdgj49qNjKA+BHzRwuMhqRLyw7U
 rMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681304763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QojcOoShkasWZ78LhbWzd5c0qWMAnrJVHNhAIsRVtaM=;
 b=rGxhybx00RxulRGAtcfdyhJLhtvwUHy9SvDc9Dkyq9ENhVCo5g+BuNSiLy+0gNAu78
 Okh1TgmudkHgiSmw54CEj+mJK48cvTeXFZ+ndBPzvr3BF4L5xiha9dQowKFXiMjsiaok
 iHHTXmaR03g+4Jb8CVqeYA67sHz2IipxjS2sr/FB6ak+YRbfFgLd+n9eFNta5QsqfVos
 n8FGLngKspQf2aFokJ0kDJhML3oN5GQPjp3Bc0UvVuKGtlFhyFHSndfsVTG4vNEUsD9U
 1RzygVgtFFBbAv6CX0nffVsKwpL6dGGKgNTYlXGh3Lf37qasq1m4+6txkCXFm6iCq0Cw
 /HWg==
X-Gm-Message-State: AAQBX9eke99GNpFg6xkmHAddI2Z2B+GuVfRAUw5AAJB6BK4B2hm1q4nO
 6OQBrNVQW2Q78Uhtz6XrMNBGtA==
X-Google-Smtp-Source: AKy350bRi2Vzjv+/fwYCbpG9rnDhb5gmY/EhZu8le0NGKlLQnB/Wt0+DgB9UEl+CYIfYm+vUWET6Gw==
X-Received: by 2002:a05:6870:a7a3:b0:180:1c4b:fce6 with SMTP id
 x35-20020a056870a7a300b001801c4bfce6mr8008499oao.28.1681304762722; 
 Wed, 12 Apr 2023 06:06:02 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 tk9-20020a05687189c900b0017ae6741157sm6168351oab.4.2023.04.12.06.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:06:02 -0700 (PDT)
Message-ID: <0f9cb0e8-ba52-4c67-0d05-02fe9cbf8108@ventanamicro.com>
Date: Wed, 12 Apr 2023 10:05:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] target/riscv: Mask the implicitly enabled extensions in
 isa_string based on priv version
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230407033014.40901-1-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230407033014.40901-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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



On 4/7/23 00:30, Weiwei Li wrote:
> Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
> super extensions can simplify the extension related check. However, they
> may have higher priv version than their super extensions. So we should mask
> them in the isa_string based on priv version to make them invisible to user
> if the specified priv version is lower than their minimal priv version.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


And I'll fold it into the next version of "[PATCH v6 0/9] target/riscv: rework
CPU extensions validation​" to fix the sifive break I'm experiencing there.



Thanks,


Daniel

>   target/riscv/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cb68916fce..1a5099382c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1709,6 +1709,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>   
>       for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>           if (isa_edata_arr[i].multi_letter &&
> +            (cpu->env.priv_ver >= isa_edata_arr[i].min_version) &&
>               isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
>               new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>               g_free(old);

