Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD665BFE34
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:48:07 +0200 (CEST)
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaz94-0007BZ-Dg
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayUd-00042f-BX
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayUX-0005V1-Ca
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663761970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=60jvopCl6b0Va7gDjXLeVng8euMTkSFDYi4HDjFwNUY=;
 b=H2H4SCMlv+Jn3GnYE6x6hHkPRQcQoJ3MhCenKG2zteg65fGFsMc0SPbpnqzQYrzSnwn6ps
 Kfe72M7gohAf0r4uG4tP6Pv5XT/n1Cqx3P2x2YGer3yj4WYAZgOc4NGJuoevbCtEX5n/6K
 hGMWr6aSEnx50dEPmANR6n2JJm7Kb5s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-z0Bq_qsvMDuao-Qixnq1UQ-1; Wed, 21 Sep 2022 08:06:09 -0400
X-MC-Unique: z0Bq_qsvMDuao-Qixnq1UQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 bl17-20020a05620a1a9100b006cdf19243acso4083681qkb.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=60jvopCl6b0Va7gDjXLeVng8euMTkSFDYi4HDjFwNUY=;
 b=01L0vMNryJLG/7V+CrMz1MEcIDp/hTcdjwqDH5oyWGseNRgUXJcSMBd7b043HaviVs
 A5tcnwp/k/vx9lmvCgNSAf/mGrTj/m6ZTpBEODEYEfgtJ+YmnNKaFGhYl93oQ29KC4/V
 WIF73j3Oivv5Nf54BWzaVUqMw2QoZRws+giDULuPX/4gzVTCJCG6+EAS/rtaBFRmYmPz
 NRS+OOUla7Otp366XN2JV8gkkk7mZMM8n3G0ZTxWcMG2hGOJbCGPKEBFY1jMa0WhcpXP
 MRPbQ7CTO82FJAQNBFfJhNRXJXdHDn+C5e+OHDJdymzX6PVhxwVDYax0LFHSNwm8McJ+
 qOCA==
X-Gm-Message-State: ACrzQf3hP451FF09bwW2/zmnOuu97v/dsjl7Fues3cehUt/Bf8kzwJ3b
 LKyks2jOiFjbnpQL8ShG3/cp0kxplzHwIC+u75yXAfz9tu7eOv4e4y4eUGRLYn1iWSBsRh/j8Gu
 hjG5KwmwXXZLxRux34hc7DrWf8YunMpU=
X-Received: by 2002:a05:620a:220f:b0:6ce:cead:f39e with SMTP id
 m15-20020a05620a220f00b006ceceadf39emr16707615qkh.233.1663761968951; 
 Wed, 21 Sep 2022 05:06:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Wnj0ukkz9iiaLo5H32c1focmsds7RnPC5Q066MVS4zY5WSkfzl++jFzT7G0gnuefyAmhr+JpK6+L/Jhz6+DA=
X-Received: by 2002:a05:620a:220f:b0:6ce:cead:f39e with SMTP id
 m15-20020a05620a220f00b006ceceadf39emr16707591qkh.233.1663761968594; Wed, 21
 Sep 2022 05:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-8-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-8-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:05:57 +0200
Message-ID: <CABgObfbNQgCnJ4b+auXOA-Dv52XOK6JO7Ex6YEACm85hzvLK5Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/23] target/i386: Introduce DISAS_EOB*
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
> Add a few DISAS_TARGET_* aliases to reduce the number of
> calls to gen_eob() and gen_eob_inhibit_irq().  So far,
> only update i386_tr_translate_insn for exiting the block
> because of single-step or previous inhibit irq.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


> ---
>  target/i386/tcg/translate.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 6084c85609..778ee4ed4c 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -132,6 +132,10 @@ typedef struct DisasContext {
>      TCGOp *prev_insn_end;
>  } DisasContext;
>
> +#define DISAS_EOB_ONLY         DISAS_TARGET_0
> +#define DISAS_EOB_NEXT         DISAS_TARGET_1
> +#define DISAS_EOB_INHIBIT_IRQ  DISAS_TARGET_2
> +
>  /* The environment in which user-only runs is constrained. */
>  #ifdef CONFIG_USER_ONLY
>  #define PE(S)     true
> @@ -8814,7 +8818,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>                   * the flag and abort the translation to give the irqs a
>                   * chance to happen.
>                   */
> -                dc->base.is_jmp = DISAS_TOO_MANY;
> +                dc->base.is_jmp = DISAS_EOB_NEXT;
>              } else if (!is_same_page(&dc->base, pc_next)) {
>                  dc->base.is_jmp = DISAS_TOO_MANY;
>              }
> @@ -8826,9 +8830,24 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>  {
>      DisasContext *dc = container_of(dcbase, DisasContext, base);
>
> -    if (dc->base.is_jmp == DISAS_TOO_MANY) {
> +    switch (dc->base.is_jmp) {
> +    case DISAS_NORETURN:
> +        break;
> +    case DISAS_TOO_MANY:
> +    case DISAS_EOB_NEXT:
> +        gen_update_cc_op(dc);
>          gen_update_eip_cur(dc);
> +        /* fall through */
> +    case DISAS_EOB_ONLY:
>          gen_eob(dc);
> +        break;
> +    case DISAS_EOB_INHIBIT_IRQ:
> +        gen_update_cc_op(dc);
> +        gen_update_eip_cur(dc);
> +        gen_eob_inhibit_irq(dc, true);
> +        break;
> +    default:
> +        g_assert_not_reached();
>      }
>  }
>
> --
> 2.34.1
>


