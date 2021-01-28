Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E54F307B2B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:42:16 +0100 (CET)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5AN5-0004mc-FD
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5ALu-0003fv-ID
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:41:02 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5ALs-0002pZ-IO
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:41:02 -0500
Received: by mail-ej1-x631.google.com with SMTP id ke15so8685509ejc.12
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovn6qPizh5tNkIfibtG4FOUcKgnh1XKLk+62Fr3jlhM=;
 b=eeBqyXt+lMUDvqgO2I3s2QvkZpvR/cv/vetrWNdy7i4f2XcjyijRmC5pWc5iE34Rk1
 TEGKWr0bMnJS0KzbpCvXyBbhxs4ZlMPIEIN4Vps62quNf0ySnK1NDlNisG+b6Aqgr8OR
 RINcUIho6Gp+kVVLv7JvDzU9bhLEM9Bsy6+BWbYdJpG0lGgrgOIMgLJF0DGCnl3LwuJz
 FJEe0T/k1srNTOG9mcaONgeod8NKOK2B4KBr9wF5A5vvBWtEa/dEP934A0BYXRoZxrga
 vyM3uVZkYZ0lRbO9grRcOY7OC+lpcwvK9cL9bkn6p2Eew3oDdOTaIQsK5Lt5dm4Su5Bi
 RZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovn6qPizh5tNkIfibtG4FOUcKgnh1XKLk+62Fr3jlhM=;
 b=oiB+mhzbNgAOz+qqvlrO72cKK0FJptTq1AN/FZqRtBl+8fs5dj/RHZIxxTgOCD2fy2
 XJjnZD3oJ18Z54VPSV9sKSzT6zSrBD+iyOVtUKh1CktU+yYKCM/5MuIMObIMO5xTGq5I
 xz3acfRQm6+BAFHBc54hA1WzvSVLDukl122pX2dGovSynRMgJiq3567W4YhGSHiS+gMM
 TDEIBhEYjk+rLuERdsQsQ+lhXp2uI3cheGo6Vs8X6s0+Vnj6TxSbCTCH5xSYyNilkqsq
 wdLpHEadQUL9ilGLUl1hEMnScM2gH5g3pDSK74WTATC6zXee+K14LnGW6niNpjFQsQn5
 DMFQ==
X-Gm-Message-State: AOAM530mppt2d0zZf07gVZ3Z0BY7Eat165gQtbKtw/48XXBD9Mhl/19u
 qjSOKmVwadwQgUXPBlhtqJtVc2Rhh5EVaz0J08xXAQ==
X-Google-Smtp-Source: ABdhPJywBHXCazJsLWeMx2UIObk+PpljLbEmGS/1Ud9FrccA6QPnwKw3rLLj/tO3rbPVj9QnQAdOz40Ph/Gqn0wpXFk=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr236651ejb.382.1611852057147; 
 Thu, 28 Jan 2021 08:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-11-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-11-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 16:40:45 +0000
Message-ID: <CAFEAcA9f+urL1ZnXY4wZMPfbd04afnpo0wKxVo4N=KYGjh0oNA@mail.gmail.com>
Subject: Re: [PATCH v6 10/11] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> We currently only support GICv2 emulation. To also support GICv3, we will
> need to pass a few system registers into their respective handler functions.
>
> This patch adds handling for all of the required system registers, so that
> we can run with more than 8 vCPUs.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>

So, how much of the GICv3 does Hypervisor.framework expect
userspace to implement ?

Currently we have two GICv3 implementations:
 * hw/intc/arm_gicv3_kvm.c -- which is the stub device that
   handles the KVM in-kernel GICv3
 * hw/intc/arm_gicv3.c -- which is the full-emulation device
   that assumes that it is working with a TCG CPU

Support for HVF GICv3 needs either another one of these or
some serious refactoring of the full-emulation device so that
it doesn't assume that the CPU it's dealing with is a TCG one.
(I suspect the right design is to bite the bullet and make the
implementation follow the hardware in having "the GIC device proper"
and "the GIC CPU interface" separate from each other and communicating
via an API approximately equivalent to the GIC Stream Protocol
as described in the GICv3 architecture specification; but that's
a painful refactor and there might be some other approach less
invasive but still reasonably clean.)

