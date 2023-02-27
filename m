Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF106A411A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:42:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbtT-0006z6-BO; Mon, 27 Feb 2023 06:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbt1-0006iG-Cp
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:41:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbsy-0006X7-VU
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677498100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8LvHLlulYEtlkcvVmu2nyyNu/wXaOJXUueaEdOu1BbQ=;
 b=ZAzSGGgUnwF7UqaE05b+2YfRpYxTPqPfnUDWx4K+46cwCYC2x13GIgojcrGIKv5KMZaAHQ
 uGlkk2Hly4Yt0ZLyQ8qYHtZg8Uavec++z6hhMe1WY08uALL8VxcrsRpsj0i9t9D19pYpXn
 oRWLCQrpZf43hCG7wky4iZr5TR9oxFA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-lTGUAzVmP9mZs8QnrWoIiQ-1; Mon, 27 Feb 2023 06:41:38 -0500
X-MC-Unique: lTGUAzVmP9mZs8QnrWoIiQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso2288550wmi.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8LvHLlulYEtlkcvVmu2nyyNu/wXaOJXUueaEdOu1BbQ=;
 b=X1CW4w5PYibMQzi3GWGl6yqnfB025HTdH3NI6wLLlKLMVFlm7U+dUckzv9lRiglZcW
 zSz8TxEEnn2kleysCHXOuN3WFnmAZSfCgL2kw3vVLrEgqZowQmYh+t6xxjq2Qj7mE49t
 Dkaz1sFkWoAY1rLZBlkAnc/yUmWsSl4aDdHC1sK1GujPkt1cqJJRDdVzKNdjdsnzSwyM
 MO5RgZUW/DWGMyNcQ+YrVUfPri+/P4b1YBerLZpK9YyJSAACV1XC75m172N2NirfiJvB
 ikAbrUhaLn+5VmnTpP/HNKMg6jq5Is+8EdVkcxD0SwZC4bGWYSZvEJSUDODKEoEeFPyJ
 cwFQ==
X-Gm-Message-State: AO0yUKVooOVsIwZVibpcL7R5qLgOrjRqdY/Ow/d8fZERhIPxzu6e/X57
 5WyyR6nklwYwe70hAK/KHNqwDEYuvkBfr4LDPfpoElmpZ26wX0n/9zCWfHo1ESbrI03Lx6yIcql
 vIy3QYyCMaVG+qP0=
X-Received: by 2002:a05:600c:1d9d:b0:3ea:e7f6:fc2e with SMTP id
 p29-20020a05600c1d9d00b003eae7f6fc2emr9702351wms.6.1677498097851; 
 Mon, 27 Feb 2023 03:41:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+kFMhjvWwTbodaZpJ2O65Q+eNvdkKpfYwYr74Gr9ttoyuV+v03cG+xllsMg+HI0PjlY00yFw==
X-Received: by 2002:a05:600c:1d9d:b0:3ea:e7f6:fc2e with SMTP id
 p29-20020a05600c1d9d00b003eae7f6fc2emr9702340wms.6.1677498097595; 
 Mon, 27 Feb 2023 03:41:37 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 u4-20020adff884000000b002c70851bfcasm6857736wrp.28.2023.02.27.03.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:41:37 -0800 (PST)
Message-ID: <6840da18-ca5f-db7c-a60a-1f2fb45d806d@redhat.com>
Date: Mon, 27 Feb 2023 12:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 27/27] target/s390x: Enable TARGET_TB_PCREL
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
 <20230220184052.163465-28-richard.henderson@linaro.org>
 <0a437546-3b18-3a3a-6ffb-afa93a93c170@redhat.com>
In-Reply-To: <0a437546-3b18-3a3a-6ffb-afa93a93c170@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/02/2023 15.35, Thomas Huth wrote:
> On 20/02/2023 19.40, Richard Henderson wrote:
>> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/s390x/cpu-param.h     |  4 ++
>>   target/s390x/cpu.c           | 12 +++++
>>   target/s390x/tcg/translate.c | 86 +++++++++++++++++++++++-------------
>>   3 files changed, 71 insertions(+), 31 deletions(-)
>>
>> diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
>> index bf951a002e..52bb95de57 100644
>> --- a/target/s390x/cpu-param.h
>> +++ b/target/s390x/cpu-param.h
>> @@ -14,4 +14,8 @@
>>   #define TARGET_VIRT_ADDR_SPACE_BITS 64
>>   #define NB_MMU_MODES 4
>> +#ifndef CONFIG_USER_ONLY
>> +# define TARGET_TB_PCREL 1
>> +#endif
>> +
>>   #endif
>> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
>> index b10a8541ff..933ff06395 100644
>> --- a/target/s390x/cpu.c
>> +++ b/target/s390x/cpu.c
>> @@ -37,6 +37,7 @@
>>   #ifndef CONFIG_USER_ONLY
>>   #include "sysemu/reset.h"
>>   #endif
>> +#include "exec/exec-all.h"
>>   #define CR0_RESET       0xE0UL
>>   #define CR14_RESET      0xC2000000UL;
>> @@ -83,6 +84,16 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
>>       return r;
>>   }
>> +static void s390_cpu_synchronize_from_tb(CPUState *cs,
>> +                                         const TranslationBlock *tb)
>> +{
>> +    /* The program counter is always up to date with TARGET_TB_PCREL. */
>> +    if (!TARGET_TB_PCREL) {
>> +        S390CPU *cpu = S390_CPU(cs);
>> +        cpu->env.psw.addr = tb_pc(tb);
>> +    }
>> +}
> 
> FYI, this causes a build failure with --disable-tcg:
> 
>   https://gitlab.com/thuth/qemu/-/jobs/3806828645#L1885
> 
> I'll add this to fix it, no need to respin:

FYI, I've unqueued this series from my current pull request again since it's 
causing trouble with the avocado-system-centos and avocado-system-opensuse 
CI jobs ... I'll try to pin-point the failing patch later, but since the 
rest of my current queue is quite long already, I really want to get that 
big queue merged first.

  Thomas


