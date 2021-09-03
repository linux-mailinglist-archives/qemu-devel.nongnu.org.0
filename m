Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C713740009B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:36:52 +0200 (CEST)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9ND-0002Sv-SN
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9KR-00067L-Tf
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:33:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9KP-0006Gv-W0
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:33:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u9so8258913wrg.8
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OklEvV762+J2ILnH8xddQQnD38gLbqj6zsBgTDfKNHA=;
 b=jQrM2Lb9sXnlbpm/zS7S+9EdNveYXuD98vGTdFrTjHgIg3RwKgdgzxEX+rjnftjAbR
 2cK1iYxkVeSwRQPu3y3cV6KmbZA/OteYLL5coDbSTf3G4L8lTUXTft232BRNhNUk1Xzn
 YlaLK0Bx/nFbJSqPuEkftiqvQzgqcbjS7t/+FM8jgqb1eydNTrJEp1Oo0BJpbyDvH7sw
 9eflU4Glkq2Rw4To7kyiSojh7/TCzKGm0G+HU2GeOy3tyRsli3jQ5N4UCwbfuWFQlIgR
 oxx7YSMCVXErXzOFZck6EsyK5w33RqUsObSoNU6Isy8fGnV8b3GaTe7okYAGPx5qODjU
 Ha/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OklEvV762+J2ILnH8xddQQnD38gLbqj6zsBgTDfKNHA=;
 b=BSEwmdrnRNahHqia2LUw8COY9n4VcOCzAHLWj0cGH6UBEhlshiCa1bM3Oz1bOycJ3u
 1AiVFG+ZAcnHfAsOlMA/c3XoK77PZUEdd61xn4CHi9PfFC6Mt7IxT0pmTTrG7EFe4I+p
 HWXc4xltY4y+Q0Ur63Xl3O8wPoTjD1nO2XLjC2uyf1dn1oGlKdNsKMVwDx9ke511bb38
 ltYblZLZGlYRDwnw24tNEjbr7o0DxijCxy3l7z5f3Zm+rgXjErN6RgOOMpIKqxZzZozA
 8DbwtE0huLcJTWUGHygN8egA0lTRQ9fumMFzVhCyU84mEkwWZmymVOqrSbotGIZfMO28
 IySA==
X-Gm-Message-State: AOAM531hC3VAK1eOKhyhrMQ11sUURo024n/E25WteR8EP9+K361U1win
 f7rK9mrUGHWhTdk0evF7J47/7g==
X-Google-Smtp-Source: ABdhPJxlGZ0uUCbqhna+Gtvt9tX4TprdLCQ17Xf0U7P3thvf6H1f4Vu2UXNB/HJh+naLXeqREhT4FQ==
X-Received: by 2002:adf:ff86:: with SMTP id j6mr3198399wrr.299.1630676035311; 
 Fri, 03 Sep 2021 06:33:55 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r26sm4192293wmh.27.2021.09.03.06.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:33:54 -0700 (PDT)
Subject: Re: [PATCH] tcg/arm: Increase stack alignment for function generation
To: Peter Maydell <peter.maydell@linaro.org>,
 "Richard W.M. Jones" <rjones@redhat.com>
References: <20210901164446.2722007-1-rjones@redhat.com>
 <20210901164446.2722007-2-rjones@redhat.com>
 <CAFEAcA8WD97HqQRRzB8Z1LVMCmkKZu3_EAQZM1HAMxccQ=PMnA@mail.gmail.com>
 <20210901183009.GG26415@redhat.com>
 <CAFEAcA-V7kp+HGBkHM_Zjfq28KhRReo74nowbtP4ZuZzVaw+kw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bdc8854b-fe24-fe99-1cfc-e84b9747e286@linaro.org>
Date: Fri, 3 Sep 2021 15:33:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-V7kp+HGBkHM_Zjfq28KhRReo74nowbtP4ZuZzVaw+kw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-stable <qemu-stable@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 8:41 PM, Peter Maydell wrote:
> On Wed, 1 Sept 2021 at 19:30, Richard W.M. Jones <rjones@redhat.com> wrote:
>>
>> On Wed, Sep 01, 2021 at 07:18:03PM +0100, Peter Maydell wrote:
>>> On Wed, 1 Sept 2021 at 18:01, Richard W.M. Jones <rjones@redhat.com> wrote:
>>>>
>>>> This avoids the following assertion when the kernel initializes X.509
>>>> certificates:
>>>>
>>>> [    7.315373] Loading compiled-in X.509 certificates
>>>> qemu-system-arm: ../tcg/tcg.c:3063: temp_allocate_frame: Assertion `align <= TCG_TARGET_STACK_ALIGN' failed.
>>>>
>>>> Fixes: commit c1c091948ae
>>>> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1999878
>>>> Cc: qemu-stable@nongnu.org
>>>> Tested-by: Richard W.M. Jones <rjones@redhat.com>
>>>> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
>>>> ---
>>>>   tcg/arm/tcg-target.h | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
>>>> index d113b7f8db..09df3b39a1 100644
>>>> --- a/tcg/arm/tcg-target.h
>>>> +++ b/tcg/arm/tcg-target.h
>>>> @@ -115,7 +115,7 @@ extern bool use_neon_instructions;
>>>>   #endif
>>>>
>>>>   /* used for function call generation */
>>>> -#define TCG_TARGET_STACK_ALIGN         8
>>>> +#define TCG_TARGET_STACK_ALIGN          16
>>>>   #define TCG_TARGET_CALL_ALIGN_ARGS     1
>>>>   #define TCG_TARGET_CALL_STACK_OFFSET   0
>>>
>>> The 32-bit Arm procedure call standard only guarantees 8-alignment
>>> of SP, not 16-alignment, so I suspect this is not the correct fix.
>>
>> Wouldn't it be a good idea if asserts in TCG dumped out something
>> useful about the guest code?  Because I can only reproduce this bug in
>> a very awkward batch environment I need to collect as much information
>> from log messages as possible.
> 
> Is the failure case short enough to allow -d ... logging to
> be taken? That's usually the most useful info, but it's so huge
> it's often not feasible.
> 
> Anyway, the problem here is that the arm backend now supports
> Neon, and it will try to do some operations on 128 bit types,
> where at least the loads and stores require 16-alignment. But
> nothing is enforcing that we have 16 alignment. (Without the assert
> we'd probably blunder on and fault on an unaligned access.)

Correct.

And while we could actively align the stack, that makes the prologue and epilogue overly 
complicated, and we can't just use pop {reg-list}.

My preferred solution is to add another per-backend define that says what the required 
alignment for vector stack spills, and then *don't* add the :128 bit alignment specifier 
to the vector load/store insns we emit.

I'll wait til I get home in 10 days or so before I tackle this.


r~

