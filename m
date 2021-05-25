Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9023939071D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:06:23 +0200 (CEST)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaVa-0006WC-I2
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llaNN-0006ZK-8L
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:57:53 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llaNH-000828-44
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:57:52 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so13531006pjb.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 09:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PTzLIJ5TCSlAeUAQ1cSrs+e2oWQuVskJql/JJ+o7UH0=;
 b=kcXyNMmE+qJEF+46adxOAYNGXLU7tqRHdyBpsGXxtuA5cQMPfJdjZnIllMt3tXsYDe
 oMw5LLO9LIldZSXHqylt58KmJxGuUqjtmGQMPJ7i16z5Nljn8AJ2aIEqZtfKsUMh1jGd
 T0JLhKn0xekjz6n3RnP4Y0eRVTwH5U0+HYhi6HDd0DegQa8eGmXutHfufQvfbNoFSoCK
 ij1UnmEPEUe6qhN9gn7Wo3K9lr9RId8IuFxskR/puUS/CN7/O2GWLUu/w2Pqsh7rbjUq
 oOjI6bKmOyouilKzpZKOeas7blr0ndG36672T4eJgmI/fEkF3uhIGN0F+c0Tomdr97wf
 Sf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PTzLIJ5TCSlAeUAQ1cSrs+e2oWQuVskJql/JJ+o7UH0=;
 b=dLgm/nVEE4QHzd47N9Yf17+JLcPmg+0dC8bPXM4Ks33Z/WbkKj2YMlMA1NvQfiOEsB
 zL3VczWKQWtIEO1dHOSpptKP6eJJiW9grSB+IzJlLG/f0e6NNlwYnv+rysNgLg2hZM0Q
 rScHxqlv6ARi4GM1oCz7ROZPc9sE+1t9I98QxAOfs1LU4js/4h5X9tzbRnbtiVmJaU52
 pheTfIQjqKbrg1IAMDbNximKhgcNQgEX36gLTn+oP5/SBJ6BBgAhRt+8qd6GbDarGSGL
 4QYm0vN/T0caHyvCIRK4VUf/nlPKQYGF8Lt8t1PfHAxOA/ckto0TGi/YzfcivnW8GGto
 qy6w==
X-Gm-Message-State: AOAM532wckRVGW8AMoWwo+478HTKljEGcm11JtmzzRg05XBpYMwMQkyb
 /kONbDyEFSqdy2E6mrwsl9OGkg==
X-Google-Smtp-Source: ABdhPJw3rY6PyKyoyOGcn3AhDbrRnyFkEx3ArUDmvaGu5zoD0eL2oiljQz/5dRg8u+CfX6OI7psr1A==
X-Received: by 2002:a17:90b:1b4f:: with SMTP id
 nv15mr5848780pjb.56.1621961865150; 
 Tue, 25 May 2021 09:57:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s3sm15569534pgs.62.2021.05.25.09.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 09:57:44 -0700 (PDT)
Subject: Re: [PATCH v1 11/11] target/arm: Enable BFloat16 extensions
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-12-richard.henderson@linaro.org>
 <CAFEAcA_YZe6xMfMFek-KEh8j3zO-AiquM3epyFET3R6XPDAjkQ@mail.gmail.com>
 <0882a45d-8c02-93fb-2dff-abdc7f7c6b95@linaro.org>
Message-ID: <76fde3a0-b1f1-ed8e-ea4c-2614679b0306@linaro.org>
Date: Tue, 25 May 2021 09:57:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0882a45d-8c02-93fb-2dff-abdc7f7c6b95@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 7:47 AM, Richard Henderson wrote:
> On 5/18/21 7:47 AM, Peter Maydell wrote:
>>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>>> index 046e476f65..b2463cf109 100644
>>> --- a/target/arm/cpu_tcg.c
>>> +++ b/target/arm/cpu_tcg.c
>>> @@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
>>>           t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
>>>           t = FIELD_DP32(t, ID_ISAR6, SB, 1);
>>>           t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
>>> +        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
>>>           cpu->isar.id_isar6 = t;
>>>
>>>           t = cpu->isar.mvfr1;
>>
>> Same query as with SVE: do we need to clear these in the "!has_vfp"
>> and "!has_neon" handling code in arm_cpu_realizefn() ?
> 
> I *think* we want to clear ID_ISAR6 only when !has_vfp && !has_neon, as 
> FEAT_AA32BF16 should still be usable to the other one.  Which also means adding 
> the NEON/VFP check you suggested.

Alternately, we can clear BF16 when either !vfp or !neon, and then we don't 
have to add the extra checks.

Unless we're presented with a real cpu that has vfp but not neon, and does have 
bf16, this seems like a head-scratcher corner case.  Just so long as we don't 
do something actively against the rules I guess we're ok.


r~

