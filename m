Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4F4CE03C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:26:44 +0100 (CET)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGNm-0003Oq-L7
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:26:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGMZ-0002hq-1i
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:25:27 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37803
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGMX-0004UZ-Dz
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:25:26 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso11702939pjj.2
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GVNdXbx3+NNftCdddVMTDN3Hmcom27lPdAHGQEYXV04=;
 b=db2SscH+rL73ZDIuwzKua8OYkTxpfmf7OXhhESiWZo5plv+mVr+ZmFhuIomXjQKnyw
 p4GKgVl6GgHXgLEG3Q1irQ0HeU2tlpso3H8ObicBz5ZjjrSgAFV06TWHQI+GtPrr2tKb
 W1SmKKaL4F0dX6CUf6NViBVBF6QgYFJXnShFBV1N88lMrOSyfEC1utjmbOw+5kUPthQK
 heUVUJ6/lhMRJLOuvosx5g+yyMJDtTWsn4MBcgam+3ZRqHK9AB8LQq39cSmPa6mnwpk0
 PoqKZ2zHMRZ4JF9WMQ+wvgg7RrdoJLQiTEfR23EDfOG4S2ZfnHRU9k0NWBR4ITvmipSi
 Hfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GVNdXbx3+NNftCdddVMTDN3Hmcom27lPdAHGQEYXV04=;
 b=pxuV2t720ftnmn3go6so4z1pYdce996DQpDfQmvx77d/G7lN59qV6vb6BeEwWKZWrK
 nzKTvEikL13DZC6wFC58jndQyQLZoVMH37kPLLApoTBjgHzkTYSITLulYgLHQaoeHG+7
 wXjL+1aRAfAiUc6YQ9ySnSiYqqQbZBuAry8YuLW8XHaX2DlGLXyCBVk/mIp8onOGQzr0
 1cnZkbLZSsZhRgdYwAeArXJ8AOne7IBm76qJeSkV4Wt/TzEgCtKZ6G88b4Ifz7qa5xgI
 K/2U5brz7XlxR2GljcuXIQMvRiHUS1fsQ198nxUqHkzNsHhMsHXufz0d1i70yH1oY2ea
 BxjA==
X-Gm-Message-State: AOAM532is5uEHt5+PGJd1bR/lABaCt6DyR8e2fNBfJLnvO9chBdDq0ko
 JY2K6qXmquzPX1FqiU+MEwRKMQ==
X-Google-Smtp-Source: ABdhPJz9V01oJ8meDTObG1hvpH8KjeRJDu5qPWvDpJRBxCRQFVBCaJM9wmRFzYqrrjdUlok2/rvQ8A==
X-Received: by 2002:a17:90a:5a85:b0:1bc:8bda:6a42 with SMTP id
 n5-20020a17090a5a8500b001bc8bda6a42mr836385pji.4.1646432723929; 
 Fri, 04 Mar 2022 14:25:23 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 x190-20020a6286c7000000b004f6bf60b958sm2437875pfd.125.2022.03.04.14.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:25:23 -0800 (PST)
Message-ID: <56be99b1-3b0f-77e9-4b11-5734c70d85f7@linaro.org>
Date: Fri, 4 Mar 2022 12:25:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/5] target/nios2: Exteral Interrupt Controller (EIC)
Content-Language: en-US
To: Amir Gonnen <amir.gonnen@neuroblade.ai>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
 <20220303153906.2024748-4-amir.gonnen@neuroblade.ai>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303153906.2024748-4-amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 05:39, Amir Gonnen wrote:
> @@ -55,6 +55,7 @@ static void nios2_cpu_reset(DeviceState *dev)
> 
>       memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
>       memset(env->shadow_regs, 0, sizeof(uint32_t) * NUM_REG_SETS * NUM_GP_REGS);
> +    env->regs[CR_STATUS] |= CR_STATUS_RSIE;

status is supposed to be reset to zero other than RSIE.

> @@ -131,13 +144,26 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>       Nios2CPU *cpu = NIOS2_CPU(cs);
>       CPUNios2State *env = &cpu->env;
> 
> -    if ((interrupt_request & CPU_INTERRUPT_HARD) &&
> -        (env->regs[CR_STATUS] & CR_STATUS_PIE) &&
> -        (env->regs[CR_IPENDING] & env->regs[CR_IENABLE])) {
> -        cs->exception_index = EXCP_IRQ;
> -        nios2_cpu_do_interrupt(cs);
> -        return true;
> +    if (cpu->intc_present) {
> +        if ((interrupt_request & CPU_INTERRUPT_HARD) &&
> +            (env->regs[CR_STATUS] & CR_STATUS_PIE) &&
> +            (env->regs[CR_IPENDING] & env->regs[CR_IENABLE])) {
> +            cs->exception_index = EXCP_IRQ;
> +            nios2_cpu_do_interrupt(cs);
> +            return true;
> +        }
> +    } else {
> +        /*
> +         * IPENDING does not exist with external interrupt controller
> +         * but we still use it to signal an external interrupt
> +         */
> +        if (env->regs[CR_IPENDING] && nios2_take_eic_irq(cpu)) {

Why CR_IPENDING?  The ipending register isn't supposed to exist with the EIC.  Did you in 
fact mean interrupt_request & CPU_INTERRUPT_HARD, as set by nios2_cpu_set_irq?


> -    /*
> -     * These interrupt lines model the IIC (internal interrupt
> -     * controller). QEMU does not currently support the EIC
> -     * (external interrupt controller) -- if we did it would be
> -     * a separate device in hw/intc with a custom interface to
> -     * the CPU, and boards using it would not wire up these IRQ lines.
> -     */

You should note that this is still used for EIC, though only IRQ[0].

There's a fair amount of checking cpu->intc_present, then doing two completely different 
things.  I'm thinking that it might be best to split these into two separate functions, 
and then set up the pointers properly.

You could in fact replace intc_present with two separate cpu classes (which is where many 
of those pointers are registered).  That would be early enough for the cpu_init hook to 
*not* register 32 interrupt lines for the EIC, as per above.


r~

