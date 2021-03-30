Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BEB34F1D2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 21:51:45 +0200 (CEST)
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRKOt-0005X2-7A
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 15:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRKNA-0004tL-AV
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 15:49:56 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRKN6-0003sl-Hh
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 15:49:56 -0400
Received: by mail-pg1-x52b.google.com with SMTP id v10so12452008pgs.12
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 12:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yK/NKdQiNaoZI7ey2aqBTCy6u8EIOuJy45NdyRfEZyw=;
 b=sgTG0AAnoQWCg+JlXjxhX5mMUBaL55ezeCTxdkzQpUJDEzOoHq1BkGSFBrgX8dp9SO
 bhpH+TR0tN62Z5KDSriyRrA0w7iJXFYfoXysuMIZBMjLKJQZywnYsNrvh45Fch1EBMwb
 5ujOvAT5XsgqCY1R/JgWm0mDbaJ0JJsWtCyH0Y5V8F2Jog2IxviPLLa/jmNbpX3CxQyS
 GQD9JOgOsjh1mCBnq20qN9V3g+/NTnuT7xoKYyvnco7Gt2RSLPhzzhk7ykGhYkGtKrOT
 LCI2+apjJZT5rH3/dIdDXCQaPOLcYDUsCh6pCKFS99kXbUT5w9L5B6hBocnjsGA5zGMU
 swWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yK/NKdQiNaoZI7ey2aqBTCy6u8EIOuJy45NdyRfEZyw=;
 b=c2Xx/rfV0bGp7BNOoOspJ8RDT+CoMOofIOCwwkd/djxt3snRqJ1C+Z+wCXDt1M+Lus
 /OTnAboMAG3saOEB1BFzOEr+hEGZKwXpbAhFVMHNqyNWhS8dG2nm/bJ6AILDCm0eFOSt
 k9vBITR4fKZEZ1gcloUDMcb1KfJZXumCN6NfvSjpSeNbH8x0737vGOJPb3z5gFiEsv//
 S0ZyUmAf3a66o2K5V2Zbwz2iWMZVtgP0MiRF040bvmzP2Bs1uFI2HVhsS7Z+i0UEYJrj
 b94I2WIMCfLYkTUHCNBo/4xVc6dXAEZwg39r/q1Oq3EYTBPpM88cwAxgIeIf0uVtGRbm
 y0zg==
X-Gm-Message-State: AOAM533MX+Tm4+/tZjcphMlN7EcZoekzFhk5fOCrLiZyHo+RtqGvw/f7
 lzLGrZfuE8IHw5y+Q2YtWvr86D8YRhcuFHmC
X-Google-Smtp-Source: ABdhPJzL21Yw6EA2kR7bSpCfRLLgLyR4jbgjxz8CettYIeG2OpSWq3001s+5KPJRfJ4i3sSF7MG6cQ==
X-Received: by 2002:a63:5807:: with SMTP id m7mr29657295pgb.73.1617133791024; 
 Tue, 30 Mar 2021 12:49:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w188sm21359542pfb.4.2021.03.30.12.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 12:49:50 -0700 (PDT)
Subject: Re: AUTIA authentication sometimes fails
To: Peter Maydell <peter.maydell@linaro.org>,
 Derrick McKee <derrick.mckee@gmail.com>
References: <CAJoBWHx5DM=zhj10j1ai5T_LO9ScAhFzUezuhGu6a73vn=4_Rg@mail.gmail.com>
 <CAFEAcA8KCJTwsb2YYoU3d_PbO=KW_ytSJXHLZZTkukVX6YzCPQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82f550a0-7ef0-acd0-bbe1-5fae9b7fbcff@linaro.org>
Date: Tue, 30 Mar 2021 12:49:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8KCJTwsb2YYoU3d_PbO=KW_ytSJXHLZZTkukVX6YzCPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 3:04 PM, Peter Maydell wrote:
> On Mon, 29 Mar 2021 at 21:07, Derrick McKee <derrick.mckee@gmail.com> wrote:
>>
>> Hi,
>>
>> I am running across a scenario where a PAC signed code pointer (using
>> pacia) sometimes does not successfully authenticate despite the signed
>> pointer and the salt used to sign the pointer are correctly given to a
>> autia instruction.  Only one particular pointer fails, while others
>> are correctly authenticated.  Unfortunately, I can't provide a simple
>> use case, because the behavior is part of a running kernel, and all
>> the pointers involved are kernel space pointers.  An example of what I
>> am seeing (not guaranteeing correct assembly, just a gist):
>>
>> mov x9, 0xffff800009200000
>> mov x10, 0x20001
>> pacia x9, x10  // x9 contains 0xff90800009200000
>> ...
>> mov x9, 0xff90800009200000
>> mov x10 0x20001
>> autia x9, x10  // x9 contains invalid pointer
>>
>> However, this same code with different pointer values correctly
>> authenticate.  Is there something specific about the kernel and PAC
>> authentication that I am missing?  Thanks.
> 
> cc'ing Richard, but I suspect you'll need to provide more detail...

Definitely.

I transliterated your code above into a stand-alone test case:

#include <assert.h>
#include <stdio.h>

int main()
{
     unsigned long p0 = 0xffff800009200000ul;
     unsigned long salt = 0x20001;
     unsigned long p1, p2;

     asm("pacia %0, %1" : "=r"(p1) : "r"(salt), "0"(p0));
     asm("autia %0, %1" : "=r"(p2) : "r"(salt), "0"(p1));
     assert(p2 == p0);

     printf("%016lx\n%016lx\n", p0, p1);
     return 0;
}

In your comments above, 0xff90800009200000 is the signed pointer, with the top 
16 bits (ff90) bearing the signature.  This exact value cannot be obtained 
without knowing the contents of the encryption key and will of course vary from 
run to run.

The test case above does not fail.

So: more details about the context are required.

I must say that my first guess is that you're signing with one encryption key 
and authenticating with a different encryption key, with the kernel having 
performed a context switch in the interim.


r~

