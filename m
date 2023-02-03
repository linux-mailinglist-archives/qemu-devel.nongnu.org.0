Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9568A130
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:08:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0U2-0005yV-H1; Fri, 03 Feb 2023 13:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO0U1-0005vr-9L
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:08:21 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO0Tz-00084B-HV
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:08:20 -0500
Received: by mail-pj1-x1035.google.com with SMTP id mi9so5789270pjb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jdHoqTVDDSmt2EIgMFWolilMbyX7060fLLydJWcNDG0=;
 b=blnXKq+BL22+KqH+7+FFUfmfbB4mBKjxg7AvwqK+GzTqa7u1uo2UCX5IiRpdb6g0wN
 mgNNlcGlzj8X8i0gzi68aScx3EL/62gkSVJW/LXuNNqxYoxftHCYJbHsyJWhnRG7GWAV
 0MV/5WRqcN84v1jFrTGexNA7iyLhU9TkO1fP0lkzzly0CKHg+0wXyGc4pMmNHiO2j76j
 mvfQYCJQH8AJ0zs/qoIP7Ks46vUCKloUv9kl6waZVdWf50FNOivh3tIJFFvo34DODU0h
 Muxne5gxU9BjmdhkSL8hd4LUDJjNLtHoS9WqTSDUB2EbIfpB+DHQ3xQi3xbjxJEXWZub
 b9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jdHoqTVDDSmt2EIgMFWolilMbyX7060fLLydJWcNDG0=;
 b=cBlKnDFFuLaxQX0YC+q0QUldITb0AHw5eg91Mu2JQnUxcQ4wRYgIaP0eXWSHzmn/9N
 69H2aAFFkOWP1+wJUbVLX7/ktOjs42dxHSU0Qhk3fGUGmxLWuKqh6qDE1oA3MHAfUqX4
 T4vzRD66/8i4zFyzL42gdta0mmgxzRhu61mZqL0bZ7fHB8li17tgNh7ycrjcdQYmzK6r
 lc7wGEBuFndrN61rzvA697lgxqJPXqw+UZ7HPJA5RJtjXGQ7NJT8ZSdrXie5F2WESMIa
 FL21md01jJacMT1t0Sl4H7e+2ynj2AURbp05y2UC7qHUs0BQ3vcrW/NiJgC/U3bU+f3Y
 J0qQ==
X-Gm-Message-State: AO0yUKWDVKzZDxRol5TvzIypID6XV9ycN5Bmn7ENax4HB3Nk1f8uBrKC
 P+mFSzWvn4/m84cB4XdCb1n6Lw==
X-Google-Smtp-Source: AK7set8yfajhH3bAmFGLg8aCI7eehWzbEfy4AAgD3+PWj2c0yrT0WIX1EUJoHvpeH1oS+AkUkxMi3Q==
X-Received: by 2002:a17:902:c403:b0:196:6599:3538 with SMTP id
 k3-20020a170902c40300b0019665993538mr13964416plk.22.1675447697857; 
 Fri, 03 Feb 2023 10:08:17 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 g16-20020a1709029f9000b00196768692e0sm1909732plq.86.2023.02.03.10.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 10:08:17 -0800 (PST)
Message-ID: <f496b7cb-5de6-034c-82e1-997b3763f9fc@linaro.org>
Date: Fri, 3 Feb 2023 08:08:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: ASan reports use-after-free when running munmap-pthread
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, anjo@rev.ng
Cc: qemu-devel@nongnu.org, "ale@rev.ng" <ale@rev.ng>, iii@linux.ibm.com
References: <b7de2f25-c6a4-d053-2e27-ed8f13996182@rev.ng>
 <87wn4zj8kt.fsf@linaro.org> <2ecdb36a-adf6-d5b0-8072-2246efdaf99d@linaro.org>
In-Reply-To: <2ecdb36a-adf6-d5b0-8072-2246efdaf99d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 2/3/23 07:34, Richard Henderson wrote:
> On 2/3/23 01:23, Alex Bennée wrote:
>>
>> Anton Johansson <anjo@rev.ng> writes:
>>
>>> Hi,
>>>
>>> I was running check-tcg with ASan enabled on master, and ran into
>>> the following use-after-free. There appears to be a race between
>>> jump cache invalidation and thread destruction (?)
>>>
>>> I thought I'd post here since I noticed some previous discussion on the
>>> topic, and I'm not sure myself what a proper fix would look like.
>>
>> Something like:
>>
>> modified   accel/tcg/tb-maint.c
>> @@ -858,9 +858,7 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
>>           CPU_FOREACH(cpu) {
>>               CPUJumpCache *jc = cpu->tb_jmp_cache;
>> -            if (qatomic_read(&jc->array[h].tb) == tb) {
>> -                qatomic_set(&jc->array[h].tb, NULL);
>> -            }
>> +            qatomic_cmpxchg(&jc->array[h].tb, tb, NULL);
>>           }
>>       }
> 
> No, this doesn't affect the use-after-free of jc itself.
> I think CPUJumpCache needs to be freed with RCU.

Bah, we already do that.


r~

