Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D249A6964A2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:25:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvI1-0001T0-D5; Tue, 14 Feb 2023 08:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvHy-0001Rr-UH
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:24:07 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvHw-00061A-DW
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:24:06 -0500
Received: by mail-oi1-x22b.google.com with SMTP id r28so12976826oiw.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2TJGEnHDehvQoHwuaXXdW2usYW+lQyVESjE5qdIIbec=;
 b=IDY+5VkuLTUHrKnoF/e8jf65pEijyz8JWpb0voiguTtgvLVGDnRHaG+cwZgMV1uJjK
 YOpUv2vkOk5zdT3RH3SV4Y2qfFbG2K+6qOzH7KRcCQwSYiJsiQK3vNGa/BDBftOn74a2
 To7SFMpZ1ufC0RLj0PxpASr1V9ymgUillGDMhVeexM8QO5s0+qSpIvwp98P1vOhQvCec
 7dpoIkDnNquwfOCac0un0oPhovY3amW99e5i6kQN/o6iGPCOX+mcsYlhBLlsQOXTBc+U
 V2tgnqs8uMXAV3KfrRW15a3Yenw9WbT2CPTJ7ApAq5r4OSYgFIJwWHsplzlpcMx/06Tv
 ufdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2TJGEnHDehvQoHwuaXXdW2usYW+lQyVESjE5qdIIbec=;
 b=gSo4yDpPMHPf3nm7g1xZB8LjCgpm3Ud+x4o9jKCkMNswwo8aD9y5KX/m2zmt2bEcbf
 6fsqCcliqJIezV8kUht3CnXUUyAV7vOLf3XAupCzsNJm4Iam48XkIKM2I0ILOZ6T/fyZ
 AcsZ8Fo4TgQrFXqTg7vWSvAUAaiJJOSZyHBf/ngG3j+DkYeGWFipj81SZfu9olNSTAq1
 e2txZzxeCHDapNfEaKjgnhIirI0CY7vv2Ck0x9YS2K8xpKXdwjN+j1iKo+lP+Vpek0ef
 0pD16xuUgGvbLscBTCrdGSKMUH4GpUrPmrk84mtzQ+MZF585uKB55c+Sa0anaoImNgo5
 z/6A==
X-Gm-Message-State: AO0yUKUzNwz0OOB9I8lM1lRX/H4GDEvedW3madT8XqIrPWmenFcE6fol
 ByPL8TLQkfCCfGdcO8vFjOcacltwV9Fh46r4
X-Google-Smtp-Source: AK7set9FxI52R1Ac4gHQR6aMCYncr/6GZ2FK9RnwKsWR++WHgYfZvhKZt1TT+WdgRX6C3IQAYjhAJg==
X-Received: by 2002:a05:6808:4291:b0:378:920b:73f6 with SMTP id
 dq17-20020a056808429100b00378920b73f6mr1161152oib.46.1676381042430; 
 Tue, 14 Feb 2023 05:24:02 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 w6-20020acadf06000000b0037b80fe0539sm6140836oig.42.2023.02.14.05.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:24:01 -0800 (PST)
Message-ID: <ea782346-f6e6-8b25-58fc-b6d42d77d518@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:23:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 06/14] target/riscv: Add propertie check for Zvfh{min}
 extensions
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-7-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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



On 2/14/23 05:38, Weiwei Li wrote:
> Add check for Zvfh and Zvfhmin
> 

Nit: Missing period in the end.

> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4797ef9c42..8fe76707a0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -768,6 +768,20 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_zvfh) {
> +        cpu->cfg.ext_zvfhmin = true;
> +    }
> +
> +    if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f) {
> +        error_setg(errp, "Zvfh/Zvfhmin extensions require Zve32f extension");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_zvfh && !cpu->cfg.ext_zfhmin) {
> +        error_setg(errp, "Zvfh extensions requires Zfhmin extension");
> +        return;
> +    }
> +
>       /* Set the ISA extensions, checks should have happened above */
>       if (cpu->cfg.ext_zhinx) {
>           cpu->cfg.ext_zhinxmin = true;

