Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A876AC0B5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:23:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAnw-0002jO-Ut; Mon, 06 Mar 2023 08:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAnd-0002ds-OU
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:22:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAnb-0005j9-NC
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678108962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6PmDGEeWlP1VEygLox0yxTIIiZl4B5zOhd7vtPDpXo4=;
 b=AZv1BWx24bgRVQspmQqEAbictFMIwhmPuA89t89ao9yUnzv+iyEEgooanfVAXLmvr+aDMS
 7SBvxMnwvvziuClSneODOXxuNXnSVawFYT9HjzQ78YbtF3gnwtc+s1F8EH+lmFQawqjOG4
 Wm8MhTPJlrSdfoOVqP9dv/Jc31MVeyE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-yUEFasmYP4eN6ChQm-vspA-1; Mon, 06 Mar 2023 08:22:41 -0500
X-MC-Unique: yUEFasmYP4eN6ChQm-vspA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso6740624wms.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678108960;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6PmDGEeWlP1VEygLox0yxTIIiZl4B5zOhd7vtPDpXo4=;
 b=MNczfBxfSvt0jowMJWTklE8glMcEpt5li1u1l/ipxotfpiQGGdiyXAT6EGeWnObq2k
 jQxDKAbOAbgXaGrobv+84PjtI/C5FJf7ePTlHhoe3C7ZSP5EpDVGltqDABdXcvhNW782
 y8blr+TQmfdbskjJ6yk2ZdvYHpu4dGgouIjEv+EFp67LDD9mV12L9q8FQH9eL/f/7lHH
 /t8d67C52MG0vCAd+zYbwW5ATIk61jyIhcQftcY+/MwNJM39i7dzbPqT9RU80t6FyIyR
 HrR3lwQ3HH7qQKZcI7+ShlMzXOi1xgvafHW2QDpcH/XaQGKmq6jOqnVpfrYNDsSK2ums
 DHxA==
X-Gm-Message-State: AO0yUKW2mtnC4T35mZj4tQfGOgOa9BnAEKB3zamENUMM/oySsdyDFO3+
 Dki1F1/1ARFL0C/azEI5J4ByRS7labC2DasrOfsxI4CRPLOQ8IS1EQymf+BARNwgwEy9CraewFJ
 3RIXMB+NZGKkoEM0=
X-Received: by 2002:a05:600c:54d0:b0:3eb:29fe:7baa with SMTP id
 iw16-20020a05600c54d000b003eb29fe7baamr8674989wmb.34.1678108960292; 
 Mon, 06 Mar 2023 05:22:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/T5nCv4Ag7u0po55TiQ/VXBdMpS5NZ0FHk6neX0CmSVQu8IsweUzCSEwv7Do5OzYfCpJjh2A==
X-Received: by 2002:a05:600c:54d0:b0:3eb:29fe:7baa with SMTP id
 iw16-20020a05600c54d000b003eb29fe7baamr8674971wmb.34.1678108959872; 
 Mon, 06 Mar 2023 05:22:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a7bc388000000b003eb2e685c7dsm13923310wmj.9.2023.03.06.05.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:22:39 -0800 (PST)
Message-ID: <d43c7458-eaa4-ae9f-98e0-b9ccb6136ae4@redhat.com>
Date: Mon, 6 Mar 2023 14:22:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/8] qatomic: add smp_mb__before/after_rmw()
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-2-pbonzini@redhat.com>
 <8afce346-bf53-bc16-7720-41f369c1c496@redhat.com>
