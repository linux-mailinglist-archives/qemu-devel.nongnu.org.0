Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A140CB5D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:03:50 +0200 (CEST)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQYK5-00039C-FY
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mQY0W-0003Qz-2f
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:37 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:39448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mQY0L-0006St-BF
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:35 -0400
Received: by mail-vs1-xe29.google.com with SMTP id o124so3366419vsc.6
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RoCQKFI5SlTvKEyQoeQcQPE1WStDQrRPWiSHmbfObk0=;
 b=Dey8lnYw8GG2uSzqOXZ3GDR6LpP/IVIYSaHUPWJstFNjkI+E2wkQgDBu6CLSxCCRdD
 ZfCZPBvNOOmR5EszLY8GcKHllzinLNU+0IM4f2REgW8QJR8z8fR1P4moFjnQftVqcuzT
 iieB9inEzj4yGnBOmys0b4VO5+WCWaXx5j4ngcGsAqS0DyY2vNP4HMcbjHeddLzabIuQ
 or3XlI6TR6ZOoNML3t5wLGjJipmidDlqEYjLj9s3Mlq75pnYH4Ul5Pcz/kQtq/gtF5Ko
 sjelHBC2CBhTlDg2LtcDYXjNvqs6IEkDWjf9x0cph1eYiJ51mriWpDC1MoiJP+6uxLtW
 5+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RoCQKFI5SlTvKEyQoeQcQPE1WStDQrRPWiSHmbfObk0=;
 b=huM9co628/zxzh+bLP/Mf/fYH4T1YLNCs/kfWiWM+S7yHc/FFekcpnxuIbQQ3PryPt
 Rb6eRi/y7g5+PtiLDACntWDKLouQ2PlwATdyr+K7VfOpJTw3kbFfLskBru8SbLtckuLW
 MDb+4gJdZHDI2MsSVRSsy5QnHIPtPbnWz6ukB5Xo7ti3jrV0fQple1qjDsY/swgken5R
 D+gzt/IjOSgVKhuTSthCcpt7eRDsacmMB9z9I9bDo2pzi74kOiqzukawSkbb8kD+xXH6
 Ihifx43pPAKwdE0nJamSYZ33pMpJ3JI//UgOL4zQb9fvXLgGfc+BfmBY9WI9nxL5FaHR
 dIrg==
X-Gm-Message-State: AOAM531IM+zYoz62Z86bVF2bjFL3/QpHryJiqRcbsYonzi+f+tAC7cee
 dkQo74j5Ef60wS7RJ+EqAG1aE24Gwaz2/fvsOzY4yg==
X-Google-Smtp-Source: ABdhPJwpttsrIlj8n7lJQmvr7cuAPFdlNY3eH6GjRfPDrs9V4z0vMDEKA7gphwgiVDSNkjH0XxhJMeZxvUWC+zTFpp0=
X-Received: by 2002:a67:d589:: with SMTP id m9mr648599vsj.30.1631724203304;
 Wed, 15 Sep 2021 09:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210913220552.604064-1-richard.henderson@linaro.org>
 <20210913220552.604064-8-richard.henderson@linaro.org>
In-Reply-To: <20210913220552.604064-8-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 15 Sep 2021 10:43:12 -0600
Message-ID: <CANCZdfrYpbeDChw_EHNUoJT7M5Qz=d67HLjdfo_gm-iOLB=Zeg@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] linux-user: Reorg cpu_signal_handler
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000082967a05cc0b65ea"
Received-SPF: none client-ip=2607:f8b0:4864:20::e29;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000082967a05cc0b65ea
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 4:06 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Split out two functions into linux-user/host/arch/host-signal.h.
> Since linux-user requires a linux host, drop all of the BSD and
> Solaris ifdefs.  These should be recreated under bsd-user/ when
> the current blanks there are filled.
>

For some architectures, this code will be small and host specific (I'm
thinking
arm, i386, ppc* and x86_64) but for others, there's common code that can be
shared
to parse the instruction (aarch64, mips*, riscv*). Do you see any value in
sharing that instruction parsing code in some way?

Otherwise, this is mostly just code shuffling and figuring out which of
the long legacy of ifdefs are still relevant in the *BSD world. At the
moment, we only build bsd-user on FreeBSD since the scaffolding
for the other BSDs is absent. I can cope when I merge this into the
bsd-user fork and loop things back when those bits are up for inclusion
in future patch trains.

Warner


