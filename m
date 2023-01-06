Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73D65F984
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 03:22:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDcMJ-0001JA-Un; Thu, 05 Jan 2023 21:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDcMH-0001J0-Rk
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 21:21:25 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDcMF-0007x8-6f
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 21:21:25 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 cp9-20020a17090afb8900b00226a934e0e5so4626957pjb.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 18:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gofjWJLApaQnCmYFuNgmswggD+y9kna5LjAowyH9Jvo=;
 b=uZV3f40UGOP+q8Q/WflsALL9PF/Oub4bIxF693CoghydtTN6CMqqJe5TXllzhnU54J
 tQPY88pVGFJcsSZ3FxbfWLV1GNN85aR9fmcct9SSplZUiAwUL/jJsKPnX/01REdk7fI5
 wWrC7qOyy1IMvSBbK6TcbvFh/4pw+JP46NAI8KzxYC7E9y12r01Iw2fBtfhoVpPEprF5
 VIC83enC6SrPNkvcFQuz51t59ggrLpUWTXmsCKw3f7u1nzS/5RJsZxnmwN8tq1Rp/tHQ
 g+j9xdr8MhEjvvaklvzOue/X1Sf3U9CKGTKzOvlvLlsFV49Ilh/Jwr/Bq1hoZ0LxJPgF
 1g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gofjWJLApaQnCmYFuNgmswggD+y9kna5LjAowyH9Jvo=;
 b=sElQSGXsyZ/H3KnacrF2dN4Rba6AZRJEwwM/TlpGTJ/GqcivQiDVkCV75cv7gKxK/C
 U5hGsD2RjgIT3EIDmFfZ2wSE4zWUZoI3m7cDvxFEi6dDfQRfnx/8+o0hACsT+0xvEL6B
 5Y2PsuojY2V9fr3OheEAc6l7yj4W97i0L8KwuGsyKIy2c6/w/Me8PfBGJCGY7ACGhnlC
 9tHAjPLhxNRdDXS/TvBZ0cINX5nS2bwjBx+oZflreRm7yhoXuBQfodwhAeZu7q1NqnKh
 5x06e77ANo2fl6be/8upLCSd9OHRI7YvkJqISNZL6d+FyGOInRsybBzAeSamuh7DoOtY
 Nt0Q==
X-Gm-Message-State: AFqh2kqMj0yN+ksdnk/rmEq55OOXa5gPDcAAplJnE5wPxlXXsPwOER+M
 vxiBfCaP6eF8gROl5L8RCUp78Q==
X-Google-Smtp-Source: AMrXdXtN+5NZ+rGIuERYOLz+hhrfdGB/jMJlmNT5RZf6ZohxsFTwUwgAVuoZp0VKSxllz592ZfJwkg==
X-Received: by 2002:a05:6a20:3b01:b0:a4:150f:8ddc with SMTP id
 c1-20020a056a203b0100b000a4150f8ddcmr77882003pzh.52.1672971681408; 
 Thu, 05 Jan 2023 18:21:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:2cfd:802:a4a0:c8da?
 ([2602:47:d48c:8101:2cfd:802:a4a0:c8da])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902d48200b001928d49bf84sm6200252plg.191.2023.01.05.18.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 18:21:20 -0800 (PST)
Message-ID: <4532fba5-d15f-7e59-d7a5-243a047f0bde@linaro.org>
Date: Thu, 5 Jan 2023 18:21:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 21/40] target/arm: Remove aarch64 check from
 aarch64_host_object_init
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-22-richard.henderson@linaro.org>
 <81600a17-d082-d6da-5fac-04dd41824755@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <81600a17-d082-d6da-5fac-04dd41824755@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 14:08, Philippe Mathieu-Daudé wrote:
> On 3/1/23 19:16, Richard Henderson wrote:
>> Since kvm32 was removed
> 
> Maybe add here:
> 
>    (see commit 82bf7ae84c: "target/arm: Remove KVM support for 32-bit
>    Arm hosts")
> 
>> , all kvm hosts support aarch64.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu64.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 28b5a07244..668e979a24 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -1095,10 +1095,8 @@ static void aarch64_host_object_init(Object *obj)
>>   #if defined(CONFIG_KVM)
>>       ARMCPU *cpu = ARM_CPU(obj);
>>       kvm_arm_set_cpu_features_from_host(cpu);
>> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> 
> Worth asserting this feature is enabled? I don't think so, so:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Indeed not.  In the next patch we hoist this feature setting out of kvm+hvf to common code 
just above here.


r~

> 
>> -        aarch64_add_sve_properties(obj);
>> -        aarch64_add_pauth_properties(obj);
>> -    }
>> +    aarch64_add_sve_properties(obj);
>> +    aarch64_add_pauth_properties(obj);
>>   #elif defined(CONFIG_HVF)
>>       ARMCPU *cpu = ARM_CPU(obj);
>>       hvf_arm_set_cpu_features_from_host(cpu);
> 


