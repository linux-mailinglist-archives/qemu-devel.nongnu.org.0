Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A11A5BD419
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:51:47 +0200 (CEST)
Received: from localhost ([::1]:50178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKvq-0003dp-FL
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfX-0002j8-BF
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfU-0002pO-BK
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/SX3qWq+8DuAOgQQvwf1FZ+iI8Glqbbo5BvsgyusDJY=;
 b=A5YHRtsKc+/alNsfi5fU+TQtIqWdVV5Kj0WM2Lg+4l6D5YG8lWLjzyk1RTqYP9Z2o0GHhC
 PbvF/B17D6aRN7JEsSBd8yhS9L/Re/sANFvoSLLdXOZMFYXpRcvwMJO3rp+Tb0d4URjbmC
 TvHo5xMY8U6GzS85SEYNaQoY8GPlYog=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-0QDIsd-NNW-wSXJDurwLFw-1; Mon, 19 Sep 2022 13:34:46 -0400
X-MC-Unique: 0QDIsd-NNW-wSXJDurwLFw-1
Received: by mail-qk1-f198.google.com with SMTP id
 bk21-20020a05620a1a1500b006be9f844c59so24710091qkb.9
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=/SX3qWq+8DuAOgQQvwf1FZ+iI8Glqbbo5BvsgyusDJY=;
 b=zOylNHRhHWYboySBJkviYiaMMDlUxQSsOrf/MZg5XECoF4e0dulHgyTHmwjIX6TJ6O
 eTVUHGvVURwfxXSJD+TDVdbwelPDywujaKX3EQh05sbUF+Zqjirl7jviPBVs9Zzi7CJ1
 F70IXiB+Aa/jw7ywTfjggj+b/FIFOWKve+lL3m4bdBIzZcI3RRrNBKW+xOVYczJY+mwf
 atWbFndDNrCBbySM5HDkr3TUyl7Q4U91UPw9qzIVTOK2+SRr5BfBqZms4G72uddOS4SK
 nhdKd4Wsj3dUlXbzZzVlAGswJl0IUv5URcO64nQ58i9jVV3tWBcaafTQ1hC1dkias1kY
 03pA==
X-Gm-Message-State: ACrzQf3sApkXw8FP2MDHAjHZDP6ehQ1Fk8JP+dubyW2viyFtITrz4Al4
 TCflliNkiYFNDfiL6SU81yYeV7Q8A8Nlnj5VvuISHTCZCMVJlqSNiMIIWuW6iv81T3E25oZ2xRe
 QRy9Uw8ZV+oTbQN80WOpTuHDrgwRhJ1M=
X-Received: by 2002:a05:6214:20e2:b0:4ac:b9a6:17be with SMTP id
 2-20020a05621420e200b004acb9a617bemr15208873qvk.104.1663608885560; 
 Mon, 19 Sep 2022 10:34:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5d+4xpyNIiLkjvuSCSAiO4uvO4D5x0PQvtXbc+GHcVYwNd6MYAdJiK9D3uq2Dlc6J/or/2s6KupUsc2moMlXI=
X-Received: by 2002:a05:6214:20e2:b0:4ac:b9a6:17be with SMTP id
 2-20020a05621420e200b004acb9a617bemr15208854qvk.104.1663608885183; Mon, 19
 Sep 2022 10:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220830034816.57091-1-ricky@rzhou.org>
 <20220830034816.57091-2-ricky@rzhou.org>
 <CAFoVXjh2RA4MF0m2n0AxAgK=4HA9TRCmKiMNe2+MKbApS14gfg@mail.gmail.com>
In-Reply-To: <CAFoVXjh2RA4MF0m2n0AxAgK=4HA9TRCmKiMNe2+MKbApS14gfg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 19 Sep 2022 19:34:34 +0200
Message-ID: <CABgObfaUKxOK9i+tH8pwC6pUDD2TiousFmoMuxH7oSNS4Y3SyA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/i386: Raise #GP on unaligned m128 accesses
 when required.
To: Ricky Zhou <ricky@rzhou.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 eduardo@habkost.net
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I will merge this patch already, but with simpler code that doesn't
look at PREFIX_VEX. The changes to the helpers and the addition of the
aligned argument help with the new decoder as well, and I will build
on top of them in the next submission of the AVX patches.

Thanks!

Paolo

On Sat, Sep 17, 2022 at 4:15 AM Ricky Zhou <ricky@rzhou.org> wrote:
>
> Checking back on the status of patch, I noticed that there are some
> exciting patches out for AVX support that may conflict with this,
> though I see that they are still in the RFC phase:
> https://patchew.org/QEMU/20220911230418.340941-1-pbonzini@redhat.com/
>
> I'm not sure how far away AVX support is from being merged, but do let
> me know if there's any preference re applying this change vs. waiting
> to rebase on top the AVX support changes, etc.
>
> Thanks!
> Ricky
>
> On Mon, Aug 29, 2022 at 8:48 PM Ricky Zhou <ricky@rzhou.org> wrote:
> >
> > Many instructions which load/store 128-bit values are supposed to
> > raise #GP when the memory operand isn't 16-byte aligned. This includes:
> >  - Instructions explicitly requiring memory alignment (Exceptions Type 1
> >    in the "AVX and SSE Instruction Exception Specification" section of
> >    the SDM)
> >  - Legacy SSE instructions that load/store 128-bit values (Exceptions
> >    Types 2 and 4).
> >
> > This change sets MO_ALIGN_16 on 128-bit memory accesses that require
> > 16-byte alignment. It adds cpu_record_sigbus and cpu_do_unaligned_access
> > hooks that simulate a #GP exception in qemu-user and qemu-system,
> > respectively.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/217
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Ricky Zhou <ricky@rzhou.org>
> > ---
> >  target/i386/tcg/excp_helper.c        | 13 ++++++++
> >  target/i386/tcg/helper-tcg.h         | 28 ++++++++++-------
> >  target/i386/tcg/sysemu/excp_helper.c |  8 +++++
> >  target/i386/tcg/tcg-cpu.c            |  2 ++
> >  target/i386/tcg/translate.c          | 45 +++++++++++++++++-----------
> >  target/i386/tcg/user/excp_helper.c   |  7 +++++
> >  6 files changed, 74 insertions(+), 29 deletions(-)
> >
> > diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
> > index c1ffa1c0ef..7c3c8dc7fe 100644
> > --- a/target/i386/tcg/excp_helper.c
> > +++ b/target/i386/tcg/excp_helper.c
> > @@ -140,3 +140,16 @@ G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index,
> >  {
> >      raise_interrupt2(env, exception_index, 0, 0, 0, retaddr);
> >  }
> > +
> > +G_NORETURN void handle_unaligned_access(CPUX86State *env, vaddr vaddr,
> > +                                        MMUAccessType access_type,
> > +                                        uintptr_t retaddr)
> > +{
> > +    /*
> > +     * Unaligned accesses are currently only triggered by SSE/AVX
> > +     * instructions that impose alignment requirements on memory
> > +     * operands. These instructions raise #GP(0) upon accessing an
> > +     * unaligned address.
> > +     */
> > +    raise_exception_ra(env, EXCP0D_GPF, retaddr);
> > +}
> > diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
> > index 34167e2e29..cd1723389a 100644
> > --- a/target/i386/tcg/helper-tcg.h
> > +++ b/target/i386/tcg/helper-tcg.h
> > @@ -42,17 +42,6 @@ void x86_cpu_do_interrupt(CPUState *cpu);
> >  bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
> >  #endif
> >
> > -/* helper.c */
> > -#ifdef CONFIG_USER_ONLY
> > -void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
> > -                            MMUAccessType access_type,
> > -                            bool maperr, uintptr_t ra);
> > -#else
> > -bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > -                      MMUAccessType access_type, int mmu_idx,
> > -                      bool probe, uintptr_t retaddr);
> > -#endif
> > -
> >  void breakpoint_handler(CPUState *cs);
> >
> >  /* n must be a constant to be efficient */
> > @@ -78,6 +67,23 @@ G_NORETURN void raise_exception_err_ra(CPUX86State *env, int exception_index,
> >                                         int error_code, uintptr_t retaddr);
> >  G_NORETURN void raise_interrupt(CPUX86State *nenv, int intno, int is_int,
> >                                  int error_code, int next_eip_addend);
> > +G_NORETURN void handle_unaligned_access(CPUX86State *env, vaddr vaddr,
> > +                                        MMUAccessType access_type,
> > +                                        uintptr_t retaddr);
> > +#ifdef CONFIG_USER_ONLY
> > +void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
> > +                            MMUAccessType access_type,
> > +                            bool maperr, uintptr_t ra);
> > +void x86_cpu_record_sigbus(CPUState *cs, vaddr addr,
> > +                           MMUAccessType access_type, uintptr_t ra);
> > +#else
> > +bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > +                      MMUAccessType access_type, int mmu_idx,
> > +                      bool probe, uintptr_t retaddr);
> > +G_NORETURN void x86_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> > +                                            MMUAccessType access_type,
> > +                                            int mmu_idx, uintptr_t retaddr);
> > +#endif
> >
> >  /* cc_helper.c */
> >  extern const uint8_t parity_table[256];
> > diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
> > index 48feba7e75..796dc2a1f3 100644
> > --- a/target/i386/tcg/sysemu/excp_helper.c
> > +++ b/target/i386/tcg/sysemu/excp_helper.c
> > @@ -439,3 +439,11 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
> >      }
> >      return true;
> >  }
> > +
> > +G_NORETURN void x86_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> > +                                            MMUAccessType access_type,
> > +                                            int mmu_idx, uintptr_t retaddr)
> > +{
> > +    X86CPU *cpu = X86_CPU(cs);
> > +    handle_unaligned_access(&cpu->env, vaddr, access_type, retaddr);
> > +}
> > diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
> > index 6fdfdf9598..d3c2b8fb49 100644
> > --- a/target/i386/tcg/tcg-cpu.c
> > +++ b/target/i386/tcg/tcg-cpu.c
> > @@ -75,10 +75,12 @@ static const struct TCGCPUOps x86_tcg_ops = {
> >  #ifdef CONFIG_USER_ONLY
> >      .fake_user_interrupt = x86_cpu_do_interrupt,
> >      .record_sigsegv = x86_cpu_record_sigsegv,
> > +    .record_sigbus = x86_cpu_record_sigbus,
> >  #else
> >      .tlb_fill = x86_cpu_tlb_fill,
> >      .do_interrupt = x86_cpu_do_interrupt,
> >      .cpu_exec_interrupt = x86_cpu_exec_interrupt,
> > +    .do_unaligned_access = x86_cpu_do_unaligned_access,
> >      .debug_excp_handler = breakpoint_handler,
> >      .debug_check_breakpoint = x86_debug_check_breakpoint,
> >  #endif /* !CONFIG_USER_ONLY */
> > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > index 3ba5f76156..29104a49b9 100644
> > --- a/target/i386/tcg/translate.c
> > +++ b/target/i386/tcg/translate.c
> > @@ -2731,21 +2731,23 @@ static inline void gen_stq_env_A0(DisasContext *s, int offset)
> >      tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
> >  }
> >
> > -static inline void gen_ldo_env_A0(DisasContext *s, int offset)
> > +static inline void gen_ldo_env_A0(DisasContext *s, int offset, bool align)
> >  {
> >      int mem_index = s->mem_index;
> > -    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
> > +    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index,
> > +                        MO_LEUQ | (align ? MO_ALIGN_16 : 0));
> >      tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
> >      tcg_gen_addi_tl(s->tmp0, s->A0, 8);
> >      tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
> >      tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
> >  }
> >
> > -static inline void gen_sto_env_A0(DisasContext *s, int offset)
> > +static inline void gen_sto_env_A0(DisasContext *s, int offset, bool align)
> >  {
> >      int mem_index = s->mem_index;
> >      tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
> > -    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
> > +    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index,
> > +                        MO_LEUQ | (align ? MO_ALIGN_16 : 0));
> >      tcg_gen_addi_tl(s->tmp0, s->A0, 8);
> >      tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
> >      tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
> > @@ -3054,7 +3056,7 @@ static const struct SSEOpHelper_epp sse_op_table6[256] = {
> >      [0x25] = SSE41_OP(pmovsxdq),
> >      [0x28] = SSE41_OP(pmuldq),
> >      [0x29] = SSE41_OP(pcmpeqq),
> > -    [0x2a] = SSE41_SPECIAL, /* movntqda */
> > +    [0x2a] = SSE41_SPECIAL, /* movntdqa */
> >      [0x2b] = SSE41_OP(packusdw),
> >      [0x30] = SSE41_OP(pmovzxbw),
> >      [0x31] = SSE41_OP(pmovzxbd),
> > @@ -3194,17 +3196,17 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >              break;
> >          case 0x1e7: /* movntdq */
> >          case 0x02b: /* movntps */
> > -        case 0x12b: /* movntps */
> > +        case 0x12b: /* movntpd */
> >              if (mod == 3)
> >                  goto illegal_op;
> >              gen_lea_modrm(env, s, modrm);
> > -            gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
> > +            gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]), true);
> >              break;
> >          case 0x3f0: /* lddqu */
> >              if (mod == 3)
> >                  goto illegal_op;
> >              gen_lea_modrm(env, s, modrm);
> > -            gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
> > +            gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]), false);
> >              break;
> >          case 0x22b: /* movntss */
> >          case 0x32b: /* movntsd */
> > @@ -3273,7 +3275,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >          case 0x26f: /* movdqu xmm, ea */
> >              if (mod != 3) {
> >                  gen_lea_modrm(env, s, modrm);
> > -                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
> > +                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]),
> > +                               /* movaps, movapd, movdqa */
> > +                               b == 0x028 || b == 0x128 || b == 0x16f);
> >              } else {
> >                  rm = (modrm & 7) | REX_B(s);
> >                  gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
> > @@ -3331,7 +3335,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >          case 0x212: /* movsldup */
> >              if (mod != 3) {
> >                  gen_lea_modrm(env, s, modrm);
> > -                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
> > +                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]),
> > +                               !(s->prefix & PREFIX_VEX));
> >              } else {
> >                  rm = (modrm & 7) | REX_B(s);
> >                  gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
> > @@ -3373,7 +3378,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >          case 0x216: /* movshdup */
> >              if (mod != 3) {
> >                  gen_lea_modrm(env, s, modrm);
> > -                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
> > +                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]),
> > +                               !(s->prefix & PREFIX_VEX));
> >              } else {
> >                  rm = (modrm & 7) | REX_B(s);
> >                  gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
> > @@ -3465,7 +3471,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >          case 0x27f: /* movdqu ea, xmm */
> >              if (mod != 3) {
> >                  gen_lea_modrm(env, s, modrm);
> > -                gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
> > +                gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]),
> > +                               /* movaps, movapd, movdqa */
> > +                               b == 0x029 || b == 0x129 || b == 0x17f);
> >              } else {
> >                  rm = (modrm & 7) | REX_B(s);
> >                  gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
> > @@ -3622,7 +3630,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >                  gen_lea_modrm(env, s, modrm);
> >                  op2_offset = offsetof(CPUX86State,xmm_t0);
> >                  if (b1) {
> > -                    gen_ldo_env_A0(s, op2_offset);
> > +                    gen_ldo_env_A0(s, op2_offset, true);
> >                  } else {
> >                      gen_ldq_env_A0(s, op2_offset);
> >                  }
> > @@ -3810,11 +3818,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >                          tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
> >                                          offsetof(ZMMReg, ZMM_W(0)));
> >                          break;
> > -                    case 0x2a:            /* movntqda */
> > -                        gen_ldo_env_A0(s, op1_offset);
> > +                    case 0x2a:            /* movntdqa */
> > +                        gen_ldo_env_A0(s, op1_offset, true);
> >                          return;
> >                      default:
> > -                        gen_ldo_env_A0(s, op2_offset);
> > +                        gen_ldo_env_A0(s, op2_offset,
> > +                                       !(s->prefix & PREFIX_VEX));
> >                      }
> >                  }
> >              } else {
> > @@ -4355,7 +4364,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >                  } else {
> >                      op2_offset = offsetof(CPUX86State,xmm_t0);
> >                      gen_lea_modrm(env, s, modrm);
> > -                    gen_ldo_env_A0(s, op2_offset);
> > +                    gen_ldo_env_A0(s, op2_offset, !(s->prefix & PREFIX_VEX));
> >                  }
> >              } else {
> >                  op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
> > @@ -4473,7 +4482,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >                      break;
> >                  default:
> >                      /* 128 bit access */
> > -                    gen_ldo_env_A0(s, op2_offset);
> > +                    gen_ldo_env_A0(s, op2_offset, !(s->prefix & PREFIX_VEX));
> >                      break;
> >                  }
> >              } else {
> > diff --git a/target/i386/tcg/user/excp_helper.c b/target/i386/tcg/user/excp_helper.c
> > index cd507e2a1b..b3bdb7831a 100644
> > --- a/target/i386/tcg/user/excp_helper.c
> > +++ b/target/i386/tcg/user/excp_helper.c
> > @@ -48,3 +48,10 @@ void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
> >
> >      cpu_loop_exit_restore(cs, ra);
> >  }
> > +
> > +void x86_cpu_record_sigbus(CPUState *cs, vaddr addr,
> > +                           MMUAccessType access_type, uintptr_t ra)
> > +{
> > +    X86CPU *cpu = X86_CPU(cs);
> > +    handle_unaligned_access(&cpu->env, addr, access_type, ra);
> > +}
> > --
> > 2.37.2
> >
>


