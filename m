Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1304435A3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:31:59 +0100 (CET)
Received: from localhost ([::1]:55316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyZi-0002Zb-5a
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyO5-0001DU-8B
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:19:57 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:35623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyO3-0003N5-FG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:19:56 -0400
Received: by mail-qk1-x72e.google.com with SMTP id az8so9321010qkb.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nx5nh4ExAWult6bbYOuGuh27cw1rb7yoPZJT1jbhqwg=;
 b=Ps1gnmDYKt10uhrI3FyXsa/8ajRtNFjGgTILHyaibyZJ3s2IG2b0XPH6OQHknugnh3
 DzlB8bwA6gRPTxybrY8O1nqC80s4nGp4UN1SCM+3e6+mGYVA1sVPi6G75XzzTq3S6kp/
 FzdkKujgePyGgREeWuR995HCHErUofwgK4CjxR3l2us8NwCiavY4R0YC09KAjBLYF4Or
 NmJtUko34JlEtcEhcgvjP0v0GMxi0e+XU5FnPC2AbSSb6AL1BdeaTGQLNnNEce38/hde
 PmTvdQ5KS3FS63elwt0SQC1yXFrb9RxtH4GNa0PXbwimrpzKJRQMr4rEzhOSjZ7MDHTM
 mIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nx5nh4ExAWult6bbYOuGuh27cw1rb7yoPZJT1jbhqwg=;
 b=aDmxV2b6UEOtBy/l0GGSVFHfws7zBNrE4fTiWs+xRbP1CNjXLCQ8OPYLJubOIbbMwD
 CB0TNcrygkJPDbbQOFlpQVjXehzijj5qetDEHVNxhoU+NYKunWkMKBBxOdrnvGlEBqnV
 NPWuDKbx6fup81jE6XfiAfLCxd/wTylxlT2cEy+AxwnebIXjW/4dilS9AD/0JTh57O/p
 4Lgi1vcHKp2UKFBdvmQHcWbIpnuiQhF2DmY7wKdHIOsR2+D7DbGcYAJKyCgTfl3C5axU
 /RW334qe5ChfYonoOI2RlsTgqcNSUZ1qN1MMDPy+TTXtvoWkXa3kMOsAwRtSDPFGIsI3
 C4MQ==
X-Gm-Message-State: AOAM530jbjxeK2Ntmz4YTmudsn0n/V87D1A3/+RL4gijumIl93MGMWUj
 Da7wVdQYreKo3LH/TFZhvV5l9g==
X-Google-Smtp-Source: ABdhPJx0L6D4o/uwfU1R/lPttJF+VhS5K4gyZGo4us+8JodIFsBJKmzUY12Y8xr5W7gLKZ2bYF1WXw==
X-Received: by 2002:a37:b8a:: with SMTP id 132mr31769461qkl.278.1635877194325; 
 Tue, 02 Nov 2021 11:19:54 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id m14sm1183227qtk.12.2021.11.02.11.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 11:19:53 -0700 (PDT)
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211026071241.74889-1-agraf@csgraf.de>
 <0cd15efa-d00e-fa85-47c7-6e3d11058cf4@linaro.org>
 <CAFEAcA_wBCL++KREtW2COtDC8nHAD3DRsDbWBxPr0k7i8EWRnw@mail.gmail.com>
 <47d35b2d-bfbf-6ee8-a004-ad74e713db13@linaro.org>
 <CAFEAcA9gwpXQ6MbbaBDXNsCOca+Zyd3jRWYrCqoSZ44U-KAjeg@mail.gmail.com>
 <e8fb0d93-7377-214a-1032-cfea21de1fa2@linaro.org>
Message-ID: <1f1e9fd1-86da-8224-5b80-8f0ddb1455b5@linaro.org>
Date: Tue, 2 Nov 2021 14:19:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e8fb0d93-7377-214a-1032-cfea21de1fa2@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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

On 11/2/21 7:15 AM, Richard Henderson wrote:
> On 11/2/21 6:42 AM, Peter Maydell wrote:
>> On Tue, 2 Nov 2021 at 10:01, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> On 11/1/21 3:35 PM, Peter Maydell wrote:
>>>> On Mon, 1 Nov 2021 at 19:28, Richard Henderson
>>>> <richard.henderson@linaro.org> wrote:
>>>>>
>>>>> On 10/26/21 3:12 AM, Alexander Graf wrote:
>>>>>> Apple's Hypervisor.Framework forwards cache operations as MMIO traps
>>>>>> into user space. For MMIO however, these have no meaning: There is no
>>>>>> cache attached to them.
>>>>>>
>>>>>> So let's just treat cache data exits as nops.
>>>>>>
>>>>>> This fixes OpenBSD booting as guest.
>>>>>>
>>>>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>>>> Reported-by: AJ Barris <AwlsomeAlex@github.com>
>>>>>> Reference: https://github.com/utmapp/UTM/issues/3197
>>>>>> ---
>>>>>>     target/arm/hvf/hvf.c | 7 +++++++
>>>>>>     1 file changed, 7 insertions(+)
>>>>>
>>>>> Thanks, applied to target-arm.next
>>>>
>>>> ...did you see my email saying I think we also need
>>>> to test S1PTW ?
>>>
>>> That arrived afterward.
>>
>> Thinking it over later, I wouldn't be opposed to taking this
>> patch now and adding the S1PTW second -- I think we're
>> currently going to do the wrong thing for the "page tables
>> not in RAM case anyway", so you could regard it as a
>> separate bug fix.
> 
> Heh.  I was thinking the something similar, after I dequeued the patch.  That this fixes a 
> problem emulating a well-behaved guest, and that the s1ptw hole is "merely" a problem vs 
> an ill-behaved guest hitting the following assert.
> 
> Well, I've sent off the PR without this included, so I guess this should be the first cab 
> off the rank for the next set.
> 
> I'm quite happy to hand the target-arm.next baton back to you.  ;-)

Since I need to re-spin the target-arm.next PR anyway, I've re-queued this.


r~

