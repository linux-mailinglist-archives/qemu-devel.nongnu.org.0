Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF147E666
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:34:02 +0100 (CET)
Received: from localhost ([::1]:55806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0R2X-0001uO-FZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:34:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0R03-0000Pl-9n
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 11:31:27 -0500
Received: from [2607:f8b0:4864:20::102f] (port=55145
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0R01-000382-CI
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 11:31:26 -0500
Received: by mail-pj1-x102f.google.com with SMTP id jw3so5457531pjb.4
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z+peQTa48PtcUBORkRRFZitqi7aszWQXDHTELpQ/ApA=;
 b=w25KE2A4zbEdxgqP43VvcTJJEpIfEwrYbeMhjFRttd/06B3iyI+FRdZOtbIRPxmekG
 J+qdxa5opncSwX/ffUZAc4yHm8wPFLfGg04bBnwnik5v/PF7ncoh7dW4IJvjxQL9qA1D
 x2CBylGeQzhJGWfn9OtWm2J/oKwNyazFFaX/XVwAEFEgDbo9Whe4A0aFpqg0k0Zmevvk
 A1gdltKNgTrh9ImUjpUPrT0+NWXxSLAqZmyL1HCCJCezYjaiJPXCG66A9TWCzlyUkgck
 3zQJIN90m+p31Y2V8JOzS2C+o7CqlzdlRayHhAnkFe5sukfT7mXlmE41gveWxsIP0tk1
 s+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z+peQTa48PtcUBORkRRFZitqi7aszWQXDHTELpQ/ApA=;
 b=Vuu+zKriG5+MqDyAfwmcQBlx/MYcsFHXvHHW+hANMR3TkAd9r7E4KANy+2iCdXIMyq
 mUhDmcSo8mcN3fFSKhJcXOsA9f6DKLjHNi0CueQaOsbG9Xe2CLnADq81oBDrsovQB9Nw
 CdnBDWwButpRefZW+GJJ8jTEd1m7iWXoXiK/fQJjwkV+8BHOsnMRkt0/gP+eGa1SXwM5
 iwbbeb3dwYsyEqxMF1V7MJ5qEWmgLjEW8ZY1ADu93nJFKweZjozLUxYMAmAEZxDR0WQq
 Hgw8Ngoi1Un/MepVCFK6MdRy/NXAs21i1A4NL9TBUZ6umZRjSQryaLFyPO7Y3yV6MbFf
 9dOg==
X-Gm-Message-State: AOAM531bGGFLrookz6/oYMvN6VUqyywJIa6Xxkgfxy4BJBo7LHj9i6/3
 WST3BtVmGcmv00Ph6eXRoJo81w==
X-Google-Smtp-Source: ABdhPJypPyly0FhUpm6OCYLZxzGeh0A9G1IvIGYiQO7T9qHmHNVaO/3YQOEVV1dkUsqdQDsmrx3sGg==
X-Received: by 2002:a17:90a:4214:: with SMTP id
 o20mr3565240pjg.80.1640277084047; 
 Thu, 23 Dec 2021 08:31:24 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id e11sm5733193pjl.20.2021.12.23.08.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 08:31:23 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] accel/tcg: replace phys_pc with asid in TB htable
 key
To: Oleg Vasilev <me@svin.in>, qemu-devel@nongnu.org
References: <20211222164947.634759-1-me@svin.in>
 <20211222164947.634759-3-me@svin.in>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f3440c3-4a1b-a272-c445-58ff7341bfd3@linaro.org>
Date: Thu, 23 Dec 2021 08:31:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222164947.634759-3-me@svin.in>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Oleg Vasilev <vasilev.oleg@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 8:50 AM, Oleg Vasilev wrote:
> From: Oleg Vasilev <vasilev.oleg@huawei.com>
> 
> Using a physical pc requires to translate address every time next block
> needs to be found and executed. This also contaminates TLB with code-related
> records.
> 
> Instead, I suggest we introduce an architecture-specific address space
> identifier, and use it to distinguish between different AS's
> translation blocks.

Why do you believe that asid is sufficient here?  You're not invalidating any more TBs 
that I can see.  What happens when the kernel re-uses an asid?

I believe this patch to be fundamentally flawed.

All that said,

> +/* Returns the identifier for a current address space. */
> +static uint64_t arm_get_asid(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
> +    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
> +
> +#define TCR_A1     (1U << 22)
> +    return regime_ttbr(env, mmu_idx, (tcr&TCR_A1)>0);
> +}

Why are you returning the entire ttbr, and not the asid in the top 16 bits?


r~

