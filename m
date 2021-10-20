Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866843569E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 01:51:56 +0200 (CEST)
Received: from localhost ([::1]:40628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdLNC-0007YF-R3
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 19:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdLLX-0006c7-32
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 19:50:11 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdLLU-0008Rr-QA
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 19:50:10 -0400
Received: by mail-pg1-x531.google.com with SMTP id m21so23894513pgu.13
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 16:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Eh6RsZOtXlULQ3CSFM6Kk/ru6lL3UCxwBoP+6e7jkM=;
 b=nxiEHYDf1wZ8csvbXaiqbyBpEGPN/Shk1uLijUFwQp5ITTcwDMRB8rGShggw8nr2Nv
 Lf1OhQTL93cioSUQp9MCcczwmXi/XfpdTKb1hZD9SqP2SCBAVrvlL0Uw7dn8tXx36YO5
 qmg+oF7IieYJaLNjfezewrVLp2KdB26JGHLFaL8zjN/GPvkOqos1QLIVN8Ckq2mHrzzZ
 kA3MLPe8tyfQtQRt1+jwcZ1mopdkMVOXzZPEMkCdRSl6NXhBHVUmbcMrsNCMsQwdC+ee
 VTWSG9W3OsHA0ACLOncqQoL2v12ukN8V+ycfDoDYSE4NIblOHC9fn02sNl4rYq9QK1Jv
 8gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Eh6RsZOtXlULQ3CSFM6Kk/ru6lL3UCxwBoP+6e7jkM=;
 b=Fg1qFdtyIJxMQyOMfiqgGHiDMM4gBz2bOlObm0Vs29eKidmvTUQsV/DgbKJq8PTUQG
 ZDEIqirr6xbJGjqY1fbOd3zXaB7DkYnLG1ixxrIqYWAtbaSGquNozDjr/RN7A1TKa2t6
 D8/RfG1FEj9kVisljn5hoh2bJq/aH6wvxFTfZlIdpodp7Pt+ohBDVVccHaR4sV8tDmWV
 y5vNS0I+X2IHXJPfBVph8FEUpSZGdVQeYODvZBBsNSWYcwStafUou5PzNg3n/zFYQYLD
 75VpLoeeciZZ2xmIKMFyos1EoPvH2NE8xyE967v9HMO+6XKlJphl9qvWSo6wMyiGqK7m
 k9hw==
X-Gm-Message-State: AOAM533E1HWiB47AaZgohIBjnODHficpozZBHAwfG1L5FT5byg/YASQ/
 Rc9gc1nD1rlmbiP9xPzQxDK+Kw==
X-Google-Smtp-Source: ABdhPJwx96C69+XZJu1GZh1japHqs8hXPKpFUFd7qWyAUx5yw5vHTfUsNnRYgrx6ergmiygYKo0JXw==
X-Received: by 2002:a05:6a00:c8a:b0:44d:8985:ff4f with SMTP id
 a10-20020a056a000c8a00b0044d8985ff4fmr2324343pfv.1.1634773806365; 
 Wed, 20 Oct 2021 16:50:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm3725643pfc.69.2021.10.20.16.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 16:50:05 -0700 (PDT)
Subject: Re: [PATCH v2 00/48] tcg: optimize redundant sign extensions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <87lf2nvfip.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <50502145-2e5c-198e-680f-7bcbdd6c590b@linaro.org>
Date: Wed, 20 Oct 2021 16:50:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87lf2nvfip.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: qemu-devel@nongnu.org, Matt Borgerson <contact@mborgerson.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 9:13 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Currently, we have support for optimizing redundant zero extensions,
>> which I think was done with x86 and aarch64 in mind, which zero-extend
>> all 32-bit operations into the 64-bit register.
>>
>> But targets like Alpha, MIPS, and RISC-V do sign-extensions instead.
>> The last 5 patches address this.
>>
>> But before that, split the quite massive tcg_optimize function.
> 
> BTW this reminded me of a discussion I was having on another thread:
> 
>    Subject: Re: TCG Floating Point Support (Work in Progress)
>    Date: Fri, 01 Oct 2021 09:03:41 +0100
>    In-reply-to: <CADc=-s5wJ0cBv9r0rXaOk0Ys77Far7mgXq5B+y4KoNr937cC7A@mail.gmail.com>
>    Message-ID: <87y27d5ezt.fsf@linaro.org>
> 
> about a test harness of TCG. With the changes over the years are we any
> closer to being able to lift the TCG code into a unit test so we can add
> test cases that exercise and validate the optimiser decisions?

Nope.

I'm not even sure true unit testing is worthwhile.
It would require inventing a "tcg front end", parser, etc.

I could imagine, perhaps, something in which we input real asm and look at the optimized 
opcode dump.  E.g. for x86_64,

_start:
	mov	%eax, %ebx
	mov	%ebx, %ecx
	hlt

should contain only one ext32u_i64 opcode.


r~

