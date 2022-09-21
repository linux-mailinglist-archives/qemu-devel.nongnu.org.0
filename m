Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912CE5BFE33
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:48:04 +0200 (CEST)
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaz91-00076C-L0
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayoN-0004iX-Lr
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayoK-0001Q4-05
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663763199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mIBxx8KirSODqO/Qb8gw5Yw7JDuWDdck0WV0GBcqTr4=;
 b=ZOxSq2H7b6MGWA77sOTnJ7/Zgbkn4sqoCmq2EssZIix9zEdJGqfkXPjEycN9k2XHGxeEW+
 3LOnriLbmOaDwmqE+6c3x4JI9WsIZv7jDw3SuSCvPCM4mnMzX5q2Geji9Lx3AHBoIW25Dm
 loyTGbnJ707pRGXNS7FmOVte6MiTfS0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-4pIKJ6RVMsCZEPVvwATkPw-1; Wed, 21 Sep 2022 08:26:38 -0400
X-MC-Unique: 4pIKJ6RVMsCZEPVvwATkPw-1
Received: by mail-qv1-f72.google.com with SMTP id
 nl18-20020a056214369200b004ac52c4b0a4so4161575qvb.13
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mIBxx8KirSODqO/Qb8gw5Yw7JDuWDdck0WV0GBcqTr4=;
 b=pnVkcD8OTT7MXQPHG+MXLbFENbLI0cUpep8KllLsUCeZxLYu0Z5e1r7Pk9vOanUcAg
 nKbiMTKTqHYRGwQKs2TvqrgNrG+v4YPGBXRYFotVymSNN+R2kXoDVSv4BJ+Tb0OXNRiM
 /lACP+/5Lf1DedZ+8A6Mwa2H2jAhbSjzjbV10yzjHLMoefaec0fFGr/8Fzc3KtUj3qbB
 SDkGNvVCgC9srcMFnoNISH0tbc9NbmPS4TQclbVnA71aUTyNEo7FaB9SV1TYGEO5V6Dw
 Gt4PYLu6FYs7lp/hMpkbxMVr3x4n4nAKf0tiqbZl4dn85vUp0Aq4fmhL+k3VmhPXsJHI
 rHWA==
X-Gm-Message-State: ACrzQf0yBEqYcCSHJEefgbWrmKV61fP4sTV3YlQ010h7RqHzaFVXeJDg
 /LhChuTx+6L/vOtxllWJgBfHt3pxMgx2VoE5yS7izUkXITY+9h0nxumJe70SOyhdJfQR7/7m+Mw
 4/xC/jHdp8nvglEuihCctKzHi4I50f1Y=
X-Received: by 2002:a05:622a:138c:b0:35c:e9d2:8d76 with SMTP id
 o12-20020a05622a138c00b0035ce9d28d76mr12205131qtk.463.1663763197479; 
 Wed, 21 Sep 2022 05:26:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4sT3WWJc0Ud3RL5cfFQoDdfHdMqkep+Vq6KpE+ZGRUV0a+ZYDDvB0cFQzeXFgfxoCdEREnhBkpkEFi9uWo54A=
X-Received: by 2002:a05:622a:138c:b0:35c:e9d2:8d76 with SMTP id
 o12-20020a05622a138c00b0035ce9d28d76mr12205109qtk.463.1663763197143; Wed, 21
 Sep 2022 05:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-13-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-13-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:26:25 +0200
Message-ID: <CABgObfYNLyzTT5t53tMhpHms9ri_pGDQqsfvksfzx_XL0zGM6Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/23] target/i386: Remove cur_eip, next_eip arguments
 to gen_repz*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
> All callers pass s->base.pc_next and s->pc, which we can just
> as well compute within the functions.  Pull out common helpers
> and reduce the amount of code under macros.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


