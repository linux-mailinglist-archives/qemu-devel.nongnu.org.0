Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B240D2B6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:51:48 +0200 (CEST)
Received: from localhost ([::1]:45542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQjND-0007pf-52
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQjKy-00064F-1n; Thu, 16 Sep 2021 00:49:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQjKl-0008U8-MX; Thu, 16 Sep 2021 00:49:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so6405319wmq.1; 
 Wed, 15 Sep 2021 21:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PGD/6QKFzy2wWzotQJm6wy29TLeAhDW5GmL5b2Xm3Ic=;
 b=dVzQ2Ewreu98fbXGOF8+DQVaGm5mMSNsnOq4uNa0M50jVxz/nC6cbOXPEfxXbGgmuY
 NPyEQsstfZZWNjUbs+S77G5BNKx7tLubBCOFygeyC++ytC7LiJb88JCsxPIY1lNkW74t
 QqgypMYRFdvbiaxzEQom4rjUCJPHjfQgWEA3QzIuOcrzLxyax50ITAuQltjBlpnN/iwZ
 WUOZ4rBFeisKTgDWKh3iqD0+nssNJXyrJnoNVzMDGNdil6jiZaXlOS+/+cyW50pRXA4P
 ccBfg+GQEnwkYJ3ejC3/2r70NS/y5vz3fhYYP4i3FV/cN+FuX39i4JpnMWwL50zUqsQ2
 tO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PGD/6QKFzy2wWzotQJm6wy29TLeAhDW5GmL5b2Xm3Ic=;
 b=326ATqT6FpxUu/oI748l9DIZuwLNfi/KBVWxwLWMEwMmL2U8tlO+f6DzOrch8N2zwR
 NPIj6HNfYVIx/f4v34G0gmNuU/Og05xGOaeQwFMfVyWLixGLOvrR7hzsLK+qOkMnZIbc
 jk621Bl3XbJddEVQ3ikK5CisUNfpsMRJ1H0t9bz2rYuLqGTZopn5qzTaT4xrDgyUGbjY
 j6r+pi/Qh6jn8svFtoT/TFLFMbMR9T+XISI288qbtJ0lJ9iU2AcyglcBwPSjXpn5WtnR
 HCd8M3iMYzgkkIPp/REyfTGRW0iZciHTJLB84gusn8CL50U975L48rGBGZ+/fwfkbA9Y
 IFdw==
X-Gm-Message-State: AOAM531rDJH+zJgRyxW0XaWJd69Nz6W7uOzrCkTJSepXDQgQZXqTHw9r
 OPr3+QnWTTcCkvuB3E0BSdE=
X-Google-Smtp-Source: ABdhPJxiAu+9BpMfR8RUATD7C9VZmKysFuDrtagllnKIKZK6JflBea38k7Y8eI+tACjc/Lz78rgRgw==
X-Received: by 2002:a05:600c:5123:: with SMTP id
 o35mr2921279wms.153.1631767753574; 
 Wed, 15 Sep 2021 21:49:13 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id q11sm6215140wmc.41.2021.09.15.21.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 21:49:12 -0700 (PDT)
Subject: Re: [PATCH v11 05/10] arm/hvf: Add a WFI handler
To: Alexander Graf <agraf@csgraf.de>, QEMU Developers
 <qemu-devel@nongnu.org>, Peter Collingbourne <pcc@google.com>
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-6-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8d255a90-7d7c-fcb6-2d9f-8febe182c286@amsat.org>
Date: Thu, 16 Sep 2021 06:49:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915181049.27597-6-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 8:10 PM, Alexander Graf wrote:
> From: Peter Collingbourne <pcc@google.com>
> 
> Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> up on IPI.
> 
> In this implementation IPI is blocked on the CPU thread at startup and
> pselect() is used to atomically unblock the signal and begin sleeping.
> The signal is sent unconditionally so there's no need to worry about
> races between actually sleeping and the "we think we're sleeping"
> state. It may lead to an extra wakeup but that's better than missing
> it entirely.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> [agraf: Remove unused 'set' variable, always advance PC on WFX trap,
>         support vm stop / continue operations and cntv offsets]
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
> 
> ---

> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 8fe008dab5..49f265cc08 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2,6 +2,7 @@
>   * QEMU Hypervisor.framework support for Apple Silicon
>  
>   * Copyright 2020 Alexander Graf <agraf@csgraf.de>
> + * Copyright 2020 Google LLC
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
>   * See the COPYING file in the top-level directory.
> @@ -490,6 +491,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>  
>  void hvf_kick_vcpu_thread(CPUState *cpu)
>  {
> +    cpus_kick_thread(cpu);

Doesn't this belong to the previous patch?

>      hv_vcpus_exit(&cpu->hvf->fd, 1);
>  }

> +static void hvf_wfi(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    hv_return_t r;
> +    uint64_t ctl;
> +    uint64_t cval;
> +    int64_t ticks_to_sleep;
> +    uint64_t seconds;
> +    uint64_t nanos;
> +
> +    if (cpu->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
> +        /* Interrupt pending, no need to wait */
> +        return;
> +    }
> +
> +    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
> +    assert_hvf_ok(r);
> +
> +    if (!(ctl & 1) || (ctl & 2)) {
> +        /* Timer disabled or masked, just wait for an IPI. */
> +        hvf_wait_for_ipi(cpu, NULL);
> +        return;
> +    }
> +
> +    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
> +    assert_hvf_ok(r);
> +
> +    ticks_to_sleep = cval - hvf_vtimer_val();
> +    if (ticks_to_sleep < 0) {
> +        return;
> +    }
> +
> +    nanos = ticks_to_sleep * gt_cntfrq_period_ns(arm_cpu);
> +    seconds = nanos / NANOSECONDS_PER_SECOND;

muldiv64()?

> +    nanos -= (seconds * NANOSECONDS_PER_SECOND);
> +
> +    /*
> +     * Don't sleep for less than the time a context switch would take,
> +     * so that we can satisfy fast timer requests on the same CPU.
> +     * Measurements on M1 show the sweet spot to be ~2ms.
> +     */
> +    if (!seconds && nanos < (2 * SCALE_MS)) {
> +        return;
> +    }
> +
> +    struct timespec ts = { seconds, nanos };

QEMU style still declares variables at top of function/block.

> +    hvf_wait_for_ipi(cpu, &ts);
> +}

