Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11B665F982
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 03:21:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDcKT-0008Hh-4E; Thu, 05 Jan 2023 21:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDcKQ-0008HW-NB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 21:19:30 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDcKO-0007VB-Gc
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 21:19:29 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so3880495pjj.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 18:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iUzCHXRHZPY/rBk/z9q0F4N49WIjl2W+N4OeTU54W7E=;
 b=uF7xZNz67o4itWTVxzakIWCsUSPMeYqsW/YA8XRECmQX/Jl/JpIOfQ1vrnf9zXOPz4
 UIwaIR35jA5JDJEpLzF32ruUTZjAZRZQkZPtPmTI6XjrifJ56uJHKVNS9y4iWZwEoMD8
 Jxf9fY29mwdnaFCBoWLMPUkLvgsx/ey+Mik4V/cGzIKuzZJnEzRqnsPPYXPFrJXA4Nhf
 oMG7wPDgaEsokOZBWKjgaaVNewzItgLkGaGmLTGkEWuAqEyfCMzGRKmNpwCtNYHGH05q
 LXmjaFzKvMnSGoSDnT5CljIirIJjJjJx6aFuDZjwQz+EfHcAmFB5YeVcKiYIO12nmkqN
 33rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iUzCHXRHZPY/rBk/z9q0F4N49WIjl2W+N4OeTU54W7E=;
 b=LHDwMQ2eIldUVdg+6jKC0Ou5Y7jqVOCZsqyiTnDl+D+VctDqTZevuyZnz0LHFEdnNn
 drvT6GjG4/EAaGAWpXP6GLfteE8mJpbXNaiaQ104F0t+x9oezqjZ6e3k828ga/XNdCGV
 Ptlwv0D/l8nyHpGEUks2Zfu+mX2klpMWrTJUJNiqFnsqquOgIIchJDBkwRWrcJOLL/77
 axkNog6yjXM6Q0tsoLwwcqQYMuAp6d0cq2hsi9fNKAz7oVGEVFY+5HlYxUbolt3+Ca86
 ZkLDysuX52fe+slYXELS/MPlcJHz17Na8xS307phjlVN1Pm1jZDVq/J85EbR+Q0GJHSp
 Be6g==
X-Gm-Message-State: AFqh2kq3ziyfNTBkvellgMscJvyRsmVrJ0wFGwt4LV6u5E0P47ejd8+q
 bVc1TsmHWV9huR9cN2BzJr1Xmw==
X-Google-Smtp-Source: AMrXdXtvejQYcChl0bnnRwWSl05JtyjQqUW0v1bwNTZOQLk+kNyTtNAa45Q+GSTKx/UDb3N2S+sn5w==
X-Received: by 2002:a17:90a:bc8a:b0:225:f216:b421 with SMTP id
 x10-20020a17090abc8a00b00225f216b421mr38083283pjr.6.1672971566395; 
 Thu, 05 Jan 2023 18:19:26 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:2cfd:802:a4a0:c8da?
 ([2602:47:d48c:8101:2cfd:802:a4a0:c8da])
 by smtp.gmail.com with ESMTPSA id
 gc5-20020a17090b310500b00218e8143380sm1952521pjb.28.2023.01.05.18.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 18:19:25 -0800 (PST)
Message-ID: <d588a819-b4ed-0fc2-480d-6e9b3b064564@linaro.org>
Date: Thu, 5 Jan 2023 18:19:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 11/40] target/arm: Copy features from ARMCPUClass
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-12-richard.henderson@linaro.org>
 <c154778b-ed95-5d73-4533-2301820b05a1@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c154778b-ed95-5d73-4533-2301820b05a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 1/5/23 14:04, Philippe Mathieu-Daudé wrote:
> On 3/1/23 19:16, Richard Henderson wrote:
>> Create a features member in ARMCPUClass and copy to the instance in
>> arm_cpu_init.  Settings of this value will come in a future patch.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu-qom.h | 18 ++++++++++++++++++
>>   target/arm/cpu.c     |  1 +
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
>> index 5509ef9d85..ac58cc3a87 100644
>> --- a/target/arm/cpu-qom.h
>> +++ b/target/arm/cpu-qom.h
>> @@ -74,8 +74,26 @@ struct ARMCPUClass {
>>       /* 'compatible' string for this CPU for Linux device trees */
>>       const char *dtb_compatible;
>> +
>> +    /* Internal CPU feature flags.  */
>> +    uint64_t features;
>>   };
>> +static inline int arm_class_feature(ARMCPUClass *acc, int feature)
>> +{
>> +    return (acc->features & (1ULL << feature)) != 0;
>> +}
>> +
>> +static inline void set_class_feature(ARMCPUClass *acc, int feature)
>> +{
>> +    acc->features |= 1ULL << feature;
>> +}
>> +
>> +static inline void unset_class_feature(ARMCPUClass *acc, int feature)
>> +{
>> +    acc->features &= ~(1ULL << feature);
>> +}
> 
> These helpers are not used until patch #19 "target/arm: Move most cpu
> initialization to the class".

I know, but I thought it clearer to introduce them with the field.


r~

> 
>>   void register_cp_regs_for_features(ARMCPU *cpu);
>>   void init_cpreg_list(ARMCPU *cpu);
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 1bc45b2b25..d64b86b6a5 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1191,6 +1191,7 @@ static void arm_cpu_initfn(Object *obj)
>>       QLIST_INIT(&cpu->el_change_hooks);
>>       cpu->dtb_compatible = acc->dtb_compatible;
>> +    cpu->env.features = acc->features;
>>   #ifdef CONFIG_USER_ONLY
>>   # ifdef TARGET_AARCH64
> 


