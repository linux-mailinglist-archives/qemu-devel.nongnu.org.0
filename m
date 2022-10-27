Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C8960F4DF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:24:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo00v-0000ZS-I7; Thu, 27 Oct 2022 06:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo00P-00009W-FV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:20:59 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo00C-00070K-MY
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:20:56 -0400
Received: by mail-pg1-x52c.google.com with SMTP id g129so882714pgc.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RLd2PdN0c/T4WNN9QpEJ1l3CuGdXyYCLJxEDrfhlsEY=;
 b=wlFsuBenuaexyacZ5y8xBuG2dnpN2nOdDLXmtXFnxrQSfjF/H1WXkOrrphXiDISZgQ
 gD5BP3Bl6KiyedG+81MJ5w7dcQYy87dmhE35oMV6SSLvJ2zEPceacYmvWeVRmnId5mO3
 FO1vriZJPyBQWOAgR1wmwYYMipV07SMj7jIh3xldd9cF/WND4w+PB0ZOpGsZ1yRq6VIP
 6apuPbwcdUlaAMXajC1pPt0iR4NS+qmrkKS/Jvr85WVQHg2vyJPyj5pUnK+iHoiSZL4N
 PU50txq4UPqSUep8JkYFLi36Ojre54eHrdrsyR6jQzcjwyoAWnPMZQZH35uGdd6aZuj9
 DxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RLd2PdN0c/T4WNN9QpEJ1l3CuGdXyYCLJxEDrfhlsEY=;
 b=1moBKBeU2+CP1Sv1l49vEEHqcTgAILsPgHRODH7PHb3CSNUKpTOrEtfouMjFsqBtRT
 icc0Rx3bHJZgJU1/JwLiOK1Qx0RSlO1433m+VmjmogA4KxvClaTgOWmu9d8H5lS2bUWT
 fxxbyY3ii/HdxhztM2IZCJTxkodo/FlLreVQXumddOHOEeu5Ilz9ieNVP4t3i29VdLh/
 TBWd78H/JJ6R/Axt6W4RCZuAf9D2aUNy3ccRIs3AgbxNJwlwTu5Sg+8m4zM7aN/2R4kD
 dViShF+h8imTT2drMaVtXmDLEi0OhG+OoJvs2HOTPoAE6cSisOdxrINL+J4RzcN0znHT
 tiRw==
X-Gm-Message-State: ACrzQf1GWu3ofqiDmGEJ6CR1Lvz+MeaygnFu+MEV3dXPns7xlFD15NCT
 PFJKq9xHDNG2XPGQrfKzQH+P+RvcyDHcCt33
X-Google-Smtp-Source: AMsMyM7N2WbZMmE3LKGMNBGN+sPRvkUXDBKUUScn+WA0yxq1195euF3r3f1Euk/Lair2gSanVY6A5w==
X-Received: by 2002:aa7:9152:0:b0:565:895b:e524 with SMTP id
 18-20020aa79152000000b00565895be524mr48481023pfi.85.1666866040958; 
 Thu, 27 Oct 2022 03:20:40 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:3a91:9408:3918:55a?
 ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 o1-20020aa79781000000b0056b6a22d6c9sm863364pfp.212.2022.10.27.03.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 03:20:39 -0700 (PDT)
Message-ID: <4df39234-6697-61b8-6c56-1bd17b4f9fa8@linaro.org>
Date: Thu, 27 Oct 2022 20:20:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 22/24] accel/tcg: Use interval tree for user-only page
 tracking
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-23-richard.henderson@linaro.org>
 <87eduu4rzo.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87eduu4rzo.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/26/22 23:36, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Finish weaning user-only away from PageDesc.
>>
>> Using an interval tree to track page permissions means that
>> we can represent very large regions efficiently.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/290
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/967
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1214
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/internal.h           |   4 +-
>>   accel/tcg/tb-maint.c           |  20 +-
>>   accel/tcg/user-exec.c          | 614 ++++++++++++++++++++++-----------
>>   tests/tcg/multiarch/test-vma.c |  22 ++
>>   4 files changed, 451 insertions(+), 209 deletions(-)
>>   create mode 100644 tests/tcg/multiarch/test-vma.c
>>
>> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
>> index 250f0daac9..c7e157d1cd 100644
>> --- a/accel/tcg/internal.h
>> +++ b/accel/tcg/internal.h
>> @@ -24,9 +24,7 @@
>>   #endif
>>   
>>   typedef struct PageDesc {
>> -#ifdef CONFIG_USER_ONLY
>> -    unsigned long flags;
>> -#else
>> +#ifndef CONFIG_USER_ONLY
>>       QemuSpin lock;
>>       /* list of TBs intersecting this ram page */
>>       uintptr_t first_tb;
>> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
>> index 14e8e47a6a..694440cb4a 100644
>> --- a/accel/tcg/tb-maint.c
>> +++ b/accel/tcg/tb-maint.c
>> @@ -68,15 +68,23 @@ static void page_flush_tb(void)
> <snip>
>>   
>>   int page_get_flags(target_ulong address)
>>   {
>> -    PageDesc *p;
>> +    PageFlagsNode *p = pageflags_find(address, address);
>>   
>> -    p = page_find(address >> TARGET_PAGE_BITS);
>> +    /*
>> +     * See util/interval-tree.c re lockless lookups: no false positives but
>> +     * there are false negatives.  If we find nothing, retry with the mmap
>> +     * lock acquired.
>> +     */
>>       if (!p) {
>> -        return 0;
>> +        if (have_mmap_lock()) {
>> +            return 0;
>> +        }
>> +        mmap_lock();
>> +        p = pageflags_find(address, address);
>> +        mmap_unlock();
>> +        if (!p) {
>> +            return 0;
>> +        }
>>       }
>>       return p->flags;
> 
> To avoid the brain twisting following locks and multiple return legs how about this:
> 
>    int page_get_flags(target_ulong address)
>    {
>        PageFlagsNode *p = pageflags_find(address, address);
> 
>        /*
>         * See util/interval-tree.c re lockless lookups: no false positives but
>         * there are false negatives.  If we had the lock and found
>         * nothing we are done, otherwise retry with the mmap lock acquired.
>         */
>        if (have_mmap_lock()) {
>            return p ? p->flags : 0;
>        }
> 
>        mmap_lock();
>        p = pageflags_find(address, address);
>        mmap_unlock();
> 
>        return p ? p->flags : 0;
>    }

I'm unwilling to put an expensive test like a function call (have_mmap_lock) before an 
inexpensive test like pointer != NULL.

I don't see what's so brain twisting about the code as is.  The lock tightly surrounds a 
single statement, with a couple of pointer tests.

>> +/*
>> + * Test very large vma allocations.
>> + * The qemu out-of-memory condition was within the mmap syscall itself.
>> + * If the syscall actually returns with MAP_FAILED, the test succeeded.
>> + */
>> +#include <sys/mman.h>
>> +
>> +int main()
>> +{
>> +    int n = sizeof(size_t) == 4 ? 32 : 45;
>> +
>> +    for (int i = 28; i < n; i++) {
>> +        size_t l = (size_t)1 << i;
>> +        void *p = mmap(0, l, PROT_NONE,
>> +                       MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
>> +        if (p == MAP_FAILED) {
>> +            break;
>> +        }
>> +        munmap(p, l);
>> +    }
>> +    return 0;
>> +}
> 
> So is the failure mode here we actually seg or bus out?

SEGV or KILL (via oom) depending on the state of the system. If the host is *really* 
beefy, it may even complete but with an unreasonable timeout.

r~

