Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3C5BFDB4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:21:19 +0200 (CEST)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oayj7-0000tB-IW
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayTQ-0003hH-TX
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayTM-00054W-SA
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663761899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dFa5bknDj1aCY+4MEQ2ZYfXGU3tebeqPtIOPmptzTl4=;
 b=cA8dsyZkh8HKeLpmNE241m8wBLxEVpei5RbNAE0zwRpjFoqjjE/xW7k+p4Amt3jPCy2Iag
 6d+YgmbnZM4RfN3YWZz8qSabHsPpAuPUOnV7uzVZyp/xdxQ70qJh3fzvkpuDkWEbJTgXCI
 1+0/bGn10yUhQ4z7Qu3F4BSKlBejxWA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-n5ezZJjsNQupKmFznz8LxQ-1; Wed, 21 Sep 2022 08:04:57 -0400
X-MC-Unique: n5ezZJjsNQupKmFznz8LxQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 i10-20020ad45c6a000000b004a25d0fea96so4105324qvh.3
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=dFa5bknDj1aCY+4MEQ2ZYfXGU3tebeqPtIOPmptzTl4=;
 b=n7e/dZbhCUjMnGtmdMZr6L6/nyQCm+ignCywk3TbcG8FhxsdJzcr9VQ2iTBiNXsCsx
 vASFHpMHQkTxzqp2XQu6M9ytHKP6FJX7VyIM0Hu7D9C0dKvLHQa+/00Nd3/NPUz47DrS
 T1Di4gDjuGfN6bAvlJ2rvxqNlN+XBg0HcnKTSzOMyNKvq8XaNaTH7lT7KGIMeA5roagT
 WjOg/MMiCnbRV7LQ9lrNAdqNRJ8hDhPltA6pbZr9NP1qtXAtjFozauALNJ2yj5heN+ND
 ysWoRtk4AaJVsDMSaDJ+jbQyqjvcPG8oWMmHyINy2/AzuKJy6KTvkgiO+Y8azembMH9t
 VpAg==
X-Gm-Message-State: ACrzQf3IW/3NWZSnJ7NKpVqYoAUlDpDXxZ2HhVa1mpdS6lMhDX217TBk
 xOfJg/ncdeB9+XnP2hppDWnQb7muw09FWtlIqP/tgQBlU7sDW/e120nWj4J94QuZxuTbJkfgZPf
 BwgpWVsoolDrv9ajpjqHFqZ9YwgMBMas=
X-Received: by 2002:ac8:5901:0:b0:35c:cc99:ea6b with SMTP id
 1-20020ac85901000000b0035ccc99ea6bmr22336357qty.294.1663761896933; 
 Wed, 21 Sep 2022 05:04:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM61TDSdiGY/v/qrRlnuuLvU1yDmNGC4M7aGMhWetccrODizV8Xdv9AhFgDxjwPRXkC3Lw+U5z9Z+QQYNIjW5eQ=
X-Received: by 2002:ac8:5901:0:b0:35c:cc99:ea6b with SMTP id
 1-20020ac85901000000b0035ccc99ea6bmr22336327qty.294.1663761896582; Wed, 21
 Sep 2022 05:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-7-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-7-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:04:45 +0200
