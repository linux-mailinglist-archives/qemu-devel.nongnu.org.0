Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29B042E54C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 02:41:11 +0200 (CEST)
Received: from localhost ([::1]:39814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbBHZ-0005rq-Ve
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 20:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBFe-0004w8-LN
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:39:10 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBFc-0006Rf-6M
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:39:10 -0400
Received: by mail-pg1-x535.google.com with SMTP id m21so7021415pgu.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 17:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8h2TMpTm8qpVKS5H5RPbH+5xidE/gtytOjyG4E/mFWI=;
 b=LAo83OfA5reUUBkW1GklU6eS20v1Vqo0LBWhApj2j6FuopBIyq+LYCSStTn7s4aq+q
 bTWYDOyczxKrGH/KPEaTC2pn5FnMO+e+ELBDlGCUx0UJeD+Akibxx7k/roboPF4IEfF1
 BK6hRwaXez1mZoRa7dPqODfGNP3UtsiIKCb/uk6xUCSjHDDq6ZSfvOqZBwhtJU7S1ljy
 Zkn7jDv4JunXqIprZcS87z5LGF6+eXHDojTv2EMHgco+H90ld7GOxRaVzNbtgjbbR4bO
 CHqbabCyBJoI3Tm1wuwL5TAIlSuS3jcEi08qYdtrI0rplzO2iYGL/f8TtF1O62yhUUoi
 guKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8h2TMpTm8qpVKS5H5RPbH+5xidE/gtytOjyG4E/mFWI=;
 b=MRij1YQz4gpa7x6OKpYue97Sbh3lk70fv0Tgfqi7aoXWn29BCjPbWGaNZeLBpsUw1N
 jvpsbhsXlbPFnWj2NeOqfuG4y1gPYfPqo2V3TwpGuS3NLjck71/q1JtpTgEkIEJ+ny0y
 cdZwcAYe/tNJvIOKwYxdQYH+d5D45/rh8q1Li4OO63Bbx3mg7eh3/v4SoDB/Zc5q/HJP
 aMWgYsybL0IQsTduuH6tEvWiLieDaQpLKL3jzH/okbgA5PsYsawZjNorw15woWRHbY9M
 9P3r+E6+tNt34HikQNORJ7SZNtJywXVcUOZLjMXwXXQcxaIY/HaB2GEyKHo+3ogL5Za0
 l+OA==
X-Gm-Message-State: AOAM530tiLNj4agPsuFi2BDSW5518G13YFw1szn9fdW2z/E4yxMCrBTT
 6hsK6132AAn9O67d9z0qNkcvWg==
X-Google-Smtp-Source: ABdhPJzBwtqELXy1QsDzoZwPlB/ROb9tyCfJwS9LrEYmKqJBh3qngrSiDebtdg7RqoGxagTmEwE/xw==
X-Received: by 2002:a63:2361:: with SMTP id u33mr6631108pgm.369.1634258346347; 
 Thu, 14 Oct 2021 17:39:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q1sm104429pgt.90.2021.10.14.17.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:39:05 -0700 (PDT)
Subject: Re: [PATCH v2] Partially revert "build: -no-pie is no functional
 linker flag"
To: Jessica Clarke <jrtc27@jrtc27.com>
References: <20210805191430.37409-1-jrtc27@jrtc27.com>
 <20210805192545.38279-1-jrtc27@jrtc27.com>
 <163425424356.2158.16851994446465453609@amd.com>
 <5c3e7913-3a4e-fe78-fd88-ba550e119ddb@linaro.org>
 <CD50CA90-5028-487B-A3FD-CF320ECD0949@jrtc27.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <439da4ba-3c91-281a-0d4f-d7eb0631b788@linaro.org>
Date: Thu, 14 Oct 2021 17:39:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CD50CA90-5028-487B-A3FD-CF320ECD0949@jrtc27.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 5:22 PM, Jessica Clarke wrote:
> On 15 Oct 2021, at 01:12, Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> On 10/14/21 4:30 PM, Michael Roth wrote:
>>> Quoting Jessica Clarke (2021-08-05 14:25:45)
>>>> This partially reverts commit bbd2d5a8120771ec59b86a80a1f51884e0a26e53.
>>>>
>>>> This commit was misguided and broke using --disable-pie on any distro
>>>> that enables PIE by default in their compiler driver, including Debian
>>>> and its derivatives. Whilst -no-pie is not a linker flag, it is a
>>>> compiler driver flag that ensures -pie is not automatically passed by it
>>>> to the linker. Without it, all compile_prog checks will fail as any code
>>>> built with the explicit -fno-pie will fail to link with the implicit
>>>> default -pie due to trying to use position-dependent relocations. The
>>>> only bug that needed fixing was LDFLAGS_NOPIE being used as a flag for
>>>> the linker itself in pc-bios/optionrom/Makefile.
>>>>
>>>> Note this does not reinstate exporting LDFLAGS_NOPIE, as it is unused,
>>>> since the only previous use was the one that should not have existed. I
>>>> have also updated the comment for the -fno-pie and -no-pie checks to
>>>> reflect what they're actually needed for.
>>>>
>>>> Fixes: bbd2d5a8120771ec59b86a80a1f51884e0a26e53
>>>> Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>
>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>> Cc: qemu-stable@nongnu.org
>>>> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
>>> Ping. --disable-pie builds are broken on Ubuntu 20.04 without this regression
>>> fix. Looking to include it for v6.0.1/v6.1.1.
>>
>> Sorry, missed this the first time around.
>>
>> I think a better fix is to remove the direct invocation of ld in pc-bios/optionrom/Makefile, and instead rely on the compiler driver.  All of the local ldflags can be passed through via -Wl, but we'd get no-pie via CFLAGS_NOPIE.
> 
> I am not changing anything about pc-bios/optionrom/Makefile. Whether
> you want to remove direct ld invocation or not, these changes are
> needed to reinstate --disable-pie support for everything else, which is
> currently broken. The only reason to mention pc-bios/optionrom/Makefile
> in the commit message is to explain why the original commit did what it
> did and what part of it is legitimate (even if there are better ways to
> have done it) and thus not reverted in this patch.

Ah, quite right -- currently configure fails.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

