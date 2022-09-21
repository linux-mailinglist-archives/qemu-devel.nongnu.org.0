Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B1E5BFE01
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:34:42 +0200 (CEST)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oayw5-0004y8-Nj
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayYm-000882-EA
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayYj-0006Oo-6p
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663762230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WFEa5fPUhkgLE+KhlqIcLj+aJCLoHhZ7Hz95u/YeKGA=;
 b=Y0z1Uy0Q2QMOu9heyx08ruM8HvWodOFi5yIdI1qvlSRbjmdks+7x78AmH+YzUGFWM7B9IK
 P0gPYYLPPvlcdzWZsnglRXXoJqyBUW6C5C2zP083YffVYR8YhlMJIkgIVvrgO/vkXSK/Fa
 C07Kg2YKudcHLpQo/42YvTj1ZWA3tIA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-GPTOc5cxPE6TW8h1ngKWHA-1; Wed, 21 Sep 2022 08:10:29 -0400
X-MC-Unique: GPTOc5cxPE6TW8h1ngKWHA-1
Received: by mail-qt1-f200.google.com with SMTP id
 s21-20020a05622a1a9500b0035bb9e79172so4030650qtc.20
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=WFEa5fPUhkgLE+KhlqIcLj+aJCLoHhZ7Hz95u/YeKGA=;
 b=CB4A54lQPwGKyulsA8jR8Q/aoNhleWzuWrGlmZ4BZp8mOI7fQ1f+olAn0SFWssS//G
 1hY5AI9kb/M/jOO+f61eNi9BdEIsLkt6lxnrjhvngl6Tor7rC3b/I++UNv8/DH6QiFGY
 O0lvPJnANlYjK1BbdTCCMMxsocwm2TN9z8EUepf8ALLvt62+J1zn6HzkibLvsBG1QVb3
 lDjdtZZSzIKvk2BovCurmtuo4jIP+VXmN0HlCBMm9p1mUsoefbDqws6VYiSLMSYaI1jV
 K6M7Hhdlpj1hfPURFNiBdUsaK+Z26im9hi4e/yQkvOB8evneRJzhn51AVLW3JsuDOnrw
 3zpQ==
X-Gm-Message-State: ACrzQf2k/WqZCeDmzV7yM9vGF4pz4HlfCZ7tKn1B64MBxX5CeycUrlIa
 45asAuGWJLgyx0ihtcIc6pJWqUUlX3rlEC0JX1nolU5EEkRCjxG4S4Ue4fvsOGb63YBqdXPs1M4
 nmISR+XhYi2CoSEG1Yikwal5wHKhhfOo=
X-Received: by 2002:a05:620a:220f:b0:6ce:cead:f39e with SMTP id
 m15-20020a05620a220f00b006ceceadf39emr16724778qkh.233.1663762228803; 
 Wed, 21 Sep 2022 05:10:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7roeMmyvH7U0bEa/k4Ag3+zie/5YVWQg+FIPfUXIf31wCPjqBcQcNABBL3H++swQTUdH998B78Cb595GHwPA4=
X-Received: by 2002:a05:620a:220f:b0:6ce:cead:f39e with SMTP id
 m15-20020a05620a220f00b006ceceadf39emr16724755qkh.233.1663762228483; Wed, 21
 Sep 2022 05:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-11-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-11-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:10:17 +0200
Message-ID: <CABgObfa0bMLM3gxXAdnF71aErVaFcqbvTeT=p4ysrob_nDmPEg@mail.gmail.com>
Subject: Re: [PATCH v2 10/23] target/i386: USe DISAS_EOB_ONLY
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
> Replace lone calls to gen_eob() with the new enumerator.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>  target/i386/tcg/translate.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index a7e5bcdec7..5b77414a0a 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -6800,7 +6800,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              /* add stack offset */
>              gen_stack_update(s, val + (2 << dflag));
>          }
> -        gen_eob(s);
> +        s->base.is_jmp = DISAS_EOB_ONLY;
>          break;
>      case 0xcb: /* lret */
>          val = 0;
> @@ -6818,7 +6818,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                                        tcg_const_i32(s->pc - s->cs_base));
>          }
>          set_cc_op(s, CC_OP_EFLAGS);
> -        gen_eob(s);
> +        s->base.is_jmp = DISAS_EOB_ONLY;
>          break;
>      case 0xe8: /* call im */
>          {
> @@ -7404,7 +7404,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_set_label(l1);
>              gen_jmp_im(s, tval);
>              gen_set_label(l2);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_ONLY;
>          }
>          break;
>      case 0x130: /* wrmsr */
> @@ -7445,7 +7445,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_exception_gpf(s);
>          } else {
>              gen_helper_sysenter(cpu_env);
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_ONLY;
>          }
>          break;
>      case 0x135: /* sysexit */
> @@ -7456,7 +7456,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_exception_gpf(s);
>          } else {
>              gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
> -            gen_eob(s);
> +            s->base.is_jmp = DISAS_EOB_ONLY;
>          }
>          break;
>  #ifdef TARGET_X86_64
> @@ -8539,7 +8539,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          gen_update_eip_next(s);
>          gen_helper_rsm(cpu_env);
>  #endif /* CONFIG_USER_ONLY */
> -        gen_eob(s);
> +        s->base.is_jmp = DISAS_EOB_ONLY;
>          break;
>      case 0x1b8: /* SSE4.2 popcnt */
>          if ((prefixes & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
> --
> 2.34.1
>


