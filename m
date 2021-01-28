Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24291307208
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:54:48 +0100 (CET)
Received: from localhost ([::1]:40220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l534h-0000zS-7K
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52zw-0006Pg-6b
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:49:52 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52zt-0005Ph-G9
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:49:51 -0500
Received: by mail-pg1-x532.google.com with SMTP id s23so2568120pgh.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=45HKNy8WCWZ85KF+zg6eFv2F4jWYn8ochLvmD9tik2A=;
 b=euVZ3zin8JKLNWj9sD3kyR/aaGs+X6STYIqLK6zWJghX91prPrnhNMz/DCLENGjJQ0
 u2UGDidDdbwJQAFefWYY6YbL8hhduMZaGlAlYCCZCVWIf6KzITs1Q6lm+NYtZKUhYaSg
 cRa9+abo0qhtdsjHsPmQ9jQskdAhukFOaSLvHRjqJts1DZRL+oNYv/cYm6EaypC/3drE
 0KidiI0Q0Bye57+b3Bsvw6cg8WDcf1OjojPIhqm+yGW1Jv6uQV2aHIbhNVgfiPvjPbzI
 LhBcRH4AbQ2nOKzhqnWuFfzeb00s05ac5wxpkxv36xR4RUMsAh3c8gidCGfLXxMZI2fz
 bXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=45HKNy8WCWZ85KF+zg6eFv2F4jWYn8ochLvmD9tik2A=;
 b=c4ABE0K9e91CDmOQajJBvLQ8cqv43eOOfkygBy5z+dHE17IsrjW/6CCeXmMCSNcxAQ
 ubgSccGwf9xTooaB5XiqIYOB31/N0EP8LGKfOHYayxgK2qYJnmBCnptmKYWHlOCcEiEd
 kIu0W8Ed6froNU7iuFhLiYj0t14ai2SLPELsQxmPTq8N89fmU4jSJgzVgblL3KAZ0waA
 8Yw1A6goTSFDhjuS5yAStAv/WZ+WZpBXd3kUliv5s3PXGyJLakZPsWTBgXl9Ey7DrC8J
 hdo2C6kEM3UUPUrUupUwBbElSijJ4LxFn/+kV2rsM+Zss07zHGp7XHeSbDGBmsmzkZMj
 ZW0A==
X-Gm-Message-State: AOAM530KeKjKpZdx2dLvpxZe0fOwh5Uuyd/0AcLJ4dflIsnF67Xk07Ad
 DuyxCpTFcxSwSg+7lKcySAMZHQ==
X-Google-Smtp-Source: ABdhPJxQ/KagAed0nIPsV7U+svgePfgT/SHnPnWyLG1lbyNXSzVoipxwPaFaIEwIm3euwcRHUYoqGw==
X-Received: by 2002:a05:6a00:15c8:b029:1b7:d521:32e9 with SMTP id
 o8-20020a056a0015c8b02901b7d52132e9mr14663350pfu.22.1611823787585; 
 Thu, 28 Jan 2021 00:49:47 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm4326994pjn.53.2021.01.28.00.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 00:49:46 -0800 (PST)
Subject: Re: [PATCH v3 18/21] linux-user/aarch64: Signal SEGV_MTEAERR for
 async tag check error
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-19-richard.henderson@linaro.org>
 <CAFEAcA8rXQ76AVpqHwum_XGh13u+vwkZw_yOxRKvfyqbV3_GBQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b81f168c-dfe3-5d59-b1a2-1c3df97f7105@linaro.org>
Date: Wed, 27 Jan 2021 22:49:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8rXQ76AVpqHwum_XGh13u+vwkZw_yOxRKvfyqbV3_GBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/22/21 3:59 AM, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 22:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> So when does the real kernel report async MTE exceptions to userspace?
> The commit message would be a good place to briefly describe the
> kernel's strategy and where QEMU differs from it (if anywhere)...

I can add that, sure.

>>          case EXCP_INTERRUPT:
>> -            /* just indicate that signals should be handled asap */
>> +            /* Just indicate that signals should be handled asap. */
>> +            check_mte_async_fault(env, &info);
>>              break;
>>          case EXCP_UDEF:
>>              info.si_signo = TARGET_SIGILL;
> 
> So this doesn't guarantee to check the async-fault status on
> every exit from cpu_exec(), which means we might miss things.
> For instance I think this slightly contrived example would not
> ever take the SEGV:
>     STR x0, [x1]   # with a bad tag
>     YIELD
> l:  B l
> 
> because the STR and YIELD go into the same TB, the YIELD causes us
> to leave the TB with EXCP_YIELD, we don't check for an async fault
> in that code path, and then we'll go into the infinite loop and
> have nothing to prompt us to come out and look at the async fault flags.

I'll add that test case to the smoke test.

> Does it work if we just always queue the SEGV on exit from cpu_exec()
> and let the signal handling machinery prioritize if we also pend
> some other signal because this was an EXCP_UDEF or whatever?
> It would be neater if we could keep the fault-check outside the
> switch (trapnr) somehow.

I would think so.  I'll try that.

>> +#ifdef CONFIG_USER_ONLY
>> +        /*
>> +         * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
>> +         * which then sends a SIGSEGV when the thread is next scheduled.
>> +         * This cpu will return to the main loop at the end of the TB,
>> +         * which is rather sooner than "normal".  But the alternative
>> +         * is waiting until the next syscall.
>> +         */
>> +        qemu_cpu_kick(env_cpu(env));
>> +#endif
>>          break;
> 
> This does the right thing, but qemu_cpu_kick() is one of those
> functions that's in a category of "not used much at all in the
> codebase" and which always make me wonder if there's a reason.
> (In particular there's exactly one use in the whole of target/
> right now.) I suppose the case of "helper function wants to cause
> us to leave the TB loop but not to abort the current insn" is
> an unusual one...

Exactly.

Usually something in target/ calls (via mmio or whatnot) something in hw/ which
raises an interrupt, which does the kick.


r~

