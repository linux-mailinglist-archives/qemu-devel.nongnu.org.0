Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954B159061C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:54:12 +0200 (CEST)
Received: from localhost ([::1]:48626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMCNn-0004XZ-CW
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCId-0005cO-8G
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:48:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCIb-0005jt-JC
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:48:50 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso5778717pjl.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=jx9oCDTsc/iexZ3ExeGfIzkt4Hx5PiKEHtW8x14+PYU=;
 b=lBE8yMNRB3XppVKs1oOEWC453panyeuMrJ7EqOjzbycP4E5afUC4n7P/y9+IZVITJs
 AiAm+dW/He9w+lNpTMjxBVU7N+zLirwJnN/cFaiiTYqmnBp2P1kId1OP3XeWb8icj8DJ
 hU0TH95aEMuH3HViZYhw/WUg/oxPRJQA+r0sxI4QtJWjkEY5eKb2jDzC35QCBhyjsIGI
 1Mi84gqxw5U1sa+Anx55HyKttVNYHcm36v4P39dZs/Ne8Yo+3FP8cFB9ovb0i+pl5+10
 8+J96lnNN0JVL7ZVdyGc0tS6+AIOodZfKIirpZ+SNwcGscIoHbFj85j6HytI6Fa8dAIx
 1R3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jx9oCDTsc/iexZ3ExeGfIzkt4Hx5PiKEHtW8x14+PYU=;
 b=qrUfeRWn55aRJhhCHFNXMXfgrFD+uGU3Es9+YHp3YIwraQE3Zo/51noMWDmLZCnxF7
 eLi7xMNhwZH8T4ZHg8uWzJMcC7v1y3UOxAwmot8BHJG9geQMlN1xBYXiTGtKUA26Bzvr
 55YKyC0gQw+rzMPZIqgZqACGQPWYgndJ6tLGGqJbaVNsgd9TaiMU2BmaFpkjJ4ZYjz6B
 jWrGHCYlgGEX7Z21NDKltR4iuKzJAI7BWz23o8bTIIRYTENzaSJ31muSUm92k36ZzX1L
 FvnCd23mRJbZBsBEA8WF4lg6TL5aCaxO9jIFXuGdO8dnEgg67lVvp5oDlxVyXkDurxyy
 Pitg==
X-Gm-Message-State: ACgBeo3kVhnllxt8foBbH93oM1VIc61plIrB6mttbVcnU/DMUPlayMoY
 0nPaamhaqTKGKFXArL8PFO1gMA==
X-Google-Smtp-Source: AA6agR5MNCD5KAOJrmonThjZJbywMd6aJ2pyfbYlTCpBJZ1H1TCw4R7xlqfA4rO+Wkl1vKiAAgOo8A==
X-Received: by 2002:a17:90b:4c4b:b0:1f7:11f:8e8e with SMTP id
 np11-20020a17090b4c4b00b001f7011f8e8emr9731794pjb.98.1660240127016; 
 Thu, 11 Aug 2022 10:48:47 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 x133-20020a62868b000000b0052ad49292f0sm4371176pfd.48.2022.08.11.10.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:48:46 -0700 (PDT)
Message-ID: <34861211-e1f0-31d0-9619-9b99953ff031@linaro.org>
Date: Thu, 11 Aug 2022 10:48:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/10] target/arm: Honour MDCR_EL2.HPMD in Secure EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 8/11/22 10:16, Peter Maydell wrote:
> The logic in pmu_counter_enabled() for handling the 'prohibit event
> counting' bits MDCR_EL2.HPMD and MDCR_EL3.SPME is written in a way
> that assumes that EL2 is never Secure.  This used to be true, but the
> architecture now permits Secure EL2, and QEMU can emulate this.
> 
> Refactor the prohibit logic so that we effectively OR together
> the various prohibit bits when they apply, rather than trying to
> construct an if-else ladder where any particular state of the CPU
> ends up in exactly one branch of the ladder.
> 
> This fixes the Secure EL2 case and also is a better structure for
> adding the PMUv8.5 bits MDCR_EL2.HCCD and MDCR_EL3.SCCD.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 41def52cf7b..434885d024a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1094,7 +1094,7 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
>   {
>       uint64_t filter;
>       bool e, p, u, nsk, nsu, nsh, m;
> -    bool enabled, prohibited, filtered;
> +    bool enabled, prohibited = false, filtered;
>       bool secure = arm_is_secure(env);
>       int el = arm_current_el(env);
>       uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
> @@ -1112,15 +1112,12 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
>       }
>       enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
>   
> -    if (!secure) {
> -        if (el == 2 && (counter < hpmn || counter == 31)) {
> -            prohibited = mdcr_el2 & MDCR_HPMD;
> -        } else {
> -            prohibited = false;
> -        }
> -    } else {
> -        prohibited = arm_feature(env, ARM_FEATURE_EL3) &&
> -           !(env->cp15.mdcr_el3 & MDCR_SPME);
> +    /* Is event counting prohibited? */
> +    if (el == 2 && (counter < hpmn || counter == 31)) {
> +        prohibited = mdcr_el2 & MDCR_HPMD;
> +    }
> +    if (secure) {
> +        prohibited = prohibited || !(env->cp15.mdcr_el3 & MDCR_SPME);

You can use |= for bool as well.  You don't need the short-circuting of || here.
For consistency, perhaps better to use |= with the first if as well, relying on the 
compiler to fold the initial value false.

But otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