> Fold the remnants of handle_cpu_signal into host_signal_handler.
>
> Drop the call to cc->tcg_ops->tlb_fill.  This was simply an indirect
> method to raise SIGSEGV; it is far easier to pass the host siginfo_t
> along to the guest.  This fixes all of the guest cpu_loop code that
> currently fails to properly fill in SEGV_MAPERR vs SEGV_ACCERR.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h               |  12 -
>  linux-user/host/aarch64/host-signal.h |  73 +++
>  linux-user/host/alpha/host-signal.h   |  41 ++
>  linux-user/host/arm/host-signal.h     |  30 ++
>  linux-user/host/i386/host-signal.h    |  24 +
>  linux-user/host/mips/host-signal.h    |  61 +++
>  linux-user/host/ppc/host-signal.h     |  24 +
>  linux-user/host/ppc64/host-signal.h   |   1 +
>  linux-user/host/riscv32/host-signal.h |  57 +++
>  linux-user/host/riscv64/host-signal.h |   1 +
>  linux-user/host/s390/host-signal.h    |  92 ++++
>  linux-user/host/s390x/host-signal.h   |   1 +
>  linux-user/host/sparc/host-signal.h   |  53 ++
>  linux-user/host/sparc64/host-signal.h |   1 +
>  linux-user/host/x86_64/host-signal.h  |  24 +
>  accel/tcg/user-exec.c                 | 712 --------------------------
>  linux-user/signal.c                   |  93 ++--
>  17 files changed, 543 insertions(+), 757 deletions(-)
>  create mode 100644 linux-user/host/aarch64/host-signal.h
>  create mode 100644 linux-user/host/alpha/host-signal.h
>  create mode 100644 linux-user/host/arm/host-signal.h
>  create mode 100644 linux-user/host/i386/host-signal.h
>  create mode 100644 linux-user/host/mips/host-signal.h
>  create mode 100644 linux-user/host/ppc/host-signal.h
>  create mode 100644 linux-user/host/ppc64/host-signal.h
>  create mode 100644 linux-user/host/riscv32/host-signal.h
>  create mode 100644 linux-user/host/riscv64/host-signal.h
>  create mode 100644 linux-user/host/s390/host-signal.h
>  create mode 100644 linux-user/host/s390x/host-signal.h
>  create mode 100644 linux-user/host/sparc/host-signal.h
>  create mode 100644 linux-user/host/sparc64/host-signal.h
>  create mode 100644 linux-user/host/x86_64/host-signal.h
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index f582d3e688..addcec6381 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -683,18 +683,6 @@ uintptr_t adjust_signal_pc(uintptr_t pc);
>  bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
>                                   uintptr_t host_pc, uintptr_t host_addr);
>
> -/**
> - * cpu_signal_handler
> - * @signum: host signal number
> - * @pinfo: host siginfo_t
> - * @puc: host ucontext_t
> - *
> - * To be called from the SIGBUS and SIGSEGV signal handler to inform the
> - * virtual cpu of exceptions.  Returns true if the signal was handled by
> - * the virtual CPU.
> - */
> -int cpu_signal_handler(int signum, void *pinfo, void *puc);
> -
>  #else
>  static inline void mmap_lock(void) {}
>  static inline void mmap_unlock(void) {}
> diff --git a/linux-user/host/aarch64/host-signal.h
> b/linux-user/host/aarch64/host-signal.h
> new file mode 100644
> index 0000000000..818da17a21
> --- /dev/null
> +++ b/linux-user/host/aarch64/host-signal.h
> @@ -0,0 +1,73 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef AARCH64_HOST_SIGNAL_H
> +#define AARCH64_HOST_SIGNAL_H
> +
> +/* Pre-3.16 kernel headers don't have these, so provide fallback
> definitions */
> +#ifndef ESR_MAGIC
> +#define ESR_MAGIC 0x45535201
> +struct esr_context {
> +    struct _aarch64_ctx head;
> +    uint64_t esr;
> +};
> +#endif
> +
> +static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)
> +{
> +    return (struct _aarch64_ctx *)&uc->uc_mcontext.__reserved;
> +}
> +
> +static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)
> +{
> +    return (struct _aarch64_ctx *)((char *)hdr + hdr->size);
> +}
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.pc;
> +}
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    struct _aarch64_ctx *hdr;
> +    uint32_t insn;
> +
> +    /* Find the esr_context, which has the WnR bit in it */
> +    for (hdr = first_ctx(uc); hdr->magic; hdr = next_ctx(hdr)) {
> +        if (hdr->magic == ESR_MAGIC) {
> +            struct esr_context const *esrctx = (struct esr_context const
> *)hdr;
> +            uint64_t esr = esrctx->esr;
> +
> +            /* For data aborts ESR.EC is 0b10010x: then bit 6 is the WnR
> bit */
> +            return extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1)
> == 1;
> +        }
> +    }
> +
> +    /*
> +     * Fall back to parsing instructions; will only be needed
> +     * for really ancient (pre-3.16) kernels.
> +     */
> +    insn = *(uint32_t *)host_signal_pc(uc);
> +
> +    return (insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
> +        || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
> +        || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
> +        || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
> +        || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
> +        || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
> +        || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit */
> +        /* Ignore bits 10, 11 & 21, controlling indexing.  */
> +        || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
> +        || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit */
> +        /* Ignore bits 23 & 24, controlling indexing.  */
> +        || (insn & 0x3a400000) == 0x28000000; /* C3.3.7,14-16 */
> +}
> +
> +#endif
> diff --git a/linux-user/host/alpha/host-signal.h
> b/linux-user/host/alpha/host-signal.h
> new file mode 100644
> index 0000000000..eaf83added
> --- /dev/null
> +++ b/linux-user/host/alpha/host-signal.h
> @@ -0,0 +1,41 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef ALPHA_HOST_SIGNAL_H
> +#define ALPHA_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.sc_pc;
> +}
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    uint32_t *pc = uc->uc_mcontext.sc_pc;
> +    uint32_t insn = *pc;
> +
> +    /* XXX: need kernel patch to get write flag faster */
> +    switch (insn >> 26) {
> +    case 0x0d: /* stw */
> +    case 0x0e: /* stb */
> +    case 0x0f: /* stq_u */
> +    case 0x24: /* stf */
> +    case 0x25: /* stg */
> +    case 0x26: /* sts */
> +    case 0x27: /* stt */
> +    case 0x2c: /* stl */
> +    case 0x2d: /* stq */
> +    case 0x2e: /* stl_c */
> +    case 0x2f: /* stq_c */
> +        return true;
> +    }
> +    return false;
> +}
> +
> +#endif
> diff --git a/linux-user/host/arm/host-signal.h
> b/linux-user/host/arm/host-signal.h
> new file mode 100644
> index 0000000000..ae6bcde6c1
> --- /dev/null
> +++ b/linux-user/host/arm/host-signal.h
> @@ -0,0 +1,30 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef ARM_HOST_SIGNAL_H
> +#define ARM_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.gregs[R15];
> +}
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc,
> +                                      uintptr_t pc)
> +{
> +    /*
> +     * In the FSR, bit 11 is WnR, assuming a v6 or
> +     * later processor.  On v5 we will always report
> +     * this as a read, which will fail later.
> +     */
> +    uint32_t fsr = uc->uc_mcontext.error_code;
> +    return extract32(fsr, 11, 1);
> +}
> +
> +#endif
> diff --git a/linux-user/host/i386/host-signal.h
> b/linux-user/host/i386/host-signal.h
> new file mode 100644
> index 0000000000..a8ca5e4a89
> --- /dev/null
> +++ b/linux-user/host/i386/host-signal.h
> @@ -0,0 +1,24 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef I386_HOST_SIGNAL_H
> +#define I386_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.gregs[REG_EIP];
> +}
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
> +        && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
> +}
> +
> +#endif
> diff --git a/linux-user/host/mips/host-signal.h
> b/linux-user/host/mips/host-signal.h
> new file mode 100644
> index 0000000000..815bbd61fa
> --- /dev/null
> +++ b/linux-user/host/mips/host-signal.h
> @@ -0,0 +1,61 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef MIPS_HOST_SIGNAL_H
> +#define MIPS_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.pc;
> +}
> +
> +#if defined(__misp16) || defined(__mips_micromips)
> +#error "Unsupported encoding"
> +#endif
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    uint32_t *insn = *(uint32_t *)host_signal_pc(uc);
> +
> +    /* Detect all store instructions at program counter. */
> +    switch ((insn >> 26) & 077) {
> +    case 050: /* SB */
> +    case 051: /* SH */
> +    case 052: /* SWL */
> +    case 053: /* SW */
> +    case 054: /* SDL */
> +    case 055: /* SDR */
> +    case 056: /* SWR */
> +    case 070: /* SC */
> +    case 071: /* SWC1 */
> +    case 074: /* SCD */
> +    case 075: /* SDC1 */
> +    case 077: /* SD */
> +#if !defined(__mips_isa_rev) || __mips_isa_rev < 6
> +    case 072: /* SWC2 */
> +    case 076: /* SDC2 */
> +#endif
> +        return true;
> +    case 023: /* COP1X */
> +        /*
> +         * Required in all versions of MIPS64 since
> +         * MIPS64r1 and subsequent versions of MIPS32r2.
> +         */
> +        switch (insn & 077) {
> +        case 010: /* SWXC1 */
> +        case 011: /* SDXC1 */
> +        case 015: /* SUXC1 */
> +            return true;
> +        }
> +        break;
> +    }
> +    return false;
> +}
> +
> +#endif
> diff --git a/linux-user/host/ppc/host-signal.h
> b/linux-user/host/ppc/host-signal.h
> new file mode 100644
> index 0000000000..b8dce622b4
> --- /dev/null
> +++ b/linux-user/host/ppc/host-signal.h
> @@ -0,0 +1,24 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef PPC_HOST_SIGNAL_H
> +#define PPC_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.regs->nip;
> +}
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.regs->trap != 0x400
> +        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
> +}
> +
> +#endif
> diff --git a/linux-user/host/ppc64/host-signal.h
> b/linux-user/host/ppc64/host-signal.h
> new file mode 100644
> index 0000000000..a353c22a90
> --- /dev/null
> +++ b/linux-user/host/ppc64/host-signal.h
> @@ -0,0 +1 @@
> +#include "../ppc/host-signal.h"
> diff --git a/linux-user/host/riscv32/host-signal.h
> b/linux-user/host/riscv32/host-signal.h
> new file mode 100644
> index 0000000000..f877412f96
> --- /dev/null
> +++ b/linux-user/host/riscv32/host-signal.h
> @@ -0,0 +1,57 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef RISCV_HOST_SIGNAL_H
> +#define RISCV_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.__gregs[REG_PC];
> +}
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    /*
> +     * Detect store by reading the instruction at the program counter.
> +     * Do not read more than 16 bits, because we have not yet determined
> +     * the size of the instruction.
> +     */
> +    const uint16_t *pinsn = (const uint16_t *)host_signal_pc(uc);
> +    uint16_t insn = pinsn[0];
> +
> +    /* 16-bit instructions */
> +    switch (insn & 0xe003) {
> +    case 0xa000: /* c.fsd */
> +    case 0xc000: /* c.sw */
> +    case 0xe000: /* c.sd (rv64) / c.fsw (rv32) */
> +    case 0xa002: /* c.fsdsp */
> +    case 0xc002: /* c.swsp */
> +    case 0xe002: /* c.sdsp (rv64) / c.fswsp (rv32) */
> +        return true;
> +    }
> +
> +    /* 32-bit instructions, major opcodes */
> +    switch (insn & 0x7f) {
> +    case 0x23: /* store */
> +    case 0x27: /* store-fp */
> +        return true;
> +    case 0x2f: /* amo */
> +        /*
> +         * The AMO function code is in bits 25-31, unread as yet.
> +         * The AMO functions are LR (read), SC (write), and the
> +         * rest are all read-modify-write.
> +         */
> +        insn = pinsn[1];
> +        return (insn >> 11) != 2; /* LR */
> +    }
> +
> +    return false;
> +}
> +
> +#endif
> diff --git a/linux-user/host/riscv64/host-signal.h
> b/linux-user/host/riscv64/host-signal.h
> new file mode 100644
> index 0000000000..6e27f725ab
> --- /dev/null
> +++ b/linux-user/host/riscv64/host-signal.h
> @@ -0,0 +1 @@
> +#include "../riscv32/host-signal.h"
> diff --git a/linux-user/host/s390/host-signal.h
> b/linux-user/host/s390/host-signal.h
> new file mode 100644
> index 0000000000..8d34b32b9f
> --- /dev/null
> +++ b/linux-user/host/s390/host-signal.h
> @@ -0,0 +1,92 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef S390_HOST_SIGNAL_H
> +#define S390_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.psw.addr;
> +}
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    uint16_t *pinsn = (uint16_t *)host_signal_pc(uc);
> +
> +    /*
> +     * ??? On linux, the non-rt signal handler has 4 (!) arguments instead
> +     * of the normal 2 arguments.  The 4th argument contains the
> "Translation-
> +     * Exception Identification for DAT Exceptions" from the hardware (aka
> +     * "int_parm_long"), which does in fact contain the is_write value.
> +     * The rt signal handler, as far as I can tell, does not give this
> value
> +     * at all.  Not that we could get to it from here even if it were.
> +     * So fall back to parsing instructions.  Treat read-modify-write
> ones as
> +     * writes, which is not fully correct, but for tracking
> self-modifying code
> +     * this is better than treating them as reads.  Checking si_addr page
> flags
> +     * might be a viable improvement, albeit a racy one.
> +     */
> +    /* ??? This is not even close to complete.  */
> +    switch (pinsn[0] >> 8) {
> +    case 0x50: /* ST */
> +    case 0x42: /* STC */
> +    case 0x40: /* STH */
> +    case 0xba: /* CS */
> +    case 0xbb: /* CDS */
> +        return true;
> +    case 0xc4: /* RIL format insns */
> +        switch (pinsn[0] & 0xf) {
> +        case 0xf: /* STRL */
> +        case 0xb: /* STGRL */
> +        case 0x7: /* STHRL */
> +            return true;
> +        }
> +        break;
> +    case 0xc8: /* SSF format insns */
> +        switch (pinsn[0] & 0xf) {
> +        case 0x2: /* CSST */
> +            return true;
> +        }
> +        break;
> +    case 0xe3: /* RXY format insns */
> +        switch (pinsn[2] & 0xff) {
> +        case 0x50: /* STY */
> +        case 0x24: /* STG */
> +        case 0x72: /* STCY */
> +        case 0x70: /* STHY */
> +        case 0x8e: /* STPQ */
> +        case 0x3f: /* STRVH */
> +        case 0x3e: /* STRV */
> +        case 0x2f: /* STRVG */
> +            return true;
> +        }
> +        break;
> +    case 0xeb: /* RSY format insns */
> +        switch (pinsn[2] & 0xff) {
> +        case 0x14: /* CSY */
> +        case 0x30: /* CSG */
> +        case 0x31: /* CDSY */
> +        case 0x3e: /* CDSG */
> +        case 0xe4: /* LANG */
> +        case 0xe6: /* LAOG */
> +        case 0xe7: /* LAXG */
> +        case 0xe8: /* LAAG */
> +        case 0xea: /* LAALG */
> +        case 0xf4: /* LAN */
> +        case 0xf6: /* LAO */
> +        case 0xf7: /* LAX */
> +        case 0xfa: /* LAAL */
> +        case 0xf8: /* LAA */
> +            return true;
> +        }
> +        break;
> +    }
> +    return false;
> +}
> +
> +#endif
> diff --git a/linux-user/host/s390x/host-signal.h
> b/linux-user/host/s390x/host-signal.h
> new file mode 100644
> index 0000000000..0e83f9358d
> --- /dev/null
> +++ b/linux-user/host/s390x/host-signal.h
> @@ -0,0 +1 @@
> +#include "../s390/host-signal.h"
> diff --git a/linux-user/host/sparc/host-signal.h
> b/linux-user/host/sparc/host-signal.h
> new file mode 100644
> index 0000000000..47d3b1512e
> --- /dev/null
> +++ b/linux-user/host/sparc/host-signal.h
> @@ -0,0 +1,53 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef SPARC_HOST_SIGNAL_H
> +#define SPARC_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +#ifdef __arch64__
> +    return uc->uc_mcontext.mc_gregs[MC_PC];
> +#else
> +    return uc->uc_mcontext.gregs[REG_PC];
> +#endif
> +}
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
> +
> +    if ((insn >> 30) == 3) {
> +        switch ((insn >> 19) & 0x3f) {
> +        case 0x05: /* stb */
> +        case 0x15: /* stba */
> +        case 0x06: /* sth */
> +        case 0x16: /* stha */
> +        case 0x04: /* st */
> +        case 0x14: /* sta */
> +        case 0x07: /* std */
> +        case 0x17: /* stda */
> +        case 0x0e: /* stx */
> +        case 0x1e: /* stxa */
> +        case 0x24: /* stf */
> +        case 0x34: /* stfa */
> +        case 0x27: /* stdf */
> +        case 0x37: /* stdfa */
> +        case 0x26: /* stqf */
> +        case 0x36: /* stqfa */
> +        case 0x25: /* stfsr */
> +        case 0x3c: /* casa */
> +        case 0x3e: /* casxa */
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +#endif
> diff --git a/linux-user/host/sparc64/host-signal.h
> b/linux-user/host/sparc64/host-signal.h
> new file mode 100644
> index 0000000000..1191fe2d40
> --- /dev/null
> +++ b/linux-user/host/sparc64/host-signal.h
> @@ -0,0 +1 @@
> +#include "../sparc/host-signal.h"
> diff --git a/linux-user/host/x86_64/host-signal.h
> b/linux-user/host/x86_64/host-signal.h
> new file mode 100644
> index 0000000000..d5fb3e4484
> --- /dev/null
> +++ b/linux-user/host/x86_64/host-signal.h
> @@ -0,0 +1,24 @@
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef X86_64_HOST_SIGNAL_H
> +#define X86_64_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.gregs[REG_RIP];
> +}
> +
> +static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
> +        && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
> +}
> +
> +#endif
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index ad6b4f6abf..39635cbea2 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -29,23 +29,8 @@
>  #include "trace/trace-root.h"
>  #include "trace/mem.h"
>
> -#undef EAX
> -#undef ECX
> -#undef EDX
> -#undef EBX
> -#undef ESP
> -#undef EBP
> -#undef ESI
> -#undef EDI
> -#undef EIP
> -#ifdef __linux__
> -#include <sys/ucontext.h>
> -#endif
> -
>  __thread uintptr_t helper_retaddr;
>
> -//#define DEBUG_SIGNAL
> -
>  /**
>   * adjust_signal_pc:
>   * @pc: raw pc from the host signal ucontext_t.
> @@ -154,69 +139,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu,
> sigset_t *old_set,
>      }
>  }
>
> -/* 'pc' is the host PC at which the exception was raised. 'address' is
> -   the effective address of the memory exception. 'is_write' is 1 if a
> -   write caused the exception and otherwise 0'. 'old_set' is the
> -   signal set which should be restored */
> -static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
> -                                    int is_write, sigset_t *old_set)
> -{
> -    CPUState *cpu = current_cpu;
> -    CPUClass *cc;
> -    unsigned long address = (unsigned long)info->si_addr;
> -    MMUAccessType access_type;
> -
> -    if (is_write) {
> -        access_type = MMU_DATA_STORE;
> -    } else if (helper_retaddr == 1) {
> -        access_type = MMU_INST_FETCH;
> -    } else {
> -        access_type = MMU_DATA_LOAD;
> -    }
> -    pc = adjust_signal_pc(pc);
> -
> -    /* For synchronous signals we expect to be coming from the vCPU
> -     * thread (so current_cpu should be valid) and either from running
> -     * code or during translation which can fault as we cross pages.
> -     *
> -     * If neither is true then something has gone wrong and we should
> -     * abort rather than try and restart the vCPU execution.
> -     */
> -    if (!cpu || !cpu->running) {
> -        printf("qemu:%s received signal outside vCPU context @ pc=0x%"
> -               PRIxPTR "\n",  __func__, pc);
> -        abort();
> -    }
> -
> -#if defined(DEBUG_SIGNAL)
> -    printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
> -           pc, address, is_write, *(unsigned long *)old_set);
> -#endif
> -
> -    /* XXX: locking issue */
> -    if (is_write &&
> -        info->si_signo == SIGSEGV &&
> -        info->si_code == SEGV_ACCERR &&
> -        handle_sigsegv_accerr_write(cpu, old_set, pc, address)) {
> -        return 1;
> -    }
> -
> -    /* Convert forcefully to guest address space, invalid addresses
> -       are still valid segv ones */
> -    address = h2g_nocheck(address);
> -
> -    /*
> -     * There is no way the target can handle this other than raising
> -     * an exception.  Undo signal and retaddr state prior to longjmp.
> -     */
> -    sigprocmask(SIG_SETMASK, old_set, NULL);
> -
> -    cc = CPU_GET_CLASS(cpu);
> -    cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
> -                          MMU_USER_IDX, false, pc);
> -    g_assert_not_reached();
> -}
> -
>  static int probe_access_internal(CPUArchState *env, target_ulong addr,
>                                   int fault_size, MMUAccessType
> access_type,
>                                   bool nonfault, uintptr_t ra)
> @@ -275,640 +197,6 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>      return size ? g2h(env_cpu(env), addr) : NULL;
>  }
>
> -#if defined(__i386__)
> -
> -#if defined(__NetBSD__)
> -#include <ucontext.h>
> -#include <machine/trap.h>
> -
> -#define EIP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_EIP])
> -#define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
> -#define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
> -#define MASK_sig(context)    ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP      T_PAGEFLT
> -#elif defined(__FreeBSD__) || defined(__DragonFly__)
> -#include <ucontext.h>
> -#include <machine/trap.h>
> -
> -#define EIP_sig(context)  (*((unsigned long
> *)&(context)->uc_mcontext.mc_eip))
> -#define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
> -#define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
> -#define MASK_sig(context)    ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP      T_PAGEFLT
> -#elif defined(__OpenBSD__)
> -#include <machine/trap.h>
> -#define EIP_sig(context)     ((context)->sc_eip)
> -#define TRAP_sig(context)    ((context)->sc_trapno)
> -#define ERROR_sig(context)   ((context)->sc_err)
> -#define MASK_sig(context)    ((context)->sc_mask)
> -#define PAGE_FAULT_TRAP      T_PAGEFLT
> -#else
> -#define EIP_sig(context)     ((context)->uc_mcontext.gregs[REG_EIP])
> -#define TRAP_sig(context)    ((context)->uc_mcontext.gregs[REG_TRAPNO])
> -#define ERROR_sig(context)   ((context)->uc_mcontext.gregs[REG_ERR])
> -#define MASK_sig(context)    ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP      0xe
> -#endif
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
> -    ucontext_t *uc = puc;
> -#elif defined(__OpenBSD__)
> -    struct sigcontext *uc = puc;
> -#else
> -    ucontext_t *uc = puc;
> -#endif
> -    unsigned long pc;
> -    int trapno;
> -
> -#ifndef REG_EIP
> -/* for glibc 2.1 */
> -#define REG_EIP    EIP
> -#define REG_ERR    ERR
> -#define REG_TRAPNO TRAPNO
> -#endif
> -    pc = EIP_sig(uc);
> -    trapno = TRAP_sig(uc);
> -    return handle_cpu_signal(pc, info,
> -                             trapno == PAGE_FAULT_TRAP ?
> -                             (ERROR_sig(uc) >> 1) & 1 : 0,
> -                             &MASK_sig(uc));
> -}
> -
> -#elif defined(__x86_64__)
> -
> -#ifdef __NetBSD__
> -#include <machine/trap.h>
> -#define PC_sig(context)       _UC_MACHINE_PC(context)
> -#define TRAP_sig(context)
>  ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
> -#define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
> -#define MASK_sig(context)     ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP       T_PAGEFLT
> -#elif defined(__OpenBSD__)
> -#include <machine/trap.h>
> -#define PC_sig(context)       ((context)->sc_rip)
> -#define TRAP_sig(context)     ((context)->sc_trapno)
> -#define ERROR_sig(context)    ((context)->sc_err)
> -#define MASK_sig(context)     ((context)->sc_mask)
> -#define PAGE_FAULT_TRAP       T_PAGEFLT
> -#elif defined(__FreeBSD__) || defined(__DragonFly__)
> -#include <ucontext.h>
> -#include <machine/trap.h>
> -
> -#define PC_sig(context)  (*((unsigned long
> *)&(context)->uc_mcontext.mc_rip))
> -#define TRAP_sig(context)     ((context)->uc_mcontext.mc_trapno)
> -#define ERROR_sig(context)    ((context)->uc_mcontext.mc_err)
> -#define MASK_sig(context)     ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP       T_PAGEFLT
> -#else
> -#define PC_sig(context)       ((context)->uc_mcontext.gregs[REG_RIP])
> -#define TRAP_sig(context)     ((context)->uc_mcontext.gregs[REG_TRAPNO])
> -#define ERROR_sig(context)    ((context)->uc_mcontext.gregs[REG_ERR])
> -#define MASK_sig(context)     ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP       0xe
> -#endif
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    unsigned long pc;
> -#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
> -    ucontext_t *uc = puc;
> -#elif defined(__OpenBSD__)
> -    struct sigcontext *uc = puc;
> -#else
> -    ucontext_t *uc = puc;
> -#endif
> -
> -    pc = PC_sig(uc);
> -    return handle_cpu_signal(pc, info,
> -                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
> -                             (ERROR_sig(uc) >> 1) & 1 : 0,
> -                             &MASK_sig(uc));
> -}
> -
> -#elif defined(_ARCH_PPC)
> -
> -/***********************************************************************
> - * signal context platform-specific definitions
> - * From Wine
> - */
> -#ifdef linux
> -/* All Registers access - only for local access */
> -#define REG_sig(reg_name, context)              \
> -    ((context)->uc_mcontext.regs->reg_name)
> -/* Gpr Registers access  */
> -#define GPR_sig(reg_num, context)              REG_sig(gpr[reg_num],
> context)
> -/* Program counter */
> -#define IAR_sig(context)                       REG_sig(nip, context)
> -/* Machine State Register (Supervisor) */
> -#define MSR_sig(context)                       REG_sig(msr, context)
> -/* Count register */
> -#define CTR_sig(context)                       REG_sig(ctr, context)
> -/* User's integer exception register */
> -#define XER_sig(context)                       REG_sig(xer, context)
> -/* Link register */
> -#define LR_sig(context)                        REG_sig(link, context)
> -/* Condition register */
> -#define CR_sig(context)                        REG_sig(ccr, context)
> -
> -/* Float Registers access  */
> -#define FLOAT_sig(reg_num, context)                                     \
> -    (((double *)((char *)((context)->uc_mcontext.regs + 48 *
> 4)))[reg_num])
> -#define FPSCR_sig(context) \
> -    (*(int *)((char *)((context)->uc_mcontext.regs + (48 + 32 * 2) * 4)))
> -/* Exception Registers access */
> -#define DAR_sig(context)                       REG_sig(dar, context)
> -#define DSISR_sig(context)                     REG_sig(dsisr, context)
> -#define TRAP_sig(context)                      REG_sig(trap, context)
> -#endif /* linux */
> -
> -#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> -#include <ucontext.h>
> -#define IAR_sig(context)               ((context)->uc_mcontext.mc_srr0)
> -#define MSR_sig(context)               ((context)->uc_mcontext.mc_srr1)
> -#define CTR_sig(context)               ((context)->uc_mcontext.mc_ctr)
> -#define XER_sig(context)               ((context)->uc_mcontext.mc_xer)
> -#define LR_sig(context)                ((context)->uc_mcontext.mc_lr)
> -#define CR_sig(context)                ((context)->uc_mcontext.mc_cr)
> -/* Exception Registers access */
> -#define DAR_sig(context)               ((context)->uc_mcontext.mc_dar)
> -#define DSISR_sig(context)             ((context)->uc_mcontext.mc_dsisr)
> -#define TRAP_sig(context)              ((context)->uc_mcontext.mc_exc)
> -#endif /* __FreeBSD__|| __FreeBSD_kernel__ */
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> -    ucontext_t *uc = puc;
> -#else
> -    ucontext_t *uc = puc;
> -#endif
> -    unsigned long pc;
> -    int is_write;
> -
> -    pc = IAR_sig(uc);
> -    is_write = 0;
> -#if 0
> -    /* ppc 4xx case */
> -    if (DSISR_sig(uc) & 0x00800000) {
> -        is_write = 1;
> -    }
> -#else
> -    if (TRAP_sig(uc) != 0x400 && (DSISR_sig(uc) & 0x02000000)) {
> -        is_write = 1;
> -    }
> -#endif
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -
> -#elif defined(__alpha__)
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                           void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    ucontext_t *uc = puc;
> -    uint32_t *pc = uc->uc_mcontext.sc_pc;
> -    uint32_t insn = *pc;
> -    int is_write = 0;
> -
> -    /* XXX: need kernel patch to get write flag faster */
> -    switch (insn >> 26) {
> -    case 0x0d: /* stw */
> -    case 0x0e: /* stb */
> -    case 0x0f: /* stq_u */
> -    case 0x24: /* stf */
> -    case 0x25: /* stg */
> -    case 0x26: /* sts */
> -    case 0x27: /* stt */
> -    case 0x2c: /* stl */
> -    case 0x2d: /* stq */
> -    case 0x2e: /* stl_c */
> -    case 0x2f: /* stq_c */
> -        is_write = 1;
> -    }
> -
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -#elif defined(__sparc__)
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    int is_write;
> -    uint32_t insn;
> -#if !defined(__arch64__) || defined(CONFIG_SOLARIS)
> -    uint32_t *regs = (uint32_t *)(info + 1);
> -    void *sigmask = (regs + 20);
> -    /* XXX: is there a standard glibc define ? */
> -    unsigned long pc = regs[1];
> -#else
> -#ifdef __linux__
> -    struct sigcontext *sc = puc;
> -    unsigned long pc = sc->sigc_regs.tpc;
> -    void *sigmask = (void *)sc->sigc_mask;
> -#elif defined(__OpenBSD__)
> -    struct sigcontext *uc = puc;
> -    unsigned long pc = uc->sc_pc;
> -    void *sigmask = (void *)(long)uc->sc_mask;
> -#elif defined(__NetBSD__)
> -    ucontext_t *uc = puc;
> -    unsigned long pc = _UC_MACHINE_PC(uc);
> -    void *sigmask = (void *)&uc->uc_sigmask;
> -#endif
> -#endif
> -
> -    /* XXX: need kernel patch to get write flag faster */
> -    is_write = 0;
> -    insn = *(uint32_t *)pc;
> -    if ((insn >> 30) == 3) {
> -        switch ((insn >> 19) & 0x3f) {
> -        case 0x05: /* stb */
> -        case 0x15: /* stba */
> -        case 0x06: /* sth */
> -        case 0x16: /* stha */
> -        case 0x04: /* st */
> -        case 0x14: /* sta */
> -        case 0x07: /* std */
> -        case 0x17: /* stda */
> -        case 0x0e: /* stx */
> -        case 0x1e: /* stxa */
> -        case 0x24: /* stf */
> -        case 0x34: /* stfa */
> -        case 0x27: /* stdf */
> -        case 0x37: /* stdfa */
> -        case 0x26: /* stqf */
> -        case 0x36: /* stqfa */
> -        case 0x25: /* stfsr */
> -        case 0x3c: /* casa */
> -        case 0x3e: /* casxa */
> -            is_write = 1;
> -            break;
> -        }
> -    }
> -    return handle_cpu_signal(pc, info, is_write, sigmask);
> -}
> -
> -#elif defined(__arm__)
> -
> -#if defined(__NetBSD__)
> -#include <ucontext.h>
> -#include <sys/siginfo.h>
> -#endif
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -#if defined(__NetBSD__)
> -    ucontext_t *uc = puc;
> -    siginfo_t *si = pinfo;
> -#else
> -    ucontext_t *uc = puc;
> -#endif
> -    unsigned long pc;
> -    uint32_t fsr;
> -    int is_write;
> -
> -#if defined(__NetBSD__)
> -    pc = uc->uc_mcontext.__gregs[_REG_R15];
> -#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 &&
> __GLIBC_MINOR__ <= 3))
> -    pc = uc->uc_mcontext.gregs[R15];
> -#else
> -    pc = uc->uc_mcontext.arm_pc;
> -#endif
> -
> -#ifdef __NetBSD__
> -    fsr = si->si_trap;
> -#else
> -    fsr = uc->uc_mcontext.error_code;
> -#endif
> -    /*
> -     * In the FSR, bit 11 is WnR, assuming a v6 or
> -     * later processor.  On v5 we will always report
> -     * this as a read, which will fail later.
> -     */
> -    is_write = extract32(fsr, 11, 1);
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -
> -#elif defined(__aarch64__)
> -
> -#if defined(__NetBSD__)
> -
> -#include <ucontext.h>
> -#include <sys/siginfo.h>
> -
> -int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
> -{
> -    ucontext_t *uc = puc;
> -    siginfo_t *si = pinfo;
> -    unsigned long pc;
> -    int is_write;
> -    uint32_t esr;
> -
> -    pc = uc->uc_mcontext.__gregs[_REG_PC];
> -    esr = si->si_trap;
> -
> -    /*
> -     * siginfo_t::si_trap is the ESR value, for data aborts ESR.EC
> -     * is 0b10010x: then bit 6 is the WnR bit
> -     */
> -    is_write = extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1) == 1;
> -    return handle_cpu_signal(pc, si, is_write, &uc->uc_sigmask);
> -}
> -
> -#else
> -
> -#ifndef ESR_MAGIC
> -/* Pre-3.16 kernel headers don't have these, so provide fallback
> definitions */
> -#define ESR_MAGIC 0x45535201
> -struct esr_context {
> -    struct _aarch64_ctx head;
> -    uint64_t esr;
> -};
> -#endif
> -
> -static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)
> -{
> -    return (struct _aarch64_ctx *)&uc->uc_mcontext.__reserved;
> -}
> -
> -static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)
> -{
> -    return (struct _aarch64_ctx *)((char *)hdr + hdr->size);
> -}
> -
> -int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    ucontext_t *uc = puc;
> -    uintptr_t pc = uc->uc_mcontext.pc;
> -    bool is_write;
> -    struct _aarch64_ctx *hdr;
> -    struct esr_context const *esrctx = NULL;
> -
> -    /* Find the esr_context, which has the WnR bit in it */
> -    for (hdr = first_ctx(uc); hdr->magic; hdr = next_ctx(hdr)) {
> -        if (hdr->magic == ESR_MAGIC) {
> -            esrctx = (struct esr_context const *)hdr;
> -            break;
> -        }
> -    }
> -
> -    if (esrctx) {
> -        /* For data aborts ESR.EC is 0b10010x: then bit 6 is the WnR bit
> */
> -        uint64_t esr = esrctx->esr;
> -        is_write = extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1)
> == 1;
> -    } else {
> -        /*
> -         * Fall back to parsing instructions; will only be needed
> -         * for really ancient (pre-3.16) kernels.
> -         */
> -        uint32_t insn = *(uint32_t *)pc;
> -
> -        is_write = ((insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
> -                    || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
> -                    || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
> -                    || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
> -                    || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
> -                    || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
> -                    || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit
> */
> -                    /* Ignore bits 10, 11 & 21, controlling indexing.  */
> -                    || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
> -                    || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit
> */
> -                    /* Ignore bits 23 & 24, controlling indexing.  */
> -                    || (insn & 0x3a400000) == 0x28000000); /*
> C3.3.7,14-16 */
> -    }
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -#endif
> -
> -#elif defined(__s390__)
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    ucontext_t *uc = puc;
> -    unsigned long pc;
> -    uint16_t *pinsn;
> -    int is_write = 0;
> -
> -    pc = uc->uc_mcontext.psw.addr;
> -
> -    /*
> -     * ??? On linux, the non-rt signal handler has 4 (!) arguments instead
> -     * of the normal 2 arguments.  The 4th argument contains the
> "Translation-
> -     * Exception Identification for DAT Exceptions" from the hardware (aka
> -     * "int_parm_long"), which does in fact contain the is_write value.
> -     * The rt signal handler, as far as I can tell, does not give this
> value
> -     * at all.  Not that we could get to it from here even if it were.
> -     * So fall back to parsing instructions.  Treat read-modify-write
> ones as
> -     * writes, which is not fully correct, but for tracking
> self-modifying code
> -     * this is better than treating them as reads.  Checking si_addr page
> flags
> -     * might be a viable improvement, albeit a racy one.
> -     */
> -    /* ??? This is not even close to complete.  */
> -    pinsn = (uint16_t *)pc;
> -    switch (pinsn[0] >> 8) {
> -    case 0x50: /* ST */
> -    case 0x42: /* STC */
> -    case 0x40: /* STH */
> -    case 0xba: /* CS */
> -    case 0xbb: /* CDS */
> -        is_write = 1;
> -        break;
> -    case 0xc4: /* RIL format insns */
> -        switch (pinsn[0] & 0xf) {
> -        case 0xf: /* STRL */
> -        case 0xb: /* STGRL */
> -        case 0x7: /* STHRL */
> -            is_write = 1;
> -        }
> -        break;
> -    case 0xc8: /* SSF format insns */
> -        switch (pinsn[0] & 0xf) {
> -        case 0x2: /* CSST */
> -            is_write = 1;
> -        }
> -        break;
> -    case 0xe3: /* RXY format insns */
> -        switch (pinsn[2] & 0xff) {
> -        case 0x50: /* STY */
> -        case 0x24: /* STG */
> -        case 0x72: /* STCY */
> -        case 0x70: /* STHY */
> -        case 0x8e: /* STPQ */
> -        case 0x3f: /* STRVH */
> -        case 0x3e: /* STRV */
> -        case 0x2f: /* STRVG */
> -            is_write = 1;
> -        }
> -        break;
> -    case 0xeb: /* RSY format insns */
> -        switch (pinsn[2] & 0xff) {
> -        case 0x14: /* CSY */
> -        case 0x30: /* CSG */
> -        case 0x31: /* CDSY */
> -        case 0x3e: /* CDSG */
> -        case 0xe4: /* LANG */
> -        case 0xe6: /* LAOG */
> -        case 0xe7: /* LAXG */
> -        case 0xe8: /* LAAG */
> -        case 0xea: /* LAALG */
> -        case 0xf4: /* LAN */
> -        case 0xf6: /* LAO */
> -        case 0xf7: /* LAX */
> -        case 0xfa: /* LAAL */
> -        case 0xf8: /* LAA */
> -            is_write = 1;
> -        }
> -        break;
> -    }
> -
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -
> -#elif defined(__mips__)
> -
> -#if defined(__misp16) || defined(__mips_micromips)
> -#error "Unsupported encoding"
> -#endif
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    ucontext_t *uc = puc;
> -    uintptr_t pc = uc->uc_mcontext.pc;
> -    uint32_t insn = *(uint32_t *)pc;
> -    int is_write = 0;
> -
> -    /* Detect all store instructions at program counter. */
> -    switch((insn >> 26) & 077) {
> -    case 050: /* SB */
> -    case 051: /* SH */
> -    case 052: /* SWL */
> -    case 053: /* SW */
> -    case 054: /* SDL */
> -    case 055: /* SDR */
> -    case 056: /* SWR */
> -    case 070: /* SC */
> -    case 071: /* SWC1 */
> -    case 074: /* SCD */
> -    case 075: /* SDC1 */
> -    case 077: /* SD */
> -#if !defined(__mips_isa_rev) || __mips_isa_rev < 6
> -    case 072: /* SWC2 */
> -    case 076: /* SDC2 */
> -#endif
> -        is_write = 1;
> -        break;
> -    case 023: /* COP1X */
> -        /* Required in all versions of MIPS64 since
> -           MIPS64r1 and subsequent versions of MIPS32r2. */
> -        switch (insn & 077) {
> -        case 010: /* SWXC1 */
> -        case 011: /* SDXC1 */
> -        case 015: /* SUXC1 */
> -            is_write = 1;
> -        }
> -        break;
> -    }
> -
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -
> -#elif defined(__riscv)
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    ucontext_t *uc = puc;
> -    greg_t pc = uc->uc_mcontext.__gregs[REG_PC];
> -    uint32_t insn = *(uint32_t *)pc;
> -    int is_write = 0;
> -
> -    /* Detect store by reading the instruction at the program
> -       counter. Note: we currently only generate 32-bit
> -       instructions so we thus only detect 32-bit stores */
> -    switch (((insn >> 0) & 0b11)) {
> -    case 3:
> -        switch (((insn >> 2) & 0b11111)) {
> -        case 8:
> -            switch (((insn >> 12) & 0b111)) {
> -            case 0: /* sb */
> -            case 1: /* sh */
> -            case 2: /* sw */
> -            case 3: /* sd */
> -            case 4: /* sq */
> -                is_write = 1;
> -                break;
> -            default:
> -                break;
> -            }
> -            break;
> -        case 9:
> -            switch (((insn >> 12) & 0b111)) {
> -            case 2: /* fsw */
> -            case 3: /* fsd */
> -            case 4: /* fsq */
> -                is_write = 1;
> -                break;
> -            default:
> -                break;
> -            }
> -            break;
> -        default:
> -            break;
> -        }
> -    }
> -
> -    /* Check for compressed instructions */
> -    switch (((insn >> 13) & 0b111)) {
> -    case 7:
> -        switch (insn & 0b11) {
> -        case 0: /*c.sd */
> -        case 2: /* c.sdsp */
> -            is_write = 1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    case 6:
> -        switch (insn & 0b11) {
> -        case 0: /* c.sw */
> -        case 3: /* c.swsp */
> -            is_write = 1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    default:
> -        break;
> -    }
> -
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -
> -#else
> -
> -#error host CPU specific signal handler needed
> -
> -#endif
> -
>  /* The softmmu versions of these helpers are in cputlb.c.  */
>
>  uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 73c0f9066b..509dad7850 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -24,6 +24,7 @@
>  #include "qemu.h"
>  #include "trace.h"
>  #include "signal-common.h"
> +#include "host-signal.h"
>
>  static struct target_sigaction sigact_table[TARGET_NSIG];
>
> @@ -753,59 +754,85 @@ static inline void rewind_if_in_safe_syscall(void
> *puc)
>  }
>  #endif
>
> -static void host_signal_handler(int host_signum, siginfo_t *info,
> -                                void *puc)
> +static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
>  {
>      CPUArchState *env = thread_cpu->env_ptr;
>      CPUState *cpu = env_cpu(env);
>      TaskState *ts = cpu->opaque;
> -
> -    int sig;
> +    bool sync_sig = false;
>      target_siginfo_t tinfo;
>      ucontext_t *uc = puc;
>      struct emulated_sigtable *k;
> +    uintptr_t pc = 0;
> +    int guest_sig;
>
> -    /* the CPU emulator uses some host signals to detect exceptions,
> -       we forward to it some signals */
> -    if ((host_signum == SIGSEGV || host_signum == SIGBUS)
> -        && info->si_code > 0) {
> -        if (cpu_signal_handler(host_signum, info, puc))
> +    /*
> +     * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
> +     * handling wrt signal blocking and unwinding.  SIGSEGV may need to
> +     * remove write-protection and restart the instruction.
> +     */
> +    if ((host_sig == SIGSEGV || host_sig == SIGBUS) && info->si_code > 0)
> {
> +        pc = adjust_signal_pc(host_signal_pc(uc));
> +        if (host_sig == SIGSEGV &&
> +            info->si_code == SEGV_ACCERR &&
> +            host_sigsegv_write(info, uc) &&
> +            handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask, pc,
> +                                        (uintptr_t)info->si_addr)) {
>              return;
> +        }
> +        sync_sig = true;
> +    } else {
> +        rewind_if_in_safe_syscall(puc);
> +
> +        /*
> +         * Block host signals until target signal handler entered.
> +         * We can't block SIGSEGV or SIGBUS while we're executing
> +         * guest code in case the guest code provokes one in the
> +         * window between now and it getting out to the main loop.
> +         * Signals will be unblocked again in process_pending_signals().
> +         *
> +         * WARNING: we cannot use sigfillset() here because the uc_sigmask
> +         * field is a kernel sigset_t, which is much smaller than the
> +         * libc sigset_t which sigfillset() operates on. Using
> sigfillset()
> +         * would write 0xff bytes off the end of the structure and trash
> +         * data on the struct.
> +         * We can't use sizeof(uc->uc_sigmask) either, because the libc
> +         * headers define the struct field with the wrong (too large)
> type.
> +         */
> +        memset(&uc->uc_sigmask, 0xff, SIGSET_T_SIZE);
> +        sigdelset(&uc->uc_sigmask, SIGSEGV);
> +        sigdelset(&uc->uc_sigmask, SIGBUS);
>      }
>
>      /* get target signal number */
> -    sig = host_to_target_signal(host_signum);
> -    if (sig < 1 || sig > TARGET_NSIG)
> +    guest_sig = host_to_target_signal(host_sig);
> +    if (guest_sig < 1 || guest_sig > TARGET_NSIG) {
>          return;
> -    trace_user_host_signal(env, host_signum, sig);
> -
> -    rewind_if_in_safe_syscall(puc);
> +    }
> +    trace_user_host_signal(env, host_sig, guest_sig);
>
>      host_to_target_siginfo_noswap(&tinfo, info);
> -    k = &ts->sigtab[sig - 1];
> +    k = &ts->sigtab[guest_sig - 1];
>      k->info = tinfo;
> -    k->pending = sig;
> +    k->pending = guest_sig;
>      ts->signal_pending = 1;
>
> -    /* Block host signals until target signal handler entered. We
> -     * can't block SIGSEGV or SIGBUS while we're executing guest
> -     * code in case the guest code provokes one in the window between
> -     * now and it getting out to the main loop. Signals will be
> -     * unblocked again in process_pending_signals().
> -     *
> -     * WARNING: we cannot use sigfillset() here because the uc_sigmask
> -     * field is a kernel sigset_t, which is much smaller than the
> -     * libc sigset_t which sigfillset() operates on. Using sigfillset()
> -     * would write 0xff bytes off the end of the structure and trash
> -     * data on the struct.
> -     * We can't use sizeof(uc->uc_sigmask) either, because the libc
> -     * headers define the struct field with the wrong (too large) type.
> +    /*
> +     * For synchronous signals, unwind the cpu state to the faulting
> +     * insn and then exit back to the main loop so that the signal
> +     * is delivered immediately.
>       */
> -    memset(&uc->uc_sigmask, 0xff, SIGSET_T_SIZE);
> -    sigdelset(&uc->uc_sigmask, SIGSEGV);
> -    sigdelset(&uc->uc_sigmask, SIGBUS);
> +    if (sync_sig) {
> +        clear_helper_retaddr();
> +        sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> +        cpu->exception_index = EXCP_INTERRUPT;
> +        cpu_loop_exit_restore(cpu, pc);
> +    }
>
> -    /* interrupt the virtual CPU as soon as possible */
> +    /*
> +     * Interrupt the virtual CPU as soon as possible, but for now
> +     * return to continue with the current TB.
> +     */
>      cpu_exit(thread_cpu);
>  }
>
> --
> 2.25.1
>
>

--00000000000082967a05cc0b65ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 13, 2021 at 4:06 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Split out two functions into linux-user/host/arch/host-si=
gnal.h.<br>
Since linux-user requires a linux host, drop all of the BSD and<br>
Solaris ifdefs.=C2=A0 These should be recreated under bsd-user/ when<br>
the current blanks there are filled.<br></blockquote><div><br></div><div>Fo=
r some architectures, this code will be small and host specific (I&#39;m th=
inking</div><div>arm, i386, ppc* and x86_64) but for others, there&#39;s co=
mmon code that can be shared</div><div>to parse the instruction (aarch64, m=
ips*, riscv*). Do you see any value in</div><div>sharing that instruction p=
arsing code in some way?</div><div><br></div><div>Otherwise, this is mostly=
 just code shuffling and figuring out which of</div><div>the long legacy of=
 ifdefs are still relevant in the *BSD world. At the</div><div>moment, we o=
nly build bsd-user on FreeBSD since the scaffolding</div><div>for the other=
 BSDs is absent. I can cope when I merge this into the</div><div>bsd-user f=
ork and loop things back when those bits are up for inclusion</div><div>in =
future patch trains.</div><div><br></div><div>Warner</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Fold the remnants of handle_cpu_signal into host_signal_handler.<br>
<br>
Drop the call to cc-&gt;tcg_ops-&gt;tlb_fill.=C2=A0 This was simply an indi=
rect<br>
method to raise SIGSEGV; it is far easier to pass the host siginfo_t<br>
along to the guest.=C2=A0 This fixes all of the guest cpu_loop code that<br=
>
currently fails to properly fill in SEGV_MAPERR vs SEGV_ACCERR.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/exec/exec-all.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 12 -<br>
=C2=A0linux-user/host/aarch64/host-signal.h |=C2=A0 73 +++<br>
=C2=A0linux-user/host/alpha/host-signal.h=C2=A0 =C2=A0|=C2=A0 41 ++<br>
=C2=A0linux-user/host/arm/host-signal.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 30 ++<br=
>
=C2=A0linux-user/host/i386/host-signal.h=C2=A0 =C2=A0 |=C2=A0 24 +<br>
=C2=A0linux-user/host/mips/host-signal.h=C2=A0 =C2=A0 |=C2=A0 61 +++<br>
=C2=A0linux-user/host/ppc/host-signal.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +<br>
=C2=A0linux-user/host/ppc64/host-signal.h=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0linux-user/host/riscv32/host-signal.h |=C2=A0 57 +++<br>
=C2=A0linux-user/host/riscv64/host-signal.h |=C2=A0 =C2=A01 +<br>
=C2=A0linux-user/host/s390/host-signal.h=C2=A0 =C2=A0 |=C2=A0 92 ++++<br>
=C2=A0linux-user/host/s390x/host-signal.h=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0linux-user/host/sparc/host-signal.h=C2=A0 =C2=A0|=C2=A0 53 ++<br>
=C2=A0linux-user/host/sparc64/host-signal.h |=C2=A0 =C2=A01 +<br>
=C2=A0linux-user/host/x86_64/host-signal.h=C2=A0 |=C2=A0 24 +<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 712 --------------------------<br>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 93 ++--<br>
=C2=A017 files changed, 543 insertions(+), 757 deletions(-)<br>
=C2=A0create mode 100644 linux-user/host/aarch64/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/alpha/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/arm/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/i386/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/mips/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/ppc/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/ppc64/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/riscv32/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/riscv64/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/s390/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/s390x/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/sparc/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/sparc64/host-signal.h<br>
=C2=A0create mode 100644 linux-user/host/x86_64/host-signal.h<br>
<br>
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h<br>
index f582d3e688..addcec6381 100644<br>
--- a/include/exec/exec-all.h<br>
+++ b/include/exec/exec-all.h<br>
@@ -683,18 +683,6 @@ uintptr_t adjust_signal_pc(uintptr_t pc);<br>
=C2=A0bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t host_pc, uintptr_t =
host_addr);<br>
<br>
-/**<br>
- * cpu_signal_handler<br>
- * @signum: host signal number<br>
- * @pinfo: host siginfo_t<br>
- * @puc: host ucontext_t<br>
- *<br>
- * To be called from the SIGBUS and SIGSEGV signal handler to inform the<b=
r>
- * virtual cpu of exceptions.=C2=A0 Returns true if the signal was handled=
 by<br>
- * the virtual CPU.<br>
- */<br>
-int cpu_signal_handler(int signum, void *pinfo, void *puc);<br>
-<br>
=C2=A0#else<br>
=C2=A0static inline void mmap_lock(void) {}<br>
=C2=A0static inline void mmap_unlock(void) {}<br>
diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/host/aarch6=
4/host-signal.h<br>
new file mode 100644<br>
index 0000000000..818da17a21<br>
--- /dev/null<br>
+++ b/linux-user/host/aarch64/host-signal.h<br>
@@ -0,0 +1,73 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef AARCH64_HOST_SIGNAL_H<br>
+#define AARCH64_HOST_SIGNAL_H<br>
+<br>
+/* Pre-3.16 kernel headers don&#39;t have these, so provide fallback defin=
itions */<br>
+#ifndef ESR_MAGIC<br>
+#define ESR_MAGIC 0x45535201<br>
+struct esr_context {<br>
+=C2=A0 =C2=A0 struct _aarch64_ctx head;<br>
+=C2=A0 =C2=A0 uint64_t esr;<br>
+};<br>
+#endif<br>
+<br>
+static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return (struct _aarch64_ctx *)&amp;uc-&gt;uc_mcontext.__rese=
rved;<br>
+}<br>
+<br>
+static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)<br>
+{<br>
+=C2=A0 =C2=A0 return (struct _aarch64_ctx *)((char *)hdr + hdr-&gt;size);<=
br>
+}<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.pc;<br>
+}<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 struct _aarch64_ctx *hdr;<br>
+=C2=A0 =C2=A0 uint32_t insn;<br>
+<br>
+=C2=A0 =C2=A0 /* Find the esr_context, which has the WnR bit in it */<br>
+=C2=A0 =C2=A0 for (hdr =3D first_ctx(uc); hdr-&gt;magic; hdr =3D next_ctx(=
hdr)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hdr-&gt;magic =3D=3D ESR_MAGIC) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct esr_context const *esrctx=
 =3D (struct esr_context const *)hdr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t esr =3D esrctx-&gt;esr;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* For data aborts <a href=3D"ht=
