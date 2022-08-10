Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787A558EF78
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 17:36:27 +0200 (CEST)
Received: from localhost ([::1]:33804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLnkv-0000DI-Ti
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 11:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLniZ-0006bJ-In
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 11:33:59 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLniY-0002XF-2C
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 11:33:59 -0400
Received: by mail-pg1-x535.google.com with SMTP id f11so14650312pgj.7
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Shpi7OSQIlO7SdnT4HPS6c5P5Dd3pS6PG/YMmkGP+WY=;
 b=fA9mrsqpw7kbbbEje4X4FwhGH1arpIcjESUigIgCZxhA60Meja6Xpqhgc47S7XTjhT
 Wh2O96kacR5wDn1XDuyiE76NOvLkFNGuXv52GIWPnzEGxN+GUCc1QsoKehTjPwP83zxF
 IfZvLOsiHtWr4QWXska6FIEatmWo8fWWWQ7ftChfS/oq3zAQuVovCRAXZuVB2P8pBgmO
 jl5iqDn4B7MUnXHR/DHd/9cSd6b8RPLImyibwbPv07w9CEXS0qD2GtQasRvUNEin5JSs
 QWT0TOdO1EzYVwR919o9r4COVN+PfL1gFTXtwbUh0JJZz7KewTGwr5D6FDnuG4qJ3qGM
 uvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Shpi7OSQIlO7SdnT4HPS6c5P5Dd3pS6PG/YMmkGP+WY=;
 b=BrMvYQbKga/EyYhzL10XBmGn5YcsXX/l2DkEXinvdCM9wHHu4H5jXmU3BaFoptImI2
 Uk6bJj9JNUg5rJl7RXAPyizd7A0bsEZcXZjowRN4kzGsJzA643O96OmZdk52HCmITNSj
 /xA7icKynhGaTprcHa5YfP9aaOGlNQc/34debTupm3EAgG5uKdeHOwtOOA7kcPNprBse
 uWeL0g0UllmhvB3R80TjcJspK7BCJt0SlZJz3RQFDNwQM2540xjJ3oy9ebqkcsWIIyUZ
 u9vAv1UcOye4i1xDHBrTFWdluKdtHQ9ot7fESWcy2/dHDR7leSFnadBRPxNV/P2N5aVI
 LdyA==
X-Gm-Message-State: ACgBeo1CezjDcElHMMV+7WEIfbwPzbAERhnBAFhSSMTWMYehDX9VjXh8
 0XI0D2S8ODt0ZkbsvYHGAkg+AZBG4REEXQ==
X-Google-Smtp-Source: AA6agR6CpdwsR2EPKTVsH2T0+pULBm3+QB5ouGucw30N8u062t4Kd11834Gj4P7vnFNHaP94L6DwLw==
X-Received: by 2002:a05:6a00:1687:b0:518:6c6b:6a9a with SMTP id
 k7-20020a056a00168700b005186c6b6a9amr28566230pfc.81.1660145636954; 
 Wed, 10 Aug 2022 08:33:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:1d05:6ab9:1c4d:d646?
 ([2602:ae:154e:e201:1d05:6ab9:1c4d:d646])
 by smtp.gmail.com with ESMTPSA id
 b123-20020a62cf81000000b0052e23a5ab74sm2111028pfg.59.2022.08.10.08.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 08:33:56 -0700 (PDT)
Message-ID: <3128223b-56d9-8efd-05c0-f1f2a30dfd99@linaro.org>
Date: Wed, 10 Aug 2022 08:33:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 22/62] target/arm: Add secure parameter to
 get_phys_addr_pmsav8
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-23-richard.henderson@linaro.org>
 <87fsi4kzkz.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87fsi4kzkz.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 8/10/22 06:16, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Remove the use of regime_is_secure from get_phys_addr_pmsav8.
>> Since we already had a local variable named secure, use that.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/ptw.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index d424dec729..f7892a0c48 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -1960,10 +1960,9 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
>>   
>>   static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
>>                                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
>> -                                 GetPhysAddrResult *result,
>> +                                 bool secure, GetPhysAddrResult
>>   *result,
> 
> NIT: why not use is_secure like all the other functions (and reformat
> the commit subject to match too).

It's right there in the commit message -- there was an existing local variable.


r~

> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 


