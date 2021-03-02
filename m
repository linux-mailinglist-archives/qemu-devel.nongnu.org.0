Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848332AC62
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:49:56 +0100 (CET)
Received: from localhost ([::1]:33508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCtv-0002kl-Gi
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:49:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHCr1-0001Ed-EE
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:46:55 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHCqz-000833-0B
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:46:55 -0500
Received: by mail-pf1-x433.google.com with SMTP id 201so14706304pfw.5
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 13:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=74hUWkBdl/Y+i0+FcmCUJjnAS4zDT9zxrR/V5NLfOjg=;
 b=OWn0qtzqbZPoxs6fyM31lXQ55S9iaytX1HZqGQIUKqrgn6/hv+iYSzJb9zu16UhWBd
 0rGel7cjfxQqYOXBgOOkyqU35D4440CNttu6RB4LN3ZPjQt2lCHKDmCdos4dvhh3KjSX
 bqa/ycWRgd+nUfeKzPy+CgU0NUzsjMJH/YoV24zCzGpJlVQUtsc2KfLshWA+oXvg9d+3
 qJeYeNU2qssDH2zNUg3rITNqQgJwDp85LRpMCSrv8SKWSkPLAjPUUKQBtRDB0Qroi41m
 4oi63M3+bIXyna2p2VeYaeBUiYWFr7ikBKLhmNKjgsJNrk+PPpehti5ckJVFaypdQqcR
 7lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=74hUWkBdl/Y+i0+FcmCUJjnAS4zDT9zxrR/V5NLfOjg=;
 b=oLyaqG8QGFzht35uOk/1L9vuszwEHlzx0qATgWGQYKuyPIaiU0FKIYI2yZrk3hNYyF
 CtK1BB1MYqjN1I/rigtF4PlSSz65fz14As+24zKlk3pYw39k2NAB200mWKBmTnDYayGV
 uM11MN8DcdcMzNk5GUf8xZ+INNxgR6GqNZydIERupplPIzILXbuAcR2Vvn8jLTOhpaXo
 +J/Cz2IRxS4RETsZLX08r3aMk0H5l7uxZAUvBJn6IbinstrqPZTa54Yt0c8/6p4ZbK5c
 fhR9HMWvahoiW2TPZdO4uecRxq3izLy2ASokt8yJJkvDB0qQM7eoiKWmIUdBn/pUvh+m
 PEzg==
X-Gm-Message-State: AOAM531vJlZxeP96k7O+6Q7gJFDndysc/oH1rYhM2h6swwKuWUS6DJIi
 IufpmkwSYvIdpGNnzVXsxpR8Zw==
X-Google-Smtp-Source: ABdhPJxWyI5IJMjw28unjvaR2Qphs/7Gr0yP4rH02/7KvH/m+lTX+bNY4InX5OtTuKsF11VqEyiecQ==
X-Received: by 2002:aa7:96a4:0:b029:1ed:94a3:2cf5 with SMTP id
 g4-20020aa796a40000b02901ed94a32cf5mr124391pfk.68.1614721611424; 
 Tue, 02 Mar 2021 13:46:51 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id k8sm4316431pjj.31.2021.03.02.13.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 13:46:51 -0800 (PST)
Subject: Re: [PATCH] target/s390x: Implement the MVPG condition-code-option bit
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20210302191224.380963-1-thuth@redhat.com>
 <f48a59bb-b981-dd77-54cb-f4a0826b0418@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e71f6b5e-ff83-ee5d-8dcf-446c2c1a165e@linaro.org>
Date: Tue, 2 Mar 2021 13:46:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f48a59bb-b981-dd77-54cb-f4a0826b0418@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 11:25 AM, David Hildenbrand wrote:
> On 02.03.21 20:12, Thomas Huth wrote:
>> If the CCO bit is set, MVPG should not generate an exception
>> but report page translation faults via a CC code, so we have
>> to check the translation in this case before calling the
>> access_prepare() function.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   This patch is required to get Claudio's new kvm-unit-tests patches
>>   working with TCG: https://www.spinics.net/lists/kvm/msg236784.html
>>
>>   target/s390x/cpu.h         | 14 ++++++++++++++
>>   target/s390x/excp_helper.c | 14 --------------
>>   target/s390x/mem_helper.c  | 23 ++++++++++++++++++++++-
>>   3 files changed, 36 insertions(+), 15 deletions(-)
>>
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 60d434d5ed..731e2c6452 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -366,6 +366,20 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool 
>> ifetch)
>>   #endif
>>   }
>> +static inline uint64_t cpu_mmu_idx_to_asc(int mmu_idx)
>> +{
>> +    switch (mmu_idx) {
>> +    case MMU_PRIMARY_IDX:
>> +        return PSW_ASC_PRIMARY;
>> +    case MMU_SECONDARY_IDX:
>> +        return PSW_ASC_SECONDARY;
>> +    case MMU_HOME_IDX:
>> +        return PSW_ASC_HOME;
>> +    default:
>> +        abort();
>> +    }
>> +}
>> +
>>   static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
>>                                           target_ulong *cs_base, uint32_t 
>> *flags)
>>   {
>> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
>> index ce16af394b..44bff27f8f 100644
>> --- a/target/s390x/excp_helper.c
>> +++ b/target/s390x/excp_helper.c
>> @@ -105,20 +105,6 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int 
>> size,
>>   #else /* !CONFIG_USER_ONLY */
>> -static inline uint64_t cpu_mmu_idx_to_asc(int mmu_idx)
>> -{
>> -    switch (mmu_idx) {
>> -    case MMU_PRIMARY_IDX:
>> -        return PSW_ASC_PRIMARY;
>> -    case MMU_SECONDARY_IDX:
>> -        return PSW_ASC_SECONDARY;
>> -    case MMU_HOME_IDX:
>> -        return PSW_ASC_HOME;
>> -    default:
>> -        abort();
>> -    }
>> -}
>> -
>>   bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>                          MMUAccessType access_type, int mmu_idx,
>>                          bool probe, uintptr_t retaddr)
>> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
>> index 25cfede806..c7037adf2c 100644
>> --- a/target/s390x/mem_helper.c
>> +++ b/target/s390x/mem_helper.c
>> @@ -855,10 +855,31 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, 
>> uint64_t r1, uint64_t r2)
>>       r1 = wrap_address(env, r1 & TARGET_PAGE_MASK);
>>       r2 = wrap_address(env, r2 & TARGET_PAGE_MASK);
>> +    /*
>> +     * If the condition-code-option (CCO) bit is set and DAT is enabled,
>> +     * we have to check for page table translation faults first:
>> +     */
>> +#ifndef CONFIG_USER_ONLY
>> +    if (extract64(r0, 8, 1) && mmu_idx != MMU_REAL_IDX) {
>> +        uint64_t asc = cpu_mmu_idx_to_asc(mmu_idx);
>> +        uint64_t raddr, tec;
>> +        int flags, exc;
>> +
>> +        exc = mmu_translate(env, r2, MMU_DATA_LOAD, asc, &raddr, &flags, &tec);
>> +        if (exc) {
>> +            return 2;
>> +        }
>> +
>> +        exc = mmu_translate(env, r1, MMU_DATA_STORE, asc, &raddr, &flags, 
>> &tec);
>> +        if (exc && exc != PGM_PROTECTION) {
>> +            return 1;
>> +        }
>> +    }
>> +#endif
>> +
> 
> This way you always need two additional translations and don't even check if we 
> have something in the TLB. While this works, it's quite inefficient.
> 
> Using probe_access_flags() we can actually lookup the tlb/fill the tlb but get 
> an error instead of a fault. We could e.g., extent probe_access() to allow 
> specifying whether we want a fault or not.

I think probe_access_flags() will do all that you need; no further extension to 
probe_access() required.  I presume you meant access_prepare() is what you 
meant to extend?


r~

