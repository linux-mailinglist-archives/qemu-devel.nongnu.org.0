Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F06A13C1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:27:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKzk-00013m-4G; Thu, 23 Feb 2023 18:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVKzi-00012z-0Y
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:27:22 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVKzg-0004DI-81
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:27:21 -0500
Received: by mail-pj1-x1042.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so1042261pjh.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1CAij8B1JC5qjAK2zLgF9bUQDox3nB/5a3+DWH2Z+EM=;
 b=nzN28CTQODANhSL0pw0ooE18uipedkemR9YY/zAwmnC+UmH6uXfad8ucZ5jOtY5aRX
 xXh4FjYFeAgwLAYCih3xB0GwBcc8FuViKLgkuE0HkBMR2ueiiE51BlQROdJ4zvgmQgAO
 HlZTq70WBrPKxGmEWYSfWu9r0sZnQiBBt4Dg7JH10mergGLRSkCFHuYkwvdPrZKRSgrQ
 fGiL6lor4rT3KsAreI493NJpWb+AdaxFTjL5SaoK5HM4s83jwaLw/ZZ9qfEswxVDp2XC
 BEcrfhT0l+uYML9ufSQbTA48mrvloGL0iZIt56dkZfbvv2tptMGFx33V9+5EmnozgbnU
 n1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CAij8B1JC5qjAK2zLgF9bUQDox3nB/5a3+DWH2Z+EM=;
 b=p/eG/ur0ThJyo4aadgF8u0WbN1Mnf500GRehoqBchKpj/R76ZbsHs3pcHaj2AdZ5Lg
 xy7epphHIGPwjrs13usNLTNNPnQY2XEMKfhK5xntkVPNw4DA2ulSYRqTZcULXdtg50Yk
 nHledl1N1Py781+5YDxMYS3uithldQLoJeTMmXaXqU5ahbhGAM3UDTj/Jq8BYMV6LTVa
 puwVy8Dmodcwg3TAeVdKhcwiU7xdDkW8RFC4P/UH2Ellwiu3/jk+4KpHIT5JOGmrkFwy
 TPm0w7xV7/sSehz006YqaxIggoFTJeCKzUAJWv69ZDA34pIdutfjmqY+aHoCHgRzX3A0
 +X0Q==
X-Gm-Message-State: AO0yUKWZBES3UTSFmOPcAPygFXy/+9ueVA0YAA5hc0/kSWTgBfE+TjyX
 b512dcCJtNwYrEV4oRGrCNCDkw==
X-Google-Smtp-Source: AK7set80oiwzLnZQM/7Vn4n0JnchbWiKydACAWamUhvUj1PS7QXrbQF8QFMUT7SWj/Qfz//qrPBlJw==
X-Received: by 2002:a17:90b:3b90:b0:233:f65e:8f17 with SMTP id
 pc16-20020a17090b3b9000b00233f65e8f17mr13280215pjb.49.1677194838645; 
 Thu, 23 Feb 2023 15:27:18 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v14-20020a17090a088e00b002311c4596f6sm209090pjc.54.2023.02.23.15.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:27:18 -0800 (PST)
Message-ID: <ada81122-40a3-3905-8241-3a31b3b59997@linaro.org>
Date: Thu, 23 Feb 2023 13:27:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
 <79c0ce60-5a98-b456-d045-7dd09a91a431@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <79c0ce60-5a98-b456-d045-7dd09a91a431@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:22, Philippe Mathieu-Daudé wrote:
> On 24/2/23 00:01, Richard Henderson wrote:
>> On 2/22/23 01:01, Alex Bennée wrote:
>>> This is a mandatory feature for Armv8.1 architectures but we don't
>>> state the feature clearly in our emulation list. While checking verify
>>> our cortex-a76 model matches up with the current TRM by breaking out
>>> the long form isar into a more modern readable FIELD_DP code.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   docs/system/arm/emulation.rst |  1 +
>>>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>>   target/arm/cpu_tcg.c          |  2 +-
>>>   3 files changed, 28 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
>>> index 2062d71261..2c4fde5eef 100644
>>> --- a/docs/system/arm/emulation.rst
>>> +++ b/docs/system/arm/emulation.rst
>>> @@ -14,6 +14,7 @@ the following architecture extensions:
>>>   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>>>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>>>   - FEAT_BTI (Branch Target Identification)
>>> +- FEAT_CRC32 (CRC32 instruction)
>>>   - FEAT_CSV2 (Cache speculation variant 2)
>>>   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>>>   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
>>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>>> index 4066950da1..12e1a532ab 100644
>>> --- a/target/arm/cpu64.c
>>> +++ b/target/arm/cpu64.c
>>> @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>>>   static void aarch64_a76_initfn(Object *obj)
>>>   {
>>>       ARMCPU *cpu = ARM_CPU(obj);
>>> +    uint64_t t;
>>> +    uint32_t u;
>>>       cpu->dtb_compatible = "arm,cortex-a76";
>>>       set_feature(&cpu->env, ARM_FEATURE_V8);
>>> @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>>>       cpu->ctr = 0x8444C004;
>>>       cpu->dcz_blocksize = 4;
>>>       cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
>>> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
>>> +
>>> +    /* per r4p1 of the Cryptographic Extension TRM */
>>> +    t = cpu->isar.id_aa64isar0;
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
> 
> Maybe:
> 
>          assert(t == 0x0000100010211120ull);

But why bother to break it out then?


r~