tp://ESR.EC" rel=3D"noreferrer" target=3D"_blank">ESR.EC</a> is 0b10010x: t=
hen bit 6 is the WnR bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return extract32(esr, 27, 5) =3D=
=3D 0x12 &amp;&amp; extract32(esr, 6, 1) =3D=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Fall back to parsing instructions; will only be need=
ed<br>
+=C2=A0 =C2=A0 =C2=A0* for really ancient (pre-3.16) kernels.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 insn =3D *(uint32_t *)host_signal_pc(uc);<br>
+<br>
+=C2=A0 =C2=A0 return (insn &amp; 0xbfff0000) =3D=3D 0x0c000000=C2=A0 =C2=
=A0/* C3.3.1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0xbfe00000) =3D=3D 0x0c800000=
=C2=A0 =C2=A0/* C3.3.2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0xbfdf0000) =3D=3D 0x0d000000=
=C2=A0 =C2=A0/* C3.3.3 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0xbfc00000) =3D=3D 0x0d800000=
=C2=A0 =C2=A0/* C3.3.4 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3f400000) =3D=3D 0x08000000=
=C2=A0 =C2=A0/* C3.3.6 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3bc00000) =3D=3D 0x39000000=
=C2=A0 =C2=A0/* C3.3.13 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3fc00000) =3D=3D 0x3d800000=
=C2=A0 =C2=A0/* ... 128bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ignore bits 10, 11 &amp; 21, controlling in=
dexing.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3bc00000) =3D=3D 0x38000000=
=C2=A0 =C2=A0/* C3.3.8-12 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3fe00000) =3D=3D 0x3c800000=
=C2=A0 =C2=A0/* ... 128bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ignore bits 23 &amp; 24, controlling indexi=
ng.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (insn &amp; 0x3a400000) =3D=3D 0x28000000; =
/* C3.3.7,14-16 */<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/ho=
st-signal.h<br>
new file mode 100644<br>
index 0000000000..eaf83added<br>
--- /dev/null<br>
+++ b/linux-user/host/alpha/host-signal.h<br>
@@ -0,0 +1,41 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef ALPHA_HOST_SIGNAL_H<br>
+#define ALPHA_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.sc_pc;<br>
+}<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t *pc =3D uc-&gt;uc_mcontext.sc_pc;<br>
+=C2=A0 =C2=A0 uint32_t insn =3D *pc;<br>
+<br>
+=C2=A0 =C2=A0 /* XXX: need kernel patch to get write flag faster */<br>
+=C2=A0 =C2=A0 switch (insn &gt;&gt; 26) {<br>
+=C2=A0 =C2=A0 case 0x0d: /* stw */<br>
+=C2=A0 =C2=A0 case 0x0e: /* stb */<br>
+=C2=A0 =C2=A0 case 0x0f: /* stq_u */<br>
+=C2=A0 =C2=A0 case 0x24: /* stf */<br>
+=C2=A0 =C2=A0 case 0x25: /* stg */<br>
+=C2=A0 =C2=A0 case 0x26: /* sts */<br>
+=C2=A0 =C2=A0 case 0x27: /* stt */<br>
+=C2=A0 =C2=A0 case 0x2c: /* stl */<br>
+=C2=A0 =C2=A0 case 0x2d: /* stq */<br>
+=C2=A0 =C2=A0 case 0x2e: /* stl_c */<br>
+=C2=A0 =C2=A0 case 0x2f: /* stq_c */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/arm/host-signal.h b/linux-user/host/arm/host-s=
ignal.h<br>
new file mode 100644<br>
index 0000000000..ae6bcde6c1<br>
--- /dev/null<br>
+++ b/linux-user/host/arm/host-signal.h<br>
@@ -0,0 +1,30 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef ARM_HOST_SIGNAL_H<br>
+#define ARM_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[R15];<br>
+}<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t pc)<b=
r>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* In the FSR, bit 11 is WnR, assuming a v6 or<br>
+=C2=A0 =C2=A0 =C2=A0* later processor.=C2=A0 On v5 we will always report<b=
r>
+=C2=A0 =C2=A0 =C2=A0* this as a read, which will fail later.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 uint32_t fsr =3D uc-&gt;uc_mcontext.error_code;<br>
+=C2=A0 =C2=A0 return extract32(fsr, 11, 1);<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/i386/host-signal.h b/linux-user/host/i386/host=
-signal.h<br>
new file mode 100644<br>
index 0000000000..a8ca5e4a89<br>
--- /dev/null<br>
+++ b/linux-user/host/i386/host-signal.h<br>
@@ -0,0 +1,24 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef I386_HOST_SIGNAL_H<br>
+#define I386_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_EIP];<br>
+}<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_TRAPNO] =3D=3D 0xe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (uc-&gt;uc_mcontext.gregs[REG_ERR] =
&amp; 0x2);<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/mips/host-signal.h b/linux-user/host/mips/host=
-signal.h<br>
new file mode 100644<br>
index 0000000000..815bbd61fa<br>
--- /dev/null<br>
+++ b/linux-user/host/mips/host-signal.h<br>
@@ -0,0 +1,61 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef MIPS_HOST_SIGNAL_H<br>
+#define MIPS_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.pc;<br>
+}<br>
+<br>
+#if defined(__misp16) || defined(__mips_micromips)<br>
+#error &quot;Unsupported encoding&quot;<br>
+#endif<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t *insn =3D *(uint32_t *)host_signal_pc(uc);<br>
+<br>
+=C2=A0 =C2=A0 /* Detect all store instructions at program counter. */<br>
+=C2=A0 =C2=A0 switch ((insn &gt;&gt; 26) &amp; 077) {<br>
+=C2=A0 =C2=A0 case 050: /* SB */<br>
+=C2=A0 =C2=A0 case 051: /* SH */<br>
+=C2=A0 =C2=A0 case 052: /* SWL */<br>
+=C2=A0 =C2=A0 case 053: /* SW */<br>
+=C2=A0 =C2=A0 case 054: /* SDL */<br>
+=C2=A0 =C2=A0 case 055: /* SDR */<br>
+=C2=A0 =C2=A0 case 056: /* SWR */<br>
+=C2=A0 =C2=A0 case 070: /* SC */<br>
+=C2=A0 =C2=A0 case 071: /* SWC1 */<br>
+=C2=A0 =C2=A0 case 074: /* SCD */<br>
+=C2=A0 =C2=A0 case 075: /* SDC1 */<br>
+=C2=A0 =C2=A0 case 077: /* SD */<br>
+#if !defined(__mips_isa_rev) || __mips_isa_rev &lt; 6<br>
+=C2=A0 =C2=A0 case 072: /* SWC2 */<br>
+=C2=A0 =C2=A0 case 076: /* SDC2 */<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 case 023: /* COP1X */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Required in all versions of MIPS64 sin=
ce<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* MIPS64r1 and subsequent versions of MI=
PS32r2.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 077) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 010: /* SWXC1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 011: /* SDXC1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 015: /* SUXC1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/host/ppc/host-s=
ignal.h<br>
new file mode 100644<br>
index 0000000000..b8dce622b4<br>
--- /dev/null<br>
+++ b/linux-user/host/ppc/host-signal.h<br>
@@ -0,0 +1,24 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef PPC_HOST_SIGNAL_H<br>
+#define PPC_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.regs-&gt;nip;<br>
+}<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.regs-&gt;trap !=3D 0x400<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (uc-&gt;uc_mcontext.regs-&gt;dsisr =
&amp; 0x02000000);<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/ppc64/host-signal.h b/linux-user/host/ppc64/ho=
st-signal.h<br>
new file mode 100644<br>
index 0000000000..a353c22a90<br>
--- /dev/null<br>
+++ b/linux-user/host/ppc64/host-signal.h<br>
@@ -0,0 +1 @@<br>
+#include &quot;../ppc/host-signal.h&quot;<br>
diff --git a/linux-user/host/riscv32/host-signal.h b/linux-user/host/riscv3=
2/host-signal.h<br>
new file mode 100644<br>
index 0000000000..f877412f96<br>
--- /dev/null<br>
+++ b/linux-user/host/riscv32/host-signal.h<br>
@@ -0,0 +1,57 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef RISCV_HOST_SIGNAL_H<br>
+#define RISCV_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.__gregs[REG_PC];<br>
+}<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Detect store by reading the instruction at the progr=
am counter.<br>
+=C2=A0 =C2=A0 =C2=A0* Do not read more than 16 bits, because we have not y=
et determined<br>
+=C2=A0 =C2=A0 =C2=A0* the size of the instruction.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 const uint16_t *pinsn =3D (const uint16_t *)host_signal_pc(u=
c);<br>
+=C2=A0 =C2=A0 uint16_t insn =3D pinsn[0];<br>
+<br>
+=C2=A0 =C2=A0 /* 16-bit instructions */<br>
+=C2=A0 =C2=A0 switch (insn &amp; 0xe003) {<br>
+=C2=A0 =C2=A0 case 0xa000: /* c.fsd */<br>
+=C2=A0 =C2=A0 case 0xc000: /* c.sw */<br>
+=C2=A0 =C2=A0 case 0xe000: /* <a href=3D"http://c.sd" rel=3D"noreferrer" t=
arget=3D"_blank">c.sd</a> (rv64) / c.fsw (rv32) */<br>
+=C2=A0 =C2=A0 case 0xa002: /* c.fsdsp */<br>
+=C2=A0 =C2=A0 case 0xc002: /* c.swsp */<br>
+=C2=A0 =C2=A0 case 0xe002: /* c.sdsp (rv64) / c.fswsp (rv32) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* 32-bit instructions, major opcodes */<br>
+=C2=A0 =C2=A0 switch (insn &amp; 0x7f) {<br>
+=C2=A0 =C2=A0 case 0x23: /* store */<br>
+=C2=A0 =C2=A0 case 0x27: /* store-fp */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 case 0x2f: /* amo */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The AMO function code is in bits 25-31=
, unread as yet.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The AMO functions are LR (read), SC (w=
rite), and the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* rest are all read-modify-write.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 insn =3D pinsn[1];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (insn &gt;&gt; 11) !=3D 2; /* LR */<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/riscv64/host-signal.h b/linux-user/host/riscv6=
4/host-signal.h<br>
new file mode 100644<br>
index 0000000000..6e27f725ab<br>
--- /dev/null<br>
+++ b/linux-user/host/riscv64/host-signal.h<br>
@@ -0,0 +1 @@<br>
+#include &quot;../riscv32/host-signal.h&quot;<br>
diff --git a/linux-user/host/s390/host-signal.h b/linux-user/host/s390/host=
-signal.h<br>
new file mode 100644<br>
index 0000000000..8d34b32b9f<br>
--- /dev/null<br>
+++ b/linux-user/host/s390/host-signal.h<br>
@@ -0,0 +1,92 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef S390_HOST_SIGNAL_H<br>
+#define S390_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.psw.addr;<br>
+}<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t *pinsn =3D (uint16_t *)host_signal_pc(uc);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* ??? On linux, the non-rt signal handler has 4 (!) ar=
guments instead<br>
+=C2=A0 =C2=A0 =C2=A0* of the normal 2 arguments.=C2=A0 The 4th argument co=
ntains the &quot;Translation-<br>
+=C2=A0 =C2=A0 =C2=A0* Exception Identification for DAT Exceptions&quot; fr=
om the hardware (aka<br>
+=C2=A0 =C2=A0 =C2=A0* &quot;int_parm_long&quot;), which does in fact conta=
in the is_write value.<br>
+=C2=A0 =C2=A0 =C2=A0* The rt signal handler, as far as I can tell, does no=
t give this value<br>
+=C2=A0 =C2=A0 =C2=A0* at all.=C2=A0 Not that we could get to it from here =
even if it were.<br>
+=C2=A0 =C2=A0 =C2=A0* So fall back to parsing instructions.=C2=A0 Treat re=
ad-modify-write ones as<br>
+=C2=A0 =C2=A0 =C2=A0* writes, which is not fully correct, but for tracking=
 self-modifying code<br>
+=C2=A0 =C2=A0 =C2=A0* this is better than treating them as reads.=C2=A0 Ch=
ecking si_addr page flags<br>
+=C2=A0 =C2=A0 =C2=A0* might be a viable improvement, albeit a racy one.<br=
>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 /* ??? This is not even close to complete.=C2=A0 */<br>
+=C2=A0 =C2=A0 switch (pinsn[0] &gt;&gt; 8) {<br>
+=C2=A0 =C2=A0 case 0x50: /* ST */<br>
+=C2=A0 =C2=A0 case 0x42: /* STC */<br>
+=C2=A0 =C2=A0 case 0x40: /* STH */<br>
+=C2=A0 =C2=A0 case 0xba: /* CS */<br>
+=C2=A0 =C2=A0 case 0xbb: /* CDS */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 case 0xc4: /* RIL format insns */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pinsn[0] &amp; 0xf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf: /* STRL */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xb: /* STGRL */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x7: /* STHRL */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 0xc8: /* SSF format insns */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pinsn[0] &amp; 0xf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x2: /* CSST */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 0xe3: /* RXY format insns */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pinsn[2] &amp; 0xff) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x50: /* STY */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x24: /* STG */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x72: /* STCY */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x70: /* STHY */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x8e: /* STPQ */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3f: /* STRVH */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3e: /* STRV */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x2f: /* STRVG */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 0xeb: /* RSY format insns */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pinsn[2] &amp; 0xff) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x14: /* CSY */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x30: /* CSG */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x31: /* CDSY */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3e: /* CDSG */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xe4: /* LANG */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xe6: /* LAOG */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xe7: /* LAXG */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xe8: /* LAAG */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xea: /* LAALG */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf4: /* LAN */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf6: /* LAO */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf7: /* LAX */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xfa: /* LAAL */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf8: /* LAA */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/s390x/host-signal.h b/linux-user/host/s390x/ho=
st-signal.h<br>
new file mode 100644<br>
index 0000000000..0e83f9358d<br>
--- /dev/null<br>
+++ b/linux-user/host/s390x/host-signal.h<br>
@@ -0,0 +1 @@<br>
+#include &quot;../s390/host-signal.h&quot;<br>
diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/host/sparc/ho=
st-signal.h<br>
new file mode 100644<br>
index 0000000000..47d3b1512e<br>
--- /dev/null<br>
+++ b/linux-user/host/sparc/host-signal.h<br>
@@ -0,0 +1,53 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef SPARC_HOST_SIGNAL_H<br>
+#define SPARC_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+#ifdef __arch64__<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.mc_gregs[MC_PC];<br>
+#else<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_PC];<br>
+#endif<br>
+}<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)host_signal_pc(uc);<br>
+<br>
+=C2=A0 =C2=A0 if ((insn &gt;&gt; 30) =3D=3D 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch ((insn &gt;&gt; 19) &amp; 0x3f) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x05: /* stb */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x15: /* stba */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x06: /* sth */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x16: /* stha */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x04: /* st */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x14: /* sta */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x07: /* std */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x17: /* stda */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x0e: /* stx */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x1e: /* stxa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x24: /* stf */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x34: /* stfa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x27: /* stdf */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x37: /* stdfa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x26: /* stqf */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x36: /* stqfa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x25: /* stfsr */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3c: /* casa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3e: /* casxa */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/sparc64/host-signal.h b/linux-user/host/sparc6=
4/host-signal.h<br>
new file mode 100644<br>
index 0000000000..1191fe2d40<br>
--- /dev/null<br>
+++ b/linux-user/host/sparc64/host-signal.h<br>
@@ -0,0 +1 @@<br>
+#include &quot;../sparc/host-signal.h&quot;<br>
diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/host/x86_64/=
host-signal.h<br>
new file mode 100644<br>
index 0000000000..d5fb3e4484<br>
--- /dev/null<br>
+++ b/linux-user/host/x86_64/host-signal.h<br>
@@ -0,0 +1,24 @@<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef X86_64_HOST_SIGNAL_H<br>
+#define X86_64_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_RIP];<br>
+}<br>
+<br>
+static inline bool host_sigsegv_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_TRAPNO] =3D=3D 0xe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (uc-&gt;uc_mcontext.gregs[REG_ERR] =
&amp; 0x2);<br>
+}<br>
+<br>
+#endif<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index ad6b4f6abf..39635cbea2 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -29,23 +29,8 @@<br>
=C2=A0#include &quot;trace/trace-root.h&quot;<br>
=C2=A0#include &quot;trace/mem.h&quot;<br>
<br>
-#undef EAX<br>
-#undef ECX<br>
-#undef EDX<br>
-#undef EBX<br>
-#undef ESP<br>
-#undef EBP<br>
-#undef ESI<br>
-#undef EDI<br>
-#undef EIP<br>
-#ifdef __linux__<br>
-#include &lt;sys/ucontext.h&gt;<br>
-#endif<br>
-<br>
=C2=A0__thread uintptr_t helper_retaddr;<br>
<br>
-//#define DEBUG_SIGNAL<br>
-<br>
=C2=A0/**<br>
=C2=A0 * adjust_signal_pc:<br>
=C2=A0 * @pc: raw pc from the host signal ucontext_t.<br>
@@ -154,69 +139,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset=
_t *old_set,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-/* &#39;pc&#39; is the host PC at which the exception was raised. &#39;add=
ress&#39; is<br>
-=C2=A0 =C2=A0the effective address of the memory exception. &#39;is_write&=
#39; is 1 if a<br>
-=C2=A0 =C2=A0write caused the exception and otherwise 0&#39;. &#39;old_set=
&#39; is the<br>
-=C2=A0 =C2=A0signal set which should be restored */<br>
-static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int is_write, sigset_t=
 *old_set)<br>
