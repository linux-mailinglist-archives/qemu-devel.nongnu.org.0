Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F968FA02
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:01:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPsUB-0000Z0-Pi; Wed, 08 Feb 2023 17:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsUA-0000Yh-3g
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:00:14 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsU8-0006zc-AY
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:00:13 -0500
Received: by mail-pf1-x434.google.com with SMTP id g9so40558pfo.5
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6yPMSTnJNL20QqXsozQBkHnu0ASyiJ4F0NUVVKcdJys=;
 b=lZCyYGJEXD95CpIbuW2W1RKEUEQCQtNzgzkr9ioNlC0r4mmawVIfxToSzTyFu8mviz
 D2NadTBQw87YdCbWhXCTMNLJ1CqbagUu2NumhT5iKcQdPdUsXAWYrdkAQSQXjQCBUoNW
 6aEmxwRkXClcx5Xv7b2MjX0sGHUzrpczjpwc3tb6VshWwmkmU2wnF+Wta6ez6j335tMa
 uvZT99hOZ+OEsGVgv1zbjFkguquIIlxas2/3rcqACD+9fS1cyfqR38ASJll4jkzL1CvU
 OEvNu3H1G5rWwTycQDfM5RJjjMP9Gy3kwbAsCfoRp98OSrg1MMUyC2SUvKWUfe+XDsry
 Jxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6yPMSTnJNL20QqXsozQBkHnu0ASyiJ4F0NUVVKcdJys=;
 b=h3kI3Yv0tejJgtU093Q/q/XwBKwmvxotl8e2My6JZjAT0i/TeNS99enAl8npEYotPT
 gwa6AQdbJCrJ+l8KxuqNywYzFfBnJIwA7KLI4mk7QRRtDTm8wJ+yjGqzW4T6R4beEGAI
 /+NFFjeteBcvuqKXsG20vf+Qz/KqmBSLfA8+qZLTnSD843r4PmC8wrF7x1FsyLcgujeB
 txtpQrgrHKKRZw8vgcyOEMCHbUXkBZsFSL66SX14mw9zp9b+MmgiboLYlPi4/MrcPgaE
 s4YuA6kCaZAYb0iratjKBQ+XcjsRtg0YOfe0UTd2oVG5pnTQHkKA0R/U/FbVjM6QlUOB
 Ss9A==
X-Gm-Message-State: AO0yUKWKP8E52hOhS/gOv+x/J3CDNADw2MbfRf6/yBN6h4CvDcg9M8fp
 oYpiwuYvTDashRvI/jGz0ydDIQ==
X-Google-Smtp-Source: AK7set+x+jf/OxlnX8pxqJMnSlUeIVDRKs/o4XvmBNmh5ieUSe2t8Il5AIFBsw4r97rkr9V5YcvTyQ==
X-Received: by 2002:a62:4e48:0:b0:5a7:a688:cd8a with SMTP id
 c69-20020a624e48000000b005a7a688cd8amr6401401pfb.33.1675893610009; 
 Wed, 08 Feb 2023 14:00:10 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b005939fe1719fsm11757264pfb.39.2023.02.08.14.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 14:00:09 -0800 (PST)
Message-ID: <9e7fd3c5-e28a-6aa1-0def-146383a1b86e@linaro.org>
Date: Wed, 8 Feb 2023 12:00:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/22] target/arm: Introduce ARMSecuritySpace
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-8-richard.henderson@linaro.org>
 <CAFEAcA8aRKL2Fh-CG3qYF+wH3rH1m79a-E9crUNSCWNQRF+KUg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8aRKL2Fh-CG3qYF+wH3rH1m79a-E9crUNSCWNQRF+KUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/7/23 05:00, Peter Maydell wrote:
>>   static inline bool arm_is_secure(CPUARMState *env)
>>   {
>> -    if (arm_is_el3_or_mon(env)) {
>> -        return true;
>> -    }
>> -    return arm_is_secure_below_el3(env);
>> +    ARMSecuritySpace ss = arm_security_space(env);
>> +    return ss == ARMSS_Secure || ss == ARMSS_Root;
> 
> maybe
>    return arm_space_is_secure(arm_security_space(env));

Quite right; arm_space_is_secure was something I added later, and failed to propagate 
completely.

>> +#ifndef CONFIG_USER_ONLY
>> +ARMSecuritySpace arm_security_space(CPUARMState *env)
>> +{
>> +    if (!arm_feature(env, ARM_FEATURE_EL3)) {
> 
> The old code had a comment
> -        /* If EL3 is not supported then the secure state is implementation
> -         * defined, in which case QEMU defaults to non-secure.
> which should probably go here I guess.

Ok.


r~

