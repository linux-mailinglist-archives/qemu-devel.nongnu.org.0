Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB03CC698
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:19:48 +0200 (CEST)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4sex-0006vs-2U
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4sdX-00061D-Ho
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:20 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4sdR-0001aY-Aj
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:19 -0400
Received: by mail-pf1-x433.google.com with SMTP id c1so8795942pfc.13
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q2zfI1kdXtWYKF44TJnsDDzOCpLtyTiCVP4mjS27wRk=;
 b=mfzPv0P2HNDpNJW85rJ0oVNDLU9nzd9QcUOynIXiRKbKsJbApUXvPXeNYIPSnKzNlA
 r7XTtplKtt3kSXuet5Vp5/k2xLcVPwJyvax4IC5H1hu8/PNlA3eeM6Y3CV8eGfwIcjW+
 fsFpkBhS5JHrvdfBRKau21hvpodlpVZENTHrCmNbqddjYiF+seguO6XMHNd5IOvZOb/V
 tNTBLcHm3CxXvQ2w5Y8iuEdQSHF+DNfKna7n5EKaxikVRcDq2z5vYuf0pQiFmH9/ioKu
 3cMJ1UVTp6CMvAo9SD+5oGlN59Q/00b8/IJn6DxizSGax/S4lzqqG9ETRymCM4nAwh9F
 Ehxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q2zfI1kdXtWYKF44TJnsDDzOCpLtyTiCVP4mjS27wRk=;
 b=Cm0kyLtIWVTGwvBuJ/4NP71ulh69NNqic0hAd4d2TgfYtPzFmlPPUongLWSpYhzv5y
 8fOqUFbcmCHBzutavgQAwXmyLnRFlBODMDgh8LVMXhoiV8t7g4xqnBZlBaQ04JDPWoI3
 9wb3D41Ny0loEcc0BA/pW2YiS7CFq0GuKTAyGxNjhskzbEdsU02blj2nlz8JaMmu/6l2
 quiHJWtEKHbt7xj/dJI7EaXK6AYnZ8v/4ax5N2TeODdXPAeH//3aPZJf61Esf4wHq6My
 5MpSJd68nyURE2y8dLUItjhDJK9vpqUt4oWodW9nXDnBLpIZLfCtfguTx1Y+KKe9fSk8
 7yyg==
X-Gm-Message-State: AOAM532Ei5Upqs1hYYZm8bjj0OWUCZLLRH/UjJBUd5JCNQCKg+3q22wL
 rF4Dyrv0SjFvUpEOWgFXxD/A5zhAZlk0Fg==
X-Google-Smtp-Source: ABdhPJy3YLg4FsCjuuygki7BAuJgfA/Umeu9lOMHzkvM80/CDQMIxLcvjlCG9u0/lDkF68QHtOmO9g==
X-Received: by 2002:a62:a516:0:b029:333:1995:5e75 with SMTP id
 v22-20020a62a5160000b029033319955e75mr15405754pfm.67.1626560291697; 
 Sat, 17 Jul 2021 15:18:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u15sm15717712pgf.77.2021.07.17.15.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 15:18:11 -0700 (PDT)
Subject: Re: [PATCH for-6.2 21/34] target/arm: Implement MVE VABAV
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-22-peter.maydell@linaro.org>
 <619cc6fe-c865-2070-e52f-285882b8ed2e@linaro.org>
 <CAFEAcA9DER=N8meJ_8oy6z3wN8n7Rot-ssmJ0dA-Z1Di-8Q4Rw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <654a95b5-f626-a99e-98c3-215b7ea54c2d@linaro.org>
Date: Sat, 17 Jul 2021 15:18:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9DER=N8meJ_8oy6z3wN8n7Rot-ssmJ0dA-Z1Di-8Q4Rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 3:13 PM, Peter Maydell wrote:
> On Sat, 17 Jul 2021 at 21:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 7/13/21 6:37 AM, Peter Maydell wrote:
>>> +#define DO_VABAV(OP, ESIZE, TYPE)                               \
>>> +    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, \
>>> +                                    void *vm, uint32_t ra)      \
>>> +    {                                                           \
>>> +        uint16_t mask = mve_element_mask(env);                  \
>>> +        unsigned e;                                             \
>>> +        TYPE *m = vm, *n = vn;                                  \
>>> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
>>> +            if (mask & 1) {                                     \
>>> +                int64_t n0 = n[H##ESIZE(e)];                    \
>>> +                int64_t m0 = m[H##ESIZE(e)];                    \
>>> +                uint32_t r = n0 >= m0 ? (n0 - m0) : (m0 - n0);  \
>>
>> Any particular reason you're not using TYPE for n0 and m0?
> 
> I wanted to definitely be doing the subtraction with a signed
> type wider than the inputs, because that's the way the
> pseudocode effectively deals with it, and I didn't feel like
> thinking through whether using the smaller and possibly
> unsigned types would DTRT :-)

Fair enough.  Now that I think of it, I would expect the compiler to narrow the operation 
based on the result type.  So, unconditional r-b.

r~