-{<br>
-=C2=A0 =C2=A0 CPUState *cpu =3D current_cpu;<br>
-=C2=A0 =C2=A0 CPUClass *cc;<br>
-=C2=A0 =C2=A0 unsigned long address =3D (unsigned long)info-&gt;si_addr;<b=
r>
-=C2=A0 =C2=A0 MMUAccessType access_type;<br>
-<br>
-=C2=A0 =C2=A0 if (is_write) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 access_type =3D MMU_DATA_STORE;<br>
-=C2=A0 =C2=A0 } else if (helper_retaddr =3D=3D 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 access_type =3D MMU_INST_FETCH;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 access_type =3D MMU_DATA_LOAD;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 pc =3D adjust_signal_pc(pc);<br>
-<br>
-=C2=A0 =C2=A0 /* For synchronous signals we expect to be coming from the v=
CPU<br>
-=C2=A0 =C2=A0 =C2=A0* thread (so current_cpu should be valid) and either f=
rom running<br>
-=C2=A0 =C2=A0 =C2=A0* code or during translation which can fault as we cro=
ss pages.<br>
-=C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0* If neither is true then something has gone wrong and=
 we should<br>
-=C2=A0 =C2=A0 =C2=A0* abort rather than try and restart the vCPU execution=
.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 if (!cpu || !cpu-&gt;running) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;qemu:%s received signal outside v=
CPU context @ pc=3D0x%&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PRIxPTR &quot;\n&qu=
ot;,=C2=A0 __func__, pc);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-#if defined(DEBUG_SIGNAL)<br>
-=C2=A0 =C2=A0 printf(&quot;qemu: SIGSEGV pc=3D0x%08lx address=3D%08lx w=3D=
%d oldset=3D0x%08lx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pc, address, is_write, *(unsigned=
 long *)old_set);<br>
-#endif<br>
-<br>
-=C2=A0 =C2=A0 /* XXX: locking issue */<br>
-=C2=A0 =C2=A0 if (is_write &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;si_signo =3D=3D SIGSEGV &amp;&amp;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;si_code =3D=3D SEGV_ACCERR &amp;&amp;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 handle_sigsegv_accerr_write(cpu, old_set, pc, =
address)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Convert forcefully to guest address space, invalid addres=
ses<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0are still valid segv ones */<br>
-=C2=A0 =C2=A0 address =3D h2g_nocheck(address);<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* There is no way the target can handle this other tha=
n raising<br>
-=C2=A0 =C2=A0 =C2=A0* an exception.=C2=A0 Undo signal and retaddr state pr=
ior to longjmp.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 sigprocmask(SIG_SETMASK, old_set, NULL);<br>
-<br>
-=C2=A0 =C2=A0 cc =3D CPU_GET_CLASS(cpu);<br>
-=C2=A0 =C2=A0 cc-&gt;tcg_ops-&gt;tlb_fill(cpu, address, 0, access_type,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMU_USER_IDX, false, pc);<br>
-=C2=A0 =C2=A0 g_assert_not_reached();<br>
-}<br>
-<br>
=C2=A0static int probe_access_internal(CPUArchState *env, target_ulong addr=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int fault_size, MMUAccessType=
 access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool nonfault, uintptr_t ra)<=
br>
@@ -275,640 +197,6 @@ void *probe_access(CPUArchState *env, target_ulong ad=
dr, int size,<br>
=C2=A0 =C2=A0 =C2=A0return size ? g2h(env_cpu(env), addr) : NULL;<br>
=C2=A0}<br>
<br>
-#if defined(__i386__)<br>
-<br>
-#if defined(__NetBSD__)<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;machine/trap.h&gt;<br>
-<br>
-#define EIP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.__g=
regs[_REG_EIP])<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.__gregs[=
_REG_TRAPNO])<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;uc_mcontext.__gregs[=
_REG_ERR])<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_sigmask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 T_PAGEFLT<br>
-#elif defined(__FreeBSD__) || defined(__DragonFly__)<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;machine/trap.h&gt;<br>
-<br>
-#define EIP_sig(context)=C2=A0 (*((unsigned long *)&amp;(context)-&gt;uc_m=
context.mc_eip))<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.mc_trapn=
o)<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;uc_mcontext.mc_err)<=
br>
-#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_sigmask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 T_PAGEFLT<br>
-#elif defined(__OpenBSD__)<br>
-#include &lt;machine/trap.h&gt;<br>
-#define EIP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_eip)<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;sc_trapno)<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;sc_err)<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;sc_mask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 T_PAGEFLT<br>
-#else<br>
-#define EIP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.gre=
gs[REG_EIP])<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.gregs[RE=
G_TRAPNO])<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;uc_mcontext.gregs[RE=
G_ERR])<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_sigmask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 0xe<br>
-#endif<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)<=
br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#elif defined(__OpenBSD__)<br>
-=C2=A0 =C2=A0 struct sigcontext *uc =3D puc;<br>
-#else<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#endif<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-=C2=A0 =C2=A0 int trapno;<br>
-<br>
-#ifndef REG_EIP<br>
-/* for glibc 2.1 */<br>
-#define REG_EIP=C2=A0 =C2=A0 EIP<br>
-#define REG_ERR=C2=A0 =C2=A0 ERR<br>
-#define REG_TRAPNO TRAPNO<br>
-#endif<br>
-=C2=A0 =C2=A0 pc =3D EIP_sig(uc);<br>
-=C2=A0 =C2=A0 trapno =3D TRAP_sig(uc);<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trapno =3D=3D PAGE_FAULT_TRAP ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ERROR_sig(uc) &gt;&gt; 1) &amp; 1 : 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;MASK_sig(uc));<br>
-}<br>
-<br>
-#elif defined(__x86_64__)<br>
-<br>
-#ifdef __NetBSD__<br>
-#include &lt;machine/trap.h&gt;<br>
-#define PC_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0_UC_MACHINE_PC(context)<=
br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.__=
gregs[_REG_TRAPNO])<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.__gregs=
[_REG_ERR])<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_sigmask)<br=
>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A0T_PAGEFLT<br>
-#elif defined(__OpenBSD__)<br>
-#include &lt;machine/trap.h&gt;<br>
-#define PC_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_rip)<b=
r>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_trapno)<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;sc_err)<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_mask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A0T_PAGEFLT<br>
-#elif defined(__FreeBSD__) || defined(__DragonFly__)<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;machine/trap.h&gt;<br>
-<br>
-#define PC_sig(context)=C2=A0 (*((unsigned long *)&amp;(context)-&gt;uc_mc=
ontext.mc_rip))<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.mc=
_trapno)<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.mc_err)=
<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_sigmask)<br=
>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A0T_PAGEFLT<br>
-#else<br>
-#define PC_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mconte=
xt.gregs[REG_RIP])<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.gr=
egs[REG_TRAPNO])<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.gregs[R=
EG_ERR])<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_sigmask)<br=
>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A00xe<br>
-#endif<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)<=
br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#elif defined(__OpenBSD__)<br>
-=C2=A0 =C2=A0 struct sigcontext *uc =3D puc;<br>
-#else<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#endif<br>
-<br>
-=C2=A0 =C2=A0 pc =3D PC_sig(uc);<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRAP_sig(uc) =3D=3D PAGE_FAULT_TRAP ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ERROR_sig(uc) &gt;&gt; 1) &amp; 1 : 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;MASK_sig(uc));<br>
-}<br>
-<br>
-#elif defined(_ARCH_PPC)<br>
-<br>
-/***********************************************************************<b=
r>
- * signal context platform-specific definitions<br>
- * From Wine<br>
- */<br>
-#ifdef linux<br>
-/* All Registers access - only for local access */<br>
-#define REG_sig(reg_name, context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.regs-&gt;reg_name)<br>
-/* Gpr Registers access=C2=A0 */<br>
-#define GPR_sig(reg_num, context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 REG_sig(gpr[reg_num], context)<br>
-/* Program counter */<br>
-#define IAR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REG_sig(nip, context)<br>
-/* Machine State Register (Supervisor) */<br>
-#define MSR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REG_sig(msr, context)<br>
-/* Count register */<br>
-#define CTR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REG_sig(ctr, context)<br>
-/* User&#39;s integer exception register */<br>
-#define XER_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REG_sig(xer, context)<br>
-/* Link register */<br>
-#define LR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 REG_sig(link, context)<br>
-/* Condition register */<br>
-#define CR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 REG_sig(ccr, context)<br>
-<br>
-/* Float Registers access=C2=A0 */<br>
-#define FLOAT_sig(reg_num, context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 (((double *)((char *)((context)-&gt;uc_mcontext.regs + 48 * =
4)))[reg_num])<br>
-#define FPSCR_sig(context) \<br>
-=C2=A0 =C2=A0 (*(int *)((char *)((context)-&gt;uc_mcontext.regs + (48 + 32=
 * 2) * 4)))<br>
