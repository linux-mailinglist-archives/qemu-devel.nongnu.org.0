Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23959061B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:54:03 +0200 (CEST)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMCNe-0004D3-2F
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCEa-0000V1-J7
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:44:41 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCEZ-00054Y-3r
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:44:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id 24so1257418pgr.7
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=IH3iAXOWi7XpjwddJhaUE6hrPW5BB6SruKgK5JwOxnU=;
 b=MAw8u/5OqXJ3aEUf+x5DyB79S4Dkf7s/udVjeJdjEUrIhMiKuzANZXlzVpG8A/wsv3
 eeU6bnz6V8e8+PJvGSbGUB+5WsOkFk1P3NFPJRbAkKHnW0Z9jYS+Sm/WhUbfN05C+1za
 5xACitiMDZMbOqxPk212zQEvXU37BnRp8klIX5UWpj9PycZ0TKkHl5LvyLngfU3/X95a
 AYWm73Sn8mu3fwZtk62/ogSHfjF00DmJQaigACCh3d1FSRkzV5BmYiD5RcuZTZnayUaG
 isvN8M0gvq3zXzx5x10n+83frtyMWzmrJDUpQNagLi5meR1mMm05trKJHEEo8NBgiyx5
 M3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=IH3iAXOWi7XpjwddJhaUE6hrPW5BB6SruKgK5JwOxnU=;
 b=de7P9c+LFc452y/CS4n9FIG8WzWcGvqIw5/HceWrpDXxB1PBwKmI4QkDExp+DlGoAo
 CIB3++tmoYIhotBzVN6Csfl/mdD4XxK5iU8TRrYj+GKFBDt7jfrgecEPOz7yFwDbn4JT
 ii4LNIakv6n4Xx77xlIAAlhWu8SJnxX0Qpn6lbdAq1K91/m+MTKkm2z5AsLtqK6EEWqJ
 RoiVxAgrGU2W0WiQ5mxkxrLbT2ZTWrcX90uaa0HA5J2Vy1HbcMfPWArGFm0WTFRTx46j
 /vZ66+3d3c9BbNaiqz8TR1PYnl7hI9nC6kdmMvpNJsgBgzo8tRRw6PKEW9M/Zwl9SV0v
 T1uA==
X-Gm-Message-State: ACgBeo3jizfx7EBUY2raUTd4kSovR+ojL1DBLqrsCc/hV7dGu/0xZHQa
 kBCLlOtU0MsW7bHj5zBjbaqUMIVk4axZvw==
X-Google-Smtp-Source: AA6agR41FE+FJymX87UVuRMnuTzIkR9u/Mb7UJMG1ZJrom+kj8H0nrfgcl0CvZneJdHmmFQX+heigw==
X-Received: by 2002:a63:4d0e:0:b0:412:1877:9820 with SMTP id
 a14-20020a634d0e000000b0041218779820mr138056pgb.177.1660239877345; 
 Thu, 11 Aug 2022 10:44:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a17090a0c8100b001f3244768d4sm3934200pja.13.2022.08.11.10.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:44:36 -0700 (PDT)
Message-ID: <f5826249-1d8a-1910-002f-dbac5cd7b6ba@linaro.org>
Date: Thu, 11 Aug 2022 10:44:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/10] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
> +static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                           uint64_t value)
> +{
> +    /*
> +     * Some MDCR_EL3 bits affect whether PMU counters are running:

Typo el3.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> +     * if we are trying to change any of those then we must
> +     * bracket this update with PMU start/finish calls.
> +     */
> +    bool pmu_op = (env->cp15.mdcr_el2 ^ value) & MDCR_EL2_PMU_ENABLE_BITS;
> +
> +    if (pmu_op) {
> +        pmu_op_start(env);
> +    }
> +    env->cp15.mdcr_el2 = value;
> +    if (pmu_op) {
> +        pmu_op_finish(env);
> +    }
>   }
>   
>   static const ARMCPRegInfo v8_cp_reginfo[] = {
> @@ -7669,6 +7713,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>           ARMCPRegInfo mdcr_el2 = {
>               .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
>               .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
> +            .writefn = mdcr_el2_write,
>               .access = PL2_RW, .resetvalue = pmu_num_counters(env),
>               .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
>           };


