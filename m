Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8DB5BFF0D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:40:29 +0200 (CEST)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazxk-0007e7-OA
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazQm-0005xb-Ou
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:06:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazQg-0001HK-TM
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663765576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D5H3Vyam6Pe+xV6ekpuXEKvkwaB/KKZB0j85rFzFCxo=;
 b=jDYmSqLLw6M7hMxZvrivVYOdSUzM7D7kd68Xd5pRnOA96JooDb+Gj5QAcn4Dx/uzewA/UR
 73HSm5CsitnHR6xlV8f7RrgL9WaaYcyTAo9UoiByC//HGzbkKKjS87iTYfk3pXveQI5/Ms
 awFrCcWai5IN3MoM7Thg6wSLALn4iss=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-t-7OkJxpO62CyprcWnd-tw-1; Wed, 21 Sep 2022 09:06:15 -0400
X-MC-Unique: t-7OkJxpO62CyprcWnd-tw-1
Received: by mail-qk1-f198.google.com with SMTP id
 de16-20020a05620a371000b006ceb92bc740so4209919qkb.15
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=D5H3Vyam6Pe+xV6ekpuXEKvkwaB/KKZB0j85rFzFCxo=;
 b=GVf9h8t3G9kI0tBkJ1PSO/umdICtXEU/3jYFfTJy9bkVQR5VC3pmpUA9uoUYEuu93I
 MANxkrht7l0hOa41kV7yDbNpw77pXnaD6EGVn+3BEwzpTpqq5pmqXZXxJqAQCSgSWvzz
 blxjCHx0kbbYG9wKEu+CWaDANhG/1RQyQwFjdosHAB31ENa2xrmJIeBnr+0xLhaVsib2
 d3RviNz4Auniu9VvLIfb4p492hZIO/5iEDiG7rYhT+3cZQSImZJ8nVh3KdA4RYAza1O8
 byxWKLPblaalVjc4r9qslnEJ+uYhae48gCVPuT23uA+K6Pre3JYTCoQFtsS/tJdtdnk+
 Nt+g==
X-Gm-Message-State: ACrzQf2FY6e1/uaXY2tE0lx3qu4fFoiKHz8F0Tauz9YYB6GOsr/Vjm0z
 1julVXR+Jhvz8BndJZDXtsClQFEy5uHcd+kbSyStLwiND7ypDeqYvTcSfGl7HCyiKONLxImqxTc
 e/XErJds+kH+y6+4rCwYIeY6yDoaN7Po=
X-Received: by 2002:a05:622a:1a02:b0:35b:bb29:fb86 with SMTP id
 f2-20020a05622a1a0200b0035bbb29fb86mr23293094qtb.456.1663765574844; 
 Wed, 21 Sep 2022 06:06:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PRwV+xfqTwn78EjelNQnUXrrhJTxGG/Y/I6IETK5rQZ6J8oNdSuowfc7UvUE+MDbZO3WbLFa5uYhn5x8AsOY=
X-Received: by 2002:a05:622a:1a02:b0:35b:bb29:fb86 with SMTP id
 f2-20020a05622a1a0200b0035bbb29fb86mr23293058qtb.456.1663765574505; Wed, 21
 Sep 2022 06:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-18-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-18-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 15:06:03 +0200
Message-ID: <CABgObfaZ648tE9VNZ6Lis-m_oXBHApfMUE=K=7VAvjYray52gg@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] target/i386: Create gen_jmp_rel
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
> Create a common helper for pc-relative branches.
> The jmp jb insn was missing a mask for CODE32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

(Oops, my remark the previous patch should still have pointed to gen_jmp_tb).

In gen_jz_ecx_string, in the translation for LOOPNZ/LOOPZ/LOOP/JECXZ
and in i386_tr_tb_stop there is:

> -    gen_jmp_tb(s, s->pc - s->cs_base, 1);
> +    gen_jmp_rel(s, MO_32, 0, 1);

What happens if the instruction's last byte is at 0xffff? Wraparound
in the middle of an instruction is generally undefined, but I think it
should work if the instruction does not cross the 64K/4G limit (and on
real hardware, which obeys segment limits unlike TCG, said limit must
be 64K/4G of course).

In other words, why MO_32 and not "CODE32(s) ? MO_32 : MO_16"?
Likewise, if you change that you need to change gen_repz/gen_repz2
too.

Paolo


>      gen_set_label(l1);
>      return l2;
>  }
> @@ -2756,6 +2757,18 @@ static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
>      }
>  }
>
> +static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
> +{
> +    target_ulong dest = s->pc - s->cs_base + diff;
> +
> +    if (ot == MO_16) {
> +        dest &= 0xffff;
> +    } else if (!CODE64(s)) {
> +        dest &= 0xffffffff;
> +    }
> +    gen_jmp_tb(s, dest, tb_num);
> +}
> +
>  static void gen_jmp(DisasContext *s, target_ulong eip)
>  {
>      gen_jmp_tb(s, eip, 0);
> @@ -6816,20 +6829,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          break;
>      case 0xe8: /* call im */
>          {
> -            if (dflag != MO_16) {
> -                tval = (int32_t)insn_get(env, s, MO_32);
> -            } else {
> -                tval = (int16_t)insn_get(env, s, MO_16);
> -            }
> -            tval += s->pc - s->cs_base;
> -            if (dflag == MO_16) {
> -                tval &= 0xffff;
> -            } else if (!CODE64(s)) {
> -                tval &= 0xffffffff;
> -            }
> +            int diff = (dflag != MO_16
> +                        ? (int32_t)insn_get(env, s, MO_32)
> +                        : (int16_t)insn_get(env, s, MO_16));
>              gen_push_v(s, eip_next_tl(s));
>              gen_bnd_jmp(s);
> -            gen_jmp(s, tval);
> +            gen_jmp_rel(s, dflag, diff, 0);
>          }
>          break;
>      case 0x9a: /* lcall im */
> @@ -6847,19 +6852,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          goto do_lcall;
>      case 0xe9: /* jmp im */
> -        if (dflag != MO_16) {
> -            tval = (int32_t)insn_get(env, s, MO_32);
> -        } else {
> -            tval = (int16_t)insn_get(env, s, MO_16);
> +        {
> +            int diff = (dflag != MO_16
> +                        ? (int32_t)insn_get(env, s, MO_32)
> +                        : (int16_t)insn_get(env, s, MO_16));
> +            gen_bnd_jmp(s);
> +            gen_jmp_rel(s, dflag, diff, 0);
>          }
> -        tval += s->pc - s->cs_base;
> -        if (dflag == MO_16) {
> -            tval &= 0xffff;
> -        } else if (!CODE64(s)) {
> -            tval &= 0xffffffff;
> -        }
> -        gen_bnd_jmp(s);
> -        gen_jmp(s, tval);
>          break;
>      case 0xea: /* ljmp im */
>          {
> @@ -6876,12 +6875,10 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          goto do_ljmp;
>      case 0xeb: /* jmp Jb */
> -        tval = (int8_t)insn_get(env, s, MO_8);
> -        tval += s->pc - s->cs_base;
> -        if (dflag == MO_16) {
> -            tval &= 0xffff;
> +        {
> +            int diff = (int8_t)insn_get(env, s, MO_8);
> +            gen_jmp_rel(s, dflag, diff, 0);
>          }
> -        gen_jmp(s, tval);
>          break;
>      case 0x70 ... 0x7f: /* jcc Jb */
>          tval = (int8_t)insn_get(env, s, MO_8);
> --
> 2.34.1
>