-/* Exception Registers access */<br>
-#define DAR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REG_sig(dar, context)<br>
-#define DSISR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0REG_sig(dsisr, context)<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 REG_sig(trap, context)<br>
-#endif /* linux */<br>
-<br>
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)<br>
-#include &lt;ucontext.h&gt;<br>
-#define IAR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0((context)-&gt;uc_mcontext.mc_srr0)<br>
-#define MSR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0((context)-&gt;uc_mcontext.mc_srr1)<br>
-#define CTR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0((context)-&gt;uc_mcontext.mc_ctr)<br>
-#define XER_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0((context)-&gt;uc_mcontext.mc_xer)<br>
-#define LR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ((context)-&gt;uc_mcontext.mc_lr)<br>
-#define CR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ((context)-&gt;uc_mcontext.mc_cr)<br>
-/* Exception Registers access */<br>
-#define DAR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0((context)-&gt;uc_mcontext.mc_dar)<br>
-#define DSISR_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
((context)-&gt;uc_mcontext.mc_dsisr)<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
((context)-&gt;uc_mcontext.mc_exc)<br>
-#endif /* __FreeBSD__|| __FreeBSD_kernel__ */<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#else<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#endif<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-=C2=A0 =C2=A0 int is_write;<br>
-<br>
-=C2=A0 =C2=A0 pc =3D IAR_sig(uc);<br>
-=C2=A0 =C2=A0 is_write =3D 0;<br>
-#if 0<br>
-=C2=A0 =C2=A0 /* ppc 4xx case */<br>
-=C2=A0 =C2=A0 if (DSISR_sig(uc) &amp; 0x00800000) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 }<br>
-#else<br>
-=C2=A0 =C2=A0 if (TRAP_sig(uc) !=3D 0x400 &amp;&amp; (DSISR_sig(uc) &amp; =
0x02000000)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 }<br>
-#endif<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-<br>
-#elif defined(__alpha__)<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 uint32_t *pc =3D uc-&gt;uc_mcontext.sc_pc;<br>
-=C2=A0 =C2=A0 uint32_t insn =3D *pc;<br>
-=C2=A0 =C2=A0 int is_write =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 /* XXX: need kernel patch to get write flag faster */<br>
-=C2=A0 =C2=A0 switch (insn &gt;&gt; 26) {<br>
-=C2=A0 =C2=A0 case 0x0d: /* stw */<br>
-=C2=A0 =C2=A0 case 0x0e: /* stb */<br>
-=C2=A0 =C2=A0 case 0x0f: /* stq_u */<br>
-=C2=A0 =C2=A0 case 0x24: /* stf */<br>
-=C2=A0 =C2=A0 case 0x25: /* stg */<br>
-=C2=A0 =C2=A0 case 0x26: /* sts */<br>
-=C2=A0 =C2=A0 case 0x27: /* stt */<br>
-=C2=A0 =C2=A0 case 0x2c: /* stl */<br>
-=C2=A0 =C2=A0 case 0x2d: /* stq */<br>
-=C2=A0 =C2=A0 case 0x2e: /* stl_c */<br>
-=C2=A0 =C2=A0 case 0x2f: /* stq_c */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-#elif defined(__sparc__)<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 int is_write;<br>
-=C2=A0 =C2=A0 uint32_t insn;<br>
-#if !defined(__arch64__) || defined(CONFIG_SOLARIS)<br>
-=C2=A0 =C2=A0 uint32_t *regs =3D (uint32_t *)(info + 1);<br>
-=C2=A0 =C2=A0 void *sigmask =3D (regs + 20);<br>
-=C2=A0 =C2=A0 /* XXX: is there a standard glibc define ? */<br>
-=C2=A0 =C2=A0 unsigned long pc =3D regs[1];<br>
-#else<br>
-#ifdef __linux__<br>
-=C2=A0 =C2=A0 struct sigcontext *sc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long pc =3D sc-&gt;sigc_regs.tpc;<br>
-=C2=A0 =C2=A0 void *sigmask =3D (void *)sc-&gt;sigc_mask;<br>
-#elif defined(__OpenBSD__)<br>
-=C2=A0 =C2=A0 struct sigcontext *uc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long pc =3D uc-&gt;sc_pc;<br>
-=C2=A0 =C2=A0 void *sigmask =3D (void *)(long)uc-&gt;sc_mask;<br>
-#elif defined(__NetBSD__)<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long pc =3D _UC_MACHINE_PC(uc);<br>
-=C2=A0 =C2=A0 void *sigmask =3D (void *)&amp;uc-&gt;uc_sigmask;<br>
-#endif<br>
-#endif<br>
-<br>
-=C2=A0 =C2=A0 /* XXX: need kernel patch to get write flag faster */<br>
-=C2=A0 =C2=A0 is_write =3D 0;<br>
-=C2=A0 =C2=A0 insn =3D *(uint32_t *)pc;<br>
-=C2=A0 =C2=A0 if ((insn &gt;&gt; 30) =3D=3D 3) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch ((insn &gt;&gt; 19) &amp; 0x3f) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x05: /* stb */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x15: /* stba */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x06: /* sth */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x16: /* stha */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x04: /* st */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x14: /* sta */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x07: /* std */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x17: /* stda */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x0e: /* stx */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x1e: /* stxa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x24: /* stf */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x34: /* stfa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x27: /* stdf */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x37: /* stdfa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x26: /* stqf */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x36: /* stqfa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x25: /* stfsr */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3c: /* casa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3e: /* casxa */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, sigmask);<br>
-}<br>
-<br>
-#elif defined(__arm__)<br>
-<br>
-#if defined(__NetBSD__)<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;sys/siginfo.h&gt;<br>
-#endif<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-#if defined(__NetBSD__)<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 siginfo_t *si =3D pinfo;<br>
-#else<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#endif<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-=C2=A0 =C2=A0 uint32_t fsr;<br>
-=C2=A0 =C2=A0 int is_write;<br>
-<br>
-#if defined(__NetBSD__)<br>
-=C2=A0 =C2=A0 pc =3D uc-&gt;uc_mcontext.__gregs[_REG_R15];<br>
-#elif defined(__GLIBC__) &amp;&amp; (__GLIBC__ &lt; 2 || (__GLIBC__ =3D=3D=
 2 &amp;&amp; __GLIBC_MINOR__ &lt;=3D 3))<br>
