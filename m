Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91D6D8186
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:18:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4u9-0007aY-DK; Wed, 05 Apr 2023 11:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk4u7-0007YD-Ez
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:18:31 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk4ts-0003iU-Cr
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:18:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso3058713wmq.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680707889;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=idFXVwnEQw2AeckpahKfXswn5+/Jk4JVx854v+ndXlM=;
 b=P5FRw1Bg8gByNSRzaVrWUJucc+Ia4IMT8SBajxnMMvSH0nmkPoBKvzzOp8cPpm0043
 W55c3pCluAC9R0flUGbEbU7/UOi25PsdH6FiniT+JvE7ldpWa3l6uPy/ngUjkHb2R1nI
 lDct8ip3jjWb9ZROycFg+zRRunyCOZEJtqUtxAV7aEzkeuiimDkDVTD8s1N/T9AVVfcu
 ZKoBR5zXSIvJZ2JIo/R2+DR5oTvV0/L9XzKUlEb5jX9SCauc267Ovw8quhwNhbHCnBZ1
 8EWK7u4/h6p/P9crBvmOAbjQYbSrYrxaz/Jn0hJ/1Wx9uKiQKBukAv/SHkV2N833Rknz
 lSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680707889;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=idFXVwnEQw2AeckpahKfXswn5+/Jk4JVx854v+ndXlM=;
 b=X7KljDjceiPqStMWbAIyoS4+fUsIaZK6O4zvVPSQLs/LvDJ4QJNhm0yi3JI1BBKHaS
 v0MgjEeJ9UjhWpHXLmaIaGZ+SFhTALKc0+2NWtFAbsCmYFe0k7L4JWfzXjf3D67QuJA8
 nvZ7Z6UbpEZ4NhrYBleZWuZ8p8gNwzpqTqjQ7e63D2gm9LTiAXd+wssLCXojYWMMlhLy
 mGdN7d54pj87j0vJznPgjcDM9MrUSr2kItEKXKffQW7DoHYinpeHUsdI16H1n3lOzQOw
 Ms83iLtS6rZJq5/IvnFQ5RvgipAeefmazxuIxr+72URTOn7MapcBsHms+KxEOWM4qNd8
 lHmg==
X-Gm-Message-State: AAQBX9chgVShzr16dvG8vpavR+oNvALj5e0VQl3NR//GgEcTmNwfYA8h
 FSt/L2GkUflMO8MkVpy4wd2tRA==
X-Google-Smtp-Source: AKy350Z6S5WSad5iHIzjt49TqgYs41yzdYlN/8d2eI12bwZ9Xb+YKGePa0vAg6iMH5JR4Z/F8GyAAQ==
X-Received: by 2002:a7b:c38b:0:b0:3ed:8bef:6a04 with SMTP id
 s11-20020a7bc38b000000b003ed8bef6a04mr5244487wmj.27.1680707889387; 
 Wed, 05 Apr 2023 08:18:09 -0700 (PDT)
Received: from [192.168.69.115] (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr.
 [176.184.52.81]) by smtp.gmail.com with ESMTPSA id
 i42-20020a05600c4b2a00b003f0321c22basm2461375wmp.12.2023.04.05.08.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 08:18:09 -0700 (PDT)
Message-ID: <b84ecc42-4201-d714-364a-6a55682cbce7@linaro.org>
Date: Wed, 5 Apr 2023 17:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 09/14] accel: Allocate NVMM vCPU using g_try_FOO()
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Reinoud Zandijk <reinoud@netbsd.org>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-10-philmd@linaro.org> <874jpul9d1.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <874jpul9d1.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
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

On 5/4/23 15:55, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> g_malloc0() can not fail. Use g_try_malloc0() instead.
>>
>> https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/i386/nvmm/nvmm-all.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
>> index 3c7bdd560f..45fd318d23 100644
>> --- a/target/i386/nvmm/nvmm-all.c
>> +++ b/target/i386/nvmm/nvmm-all.c
>> @@ -942,7 +942,7 @@ nvmm_init_vcpu(CPUState *cpu)
>>           }
>>       }
>>   
>> -    qcpu = g_malloc0(sizeof(*qcpu));
>> +    qcpu = g_try_malloc0(sizeof(*qcpu));
>>       if (qcpu == NULL) {
>>           error_report("NVMM: Failed to allocate VCPU context.");
>>           return -ENOMEM;
> 
> Why - if we fail to allocate the vCPU context its game over anyway any
> established QEMU practice is its ok to assert fail on a malloc when
> there isn't enough memory. IOW keep the g_malloc0 and remove the error
> handling case.

This was my first approach but then I realized the author took care
to warn / return ENOMEM, so I went for _try_; but you are right,
since this is "game over" let's simply remove the check.


