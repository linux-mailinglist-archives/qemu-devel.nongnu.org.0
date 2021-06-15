Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6CD3A7C2C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:39:35 +0200 (CEST)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6Tm-0007gV-HF
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6Sz-0006mt-Fe
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:38:45 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6Sx-000513-JA
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:38:45 -0400
Received: by mail-ej1-x62e.google.com with SMTP id nb6so1586284ejc.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vv/CT0fKvaPeFR3Ti4jdnOBGVsF+9TG7IqZ4f54M//k=;
 b=VScNS8XHIdufHOveytkWiJmhYLwwk6Gi1w7lvdx3b2OBCbSQLgpReXBKpEUXiUfNeH
 1CY7xQlcSdsY0YIT/IybF1W0ni6MeWUdPlLg50xm4OVgkJMj8Yb/lL1+pFz3dDbvHWrU
 PWLJnsT7G6P4TNQOQuVTxvJuQRdLZdanJclOXNdFyz2ngN9zQApwZS1ltdZXwQd4SsvF
 sJHldvtEFcDOW26yfizY1XIRRt0MulKYywcDcH0zfqcRGv6rxxGine93xMGRPvXZhh4a
 i6D2m8q+xf4YPmBg9lLp7DbWGIU9r+dOAeG0I9k4RtsM8oAOJtnGxwrzTGO5fjFL0TTV
 do5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vv/CT0fKvaPeFR3Ti4jdnOBGVsF+9TG7IqZ4f54M//k=;
 b=WXZAe9Zwzn+SBns8rHrKg0eE53R9xoCjctwgxUQC1NmsIv/o5B9RXhxNEokThCQWmn
 toRg8oOviWPCaSkQwIMmksWLAHkWZ0QE3y480oummTHpvl0zM+VYP2/PC50GrE7VJ2g+
 tADtuqtmLKGh7dHmYMHoD2ojOdQOADeoPpAIPbxDaO3DyGaMTo05ARf2uNFCrH/J9/7t
 dezy/KAu16toa1AebzVhCgaPAHt9aLgF9Tqh27vAEr+KCFKKhxxlNkofKFW4VzyqaOi8
 UOKGch5rYNdW/LOzWHViSQ3mFSbdoWEYI1CPU/8ry8PtLOhsZ0ECcrjg+3RiEI7w0nxd
 xeLQ==
X-Gm-Message-State: AOAM533Kioado/Fn1uMYfrYHFwuluKLjKMQ1ifIfjTMswgHr4tUvp1JC
 VawWAO0XwEfHtgU5UZPaZEJPqdG3XFQ2FWN+2e6r8g==
X-Google-Smtp-Source: ABdhPJzpWmzkNWLeNpL7LrRnrYHIWKTHqmR0dR4hlXZcbuByIGG3djyoUkmVbLc3b/7K/tISxhGls5Gh/Rn5u9JASj0=
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr19719725ejz.382.1623753521874; 
 Tue, 15 Jun 2021 03:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-15-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-15-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 11:38:07 +0100
Message-ID: <CAFEAcA9ATvn2yp=_VPitFRnWzZacGy7aodQGNTPMnwsUoFr0xA@mail.gmail.com>
Subject: Re: [PATCH v8 14/19] arm/hvf: Add a WFI handler
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
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
> [agraf: Remove unused 'set' variable, always advance PC on WFX trap]
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>
> ---

> +static void hvf_wfi(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    hv_return_t r;
> +    uint64_t ctl;
> +
> +    if (cpu->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
> +        /* Interrupt pending, no need to wait */
> +        return;
> +    }
> +
> +    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
> +                            &ctl);
> +    assert_hvf_ok(r);
> +
> +    if (!(ctl & 1) || (ctl & 2)) {
> +        /* Timer disabled or masked, just wait for an IPI. */
> +        hvf_wait_for_ipi(cpu, NULL);
> +        return;
> +    }
> +
> +    uint64_t cval;
> +    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
> +                            &cval);
> +    assert_hvf_ok(r);
> +
> +    int64_t ticks_to_sleep = cval - mach_absolute_time();

This looks odd. The CNTV_CVAL is the compare value against
the CNTVCT (virtual count), which should start at 0 when the
VM starts, pause when the VM is paused, and so on. But here
we are comparing it against what looks like a host absolute
timecount...

> +    if (ticks_to_sleep < 0) {
> +        return;
> +    }
> +
> +    uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
> +    uint64_t nanos =
> +        (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
> +        1000000000 / arm_cpu->gt_cntfrq_hz;

Should this be calling gt_cntfrq_period_ns() ?
(If not, please use the NANOSECONDS_PER_SECOND constant instead of
a raw 1000000000.)

> +
> +    /*
> +     * Don't sleep for less than the time a context switch would take,
> +     * so that we can satisfy fast timer requests on the same CPU.
> +     * Measurements on M1 show the sweet spot to be ~2ms.
> +     */
> +    if (!seconds && nanos < 2000000) {

"2 * SCALE_MS" is a bit easier to read I think.

> +        return;
> +    }
> +
> +    struct timespec ts = { seconds, nanos };
> +    hvf_wait_for_ipi(cpu, &ts);
> +}

thanks
-- PMM

