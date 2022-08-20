Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8173B59AFCB
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 20:57:36 +0200 (CEST)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPTf5-0006Vo-5a
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 14:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPTc8-0004a8-Ax
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 14:54:32 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPTc6-0005aD-HY
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 14:54:31 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso7721761pjj.4
 for <qemu-devel@nongnu.org>; Sat, 20 Aug 2022 11:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=G6dAGS7Qc5evuaih74E2xjnS7x2zu7CMlqmYXADJbQ4=;
 b=KxCCodz3MfRSwmvpHgAvMkdU8OFW1Pr22pyk+RBlyVFtJQAtzqLWoWc791UepjBxeh
 ol5W/pTAkLvrs2oir9nkDZBuKH1jYdsoy6o2IpJxT3YwC2bTQrPDZQOe4OBKbFPtSzr+
 M5n/u77KpzaTeEWEG4xodz6P2NtKQWMfA5WwE/ZZrJCTqWKwBiSAGo4rE5rB+7JiK2S5
 G1vo82dvhtIB4lT0TzwcjCy1ur4n0oTXytqX8PmupcldBPJjNlgUOe7Lyl/OQ/hOcFPm
 fzGOyXuWg6za29YRty3cU9EcTIAv0gjgw+BZPPJ7WuhWC2+b1RV9vlGIWuEYE02os/ha
 cR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=G6dAGS7Qc5evuaih74E2xjnS7x2zu7CMlqmYXADJbQ4=;
 b=MYL5kDQPjG/wJW7pf4YUVd2cQtmQTMxjJab+kTwtXQhkEOcQKz7hnwKx4mIpiOj/Pc
 G13wLevxYZ6eqvfpA0q/eLuVOtuDoHxFBBuUR02eLdqmKljcZuesZ+4hdzD3DWnXyW3h
 y3T6N98SpnsO5tv/5euocSTyKNMNRGMqIAPPX3/gP0pHPjv5kJPHki7Y6mobgDDMGElZ
 07vJ2z1nu1e/XIOQVvRVWMWaI+6PzX42j0ANeC6enEt0WiTqwaANE1GGEFPdqHiYWaOH
 zOIGC9Yfje8kONkTUvYV3IJz9Hcf/61MoKtk0paH3jATfGWSavfBeQ6TeCnFbs7ynVaa
 K+7w==
X-Gm-Message-State: ACgBeo3o+5OUpsKrD19xn/gORvSjFWEAMr/0gIupWsp5MT05+UP3rGK3
 l84ygngyUooixzQL4J6yqfUoTw==
X-Google-Smtp-Source: AA6agR6DKU4JA3oQDxr2cs5SQFNxqUBfjzcGBPz/azUf2daPJkm9pEsqSzwnYBZVMcJYpZ6sYBYgag==
X-Received: by 2002:a17:903:244c:b0:171:59be:6762 with SMTP id
 l12-20020a170903244c00b0017159be6762mr12829373pls.20.1661021668709; 
 Sat, 20 Aug 2022 11:54:28 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:142b:b2fd:5c12:7cf3?
 ([2602:47:d49d:ec01:142b:b2fd:5c12:7cf3])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa7956b000000b00535da15a252sm5273918pfq.165.2022.08.20.11.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Aug 2022 11:54:27 -0700 (PDT)
Message-ID: <2d2e3bf8-76cc-2364-7f72-956dd0ebe510@linaro.org>
Date: Sat, 20 Aug 2022 11:54:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/10] target/arm: Support 64-bit event counters for
 FEAT_PMUv3p5
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
> +static bool pmevcntr_is_64_bit(CPUARMState *env, int counter)
> +{
> +    /* Return true if the specified event counter is configured to be 64 bit */
> +
> +    /* This isn't intended to be used with the cycle counter */
> +    assert(counter < 31);
> +
> +    if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
> +        return false;
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_EL2)) {
> +        /*
> +         * MDCR_EL2.HLP still applies even when EL2 is disabled in the
> +         * current security state, so we don't use arm_mdcr_el2_eff() here.
> +         */
> +        bool hlp = env->cp15.mdcr_el2 & MDCR_HLP;
> +        int hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;

The specs could be improved here, as the top of MDCR_EL2 says it doesn't apply if EL2 
isn't enabled in the security state, HLP has the exception noted above, but HPMN does not. 
  I conclude that HPMN is missing the exception, because nothing else makes sense.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

