Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82FC5F7BAA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:40:50 +0200 (CEST)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqP3-0007gj-Tn
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpyY-0005bE-RZ
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:13:26 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpyX-0006Ku-60
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:13:26 -0400
Received: by mail-pg1-x52e.google.com with SMTP id f193so5122751pgc.0
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nUnDf4dCw1mmxJkOgbl/FDCSe9w/rqwmMmVd0NUzryI=;
 b=ZXNodWvDV2pkukz1eM1op9UdRHgoiyw4DsOpsp42m3QlXqzFRd4oYv1wYcATH53ueW
 VVilKFkWWL4KXKJuF+KT9iIR+DkqggHwcr/GdA76wLaHoDx7UJF1l/7ttPG4bILi+vbA
 /5LQrh85e7iN/LtEgtASNO1Wf31sIqMJl6fkJnz3C1b54YW485vQc7U+FSUptDhheNVa
 hPmm2NgRA3dAOdvMmw95gsJf3Rlm/+sPQpWAqR78GUrExOPvoA9NTV5/h23xjspGdKmL
 o5V1tJIBsE0qd/rSqFJSSBrxcfd//9eTkov2aY/md6NKR1OMgHXCRCOIQ9sj4x7LHIvz
 /LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nUnDf4dCw1mmxJkOgbl/FDCSe9w/rqwmMmVd0NUzryI=;
 b=vdz2A8ZVJKvTQkYfCtBowtKAcoqOm9YJXoB7tclluxxFdM+gBbM8J5hC5P1u2KIVnc
 3oG5fo++Sd9Iu6jr5Q1wDMV9btc6Wbpg8itf94pRq0RrbWuEvSWnivaZXeNyP9LM3rcG
 YPtB1DDH7bFfiBeUsriSNFzBTziJdoezCb9r3Ta3ktU0tA1T7BgxFDwNegxlkuxOhrjM
 nrm6m7CJWAoRtGi5FPXPZ/Uv6NjgrX2Y8OtG0ZPh2vr4+FRHZRgJwZgW4VpUyhhkKIh2
 gqWgDGUdanx7LpV3YPxyG+dfSrPta2dLlv8ouVH9xYZvqNzC9ov06jgxBeRx42Yy/Xqa
 jInA==
X-Gm-Message-State: ACrzQf00pSKBrf4QDXKdlyYMTgUpumRXVnM27qct4JlB7qxeRWenbAFf
 lkR94iHGGnOEQ0j51q6Zs/2Elg==
X-Google-Smtp-Source: AMsMyM5iXZukdQmyivCyaJ2QleE1FMWyWQbbjsEUcbfgcfwHmoVV64y7rFQZxmb8G6LBBlGma7oN9g==
X-Received: by 2002:aa7:88c7:0:b0:542:3229:8d0f with SMTP id
 k7-20020aa788c7000000b0054232298d0fmr6071659pff.74.1665159203770; 
 Fri, 07 Oct 2022 09:13:23 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ef4500b00176cdd7e4c6sm1711712plx.50.2022.10.07.09.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 09:13:22 -0700 (PDT)
Message-ID: <404f0bc8-c1cf-bc30-0df8-2a33a28d2219@linaro.org>
Date: Fri, 7 Oct 2022 09:13:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 32/42] target/arm: Extract HA and HD in
 aa64_va_parameters
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-33-richard.henderson@linaro.org>
 <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
 <21eab094-34a5-6e02-6bf4-3ac4c70955dd@linaro.org>
 <CAFEAcA8Tg2Vmy2B0a_QcF9wYMHsQUY8HhEOXhmhTF6qO_3RGtw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8Tg2Vmy2B0a_QcF9wYMHsQUY8HhEOXhmhTF6qO_3RGtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/7/22 09:11, Peter Maydell wrote:
> On Fri, 7 Oct 2022 at 16:37, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/7/22 02:24, Peter Maydell wrote:
>>>> +        .ha = ha,
>>>> +        .hd = ha & hd,
>>>
>>> This is a bitwise operation on two bools, should be && ?
>>
>> Bitwise works fine, but I can use boolean if you like.
>>
>> I'd be surprised (and filing a missed optimization bug) if the compiler treated these two
>> operations differently in this case (simple bool operands with no side effects).
> 
> The different treatment I would expect would be that in the '&'
> case it warns you about using a bitwise operation on a boolean :-)

Oh, well, no compiler should ever do that, because bool implicitly converts to int for any 
arithmetic, just like char.


r~

