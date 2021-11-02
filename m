Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C93D442D4A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:57:13 +0100 (CET)
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsPg-0006by-9N
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrlD-0000TM-4S
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:15:23 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:47083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrlA-0003s3-Uv
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:15:22 -0400
Received: by mail-qt1-x835.google.com with SMTP id s1so17073119qta.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tT68eqf9la88ikeSVe6nHYTgt/cpCLLPj675vDVJBlk=;
 b=lnhiEo3whrONObzWdSb2kYomBzkqRe4mzTic9D9Wm9BLCBe0QKTSRvsQfAzXOK13aU
 +hqduDwrfyGZApo5oLab4ANkzeCFpRF/+VYqC69tndHS8tgZUaobMV4bpqi/3rdUVC18
 ahx1S3VUU+ERZf4o6/xLRUSyRqiCA29VWvbARGsvzTGv1RiKutgi8TE/09aev84o2jxT
 ylPLWjqsnle+a9f7WWmocrTSYXPr84DcgZHw698OKyhnwSSYrsLxGc+WJcgAtokevJYT
 K6V7PG7yhWufjJg94y7mZbTYDm836jrVMYluMQVI1ZKtbjq1z0q48llO5y2skxqP+Dt5
 3T6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tT68eqf9la88ikeSVe6nHYTgt/cpCLLPj675vDVJBlk=;
 b=BXsD3K8tkgF0XM4TPc0E7OgNvs0EM1b9JMboWtAp+5ORWIi/T74LODZiihy7lmKqQp
 L0/b/4WQYDXqofpHGmZynr8mLls+vD2QVCbwdW3oL5rxc2w85js1aTRDSBqKU+0eqO0h
 tnT4d0Odoyk9QQN4BDj6FYGVJ/1f9n7ISmH+Iorteke1TZq4+wnL1VFfzZcpq5xTlqWL
 hM5FRWGuaLFLd0ny8hBBtWDCSVHCP48fkHDVmMJPPe0lbg5hYwDE+ftJRsxQAia0sqXc
 7lCMcVmaxQGCWqSX7AhkrDKiiIy5/pTUuJ/6kuGRyKwkc7ZLeNQvfx1aWG5gXyAVr4Hi
 uZqg==
X-Gm-Message-State: AOAM5305THpEA1RTvw8cuAqtyTYMJVKEyu8/+ZxwlqgCoqKLPYAwhHea
 yJDrefQ73F1AW3IqmVnAHSEj6Q==
X-Google-Smtp-Source: ABdhPJwNcA6pVswq7I1Tct8k75IcKYwtxdQSE2EpcgD3lJN07f5e6+ghc0i0il6jEp41cDLL63BwFg==
X-Received: by 2002:ac8:5f13:: with SMTP id x19mr36778297qta.338.1635851719797; 
 Tue, 02 Nov 2021 04:15:19 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id a36sm1511434qkp.81.2021.11.02.04.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:15:19 -0700 (PDT)
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211026071241.74889-1-agraf@csgraf.de>
 <0cd15efa-d00e-fa85-47c7-6e3d11058cf4@linaro.org>
 <CAFEAcA_wBCL++KREtW2COtDC8nHAD3DRsDbWBxPr0k7i8EWRnw@mail.gmail.com>
 <47d35b2d-bfbf-6ee8-a004-ad74e713db13@linaro.org>
 <CAFEAcA9gwpXQ6MbbaBDXNsCOca+Zyd3jRWYrCqoSZ44U-KAjeg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8fb0d93-7377-214a-1032-cfea21de1fa2@linaro.org>
Date: Tue, 2 Nov 2021 07:15:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9gwpXQ6MbbaBDXNsCOca+Zyd3jRWYrCqoSZ44U-KAjeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: kettenis@openbsd.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:42 AM, Peter Maydell wrote:
> On Tue, 2 Nov 2021 at 10:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/1/21 3:35 PM, Peter Maydell wrote:
>>> On Mon, 1 Nov 2021 at 19:28, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> On 10/26/21 3:12 AM, Alexander Graf wrote:
>>>>> Apple's Hypervisor.Framework forwards cache operations as MMIO traps
>>>>> into user space. For MMIO however, these have no meaning: There is no
>>>>> cache attached to them.
>>>>>
>>>>> So let's just treat cache data exits as nops.
>>>>>
>>>>> This fixes OpenBSD booting as guest.
>>>>>
>>>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>>> Reported-by: AJ Barris <AwlsomeAlex@github.com>
>>>>> Reference: https://github.com/utmapp/UTM/issues/3197
>>>>> ---
>>>>>     target/arm/hvf/hvf.c | 7 +++++++
>>>>>     1 file changed, 7 insertions(+)
>>>>
>>>> Thanks, applied to target-arm.next
>>>
>>> ...did you see my email saying I think we also need
>>> to test S1PTW ?
>>
>> That arrived afterward.
> 
> Thinking it over later, I wouldn't be opposed to taking this
> patch now and adding the S1PTW second -- I think we're
> currently going to do the wrong thing for the "page tables
> not in RAM case anyway", so you could regard it as a
> separate bug fix.

Heh.  I was thinking the something similar, after I dequeued the patch.  That this fixes a 
problem emulating a well-behaved guest, and that the s1ptw hole is "merely" a problem vs 
an ill-behaved guest hitting the following assert.

Well, I've sent off the PR without this included, so I guess this should be the first cab 
off the rank for the next set.

I'm quite happy to hand the target-arm.next baton back to you.  ;-)

r~

