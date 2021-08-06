Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B009D3E25ED
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 10:24:57 +0200 (CEST)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBvA0-0003Te-On
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 04:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBv93-0002hm-Gr
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:23:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBv91-0001oy-Po
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628238235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vgEVwqsDi3L5k4AYaraUf8GUP6yAbJ34Tfnfcwp+X5s=;
 b=L/ANPJcPhAL/JpANbEcxaKkJD+zDumRzxif6E2XpTVoNZ/gXFxtRtC8/Ug2fQSv8h72S7B
 CUOBo8dS4gb7X7NszCtFUSQ/vAQpPj69K0uXyA9GZ/kp7SVC3yf7q0hwRjbc1IZU5swKLm
 bCfIkeQ5tgFREEPVY3B/vE3PmJf7U3k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-rYOL67foOFa7nIpdreZ4Yg-1; Fri, 06 Aug 2021 04:23:51 -0400
X-MC-Unique: rYOL67foOFa7nIpdreZ4Yg-1
Received: by mail-wr1-f71.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so2875506wrs.13
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 01:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vgEVwqsDi3L5k4AYaraUf8GUP6yAbJ34Tfnfcwp+X5s=;
 b=UEb5ObdiRKaVwRVd15uUIek9DeOBd5nb/0eKs9ZJmAVpnF+oTiCD3uhJAI8OKehEHm
 wh5JBXG4MH1cyjJoeFgOf5YzZf5MI6bwuaxasBo6sRhDZc8yuJ1TQ1W/KVwkCj76ilqb
 mMOVrptZwdPBERF52TBYARelTD12AX77Q3iRUW36Wj1puj2VKspI+0Zl4mhiHpx0EknD
 6rQaUtfGPYsn2UEC3gtaeQ5YCxyVKexeGNOqCbCOGLs7cm6k1g6TB0CasZTX/CikX5yd
 tSJ3rGZEVG/y/SReg/X3dlx5ZQNkgzSwZFNqgmCDrLqoS5M46YM9sfgH4JxQ8aHd1MpZ
 YF4A==
X-Gm-Message-State: AOAM531YEi3f6hnUbBhniO+gqgGbTpJYAxYyKLaMtFnOvxM0KxD3Ud3b
 PKaCqssBdnAyYFSSl9++jNybDT0h1/PaenODEwos14wKDmaoRK/aODxDNj709XtscQLi+W6xJf0
 H1tv//ywNcnsUnSY=
X-Received: by 2002:adf:fa11:: with SMTP id m17mr9426606wrr.150.1628238230656; 
 Fri, 06 Aug 2021 01:23:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWkDNrXmrV5gH2NAu+47jD5Kx0eQTVhJtrhogYVehQwTZP1mkXUiNarWXxDI5O3/RAEH9jaQ==
X-Received: by 2002:adf:fa11:: with SMTP id m17mr9426590wrr.150.1628238230486; 
 Fri, 06 Aug 2021 01:23:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id g198sm14097655wme.0.2021.08.06.01.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:23:50 -0700 (PDT)
Subject: Re: [PATCH v1 07/12] s390x/mmu_helper: move address validation into
 mmu_translate*()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-8-david@redhat.com>
 <6616c45b-7d5a-3a8f-20fb-0c17113e49b1@redhat.com>
 <debc6b3f-6965-fb69-5bcb-8f4420274dbe@redhat.com>
 <653d280b-98db-91d1-d21a-e6c07aacc972@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <cbf6ca90-7309-6dc4-0ff5-c10c93d9ca9a@redhat.com>
