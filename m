Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C5A68A06E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:36:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNzxc-0006yS-Km; Fri, 03 Feb 2023 12:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNzxa-0006y6-IA
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:34:50 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNzxY-0007s9-V3
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:34:50 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 hv11-20020a17090ae40b00b002307b580d7eso2020480pjb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 09:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0/td4IfnLowPWlb4CuhlxgPYf3rmp+/kd0WoIWCO5u4=;
 b=wQKiVySlBVhQXaSdefTYwapfJFsRCywEjTpAiM4f0ws8GUAqHwzCljKdmM0Dp6KMK6
 0i2b2Q7iCL4S/Cqs63Xr3m04ZPCRm9odFMXLDbEGrXJOQ/nfuDBMXs9CP2NFK+d9S+ge
 /ArV6+KM167h7XUd0HUH9GXL4ugOMIdhKCrM6tACa1fErs5zxTEMCKpzO3+mA9eeyYMO
 GiI6K9yOYvbOTUMyHbE8xwbEuWADh9E5DoElTtZDjUPdXc2HS30rOkASrFG4+xuKe8WJ
 Sf5YoG8frzDoejiwf1MX5QTdnkbyI88lWNur917cJDl3vXkh8KWyGT2wuCOBA5evANWE
 Nq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0/td4IfnLowPWlb4CuhlxgPYf3rmp+/kd0WoIWCO5u4=;
 b=Hsy/iKvym3F0OJEbqx0OEupdftfeouWic5LvBOc3Qt9AItDxdmQ0YTXH/vr3g9oToa
 8x5LuLTqhSUUnEFEvs5jbB6LEGTJF5ahsgHRDI8anbikY/0igjyHCJe6twftxXxU3FeP
 zqFxqHACrISj/YnN1HfwWRfZftI7VaSHHtTjw5ODRYWMDzdDvO7maQRPCp44to5ncJ5h
 Yii+uH3/cHXJZhb+RaRbmuaiXj0weEhuOtgNajR2ABVOHgR7in6XdBIHfDdxT6nTd+1e
 cJYnPA1ZbN+AYpiSRBmf5RBczd9Uv4Yn8VpexNPppECudXaaadsVqf8w6pbjmuOhSTm5
 IuRw==
X-Gm-Message-State: AO0yUKVAIqMr+hCD1X1naQu5DiNpZ7aIn37uNDYUxkcxD2mAlwy7eAV3
 s0irRfRKPltEHvUsF8w/1l/ahQ==
X-Google-Smtp-Source: AK7set92FWygyQ3mNHAtCkoAb9c6K4V8bVoRekjB/ooZRh5P+URnC4dfbFY375yfvR1lUsxgdfZPcQ==
X-Received: by 2002:a17:903:22c7:b0:198:b5e1:74fd with SMTP id
 y7-20020a17090322c700b00198b5e174fdmr10047838plg.60.1675445687122; 
 Fri, 03 Feb 2023 09:34:47 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 ik18-20020a170902ab1200b00189f2fdbdd0sm1874566plb.234.2023.02.03.09.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 09:34:46 -0800 (PST)
Message-ID: <2ecdb36a-adf6-d5b0-8072-2246efdaf99d@linaro.org>
Date: Fri, 3 Feb 2023 07:34:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: ASan reports use-after-free when running munmap-pthread
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, anjo@rev.ng
Cc: qemu-devel@nongnu.org, "ale@rev.ng" <ale@rev.ng>, iii@linux.ibm.com
References: <b7de2f25-c6a4-d053-2e27-ed8f13996182@rev.ng>
 <87wn4zj8kt.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87wn4zj8kt.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 2/3/23 01:23, Alex Bennée wrote:
> 
> Anton Johansson <anjo@rev.ng> writes:
> 
>> Hi,
>>
>> I was running check-tcg with ASan enabled on master, and ran into
>> the following use-after-free. There appears to be a race between
>> jump cache invalidation and thread destruction (?)
>>
>> I thought I'd post here since I noticed some previous discussion on the
>> topic, and I'm not sure myself what a proper fix would look like.
> 
> Something like:
> 
> modified   accel/tcg/tb-maint.c
> @@ -858,9 +858,7 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
>           CPU_FOREACH(cpu) {
>               CPUJumpCache *jc = cpu->tb_jmp_cache;
>   
> -            if (qatomic_read(&jc->array[h].tb) == tb) {
> -                qatomic_set(&jc->array[h].tb, NULL);
> -            }
> +            qatomic_cmpxchg(&jc->array[h].tb, tb, NULL);
>           }
>       }

No, this doesn't affect the use-after-free of jc itself.
I think CPUJumpCache needs to be freed with RCU.


r~

