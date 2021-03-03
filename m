Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8240132B7D7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:34:14 +0100 (CET)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQhh-0003LW-Jf
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHQgY-0002Td-FY
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:33:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHQgW-0002bZ-I7
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614774779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7r0dC6rmq5ShMk4kjDxq96wDQSZvt7T2zFiuFKHdJUo=;
 b=MHboa7iE1NDJ9YYNreaCRtQelhMTdfljqWIsdrJSRtp2x1H3G0QCn1zQ/OTnpwZAK6d1lD
 InY6FsaomcXr0Yf2RI8llWs3uyRkwP/wQzLfCpgp6g2VLYTGhVmBI1GEP1LNRA/8JtQ8/F
 hxB+h3UGRyZTiPnT3ksXt07BlD5Xtgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-pJ_RZQDCO2i4hDoB2baWTw-1; Wed, 03 Mar 2021 07:32:55 -0500
X-MC-Unique: pJ_RZQDCO2i4hDoB2baWTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ED82107ACF4;
 Wed,  3 Mar 2021 12:32:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 472025D9C2;
 Wed,  3 Mar 2021 12:32:50 +0000 (UTC)
Subject: Re: [PATCH v3] target/s390x: Implement the MVPG condition-code-option
 bit
To: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210303024423.3125722-1-richard.henderson@linaro.org>
 <82ea6a14-af12-818c-622b-4ecf06905967@redhat.com>
 <fb6b66d2-1764-174f-138b-d26b4a3bb64f@redhat.com>
 <115731a3-e128-2cbe-fd55-0a6f003eaac3@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f06832b5-8161-3663-8923-88f691443874@redhat.com>