Date: Fri, 6 Aug 2021 10:23:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <653d280b-98db-91d1-d21a-e6c07aacc972@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06.08.21 10:22, Thomas Huth wrote:
> On 06/08/2021 10.20, David Hildenbrand wrote:
>> On 06.08.21 10:18, Thomas Huth wrote:
>>> On 05/08/2021 17.27, David Hildenbrand wrote:
>>>> Let's move address validation into mmu_translate() and
>>>> mmu_translate_real(). This allows for checking whether an absolute
>>>> address is valid before looking up the storage key. We can now get rid of
>>>> the ram_size check.
>>>>
>>>> Interestingly, we're already handling LOAD REAL ADDRESS wrong, because
>>>> a) We're not supposed to touch storage keys
>>>> b) We're not supposed to convert to an absolute address
>>>>
>>>> Let's use a fake, negative MMUAccessType to teach mmu_translate() to
>>>> fix that handling and to not perform address validation.
>>>>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>     target/s390x/mmu_helper.c      | 36 ++++++++++++++++++++--------------
>>>>     target/s390x/tcg/excp_helper.c | 13 ------------
>>>>     target/s390x/tcg/mem_helper.c  |  2 +-
>>>>     3 files changed, 22 insertions(+), 29 deletions(-)
>>>>
>>>> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
>>>> index ca25dadb5b..36ab4e9c81 100644
>>>> --- a/target/s390x/mmu_helper.c
>>>> +++ b/target/s390x/mmu_helper.c
>>>> @@ -301,14 +301,13 @@ static void mmu_handle_skey(target_ulong addr, int
>>>> rw, int *flags)
>>>>     {
>>>>         static S390SKeysClass *skeyclass;
>>>>         static S390SKeysState *ss;
>>>> -    MachineState *ms = MACHINE(qdev_get_machine());
>>>>         uint8_t key;
>>>>         int rc;
>>>> -    if (unlikely(addr >= ms->ram_size)) {
>>>> -        return;
>>>> -    }
>>>> -
>>>> +    /*
>>>> +     * We excpect to be called with an absolute address that has already
>>>> been
>>>> +     * validated, such that we can reliably use it to lookup the storage
>>>> key.
>>>> +     */
>>>>         if (unlikely(!ss)) {
>>>>             ss = s390_get_skeys_device();
>>>>             skeyclass = S390_SKEYS_GET_CLASS(ss);
>>>> @@ -370,7 +369,7 @@ static void mmu_handle_skey(target_ulong addr, int
>>>> rw, int *flags)
>>>>     /**
>>>>      * Translate a virtual (logical) address into a physical (absolute)
>>>> address.
>>>>      * @param vaddr  the virtual address
>>>> - * @param rw     0 = read, 1 = write, 2 = code fetch
>>>> + * @param rw     0 = read, 1 = write, 2 = code fetch, < 0 = load real
>>>> address
>>>>      * @param asc    address space control (one of the PSW_ASC_* modes)
>>>>      * @param raddr  the translated address is stored to this pointer
>>>>      * @param flags  the PAGE_READ/WRITE/EXEC flags are stored to this
>>>> pointer
>>>> @@ -449,10 +448,17 @@ int mmu_translate(CPUS390XState *env, target_ulong
>>>> vaddr, int rw, uint64_t asc,
>>>>         }
>>>>     nodat:
>>>> -    /* Convert real address -> absolute address */
>>>> -    *raddr = mmu_real2abs(env, *raddr);
>>>> +    if (rw >= 0) {
>>>> +        /* Convert real address -> absolute address */
>>>> +        *raddr = mmu_real2abs(env, *raddr);
>>>> -    mmu_handle_skey(*raddr, rw, flags);
>>>> +        if (!mmu_absolute_addr_valid(*raddr, rw == MMU_DATA_STORE)) {
>>>> +            *tec = 0; /* unused */
>>>> +            return PGM_ADDRESSING;
>>>> +        }
>>>> +
>>>> +        mmu_handle_skey(*raddr, rw, flags);
>>>> +    }
>>>>         return 0;
>>>>     }
>>>> @@ -473,12 +479,6 @@ static int translate_pages(S390CPU *cpu, vaddr addr,
>>>> int nr_pages,
>>>>             if (ret) {
>>>>                 return ret;
>>>>             }
>>>> -        if (!address_space_access_valid(&address_space_memory, pages[i],
>>>> -                                        TARGET_PAGE_SIZE, is_write,
>>>> -                                        MEMTXATTRS_UNSPECIFIED)) {
>>>> -            *tec = 0; /* unused */
>>>> -            return PGM_ADDRESSING;
>>>> -        }
>>>>             addr += TARGET_PAGE_SIZE;
>>>>         }
>>>> @@ -588,6 +588,12 @@ int mmu_translate_real(CPUS390XState *env,
>>>> target_ulong raddr, int rw,
>>>>         *addr = mmu_real2abs(env, raddr & TARGET_PAGE_MASK);
>>>> +    if (!mmu_absolute_addr_valid(*addr, rw == MMU_DATA_STORE)) {
>>>> +        /* unused */
>>>> +        *tec = 0;
>>>> +        return PGM_ADDRESSING;
>>>> +    }
>>>> +
>>>>         mmu_handle_skey(*addr, rw, flags);
>>>>         return 0;
>>>>     }
>>>> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
>>>> index a61917d04f..3d6662a53c 100644
>>>> --- a/target/s390x/tcg/excp_helper.c
>>>> +++ b/target/s390x/tcg/excp_helper.c
>>>> @@ -150,19 +150,6 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address,
>>>> int size,
>>>>             g_assert_not_reached();
>>>>         }
>>>> -    /* check out of RAM access */
>>>> -    if (!excp &&
>>>> -        !address_space_access_valid(&address_space_memory, raddr,
>>>> -                                    TARGET_PAGE_SIZE, access_type,
>>>> -                                    MEMTXATTRS_UNSPECIFIED)) {
>>>> -        MachineState *ms = MACHINE(qdev_get_machine());
>>>> -        qemu_log_mask(CPU_LOG_MMU,
>>>> -                      "%s: raddr %" PRIx64 " > ram_size %" PRIx64 "\n",
>>>> -                      __func__, (uint64_t)raddr, (uint64_t)ms->ram_size);
>>>> -        excp = PGM_ADDRESSING;
>>>> -        tec = 0; /* unused */
>>>> -    }
>>>> -
>>>>         env->tlb_fill_exc = excp;
>>>>         env->tlb_fill_tec = tec;
>>>> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
>>>> index a84795cfa3..9c1b9c7d06 100644
>>>> --- a/target/s390x/tcg/mem_helper.c
>>>> +++ b/target/s390x/tcg/mem_helper.c
>>>> @@ -2456,7 +2456,7 @@ uint64_t HELPER(lra)(CPUS390XState *env, uint64_t
>>>> addr)
>>>>             tcg_s390_program_interrupt(env, PGM_SPECIAL_OP, GETPC());
>>>>         }
>>>> -    exc = mmu_translate(env, addr, 0, asc, &ret, &flags, &tec);
>>>> +    exc = mmu_translate(env, addr, -1, asc, &ret, &flags, &tec);
>>>
>>> Do we maybe want a #define for this -1 instead? OTOH, you've added a proper
>>> comment to the function description, so that should be ok, too.
>>
>> Ideally, I'd have used a completely new MMU_* type. But affecting all users
>> in QEMU for one special case and having to handle it consequently
>> accordingly all over the place feels wrong.
>>
>> Where would you put the define?
> 
> I agree that this should not go into the common header ... so maybe into
> s390x-internal.h ?

Maybe calling it MMU_S390_LRA ?


-- 
Thanks,

David / dhildenb