Message-ID: <CABgObfaidgTsuUaygrc5eSoG1gxzrWPx5v-4BX-Awu6RZQb1mw@mail.gmail.com>
Subject: Re: [PATCH v2 06/23] target/i386: Create gen_update_eip_next
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
> Sync EIP before exiting a translation block.
> Replace all gen_jmp_im that use s->pc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/translate.c | 45 ++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 20 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 83cb925571..6084c85609 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -521,6 +521,11 @@ static void gen_update_eip_cur(DisasContext *s)
>      gen_jmp_im(s, s->base.pc_next - s->cs_base);
>  }
>
> +static void gen_update_eip_next(DisasContext *s)
> +{
> +    gen_jmp_im(s, s->pc - s->cs_base);
> +}
> +
>  /* Compute SEG:REG into A0.  SEG is selected from the override segment
>     (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
>     indicate no override.  */
> @@ -5675,7 +5680,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          gen_pop_update(s, ot);
>          /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
>          if (s->base.is_jmp) {
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              if (reg == R_SS) {
>                  s->flags &= ~HF_TF_MASK;
>                  gen_eob_inhibit_irq(s, true);
> @@ -5690,7 +5695,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          gen_movl_seg_T0(s, (b >> 3) & 7);
>          gen_pop_update(s, ot);
>          if (s->base.is_jmp) {
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>          }
>          break;
> @@ -5741,7 +5746,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          gen_movl_seg_T0(s, reg);
>          /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
>          if (s->base.is_jmp) {
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              if (reg == R_SS) {
>                  s->flags &= ~HF_TF_MASK;
>                  gen_eob_inhibit_irq(s, true);
> @@ -5948,7 +5953,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          /* then put the data */
>          gen_op_mov_reg_v(s, ot, reg, s->T1);
>          if (s->base.is_jmp) {
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>          }
>          break;
> @@ -7004,7 +7009,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_pop_update(s, ot);
>              set_cc_op(s, CC_OP_EFLAGS);
>              /* abort translation because TF/AC flag may change */
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>          }
>          break;
> @@ -7340,7 +7345,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          if (check_iopl(s)) {
>              gen_helper_sti(cpu_env);
>              /* interruptions are enabled only the first insn after sti */
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob_inhibit_irq(s, true);
>          }
>          break;
> @@ -7416,7 +7421,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              }
>
>              gen_set_label(l3);
> -            gen_jmp_im(s, next_eip);
> +            gen_update_eip_next(s);
>              tcg_gen_br(l2);
>
>              gen_set_label(l1);
> @@ -7434,7 +7439,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  gen_helper_rdmsr(cpu_env);
>              } else {
>                  gen_helper_wrmsr(cpu_env);
> -                gen_jmp_im(s, s->pc - s->cs_base);
> +                gen_update_eip_next(s);
>                  gen_eob(s);
>              }
>          }
> @@ -7634,7 +7639,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_helper_clac(cpu_env);
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>              break;
>
> @@ -7644,7 +7649,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_helper_stac(cpu_env);
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>              break;
>
> @@ -7689,7 +7694,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
>              gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
>              /* End TB because translation flags may change.  */
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>              break;
>
> @@ -7751,7 +7756,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              }
>              gen_update_cc_op(s);
>              gen_helper_stgi(cpu_env);
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>              break;
>
> @@ -7790,7 +7795,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
>              }
>              gen_helper_flush_page(cpu_env, s->A0);
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>              break;
>
> @@ -7874,7 +7879,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
>              tcg_gen_or_tl(s->T0, s->T0, s->T1);
>              gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>              break;
>
> @@ -7885,7 +7890,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
>              gen_lea_modrm(env, s, modrm);
>              gen_helper_flush_page(cpu_env, s->A0);
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>              break;
>
> @@ -8285,7 +8290,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
>              gen_op_mov_v_reg(s, ot, s->T0, rm);
>              gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>          } else {
>              gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
> @@ -8320,7 +8325,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  gen_op_mov_v_reg(s, ot, s->T0, rm);
>                  tcg_gen_movi_i32(s->tmp2_i32, reg);
>                  gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
> -                gen_jmp_im(s, s->pc - s->cs_base);
> +                gen_update_eip_next(s);
>                  gen_eob(s);
>              } else {
>                  gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
> @@ -8335,7 +8340,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
>              gen_helper_clts(cpu_env);
>              /* abort block because static cpu state changed */
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>          }
>          break;
> @@ -8433,7 +8438,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              /* XRSTOR is how MPX is enabled, which changes how
>                 we translate.  Thus we need to end the TB.  */
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, s->pc - s->cs_base);
> +            gen_update_eip_next(s);
>              gen_eob(s);
>              break;
>
> @@ -8567,7 +8572,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          g_assert_not_reached();
>  #else
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, s->pc - s->cs_base);
> +        gen_update_eip_next(s);
>          gen_helper_rsm(cpu_env);
>  #endif /* CONFIG_USER_ONLY */
>          gen_eob(s);
> --
> 2.34.1
>


