Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76465BFF50
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:57:21 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0E3-0001ol-Ss
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazRU-0006IX-9W
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazRR-0001MZ-HS
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663765624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yatc2jFGpSAwT88qpHBqP0OIWfAkNKZMU345+WP3efg=;
 b=d+OejQrOZ5XSWx8JgdTt0VbATVCmupQ23PN8k70kabL/kyR1FjKZB6y+gEVqV1Yh8p3dUV
 ivMkSvFOJ3EQT3fWMicu6fQ8u+F951qGZRXbp5luNb4LfCQ/yZmOXOzrcMpMhpf0VuYUw+
 kqPR4tN6oZ9yh1GGd+mwa8G3VvIaXEM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-7CwME0ZNOF2GAUJnumcuwQ-1; Wed, 21 Sep 2022 09:06:58 -0400
X-MC-Unique: 7CwME0ZNOF2GAUJnumcuwQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 dw19-20020a0562140a1300b004a8eee124b4so4252762qvb.21
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yatc2jFGpSAwT88qpHBqP0OIWfAkNKZMU345+WP3efg=;
 b=6D8cpvnsidnWspu55b8SqS/jFEPmhMf8KqVEJyNG+y8b0ip48aJp0OUEauO63mGwG/
 fJN5S28wwuuh1NOLsL0aeKydR0HX4+OBJW/r6W+yIAQz2hwN7m/dBVajUOrSS7MVarlv
 bBWyi8yxusypw0xQ1hsn5Y34DsVtXtHNY4DWI/1rhaNaZnPSgP6jZIDuDehGbyMJh1Ks
 fVulie5gFCEzv1fLpZIN2Im7OMqvHTUBf+xSL+PT9hSZX7jLAZQ56rNSMyHwemeT/OLr
 2pUp5s2gwk38fV8/SW2jIs8Ph5EkU/yAgOtouXw8y4vVP2EL7GqfnL3jD3h/RkG4uRRH
 3cbQ==
X-Gm-Message-State: ACrzQf01/Qn5UKqy70j39oMa97ynMzWB94Ot06m13SU12m61FA4HKC9y
 LVzD7mefCGYSSyIxx8v/oh0nXHZv2vNdSRxFOT92fIj17M6R/uATaaCJQrKe8OXSybIYALrR/gW
 lGIg3Qy72FeMkuq9TTYPvVDWWeucMDZA=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr22754009qvb.17.1663765616645; 
 Wed, 21 Sep 2022 06:06:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/JiYxvvzKcNzfU9Xt9kTSgXf3cBhXPJQK8FBstO6XudPFQ1WeOeX6AscEau2JoolyvcesYYx1/5KmWKhTBW4=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr22753986qvb.17.1663765616347; Wed, 21
 Sep 2022 06:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-19-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-19-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 15:06:45 +0200
Message-ID: <CABgObfahdNGb2EGBffKnNp-5J0OAiMyToyp3SqqvDGgQy-kmRQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] target/i386: Use gen_jmp_rel for loop and jecxz
 insns
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
> With gen_jmp_rel, we may chain to the next tb
> instead of merely writing to eip and exiting.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

See comment on the previous patch.

Paolo

> ---
>  target/i386/tcg/translate.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 07c7764649..fdd17c3cf3 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -7355,24 +7355,18 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xe2: /* loop */
>      case 0xe3: /* jecxz */
>          {
> -            TCGLabel *l1, *l2, *l3;
> -
> -            tval = (int8_t)insn_get(env, s, MO_8);
> -            tval += s->pc - s->cs_base;
> -            if (dflag == MO_16) {
> -                tval &= 0xffff;
> -            }
> +            TCGLabel *l1, *l2;
> +            int diff = (int8_t)insn_get(env, s, MO_8);
>
>              l1 = gen_new_label();
>              l2 = gen_new_label();
> -            l3 = gen_new_label();
>              gen_update_cc_op(s);
>              b &= 3;
>              switch(b) {
>              case 0: /* loopnz */
>              case 1: /* loopz */
>                  gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
> -                gen_op_jz_ecx(s, s->aflag, l3);
> +                gen_op_jz_ecx(s, s->aflag, l2);
>                  gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
>                  break;
>              case 2: /* loop */
> @@ -7385,14 +7379,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                  break;
>              }
>
> -            gen_set_label(l3);
> -            gen_update_eip_next(s);
> -            tcg_gen_br(l2);
> +            gen_set_label(l2);
> +            gen_jmp_rel(s, MO_32, 0, 1);
>
>              gen_set_label(l1);
> -            gen_jmp_im(s, tval);
> -            gen_set_label(l2);
> -            s->base.is_jmp = DISAS_EOB_ONLY;
> +            gen_jmp_rel(s, dflag, diff, 0);
>          }
>          break;
>      case 0x130: /* wrmsr */
> --
> 2.34.1
>


