Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C1D38B272
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:03:44 +0200 (CEST)
Received: from localhost ([::1]:49792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkD9-00054L-Ae
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljk2O-0004eU-JP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:52:36 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:46674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljk2L-00062Q-JI
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:52:36 -0400
Received: by mail-ua1-x933.google.com with SMTP id d30so5618711uae.13
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y+BnXmK+Cpu9B3aEEmTwnlm1KlLGF8tsAZ4dGSs8m4g=;
 b=j1WTqY8mVYk5OIxmQrNm0FJZsVs/p0bC8/yewvgy0H9ysmgz/dXwKot+Ji7QjP5utg
 xGeJy96zMNRHjoc0OEtjWWhxCJbobGRxbw57HGJSua/qQfODY+t4zD0HOLDIJ1/qhDSz
 5VpC872+27GohkjnrWDryhbPirGN9u1vcnWPzTVCtUN10/wnLwH6Xe31fDW8IfnIkojq
 Q20sUGB7h4IF8S5ntj5WRR2XlAMGirX0A5Rgi7xB8JE8+70q4jq+7HPl8bFDMN6LAWrL
 t4Ptb9u3YB9FuHvF7lJR0vjUqKd32WGj0Ut95a1pjeyhAQvG80kqQ2Ln9NRwX7jeIDYO
 /Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y+BnXmK+Cpu9B3aEEmTwnlm1KlLGF8tsAZ4dGSs8m4g=;
 b=GPz1wptto7bvryU7/AUWCWVH3BqDNHL7tDGQxcE7x2ptSkXu8jajqt6q7bIm26/wlx
 uE4wQao4Cs2CsQERxevFue75mMB3RC2BHeFjtzY4KniBQrXrKlFPGHT9TU7KxIGKW5Xu
 DlX/f9TkIWg28ZHpfruMDL50aT+3OxAKbDj/Fr70GS+nwdEUTp8E+vUQlTcRVkZQHhs7
 AO6JMV0PgHOA4EhRpufkqb+hz6gWfwyAQos1MzOpz/GVB5NPDFM/kIAF1fe9d/vW731a
 rk2DRDkSNamJOqvHFdBnxHw8jv49hLPMVBYxAvUYHzXHL40BRFJbVzdVdUdKTImUIT0K
 Gdvw==
X-Gm-Message-State: AOAM530lon7Fn8Rg2/KjiwIJutlMBhZbZ5UdgE+8MmwqCdFyXEhnQvSv
 Gq3VgWQOPu/O9AVyjth+YbztWg==
X-Google-Smtp-Source: ABdhPJwIiaB7i15fs79DHDPdaJ9FcVSDi/OGuJqCPaVViUfJUV+OtaxdVKOxScHAQQm/L8cbdC9VZQ==
X-Received: by 2002:ab0:356f:: with SMTP id e15mr4689544uaa.52.1621522352392; 
 Thu, 20 May 2021 07:52:32 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i13sm539723vkp.45.2021.05.20.07.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 07:52:32 -0700 (PDT)
Subject: Re: [PATCH 24/24] target/ppc: Restrict ppc_cpu_tlb_fill to TCG
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-25-richard.henderson@linaro.org>
 <c50f336a-37bc-2d16-0c7f-87562cb017c3@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a363c75c-5b50-5119-f67b-9b860def2151@linaro.org>
Date: Thu, 20 May 2021 09:52:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c50f336a-37bc-2d16-0c7f-87562cb017c3@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x933.google.com
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 8:18 AM, Bruno Piazera Larsen wrote:
>> +#ifdef CONFIG_TCG
>>   bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
>>                         MMUAccessType access_type, int mmu_idx,
>>                         bool probe, uintptr_t retaddr)
>> @@ -2984,3 +2985,4 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
>>       raise_exception_err_ra(&cpu->env, cs->exception_index,
>>                              cpu->env.error_code, retaddr);
>>   }
>> +#endif
> 
> This patch makes it look like we would compile mmu_helper.c after all. Is that 
> it? That looks like the simplest solution (ifdef'ing away all helpers) but I 
> thought mmu_helper was supposed to have all TCG-only code relating to MMU.

Yes, we will always compile mmu_helper.c. -- it was always going to have the 
stuff for gdbstub.

It was exc_helper which I was hoping for tcg-only (but then we decided that 
ifdefs were going to be the short-term solution).


r~