-=C2=A0 =C2=A0 pc =3D uc-&gt;uc_mcontext.gregs[R15];<br>
-#else<br>
-=C2=A0 =C2=A0 pc =3D uc-&gt;uc_mcontext.arm_pc;<br>
-#endif<br>
-<br>
-#ifdef __NetBSD__<br>
-=C2=A0 =C2=A0 fsr =3D si-&gt;si_trap;<br>
-#else<br>
-=C2=A0 =C2=A0 fsr =3D uc-&gt;uc_mcontext.error_code;<br>
-#endif<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* In the FSR, bit 11 is WnR, assuming a v6 or<br>
-=C2=A0 =C2=A0 =C2=A0* later processor.=C2=A0 On v5 we will always report<b=
r>
-=C2=A0 =C2=A0 =C2=A0* this as a read, which will fail later.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 is_write =3D extract32(fsr, 11, 1);<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-<br>
-#elif defined(__aarch64__)<br>
-<br>
-#if defined(__NetBSD__)<br>
-<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;sys/siginfo.h&gt;<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo, void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 siginfo_t *si =3D pinfo;<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-=C2=A0 =C2=A0 int is_write;<br>
-=C2=A0 =C2=A0 uint32_t esr;<br>
-<br>
-=C2=A0 =C2=A0 pc =3D uc-&gt;uc_mcontext.__gregs[_REG_PC];<br>
-=C2=A0 =C2=A0 esr =3D si-&gt;si_trap;<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* siginfo_t::si_trap is the ESR value, for data aborts=
 <a href=3D"http://ESR.EC" rel=3D"noreferrer" target=3D"_blank">ESR.EC</a><=