> ---
>  target/i386/tcg/translate.c | 116 ++++++++++++++++++------------------
>  1 file changed, 57 insertions(+), 59 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 393a1c1075..f3c26a9956 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -736,7 +736,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
>  #endif
>  }
>
> -static inline void gen_movs(DisasContext *s, MemOp ot)
> +static void gen_movs(DisasContext *s, MemOp ot)
>  {
>      gen_string_movl_A0_ESI(s);
>      gen_op_ld_v(s, ot, s->T0, s->A0);
> @@ -1156,18 +1156,18 @@ static inline void gen_jcc1(DisasContext *s, int b, TCGLabel *l1)
>
>  /* XXX: does not work with gdbstub "ice" single step - not a
>     serious problem */
> -static TCGLabel *gen_jz_ecx_string(DisasContext *s, target_ulong next_eip)
> +static TCGLabel *gen_jz_ecx_string(DisasContext *s)
>  {
>      TCGLabel *l1 = gen_new_label();
>      TCGLabel *l2 = gen_new_label();
>      gen_op_jnz_ecx(s, s->aflag, l1);
>      gen_set_label(l2);
> -    gen_jmp_tb(s, next_eip, 1);
> +    gen_jmp_tb(s, s->pc - s->cs_base, 1);
>      gen_set_label(l1);
>      return l2;
>  }
>
> -static inline void gen_stos(DisasContext *s, MemOp ot)
> +static void gen_stos(DisasContext *s, MemOp ot)
>  {
>      gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
>      gen_string_movl_A0_EDI(s);
> @@ -1176,7 +1176,7 @@ static inline void gen_stos(DisasContext *s, MemOp ot)
>      gen_op_add_reg_T0(s, s->aflag, R_EDI);
>  }
>
> -static inline void gen_lods(DisasContext *s, MemOp ot)
> +static void gen_lods(DisasContext *s, MemOp ot)
>  {
>      gen_string_movl_A0_ESI(s);
>      gen_op_ld_v(s, ot, s->T0, s->A0);
> @@ -1185,7 +1185,7 @@ static inline void gen_lods(DisasContext *s, MemOp ot)
>      gen_op_add_reg_T0(s, s->aflag, R_ESI);
>  }
>
> -static inline void gen_scas(DisasContext *s, MemOp ot)
> +static void gen_scas(DisasContext *s, MemOp ot)
>  {
>      gen_string_movl_A0_EDI(s);
>      gen_op_ld_v(s, ot, s->T1, s->A0);
> @@ -1194,7 +1194,7 @@ static inline void gen_scas(DisasContext *s, MemOp ot)
>      gen_op_add_reg_T0(s, s->aflag, R_EDI);
>  }
>
> -static inline void gen_cmps(DisasContext *s, MemOp ot)
> +static void gen_cmps(DisasContext *s, MemOp ot)
>  {
>      gen_string_movl_A0_EDI(s);
>      gen_op_ld_v(s, ot, s->T1, s->A0);
> @@ -1222,7 +1222,7 @@ static void gen_bpt_io(DisasContext *s, TCGv_i32 t_port, int ot)
>      }
>  }
>
> -static inline void gen_ins(DisasContext *s, MemOp ot)
> +static void gen_ins(DisasContext *s, MemOp ot)
>  {
>      gen_string_movl_A0_EDI(s);
>      /* Note: we must do this dummy write first to be restartable in
> @@ -1238,7 +1238,7 @@ static inline void gen_ins(DisasContext *s, MemOp ot)
>      gen_bpt_io(s, s->tmp2_i32, ot);
>  }
>
> -static inline void gen_outs(DisasContext *s, MemOp ot)
> +static void gen_outs(DisasContext *s, MemOp ot)
>  {
>      gen_string_movl_A0_ESI(s);
>      gen_op_ld_v(s, ot, s->T0, s->A0);
> @@ -1252,42 +1252,49 @@ static inline void gen_outs(DisasContext *s, MemOp ot)
>      gen_bpt_io(s, s->tmp2_i32, ot);
>  }
>
> -/* same method as Valgrind : we generate jumps to current or next
> -   instruction */
> -#define GEN_REPZ(op)                                                          \
> -static inline void gen_repz_ ## op(DisasContext *s, MemOp ot,              \
> -                                 target_ulong cur_eip, target_ulong next_eip) \
> -{                                                                             \
> -    TCGLabel *l2;                                                             \
> -    gen_update_cc_op(s);                                                      \
> -    l2 = gen_jz_ecx_string(s, next_eip);                                      \
> -    gen_ ## op(s, ot);                                                        \
> -    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);                                \
> -    /* a loop would cause two single step exceptions if ECX = 1               \
> -       before rep string_insn */                                              \
> -    if (s->repz_opt)                                                          \
> -        gen_op_jz_ecx(s, s->aflag, l2);                                       \
> -    gen_jmp(s, cur_eip);                                                      \
> +/* Generate jumps to current or next instruction */
> +static void gen_repz(DisasContext *s, MemOp ot,
> +                     void (*fn)(DisasContext *s, MemOp ot))
> +{
> +    TCGLabel *l2;
> +    gen_update_cc_op(s);
> +    l2 = gen_jz_ecx_string(s);
> +    fn(s, ot);
> +    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
> +    /*
> +     * A loop would cause two single step exceptions if ECX = 1
> +     * before rep string_insn
> +     */
> +    if (s->repz_opt) {
> +        gen_op_jz_ecx(s, s->aflag, l2);
> +    }
> +    gen_jmp(s, s->base.pc_next - s->cs_base);
>  }
>
> -#define GEN_REPZ2(op)                                                         \
> -static inline void gen_repz_ ## op(DisasContext *s, MemOp ot,              \
> -                                   target_ulong cur_eip,                      \
> -                                   target_ulong next_eip,                     \
> -                                   int nz)                                    \
> -{                                                                             \
> -    TCGLabel *l2;                                                             \
> -    gen_update_cc_op(s);                                                      \
> -    l2 = gen_jz_ecx_string(s, next_eip);                                      \
> -    gen_ ## op(s, ot);                                                        \
> -    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);                                \
> -    gen_update_cc_op(s);                                                      \
> -    gen_jcc1(s, (JCC_Z << 1) | (nz ^ 1), l2);                                 \
> -    if (s->repz_opt)                                                          \
> -        gen_op_jz_ecx(s, s->aflag, l2);                                       \
> -    gen_jmp(s, cur_eip);                                                      \
> +#define GEN_REPZ(op) \
> +    static inline void gen_repz_ ## op(DisasContext *s, MemOp ot) \
> +    { gen_repz(s, ot, gen_##op); }
> +
> +static void gen_repz2(DisasContext *s, MemOp ot, int nz,
> +                      void (*fn)(DisasContext *s, MemOp ot))
> +{
> +    TCGLabel *l2;
> +    gen_update_cc_op(s);
> +    l2 = gen_jz_ecx_string(s);
> +    fn(s, ot);
> +    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
> +    gen_update_cc_op(s);
> +    gen_jcc1(s, (JCC_Z << 1) | (nz ^ 1), l2);
> +    if (s->repz_opt) {
> +        gen_op_jz_ecx(s, s->aflag, l2);
> +    }
> +    gen_jmp(s, s->base.pc_next - s->cs_base);
>  }
>
> +#define GEN_REPZ2(op) \
> +    static inline void gen_repz_ ## op(DisasContext *s, MemOp ot, int nz) \
> +    { gen_repz2(s, ot, nz, gen_##op); }
> +
>  GEN_REPZ(movs)
>  GEN_REPZ(stos)
>  GEN_REPZ(lods)
> @@ -6588,8 +6595,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xa5:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_movs(s, ot, s->base.pc_next - s->cs_base,
> -                          s->pc - s->cs_base);
> +            gen_repz_movs(s, ot);
>          } else {
>              gen_movs(s, ot);
>          }
> @@ -6599,8 +6605,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xab:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_stos(s, ot, s->base.pc_next - s->cs_base,
> -                          s->pc - s->cs_base);
> +            gen_repz_stos(s, ot);
>          } else {
>              gen_stos(s, ot);
>          }
> @@ -6609,8 +6614,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xad:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_lods(s, ot, s->base.pc_next - s->cs_base,
> -                          s->pc - s->cs_base);
> +            gen_repz_lods(s, ot);
>          } else {
>              gen_lods(s, ot);
>          }
> @@ -6619,11 +6623,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xaf:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & PREFIX_REPNZ) {
> -            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
> -                          s->pc - s->cs_base, 1);
> +            gen_repz_scas(s, ot, 1);
>          } else if (prefixes & PREFIX_REPZ) {
> -            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
> -                          s->pc - s->cs_base, 0);
> +            gen_repz_scas(s, ot, 0);
>          } else {
>              gen_scas(s, ot);
>          }
> @@ -6633,11 +6635,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xa7:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & PREFIX_REPNZ) {
> -            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
> -                          s->pc - s->cs_base, 1);
> +            gen_repz_cmps(s, ot, 1);
>          } else if (prefixes & PREFIX_REPZ) {
> -            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
> -                          s->pc - s->cs_base, 0);
> +            gen_repz_cmps(s, ot, 0);
>          } else {
>              gen_cmps(s, ot);
>          }
> @@ -6655,8 +6655,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_io_start();
>          }
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_ins(s, ot, s->base.pc_next - s->cs_base,
> -                         s->pc - s->cs_base);
> +            gen_repz_ins(s, ot);
>              /* jump generated by gen_repz_ins */
>          } else {
>              gen_ins(s, ot);
> @@ -6677,8 +6676,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_io_start();
>          }
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_outs(s, ot, s->base.pc_next - s->cs_base,
> -                          s->pc - s->cs_base);
> +            gen_repz_outs(s, ot);
>              /* jump generated by gen_repz_outs */
>          } else {
>              gen_outs(s, ot);
> --
> 2.34.1
>


