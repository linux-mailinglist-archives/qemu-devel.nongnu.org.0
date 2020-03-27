Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A583196123
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 23:28:50 +0100 (CET)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHxT7-0007vB-3Q
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 18:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHxSB-0007Lo-IX
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:27:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHxSA-0006wU-Ao
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:27:51 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46300)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHxSA-0006t1-52
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:27:50 -0400
Received: by mail-pl1-x643.google.com with SMTP id s23so3959196plq.13
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 15:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ApUHfbrIOZ3W/pW4BhCSTPhQmC30MV5W3zIb/qeegfI=;
 b=IlOcP9xe5gsLfUFQ4QhkGZYl3httI7Bs4rbSj09n4coRY51FSvm10gcM7Tx7gq2FZL
 j6Xs2Y0uEHgspEsao1gu003t4uKxjHPMsqJ/OMjTeuuViHmaYlwsjFSmP3+VX/RL5FIP
 Rs84fK/xlscwuJLkiNM61cj+3gdh2m0Zx29es0uK6RO3bumWFza/yLwI3KJaBRVVUoBz
 8PCdW2NHn2LCmy5rGW1f3scRtXo1tMhyJN27nW+9f2ZeFF4Ubo+pJu+TU2tqM8p8OBJn
 q1qQNQANLkaC3KA6Q3SKuf/V+K8RD3qq7jQfdiUbiMxGKJ6+NNYjmXszeWeES73cXC02
 8XcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ApUHfbrIOZ3W/pW4BhCSTPhQmC30MV5W3zIb/qeegfI=;
 b=kmEoDTWmppb6Gfsw2OZ3I3s5j2UYOSrPylwVisBaKS03b3XHZqgIlZJGRjq94m8bh7
 tmNngkSvO93C10oqwZzyKp0m3CaHu1f0M9ZN6augxGGw46fFlSL6RrgoZMYuCzbpAluZ
 3Nwp29JBijnnuhiSssSOVku+9zlNRjyQwdgOWxT7tr2ScX1XdCuCuZ8h6DUqAzrYeUtl
 TmKv1M+MYgwROmI3tZgt3gFi4CwDHsWYXenmvNeefVdmETfJLL8G5V5V1ZcAxVDSZ77+
 2EWpTL/4hvXcbZl6kkwKBAjaZyd8gjGcqy5aNGHv9sX+RrAIkQWherekrpGDc1GVXoAQ
 edjA==
X-Gm-Message-State: ANhLgQ3HDeUfKOY4T1wo0qjGyHy641drnOExRFvzbS1Ytg/HyjDSEK4q
 cGCOE0JnCIsxWih0+v9w2AaPFw==
X-Google-Smtp-Source: ADFU+vtITOjV+VGlQRiDkpyc6/XILGAKkxyvB60QpjO/rg4hYj5NOBkGXKv2qlIPFS7ui93SAmQnrw==
X-Received: by 2002:a17:902:9f84:: with SMTP id g4mr1293755plq.2.1585348068596; 
 Fri, 27 Mar 2020 15:27:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id 8sm4945875pfv.65.2020.03.27.15.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 15:27:47 -0700 (PDT)
Subject: Re: [PATCH v1 5/7] fpu/softfloat: avoid undefined behaviour when
 normalising empty sigs
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200327094945.23768-1-alex.bennee@linaro.org>
 <20200327094945.23768-6-alex.bennee@linaro.org>
 <CAFEAcA8RvbdHMWCe101CyTWcA7T28-MtYwMFNZ5Fnh2=SuKcDw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91caa195-fe72-d533-1da2-4bbdeccb4e38@linaro.org>
Date: Fri, 27 Mar 2020 15:27:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8RvbdHMWCe101CyTWcA7T28-MtYwMFNZ5Fnh2=SuKcDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/27/20 3:09 AM, Peter Maydell wrote:
> On Fri, 27 Mar 2020 at 09:49, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> The undefined behaviour checker pointed out that a shift of 64 would
>> lead to undefined behaviour.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  fpu/softfloat.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
>> index 301ce3b537b..444d35920dd 100644
>> --- a/fpu/softfloat.c
>> +++ b/fpu/softfloat.c
>> @@ -3834,9 +3834,14 @@ void normalizeFloatx80Subnormal(uint64_t aSig, int32_t *zExpPtr,
>>  {
>>      int8_t shiftCount;
>>
>> -    shiftCount = clz64(aSig);
>> -    *zSigPtr = aSig<<shiftCount;
>> -    *zExpPtr = 1 - shiftCount;
>> +    if (aSig) {
>> +        shiftCount = clz64(aSig);
>> +        *zSigPtr = aSig << shiftCount;
>> +        *zExpPtr = 1 - shiftCount;
>> +    } else {
>> +        *zSigPtr = 0;
>> +        *zExpPtr = 1 - 64;
>> +    }
>>  }
> 
> Ah yes, I saw this one in Coverity: CID 1421991.
> 
> RTH marked the Coverity issue as a false positive with the rationale
> "﻿﻿﻿﻿We assume an out-of-range shift count is merely IMPLEMENTATION DEFINED
>  and not UNDEFINED (in the Arm ARM sense), and so cannot turn a 0 value
>  into a non-zero value."
> but I think I disagree with that. We can assume that for the TCG IR
> where we get to define shift semantics because we're doing the codegen,
> but we can't assume it in C code, because it's not included in the set
> of extended guarantees provided by -fwrapv as far as I know.

Perhaps.  Of course we also know from our broad knowledge of architectures,
that a compiler would really have to go out of its way for this to happen.

I really hate C in this way, sometimes.

I wonder if I have the energy to petition the committee to drop, for C202? all
of the "undefined" nonsense that only applies to sign-magnitute and
ones-compliment computers, which haven't been seen since the 70's...

> That said, is it valid for this function to be called with a zero
> aSig value ? I think all these normalizeFloat*Subnormal() functions
> assume non-zero sig input, and the only callsite where it's not clearly
> obvious that this is obvious that the sig input is non-zero is the call to
> normalizeFloatx80Subnormal() from addFloatx80Sigs(). So perhaps we
> just need to check and fix that callsite ??

You're right -- addFloatx80Sigs is the only use out of 26 that doesn't have a
preceding check for 0.


r~

