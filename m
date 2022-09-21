Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B75BFE16
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:39:41 +0200 (CEST)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaz0t-0007wJ-3S
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayNW-0000UY-CE
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayNR-0003nZ-Ca
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663761532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tnWrqxJFfDGAlMWYaFkvGz4xvq2SMvFLlr1n0uJ9LvU=;
 b=cDr3GmW+ob9ckygc1dNbb20j4qSJNGl+DT6QFx670OnDnmajRXg5mUKabcpvTT43VLn7Or
 l5Gxf0C/JQ4YKrCeRDmdOnKrcvm/8k/bgjT2Fd4zs1x4NmO5nT6U2lbp7+DfoI/+YUXxED
 qtyry+hio4js/E5/LXl14JYJypEjjOw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-335-gV9YCc7kOS-v14PIxFtcrg-1; Wed, 21 Sep 2022 07:58:43 -0400
X-MC-Unique: gV9YCc7kOS-v14PIxFtcrg-1
Received: by mail-qk1-f197.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so4048693qko.18
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 04:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tnWrqxJFfDGAlMWYaFkvGz4xvq2SMvFLlr1n0uJ9LvU=;
 b=WBnki0uM2srOJu/j9k39GiL6eGc/sk6WzQy0bPLXau9EKwWQBJiy9K0LtG1+qXGzBu
 yr+IZSblhaOT4dRgYTlByuhT6981H+FxeimslukwIzVgJJurGRK6agltngwdMT9P86zn
 3L0DXAOo7nyy4xp5m4kz84o3ltEgkKUs1BcAwjA9UKml4RGhSbMUOf0X3CmjBqEyADGa
 nvAgt6crih0dEKQkDg/7ZcnuMpHWB8a28eOrHz/m4eEYNRKHixuWRt2Zo1baoh8avAkv
 aacSigfv9Ws28fX007u2Wc7xU6yaEYPozJf/Nv2VDjUThXTrz+zKIRP/3V368MgR0prD
 OXBQ==
X-Gm-Message-State: ACrzQf2rCj83NfxLq8fYeVMq9oTCJM9ccTqWIeP9+fa+hV1r27AgmzGk
 Htjzbbflxpq1S3Stu4C0V7HOJQ28L2fSpWPkZ906AMMxXxHbREphrqGvJ6grFh+9Grv9kQpDjWQ
 RL2f7jURMSzpRypR2fkAaphuKWfu60bs=
X-Received: by 2002:a0c:a90a:0:b0:4ad:715:897 with SMTP id
 y10-20020a0ca90a000000b004ad07150897mr22685401qva.114.1663761522840; 
 Wed, 21 Sep 2022 04:58:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7B89EeWnlB7HXyh/7G7syKp9pk7YsETbBiq41BrSnHJCVF61Mswz6IgXxS6lOH5OnqcqjM3KeRDdEueYDzdgU=
X-Received: by 2002:a0c:a90a:0:b0:4ad:715:897 with SMTP id
 y10-20020a0ca90a000000b004ad07150897mr22685377qva.114.1663761522410; 
 Wed, 21 Sep 2022 04:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-6-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-6-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 13:58:31 +0200
Message-ID: <CABgObfZxN7mk6nr_yNt5-xbX6FvJjcNpdD-tXi8Vrew4+Qb1_Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/23] target/i386: Create gen_update_eip_cur
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
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

On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Like gen_update_cc_op, sync EIP before doing something
> that could raise an exception.  Replace all gen_jmp_im
> that use s->base.pc_next.

