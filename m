Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20271307AF3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:27:50 +0100 (CET)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5A97-00029i-7O
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5A7G-0000ie-Ih
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:25:54 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5A7E-0005GL-B7
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:25:54 -0500
Received: by mail-ed1-x536.google.com with SMTP id d2so7323817edz.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tJuGslgeW7w4cAv44iEm6ui16UJgZucXEB/uRmVEIrs=;
 b=UcmAC4E9+LvX0HJlehbjSZR5vVMgK7rVTCQV1n5kBA8OgFxe0hWCYvN9jKbUDGDWHh
 461Iu6A5GArzS3XPJSyLcxSxBcXAuKFHdh3BQcs4UqQY+ShgCGdLecXxbm9abSSbB1c7
 yjl3RrxT5+GB8Cr8FH3V7LuOhNFDIiVxug8lyW0s0oPIoXCgTna5j9xVnV0UAEQh29Nq
 WWcWRgzX0uAZVhLifrmsQSVu4d0yzM+J2WPou/kTFHH8HsFWpLl+ewjH/Cnoi6apKH39
 +5JbJ9J46IUL4ciNuYeYAKLPj/2FOmVguQsX6/evgE2/QOkC3IUmD9rn6ltQnvgUOlOD
 V1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tJuGslgeW7w4cAv44iEm6ui16UJgZucXEB/uRmVEIrs=;
 b=bNAnbjCaiSan1Y8xQ0abL96lYsWHf4diJAlv6/gRyTS9kBwVAqlMEFa1TxhSklonfM
 JZ+vrA924C2Y3sHeHnDweE6FEFxdxjq10rRmdOCQ1ZgU0tMtdCGEw4elSJLoUFSlazZN
 MieeKH9HKzSC43UH+8C5WZV0DVGlk6eClpOOR9GBUl/gK+8DaiXMhwdPfhDG8XZDFMoz
 0WvodVpjH34e8T0CF0JfILpwYS71g/54TcWTVa7GrAYNOmCYWUGrIRbwJqMHJPXp9tUF
 dx8FAoigCdZuCw3SSkSfjRxae/oSQTHgHCjA5z2zYSQYvsEuGD0TkOtURsGs/a9SfRxs
 A7ow==
X-Gm-Message-State: AOAM5318NvZhF6f4Yp21jSaSGZ2PDQejWtsnNjKa+qVMdAjGt+HC8Cvt
 krti9gshfUlwrcUPNy8nXabze5bcWZ3hyliFXbtRkQ==
X-Google-Smtp-Source: ABdhPJxei/RWxTdcY9JIW0jILLK8i1rQZwjJQ69EqJCkNzPSWssmwKpw+lAIye6GsVahdOofzKl8tsoyUIiC6nNmjA0=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr381301edd.52.1611851150324; 
 Thu, 28 Jan 2021 08:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-10-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-10-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 16:25:39 +0000
Message-ID: <CAFEAcA_KFzEERYJ9d8YbPjhCv1rt9O9w567xP=ECqixLie5nmQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/11] arm/hvf: Add a WFI handler
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
> ---
>  accel/hvf/hvf-cpus.c     |  5 ++--
>  include/sysemu/hvf_int.h |  1 +
>  target/arm/hvf/hvf.c     | 56 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 59 insertions(+), 3 deletions(-)
>
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index 6d70ee742e..abef6a58f7 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -322,15 +322,14 @@ static int hvf_init_vcpu(CPUState *cpu)
>      cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
>
>      /* init cpu signals */
> -    sigset_t set;
>      struct sigaction sigact;
>
>      memset(&sigact, 0, sizeof(sigact));
>      sigact.sa_handler = dummy_signal;
>      sigaction(SIG_IPI, &sigact, NULL);
>
> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> -    sigdelset(&set, SIG_IPI);
> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
>
>  #ifdef __aarch64__
>      r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> index c2ac6c8f97..7a397fe85a 100644
> --- a/include/sysemu/hvf_int.h
> +++ b/include/sysemu/hvf_int.h
> @@ -51,6 +51,7 @@ extern HVFState *hvf_state;
>  struct hvf_vcpu_state {
>      uint64_t fd;
>      void *exit;
> +    sigset_t unblock_ipi_mask;
>  };
>
>  void assert_hvf_ok(hv_return_t ret);
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 8f18efe856..f0850ab14a 100644
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
> @@ -17,6 +18,8 @@
>  #include "sysemu/hvf_int.h"
>  #include "sysemu/hw_accel.h"
>
> +#include <mach/mach_time.h>
> +
>  #include "exec/address-spaces.h"
>  #include "hw/irq.h"
>  #include "qemu/main-loop.h"
> @@ -411,6 +414,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>
>  void hvf_kick_vcpu_thread(CPUState *cpu)
>  {
> +    cpus_kick_thread(cpu);
>      hv_vcpus_exit(&cpu->hvf->fd, 1);
>  }
>
> @@ -466,6 +470,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
>      return 0;
>  }
>
> +static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
> +{
> +    /*
> +     * Use pselect to sleep so that other threads can IPI us while we're
> +     * sleeping.
> +     */
> +    qatomic_mb_set(&cpu->thread_kicked, false);
> +    qemu_mutex_unlock_iothread();
> +    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
> +    qemu_mutex_lock_iothread();
> +}

It seems a bit odd that this is specific to Arm hvf.
Doesn't x86 hvf need "pause until interrupt" functionality ?

> +
>  int hvf_vcpu_exec(CPUState *cpu)
>  {
>      ARMCPU *arm_cpu = ARM_CPU(cpu);
> @@ -577,6 +593,46 @@ int hvf_vcpu_exec(CPUState *cpu)
>          }
>          case EC_WFX_TRAP:
>              advance_pc = true;
> +            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
> +                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> +
> +                uint64_t ctl;
> +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
> +                                        &ctl);
> +                assert_hvf_ok(r);
> +
> +                if (!(ctl & 1) || (ctl & 2)) {
> +                    /* Timer disabled or masked, just wait for an IPI. */
> +                    hvf_wait_for_ipi(cpu, NULL);
> +                    break;
> +                }
> +
> +                uint64_t cval;
> +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
> +                                        &cval);
> +                assert_hvf_ok(r);
> +
> +                int64_t ticks_to_sleep = cval - mach_absolute_time();
> +                if (ticks_to_sleep < 0) {
> +                    break;
> +                }
> +
> +                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
> +                uint64_t nanos =
> +                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
> +                    1000000000 / arm_cpu->gt_cntfrq_hz;
> +
> +                /*
> +                 * Don't sleep for less than 2ms. This is believed to improve
> +                 * latency of message passing workloads.
> +                 */

Believed by who ?

> +                if (!seconds && nanos < 2000000) {
> +                    break;
> +                }
> +
> +                struct timespec ts = { seconds, nanos };
> +                hvf_wait_for_ipi(cpu, &ts);
> +            }

Why doesn't the timer timeout manifest as an IPI ? (Put another way,
why is the timer interrupt special?)

thanks
-- PMM

