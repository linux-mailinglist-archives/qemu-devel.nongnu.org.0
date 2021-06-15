Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5721A3A7BB2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:24:00 +0200 (CEST)
Received: from localhost ([::1]:35696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6Eh-0000V5-DY
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6DH-0007M7-Sn
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:22:31 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6DD-00033u-UG
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:22:31 -0400
Received: by mail-ej1-x633.google.com with SMTP id ce15so21634668ejb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9azD7iTlX04ScARs1Si5lnLC62HE78SxPt9JKnk/ps8=;
 b=cP1EN7je0CzRNq4jLRNEoIhoVO5gc4pywaWkHI0BoiePnmRlpLuvUdh+zLbCAa71da
 VyWg2EUVN+uFs3ltKzl9T48ST8d3FNjMOUdkDACCdCVhYw5Bx8FzpxEOgDunfRUVtz0I
 ICbSEW42iZ00VhV67uD6Pe9wV2cR6qpsbPvRkPDelbT6WNvmXet5+x0SVtstqYBTqa0k
 0CUvmF9KxNM6lUIKy+AJQUPSh5fDZCpX/3rxHybDbpadlJ4arlE++RO+abuFcADXr/86
 6TPrLDwEQHoToCMU8jQOOORXno15+G8TiyIQX8D+CtCdVg6XRxTYAOwn36/bqMeNEd0K
 efGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9azD7iTlX04ScARs1Si5lnLC62HE78SxPt9JKnk/ps8=;
 b=RF/NXmVGa+8KEt9YguaTUM8Ahy2GpyDXFJfqGhcwcwWUot/3Om9TI4FfKs6muPTGLn
 b58K8jQWoHEZ4Vst3UcieIWpXsKiiM9ACgBPE/h2K9noFZ40UfUxCUQkzZvrI2Y/NV+p
 ysAm/nGFSblKG/d+utOYbIZi+PhKLdBCQN48Y9rfdRqPJmrmeQofaRSY0PuYRj8xhbGi
 ng2hiyRt1v5HD8IQY6IQGiIAL9j9+T+jwWHY9TZ3GYcC/6bjAEVhOvFd8EeQvIl2I3TP
 1O3Hj8zPcJAoa+4xNryHY+hgXblAXBCUWUxP/lqVz44wZgqeBjaLOUSZdzPmg7eg/d6i
 SBlg==
X-Gm-Message-State: AOAM533MQM/a/sMsRmrFij2IzxXhfGcVIp/e6xiKJ0r9LOWhBtzcqTK5
 sTCo6xDjxHSgVBkcNNmTpXObU1ugC9JS2TMG1iLWrQ==
X-Google-Smtp-Source: ABdhPJy80DPUVnrawR2QsPruizMhAfRbK/RwZW1r/j+/ddmfmbxFJKKLwM73sROiTWi6gWcKThTKhgLrKw7lmX5umTI=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr20366348ejb.56.1623752546326; 
 Tue, 15 Jun 2021 03:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-14-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-14-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 11:21:51 +0100
Message-ID: <CAFEAcA_M6SB8f4X1z=P4+pZ0Q-H3vdhvgu8ZsQLxZFro5TuiVQ@mail.gmail.com>
Subject: Re: [PATCH v8 13/19] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
> With Apple Silicon available to the masses, it's a good time to add support
> for driving its virtualization extensions from QEMU.
>
> This patch adds all necessary architecture specific code to get basic VMs
> working. It's still pretty raw, but definitely functional.
>
> Known limitations:
>
>   - Vtimer acknowledgement is hacky
>   - Should implement more sysregs and fault on invalid ones then
>   - WFI handling is missing, need to marry it with vtimer
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> @@ -446,11 +454,17 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
>                         cpu, QEMU_THREAD_JOINABLE);
>  }
>
> +__attribute__((weak)) void hvf_kick_vcpu_thread(CPUState *cpu)
> +{
> +    cpus_kick_thread(cpu);
> +}

Why is this marked 'weak' ? If there's a reason for it then
it ought to have a comment describing the reason. If we can avoid
it then we should do so -- past experience is that 'weak' refs
are rather non-portable, though at least this one is in a
host-OS-specific file.

> +static void hvf_raise_exception(CPUARMState *env, uint32_t excp,
> +                                uint32_t syndrome)
> +{
> +    unsigned int new_el = 1;
> +    unsigned int old_mode = pstate_read(env);
> +    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
> +    target_ulong addr = env->cp15.vbar_el[new_el];
> +
> +    env->cp15.esr_el[new_el] = syndrome;
> +    aarch64_save_sp(env, arm_current_el(env));
> +    env->elr_el[new_el] = env->pc;
> +    env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
> +    pstate_write(env, PSTATE_DAIF | new_mode);
> +    aarch64_restore_sp(env, new_el);
> +    env->pc = addr;
> +}

