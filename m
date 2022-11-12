Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD3626723
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otj20-0004ay-27; Sat, 12 Nov 2022 00:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otj1x-0004af-PR
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:26:13 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otj1w-0001Fp-6D
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:26:13 -0500
Received: by mail-pl1-x629.google.com with SMTP id p21so5816061plr.7
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oqxAa6bNQAZqaxYbDlMe3G00xB2hmssTFTmA+3QlX+Q=;
 b=OnWFM4K/94tqNjVqzjvepa2fP1OvYkAgrPeQoZ4RrZqnGQb6Wxid7iky3pSF/34pxq
 BlEQO9tCn4dh5KyMC78amJ2ZYOCribIrxr4pxhAvfe6fIyGCjZqYsBG/palNb4Eczts7
 KGEXDcP/b1qw106sIx00UpJMtQB0yQcmblHsRxpuRAOYT9atSOJya7dL2rp3M5PPW+E9
 6RoTZO0akibKmc/2RDuetEGoUsu/c2YwJ0FenX5w5w9QTmwVvEz/FeL1gM7yBmWaI3Av
 5ArIuK5egpJzmEtNDs/C3KR2s4t6uE30mcdapKhY/Yb77tqHbChGmczQlz+UR4tzUVqc
 h3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqxAa6bNQAZqaxYbDlMe3G00xB2hmssTFTmA+3QlX+Q=;
 b=zOv2/Ld8gNn9b1ZU/jXIMaYAQ3wZXJglpQiw04yUI3uUp1E37N7+zjXD38D8vDTD5k
 JLUmyJ7oqjyiGmu+dN7YK/fy50sQJQgUUcMvx6erOz02LlP3RJmrgaHmzmfEf14GpRYQ
 hcqqCUpLj1BiDNvRKL4K1tLYNJqCjFLCVWWsp1sVgpv1AbWdUDJ62Xf6aItMsv/ThpHB
 3vuDH7qxwy/LEzhM+f5rMhlsgq0/eKOe4v3/EmHLXA+oMJASUzUjSDk35JYp19xIFuam
 YjEUraXdqpx8FQW/55LTpdqjguwsJG8v/3oDQ6QNUFMNU1zvSWC8MxaCI6yKLlJeN3Hx
 APlg==
X-Gm-Message-State: ANoB5pkB9FlmO3pt6JYwBJLsSesyZp8G/LAGHkFv1G9vd59lBuwrpHpb
 /WMxKxyrvWecy35SSbL0UP+Q5A==
X-Google-Smtp-Source: AA0mqf6mU1XYYtaPEVitikyxsS17cQZWIMJJqbkwmkUFB9IwUx729wsrHGFZ3RjH+hzzgwvsgP9gQg==
X-Received: by 2002:a17:90b:2290:b0:212:dadc:23e3 with SMTP id
 kx16-20020a17090b229000b00212dadc23e3mr5139120pjb.129.1668230770067; 
 Fri, 11 Nov 2022 21:26:10 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a17090b010d00b002009db534d1sm2459055pjz.24.2022.11.11.21.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:26:09 -0800 (PST)
Message-ID: <470381f6-baeb-fac0-2332-d59574291e05@linaro.org>
Date: Sat, 12 Nov 2022 15:26:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 02/20] target/arm: ensure TCG IO accesses set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 11/12/22 04:25, Alex Bennée wrote:
> @@ -2872,7 +2873,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>           .in_secure = arm_is_secure(env),
>           .in_debug = true,
>       };
> -    GetPhysAddrResult res = {};
> +    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
>       ARMMMUFaultInfo fi = {};
>       bool ret;
>   
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 0f4f4fc809..5960269421 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -208,7 +208,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         bool probe, uintptr_t retaddr)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
> -    GetPhysAddrResult res = {};
> +    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };

Not the right level for these.

Should be set in get_phys_addr_with_struct, alongside .secure right at the top of the 
function.


r~


