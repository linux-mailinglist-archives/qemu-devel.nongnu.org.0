Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4457B43E7F0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 20:03:17 +0200 (CEST)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg9kB-00082s-CL
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 14:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9h3-0006xD-6l
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:00:01 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9h0-0003kL-W5
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:00:00 -0400
Received: by mail-pf1-x42d.google.com with SMTP id m26so6734359pff.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vzru+Ul7oQKPRnL9dRhiftIZ4OdXGapraNifo8F/Qrg=;
 b=Zgh/6rHhDdqwChZY7htGz8Wpp5zcS5n28MQyrAA4BxUaMQcKje0TZXnxsF3cG939K5
 fZMrM16bWTeoM9oov89ZZTSZ8vSnkMK81WEd83JNIdO4FXDEU7v6bDghNOpLgYv99ZXy
 IZHNevEfaDd/pn6ZNH4Vn/0mkbRiRs9T6eT/2rR6vRViW1bOu5PsahxvJTIA0+Hvpx0M
 AsaEyNWaaUJmMsih0WAJf1ONXegdwPl4lQGFv6ngbtnr+fR6090mO/eMJHy7d2K5A/uW
 4sukrZ7fPKRVxdVJQ7HTlbYvFOz72GmHM/LdqRyU09PU6nPEKc09SVm05G4GWrOze/P3
 CiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vzru+Ul7oQKPRnL9dRhiftIZ4OdXGapraNifo8F/Qrg=;
 b=GBBTR4SSZjoQDfFQjMe4cMC8n36vh9i3X/YBWjgH/+a0JsaycHN4D+9ba8BjgRHLMG
 iCHuXPrYjBSv27KtTx+un30PDEnVFx8LuW+Yl2hcH2VFORShGHGhc9gajQOA3ynvdEky
 DlZDdnjNRYG1z2Xh3Y1Fnxjz+k0qAL8l12BaiU3zovj1nKwmG2nPFqM3qukzJdbgiWAs
 Nn/MpGOgASgjYz2x0eHXHJlAQ0RaPsduCVtJ8qO+zvF7Hyp4XVskQEFciIrrOYrHlqXB
 aiknLDh9vIXHCK9fg9V7jVsmZ2Ji+UjylJz8quQ2YndvYUrdBONuOfkP7AUUQlktPIQV
 DJ6A==
X-Gm-Message-State: AOAM533LT/DBzCQZmvTWu9sQUiRoLArgallrUinrrIYX+sgtYgThrbce
 H+w974HzUYdxy5p0qs5erSz+ug==
X-Google-Smtp-Source: ABdhPJwWn2aqZ5gpLSa3yMxRl2eT88iBSRwRIQBRq5JMfMLqwRvcOAy4HPnmYCSEusgawSQ4UDEMWw==
X-Received: by 2002:aa7:924d:0:b0:47b:d390:da8d with SMTP id
 13-20020aa7924d000000b0047bd390da8dmr5851588pfp.15.1635443997462; 
 Thu, 28 Oct 2021 10:59:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id x5sm4654105pfh.153.2021.10.28.10.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:59:56 -0700 (PDT)
Subject: Re: [PATCH 23/24] bsd-user/arm/target_arch_signal.h: arm
 get_ucontext_sigreturn
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-24-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2cd05217-d8c8-329e-ec4f-bbec1c5174f5@linaro.org>
Date: Thu, 28 Oct 2021 10:59:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-24-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> +/* Compare to arm/arm/machdep.c sys_sigreturn() */
> +static inline abi_long get_ucontext_sigreturn(CPUARMState *regs,
> +        abi_ulong target_sf, abi_ulong *target_uc)
> +{
> +    uint32_t cpsr = cpsr_read(regs);
> +
> +    *target_uc = 0;
> +
> +    if ((cpsr & CPSR_M) != ARM_CPU_MODE_USR ||
> +            (cpsr & (CPSR_I | CPSR_F)) != 0) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    *target_uc = target_sf;
> +
> +    return 0;
> +}

Since you've not yet filled in signal.c, I can't opine too much, but I'll note that the 
kernel has this check in set_mcontext, and sys_sigreturn defers to that for the validation.

So I think this can just be the final assignment.


r~

