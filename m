Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2D26E076E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 09:14:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmr8u-0007sr-5T; Thu, 13 Apr 2023 03:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmr8n-0007rD-85
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 03:13:09 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmr8a-0006gY-AI
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 03:12:59 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso9407370wmb.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 00:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681369974; x=1683961974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pS7KTwo3EKGYszSCfQOkm9OGM/K03PZYbWWOmcWi/RA=;
 b=FWHq5cWGA/Sy23YtuM4qEEXSGQoyj5izRZj08Fk4UjiocYvW9JI7+tO5Urbiprp8uq
 4Yn08jTwVzNtviKKYuplDwqfMDXNqeMvaH84EatmN8V7IgsmS6GXLund3YR3kLZJWuNF
 fkwrp/+US12cTT53epHcjkCqjFmSXy8SnnxYT9XGzQ95IEQekl4TmMzgcw9Sb3PCA9It
 qu2+VW3al1gwVaxMLk5ju2C0x14pvMQG+YzV/0FVpYAoE5JUiFqQFyLvNxVAA9ybzP39
 FNrAJAxMhogztnsc4mnTRNMRo21p72KLyIQrHqO7E7a4tQTrIRCxdgDzpdW2oHh/f04J
 r9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681369974; x=1683961974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pS7KTwo3EKGYszSCfQOkm9OGM/K03PZYbWWOmcWi/RA=;
 b=TuuiBJyRUhV2lJCCGXwWPQcPOQ7OpYAw4/1s/eKZRrYuEoCWvqe4yZ8xnGcJ98Es3y
 uJs5dhBQ/JcTPOpwuBbl9RjfDhE0YWAniQVyFv5EShzpd3SCOBxmf83kHyKlNms4v98/
 u6xK3sje6TIcJf2ENiL2v44eqduTtDYOWwK6Xw9RMABWNWS69GrPtiBghq6T1rQVWK37
 Lb284TKDEchX3DbEr3y6Jy6Ooy6rus4UeoRbxD0d11PcjeMwoZ7y6dFLmPaJgyZfZa8a
 zpuk0YwXjFJUKsvEScUsVbLjVn0cgmuVm5BKcPyF3Y1BVQ6+h/T5bTBdFN69+D5U1Vcl
 EV7Q==
X-Gm-Message-State: AAQBX9fBrlO4THS+L9SIm5Hik2aZ52s4KvfB8xtVnMAtDrzuZbOQw7/q
 84kd2tGeiHH/8PqFrHSpw/Ao5g==
X-Google-Smtp-Source: AKy350YNvQxEjP3hLD5wGPLwhOnb75PZxkE/1JxVQIyBc6Txd0kWAMs49/p3sud5iSCzQJbe/ws9pA==
X-Received: by 2002:a05:600c:2152:b0:3f0:3d47:2cbe with SMTP id
 v18-20020a05600c215200b003f03d472cbemr1075522wml.10.1681369974175; 
 Thu, 13 Apr 2023 00:12:54 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003ede03e4369sm4643913wmq.33.2023.04.13.00.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 00:12:53 -0700 (PDT)
Message-ID: <ff9cbbc5-d900-bc45-ef15-0da56e53547d@linaro.org>
Date: Thu, 13 Apr 2023 09:12:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 27/54] tcg/riscv: Require TCG_TARGET_REG_BITS == 64
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-28-richard.henderson@linaro.org>
 <c696a2f2-48fc-88f3-bc30-81d31a0fead8@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c696a2f2-48fc-88f3-bc30-81d31a0fead8@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 4/12/23 22:18, Daniel Henrique Barboza wrote:
> 
> 
> On 4/10/23 22:04, Richard Henderson wrote:
>> The port currently does not support "oversize" guests, which
>> means riscv32 can only target 32-bit guests.  We will soon be
>> building TCG once for all guests.  This implies that we can
>> only support riscv64.
>>
>> Since all Linux distributions target riscv64 not riscv32,
>> this is not much of a restriction and simplifies the code.
> 
> Code looks good but I got confused about the riscv32 implications you cited.
> 
> Does this means that if someone happens to have a risc-v 32 bit host, with a
> special Linux sauce that runs on that 32 bit risc-v host, this person won't be
> able to build the riscv32 TCG target in that machine?

Correct.

At present, one is able to configure with such a host, and if one uses --target-list=x,y,z 
such that all of x, y or z are 32-bit guests the build should even succeed, and the result 
should probably work.

However, if one does not use --target-list in configure, the build will #error out here:

>> @@ -942,9 +913,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
>>   #endif
>>   };
>> -/* We don't support oversize guests */
>> -QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);
>> -

I am working on a patch set, not yet posted, which builds tcg/*.o twice, once for system 
mode and once for user-only.  At which point riscv32 cannot build at all.

I brought this patch forward from there in order to reduce churn.


r~

