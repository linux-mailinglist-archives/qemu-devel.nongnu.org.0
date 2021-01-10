Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ECB2F0911
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 19:36:59 +0100 (CET)
Received: from localhost ([::1]:35264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyfaE-00014q-6a
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 13:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyfY8-0007XN-1M
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 13:34:48 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyfY6-0000ow-IV
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 13:34:47 -0500
Received: by mail-pf1-x42e.google.com with SMTP id c79so9625694pfc.2
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 10:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ILGvm8hLxribOAi8C2B/bryKYfvdt634X9gv2zNbfDA=;
 b=PIPT+cWPrPojt0kpyN9ybWEfAk0IApeV8yphPZQ688jXvrhjDsztsIbHQ23f2ekLbJ
 Vm2ztMCyw3Op1Wz1+d/dQe/XETL/eHuC3PNfluHbP++vNfq6YR/L4wz9r07SKcSRuHLQ
 sxNmFjrbfdb9mP0RxR2tpTU4oUKy9EAddJoEAG6z6XFb5CBfE/GAzjDTY4LlnUphewzf
 WPO+N5kDnihMITD9RUUVsT0LJFAo+UXs+pom7pWu9niVwMpEBzyZZSTyxVQAD1uxDPQ0
 Jp8BPVxXcRnc8OOQW40OkIewE5hfdML2IGcYOmjQgA+Qx84B1QH/cQtcAXrmaajPUJjM
 UBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ILGvm8hLxribOAi8C2B/bryKYfvdt634X9gv2zNbfDA=;
 b=ENFhbQlSgWVXqiGX3Ry601pU16Ci2VlNIG4yE2Di1QZsHaljTK9tN0fPEOp3SvOgi/
 rXoOC7v9S3oD2kPmVCuAHMYFbHvzl69LLl/j7UPUVx9OtohKU1PTDcrikzGtPqr5D5/N
 eLuL0ARVoMFIhBX5eo++om0n5zBOCMAT8XIidp3PU9B6rfI1FA4mizSU9pqQ4W7BPDG3
 nj4cc7nD6Vk6/3n/bTGKIUZSsRAdW9Ab9DsbVkrq10/Iz9YUP1xYhzcvM+5Hpqfv2gQY
 E2b0yDyKB/0ll9B52bVMGldFvZYgdpCGKJ9wStP1QFdV3c3O/ozuCe1bqcCaMOi24MXh
 Os/w==
X-Gm-Message-State: AOAM5312q6WDteRnG/WZ6tEuHKzwgRt00xqY8rn7lt0TyklhyeKHjDCs
 kVeqDKCC2yWD1wG8tIqrDmrURA==
X-Google-Smtp-Source: ABdhPJz2QesEVqKiTQwWRDxDuFreWD6IBmUQhL4W1b25EsHSUjoFTh/pbWDLv7NaQ43XMjJda7D8Ig==
X-Received: by 2002:a62:2606:0:b029:1a5:a755:5568 with SMTP id
 m6-20020a6226060000b02901a5a7555568mr13099650pfm.65.1610303685259; 
 Sun, 10 Jan 2021 10:34:45 -0800 (PST)
Received: from [10.25.18.117] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id f92sm16588899pjk.54.2021.01.10.10.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 10:34:44 -0800 (PST)
Subject: Re: [PATCH] hvf: guard xgetbv call.
To: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hill Ma <maahiuzeon@gmail.com>
References: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
 <X/lDozXFWfR4AZAU@SPB-NB-133.local>
 <CAFEAcA9bMbPFj=xFiHgDVg1X14kZOt0Bre-uH0fcjJzsaSk0qA@mail.gmail.com>
 <X/pccrqIQ9/N57j6@SPB-NB-133.local>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8da22f7f-7379-cffe-5fdd-94fd5ddece32@linaro.org>
Date: Sun, 10 Jan 2021 08:34:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/pccrqIQ9/N57j6@SPB-NB-133.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.012,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Arbuckle <programmingkidx@gmail.com>,
 Richard Henderson <rth@twiddle.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 3:46 PM, Roman Bolshakov wrote:
> +static int xgetbv(uint32_t cpuid_ecx, uint32_t idx, uint64_t *xcr)
>  {
> -    uint32_t eax, edx;
> +    uint32_t xcrl, xcrh;
> 
> -    __asm__ volatile ("xgetbv"
> -                      : "=a" (eax), "=d" (edx)
> -                      : "c" (xcr));
> +    if (cpuid_ecx && CPUID_EXT_OSXSAVE) {
> +        /* The xgetbv instruction is not available to older versions of
> +         * the assembler, so we encode the instruction manually.
> +         */
> +        asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (idx));
> 
> -    return (((uint64_t)edx) << 32) | eax;
> +        *xcr = (((uint64_t)xcrh) << 32) | xcrl;
> +        return 0;
> +    }
> +
> +    return 1;
>  }

Not to bikeshed too much, but this looks like it should return bool, and true
on success, not the other way around.


r~

