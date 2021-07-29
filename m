Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E77F3DAADA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:22:07 +0200 (CEST)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9AfQ-0008G0-EP
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9AeE-0007R7-OV
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:20:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:41804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9AeC-0007mV-O4
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:20:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id z3so6623459plg.8
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 11:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7E3T5jNd2SnukY73q1oQYJzCgufoXSk8mAVy6i77gmI=;
 b=L9a610M2n9uCfkaPG8xXn95Jg+HjGgTqVAdk8Xt0N+kx73nMVkXoNqyLvsu1dIpuJ9
 69u5C8+/feRplEPLge45VO7otzr6Fry6rPn4QomFvTchLiNVND4T+XWgNxRsmaU50ShK
 PTxWK6NxNQS1Z3z47cbkwXTwwDY/hDgq77SJLpPsXVE2QOd9TVAGRsCAGIq07yhUK9vz
 lxQwHHmxqFbSxjq1SygaizOmTNmxtS65PY/PL7LHXFUOE2S6z4rV2jr/3/eQlF5266xp
 pxrmXTXjQ263vCNkWe/Hf/UasfvWm/OoW6oFhfspXDKyuuSH6MBIUepVUclLebdm9fSO
 uIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7E3T5jNd2SnukY73q1oQYJzCgufoXSk8mAVy6i77gmI=;
 b=iLRyXtRoMj5gSSg1FJzzNeP5Um0ilhJ96/KCyR0Isxyuqckdhac9u+UcHplwRbsbCi
 Z021ih8UqGXBgDlGNbv2l4lgKBEg70GduLNa1f9nxYu7ez8JRuBMfJQ4k93g9RSVMZfE
 69nSu21DIqXMGdiDEKnk8FeEduF/7ifIkkmnESKatBviJ+AjC24qEsEbGTC76cM+5vPa
 rkqvcsuAilelZkooHm852IbkdzHPy4cJVWdFhLxYv4U4OzZ3ZiPMR376/TgV6o4AZPnU
 at4/qvD/9AeGwIqVCtyTZPA2TeOFRII9ht19aWUB1sikMBZsvHcepRzytKMkNU+bQ3qb
 aPxQ==
X-Gm-Message-State: AOAM532udf08g1J0Nut7HZg7ArKZ3Z8Pqcd9syYPo7yHy9lWBziZKzrV
 ZfTNboBiS6fWEWopSU1WsbFyQw==
X-Google-Smtp-Source: ABdhPJzU34eKXCfGVjNIGxJHZUdfpXvf9fYL4SRFztcyDnpqZEOKpIPYf0jEpk/x2M8w1kXfpqENKA==
X-Received: by 2002:aa7:9497:0:b029:2e5:6989:4f1a with SMTP id
 z23-20020aa794970000b02902e569894f1amr6337239pfk.50.1627582842824; 
 Thu, 29 Jul 2021 11:20:42 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id y15sm2517842pga.34.2021.07.29.11.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 11:20:41 -0700 (PDT)
Subject: Re: [PATCH for-6.2 15/43] target/sparc: Implement do_unaligned_access
 for user-only
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-16-richard.henderson@linaro.org>
 <68561c03-5cc0-700f-2e64-fd348fb85a78@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e43f25e-c38f-04b6-e471-cc43765318da@linaro.org>
Date: Thu, 29 Jul 2021 08:20:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <68561c03-5cc0-700f-2e64-fd348fb85a78@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 11:40 PM, Philippe Mathieu-Daudé wrote:
> On 7/29/21 2:46 AM, Richard Henderson wrote:
>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/sparc/cpu_loop.c | 11 +++++++++++
>>   target/sparc/cpu.c          |  2 +-
>>   target/sparc/ldst_helper.c  |  2 --
>>   3 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
>> index 02532f198d..612e77807e 100644
>> --- a/linux-user/sparc/cpu_loop.c
>> +++ b/linux-user/sparc/cpu_loop.c
>> @@ -272,6 +272,17 @@ void cpu_loop (CPUSPARCState *env)
>>                   queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>>               }
>>               break;
>> +        case TT_UNALIGNED:
>> +            info.si_signo = TARGET_SIGBUS;
>> +            info.si_errno = 0;
>> +            info.si_code = TARGET_BUS_ADRALN;
>> +#ifdef TARGET_SPARC64
>> +            info._sifields._sigfault._addr = env->dmmu.sfar;
>> +#else
>> +            info._sifields._sigfault._addr = env->mmuregs[4];
>> +#endif
>> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>> +            break;
>>           case EXCP_DEBUG:
>>               info.si_signo = TARGET_SIGTRAP;
>>               info.si_errno = 0;
>> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
>> index da6b30ec74..d33d41e837 100644
>> --- a/target/sparc/cpu.c
>> +++ b/target/sparc/cpu.c
>> @@ -865,11 +865,11 @@ static const struct TCGCPUOps sparc_tcg_ops = {
>>       .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
>>       .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
>>       .tlb_fill = sparc_cpu_tlb_fill,
>> +    .do_unaligned_access = sparc_cpu_do_unaligned_access,
>>   
>>   #ifndef CONFIG_USER_ONLY
>>       .do_interrupt = sparc_cpu_do_interrupt,
>>       .do_transaction_failed = sparc_cpu_do_transaction_failed,
>> -    .do_unaligned_access = sparc_cpu_do_unaligned_access,
>>   #endif /* !CONFIG_USER_ONLY */
>>   };
>>   #endif /* CONFIG_TCG */
>> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
>> index 7367b48c8b..69b812e68c 100644
>> --- a/target/sparc/ldst_helper.c
>> +++ b/target/sparc/ldst_helper.c
>> @@ -1954,7 +1954,6 @@ void sparc_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>>   }
>>   #endif
>>   
>> -#if !defined(CONFIG_USER_ONLY)
>>   void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>>                                                    MMUAccessType access_type,
>>                                                    int mmu_idx,
>> @@ -1973,4 +1972,3 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>>   
>>       cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
>>   }
>> -#endif
>>
> 
> Somewhere around this patch I get:
> 
>    SKIPPED signals on sparc64 because BROKEN awaiting sigframe clean-ups
> and vdso support
>    TEST    test-mmap (default) on sparc64
> timeout: the monitored command dumped core
> Bus error
> make[2]: *** [tests/tcg/multiarch/Makefile.target:49: run-test-mmap]
> Error 135
> make[1]: *** [tests/tcg/Makefile.qemu:102: run-guest-tests] Error 2
> make: *** [tests/Makefile.include:63: run-tcg-tests-sparc64-linux-user]

That's really surprising, since the do_unaligned_access hook is not yet used?  Oh, but 
then target/sparc/ does some of its own manual TT_UNALIGNED exceptions for some ASI 
access.  I'll have a look, but you should have been seeing a different assert for that case.


r~


