Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5BA44219D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:22:35 +0100 (CET)
Received: from localhost ([::1]:52026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdpC-0004bX-Ej
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbfE-00058B-P0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:04:08 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbfC-00023Q-Og
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:04:08 -0400
Received: by mail-qk1-x735.google.com with SMTP id bl12so3065706qkb.13
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fxAhSpNzwoBCKPYlXtNOpAL/WcP7YJtMKItP7K2fWwA=;
 b=gg9uMag2mCwwu4kCgNOx5bgM597WR1iryAVd0cGklk0FMkJ/nBQQPG7tdps63Tuxdw
 NBSUQbZGwziGhbgMq+xKPBs+sh31/qFPjoddfhmlVPy65fKaGoAoxkabDFE7f6Ye2VYX
 aX5M/zHiOb6/EA53sp9LrXGUbXXYBE6xvZfbJYXnVUrHYBuj5BYR0Ojovp7Co862+3oa
 dr0402F/8CmaLfRSps/2j5VWIrSQvRS5sJ/mAGrA/pHScaqYxqoSn/juWAXNwR2GkaNC
 PPsNnQ1RisCu6KhcJmHO7ODkopy1ckZYB9Xd8myW2TdvtO/KjitgRgs35Ogo2a5vXm0w
 3Smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fxAhSpNzwoBCKPYlXtNOpAL/WcP7YJtMKItP7K2fWwA=;
 b=3YTV5J0SY3ZRTOe8Ma1r1iEgV/7x0rvqq/Q+NsB644SHVe5C6IgL2Lp8xrAWmc6+mP
 6u+Pgo3zMWpqKZNfGESJamxzt3NbTqdsQVBQhYfOT5KyTWn6wYDI3qbHY7jpzK4fl37L
 4Rw0edzJI1MZYvQeEk3igAt8CRTU+ND6uwhu/5OiIVGHhejshAqvaR5PxL4/1ldPugaG
 s6NfS3jGqkwh0vU1UjNWM9CmbHEtTRNWlORIhERitg+dyqJkSAhQLqXA2DeIG7leJB75
 xcuD79I4SpyfXX0xb2jPpdKEDUI7NJeuwilnpsjPllaLNp6dDm6sl6TA1qtGX1365Ewh
 TxAA==
X-Gm-Message-State: AOAM532e8MZg5FglZrr7qrpy4kZwXGPxN/wP0uqvdaX1RZApb5Iayt4t
 3C+3VNljOe8AvXg8UNcnxLTTdQ==
X-Google-Smtp-Source: ABdhPJyAn5HpGlBpP5CYzPN7j6kabWZVnlwWdsw5MY6Czbep8+ywBwphHlIRkhdmL6/eWYftNgm4Pg==
X-Received: by 2002:a05:620a:4049:: with SMTP id
 i9mr3702611qko.320.1635789845644; 
 Mon, 01 Nov 2021 11:04:05 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id f23sm10376180qtq.40.2021.11.01.11.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:04:05 -0700 (PDT)
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211026071241.74889-1-agraf@csgraf.de>
 <13a13852-4fb4-a0f8-6740-354c8054aed1@linaro.org>
 <CAFEAcA857EzUCNRkZ-iRJFd26c7HZnVpw5hyyVOgUiwT788qBw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be19f32c-c19c-44c2-1f67-de7c89bb6f80@linaro.org>
Date: Mon, 1 Nov 2021 14:04:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA857EzUCNRkZ-iRJFd26c7HZnVpw5hyyVOgUiwT788qBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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

On 11/1/21 1:55 PM, Peter Maydell wrote:
> On Tue, 26 Oct 2021 at 17:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/26/21 12:12 AM, Alexander Graf wrote:
>>> +        if (cm) {
>>> +            /* We don't cache MMIO regions */
>>> +            advance_pc = true;
>>> +            break;
>>> +        }
>>> +
>>>            assert(isv);
>>
>> The assert should come first.  If the "iss valid" bit is not set, then nothing else in the
>> word is defined.
> 
> No, ISV only indicates that ISS[23:14] is valid; ISS[13:0] (including CM)
> are valid regardless. (The distinction is that the bits which might or
> might not be valid are the ones which encode information about the insn
> necessary to possibly emulate it, like the data access size and the
> source/destination register; the always-present ones are the ones that
> have always been reported for data aborts -- AArch32 DFSR has a CM bit,
> for instance.)

Thanks, that clears up some of my confusion here and a bit further downthread.


r~