KVM does "raise an exception" by calling arm_cpu_do_interrupt()
to do the "set ESR_ELx, save SPSR, etc etc" work (see eg
kvm_arm_handle_debug()". Does that not work here ?

> +
> +static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    uint64_t val = 0;
> +
> +    switch (reg) {
> +    case SYSREG_CNTPCT_EL0:
> +        val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
> +              gt_cntfrq_period_ns(arm_cpu);
> +        break;

Does hvf handle the "EL0 access which should be denied because
CNTKCTL_EL1.EL0PCTEN is 0" case for us, or should we have
an access-check here ?

> +    case SYSREG_PMCCNTR_EL0:
> +        val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);

This is supposed to be a cycle counter, not a timestamp...

> +        break;
> +    default:
> +        trace_hvf_unhandled_sysreg_read(reg,
> +                                        (reg >> 20) & 0x3,
> +                                        (reg >> 14) & 0x7,
> +                                        (reg >> 10) & 0xf,
> +                                        (reg >> 1) & 0xf,
> +                                        (reg >> 17) & 0x7);
> +        break;
> +    }
> +
> +    return val;
> +}
> +
> +static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
> +{
> +    switch (reg) {
> +    case SYSREG_CNTPCT_EL0:
> +        break;

CNTPCT_EL0 is read-only (ie writes should fault) but this
makes it writes-ignored, doesn't it ?

> +    default:
> +        trace_hvf_unhandled_sysreg_write(reg,
> +                                         (reg >> 20) & 0x3,
> +                                         (reg >> 14) & 0x7,
> +                                         (reg >> 10) & 0xf,
> +                                         (reg >> 1) & 0xf,
> +                                         (reg >> 17) & 0x7);
> +        break;
> +    }
> +}

> +    switch (ec) {
> +    case EC_DATAABORT: {
> +        bool isv = syndrome & ARM_EL_ISV;
> +        bool iswrite = (syndrome >> 6) & 1;
> +        bool s1ptw = (syndrome >> 7) & 1;
> +        uint32_t sas = (syndrome >> 22) & 3;
> +        uint32_t len = 1 << sas;
> +        uint32_t srt = (syndrome >> 16) & 0x1f;
> +        uint64_t val = 0;
> +
> +        trace_hvf_data_abort(env->pc, hvf_exit->exception.virtual_address,
> +                             hvf_exit->exception.physical_address, isv,
> +                             iswrite, s1ptw, len, srt);
> +
> +        assert(isv);

This seems dubious -- won't we just crash if the guest does
a data access to a device or to unmapped memory with an insn that
doesn't set ISV ? With KVM we feed this back to the guest as an
external data abort (see the KVM_EXIT_ARM_NISV handling).

> +
> +        if (iswrite) {
> +            val = hvf_get_reg(cpu, srt);
> +            address_space_write(&address_space_memory,
> +                                hvf_exit->exception.physical_address,
> +                                MEMTXATTRS_UNSPECIFIED, &val, len);
> +        } else {
> +            address_space_read(&address_space_memory,
> +                               hvf_exit->exception.physical_address,
> +                               MEMTXATTRS_UNSPECIFIED, &val, len);
> +            hvf_set_reg(cpu, srt, val);
> +        }
> +
> +        advance_pc = true;
> +        break;
> +    }
> +    case EC_SYSTEMREGISTERTRAP: {
> +        bool isread = (syndrome >> 0) & 1;
> +        uint32_t rt = (syndrome >> 5) & 0x1f;
> +        uint32_t reg = syndrome & SYSREG_MASK;
> +        uint64_t val = 0;
> +
> +        if (isread) {
> +            val = hvf_sysreg_read(cpu, reg);
> +            trace_hvf_sysreg_read(reg,
> +                                  (reg >> 20) & 0x3,
> +                                  (reg >> 14) & 0x7,
> +                                  (reg >> 10) & 0xf,
> +                                  (reg >> 1) & 0xf,
> +                                  (reg >> 17) & 0x7,
> +                                  val);
> +            hvf_set_reg(cpu, rt, val);
> +        } else {
> +            val = hvf_get_reg(cpu, rt);
> +            trace_hvf_sysreg_write(reg,
> +                                   (reg >> 20) & 0x3,
> +                                   (reg >> 14) & 0x7,
> +                                   (reg >> 10) & 0xf,
> +                                   (reg >> 1) & 0xf,
> +                                   (reg >> 17) & 0x7,
> +                                   val);
> +            hvf_sysreg_write(cpu, reg, val);
> +        }

This needs support for "this really was a bogus system register
access, feed the guest an exception".

> +
> +        advance_pc = true;
> +        break;
> +    }
> +    case EC_WFX_TRAP:
> +        advance_pc = true;
> +        break;
> +    case EC_AA64_HVC:
> +        cpu_synchronize_state(cpu);
> +        trace_hvf_unknown_hvf(env->xregs[0]);
> +        hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
> +        break;
> +    case EC_AA64_SMC:
> +        cpu_synchronize_state(cpu);
> +        trace_hvf_unknown_smc(env->xregs[0]);
> +        hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
> +        break;
> +    default:
> +        cpu_synchronize_state(cpu);
> +        trace_hvf_exit(syndrome, ec, env->pc);
> +        error_report("0x%llx: unhandled exit 0x%llx", env->pc, exit_reason);
> +    }
> +
> +    if (advance_pc) {
> +        uint64_t pc;
> +
> +        flush_cpu_state(cpu);
> +
> +        r = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_PC, &pc);
> +        assert_hvf_ok(r);
> +        pc += 4;
> +        r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
> +        assert_hvf_ok(r);
> +    }
> +
> +    return 0;
> +}

thanks
-- PMM

