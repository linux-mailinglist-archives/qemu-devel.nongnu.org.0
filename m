Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423733DAC43
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 21:56:53 +0200 (CEST)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9C9D-00064Y-TC
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 15:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9C8G-0005OP-Fv
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:55:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9C8E-0005GY-Kc
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:55:52 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n11so4459691wmd.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 12:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rHLrVcyrJTqqqkrEEWo5zAcpMEwZDQwr57q8MR3DtkQ=;
 b=jaxU2rDYTl+RA/xE9ysu4QG2aWm+5lOJ2Mo6d0lexShvgxO9fm1UZ1xOnx1jg7Wmsu
 iE+QE33c44BQIA2k36BbgXpke3s8ZRf5/2UrmQq1MGd3JzbTJbDBRY1teiBYajQ/UPUs
 xMoxIfodmQ8yUi2ht3wns8298tcjzoPbseO6G1JyJ47PDt2qWUA61JJ3M1UYEQLot3oN
 7Xl5H0oPPxxc/tnYAoABHoxpIaz1+AcdK5PSgzA82e7cSXUrAHXCiegDlvnUKamKIkfj
 RkhGa5NHlC9+BrFNeAB+9Jq3S7r1vmBtfY2vE1aAcP/AsMwfTTvmaxTSPpP6UBSlY7bH
 5STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rHLrVcyrJTqqqkrEEWo5zAcpMEwZDQwr57q8MR3DtkQ=;
 b=P+AG4GEeAFGb0hRxlpRfM+YYFtIhv0phmyiaL6d659h/JEI9mEUid3Wfi+R6rPbz3Y
 hPqKVAVBt2W+dg17V6YtZB79tHnQkV3o5NNFWZQeJ/TdnQLwZnkBBErQjzWajhiYmtpx
 rBvA388racX7tJOF4vI+qa0E3odPyKd/d4A3IHqS6wkrIEgkbNCO+a6zfiUxamMKiFvM
 dAj3bzKLUoMmtdFC1LI2sG7lvRShfNqLxzNRLybPPDzBmTtgT5GrM2lt8/tuWAXfVAPI
 QfbhskMhAZXgFs1GfJNp6I/8b7YGaqlaA3Wf6iAmTy/tG3Ab7W+lcb9VhJimBWlsyxMD
 Oj0Q==
X-Gm-Message-State: AOAM532xaI1+6ttryVCW+ZhbEP7Ks5zVapNnsGbOJI/3y7TvE7y9ojEk
 AMi1aKncqeTo/larnuJ+3+Vp3DsjDQfmNg==
X-Google-Smtp-Source: ABdhPJycSmkxvxwSX7WQW3uAVnOGIWmqp9FuX+o/Z1+cStGRUt/gRdRF8e93tuFVL17WVVnnEFkl6g==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr122161wmi.54.1627588548126;
 Thu, 29 Jul 2021 12:55:48 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id t17sm3736404wmq.17.2021.07.29.12.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 12:55:47 -0700 (PDT)
Subject: Re: [PATCH for-6.2 17/43] accel/tcg: Report unaligned atomics for
 user-only
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-18-richard.henderson@linaro.org>
 <CAFEAcA95v3bfjO23js8sf4wCsTkqeU2f0zCp8z-6wFLr6tqFcA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dcfa2b96-720e-fcc0-b09b-396d072afa97@amsat.org>
Date: Thu, 29 Jul 2021 21:55:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA95v3bfjO23js8sf4wCsTkqeU2f0zCp8z-6wFLr6tqFcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/29/21 5:02 PM, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 02:09, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Use the newly exposed do_unaligned_access hook from atomic_mmu_lookup,
>> which has access to complete alignment info from the TCGMemOpIdx arg.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  accel/tcg/user-exec.c | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
>> index 90d1a2d327..dd77e90789 100644
>> --- a/accel/tcg/user-exec.c
>> +++ b/accel/tcg/user-exec.c
>> @@ -852,6 +852,16 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>>
>>  /* The softmmu versions of these helpers are in cputlb.c.  */
>>
>> +static void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>> +                                 MMUAccessType access_type,
>> +                                 int mmu_idx, uintptr_t ra)
>> +{
>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>> +
>> +    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, ra);
>> +    g_assert_not_reached();
>> +}
> 
> The softmmu version doesn't g_assert_not_reached(), I think
> perhaps with the intent that a CPU implementation could
> in some cases return without raising an exception to
> mean "continue with the unaligned access". We should decide
> whether we want the API to permit that, or else consistently
> have both softmmu and useronly versions be marked noreturn
> and with an assert, and we should document whichever we choose.

Agreed. I'd rather use noreturn, which exposed these bugs:
- "target/xtensa: clean up unaligned access"
https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg05890.html
- "target/nios2: Mark raise_exception() as noreturn"
https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg07001.html

