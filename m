Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005B5A32B0
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:36:05 +0200 (CEST)
Received: from localhost ([::1]:48818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRirs-0006sT-A8
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRiks-000840-GM
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:28:50 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRikm-0001Px-Kp
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:28:50 -0400
Received: by mail-pf1-x430.google.com with SMTP id 199so2862144pfz.2
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=2ms9XyQ+CgSzprcJQjh4Wzg8qQNJByG3BD8IHZZ298k=;
 b=p7Ze58GlePUffw+QvIAoO53rXsf0tTjmHxRzAFJHfMsXEitYs0SJz0dqbN9yszUu/Z
 f2LG++US34i63WNExMInZP1a+rxUZnTSp7GZRfZc5yBue40bur3MGaiIoSqXLk7x+QT0
 xy5qDITD0sHS8cpmYq//EUU5/NdHXi/pUJiylIrco/xJPT3Z3Flvq7OCf6fjqhXSAGjz
 gtjDA6Lxujlcz6bfA2PvteUKmYwVzBZHyyv4aPhZ8FqvqaD7aRD4XaD6wnLvtwGr+kme
 cszfKcWpi1ckw7wO8Pxjunj+lcnbAAYCOTTNsQSgAXGoUzzlrvHxpHj4xeS/+ecYmA3h
 jbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2ms9XyQ+CgSzprcJQjh4Wzg8qQNJByG3BD8IHZZ298k=;
 b=kqd9jpAevFwOdtP9b8kc46/d2YdbBCcrvqH8NafoHaaW/md+Rndcsx1p5qcSmh5tfs
 Nmx96+mn1ab64x0JeHN3vj5AnpaRTHKZfczVv6mR5GY40rnN+Ea8LVJJJkDHc6nulzUF
 Nd9yZSgDE6Z7AMTIpqMclNNaAjwdSlRqc7eelQ6u8LI0VuprVtG3b0JuYascUEe7eaqD
 DZyHQwqT2E0u9ikK5l1YH1JmU3ehCT4TELYc6v66xFPbBYyKrajdPeHCxFCAq/vth7n5
 Kv83DCGoQHF7uHoM77jGDmta1NV5AP3oABH5RXVRTUtXPaZC/XmSivYH2G+QYKMNVhgT
 oFjw==
X-Gm-Message-State: ACgBeo2CqUd8GyPuQH5bBBO8H81rglyoILH9Ruo1Y/9KHmG5cDibaZSN
 kM6lL9EaD+qX5Y+FilPiAEmn9w==
X-Google-Smtp-Source: AA6agR5ptqMWrSwHht3pRMPNqKiMoR6jKBsXpYptVZa8xOTF0vPBlZJQQroFJ3TvDXBCxSvlZBnbjg==
X-Received: by 2002:a65:6cca:0:b0:427:17e6:b32b with SMTP id
 g10-20020a656cca000000b0042717e6b32bmr4875954pgw.349.1661556522856; 
 Fri, 26 Aug 2022 16:28:42 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a17090aea0e00b001fbc0e9edafsm2211456pjy.56.2022.08.26.16.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 16:28:42 -0700 (PDT)
Message-ID: <aac62588-f745-905b-f806-4c19aa811f50@linaro.org>
Date: Fri, 26 Aug 2022 16:28:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/23] i386: isolate MMX code more
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220826231204.201395-1-pbonzini@redhat.com>
 <20220826231204.201395-9-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826231204.201395-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/26/22 16:11, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 52 +++++++++++++++++++++++--------------
>   1 file changed, 33 insertions(+), 19 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 849c40b685..f174b1d986 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -3888,6 +3888,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>                           gen_ldo_env_A0(s, op2_offset);
>                       }
>                   }
> +                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
> +                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
> +                if (!op6->op[b1]) {
> +                    goto illegal_op;
> +                }

Illegal check should be above code gen.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

