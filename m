Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8F93E25A6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 10:21:28 +0200 (CEST)
Received: from localhost ([::1]:40744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBv6d-0007Wo-9l
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 04:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBv5O-0006YO-L3
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:20:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBv5M-0006xf-EE
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628238006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIk6/hCevTgZBsRoHMt9ThS0PzJudmIZPcaH/oQo/+4=;
 b=hAnpGFR36Q2IsYyGg6vZN2Ziubm5esgTkqQsSTWZerP0Oo7fPtdRS5rOywdAC7Zusj0Wks
 lsZgMYfrgPr72Qzs2xQIV/UW5t6fUa3d4kg4GgC0WxRgM3uf/Yh7xKZhHJeA1wuPhBRkZQ
 u1g9CLE3u82+8xwGIyXdw+n5+CLkoQU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-otbtF-ehM-aQ_s97lPiRag-1; Fri, 06 Aug 2021 04:20:05 -0400
X-MC-Unique: otbtF-ehM-aQ_s97lPiRag-1
Received: by mail-wr1-f69.google.com with SMTP id
 l12-20020a5d6d8c0000b029015488313d96so2898296wrs.15
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 01:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FIk6/hCevTgZBsRoHMt9ThS0PzJudmIZPcaH/oQo/+4=;
 b=tgnJU3IillPCvP30/Bf434DZcoYxHMyq7Kkkw7namVHWPeI8QMywvO1am73IwoOpIh
 2Oe2FnAwGlTlCLUwfwkIoYPG+NP4JK6ty7j348xnnclpUJHiEGnE0+0pnuMkFdl1EyZn
 BbMkCTEzwzBqjL2Dxom50fZjCIxCmq/7L0K77sIKAer7lh4647QIircAWFjzV1Xd8Em4
 9oac4zgJh6AuE7yfYj7p1D2DTrg1ZiWN9qnQeBDhyxWcAsskvb/+vlfpanVUMO+TgJNY
 WW8w2f7qapvubDUOyCZKqBySdcBIO5CQW3AHINvmwT1Ldyxncb1ccY/5deQnPpEWg1FF
 zG9A==
X-Gm-Message-State: AOAM532JUtZxkgRkr72xAQ/L1ks6VbB1DNW1k37r81Us0KWY/mQW+x8g
 NvijcKXjN5UfvWNx8Bj6uHp4ICoNxpk3rA4p38yHDEiLBPrA80aXko9HSUWkAKOpuj5+F+INuKC
 5bJSfpRG7pq/rbUo=
X-Received: by 2002:adf:9e01:: with SMTP id u1mr9486079wre.12.1628238004485;
 Fri, 06 Aug 2021 01:20:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXKk01j6B7Jl/AAU1h+VFAr++lkATZzzhRGFSuaGGzsT5G8c4gzHEprsM9igEXh505AHK0lw==
X-Received: by 2002:adf:9e01:: with SMTP id u1mr9486054wre.12.1628238004248;
 Fri, 06 Aug 2021 01:20:04 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id o28sm8981895wra.71.2021.08.06.01.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:20:03 -0700 (PDT)
Subject: Re: [PATCH v1 07/12] s390x/mmu_helper: move address validation into
 mmu_translate*()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-8-david@redhat.com>
 <6616c45b-7d5a-3a8f-20fb-0c17113e49b1@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <debc6b3f-6965-fb69-5bcb-8f4420274dbe@redhat.com>
Date: Fri, 6 Aug 2021 10:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6616c45b-7d5a-3a8f-20fb-0c17113e49b1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 10:18, Thomas Huth wrote:
> On 05/08/2021 17.27, David Hildenbrand wrote:
>> Let's move address validation into mmu_translate() and
>> mmu_translate_real(). This allows for checking whether an absolute
>> address is valid before looking up the storage key. We can now get rid of
>> the ram_size check.
>>
>> Interestingly, we're already handling LOAD REAL ADDRESS wrong, because
>> a) We're not supposed to touch storage keys
>> b) We're not supposed to convert to an absolute address
>>
>> Let's use a fake, negative MMUAccessType to teach mmu_translate() to
>> fix that handling and to not perform address validation.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>    target/s390x/mmu_helper.c      | 36 ++++++++++++++++++++--------------
>>    target/s390x/tcg/excp_helper.c | 13 ------------
>>    target/s390x/tcg/mem_helper.c  |  2 +-
>>    3 files changed, 22 insertions(+), 29 deletions(-)
>>
>> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
>> index ca25dadb5b..36ab4e9c81 100644
>> --- a/target/s390x/mmu_helper.c
>> +++ b/target/s390x/mmu_helper.c
>> @@ -301,14 +301,13 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
>>    {
>>        static S390SKeysClass *skeyclass;
>>        static S390SKeysState *ss;
>> -    MachineState *ms = MACHINE(qdev_get_machine());
>>        uint8_t key;
>>        int rc;
>>    
>> -    if (unlikely(addr >= ms->ram_size)) {
>> -        return;
>> -    }
>> -
>> +    /*
>> +     * We excpect to be called with an absolute address that has already been
>> +     * validated, such that we can reliably use it to lookup the storage key.
>> +     */
>>        if (unlikely(!ss)) {
>>            ss = s390_get_skeys_device();
>>            skeyclass = S390_SKEYS_GET_CLASS(ss);
>> @@ -370,7 +369,7 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
>>    /**
>>     * Translate a virtual (logical) address into a physical (absolute) address.
>>     * @param vaddr  the virtual address
>> - * @param rw     0 = read, 1 = write, 2 = code fetch
>> + * @param rw     0 = read, 1 = write, 2 = code fetch, < 0 = load real address
>>     * @param asc    address space control (one of the PSW_ASC_* modes)
>>     * @param raddr  the translated address is stored to this pointer
>>     * @param flags  the PAGE_READ/WRITE/EXEC flags are stored to this pointer
>> @@ -449,10 +448,17 @@ int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
>>        }
>>    
>>    nodat:
>> -    /* Convert real address -> absolute address */
>> -    *raddr = mmu_real2abs(env, *raddr);
>> +    if (rw >= 0) {
>> +        /* Convert real address -> absolute address */
>> +        *raddr = mmu_real2abs(env, *raddr);
>>    
>> -    mmu_handle_skey(*raddr, rw, flags);
>> +        if (!mmu_absolute_addr_valid(*raddr, rw == MMU_DATA_STORE)) {
>> +            *tec = 0; /* unused */
>> +            return PGM_ADDRESSING;
>> +        }
>> +
>> +        mmu_handle_skey(*raddr, rw, flags);
>> +    }
>>        return 0;
>>    }
>>    
>> @@ -473,12 +479,6 @@ static int translate_pages(S390CPU *cpu, vaddr addr, int nr_pages,
>>            if (ret) {
>>                return ret;
>>            }
>> -        if (!address_space_access_valid(&address_space_memory, pages[i],
>> -                                        TARGET_PAGE_SIZE, is_write,
>> -                                        MEMTXATTRS_UNSPECIFIED)) {
>> -            *tec = 0; /* unused */
>> -            return PGM_ADDRESSING;
>> -        }
>>            addr += TARGET_PAGE_SIZE;
>>        }
>>    
>> @@ -588,6 +588,12 @@ int mmu_translate_real(CPUS390XState *env, target_ulong raddr, int rw,
>>    
>>        *addr = mmu_real2abs(env, raddr & TARGET_PAGE_MASK);
>>    
>> +    if (!mmu_absolute_addr_valid(*addr, rw == MMU_DATA_STORE)) {
>> +        /* unused */
>> +        *tec = 0;
>> +        return PGM_ADDRESSING;
>> +    }
>> +
>>        mmu_handle_skey(*addr, rw, flags);
>>        return 0;
>>    }
>> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
>> index a61917d04f..3d6662a53c 100644
>> --- a/target/s390x/tcg/excp_helper.c
>> +++ b/target/s390x/tcg/excp_helper.c
>> @@ -150,19 +150,6 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>            g_assert_not_reached();
>>        }
>>    
>> -    /* check out of RAM access */
>> -    if (!excp &&
>> -        !address_space_access_valid(&address_space_memory, raddr,
>> -                                    TARGET_PAGE_SIZE, access_type,
>> -                                    MEMTXATTRS_UNSPECIFIED)) {
>> -        MachineState *ms = MACHINE(qdev_get_machine());
>> -        qemu_log_mask(CPU_LOG_MMU,
>> -                      "%s: raddr %" PRIx64 " > ram_size %" PRIx64 "\n",
>> -                      __func__, (uint64_t)raddr, (uint64_t)ms->ram_size);
>> -        excp = PGM_ADDRESSING;
>> -        tec = 0; /* unused */
>> -    }
>> -
>>        env->tlb_fill_exc = excp;
>>        env->tlb_fill_tec = tec;
>>    
>> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
>> index a84795cfa3..9c1b9c7d06 100644
>> --- a/target/s390x/tcg/mem_helper.c
>> +++ b/target/s390x/tcg/mem_helper.c
>> @@ -2456,7 +2456,7 @@ uint64_t HELPER(lra)(CPUS390XState *env, uint64_t addr)
>>            tcg_s390_program_interrupt(env, PGM_SPECIAL_OP, GETPC());
>>        }
>>    
>> -    exc = mmu_translate(env, addr, 0, asc, &ret, &flags, &tec);
>> +    exc = mmu_translate(env, addr, -1, asc, &ret, &flags, &tec);
> 
> Do we maybe want a #define for this -1 instead? OTOH, you've added a proper
> comment to the function description, so that should be ok, too.

Ideally, I'd have used a completely new MMU_* type. But affecting all 
users in QEMU for one special case and having to handle it consequently 
accordingly all over the place feels wrong.

Where would you put the define?

Thanks!

> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


-- 
Thanks,

David / dhildenb