Date: Wed, 3 Mar 2021 13:32:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <115731a3-e128-2cbe-fd55-0a6f003eaac3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2021 12.40, David Hildenbrand wrote:
> On 03.03.21 12:36, Thomas Huth wrote:
>> On 03/03/2021 07.25, Thomas Huth wrote:
>>> On 03/03/2021 03.44, Richard Henderson wrote:
>>>> If the CCO bit is set, MVPG should not generate an exception but
>>>> report page translation faults via a CC code.
>>>>
>>>> Create a new helper, access_prepare_nf, which can use probe_access_flags
>>>> in non-faulting mode, and then handle watchpoints.
>>>>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>    target/s390x/mem_helper.c | 87 ++++++++++++++++++++++++++++-----------
>>>>    1 file changed, 64 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
>>>> index 25cfede806..b397333c0b 100644
>>>> --- a/target/s390x/mem_helper.c
>>>> +++ b/target/s390x/mem_helper.c
>>>> @@ -130,28 +130,62 @@ typedef struct S390Access {
>>>>        int mmu_idx;
>>>>    } S390Access;
>>>> +static bool access_prepare_nf(S390Access *access, CPUS390XState *env,
>>>> +                              bool nofault, vaddr vaddr1, int size,
>>>> +                              MMUAccessType access_type,
>>>> +                              int mmu_idx, uintptr_t ra)
>>>> +{
>>>> +    void *haddr1, *haddr2 = NULL;
>>>> +    int size1, size2;
>>>> +    vaddr vaddr2 = 0;
>>>> +    int flags;
>>>> +
>>>> +    assert(size > 0 && size <= 4096);
>>>> +
>>>> +    size1 = MIN(size, -(vaddr1 | TARGET_PAGE_MASK)),
>>>> +    size2 = size - size1;
>>>> +
>>>> +    flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
>>>> +                               nofault, &haddr1, ra);
>>>> +    if (unlikely(size2)) {
>>>> +        /* The access crosses page boundaries. */
>>>> +        vaddr2 = wrap_address(env, vaddr1 + size1);
>>>> +        flags |= probe_access_flags(env, vaddr2, access_type, mmu_idx,
>>>> +                                    nofault, &haddr2, ra);
>>>> +    }
>>>> +
>>>> +    if (unlikely(flags & TLB_INVALID_MASK)) {
>>>> +        return false;
>>>> +    }
>>>> +    if (unlikely(flags & TLB_WATCHPOINT)) {
>>>> +        /* S390 does not presently use transaction attributes. */
>>>> +        cpu_check_watchpoint(env_cpu(env), vaddr1, size,
>>>> +                             MEMTXATTRS_UNSPECIFIED,
>>>> +                             (access_type == MMU_DATA_STORE
>>>> +                              ? BP_MEM_WRITE : BP_MEM_READ), ra);
>>>> +    }
>>>> +
>>>> +    *access = (S390Access) {
>>>> +        .vaddr1 = vaddr1,
>>>> +        .vaddr2 = vaddr2,
>>>> +        .haddr1 = haddr1,
>>>> +        .haddr2 = haddr2,
>>>> +        .size1 = size1,
>>>> +        .size2 = size2,
>>>> +        .mmu_idx = mmu_idx
>>>> +    };
>>>> +    return true;
>>>> +}
>>>> +
>>>>    static S390Access access_prepare(CPUS390XState *env, vaddr vaddr, int 
>>>> size,
>>>>                                     MMUAccessType access_type, int mmu_idx,
>>>>                                     uintptr_t ra)
>>>>    {
>>>> -    S390Access access = {
>>>> -        .vaddr1 = vaddr,
>>>> -        .size1 = MIN(size, -(vaddr | TARGET_PAGE_MASK)),
>>>> -        .mmu_idx = mmu_idx,
>>>> -    };
>>>> -
>>>> -    g_assert(size > 0 && size <= 4096);
>>>> -    access.haddr1 = probe_access(env, access.vaddr1, access.size1,
>>>> access_type,
>>>> -                                 mmu_idx, ra);
>>>> -
>>>> -    if (unlikely(access.size1 != size)) {
>>>> -        /* The access crosses page boundaries. */
>>>> -        access.vaddr2 = wrap_address(env, vaddr + access.size1);
>>>> -        access.size2 = size - access.size1;
>>>> -        access.haddr2 = probe_access(env, access.vaddr2, access.size2,
>>>> -                                     access_type, mmu_idx, ra);
>>>> -    }
>>>> -    return access;
>>>> +    S390Access ret;
>>>> +    bool ok = access_prepare_nf(&ret, env, false, vaddr, size,
>>>> +                                access_type, mmu_idx, ra);
>>>> +    assert(ok);
>>>> +    return ret;
>>>>    }
>>>>    /* Helper to handle memset on a single page. */
>>>> @@ -845,8 +879,10 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t
>>>> r0, uint64_t r1, uint64_t r2)
>>>>        const int mmu_idx = cpu_mmu_index(env, false);
>>>>        const bool f = extract64(r0, 11, 1);
>>>>        const bool s = extract64(r0, 10, 1);
>>>> +    const bool cco = extract64(r0, 8, 1);
>>>>        uintptr_t ra = GETPC();
>>>>        S390Access srca, desta;
>>>> +    bool ok;
>>>>        if ((f && s) || extract64(r0, 12, 4)) {
>>>>            tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
>>>> @@ -858,13 +894,18 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t
>>>> r0, uint64_t r1, uint64_t r2)
>>>>        /*
>>>>         * TODO:
>>>>         * - Access key handling
>>>> -     * - CC-option with surpression of page-translation exceptions
>>>>         * - Store r1/r2 register identifiers at real location 162
>>>>         */
>>>> -    srca = access_prepare(env, r2, TARGET_PAGE_SIZE, MMU_DATA_LOAD, 
>>>> mmu_idx,
>>>> -                          ra);
>>>> -    desta = access_prepare(env, r1, TARGET_PAGE_SIZE, MMU_DATA_STORE,
>>>> mmu_idx,
>>>> -                           ra);
>>>> +    ok = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
>>>> +                           MMU_DATA_LOAD, mmu_idx, ra);
>>>> +    if (!ok) {
>>>> +        return 2;
>>>> +    }
>>>> +    ok = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
>>>> +                           MMU_DATA_STORE, mmu_idx, ra);
>>>> +    if (!ok) {
>>>> +        return 1;
>>>> +    }
>>>
>>> Thanks, this looks promising, but one of the MVPG kvm-unit-tests is still
>>> failing with this patch - the one that checks for an exception if the
>>> destination page is marked as read-only. MVPG only returns CC1 for invalid
>>> page table entries - but if the page is write-protected, it still causes a
>>> protection exception. That's why I've been checking "if (exc && exc !=
>>> PGM_PROTECTION)" in my version of the patch.
>>
>> FWIW, I can get the MVPG kvm-unit-test working with your patch if I add
>> this on top:
>>
>> diff a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
>> --- a/target/s390x/mem_helper.c
>> +++ b/target/s390x/mem_helper.c
>> @@ -904,7 +904,14 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t 
>> r0, uint64_t r1, uint64_t r2)
>>        ok = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
>>                               MMU_DATA_STORE, mmu_idx, ra);
>>        if (!ok) {
>> -        return 1;
>> +        ok = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
>> +                               MMU_DATA_LOAD, mmu_idx, ra);
>> +        if (!ok) {
>> +            return 1;
>> +        }
>> +        /* If reading was ok, then the page must be protected. */
>> +        /* TODO: Set a translation exception code in lowcore? */
>> +        tcg_s390_program_interrupt(env, PGM_PROTECTION, ra);
>>        }
>>        access_memmove(env, &desta, &srca, ra);
>>        return 0; /* data moved */
>>
>> ... yeah, it's ugly to call access_prepare_nf() again with MMU_DATA_LOAD,
>> and it's still missing the translation exception code ... but at least
>> the kvm-unit-test is happy that way...
> 
> As I said, can't we store the last exception we had during tlb_fill and use 
> that in case returns access_prepare_nf() returns an error to identify the 
> actual exception?

Ah, right, thanks. That's likely the best way to do it. I just gave it a try 
and it seems to work ... I'll send out that modified versions as a v4...

  Thomas


