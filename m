Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E24381BF3
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 03:22:50 +0200 (CEST)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li5UX-0003jD-8P
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 21:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1li5TS-00033o-TI
 for qemu-devel@nongnu.org; Sat, 15 May 2021 21:21:42 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:35457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1li5TR-0008PL-7l
 for qemu-devel@nongnu.org; Sat, 15 May 2021 21:21:42 -0400
Received: by mail-qk1-x72d.google.com with SMTP id x8so2670676qkl.2
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 18:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=22+RGKlgmGAZ3ughbLPGTzsHTOino/VOj1Ts1veBsyI=;
 b=GoDGs2FrycaDAldS9v3xoY3z2cHqMaVqynj9HTT79NzGEl6G3mBr4FHKnfSaLuOq7X
 DvRkuo40MYCXIx54TUVkz7VEkds874bWxIwv8OeA4fVa2lfn1OHHqya2SkqutvaD2Mch
 6XjwUBk4gt1vxj2FrXonIbl52zx+Lr6FPa5unAQgOeF8VnSL7A21wwpQC+5pBxM2pY7g
 RNDalrFCtv+dIqM/Ok/ENlTDU6fnQcdgn7aKvEaMBzXKqna4L8Dr6TUxG5083eL4opHQ
 cf4bJXaj6yY1VblzorM4JNgOqHmVLIZ08ULw82i0aSv9sEjZW4wGdpS1oYCFiGRo3No2
 2hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=22+RGKlgmGAZ3ughbLPGTzsHTOino/VOj1Ts1veBsyI=;
 b=fjXD47OFZ1MsnBqv3qm69tq0Ts98DBvX9amYsWE4ZoO7cgpFWoZrPnULIm5vfrU+ld
 Dx+WR8HACEYO53dQmLmACVHMQzaQ85dUn8G+ey2PtvYuid9lGD4fsPVP40t4aTQ8LN5C
 j5RNEBJwV5+twGzjQGF7GgMiISvBxu3G3gQ07mWBDMSwhYVjOgBTHPSFb3qJ1m6zQJt5
 i8n2kyS+o1xBmT0dLdMA0xiw7UEaYgNW/29uAjit5h3gmrF2Ol9oygNa4teY8j7h6JgG
 TeA0wkuu42NFfcqQRNKN+v6a3zzTTJuXLZKaVVsT2pF3EUWOwJnDTgVcdt0XINNlEFd8
 AQQg==
X-Gm-Message-State: AOAM530MF9fXThElr+8z1avKsQQ/Kn66Slh5KxJ/f2qqFPpTdI3ghBP4
 PjfgLvtps0+N2/Tx8zxhfBC2VNTh1BPTQdGFwkI=
X-Google-Smtp-Source: ABdhPJyZYnaTzXEeFVNAO78nGOdasy+HFmPIOsfNpjCDg2ecyuHda8Y49YwADaeawfpJ6SIJUvIEQA==
X-Received: by 2002:a05:620a:2f9:: with SMTP id
 a25mr38706415qko.401.1621128100074; 
 Sat, 15 May 2021 18:21:40 -0700 (PDT)
Received: from [192.168.182.172] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id a195sm7711320qkg.101.2021.05.15.18.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 18:21:39 -0700 (PDT)
Subject: Re: [PATCH v6 07/26] tcg: Add tcg_call_func
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-8-richard.henderson@linaro.org>
 <0de997d8-407d-652c-f0ac-cce3365297ea@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5317b096-b9db-6601-172d-a7f48219d5d0@linaro.org>
Date: Sat, 15 May 2021 20:21:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0de997d8-407d-652c-f0ac-cce3365297ea@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 4:50 PM, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 5/3/21 1:57 AM, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
>> ---
>>   tcg/internal.h | 5 +++++
>>   tcg/tcg.c      | 5 ++---
>>   2 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/tcg/internal.h b/tcg/internal.h
>> index c2d5e9c42f..cd128e2a83 100644
>> --- a/tcg/internal.h
>> +++ b/tcg/internal.h
>> @@ -32,6 +32,11 @@ typedef struct TCGHelperInfo {
>>       unsigned typemask;
>>   } TCGHelperInfo;
>>   
>> +static inline void *tcg_call_func(TCGOp *op)
>> +{
>> +    return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op)];
> Why not return tcg_insn_unit* type?

That's a fairly tcg code generation type -- this is used for more than that.  I 
think it's more natural to use void* when we don't know what the real type.


r~