>  static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
>  {
>      ARMCPU *arm_cpu = ARM_CPU(cpu);
> @@ -431,6 +491,39 @@ static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
>      case SYSREG_PMCCNTR_EL0:
>          val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>          break;
> +    case SYSREG_ICC_AP0R0_EL1:
> +    case SYSREG_ICC_AP0R1_EL1:
> +    case SYSREG_ICC_AP0R2_EL1:
> +    case SYSREG_ICC_AP0R3_EL1:
> +    case SYSREG_ICC_AP1R0_EL1:
> +    case SYSREG_ICC_AP1R1_EL1:
> +    case SYSREG_ICC_AP1R2_EL1:
> +    case SYSREG_ICC_AP1R3_EL1:
> +    case SYSREG_ICC_ASGI1R_EL1:
> +    case SYSREG_ICC_BPR0_EL1:
> +    case SYSREG_ICC_BPR1_EL1:
> +    case SYSREG_ICC_DIR_EL1:
> +    case SYSREG_ICC_EOIR0_EL1:
> +    case SYSREG_ICC_EOIR1_EL1:
> +    case SYSREG_ICC_HPPIR0_EL1:
> +    case SYSREG_ICC_HPPIR1_EL1:
> +    case SYSREG_ICC_IAR0_EL1:
> +    case SYSREG_ICC_IAR1_EL1:
> +    case SYSREG_ICC_IGRPEN0_EL1:
> +    case SYSREG_ICC_IGRPEN1_EL1:
> +    case SYSREG_ICC_PMR_EL1:
> +    case SYSREG_ICC_SGI0R_EL1:
> +    case SYSREG_ICC_SGI1R_EL1:
> +    case SYSREG_ICC_SRE_EL1:
> +        val = hvf_sysreg_read_cp(cpu, reg);
> +        break;
> +    case SYSREG_ICC_CTLR_EL1:
> +        val = hvf_sysreg_read_cp(cpu, reg);
> +
> +        /* AP0R registers above 0 don't trap, expose less PRIs to fit */
> +        val &= ~ICC_CTLR_EL1_PRIBITS_MASK;
> +        val |= 4 << ICC_CTLR_EL1_PRIBITS_SHIFT;
> +        break;

Pretty sure you don't want to be trying to squeeze even the
GICv3 cpuif implementation into this source file...

>      default:
>          DPRINTF("unhandled sysreg read %08x (op0=%d op1=%d op2=%d "
>                  "crn=%d crm=%d)", reg, (reg >> 20) & 0x3,
> @@ -442,6 +535,24 @@ static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
>      return val;
>  }
>
> +static void hvf_sysreg_write_cp(CPUState *cpu, uint32_t reg, uint64_t val)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    const ARMCPRegInfo *ri;
> +
> +    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
> +
> +    if (ri) {
> +        if (ri->writefn) {
> +            ri->writefn(env, ri, val);
> +        } else {
> +            CPREG_FIELD64(env, ri) = val;
> +        }
> +        DPRINTF("vgic write to %s [val=%016llx]", ri->name, val);
> +    }
> +}
> +
>  static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>  {
>      ARMCPU *arm_cpu = ARM_CPU(cpu);
> @@ -449,6 +560,36 @@ static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>      switch (reg) {
>      case SYSREG_CNTPCT_EL0:
>          break;
> +    case SYSREG_ICC_AP0R0_EL1:
> +    case SYSREG_ICC_AP0R1_EL1:
> +    case SYSREG_ICC_AP0R2_EL1:
> +    case SYSREG_ICC_AP0R3_EL1:
> +    case SYSREG_ICC_AP1R0_EL1:
> +    case SYSREG_ICC_AP1R1_EL1:
> +    case SYSREG_ICC_AP1R2_EL1:
> +    case SYSREG_ICC_AP1R3_EL1:
> +    case SYSREG_ICC_ASGI1R_EL1:
> +    case SYSREG_ICC_BPR0_EL1:
> +    case SYSREG_ICC_BPR1_EL1:
> +    case SYSREG_ICC_CTLR_EL1:
> +    case SYSREG_ICC_DIR_EL1:
> +    case SYSREG_ICC_HPPIR0_EL1:
> +    case SYSREG_ICC_HPPIR1_EL1:
> +    case SYSREG_ICC_IAR0_EL1:
> +    case SYSREG_ICC_IAR1_EL1:
> +    case SYSREG_ICC_IGRPEN0_EL1:
> +    case SYSREG_ICC_IGRPEN1_EL1:
> +    case SYSREG_ICC_PMR_EL1:
> +    case SYSREG_ICC_SGI0R_EL1:
> +    case SYSREG_ICC_SGI1R_EL1:
> +    case SYSREG_ICC_SRE_EL1:
> +        hvf_sysreg_write_cp(cpu, reg, val);
> +        break;
> +    case SYSREG_ICC_EOIR0_EL1:
> +    case SYSREG_ICC_EOIR1_EL1:
> +        hvf_sysreg_write_cp(cpu, reg, val);
> +        qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 0);
> +        hv_vcpu_set_vtimer_mask(cpu->hvf->fd, false);

This definitely looks wrong. Not every interrupt is
a timer interrupt, and writing to EOIR in the GIC doesn't
squelch the underlying timer irq, that should happen somewhere
else.

thanks
-- PMM