br>
-=C2=A0 =C2=A0 =C2=A0* is 0b10010x: then bit 6 is the WnR bit<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 is_write =3D extract32(esr, 27, 5) =3D=3D 0x12 &amp;&amp; ex=
tract32(esr, 6, 1) =3D=3D 1;<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, si, is_write, &amp;uc-&gt;uc_si=
gmask);<br>
-}<br>
-<br>
-#else<br>
-<br>
-#ifndef ESR_MAGIC<br>
-/* Pre-3.16 kernel headers don&#39;t have these, so provide fallback defin=
itions */<br>
-#define ESR_MAGIC 0x45535201<br>
-struct esr_context {<br>
-=C2=A0 =C2=A0 struct _aarch64_ctx head;<br>
-=C2=A0 =C2=A0 uint64_t esr;<br>
-};<br>
-#endif<br>
-<br>
-static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)<br>
-{<br>
-=C2=A0 =C2=A0 return (struct _aarch64_ctx *)&amp;uc-&gt;uc_mcontext.__rese=
rved;<br>
-}<br>
-<br>
-static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)<br>
-{<br>
-=C2=A0 =C2=A0 return (struct _aarch64_ctx *)((char *)hdr + hdr-&gt;size);<=
br>
-}<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo, void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 uintptr_t pc =3D uc-&gt;uc_mcontext.pc;<br>
-=C2=A0 =C2=A0 bool is_write;<br>
-=C2=A0 =C2=A0 struct _aarch64_ctx *hdr;<br>
-=C2=A0 =C2=A0 struct esr_context const *esrctx =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 /* Find the esr_context, which has the WnR bit in it */<br>
-=C2=A0 =C2=A0 for (hdr =3D first_ctx(uc); hdr-&gt;magic; hdr =3D next_ctx(=
hdr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hdr-&gt;magic =3D=3D ESR_MAGIC) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esrctx =3D (struct esr_context c=
onst *)hdr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (esrctx) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* For data aborts <a href=3D"http://ESR.EC" r=
el=3D"noreferrer" target=3D"_blank">ESR.EC</a> is 0b10010x: then bit 6 is t=
he WnR bit */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t esr =3D esrctx-&gt;esr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D extract32(esr, 27, 5) =3D=3D 0x12=
 &amp;&amp; extract32(esr, 6, 1) =3D=3D 1;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fall back to parsing instructions; wil=
l only be needed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for really ancient (pre-3.16) kernels.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)pc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D ((insn &amp; 0xbfff0000) =3D=3D 0=
x0c000000=C2=A0 =C2=A0/* C3.3.1 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0xbfe00000) =3D=3D 0x0c800000=C2=A0 =C2=A0/* C3.3.2 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0xbfdf0000) =3D=3D 0x0d000000=C2=A0 =C2=A0/* C3.3.3 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0xbfc00000) =3D=3D 0x0d800000=C2=A0 =C2=A0/* C3.3.4 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3f400000) =3D=3D 0x08000000=C2=A0 =C2=A0/* C3.3.6 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3bc00000) =3D=3D 0x39000000=C2=A0 =C2=A0/* C3.3.13 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3fc00000) =3D=3D 0x3d800000=C2=A0 =C2=A0/* ... 128bit */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* I=
gnore bits 10, 11 &amp; 21, controlling indexing.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3bc00000) =3D=3D 0x38000000=C2=A0 =C2=A0/* C3.3.8-12 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3fe00000) =3D=3D 0x3c800000=C2=A0 =C2=A0/* ... 128bit */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* I=
gnore bits 23 &amp; 24, controlling indexing.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (=
insn &amp; 0x3a400000) =3D=3D 0x28000000); /* C3.3.7,14-16 */<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-#endif<br>
-<br>
-#elif defined(__s390__)<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-=C2=A0 =C2=A0 uint16_t *pinsn;<br>
-=C2=A0 =C2=A0 int is_write =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 pc =3D uc-&gt;uc_mcontext.psw.addr;<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* ??? On linux, the non-rt signal handler has 4 (!) ar=
guments instead<br>
-=C2=A0 =C2=A0 =C2=A0* of the normal 2 arguments.=C2=A0 The 4th argument co=
ntains the &quot;Translation-<br>
-=C2=A0 =C2=A0 =C2=A0* Exception Identification for DAT Exceptions&quot; fr=
om the hardware (aka<br>
-=C2=A0 =C2=A0 =C2=A0* &quot;int_parm_long&quot;), which does in fact conta=
in the is_write value.<br>
-=C2=A0 =C2=A0 =C2=A0* The rt signal handler, as far as I can tell, does no=
t give this value<br>
-=C2=A0 =C2=A0 =C2=A0* at all.=C2=A0 Not that we could get to it from here =
even if it were.<br>
-=C2=A0 =C2=A0 =C2=A0* So fall back to parsing instructions.=C2=A0 Treat re=
ad-modify-write ones as<br>
-=C2=A0 =C2=A0 =C2=A0* writes, which is not fully correct, but for tracking=
 self-modifying code<br>
