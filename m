Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3A626721
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:19:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otiu4-0001Vu-0A; Sat, 12 Nov 2022 00:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otitu-0001V3-9M
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:17:54 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otits-0008Pn-Nb
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:17:54 -0500
Received: by mail-pg1-x530.google.com with SMTP id h193so5914655pgc.10
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jdEY5rg2buHnHBYRCJkkkpTIwzLGOL+iRZExmgQ/VuE=;
 b=KEGgh8EjsIjetegowfDyoSBpkFlAinhlKpNOvU6FwTQaHKRT8UKOxJJjEsa9xObZUI
 D9BblJ61e4p5Aeo18DHuyaj+KZ+sYA72lKwrbHp6M7EWZeXe3R8OtIdn2whyN5euQ0+P
 SkR4yfSq0rLrJF5E3CMuxLr42h03ZqnwD7vUlC1OVHacQXZZMhGU27oUEzCuFEgr3tnV
 0AdpsCmGEmL1iot4pgSu74RgwYlJjiMCJ0xbddcX8ArCk3jCR1veo9WmUkTeTJEpaGW5
 oXCGHP22UgnEPaT8fYsU56+u/JRwvy0eDfAzhvoTh9kp18szfZweu4hLKZQ5OrYqn//y
 aLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jdEY5rg2buHnHBYRCJkkkpTIwzLGOL+iRZExmgQ/VuE=;
 b=5kEuHmkbwhiZ634hST88VVf8tGQcJQqLzvItZcKqfUkht4F4J6bAH0Ep6dg7oGR8z2
 0eQPJ1cM1Ame+4JpSvWs4nEwTBD4kxtLw1RcC/d0yK0BfgcV3nhc23tS3bPFJDTLWVbf
 gEX+IkChyyJPTFuG9bjjWyU/F9Qe303J6wncLdglkLISzKUpKtLvA7UAYAapsavzaXjd
 AizGdvKJYwvewSkWIWzGDI+nLAFtEbqwNsks/GNWRd+R6+HRIcZlKLdH9KtZLpYD0hjK
 O38FRki1DfV1Y4av3nY1QTRdcdtufHBRXzRqZSKRNmrnMnRdX4QgIiyRPmgWpyS60mfW
 y5gQ==
X-Gm-Message-State: ANoB5pmd1DHzneK1nxT8BN/KHtmUE/wEyRXNr1joo2XQgxxQe8QuIBMb
 LBwbi7xruP0+axEsI15bF4HCRw==
X-Google-Smtp-Source: AA0mqf6PDnANMuyfX2Uw+Vik7eS97xBY/NaHjlja36+SWaLUylFdyrhaebQpM/3nl3uOPO7Wcv1CPw==
X-Received: by 2002:a65:6e07:0:b0:456:4faa:7645 with SMTP id
 bd7-20020a656e07000000b004564faa7645mr4234458pgb.264.1668230271070; 
 Fri, 11 Nov 2022 21:17:51 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 a11-20020aa7970b000000b00560cdb3784bsm2461490pfg.60.2022.11.11.21.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:17:50 -0800 (PST)
Message-ID: <ae05eadc-e729-8c8a-a66a-d51d70de471a@linaro.org>
Date: Sat, 12 Nov 2022 15:17:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 02/20] target/arm: ensure TCG IO accesses set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 3745ac9723..4b6683f90d 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2634,6 +2634,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>       s1_lgpgsz = result->f.lg_page_size;
>       cacheattrs1 = result->cacheattrs;
>       memset(result, 0, sizeof(*result));
> +    result->f.attrs = MEMTXATTRS_CPU(env_cpu(env));

Ouch.  This means that f.secure has been reset too, which would break Secure EL1 running 
under Secure EL2.  I'll prepare a fix for 7.2...

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

>   
>       ret = get_phys_addr_lpae(env, ptw, ipa, access_type, is_el0, result, fi);
>       fi->s2addr = ipa;
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
>       ARMMMUFaultInfo local_fi, *fi;
>       int ret;
>   


