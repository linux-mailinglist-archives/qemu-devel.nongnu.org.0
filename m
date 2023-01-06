Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25F660475
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 17:39:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDpjK-00071K-3s; Fri, 06 Jan 2023 11:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpjH-00070U-B7
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:38:03 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpjF-0006iZ-NH
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:38:03 -0500
Received: by mail-pf1-x42e.google.com with SMTP id x26so1417290pfq.10
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 08:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnMcY2Ouym7/EXDLo44h2SAEPrFtaGI0tmRFNuUqLII=;
 b=cSQybS+DoKFvPoLnlC0V9ev4gtIqhyX4kgfanJn+5WlPttYju7xyomMV7M5Qf9uNDz
 pI+G/q7v7EN5mcqnUWZA4TmpERIEBWM2oz2XtY3HmZfsM8sphxJxuc9cq08JmpPt8qVl
 IyhupQGQ4Mzw8XM7Az3nyDlBA9WdoVCytsu945nUn+5tuHNS95FZ6CnG9Mwh7TyAb9dQ
 z8NjB/7vyJjx69S95QI/eCmczhU5F/4eq3fhWtYJBccOGvrtWzl6Va68LyZoA9BUMjEV
 rke0DB32huX0ta3g+R4gilG5G97epH0TSIZKmksJx2vWypxvmkNDM1fCZxpInVdRHApZ
 rmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZnMcY2Ouym7/EXDLo44h2SAEPrFtaGI0tmRFNuUqLII=;
 b=UNqLlvIwey6Z4SDKPKkZEOjVIKJVTQuASJfQPJxyEvpjFuy/LIDJ2GaufGJJKhaXLP
 Slc9bvI/LtgQwTPPJ5rD2+rI0IMlnoGxwHllRfqSYroOk7i4D6E8KycBvS7j45wuebLu
 1Bp9mQCFMoPbCm5DzDID8MKHG8hjNF1/1XA5EDyshIOb6pu4sn2vLJ8qmKr5wxnVM3J6
 bHHkHRHuPMZViHu9qebzR2DL+wMsO9zBw9Z3wHwk8xrYdYdk2jmAyRaJLAAJeh2VILSI
 YOvFaRmWImsc4ylHyLis/r4qlVWZZGwfvE6O67E/EKkG0KjSHi+IhdhGa2YFhB2JGLfE
 zM+A==
X-Gm-Message-State: AFqh2krOjk7JAnMUufLTEcOwUZGR8glFAts7Vz+AKqfGlU3+RrtUdB27
 ZacrYsEJtFlwofpCEVLDcdYroPzgurML5Z9REFOaOxn/BS84ZA==
X-Google-Smtp-Source: AMrXdXsb2N/FOj/13OSn4RvEuAiUFK51AEBZ/ZrFgXZUsisZfoMP12ZAs25tUjKikIP3aNklsWSRevxGfcGh7ykqzkM=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2568544pgd.192.1673023079906; Fri, 06
 Jan 2023 08:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20221219220808.26392-1-agraf@csgraf.de>
In-Reply-To: <20221219220808.26392-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 16:37:48 +0000
Message-ID: <CAFEAcA-bp_r07s7VQDMbWm=f1iV0rfB8XsZUUqpxENnn5fTe+g@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 19 Dec 2022 at 22:08, Alexander Graf <agraf@csgraf.de> wrote:
>
> We currently only support GICv2 emulation. To also support GICv3, we will
> need to pass a few system registers into their respective handler functions.
>
> This patch adds support for HVF to call into the TCG callbacks for GICv3
> system register handlers. This is safe because the GICv3 TCG code is generic
> as long as we limit ourselves to EL0 and EL1 - which are the only modes
> supported by HVF.
>
> To make sure nobody trips over that, we also annotate callbacks that don't
> work in HVF mode, such as EL state change hooks.
>
> With GICv3 support in place, we can run with more than 8 vCPUs.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  hw/intc/arm_gicv3_cpuif.c   |   8 +-
>  target/arm/hvf/hvf.c        | 151 ++++++++++++++++++++++++++++++++++++
>  target/arm/hvf/trace-events |   2 +
>  3 files changed, 160 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index b17b29288c..b4e387268c 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -21,6 +21,7 @@
>  #include "hw/irq.h"
>  #include "cpu.h"
>  #include "target/arm/cpregs.h"
> +#include "sysemu/tcg.h"
>
>  /*
>   * Special case return value from hppvi_index(); must be larger than
> @@ -2810,6 +2811,8 @@ void gicv3_init_cpuif(GICv3State *s)
>           * which case we'd get the wrong value.
>           * So instead we define the regs with no ri->opaque info, and
>           * get back to the GICv3CPUState from the CPUARMState.
> +         *
> +         * These CP regs callbacks can be called from either TCG or HVF code.
>           */
>          define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
>
> @@ -2905,6 +2908,9 @@ void gicv3_init_cpuif(GICv3State *s)
>                  define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr23_reginfo);
>              }
>          }
> -        arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
> +        if (tcg_enabled()) {
> +            /* We can only trap EL changes with TCG for now */

We could expand this a bit:

 We can only trap EL changes with TCG. However the GIC interrupt
 state only changes on EL changes involving EL2 or EL3, so for
 the non-TCG case this is OK, as EL2 and EL3 can't exist.

and assert:
 assert(!arm_feature(&cpu->env, ARM_FEATURE_EL2));
 assert(!arm_feature(&cpu->env, ARM_FEATURE_EL3));

> +static uint32_t hvf_reg2cp_reg(uint32_t reg)
> +{
> +    return ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP,
> +                              (reg >> 10) & 0xf,
> +                              (reg >> 1) & 0xf,
> +                              (reg >> 20) & 0x3,
> +                              (reg >> 14) & 0x7,
> +                              (reg >> 17) & 0x7);

This file has #defines for these shift and mask constants
(SYSREG_OP0_SHIFT etc).

> +}
> +
> +static bool hvf_sysreg_read_cp(CPUState *cpu, uint32_t reg, uint64_t *val)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    const ARMCPRegInfo *ri;
> +
> +    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
> +    if (ri) {
> +        if (ri->accessfn) {
> +            if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
> +                return false;
> +            }
> +        }
> +        if (ri->type & ARM_CP_CONST) {
> +            *val = ri->resetvalue;
> +        } else if (ri->readfn) {
> +            *val = ri->readfn(env, ri);
> +        } else {
> +            *val = CPREG_FIELD64(env, ri);
> +        }
> +        trace_hvf_vgic_read(ri->name, *val);
> +        return true;
> +    }

Can we get here for attempts by EL0 to access EL1-only
sysregs, or does hvf send the exception to EL1 without
trapping out to us? If we can get here for EL0 accesses we
need to check against ri->access as well as ri->accessfn.

Otherwise looks OK.

thanks

-- PMM