-=C2=A0 =C2=A0 =C2=A0* this is better than treating them as reads.=C2=A0 Ch=
ecking si_addr page flags<br>
-=C2=A0 =C2=A0 =C2=A0* might be a viable improvement, albeit a racy one.<br=
>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 /* ??? This is not even close to complete.=C2=A0 */<br>
-=C2=A0 =C2=A0 pinsn =3D (uint16_t *)pc;<br>
-=C2=A0 =C2=A0 switch (pinsn[0] &gt;&gt; 8) {<br>
-=C2=A0 =C2=A0 case 0x50: /* ST */<br>
-=C2=A0 =C2=A0 case 0x42: /* STC */<br>
-=C2=A0 =C2=A0 case 0x40: /* STH */<br>
-=C2=A0 =C2=A0 case 0xba: /* CS */<br>
-=C2=A0 =C2=A0 case 0xbb: /* CDS */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case 0xc4: /* RIL format insns */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pinsn[0] &amp; 0xf) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf: /* STRL */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xb: /* STGRL */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x7: /* STHRL */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case 0xc8: /* SSF format insns */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pinsn[0] &amp; 0xf) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x2: /* CSST */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case 0xe3: /* RXY format insns */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pinsn[2] &amp; 0xff) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x50: /* STY */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x24: /* STG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x72: /* STCY */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x70: /* STHY */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x8e: /* STPQ */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3f: /* STRVH */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3e: /* STRV */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x2f: /* STRVG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case 0xeb: /* RSY format insns */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pinsn[2] &amp; 0xff) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x14: /* CSY */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x30: /* CSG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x31: /* CDSY */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3e: /* CDSG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xe4: /* LANG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xe6: /* LAOG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xe7: /* LAXG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xe8: /* LAAG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xea: /* LAALG */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf4: /* LAN */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf6: /* LAO */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf7: /* LAX */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xfa: /* LAAL */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf8: /* LAA */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-<br>
-#elif defined(__mips__)<br>
-<br>
-#if defined(__misp16) || defined(__mips_micromips)<br>
-#error &quot;Unsupported encoding&quot;<br>
-#endif<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 uintptr_t pc =3D uc-&gt;uc_mcontext.pc;<br>
-=C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)pc;<br>
-=C2=A0 =C2=A0 int is_write =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 /* Detect all store instructions at program counter. */<br>
-=C2=A0 =C2=A0 switch((insn &gt;&gt; 26) &amp; 077) {<br>
-=C2=A0 =C2=A0 case 050: /* SB */<br>
-=C2=A0 =C2=A0 case 051: /* SH */<br>
-=C2=A0 =C2=A0 case 052: /* SWL */<br>
-=C2=A0 =C2=A0 case 053: /* SW */<br>
-=C2=A0 =C2=A0 case 054: /* SDL */<br>
-=C2=A0 =C2=A0 case 055: /* SDR */<br>
-=C2=A0 =C2=A0 case 056: /* SWR */<br>
-=C2=A0 =C2=A0 case 070: /* SC */<br>
-=C2=A0 =C2=A0 case 071: /* SWC1 */<br>
-=C2=A0 =C2=A0 case 074: /* SCD */<br>
-=C2=A0 =C2=A0 case 075: /* SDC1 */<br>
-=C2=A0 =C2=A0 case 077: /* SD */<br>
-#if !defined(__mips_isa_rev) || __mips_isa_rev &lt; 6<br>
-=C2=A0 =C2=A0 case 072: /* SWC2 */<br>
-=C2=A0 =C2=A0 case 076: /* SDC2 */<br>
-#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case 023: /* COP1X */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Required in all versions of MIPS64 since<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIPS64r1 and subsequent versions =
of MIPS32r2. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 077) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 010: /* SWXC1 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 011: /* SDXC1 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 015: /* SUXC1 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-<br>
-#elif defined(__riscv)<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 greg_t pc =3D uc-&gt;uc_mcontext.__gregs[REG_PC];<br>
-=C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)pc;<br>
-=C2=A0 =C2=A0 int is_write =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 /* Detect store by reading the instruction at the program<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0counter. Note: we currently only generate 32-bi=
t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0instructions so we thus only detect 32-bit stor=
es */<br>
-=C2=A0 =C2=A0 switch (((insn &gt;&gt; 0) &amp; 0b11)) {<br>
-=C2=A0 =C2=A0 case 3:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (((insn &gt;&gt; 2) &amp; 0b11111)) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 8:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (((insn &gt;&gt; 12) &amp=
; 0b111)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* sb */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1: /* sh */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* sw */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3: /* sd */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4: /* sq */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 9:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (((insn &gt;&gt; 12) &amp=
; 0b111)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* fsw */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3: /* fsd */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4: /* fsq */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Check for compressed instructions */<br>
-=C2=A0 =C2=A0 switch (((insn &gt;&gt; 13) &amp; 0b111)) {<br>
-=C2=A0 =C2=A0 case 7:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 0b11) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /*<a href=3D"http://c.sd" rel=3D"noref=
errer" target=3D"_blank">c.sd</a> */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* c.sdsp */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case 6:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 0b11) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* c.sw */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3: /* c.swsp */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-<br>
-#else<br>
-<br>
-#error host CPU specific signal handler needed<br>
-<br>
-#endif<br>
-<br>
=C2=A0/* The softmmu versions of these helpers are in cputlb.c.=C2=A0 */<br=
>
<br>
=C2=A0uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)<br>
diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
index 73c0f9066b..509dad7850 100644<br>
--- a/linux-user/signal.c<br>
+++ b/linux-user/signal.c<br>
@@ -24,6 +24,7 @@<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;signal-common.h&quot;<br>
+#include &quot;host-signal.h&quot;<br>
<br>
=C2=A0static struct target_sigaction sigact_table[TARGET_NSIG];<br>
<br>
@@ -753,59 +754,85 @@ static inline void rewind_if_in_safe_syscall(void *pu=
c)<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
-static void host_signal_handler(int host_signum, siginfo_t *info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *puc)<br>
+static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUArchState *env =3D thread_cpu-&gt;env_ptr;<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D env_cpu(env);<br>
=C2=A0 =C2=A0 =C2=A0TaskState *ts =3D cpu-&gt;opaque;<br>
-<br>
-=C2=A0 =C2=A0 int sig;<br>
+=C2=A0 =C2=A0 bool sync_sig =3D false;<br>
=C2=A0 =C2=A0 =C2=A0target_siginfo_t tinfo;<br>
=C2=A0 =C2=A0 =C2=A0ucontext_t *uc =3D puc;<br>
=C2=A0 =C2=A0 =C2=A0struct emulated_sigtable *k;<br>
+=C2=A0 =C2=A0 uintptr_t pc =3D 0;<br>
+=C2=A0 =C2=A0 int guest_sig;<br>
<br>
-=C2=A0 =C2=A0 /* the CPU emulator uses some host signals to detect excepti=
ons,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0we forward to it some signals */<br>
-=C2=A0 =C2=A0 if ((host_signum =3D=3D SIGSEGV || host_signum =3D=3D SIGBUS=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; info-&gt;si_code &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_signal_handler(host_signum, info, puc)=
)<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Non-spoofed SIGSEGV and SIGBUS are synchronous, and =
need special<br>
+=C2=A0 =C2=A0 =C2=A0* handling wrt signal blocking and unwinding.=C2=A0 SI=
GSEGV may need to<br>
+=C2=A0 =C2=A0 =C2=A0* remove write-protection and restart the instruction.=
<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if ((host_sig =3D=3D SIGSEGV || host_sig =3D=3D SIGBUS) &amp=
;&amp; info-&gt;si_code &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pc =3D adjust_signal_pc(host_signal_pc(uc));<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host_sig =3D=3D SIGSEGV &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;si_code =3D=3D SEGV_ACC=
ERR &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_sigsegv_write(info, uc) &am=
p;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handle_sigsegv_accerr_write(cpu,=
 &amp;uc-&gt;uc_sigmask, pc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uintptr=
_t)info-&gt;si_addr)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sync_sig =3D true;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rewind_if_in_safe_syscall(puc);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Block host signals until target signal=
 handler entered.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We can&#39;t block SIGSEGV or SIGBUS w=
hile we&#39;re executing<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* guest code in case the guest code prov=
okes one in the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* window between now and it getting out =
to the main loop.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Signals will be unblocked again in pro=
cess_pending_signals().<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* WARNING: we cannot use sigfillset() he=
re because the uc_sigmask<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* field is a kernel sigset_t, which is m=
uch smaller than the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* libc sigset_t which sigfillset() opera=
tes on. Using sigfillset()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* would write 0xff bytes off the end of =
the structure and trash<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* data on the struct.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We can&#39;t use sizeof(uc-&gt;uc_sigm=
ask) either, because the libc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* headers define the struct field with t=
he wrong (too large) type.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;uc-&gt;uc_sigmask, 0xff, SIGSET_T_=
SIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigdelset(&amp;uc-&gt;uc_sigmask, SIGSEGV);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigdelset(&amp;uc-&gt;uc_sigmask, SIGBUS);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* get target signal number */<br>
-=C2=A0 =C2=A0 sig =3D host_to_target_signal(host_signum);<br>
-=C2=A0 =C2=A0 if (sig &lt; 1 || sig &gt; TARGET_NSIG)<br>
+=C2=A0 =C2=A0 guest_sig =3D host_to_target_signal(host_sig);<br>
+=C2=A0 =C2=A0 if (guest_sig &lt; 1 || guest_sig &gt; TARGET_NSIG) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 trace_user_host_signal(env, host_signum, sig);<br>
-<br>
-=C2=A0 =C2=A0 rewind_if_in_safe_syscall(puc);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 trace_user_host_signal(env, host_sig, guest_sig);<br>
<br>
=C2=A0 =C2=A0 =C2=A0host_to_target_siginfo_noswap(&amp;tinfo, info);<br>
-=C2=A0 =C2=A0 k =3D &amp;ts-&gt;sigtab[sig - 1];<br>
+=C2=A0 =C2=A0 k =3D &amp;ts-&gt;sigtab[guest_sig - 1];<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;info =3D tinfo;<br>
-=C2=A0 =C2=A0 k-&gt;pending =3D sig;<br>
+=C2=A0 =C2=A0 k-&gt;pending =3D guest_sig;<br>
=C2=A0 =C2=A0 =C2=A0ts-&gt;signal_pending =3D 1;<br>
<br>
-=C2=A0 =C2=A0 /* Block host signals until target signal handler entered. W=
e<br>
-=C2=A0 =C2=A0 =C2=A0* can&#39;t block SIGSEGV or SIGBUS while we&#39;re ex=
ecuting guest<br>
-=C2=A0 =C2=A0 =C2=A0* code in case the guest code provokes one in the wind=
ow between<br>
-=C2=A0 =C2=A0 =C2=A0* now and it getting out to the main loop. Signals wil=
l be<br>
-=C2=A0 =C2=A0 =C2=A0* unblocked again in process_pending_signals().<br>
-=C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0* WARNING: we cannot use sigfillset() here because the=
 uc_sigmask<br>
-=C2=A0 =C2=A0 =C2=A0* field is a kernel sigset_t, which is much smaller th=
an the<br>
-=C2=A0 =C2=A0 =C2=A0* libc sigset_t which sigfillset() operates on. Using =
sigfillset()<br>
-=C2=A0 =C2=A0 =C2=A0* would write 0xff bytes off the end of the structure =
and trash<br>
-=C2=A0 =C2=A0 =C2=A0* data on the struct.<br>
-=C2=A0 =C2=A0 =C2=A0* We can&#39;t use sizeof(uc-&gt;uc_sigmask) either, b=
ecause the libc<br>
-=C2=A0 =C2=A0 =C2=A0* headers define the struct field with the wrong (too =
large) type.<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* For synchronous signals, unwind the cpu state to the=
 faulting<br>
+=C2=A0 =C2=A0 =C2=A0* insn and then exit back to the main loop so that the=
 signal<br>
+=C2=A0 =C2=A0 =C2=A0* is delivered immediately.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 memset(&amp;uc-&gt;uc_sigmask, 0xff, SIGSET_T_SIZE);<br>
-=C2=A0 =C2=A0 sigdelset(&amp;uc-&gt;uc_sigmask, SIGSEGV);<br>
-=C2=A0 =C2=A0 sigdelset(&amp;uc-&gt;uc_sigmask, SIGBUS);<br>
+=C2=A0 =C2=A0 if (sync_sig) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_helper_retaddr();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_SETMASK, &amp;uc-&gt;uc_sigmas=
k, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;exception_index =3D EXCP_INTERRUPT;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_loop_exit_restore(cpu, pc);<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 /* interrupt the virtual CPU as soon as possible */<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Interrupt the virtual CPU as soon as possible, but f=
or now<br>
+=C2=A0 =C2=A0 =C2=A0* return to continue with the current TB.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0cpu_exit(thread_cpu);<br>
=C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000082967a05cc0b65ea--

