Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780DD6C1B9A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:29:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIMP-0005eg-7h; Mon, 20 Mar 2023 12:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIMM-0005e7-Hm
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:27:46 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIMK-0008Sk-Uq
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:27:46 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so17103785pjt.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679329663;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kunCeeIrVzByJtYk5FINevUa/RylGNVWXKpVUD5JZx4=;
 b=vwS+4Ye/l0zBhRhAm6W3ktw9n9KrLLB4eSnIb/MrD61a3tl8n2X6pnrdClUkvLlRl2
 ckAEXtFvPuEyALYx3Ptm4HnL1npCvNlU783XPhbkuUYbR6Q5wTYNHE0LdBFOAznMkZpE
 aQotvM4aN6nsogOIHmlZ5yTRZxUEeDQW7mPvcB08KjhGUSs5aDSTJDEhWuTiFqvAX8tg
 +nArxWvGqrfIjGgtcQeb9a+o0XoPSjI0+oMf1G70SoBgk8BeMWwDd+6/RHj3fDVVYXKl
 XiUSZ6O3pK1Azslab7qhRLw6sHrQFNxYh4O+yE78QoHK3wLIu+9yY6aV6VPSqEqIbmHx
 r0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679329663;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kunCeeIrVzByJtYk5FINevUa/RylGNVWXKpVUD5JZx4=;
 b=a/XfAE06Y1QI0baMv9VVvT1i/fAbKoeq9O/GwMicHmsZsS8EEt7ogRje/3FRSj1iFi
 eXB7LdaZYShmF4mayRtg1v8oVjzOLrKTvPf7uOiiU9vtuxD0JJwl0mC9gIFdUOWDwzXU
 gYTptQqa+gBlhTr7Q3LiNcwgpNI8+IEPH0p1XV7Bx+vcnX8016ymE4ZQfxI3dKKd4KNl
 MbFVRmi98OHQSpcoBO6xhKa+owxiPoliTYNrKcUMbXzyn7lNgCdRdKFF5cnNRoVxooku
 DL+WXVtVq38Dbf8vayA3KIn7Bwpz+eCizFP2tPQ1+XxQozztJZrl6nwO4x3LOChIkJiX
 /urQ==
X-Gm-Message-State: AO0yUKXLhz4NBo3Q5Y8WFUmWFic/00Z+QwB799O2l55h/fgU2CnP3QEv
 +DOV5Y8gEbzjvtXX4elWOAKBwg==
X-Google-Smtp-Source: AK7set++P3FgGrhP6hkbIvSv/73POZDMS9hQfz1vbXx33i2mH7eXdOzfb18+kgKJRttKAhdTGD/ZIg==
X-Received: by 2002:a17:90a:c984:b0:23f:2486:5b53 with SMTP id
 w4-20020a17090ac98400b0023f24865b53mr13465078pjt.17.1679329663438; 
 Mon, 20 Mar 2023 09:27:43 -0700 (PDT)
Received: from [192.168.4.112] (096-041-163-098.res.spectrum.com.
 [96.41.163.98]) by smtp.gmail.com with ESMTPSA id
 d21-20020a17090ad3d500b002309279baf8sm9759514pjw.43.2023.03.20.09.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:27:43 -0700 (PDT)
Message-ID: <c49afab1-9842-e90e-7d1b-69b849b1e63e@linaro.org>
Date: Mon, 20 Mar 2023 09:27:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/10] accel/tcg: push i386 specific hacks into
 handle_cpu_interrupt callback
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230320101035.2214196-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 3/20/23 03:10, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/core/sysemu-cpu-ops.h | 11 +++++++++++
>   target/i386/cpu-internal.h       |  1 +
>   accel/tcg/cpu-exec-softmmu.c     | 16 ++++++++++++++++
>   accel/tcg/cpu-exec.c             | 31 ++++++++++---------------------
>   target/i386/cpu-sysemu.c         | 17 +++++++++++++++++
>   target/i386/cpu.c                |  1 +
>   6 files changed, 56 insertions(+), 21 deletions(-)
> 
> diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
> index c9d30172c4..d53907b517 100644
> --- a/include/hw/core/sysemu-cpu-ops.h
> +++ b/include/hw/core/sysemu-cpu-ops.h
> @@ -53,6 +53,15 @@ typedef struct SysemuCPUOps {
>        * @cs: The CPUState
>        */
>       void (*handle_cpu_halt)(CPUState *cpu);
> +    /**
> +     * @handle_cpu_interrupt: handle init/reset interrupts
> +     * @cs: The CPUState
> +     * @irq_request: the interrupt request
> +     *
> +     * Most architectures share a common handler. Returns true if the
> +     * handler did indeed handle and interrupt.
> +     */

and -> the? or any?

This should be a tcg hook, not a sysemu hook, per the previous one.
I would very much like it to never be NULL, but instead your new 
common_cpu_handle_interrupt function.

> -#if defined(TARGET_I386)
> -        else if (interrupt_request & CPU_INTERRUPT_INIT) {
> -            X86CPU *x86_cpu = X86_CPU(cpu);
> -            CPUArchState *env = &x86_cpu->env;
> -            replay_interrupt();
> -            cpu_svm_check_intercept_param(env, SVM_EXIT_INIT, 0, 0);
> -            do_cpu_init(x86_cpu);
> -            cpu->exception_index = EXCP_HALTED;
> -            return true;
> -        }
> -#else
> -        else if (interrupt_request & CPU_INTERRUPT_RESET) {
> -            replay_interrupt();
> -            cpu_reset(cpu);
> +        else if (cpu->cc->sysemu_ops->handle_cpu_interrupt &&
> +                 cpu->cc->sysemu_ops->handle_cpu_interrupt(cpu, interrupt_request)) {
> +                return true;
> +        } else if (common_cpu_handle_interrupt(cpu, interrupt_request)) {
>               return true;

... because this is pretty ugly, and incorrectly indented.


r~

