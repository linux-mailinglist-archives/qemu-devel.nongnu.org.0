Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6161421C5ED
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jul 2020 21:27:12 +0200 (CEST)
Received: from localhost ([::1]:51828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juL9T-0007Dz-6w
	for lists+qemu-devel@lfdr.de; Sat, 11 Jul 2020 15:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1juL8k-0006il-MN
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 15:26:26 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:53596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1juL8i-0005DE-Tc
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 15:26:26 -0400
Received: by mail-pj1-x1042.google.com with SMTP id cm21so4017570pjb.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jul 2020 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ELV1gz6aQk79GXpizeiqgDsyWHiirmL7xY5jfjzqePA=;
 b=Bu2z4BoNYBhMYrxcwOPo14yHCurpeS6rXBYfPYBGAxzr8cTd6I3BUw63MMhLqnQMv/
 T3SsPczJuQJaZQSO3nfFo9b6KgQjsffudmfAs+GqLLWx9HWMCLkWX3M4JNXWYIOobVox
 ms39KVOHw2C+i5ui1AaUhEfEhO509EKz0eqS8wY3ZF6skWvcPQvKCypB/7wFaHDU733g
 0GKFwKoenntWdHCDD0HfGhbZTxtninBj6UU5v11YWSJFnKAHQg5WftQzxcrGuelndshA
 7WSGYnJAnSn0UGn4fmOgB55A9ymb37gYIEfcBrK/atDRBMEl5qB3/PXW1KclpeMezjl4
 vrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ELV1gz6aQk79GXpizeiqgDsyWHiirmL7xY5jfjzqePA=;
 b=bOSSh4kQsraW92fCCdCFCBDuFsSLKkEOlFlFz/DAqYEq3JuPz5ZTtxtZ+GZ7rtKfCl
 qph6tDeiiZa+7FhW1yPot9Vp67Z4Xlo9aANlojTv8LkkqdjJEN0HfR3FKlQnQXXW7M6O
 ovg9C4x/M4hM/fU6IifPKGdCxQQvtD4hS31QwnLpiv2jU3y/MlAU1QChpAR4BVkicbon
 orYQ57jkLeh7uvyGgqwIxhWKVFTchrSvKISUxPyrkPEjEKnwA9oPzBYqpTv+bvy5kF81
 WwOf8CefgpBwqPCqGL7lLXU4BAVQplELO2oKOvMDQZMf7DBtMdcK+4Wrp+2LJR+KuJHB
 pj/w==
X-Gm-Message-State: AOAM533FsQ+UtyL9FonRTocgVf+bxdX2WbEAxXqlSofF8Z8ZlzxVKnLt
 MpwGs6fy0h/T6zsJcAxpbrIYXA==
X-Google-Smtp-Source: ABdhPJz9TtEHGJqQL44rYGUpEFMIgnxSI1q/wd9k+2FQ0mZc/Z369WNXhK9EAb1ngNJXK5wjL+vEaw==
X-Received: by 2002:a17:90a:7487:: with SMTP id
 p7mr11992578pjk.233.1594495582794; 
 Sat, 11 Jul 2020 12:26:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o18sm11004030pfu.138.2020.07.11.12.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jul 2020 12:26:22 -0700 (PDT)
Subject: Re: [PATCH v2 07/17] linux-user: Fix guest_addr_valid vs reserved_va
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-8-richard.henderson@linaro.org>
 <CAFEAcA97vFoBSwmFkD6bpObD9P6W8J2iowKhk7mT32+xjte-4w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5230c3dd-6294-3de6-fea9-416f3dc84cba@linaro.org>
Date: Sat, 11 Jul 2020 12:26:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97vFoBSwmFkD6bpObD9P6W8J2iowKhk7mT32+xjte-4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/20 9:37 AM, Peter Maydell wrote:
> On Fri, 5 Jun 2020 at 05:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
>> use -R <reserved_va> to restrict the memory address of the guest.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/exec/cpu_ldst.h | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> Doesn't this run into trouble with the arm32 commpage?
> The reserved_va is set there to 0xffff0000 (stopping
> at the commpage), but the addresses within the commpage
> themselves are still valid guest addresses.

Not really.  The commpage is Special, and gets allocated differently.  Normal
binaries work, e.g. our standard busybox ls.

I would imagine the corner case that doesn't work is that you couldn't issue a
syscall to the commpage, e.g.

    write(1, 0xfffff000, 1);

because the commpage is now outside the normal address space.

But given that it only matters with an explicit -R command-line option, this
falls into the Well Don't Do That Then category. This is a generic option, and
works as expected with other 32-bit guests.


r~