The commit message seems a bit off (it sounds like adding
stuff rather than refactoring), but anyway:

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> ---
>  target/i386/tcg/translate.c | 52 ++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 24 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 0210382f77..83cb925571 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -511,10 +511,14 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
>      }
>  }
>
> -static inline void gen_jmp_im(DisasContext *s, target_ulong pc)
> +static void gen_jmp_im(DisasContext *s, target_ulong pc)
>  {
> -    tcg_gen_movi_tl(s->tmp0, pc);
> -    gen_op_jmp_v(s->tmp0);
> +    gen_op_jmp_v(tcg_constant_tl(pc));
> +}
> +
> +static void gen_update_eip_cur(DisasContext *s)
> +{
> +    gen_jmp_im(s, s->base.pc_next - s->cs_base);
>  }
>
>  /* Compute SEG:REG into A0.  SEG is selected from the override segment
> @@ -703,7 +707,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
>          target_ulong next_eip = s->pc - s->cs_base;
>
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, cur_eip);
> +        gen_update_eip_cur(s);
>          if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
>              svm_flags |= SVM_IOIO_REP_MASK;
>          }
> @@ -1335,7 +1339,7 @@ static void gen_helper_fp_arith_STN_ST0(int op, int opreg)
>  static void gen_exception(DisasContext *s, int trapno)
>  {
>      gen_update_cc_op(s);
> -    gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +    gen_update_eip_cur(s);
>      gen_helper_raise_exception(cpu_env, tcg_const_i32(trapno));
>      s->base.is_jmp = DISAS_NORETURN;
>  }
> @@ -2605,7 +2609,7 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
>  static void gen_interrupt(DisasContext *s, int intno)
>  {
>      gen_update_cc_op(s);
> -    gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +    gen_update_eip_cur(s);
>      gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
>                                 tcg_constant_i32(s->pc - s->base.pc_next));
>      s->base.is_jmp = DISAS_NORETURN;
> @@ -6796,7 +6800,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      do_lret:
>          if (PE(s) && !VM86(s)) {
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
>                                        tcg_const_i32(val));
>          } else {
> @@ -7292,7 +7296,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          if (prefixes & PREFIX_REPZ) {
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>              s->base.is_jmp = DISAS_NORETURN;
>          }
> @@ -7318,7 +7322,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          if (CODE64(s))
>              goto illegal_op;
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +        gen_update_eip_cur(s);
>          gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>          break;
>  #ifdef WANT_ICEBP
> @@ -7425,7 +7429,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      case 0x132: /* rdmsr */
>          if (check_cpl0(s)) {
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              if (b & 2) {
>                  gen_helper_rdmsr(cpu_env);
>              } else {
> @@ -7437,7 +7441,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          break;
>      case 0x131: /* rdtsc */
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +        gen_update_eip_cur(s);
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
>          }
> @@ -7448,7 +7452,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          break;
>      case 0x133: /* rdpmc */
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +        gen_update_eip_cur(s);
>          gen_helper_rdpmc(cpu_env);
>          s->base.is_jmp = DISAS_NORETURN;
>          break;
> @@ -7478,7 +7482,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      case 0x105: /* syscall */
>          /* XXX: is it usable in real mode ? */
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +        gen_update_eip_cur(s);
>          gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>          /* TF handling for the syscall insn is different. The TF bit is  checked
>             after the syscall insn completes. This allows #DB to not be
> @@ -7504,13 +7508,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>  #endif
>      case 0x1a2: /* cpuid */
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +        gen_update_eip_cur(s);
>          gen_helper_cpuid(cpu_env);
>          break;
>      case 0xf4: /* hlt */
>          if (check_cpl0(s)) {
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>              s->base.is_jmp = DISAS_NORETURN;
>          }
> @@ -7607,7 +7611,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
>              gen_extu(s->aflag, s->A0);
>              gen_add_A0_ds_seg(s);
> @@ -7619,7 +7623,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>              s->base.is_jmp = DISAS_NORETURN;
>              break;
> @@ -7697,7 +7701,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  break;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
>                               tcg_const_i32(s->pc - s->base.pc_next));
>              tcg_gen_exit_tb(NULL, 0);
> @@ -7709,7 +7713,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              gen_helper_vmmcall(cpu_env);
>              break;
>
> @@ -7721,7 +7725,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  break;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
>              break;
>
> @@ -7733,7 +7737,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  break;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
>              break;
>
> @@ -7759,7 +7763,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  break;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              gen_helper_clgi(cpu_env);
>              break;
>
> @@ -7905,7 +7909,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_update_eip_cur(s);
>              if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>                  gen_io_start();
>              }
> @@ -8818,7 +8822,7 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>      DisasContext *dc = container_of(dcbase, DisasContext, base);
>
>      if (dc->base.is_jmp == DISAS_TOO_MANY) {
> -        gen_jmp_im(dc, dc->base.pc_next - dc->cs_base);
> +        gen_update_eip_cur(dc);
>          gen_eob(dc);
>      }
>  }
> --
> 2.34.1
>


