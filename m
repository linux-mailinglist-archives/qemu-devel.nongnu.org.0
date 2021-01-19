Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26B2FC41D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 23:52:18 +0100 (CET)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1zrF-00056l-Ho
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 17:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1zpq-0004IL-Bw
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:50:50 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1zpo-0001U2-Hu
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:50:49 -0500
Received: by mail-pj1-x102b.google.com with SMTP id l23so891362pjg.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 14:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bokjRvRPOPXhyVgTYhgJC+HrGfCVABhSG5yGYQoe2EQ=;
 b=w/e1hI2cJxfTeKKHlcZNwU4DXvrFHKxvwM7D6Hw9Jjh7jFM0U8POWLM366MrjAUUlk
 3iVyVWJGxS4Akc7OXEsMXZ1Ci6ch8xlo+fTeTR3wfP4kVolGHVOyT2pQ3lw1uyw1jI6X
 8IjWNwISbcn6963k8q1iNxse8kywp/AHKkyty0op/q7dgAD75CEnOsfKRvUkBf3n5wrV
 xSzSXwoxtqcVRKXI2KK9aYsBr/gAbxqAoVQbfUBzKKCASPsf/in9POVQlljvxf6pBzxI
 zmvte/Ylp49+SPi5TOMH4l19yogf1NwlQJAdKHn5Rhqij9bvwCf+v2p3AcfxcYIHhAGM
 PxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bokjRvRPOPXhyVgTYhgJC+HrGfCVABhSG5yGYQoe2EQ=;
 b=pSZFfZBc1drtFOQFBA58yj4tQeG1H5pXnStj/TpfqdpkpvNca/DctUKp6HAXEGG/x0
 O7aWFURyZK7t0CknlB1HT2AXTlFiFTUZ92uFW7zBY4nXbTUiXQ+ryab7tfqEl/E4jIIb
 BWmnghrY6L80eRRpkNDdwUWQ6VsIf99qKlePttFJaa9QFtX/8VjzjzX0nOIKkdajuQAu
 /5JcGw0rVzX6F2rtF48+Ha1Dv3HNKzcxvo4vHsSPzufAsWldHo8aatUR3VPiWZRIRodq
 /r6+OSVBraHa9k1Xr6Y+XfEIPtKvbQlO9l97NR5sz70Iw8hTs/zISq+uk/T7Uu2wHGz1
 pY0A==
X-Gm-Message-State: AOAM532r2NUlq7T+I28Zf5E7/Be/1nTyhf0WRVl1ntswfHyv3jLDVVyW
 k8vRN1hYSn7J4NCZQWU5gSWXMwhBdpy+Dg==
X-Google-Smtp-Source: ABdhPJxwQ25k8hHKqG7opfekdTeUoIPB0yftRuStjpDzI0+TG5Img6yRieMvQBaZnY+YcmpunjFGaA==
X-Received: by 2002:a17:902:7001:b029:da:bbb6:c7e2 with SMTP id
 y1-20020a1709027001b02900dabbb6c7e2mr7118914plk.50.1611096646705; 
 Tue, 19 Jan 2021 14:50:46 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id r5sm27161pjo.49.2021.01.19.14.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 14:50:45 -0800 (PST)
Subject: Re: [PATCH v2 08/22] tcg/mips: Split out target constraints to
 tcg-target-con-str.h
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-9-richard.henderson@linaro.org>
 <CAFEAcA8AfTABU67Z04urM_7JALD8kYVmWYEeP=Q=NRfwq=1xZg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd252307-68c3-b50b-b326-72afb5defd1d@linaro.org>
Date: Tue, 19 Jan 2021 12:50:42 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8AfTABU67Z04urM_7JALD8kYVmWYEeP=Q=NRfwq=1xZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 4:50 AM, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 21:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/mips/tcg-target-con-str.h | 24 ++++++++++++
>>  tcg/mips/tcg-target.h         |  1 +
>>  tcg/mips/tcg-target.c.inc     | 72 ++++++++---------------------------
>>  3 files changed, 41 insertions(+), 56 deletions(-)
>>  create mode 100644 tcg/mips/tcg-target-con-str.h
> 
>> -    case 'Z':
>> -        /* We are cheating a bit here, using the fact that the register
>> -           ZERO is also the register number 0. Hence there is no need
>> -           to check for const_args in each instruction. */
>> -        ct->ct |= TCG_CT_CONST_ZERO;
> 
> This comment seems like it's worth retaining somewhere.

I moved it to the start of tcg_out_op, which is where we do the operand
checking, and therefore perhaps more usefully placed.


r~