Organization: Red Hat
In-Reply-To: <8afce346-bf53-bc16-7720-41f369c1c496@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06.03.23 14:21, David Hildenbrand wrote:
> On 03.03.23 18:19, Paolo Bonzini wrote:
>> On ARM, seqcst loads and stores (which QEMU does not use) are compiled
>> respectively as LDAR and STLR instructions.  Even though STLR is also
>> used for store-release operations, STLR followed by LDAR provides
>> store-against-load ordering, which is stronger than a store-release.
>> Compare this to ARMv7, where store-release is DMB+STR and store-seqcst
>> is DMB+STR+DMB.
>>
>> This means that on ARM a sequence of
>>
>>     qatomic_store_release(&y, ...);         // STLR
>>     a = qatomic_load_acquire(&x);           // LDAR
>>
>> provides stronger ordering at the processor level than the two MOV
>> instructions you'd get on x86.
>>
>> Likewise, on ARM sequentially consistent read-modify-write operations only
>> need to use LDAXR and STLXR respectively for the load and the store, which
>> is weaker than the LOCK prefix used on x86.
>>
>> In a strange twist of events, however, the _stronger_ semantics
>> of the ARM instructions can end up causing bugs on ARM, not on x86.
>> The problems occur when seqcst atomics are mixed with relaxed atomics.
>>
>> QEMU's atomics try to bridge the Linux API (that most of the developers
>> are familiar with) and the C11 API, and the two have a substantial
>> difference:
>>
>> - in Linux, strongly-ordered atomics such as atomic_add_return() affect
>>     the global ordering of _all_ memory operations, including for example
>>     READ_ONCE()/WRITE_ONCE()
>>
>> - in C11, sequentially consistent atomics (except for seq-cst fences)
>>     only affect the ordering of sequentially consistent operations.
>>     In particular, since relaxed loads are done with LDR on ARM, they are
>>     not ordered against seqcst stores (which are done with STLR).
>>
>> QEMU implements high-level synchronization primitives with the idea that
>> the primitives contain the necessary memory barriers, and the callers can
>> use relaxed atomics (qatomic_read/qatomic_set) or even regular accesses.
>> This is very much incompatible with the C11 view that seqcst accesses
>> are only ordered against other seqcst accesses, and requires using seqcst
>> fences as in the following example:
>>
>>      qatomic_set(&y, 1);            qatomic_set(&x, 1);
>>      smp_mb();                      smp_mb();
>>      ... qatomic_read(&x) ...       ... qatomic_read(&y) ...
>>
>> When a qatomic_*() read-modify write operation is used instead of one
>> or both stores, developers that are more familiar with the Linux API may
>> be tempted to omit the smp_mb(), which will work on x86 but not on ARM.
>>
>> This nasty difference between Linux and C11 read-modify-write operations
>> has already caused issues in util/async.c and more are being found.
>> Provide something similar to Linux smp_mb__before/after_atomic(); this
>> has the double function of documenting clearly why there is a memory
>> barrier, and avoiding a double barrier on x86 and s390x systems.
>>
> 
> Right, just like smp_mb__before_atomic()/smp_mb__after_atomic().
> 
> 
>> The new macro can already be put to use in qatomic_mb_set().
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>    docs/devel/atomics.rst | 26 +++++++++++++++++++++-----
>>    include/qemu/atomic.h  | 17 ++++++++++++++++-
>>    2 files changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/docs/devel/atomics.rst b/docs/devel/atomics.rst
>> index 7957310071d9..898f5393c07a 100644
>> --- a/docs/devel/atomics.rst
>> +++ b/docs/devel/atomics.rst
>> @@ -27,7 +27,8 @@ provides macros that fall in three camps:
>>    
>>    - weak atomic access and manual memory barriers: ``qatomic_read()``,
>>      ``qatomic_set()``, ``smp_rmb()``, ``smp_wmb()``, ``smp_mb()``,
>> -  ``smp_mb_acquire()``, ``smp_mb_release()``, ``smp_read_barrier_depends()``;
>> +  ``smp_mb_acquire()``, ``smp_mb_release()``, ``smp_read_barrier_depends()``,
>> +  ``smp_mb__before_rmw()``, ``smp_mb__after_rmw()``;
>>    
>>    - sequentially consistent atomic access: everything else.
>>    
>> @@ -472,7 +473,7 @@ and memory barriers, and the equivalents in QEMU:
>>      sequential consistency.
>>    
>>    - in QEMU, ``qatomic_read()`` and ``qatomic_set()`` do not participate in
>> -  the total ordering enforced by sequentially-consistent operations.
>> +  the ordering enforced by read-modify-write operations.
>>      This is because QEMU uses the C11 memory model.  The following example
>>      is correct in Linux but not in QEMU:
>>    
>> @@ -488,9 +489,24 @@ and memory barriers, and the equivalents in QEMU:
>>      because the read of ``y`` can be moved (by either the processor or the
>>      compiler) before the write of ``x``.
>>    
>> -  Fixing this requires an ``smp_mb()`` memory barrier between the write
>> -  of ``x`` and the read of ``y``.  In the common case where only one thread
>> -  writes ``x``, it is also possible to write it like this:
>> +  Fixing this requires a full memory barrier between the write of ``x`` and
>> +  the read of ``y``.  QEMU provides ``smp_mb__before_rmw()`` and
>> +  ``smp_mb__after_rmw()``; they act both as an optimization,
>> +  avoiding the memory barrier on processors where it is unnecessary,
>> +  and as a clarification of this corner case of the C11 memory model:
>> +
>> +      +--------------------------------+
>> +      | QEMU (incorrect)               |
> 
> Just double-checking: shouldn't this be "QEMU (correct)" ?
> 
> Or am I confused? :)
> 

Oh, noticed Richard also pointed that out. With that fixed LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


